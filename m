Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D675C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 15:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lpTX83oPfU/Si2YEH0djWh4MhIIsAtcI3Xd9B2IS2MM=; b=GoMDvPVyun+gs1iAsQefyHtKCE
	58VeTkiGT7G0jeg8d06/wKPD54FFbRzCgvcTpsLGt3VdveP8j285PnaKqR5q5bItSFIi2ANOphSyj
	RCGcYzv6lxPQ1onPTzeNnD53WL9rFgjdY6Cf/t5EpEhFKTueLVp40uTNIF5Mg3Dcln6OxGzj6JDMe
	drMYKkncU7hafyL2dmLbGrch+z7VjuUeIjr56g4o3RGp2wxueCaddNS8PmIo2wVCYeIoqYdGvY34X
	kUouVetm3YwXISNWWEcCiGbBbjMH9fwh+StdgB7RP+AVH3dmePSbIyFQ42D/no3KIqQjOxvGVXTGk
	7nA1NhEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZA4m-00000005l2O-0IS7;
	Tue, 08 Jul 2025 15:17:44 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZA2O-00000005kKb-0THh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 15:15:18 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bc4Mb0qw1z6D8hV;
	Tue,  8 Jul 2025 23:11:55 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id ED09714025A;
	Tue,  8 Jul 2025 23:15:04 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.203.177.99) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Jul 2025 17:15:04 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <krzk@kernel.org>, <robh@kernel.org>
CC: <coresight@lists.linaro.org>, <devicetree@vger.kernel.org>,
	<dianders@chromium.org>, <james.clark@linaro.org>,
	<jonathan.cameron@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
	<linuxarm@huawei.com>, <mark.rutland@arm.com>, <mike.leach@linaro.org>,
	<ruanjinjie@huawei.com>, <saravanak@google.com>,
	<shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH v2 0/5] Refactoring finding CPU phandles in DT
Date: Tue, 8 Jul 2025 16:14:57 +0100
Message-ID: <20250708151502.561-1-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.203.177.99]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_081516_295080_F80274EF 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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

This series refactors the way CPU IDs are retrieved from the device
tree.

Usually, there is a for loop that goes over every single CPU that can be
avoided. This also reduces the amount of NULL pointer checks in drivers.
I have abstracted away that loop and introduced a new function
(of_cpu_node_to_id) for this.

This patchset is a subset of [1], where I removed content and patches
relevant to hyper-threaded cores for DT. Based on the discussion, the
code refactor is still useful, hence this patchset.

Changes since v1 [2]:
    - Rebased on top of the latest mainline.
    - Addressed Krzysztof Kozlowski's comments -- Hopefully :-)
    - Addressed Jonathan Cameron's comments.

[1] https://lore.kernel.org/all/20250512080715.82-1-alireza.sanaee@huawei.com/
[2] https://lore.kernel.org/all/20250707150414.620-1-alireza.sanaee@huawei.com/

Alireza Sanaee (5):
  of: add infra for finding CPU id from phandle
  arch_topology: update CPU map to use the new API
  coresight: cti: Use of_cpu_phandle_to_id for grabbing CPU id
  coresight: Use of_cpu_phandle_to_id for grabbing CPU id
  perf/arm-dsu: refactor cpu id retrieval via new API
    of_cpu_phandle_to_id

 drivers/base/arch_topology.c                  | 16 ++++----
 .../coresight/coresight-cti-platform.c        | 14 +------
 .../hwtracing/coresight/coresight-platform.c  | 15 +------
 drivers/of/cpu.c                              | 40 +++++++++++++++++++
 drivers/perf/arm_dsu_pmu.c                    |  8 +---
 include/linux/of.h                            |  9 +++++
 6 files changed, 61 insertions(+), 41 deletions(-)

-- 
2.43.0


