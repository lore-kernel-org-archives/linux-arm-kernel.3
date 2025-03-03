Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6DCC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 04:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Pd0XNKoaa+c5gJJj/KYlWqJ+Okkhjx9Gpi5+4VeGsY=; b=lLi4uwnqc85AFF6TUPJDyJBguB
	pR5ijm5X3saeZAkol6miV9mWJxr3Qkhewr9HwAJvJzhW02cffKDctpbU7g6Jk98qoKg9zu1YuF9hF
	3BPSzI4PAEiYZwQ0tHiXGVE507xmBFb0NVXQ/LcNVpoBAbAm8zuo4oSmpm5kDwjvKZd3B9IAfq8rR
	/1bVErXf5qvBrYMHAId+eiGvU9VAO2f7TiYz8GoaUC6CQ/VcJYjKVNd793GIQPb9Zg/FuLnvA99qz
	DHZqEhM0GvueUJjkc1fVmG6h9QnTOJ61Bp2I5QwfGbHQC7FgqsVfjaiT38JYdggWHHgQxObUzwaTj
	lr5rOr9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toxks-0000000HBS1-3hNY;
	Mon, 03 Mar 2025 04:50:14 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toxjI-0000000HB40-32Fw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 04:48:38 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5234mVZX3208506
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 2 Mar 2025 22:48:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740977311;
	bh=5Pd0XNKoaa+c5gJJj/KYlWqJ+Okkhjx9Gpi5+4VeGsY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=AcebxZ7+J6s7vmnwnJ9lZbjTG3EiyILDgP2xu2uzJG2KgA70SousSikGCM/Dj49E3
	 TEI9eOQZ6EA9AQPATMbmSsQBAu0E3/uS9fP5bQkiuoNWYtqCwdbouZ09ASsN3xT6OU
	 2Qnzaa060XJIRe4LnHWoKXFQ0G7nmw7FA+B9NerY=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5234mV5m030303;
	Sun, 2 Mar 2025 22:48:31 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 2
 Mar 2025 22:48:30 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 2 Mar 2025 22:48:30 -0600
Received: from uda0132425.dhcp.ti.com (dhcp-10-24-69-250.dhcp.ti.com [10.24.69.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5234mQEw107786;
	Sun, 2 Mar 2025 22:48:27 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <r-gunasekaran@ti.com>, <rogerq@kernel.org>,
        <s-vadapalli@ti.com>, Hrushikesh Salunke <h-salunke@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <srk@ti.com>, <danishanwar@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-j722s-evm: Fix USB2.0_MUX_SEL to select Type-C
Date: Mon, 3 Mar 2025 10:18:21 +0530
Message-ID: <174092143353.3272913.3498123853092206909.b4-ty@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250116125726.2549489-1-h-salunke@ti.com>
References: <20250116125726.2549489-1-h-salunke@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_204836_955004_B11B8A42 
X-CRM114-Status: GOOD (  15.86  )
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

Hi Hrushikesh Salunke,

On Thu, 16 Jan 2025 18:27:26 +0530, Hrushikesh Salunke wrote:
> J722S SOC has two usb controllers USB0 and USB1. USB0 is brought out on
> the EVM as a stacked USB connector which has one Type-A and one Type-C
> port. These Type-A and Type-C ports are connected to MUX so only
> one of them can be enabled at a time.
> 
> Commit under Fixes, tries to enable the USB0 instance of USB to
> interface with the Type-C port via the USB hub, by configuring the
> USB2.0_MUX_SEL to GPIO_ACTIVE_HIGH. But it is observed on J722S-EVM
> that Type-A port is enabled instead of Type-C port.
> 
> [...]

I have applied the following to branch ti-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-j722s-evm: Fix USB2.0_MUX_SEL to select Type-C
      commit: bc8d9e6b5821c40ab5dd3a81e096cb114939de50

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


