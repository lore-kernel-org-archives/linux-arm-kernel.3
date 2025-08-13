Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856B6CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 14:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iB0oG4jCZar+MlBWg1xIuSPYx68EeANpTAsftMM0gM4=; b=P2x8krq/MUWbgh6/TxdjpPR6L9
	Qbj4Jz2bTR1yQOzwNOTfwTkkl/zXUUP03z7aogoNaW7HNf+xlhx70WgE2W2jP6cLE17hmkgwlhYC9
	ZyGbIM7Fpx53gZ3ypZKW8TKwJYgqejamkcwL7Dm8hd2syoN6edpWQeHTRKuQJcI37T3Fk+gqIgYRY
	HYl2ShDIVVa5yofrvX9ibvkTPMZLhB+IK4VgkHfUBQIUKdrbdLZZPKtYgt7jYVJKejS4FdNrNgnd2
	tT0u2NPSS1dYzk9CYCi03J69FHa50X/ZCq6e+TFXM3VkCcEZL5IczD7EJPim3pE1Cuu9z0WKVaZKU
	DLi2r2Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCnu-0000000DxqA-3UDy;
	Wed, 13 Aug 2025 14:50:14 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCWm-0000000Dv79-44X1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 14:32:34 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DEWTrN1718718;
	Wed, 13 Aug 2025 09:32:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755095549;
	bh=iB0oG4jCZar+MlBWg1xIuSPYx68EeANpTAsftMM0gM4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jtn0YPtS0sv9JQ4EvXOhP04JPA1WSKMCJf0Jbhvxy6Ea1yvYMwK2knaDZIaNYZzfG
	 c9lJdlH0EbFjvZjO4jhwhCmKH9LJXPBVtAKIIspCseiXnY9A/VVzJiSIaFPdJMMg2C
	 B0jeBb3sqnmMBfFzJsYShZs674OyjihfqvaV7C3g=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DEWTVI1036777
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 09:32:29 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 09:32:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 09:32:29 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DEWT9A2134792;
	Wed, 13 Aug 2025 09:32:29 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        Wadim Egorov
	<w.egorov@phytec.de>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <upstream@lists.phytec.de>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a-phycore-som: Add 1.4GHz opp entry
Date: Wed, 13 Aug 2025 09:32:27 -0500
Message-ID: <175509553406.158007.6562770238537192028.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250805090021.1407753-2-w.egorov@phytec.de>
References: <20250805090021.1407753-1-w.egorov@phytec.de> <20250805090021.1407753-2-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_073233_096871_F5D51BA0 
X-CRM114-Status: GOOD (  14.98  )
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

Hi Wadim Egorov,

On Tue, 05 Aug 2025 11:00:21 +0200, Wadim Egorov wrote:
> The phyCORE-AM62Ax is capable of supplying 0v85 to the VDD_CORE
> which allows the Cortex-A53s to operate at 1.4GHz according to chapter
> 7.5 of the SoC's data sheet[0]. Append the 1.4Ghz entry to the OPP table
> to enable this OPP
> 
> [0] https://www.ti.com/lit/ds/symlink/am62a3.pdf
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62a-phycore-som: Add 1.4GHz opp entry
      commit: f13db4f77d54a6db644f09a168919ad1b3432f52

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


