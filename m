Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24672CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 07:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yVn4qwgMjrPkAleC73oRCX8Q22/zQZPdCGnjlPSiigU=; b=slighf9PFGmh4O
	IyZnYfbFhsPVNDjFJ7RUaEa3eP0dhR4dAZetKKsJgfzaCDBA+89RCnPGuQiPSzZ6+Tzc0yi0+TrMX
	VbOMO0MslYL9UjTIY3AeV2DKFR9kEwcBbZ7eU3B1XSpPb1A9ojDXzH2/Dmg+ZHZn0/x8CIhkIAwqv
	s7Bd1XdCXi6DPRvWkMq1Ub72DLst1+HxmIenS1kB4rJSJVUZ/G30DCO4tnHi0j0BRxVKqT+Bmrzpa
	VkUT0Zy5lvfDsFsrryRXNGm6s9aXA/jkzvUCdiQ6K+sx+Q/O92xvaVGvSNOAu9Sfw2YN2PKjFCRBP
	rqn9ZVr75LZMBeCSjULQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDjf-00000006yyE-2LS3;
	Wed, 10 Jun 2026 07:52:27 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDjb-00000006ywk-2WUw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 07:52:25 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yVn4qwgMjrPkAleC73oRCX8Q22/zQZPdCGnjlPSiigU=;
	b=ukJNKBbDTadA46loMmO9Y/SM25+i1LZZ193Hb9zzEn7QoZoVRWrJv89YoA2pnK+++ZRydEKW/
	Uy9BpycOIoIfmSfnSAMT/2e+AkQcdw0ZpNhwBAEee7sYgZxSPUEQZDEwpGAuolP946gerUoaMKa
	NpjIq3bnVCHFLXLLANCeElA=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gZyTj3Mj1z12LCq;
	Wed, 10 Jun 2026 15:44:25 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 367B8203B1;
	Wed, 10 Jun 2026 15:52:17 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 10 Jun
 2026 15:52:15 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <punit.agrawal@oss.qualcomm.com>,
	<ruanjinjie@huawei.com>, <mrigendra.chaubey@gmail.com>,
	<suzuki.poulose@arm.com>, <chenl311@chinatelecom.cn>,
	<fengchengwen@huawei.com>, <maz@kernel.org>, <timothy.hayes@arm.com>,
	<lpieralisi@kernel.org>, <arnd@arndb.de>, <gshan@redhat.com>,
	<jic23@kernel.org>, <dietmar.eggemann@arm.com>, <sudeep.holla@kernel.org>,
	<pierre.gondois@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/2] arm64: acpi: Fix NULL kobject warning in cpuhp_smt_enable()
Date: Wed, 10 Jun 2026 15:52:00 +0800
Message-ID: <20260610075202.3597031-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_005224_161629_E2BA3240 
X-CRM114-Status: UNSURE (   5.99  )
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

Fix NULL kobject warning in cpuhp_smt_enable().

Change in v4:
- Fix hot-unplug tearing as Sashiko AI code review pointed out
  by forcing unregistration.
- Update the arm64 hotplug doc.
- Update the commit message.

Jinjie Ruan (2):
  arm64: smp: Fix hot-unplug tearing by forcing unregistration
  cpu/hotplug: Fix NULL kobject warning in cpuhp_smt_enable()

 Documentation/arch/arm64/cpu-hotplug.rst | 28 ++++++++++++++----------
 arch/arm64/kernel/acpi.c                 |  2 ++
 arch/arm64/kernel/smp.c                  | 28 ++++++++++++------------
 3 files changed, 32 insertions(+), 26 deletions(-)

-- 
2.34.1


