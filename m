Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BE9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 16:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEQ5i3xkGqGyq6ACkg5oz6na5qgwwv2naf7/EJyMul0=; b=fHrTn+ejav0ObkxmAJF8p1Walb
	wmEVaWnRBY9UWaVyRQYK93Yp/E3OwsIBwYlTREWYXHxvM2k1OqHCUR49sfCvE4SBOEtiZjkKKM1Hy
	8/wmD+lbJrlZob0cq1yhrRAJN1JEeTJeSJcf3cAiNCZKMAIy2njjE+s5wZCOqRI80hbYXAA+LvSoh
	zRZNP4LmsR8zoWiaD41cYCvh+itVaNdGAd15DbMy1LiUP3+viFB5aeWytT0WCGPLTF8uFZloMhYdR
	5GXuahZmCX4zzdOdMcrOrMp6he18hRLOX9x6TKLmH5Xe5AXidNEGHFgz5Igplkjxaa55OE6Iw8g7z
	hLrSNG5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTOBB-0000000Aqu4-3iOJ;
	Thu, 02 Jan 2025 16:36:13 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTO8e-0000000AqDi-1Vts
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 16:33:37 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 502GXXee1965847
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jan 2025 10:33:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735835613;
	bh=XEQ5i3xkGqGyq6ACkg5oz6na5qgwwv2naf7/EJyMul0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Psc0KKT6TZE80MF6TXBPVnW5mGlwEk2YitAVHLhnRxBqrVXStp/wLBQMcZASe1ReB
	 T+XGRXIsSwjmf7W4ChaacTME1cQmBVWKGbp7HxfKOX79Bm9XVCVqIHCifYEpfeeLPa
	 ipKfBZtwl3DoYQa0/540SZ/woJ6ySW2S20u5axQA=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 502GXXGo007606
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Jan 2025 10:33:33 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Jan 2025 10:33:33 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Jan 2025 10:33:33 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 502GXX3d077842;
	Thu, 2 Jan 2025 10:33:33 -0600
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rogerq@kernel.org>,
        Siddharth
 Vadapalli <s-vadapalli@ti.com>
CC: Nishanth Menon <nm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p-j722s-common-main: enable USB0 for DFU boot
Date: Thu, 2 Jan 2025 10:33:31 -0600
Message-ID: <173583559332.269231.11915800165749884190.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241220054550.153360-1-s-vadapalli@ti.com>
References: <20241220054550.153360-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_083336_492912_BB971553 
X-CRM114-Status: GOOD (  14.12  )
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

Hi Siddharth Vadapalli,

On Fri, 20 Dec 2024 11:15:16 +0530, Siddharth Vadapalli wrote:
> Add the "bootph-all" property to the "usb0" device-tree node. This is
> required for the USB0 instance of USB to be functional at all stages of
> USB DFU boot.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62p-j722s-common-main: enable USB0 for DFU boot
      commit: 3cc7633cab8b55a77c86aae3349d83ab1e13a5bb

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
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D


