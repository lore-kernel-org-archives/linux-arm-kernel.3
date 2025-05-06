Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E833BC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 16:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NF1j1zGaOEhYfyYPmDr/TohzDQaF31lcwMnMNLjbWq8=; b=TA6uUjVCvEMb/6EwLdckq4g+FO
	ezN7tIxGC1Pj4BroeCM1v38bXrFXL5r8rv/5YoK9Q6+pLo6NADF8lOtA8FYtFLVB/YVS+IF4eK9L3
	Rpycqi1p/Lc/mtDNYuJzynsCqS773pGOlq9sWC6LU92Xbo0AdfsgibeYeDYnU+ZRITy6a+ORlRe6f
	d9rzCAoEj0DgIGDZOyoH+ZdjtwlcBoxvpzS3pOJPcPLWd7luAfLwEBjF+vaZrDQ8+4pi6n2KfE+uB
	Fp2oVawtXamHLH1TjyIK24tyD2vE6GnhVsHzy+JjkWPg6fQOWWQ7RRuAlMUg9dtSHwLoaye8C2SUv
	8CspqODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLX7-0000000Ckmh-0W5Y;
	Tue, 06 May 2025 16:52:41 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCI7x-0000000C3d2-39Ct
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 13:14:31 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 546DENn41068667
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 08:14:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746537263;
	bh=NF1j1zGaOEhYfyYPmDr/TohzDQaF31lcwMnMNLjbWq8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qnRkEr1sHKUJHdKtWr5omhYvVDw2mXDcpmGCaqeEPLevQgYQWQkvwKv2EyZu+rO6L
	 xdJI0fnyCf37EulRiIQsW2b6gqzeBcRaGzkCdqlldevadt6puNluzouiID2BV7TLgc
	 u2nEcM7wriBGRoqOu2MnEY2NPJ8uvvIVeXzS94OY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 546DENkk011173
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 08:14:23 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 08:14:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 08:14:23 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 546DENZC075616;
	Tue, 6 May 2025 08:14:23 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matt Coster <matt.coster@imgtec.com>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Frank Binns
	<frank.binns@imgtec.com>,
        Alessio Belle <alessio.belle@imgtec.com>,
        Alexandru
 Dadu <alexandru.dadu@imgtec.com>,
        Luigi Santivetti
	<luigi.santivetti@imgtec.com>,
        Randolph Sapp <rs@ti.com>, Darren Etheridge
	<detheridge@ti.com>
Subject: Re: [PATCH v4 0/2] Imagination BXS-4-64 MC1 GPU support (DTS changes)
Date: Tue, 6 May 2025 08:14:22 -0500
Message-ID: <174653703213.733636.9167849450574129849.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250428-bxs-4-64-dts-v4-0-eddafb4ae19f@imgtec.com>
References: <20250428-bxs-4-64-dts-v4-0-eddafb4ae19f@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_061429_875596_01E5CDF0 
X-CRM114-Status: GOOD (  20.16  )
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

Hi Matt Coster,

On Mon, 28 Apr 2025 12:07:13 +0100, Matt Coster wrote:
> Now that the binding and driver changes to support the Imagination
> BXS-4-64 [1] have landed in a DRM tree, here are the corresponding DTS
> changes without the [DO NOT MERGE] tag.
> 
> This GPU is found in the TI AM68 family of SoCs, with initial support
> added to the k3-j721s2 devicetree and tested on a TI SK-AM68 board.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].

PLEASE NOTE: we typically do not pick up new bindings in driver
subsystems till they are merged in master. This is because of the
fact that the dts typically get merged from SoC tree while the driver
merges occur independently and there is a risk that the driver changes
might get dropped from the tree for various reasons. However, in this
case, since there is a community interest in seeing this available
and preventing potential driver bitrot, and the fact that the driver
changes have been in the tree for a few weeks and looks unlikely to
get dropped, I am picking this up. Please keep a watch on the drm tree
to ensure to let me know if the driver gets dropped from the tree.

Thank you!

[1/2] arm64: dts: ti: k3-am62: New GPU binding details
      commit: 8a6650dafaede08c565f88ee1d5920a498941f76
[2/2] arm64: dts: ti: k3-j721s2: Add GPU node
      commit: ed6f779e213070572e53e9801e4a6e510d7bc208

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


