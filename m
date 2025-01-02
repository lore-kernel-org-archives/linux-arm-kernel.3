Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E63E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 16:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2gua+4UmvlWIgCWnPCrZwVGVRfJuhfFPR6sCm36isDI=; b=nyWIE8fMfSWD6Qa1AkBNCBQfvw
	GR51cWhr/z4ULHjNWfrriyt9hN3BKm6dSG4+wDG4trHt3hp1UrD0ektW4nPa/WOvDMlFM/5eJsOQ9
	0PojUuLO856LYfIuvDql18SWF92uE3b41LRXyo+XbdwexuWvUKSLGqeKjIl/wG1QY6FlxvHZLM801
	5oVY8H6vfrvZvQyTGY139E9KCWZzPc7XDJ0a2U274tAgwSJRaDWArvJYt/pItto6WZ4F3QDOtp3Tt
	bbkmnrwH5ib2Zmy5gqMkdn3Q1Ig9WMjrdrY+8LvMjQupWvbdvLQJRCZygD2ifyJ7B5bquZXLGCCQT
	xggPZUkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTO8k-0000000AqEe-2Yux;
	Thu, 02 Jan 2025 16:33:42 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTO6W-0000000ApwB-3TYw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 16:31:26 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 502GVLvx2271965
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jan 2025 10:31:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735835481;
	bh=2gua+4UmvlWIgCWnPCrZwVGVRfJuhfFPR6sCm36isDI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NIRObbn6Ni5BwjHTxrRBo1u0X40ZoELxXSDkcqQ9FrrMiCpL6pjuf0qNncudNSuD5
	 4YP+Zj4i+Vw47ol5wadO53F89I2MTP7pJIV0YWZbRuHNuSj3RgG4HKhoBFtLGYAVRw
	 N4riy0c7bvUgpUtqmU54Jhc9Z2i03kwVwqac+bgk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 502GVLdx023948
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Jan 2025 10:31:21 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Jan 2025 10:31:20 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Jan 2025 10:31:20 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 502GVKtt058480;
	Thu, 2 Jan 2025 10:31:20 -0600
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson
	<robertcnelson@beagleboard.org>,
        Andrew Davis <afd@ti.com>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am62p: Enable Mailbox nodes at the board level
Date: Thu, 2 Jan 2025 10:31:19 -0600
Message-ID: <173583546358.268667.17404097510350553042.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241203174114.94751-1-afd@ti.com>
References: <20241203174114.94751-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_083124_960177_EBD9CEB9 
X-CRM114-Status: GOOD (  15.27  )
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

Hi Andrew Davis,

On Tue, 03 Dec 2024 11:41:13 -0600, Andrew Davis wrote:
> Mailbox nodes defined in the top-level J722s/AM62p SoC dtsi files are
> incomplete and may not be functional unless they are extended with a
> chosen interrupt and connection to a remote processor.
> 
> Disable the Mailbox nodes in the dtsi files and only enable the ones
> that are actually used on a given board.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-am62p: Enable Mailbox nodes at the board level
      commit: 61c1c774d33a5305f5440380d2be5e23464cd3de
[2/2] arm64: dts: ti: k3-am67a-beagley-ai: Add remote processor nodes
      commit: 89d8dbee6d1860c69039d8859003808b5e90266c

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


