Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DB3C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 20:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOilgMvwC9d4QnH9gG5iBR+nw29he4c68ErHqUs8XVI=; b=kqn6Bb9+Wh5fXNnBh1zsFBfot3
	O3A6A+8m6V20Fpq/IWSbcLRCeAaf9dPGwhDEhB8/mEzJwA9yC0J+tSAUzppPsoF3SwwYKAOrduCNL
	nMmCi2rUjETXxGLndkx9lAEAR5+PfwlXOTV+85sDyC6tF1D/Tdsk5wSZOXTT6ZEWb5VrtGdCaFPKp
	vVqtYFdqBf6GpUNlaLmCgFdjB8I8oGA6HCegTV9WXAY6i60unaCCxFhu9KQNVXQ5nOkdhpSAxIh2k
	AqqV3BJq+H3GOkIYmMqKk9s6v3ucD0vHfXCxIN3T2MlWeiq0e0bMJZojiBQkpogcdYk/JKgjjbfSm
	RlCwMF4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUA8r-00000006kYG-1Esd;
	Tue, 24 Jun 2025 20:21:17 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU8dU-00000006XgC-0t1x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 18:44:49 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OIiht91631096;
	Tue, 24 Jun 2025 13:44:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750790683;
	bh=EOilgMvwC9d4QnH9gG5iBR+nw29he4c68ErHqUs8XVI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=faZ0PKkefHxzUMhN99WjbqCWG9+AM9QJm6A0oPzc9XD2mcRLMkEPRG7S01uzLHzri
	 sxGsCN0devc+Ss7XJuFlzM5Bhrom6/iPBwtpYoQN33qNu7wqO6hsjyvk9NOaLrxDs4
	 hLArnUjOCwmmB0MkgzkTIoCDF7LF1NHuNZ2r8luI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OIihZ31960493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 13:44:43 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 13:44:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 13:44:42 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OIidis2253858;
	Tue, 24 Jun 2025 13:44:39 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Miquel Raynal
	<miquel.raynal@bootlin.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>,
        Steam Lin <stlin2@winbond.com>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62a7-sk: Describe the SPI NAND
Date: Wed, 25 Jun 2025 00:14:35 +0530
Message-ID: <175079060336.1874839.4487491018148640150.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613182356.1272642-1-miquel.raynal@bootlin.com>
References: <20250613182356.1272642-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_114448_340715_5B42CB76 
X-CRM114-Status: GOOD (  13.57  )
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

Hi Miquel Raynal,

On Fri, 13 Jun 2025 20:23:56 +0200, Miquel Raynal wrote:
> Describe the octal SPI NAND available on the low-power starter kit.
> 
> The pinctrl configuration comes from TI fork.
> 
> With the current mainline tree, we currently get the following
> performances:
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62a7-sk: Describe the SPI NAND
      commit: 9c1185a99811a173e3c126d664982f6744f80997

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


