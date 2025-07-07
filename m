Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB1FC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 15:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P8gH21396Le7SUQh7iT+1wWKP48ptNz08BG9JpQetbU=; b=wtgraPsyKsU6QdlBppK4nUwpsj
	BtNBbTjXd0bIOj91kK+7zpXYecOQeQuWWfzRwkb8nNTmgye1EX7U9WhuoYoTfaVHm/i9Kjxr2vePh
	Xnagybf26nKp2GIkgbrlplyUXSP9mEU7/YgOjZKajTDpv9RyN/GQ9F2Wxkh7HhxnO/IJPJV1z2hpZ
	Hz4b1L20Flb+SBm+F58uFhfY40Xf4VsNkH5yL0qhvaFASPGea8ECKqnOkZb3anaZ1OWMwPdnZfsw2
	f7Q4LjS69t2aa9t0q1gjSBiz3dobQdqcIBX4ZuIuM20IiJ/uZLSHhjb6CA+jyvzaSofvoLJoN7he8
	XtxBR+sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnQm-00000002oE0-1yAA;
	Mon, 07 Jul 2025 15:06:56 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnOQ-00000002npm-0XxZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 15:04:32 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bbSD24DJBz6M573;
	Mon,  7 Jul 2025 23:03:14 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 3630C1402EB;
	Mon,  7 Jul 2025 23:04:17 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.45.147.207) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Jul 2025 17:04:15 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <mark.rutland@arm.com>, <robh@kernel.org>
CC: <coresight@lists.linaro.org>, <devicetree@vger.kernel.org>,
	<dianders@chromium.org>, <james.clark@linaro.org>,
	<jonathan.cameron@huawei.com>, <krzk@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linuxarm@huawei.com>,
	<mike.leach@linaro.org>, <ruanjinjie@huawei.com>, <saravanak@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <suzuki.poulose@arm.com>
Subject: [PATCH 0/5] Refactoring finding CPU phandles in DT
Date: Mon, 7 Jul 2025 16:04:09 +0100
Message-ID: <20250707150414.620-1-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.45.147.207]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_080430_308058_65C79545 
X-CRM114-Status: UNSURE (   8.49  )
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

[1] https://lore.kernel.org/all/20250512080715.82-1-alireza.sanaee@huawei.com/

Alireza Sanaee (5):
  of: add infra for finding CPU id from phandle
  arch_topology: update CPU map to use the new API
  coresight: cti: Use of_cpu_phandle_to_id for grabbing CPU id
  coresight: Use of_cpu_phandle_to_id for grabbing CPU id
  perf/arm-dsu: refactor cpu id retrieval via new API
    of_cpu_phandle_to_id

 drivers/base/arch_topology.c                  | 12 ++++----
 .../coresight/coresight-cti-platform.c        | 15 ++--------
 .../hwtracing/coresight/coresight-platform.c  | 14 ++-------
 drivers/of/cpu.c                              | 29 +++++++++++++++++++
 drivers/perf/arm_dsu_pmu.c                    |  6 ++--
 include/linux/of.h                            |  9 ++++++
 6 files changed, 51 insertions(+), 34 deletions(-)

-- 
2.43.0


