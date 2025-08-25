Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834C6CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 02:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pASWifJy+mDV9TDONvW/oRyWGhZRp7fLEvB1CU+fq5I=; b=OSO6M5GfjHeO4DBAuQMZFAnuAw
	UlpC3Erxrlzyr/yCqRhEJVCGoxNwL9YarzRwC9cTEaI9BerOBZVJflUMsSaaOP8i4TtCqB7HhuC1y
	FWmhttBB9Q0SXuD2ND6tf4d5IISB8EVdxfm8IeJzYMNBrhPIRFBYP8g+J4haHimnpDabsgrfg6Q4w
	EZE0bHkr/HwxNCr1dgRFK9TOS55Z87ikv4qcZfL7ofunE0s/yI+oGmjM0do8su3iAx8QlKyEDcQK7
	o46pDrhlsap0Wge8Oy9ltfShW8DSbkIYe4nQcdwGjLrc3p0sTzUUgDB25UOM9JQ6C9ThQvFychpVG
	DCmq3uBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqNHq-00000006l0u-02Bd;
	Mon, 25 Aug 2025 02:50:22 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqNFB-00000006ks1-3cK4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 02:47:39 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4c9FZJ51K2z14LnR;
	Mon, 25 Aug 2025 10:47:20 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 95C2B140133;
	Mon, 25 Aug 2025 10:47:26 +0800 (CST)
Received: from kwepemq200004.china.huawei.com (7.202.195.237) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 25 Aug 2025 10:47:26 +0800
Received: from huawei.com (10.90.31.46) by kwepemq200004.china.huawei.com
 (7.202.195.237) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 25 Aug
 2025 10:47:25 +0800
From: Zhou Wang <wangzhou1@hisilicon.com>
To: <kvmarm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
CC: <maz@kernel.org>, <oliver.upton@linux.dev>, <tangnianyao@huawei.com>,
	<wangwudi@hisilicon.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>, Zhou Wang <wangzhou1@hisilicon.com>
Subject: [PATCH v2 0/4] Add workaround for HIP10/HIP10C erratum 162200802
Date: Mon, 25 Aug 2025 10:39:50 +0800
Message-ID: <20250825023954.3516381-1-wangzhou1@hisilicon.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq200004.china.huawei.com (7.202.195.237)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_194738_064920_976E4D87 
X-CRM114-Status: UNSURE (   9.63  )
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

As the discussion from V1 series, V2 series firstly adds GICD.num_LPIs
writable support, then add HiSilicon erratum 162200802.

Erratum number should be 162200802, make a mistake in V1, so fix it as
well.

Zhou Wang (4):
  KVM: arm64: Allow userspace to write GICD_TYPER.num_LPIs
  KVM: arm64: selftests: Add test for GICD.num_LPIs
  Documentation: KVM: arm64: Add GICD_TYPER.num_LPIs writable
    description
  ARM64: errata: Add workaround for HIP10/HIP10C erratum 162200802

 Documentation/arch/arm64/silicon-errata.rst   |  2 ++
 .../virt/kvm/devices/arm-vgic-v3.rst          |  6 ++++
 arch/arm64/Kconfig                            | 12 +++++++
 arch/arm64/include/asm/cputype.h              |  4 +++
 arch/arm64/kernel/cpu_errata.c                | 15 +++++++++
 arch/arm64/kvm/vgic/vgic-init.c               |  9 +++++
 arch/arm64/kvm/vgic/vgic-its.c                |  9 +++--
 arch/arm64/kvm/vgic/vgic-kvm-device.c         |  1 +
 arch/arm64/kvm/vgic/vgic-mmio-v3.c            | 22 +++++++++++++
 arch/arm64/tools/cpucaps                      |  1 +
 include/kvm/arm_vgic.h                        |  1 +
 include/linux/irqchip/arm-gic-v3.h            |  1 +
 tools/testing/selftests/kvm/arm64/vgic_init.c | 33 +++++++++++++++++++
 .../selftests/kvm/include/arm64/gic_v3.h      |  2 ++
 14 files changed, 116 insertions(+), 2 deletions(-)

-- 
2.33.0


