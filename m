Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6F7C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 10:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TVJxN2n1YVTzR1GKUgzX4QElD/moy8xvaPxatGb0gCM=; b=jkQ5hkrnhean2atekM7gY1DKqM
	4VXlE+VEysF9w/kTja6QhobFx6KN+hm5dU9tlHWT29om0qOjfVJMEIxLNqGgmYoY7oMQuSrqGqR10
	ZEPlAhKfqX5dWjmLUaC7ChDd3NakhkJ1m0MZP1AqqeajObvxzUTnLLWd7mgGKxzNuhiU0f4zrhcVL
	lfXf6VPjRLFRwn2V+nQaSF5fbk2q9ZD2DoDg8TTu8Dehk8zfrqzIf+0uRUtTPk0jnHSRamo7LpQ+E
	8FXw/gMWilIX/vfc3U/amn3Rkq0593U7wUE+hDJFBiVBdQyIzl00tSvjWDxP7ZyqnuWXRQAd805wo
	4GdU+atA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uciLP-0000000CImR-0xSe;
	Fri, 18 Jul 2025 10:29:35 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uchi7-0000000CEHL-3cky
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 09:49:01 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bk4hh0HRnz6M4gR;
	Fri, 18 Jul 2025 17:47:32 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 41E581402F6;
	Fri, 18 Jul 2025 17:48:50 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.203.177.99) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Jul 2025 11:48:49 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <jonathan.cameron@huawei.com>, <coresight@lists.linaro.org>,
	<dianders@chromium.org>, <james.clark@linaro.org>, <krzk@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<linuxarm@huawei.com>, <mark.rutland@arm.com>, <mike.leach@linaro.org>,
	<robh@kernel.org>, <ruanjinjie@huawei.com>, <saravanak@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <suzuki.poulose@arm.com>
Subject: [PATCH v3 0/6] Refactoring finding CPU phandles in DT
Date: Fri, 18 Jul 2025 10:48:42 +0100
Message-ID: <20250718094848.587-1-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.203.177.99]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_024900_047002_7F0D115B 
X-CRM114-Status: GOOD (  11.10  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series refactor the way CPU IDs are retrieved from the device
tree.

Usually, there is a for loop that goes over every single CPU that can be
avoided. This also reduces the amount of NULL pointer checks in drivers.
I have abstracted away that loop and introduced a new function
(of_cpu_node_to_id) for this.

This patchset is a subset of [1], where I removed content and patches
relevant to hyper-threaded cores for DT. Based on the discussion, the
code refactor is still useful, hence this patchset.

[1]
https://lore.kernel.org/all/20250512080715.82-1-alireza.sanaee@huawei.co

Changes since v2:
    - Addressed Jonathan Cameron's comments.
    - Added reviewed-by tags.
    - Added a new commit where I suggest simplfing the code in
      arch_topology.c to remove the use of cpu_node on failure path.
    - Improve documentation.
    - Caught a bug in patch 1.
    - Commit message fixed for patch 2.

Changes since v1:
    - Rebased on top of the latest mainline.
    - Addressed Krzysztof Kozlowski's comments -- Hopefully :-)
    - Addressed Jonathan Cameron's comments.

Alireza Sanaee (6):
  of: add infra for finding CPU id from phandle
  arch_topology: drop the use of cpu_node in the pr_info
  arch_topology: update CPU map to use of_cpu_phandle_to_id
  coresight: cti: Use of_cpu_phandle_to_id for grabbing CPU id
  coresight: Use of_cpu_phandle_to_id for grabbing CPU ID
  perf/arm-dsu: refactor cpu id retrieval via new API
    of_cpu_phandle_to_id

 drivers/base/arch_topology.c                  | 22 ++++-----
 .../coresight/coresight-cti-platform.c        | 13 +----
 .../hwtracing/coresight/coresight-platform.c  | 15 +-----
 drivers/of/cpu.c                              | 49 +++++++++++++++++++
 drivers/perf/arm_dsu_pmu.c                    |  7 +--
 include/linux/of.h                            |  9 ++++
 6 files changed, 72 insertions(+), 43 deletions(-)

-- 
2.43.0


