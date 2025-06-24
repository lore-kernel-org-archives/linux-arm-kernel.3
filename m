Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B44C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 17:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFbya3akG5s+WS6JIinMfQGqethChzDGcRe3Sr4acZc=; b=F6Wy1ZNBCvOeBDUYobVn+DOIk6
	WoQfoznlwJO7nLTAbxHWiN2LnqmeccNNLR7TumRDVG1yFQTF5p/VFbDrd8iZgd5P4d7xidDgQtZkb
	q7lWA7Meiio0xvFvYj8jxu9uLAWCDfFoe8k3HNJAocU4eQ/06w77otrnPyQ3dxXe6j9ZfDPihzqUT
	p1BZCCtNwsmH4hYUmg/vg75gVooiU0yLEdEqg6fsF/oqyyi8Qvu6tuBod/dMcbDfKdjgxSWAwIpq5
	ODSDVNngZPS0ke196tCgMQSlG0SAcBfNHyOOffece7bbiiBIrtVC6MEObNoKIHcX55SQ4/spkH/zw
	IqQ4IDdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU7MS-00000006NTA-0d5H;
	Tue, 24 Jun 2025 17:23:08 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5Fz-000000062Na-3EVh;
	Tue, 24 Jun 2025 15:08:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750777688; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=j2T9YRPFmYHllAw3Uj+oprvkwNlJuGisTI3I33f9NyyOLPlWD6NhDuy8il1fatk6YzWEAT6XrwlVprtYlftjxk9KXOsWei8/WM3Jt7ueJrqur5UIHs774ZonkCokIsotBBlJA4kWHqrxlsQ/c7E/JH4JKQE0rPpWjI9PNf1xW8s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750777688; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iFbya3akG5s+WS6JIinMfQGqethChzDGcRe3Sr4acZc=; 
	b=h7IxcQ8JPbIC+RE7fTXushzJnYfvEgD8fnuk9Ek59B5Jzz1fUgofQK4SM3ff/+xMIY0rpevizoPXVMBIQJ0JKYpeDAh6oiZD0AxG6tW3hbvbPtaXshOwW54ZZl2eCFnt5w4+LpDIYsNhWD8cCV7Eh2g+WgSa+AdzNWgXGsXtnRE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750777688;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=iFbya3akG5s+WS6JIinMfQGqethChzDGcRe3Sr4acZc=;
	b=FtptMFisHQLd/sJ12WNGMcjoOI8gkU4MkUTPkZnp2DNG7YTgyEFoITQdqnxu4Wre
	UYnu71dhwT3nmywqje6WNh6p5cf3qD3zmUCKG3tK3F/VyLInOFxJD9JHoFNLg2FX/Uj
	9++aNZ2IsPHD1rdDv629KMriuxFmGV+VSst6vEVY=
Received: by mx.zohomail.com with SMTPS id 1750777687203110.75444813457466;
	Tue, 24 Jun 2025 08:08:07 -0700 (PDT)
Message-ID: <639e695859d632c9527d76876df2a48287197fb9.camel@collabora.com>
Subject: Re: [PATCH v1 0/5] iio: Add support for MT6363/6373 Auxiliary ADC
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	jic23@kernel.org
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 robh@kernel.org,  krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com,  linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org,
 kernel@collabora.com
Date: Tue, 24 Jun 2025 11:08:05 -0400
In-Reply-To: <20250623120028.108809-1-angelogioacchino.delregno@collabora.com>
References: <20250623120028.108809-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_080819_840073_343CE5A0 
X-CRM114-Status: UNSURE (   7.57  )
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
> This series adds support for the Auxiliary ADC IP found on the new
> MediaTek MT6363 and MT6373 PMICs, found on board designs featuring
> the MT8196 Chromebook SoC or the MT6991 Dimensity 9400 Smartphone
> SoC.
>=20
> AngeloGioacchino Del Regno (5):
> =C2=A0 dt-bindings: iio: adc: mt6359: Add bindings for MT6363 PMIC AuxADC
> =C2=A0 dt-bindings: iio: adc: mt6359: Add bindings for MT6373 PMIC AuxADC
> =C2=A0 iio: adc: mt6359: Add ready register index and mask to channel dat=
a
> =C2=A0 iio: adc: mt6359: Add support for MediaTek MT6363 PMIC AUXADC
> =C2=A0 iio: adc: mt6359: Add support for MediaTek MT6373 PMIC AUXADC

For the entire series:

Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

(as I internally reviewed this before submission)

--=20
Thanks,

N=C3=ADcolas

