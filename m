Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081EDC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 05:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+iQ6+zl2doArTLPWFq6p1O+ATbiiOq7k6rpexGFLxA=; b=3rLSkzhEDp2YqyheSp7JlfO/cA
	hk7R2Yeafxa05ruHcFDY7POQ4PEhgfs/8dP/sDGtrA8kxByrtw7tnVTlzl0/tO+qlxj+JEGRxutyU
	CMxEPcXthkzWz9VQtneuWUnP7xrXqLARfWjdHe/nPEMjfEGEspmeafdn7wp3GM8l2TVK6Qh98NNS4
	y/zSo/DsouDAZLnCxaIh0lmzSRzZq351P3q7+HprcF1fgLZXiOiYLulNGr0Ox3uIWwtzqDJELXRl8
	l3SzuUc0Cb5xjiJzCVzHL4sP2/9QhOIWdg0vHXmLm7M8BhaafshN7cIUZ5uoE2Mxlk7IAKpk/4Rq1
	xp/TDLqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubYGV-00000004730-2KcY;
	Tue, 15 Jul 2025 05:31:43 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubYDH-000000046UN-1ail
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 05:28:24 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56F5SEdI2771457;
	Tue, 15 Jul 2025 00:28:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752557295;
	bh=T+iQ6+zl2doArTLPWFq6p1O+ATbiiOq7k6rpexGFLxA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xSs59wStlzbddKFe07sDuzXgU8QhBrEVv8tFuLo/TojdayeTKHfTTPjff1AkKOqCe
	 5dbeLfwf/03jbPfI+mE3lZv/MB6iUikmNEDRz51ND7S3ILsa6273JRzX+3dxYxCSDR
	 d4oLtsyagWCQNvPQELg8EaIyUw/FX+MGS3QcSX5g=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56F5SE412480803
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 15 Jul 2025 00:28:14 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 15
 Jul 2025 00:28:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 15 Jul 2025 00:28:14 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56F5S8Ll2035754;
	Tue, 15 Jul 2025 00:28:09 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <praneeth@ti.com>, Paresh Bhagat <p-bhagat@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <bb@ti.com>, <devarsht@ti.com>, <s-vadapalli@ti.com>,
        <andrew@lunn.ch>
Subject: Re: [PATCH v7 0/4] Add support for AM62D2 SoC and EVM
Date: Tue, 15 Jul 2025 10:57:52 +0530
Message-ID: <175240652598.4073742.4266830155737293290.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708085839.1498505-1-p-bhagat@ti.com>
References: <20250708085839.1498505-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_222823_587751_A2980822 
X-CRM114-Status: GOOD (  16.13  )
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

Hi Paresh Bhagat,

On Tue, 08 Jul 2025 14:28:35 +0530, Paresh Bhagat wrote:
> This patch series adds support for the AM62D SoC and its evaluation
> module (EVM) board, enable eMMC and firmware-name update for
> AM62D2-EVM board.
> 
> The AM62D SoC is a high-performance Digital Signal Processing (DSP)
> device with a quad-core Cortex-A53 cluster, dual Cortex-R5F cores,
> and a Cx7 DSP core with Matrix Multiplication Accelerator (MMA).
> It features a range of peripherals, including multichannel audio
> serial ports, Ethernet, UARTs, SPI, I2C, USB, and more.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/4] arm64: dts: ti: Add bootph property to nodes at source for am62a
      commit: 1704b0462220beabda1ddb4b386e1295defa39fd
[2/4] dt-bindings: arm: ti: Add AM62D2 SoC and Boards
      commit: 6f4b2a487352fa775bea4393d2455d334ccc97d4
[3/4] arm64: dts: ti: Add pinctrl entries for AM62D2 family of SoCs
      commit: 106f43ab41fa968c5ce3920e281870b99a519b13
[4/4] arm64: dts: ti: Add support for AM62D2-EVM
      commit: 1544bca2f188e47256b61ae5e24ea93a292bb559

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh


