Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C164EC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 20:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/WQvyfAI0EGy8oSkgnEC3wFCyTVgfp49vgP3UAnGP8=; b=0x9wXmmW523m5xUmE3eomKKtF9
	VKv/jvv8QBa1J7B9nEUiv5n/Nq0dP5hE5Oha3wHmdYYjKDTCi/wpagEms1JwmESdQXbssFfpR7tib
	h6EFcoswYH9op4fyLv8x0F2/M/Ug9BxWCEGUJ5J7YSlPPvvhfut7I/C1nTi3Kzj7tfD63EYAVFVQa
	k4dggY6kkUofALTwEqNsnxLaY0qIiZQCOKksilJTYCUhU6Jw0/aExw3S+dlG6bICbu4K8JatkJyk+
	MSI/xeGoJh6mIBXNxjTYuwA17R/b9u1j6o/XSbIsbrNsHwmKoprNZ1acuZ344EonBSqLOTttPO+Dq
	vkBZZGJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUA6Q-00000006kNN-24an;
	Tue, 24 Jun 2025 20:18:46 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU8d1-00000006XRw-1smC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 18:44:20 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OIiGCu1631072;
	Tue, 24 Jun 2025 13:44:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750790656;
	bh=q/WQvyfAI0EGy8oSkgnEC3wFCyTVgfp49vgP3UAnGP8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RLevw8TNGPq5ciOZgB+bBfS9CrHANWmhavqYDNagAD/XHbop5Q+xVOP0iYP46gjW4
	 2yPkxt164qVgUFISv5pr8ZsXX7aWPBuV4X1PQUNxndJKsm8mo2sbgVzbLUgPqKy5di
	 6AD1Kkf6Hn/zVYBH9dKur7+OEFpbwrbMbRP1MrVM=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OIiG8e1800409
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 13:44:16 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 13:44:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 13:44:15 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OIiBGt2253453;
	Tue, 24 Jun 2025 13:44:12 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Bryan Brattlof <bb@ti.com>,
        Dhruva Gole
	<d-gole@ti.com>, Andrew Davis <afd@ti.com>,
        Michael Walle <mwalle@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p-j722s: fix pinctrl-single size
Date: Wed, 25 Jun 2025 00:14:08 +0530
Message-ID: <175079060338.1874839.7157016701678665684.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618065239.1904953-1-mwalle@kernel.org>
References: <20250618065239.1904953-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_114419_572868_E33282D9 
X-CRM114-Status: GOOD (  13.88  )
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

Hi Michael Walle,

On Wed, 18 Jun 2025 08:52:39 +0200, Michael Walle wrote:
> Pinmux registers ends at 0x000f42ac (including). Thus, the size argument
> of the pinctrl-single node has to be 0x2b0. Fix it.
> 
> This will fix the following error:
> pinctrl-single f4000.pinctrl: mux offset out of range: 0x2ac (0x2ac)
> 
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62p-j722s: fix pinctrl-single size
      commit: fdc8ad019ab9a2308b8cef54fbc366f482fb746f

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


