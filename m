Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D2BEA7195
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 10:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSNMSL2yf7R55Mkk0U6fT14ULpUWkywT0FjbSBd+zG4=; b=MynCP1doMbZ2+OVVrDzvI7SfRb
	pzgXfsu2fctfOm3wFUO/Sh/bIFs2s+p6h/PAXKlQp214uPMJxWCXXFFWCICotlg3vORfrUr+jSggJ
	QWAsGX0VFPJb0khzXOGxONC/2Hwo/yi+L8BOHTNV8HOE8Ye5gNx4urDyg7jiew1A8t5O/eO/Ph5CS
	8i6+gP3n4nk7Uw6KV7P4Pni7lXCtYJEKlzf7jMENXDTm5kvoxgjvd7BaqR6HCfyfOE+GTvsrzPQgz
	1MP9RTf6BOrLFA5YtFvASJjrZQ50T/LG1rNAcDYpdAwsi7je3hVal/aBdn9a6gTfdMiPSfiwG9xNW
	y2Ov8YLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEPYL-00000005hwO-4AUK;
	Sun, 19 Apr 2026 10:39:01 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEPYJ-00000005hvy-1RMs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 10:39:00 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43d64313c39so1625960f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 03:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776595137; x=1777199937; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSNMSL2yf7R55Mkk0U6fT14ULpUWkywT0FjbSBd+zG4=;
        b=J56PQUC19PhF8PM4bF04NQrXgnFDRyCvDFzdhP/RP/zhWsM2HDRO487x/3TpTZkzR3
         AHbHodBoPLkhOe9axqESPduOpj7pYSerex+TfJ1tqFmgI022/PnnZrQTHOaMyhl8mhLX
         Qoe5rPcr3wMNCEWRGkTfntamEDh8zlTFnnRqJjFqj4o+RxYHGd5qyvAeUlIx0jEi3CR4
         DFweIKYGp+0tTy5LNpgGASjACzmaGWav7r1GxYEOFyyM7D8J7ZgCNeQMzrJG+DfiWjVd
         2K16MjwlzJg0tUoUWpWaVl21Yqq9Nmm7ckZXZ0xjL4XRX/E1HNoLio2BWkwtORVTNrh2
         ZPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776595137; x=1777199937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aSNMSL2yf7R55Mkk0U6fT14ULpUWkywT0FjbSBd+zG4=;
        b=Cy4dOfg/lCAQqMbpg+5FGKNiwvJfR9o657dGi4GkU8Rg5tdi+ZhsNVuYZyFHsTrFsn
         /6CHjOwh+jYTxKlIF1VzF0QuYOp4OKuTDMbMc/2ReaHaOr2yQXpzJ/3XXsxwKcCq+pOJ
         5f81ORbh6pJjvGxAc9lPxXvjEANRx8x1NC7ZohD6FERFVx8zp7+QdTPTgDemKma5lpR6
         TBLX2zSF1Q9T4Q4RZrUvMzMSZ7Tvyoj28iRhe8zORZNpSmal4/hHv4LMLIyAd3/tR1uv
         5AOlnaeOOUdK7piNAQFzguBGJ+vtN4wo7YGwc3HP3ZC/BnX3IZ0oFdN/crGJFh5j1yOs
         tvGQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LlUXMgrGVQ6HvTcZ5jLSIuRnOXzu5rq4Yl5cj4HqaqGoYQ2KnnCEWzHPYYJ4zmYYl8uVdpSLw2qEa/EyTOfnK@lists.infradead.org
X-Gm-Message-State: AOJu0YyMUnEJJhdnNm9WRCp2yEkczvZsEveDsVtK+elou2XsqroSPweM
	46kJth6iC6uqg6N4MKTp/cM16SpQQqRPHV4XeGEZmF8atuumqLDzSiRD
