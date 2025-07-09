Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A48C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 12:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUwbZxXvUidWuICcpMpWi7Gq0aS8eGh45D4id751BMU=; b=YOT0lkBIzmBLrjUyqYbp0csPm4
	jZIkRiGq+HInOUcKMU7NYksweVliD1BgQV34yvUQAGOMH6WPY917ot/AI0tIA1r2wBP2WX3HYDI6v
	D1NSfFkNqX8bomXXND2BVZT3vZwDX7J0PBFeT/+93SthGav2KFxGyA0LprUltNPPPqZsDlLKM07+T
	v/cauL+klKNYetgbsp+xeZqr9AupW6JczQWUo6ug1dD/h3H6JOHgyjYinzK/RgfFbjs41AqR/SFiy
	2CRNnayN5qRt1ABBe0nxptslrPmSiLaYSmCNTXDmebm71UKR6XmNyIRk1Lc3o3uQk1LFPVFrsbFTP
	5PnlEGOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTvJ-00000008dXN-0iDJ;
	Wed, 09 Jul 2025 12:29:17 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZS9x-00000008K52-1ZKW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 10:36:18 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 569AaDh91453015;
	Wed, 9 Jul 2025 05:36:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752057373;
	bh=kUwbZxXvUidWuICcpMpWi7Gq0aS8eGh45D4id751BMU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ykc5PPtxfhPM7jZRzfohY5s1aiQ3ayN/IH63bb7M+pmczTf6qJo74YsCj1gk4yeJ4
	 SXB3bxoYL00Bq9WF6aGj0DpF5orrfKnEwljBDi52IQ4gQtVk8+B65f1VxglIKZ7JuN
	 DR8181SsQbarVuNxxxcUjPzDLe8aW17+g0E5+0hc=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 569AaDOH3270868
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 9 Jul 2025 05:36:13 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 9
 Jul 2025 05:36:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 9 Jul 2025 05:36:13 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 569Aa9Iq3789169;
	Wed, 9 Jul 2025 05:36:10 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <devicetree@vger.kernel.org>,
        Alexander Sverdlin
	<alexander.sverdlin@gmail.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-pinctrl: Enable Schmitt Trigger by default
Date: Wed, 9 Jul 2025 16:05:54 +0530
Message-ID: <175205731408.919009.13331484172952220730.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701105437.3539924-1-alexander.sverdlin@siemens.com>
References: <20250701105437.3539924-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_033617_502410_92BB607A 
X-CRM114-Status: GOOD (  16.12  )
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

Hi A. Sverdlin,

On Tue, 01 Jul 2025 12:54:35 +0200, A. Sverdlin wrote:
> Switch Schmitt Trigger functions for PIN_INPUT* macros by default. This is
> HW PoR configuration, the slew rate requirements without ST enabled are
> pretty tough for these devices. We've noticed spurious GPIO interrupts even
> with noise-free edges but not meeting slew rate requirements (3.3E+6 V/s
> for 3.3v LVCMOS).
> 
> It's not obvious why one might want to disable the PoR-enabled ST on any
> pin. Just enable it by default. As it's not possible to provide OR-able
> macros to disable the ST, shall anyone require it, provide a set of
> new macros with _NOST suffix.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-pinctrl: Enable Schmitt Trigger by default
      commit: 5b272127884bded21576a6ddceca13725a351c63

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


