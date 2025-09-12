Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298C5CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 09:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79lD+UZN7+w3yfpLoI0y3gCWro/hQPDPRWzjwz0DUuU=; b=R5r1vk9SVbWiUoACZWv323a7aC
	1p+2BSjghJtWoBTjOnjQ2t9oYoWXxcMA6K+pOzpBYbGD7cDYBULjgy8s4pwCmQtV2bD/T3lNKhRW5
	JZClu2lJXvDZNFrfuVR2zBwpTLItcwISFPr/O1f+gKJow3w1q7XUihfRN2MFSA6qrEO5WOv6Xv7Xm
	gP6QCsDvr/woAMENcsnlVkgDLpJlSIZgZtYEQa7uSHTkut7ESnxf6aboXjCAeJi2GqVad6+/Zbiha
	69YxhXjPxACr6LmEysDhatgy1QvOSJ5Z01qYKUWa/JilT21iMd43cliym5sOcs2HUA2zMSL2T84Nc
	eYQ2hsug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0Mf-00000008N4Z-0DX9;
	Fri, 12 Sep 2025 09:46:45 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0Mc-00000008N3d-1NoL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 09:46:44 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58C9kVwf579719;
	Fri, 12 Sep 2025 04:46:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757670391;
	bh=79lD+UZN7+w3yfpLoI0y3gCWro/hQPDPRWzjwz0DUuU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=h3oVCo+Sf9Gu/55IxtFRGR54EiDM3W5ytBriP/OeCnh42mxQujyzFxybH4uIC+rX5
	 fgpfNTrW6E1y88EVbc8hRQbKlyrJ8Ayv6qgZEiRqX4+ZqdNhlb+WTeBWU2b376CI6d
	 xr67A/YXIHxwSdetWrLzpu08tVPMdSBrlBvkBQPM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58C9kVTf1893099
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 04:46:31 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 04:46:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 04:46:30 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58C9kU003409325;
	Fri, 12 Sep 2025 04:46:30 -0500
From: Nishanth Menon <nm@ti.com>
To: <praneeth@ti.com>, <afd@ti.com>, <vigneshr@ti.com>, <d-gole@ti.com>,
        <u-kumar1@ti.com>, <sebin.francis@ti.com>, <k-willis@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Akashdeep Kaur
	<a-kaur@ti.com>
CC: Nishanth Menon <nm@ti.com>, <vishalm@ti.com>
Subject: Re: [PATCH v6 0/4] Remove unused bits from dts and add support for remaining pinctrl macros
Date: Fri, 12 Sep 2025 04:46:25 -0500
Message-ID: <175766787054.26424.12411839583402198052.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250909044108.2541534-1-a-kaur@ti.com>
References: <20250909044108.2541534-1-a-kaur@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_024642_565252_D7FAA633 
X-CRM114-Status: GOOD (  16.90  )
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

Hi Akashdeep Kaur,

On Tue, 09 Sep 2025 10:11:04 +0530, Akashdeep Kaur wrote:
> This patch series cleans up the dts files to remove the pin control
> DeepSleep configuration that does not take effect in hardware.
> This series also adds the remaining macros in the pin control file
> supported by SoC so that any configuration can be used as per requirement
> in dts files.
> 
> Link to Previous Versions:
>   -V1: https://lore.kernel.org/linux-arm-kernel/20250731115631.3263798-1-a-kaur@ti.com/
>   -V2: https://lore.kernel.org/linux-arm-kernel/20250901122835.3022850-1-a-kaur@ti.com/
>   -V3: https://lore.kernel.org/linux-arm-kernel/20250902071917.1616729-1-a-kaur@ti.com/
>   -V4: https://lore.kernel.org/linux-arm-kernel/20250904112538.529857-1-a-kaur@ti.com/
>   -V5: https://lore.kernel.org/linux-arm-kernel/20250905051448.2836237-1-a-kaur@ti.com/
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/4] arm64: dts: ti: k3-am62p5-sk: Remove the unused cfg in USB1_DRVVBUS
      commit: fe0e018b05f118cb8e5c8cd77dd74185b2cb7177
[2/4] arm64: dts: ti: k3-am62x-sk-common: Remove the unused cfg in USB1_DRVVBUS
      commit: 121babfed84a0c6d7ebee4486db4fbd9a900d9f5
[3/4] arm64: dts: ti: k3-pinctrl: Add the remaining macros
      commit: 42558822658e0ad249a8f109fd053e3bad4476e9
[4/4] arm64: dts: ti: k3-pinctrl: Fix the bug in existing macros
      commit: 2e79ee4d64e9ba4a3fc90e91dfd715407efab16d

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
https://ti.com/opensource