X-Gm-Gg: AeBDiesrb//ebVmG9Dqp6ghDKBsfjWsBINZjUbfVbin2zbVH4R/GaOohno0yUAV2ESv
	jIDGbD2F/6DSoHr/9mNaSOYuqRhHSGuRX7tnXlx7UAU54d0cBJ5tLUb09E62LHHvrMyYHcU/IWN
	se1KOhxR8kq+4BIj00rdNXyOSH5YjLolsataA07a4lpBsirZJq/o5H6JJNW2OVX/lhfHcox3WYo
	LKdmi76j6i6FRNPaJ9xQywnQEBFZ8m8mHix4o2849Gz+tvjCb91nDALjfAiHYKSPfLHfmHVj+Rc
	ESaoEw85DNkFHZVTDa0VuRdnHRpsuDCJX08unpbB14/X4jhsgf0q6vbX3KtZ4+YKJUb5BhvqM9m
	0vFTqMWyO4b12MwO+j2kihlh+41SYkHUKmvr0w6JPg+rtnVR+4woiE+uq1fqzyQWSCisStj6X08
	kdKHwA+uFCVU6CVHHCVrv2FQUUOc7MCpD+UW/6xCmEzNlx9doA8xGGhKk=
X-Received: by 2002:a5d:5849:0:b0:43e:a8ad:975e with SMTP id ffacd0b85a97d-43fe3dfbedbmr14792261f8f.27.1776595136543;
        Sun, 19 Apr 2026 03:38:56 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e46898sm20259211f8f.27.2026.04.19.03.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 03:38:55 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Michal Piekos <michal.piekos@mmpsystems.pl>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: dts: allwinner: t113s mangopi: enable watchdog for reboot
Date: Sun, 19 Apr 2026 12:38:53 +0200
Message-ID: <ar7Vj6maR5aXgp7KQK7v1A@gmail.com>
In-Reply-To: <20260418135519.16e41490@ryzen.lan>
References: <20260412-t113-mangopi-reboot-hang-v1-1-5002cfa6e0cc@mmpsystems.pl>
 <2825865.mvXUDI8C0e@jernej-laptop> <20260418135519.16e41490@ryzen.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_033859_494855_50466974 
X-CRM114-Status: GOOD (  22.91  )
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

Dne sobota, 18. april 2026 ob 13:55:19 Srednjeevropski poletni =C4=8Das je =
Andre Przywara napisal(a):
> On Fri, 17 Apr 2026 20:19:20 +0200
> Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:
>=20
> > Hi,
> >=20
> > Dne nedelja, 12. april 2026 ob 19:42:10 Srednjeevropski poletni =C4=8Da=
s je Michal Piekos napisal(a):
> > > Reboot hangs on MangoPi MQ-R T113s because no restart handler is
> > > available.
> > >=20
> > > Enable the SoC watchdog whose driver registers a restart handler.
> > >=20
> > > Tested on MangoPi MQ-R T113s.
> > >=20
> > > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > > ---
> > >  arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts | 4 ++=
++
> > >  1 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t11=
3.dts b/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
> > > index 8b3a75383816..f0232a5e903b 100644
> > > --- a/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
> > > +++ b/arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts
> > > @@ -33,3 +33,7 @@ rtl8189ftv: wifi@1 {
> > >  		interrupt-names =3D "host-wake";
> > >  	};
> > >  };
> > > +
> > > +&wdt {
> > > +	status =3D "okay";
> > > +}; =20
> >=20
> > Move this to sun8i-t113s.dtsi. All t113 boards have the same issue.
> > Watchdog should be always enabled on ARM.
>=20
> We actually have that line in U-Boot:
> https://github.com/u-boot/u-boot/blob/master/arch/arm/dts/sunxi-u-boot.dt=
si#L22-L27
>=20
> IIRC, the idea was that it is *firmware* that chooses the watchdog, so
> the generic DT should not be the place to set this.

Why would firmware need to select watchdog? We only had issue on H6
with it, so I kind of get it for that, but in general, all ARM based SoCs
have it enabled by default which is IMO how it should be.

Best regards,
Jernej

>=20
> If people use $fdtcontroladdr as the DT source, everything falls in
> place neatly, no need for changes or runtime patching.
>=20
> Cheers,
> Andre
>=20





