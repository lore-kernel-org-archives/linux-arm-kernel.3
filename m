Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49000C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 18:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwBZPzxn17JvK+V65zGyJFMJb6zC4Pj40uxCg1alNFo=; b=Xipw5VlOOknYipaXYCIojH/4fA
	j+GQhfa2BPba45bqvWOb/v2bH44rc6bV2mxO0lXRjYKZoygUmCAVJ4bxLns/QIdaVOY9Pt0owah9F
	JwM+ugMZwalvYRQxHDafxfIJjj6Oh56nI5y89KcOBf4DKzqcFjPqvPxt8e0QrFDGRUohB4r6IruBm
	lwJJkAVkoZdRBh5oVS54SbgPcu4BYa1z5HnFamsscUDoUyNsyAwaCBbr5++ersPNO0fVXnCNhlRRZ
	Eo6BKoU2CAgMVAT8+47qSAkFx57hPChy5HNgK3A67HF1ypIXdF5w2NximEW4Kn8kZFUCQMU2u9fLd
	h29dE2Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU8fj-00000006Y1H-3S68;
	Tue, 24 Jun 2025 18:47:07 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5Ja-000000063Bu-1E18;
	Tue, 24 Jun 2025 15:12:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750777912; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PbWcPMPdsiBjI5yUuATEXqR6754nuRTTSI93To7cx/Jc83GNnq9oB8Na81keGobkNvVJuGleN5AU6u83eLxxNciNYRfFSI95L6Vc5fN1QrUU5xTmzImF7QmzlVnZdhdZH+f1nC2G4PUdwQscV333ufz/5znCuOLOLqrusgw7Fdc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750777912; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kwBZPzxn17JvK+V65zGyJFMJb6zC4Pj40uxCg1alNFo=; 
	b=jPeyuZU/ylhALvNgHeFNYAuq4cjuEyvRf7BaqGil6SWCK4Q1Q8fRQyhGaaSH0GIvxaxuPWfhM2LhJtmgxRcn47bCoouuP1Ep01GcYHh+QJQSry2pqKQMuU3SSAHlJX1QPC0zsX4cj8k7e9LG1e4BGp/xiycrROC5fSpumcAybQw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750777912;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=kwBZPzxn17JvK+V65zGyJFMJb6zC4Pj40uxCg1alNFo=;
	b=Bf9YSS1Ga0DU0J+XC2yEcnc1NKTcDJnu0rTxNkBIt6iga3H6/8JOtOI7Qk3mRziO
	kA8ENF4z2QoaRaCkUJ5RKq8tn+sZwwBDEJ4WNJqXadd6JZGUTC+bHrlFDVsDCYzzYwj
	ZQnhcFsLz2Q8w8B3LpuJsyt0rmOlis+U8f9PH7fs=
Received: by mx.zohomail.com with SMTPS id 1750777910578164.21030726920253;
	Tue, 24 Jun 2025 08:11:50 -0700 (PDT)
Message-ID: <44767efb5f7eac1e5605dffdf531e805bc06b920.camel@collabora.com>
Subject: Re: [PATCH v1 0/6] regulator: Add support for MediaTek
 MT6316/6363/6373 PMICs
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org,  matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,  kernel@collabora.com
Date: Tue, 24 Jun 2025 11:11:48 -0400
In-Reply-To: <20250623120016.108732-1-angelogioacchino.delregno@collabora.com>
References: <20250623120016.108732-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_081202_423844_0C05D4DA 
X-CRM114-Status: UNSURE (   7.18  )
X-CRM114-Notice: Please train this message.
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

On Mon, 2025-06-23 at 14:00 +0200, AngeloGioacchino Del Regno wrote:
> This series adds support for three new MediaTek PMICs: MT6316, MT6363
> and MT6373 and their variants - used in board designs featuring the
> MediaTek MT8196 Chromebook SoC, or the MT6991 Dimensity 9400
> Smartphone
> SoC.
>=20
> AngeloGioacchino Del Regno (6):
> =C2=A0 dt-bindings: regulator: Document MediaTek MT6316 PMIC Regulators
> =C2=A0 regulator: Add support for MediaTek MT6316 SPMI PMIC Regulators
> =C2=A0 dt-bindings: regulator: Document MediaTek MT6363 PMIC Regulators
> =C2=A0 regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators
> =C2=A0 dt-bindings: regulator: Document MediaTek MT6373 PMIC Regulators
> =C2=A0 regulator: Add support for MediaTek MT6373 SPMI PMIC Regulators

For the whole series:

Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

(as I internally reviewed it before submission)

--=20
Thanks,

N=C3=ADcolas

