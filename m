Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D719BCC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 14:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CA9g32FsvjIGy2NDJ20+Q4DRxnVN7V2LPet+zGjT+fg=; b=qWrqZy47Kv6gmipebLxnmnSLVq
	BpNxJkAxeZIMm77xSqxT3hgsZQCeLdBvWya5oX2x9zpNmrPl+xh/LfmFuKKin3UMU29+lZczTUw/B
	ZNHXlRFxWsHMKq8AXK8hj5W+gIUMJM5FLuBZHRqgX+LCmYfPvJpGxMBp96c/fYzb5NCPhdFqrvKpZ
	xQIYb+qlmnP9Yxvpr/HAEMKcthvG/peAYZM36+9WYLoizZHTsNtLFlBy+I5Qb8jAaa0iQWmDKwc4q
	uu+JKjozUIHHtqlGFXt65oK5QgEFad9oeSXMh/F/+mMRMgyMaqD5+HxB+BAomSFLFH5lxE+8Wf1qm
	YDu2Hmzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0Ns-0000000FmHK-0VEY;
	Wed, 14 Oct 2026 14:55:12 +0000
Received: from sender6-op-o15.zoho.com ([165.173.180.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0Np-0000000FmGg-2keV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 14:55:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1791989700; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=m4nbkDhWbwMxRGHxUhdo9vdHlCk+0PjpIcLwr/rfKuYgwLUfY764hLB+y1N31hk+2Wi4CJcvqV02n17Yxxh7mSW6Zv02JikuJyzJ7NURHlGqsjV2RE4FtvVZEewFRgFZx8MP1qwGBEZmrOGbu4BUeJncEXaQzu4RKzCOA83EXjw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791989700; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CA9g32FsvjIGy2NDJ20+Q4DRxnVN7V2LPet+zGjT+fg=; 
	b=V+64rw46zLps7k9TwGXl5+cF91xERMXQZNkMz/qYyrDtrAA0GFPBmPinlJggW96LWjdEaKe2a/pOFCrMGVtQ/AajUb18bKGf00KYa4llRKkBJUpd8aUuZ1BWn8yR3lK6QhDSHZl6ylz/sQRbW3mhZGRBOdEZC/fcaOH9/yXpbRA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791989700;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=CA9g32FsvjIGy2NDJ20+Q4DRxnVN7V2LPet+zGjT+fg=;
	b=EJlJ5thmYHTGuloONFxmtnSL0L2U4jeqes2F9PqN9JWlipQBiXpx7agn94gr8jUW
	x/KVdqrxykVwyiPenP4qYHZAVZeDzgzpbyI0lv3bz/b0LFWqg7HkXrNnKNQVRsVlqNc
	Y22rlLwfDc6d18/Yd4GopoI8gZloez457zXYWdlrZKMk+qcyXlaoK1OGzjwR+M6uXVp
	kFwTrAOXTxLomOOV9jb6l4qdjzR0hT9NoaK9KkLr/53j9xYmesq8OEJJSsOIQR2T5cQ
	B+kzCbvKRtCdJmCYan3SgewUDG48NqQmyMkxBqdzGLM0gogyuyf/BN+BK/DMp1rH4Ap
	aRj9jRhTdQ==
Received: by smtp.zohomail.com with SMTPS id 1791989698099683.4759366619081;
	Wed, 14 Oct 2026 07:54:58 -0700 (PDT)
Message-ID: <1227d18b5e03cd2e5b4b423cd7ca44284da0e4ff.camel@icenowy.me>
Subject: Re: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add vendor prefix
 for Teclast
From: Icenowy Zheng <uwu@icenowy.me>
To: Mikhail Kalashnikov <iuncuim@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
  Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Andre Przywara
	 <andre.przywara@arm.com>
Date: Wed, 14 Oct 2026 22:54:43 +0800
In-Reply-To: <20261001022415.913959-2-iuncuim@gmail.com>
References: <20261001022415.913959-1-iuncuim@gmail.com>
	 <20261001022415.913959-2-iuncuim@gmail.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_075509_759175_C410B047 
X-CRM114-Status: GOOD (  12.68  )
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

=E5=9C=A8 2026-10-01=E5=9B=9B=E7=9A=84 10:24 +0800=EF=BC=8CMikhail Kalashni=
kov=E5=86=99=E9=81=93=EF=BC=9A
> Teclast is a Chinese consumer-electronics brand. Add its vendor
> prefix
> so that board compatible strings can use it.
>=20
> Assisted-by: OpenCode:DeepSeek-V4.1-Flash
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
> =C2=A0Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index ba2002969..c7c2fcd37 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1694,6 +1694,8 @@ patternProperties:
> =C2=A0=C2=A0=C2=A0=C2=A0 description: Techvision Intelligent Technology C=
o., Ltd
> =C2=A0=C2=A0 "^techwell,.*":
> =C2=A0=C2=A0=C2=A0=C2=A0 description: Techwell, Inc.
> +=C2=A0 "^teclast,.*":
> +=C2=A0=C2=A0=C2=A0 description: Guangzhou Shangke Information Technology=
 Co., Ltd.

I am feeling weird trademark/owner discrepancy, although I checked the
footnote of Teclast homepage and the owner here is correct (although
the name is only seen on the Chinese homepage and on the English one
it's just "Teclast").

BTW Shangke Information has another brand name, for PC parts, called
Maxsun -- although it might take a while for this name to be considered
for DT bindings.

Thanks,
Icenowy

> =C2=A0=C2=A0 "^teejet,.*":
> =C2=A0=C2=A0=C2=A0=C2=A0 description: TeeJet
> =C2=A0=C2=A0 "^teltonika,.*":

