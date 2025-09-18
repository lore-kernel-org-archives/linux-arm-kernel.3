Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7F8CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 13:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPYv2m3jnaBv4/l/HZ0iG3MFsl4uuoIjun6WjOr6o18=; b=HlHVGVp8W9IIoXoTyRE7VBLCKS
	o72c2AFV3o2loAA9infwxiMrjvcu4i+Kn1cgo8QYsF2t2kD1LSn9PQdbSIF7Kppa0c/VwcWnQ/Bqw
	7GcScfPol8wiLKsnPnt+nU7BHrNlBsUq8rOpWpcoWYzct2L7uFh+w9QkQSmsvpewFXv9xMSE9ZWke
	TYjuxcp+AGyZs/X++YOniskgCNFJI59GvgaIGEg1+2xZ91DeYdrP5Mz4URtWv2G4ZofCadfkXCVZ0
	cfLqSmVMXJvgKe91UBJLLmAGgnXPxIUkaAT7g5OhAhNqHbMR030zoD8KtblHmNs4JBIproFDBTIMT
	PI8lhqXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEja-0000000HYIV-2Ge6;
	Thu, 18 Sep 2025 13:31:38 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEjX-0000000HYGc-0Qqd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 13:31:36 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8112c7d196eso94881985a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 06:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1758202293; x=1758807093; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qPYv2m3jnaBv4/l/HZ0iG3MFsl4uuoIjun6WjOr6o18=;
        b=auKBp4A2or9GQdWJj+v6QeES3DIfAhU9IjQj4/6LsNx2Akqa21EXcQ5nqAG68vpAOm
         Gj4BQCw/FbAMmBQB3YTIjkGqD04O/9pA9qSrd2jHZJCvipjf16615ta+tbnGGlKYQDLU
         x69+7A488z8t0SjWPE51fFqUEJ6ZGE7tcipsBPbtbEgdwVXpn4sE9s+GzwTl9hm7Ci/l
         h9aFcYJyRKBCaYgyzpmN1oxWxTAhVphpQ8UXSjLAS+gzy3xHTno9OP56o79hYONxqvU5
         V6sFndP72RouKjv1I7D5xQDH1egXOKdU+qGxZe8V2ylrQXX3oGtABr5UU/hwCFPl00Rs
         vrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758202293; x=1758807093;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPYv2m3jnaBv4/l/HZ0iG3MFsl4uuoIjun6WjOr6o18=;
        b=rxm8EyjA7KEcnGSJRXU2KMJtZSGX7jSDFuFe0cQR59dr3zmad9d00D0ZpW2gR39hrk
         7qaIpskDpWDKNG1CKydJJljKLfV/wctaiPv4NPNSkI/iccH+uzBSuxi15yCEFZLBUP+2
         c5aD3/GAVvxj1u/xPRkaKKB1yiBY79c5SNWLggg3vfUhFgm/t3pv1/agTZrwjt9/0/Dk
         GFRvxLpeQ6gWh45D9dyKeL5bGoE9IXx0McX2rLPTNphXn2L8OWlwv0/Q6q0FA63VO403
         cRAxlXNGyQ1BeWO7faqQMF6Zrb44FjZ9aQsqBBzjqXI0RFn4YnBCQ6mMlyNGtpczRvx4
         diZg==
X-Forwarded-Encrypted: i=1; AJvYcCUV88vUuYibVzux6Gl+8Qt0D06OMyj9zKBUEqvA9ZNiJbXMsvuTegmNZObZvY2f7C2y3iS9iCSi/thzzzXq6iT6@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7fSYd2CwVcbWhjQbpKGunGpE5yeLoDr10FDs5xKVx9d6bhz0i
	NN2Ki3gpVcGYU9PNjdwM+Uvrig8+lhumc8Cw5yDmTvd8m9nwIjU89GwsGwQoCwUyjJ4=
X-Gm-Gg: ASbGncvOrBYqXymMtqcplw3Xt+nIXg/VpWVc/bEZx/IWVzNn6LGEUCmW1szjU/ZoyGL
	rtmYMpcKNIRexcXrrILB0qGGeDsmI9LMFKIW2iri8U8mS2wLqrpRFU1brKkYOvMeM7C0fTBLOUc
	/KCMf16NcjHEJRjIbLTphmafkp9HMPoF+goTVODhd3THf1Q1p4AsBPZKj5viC4GctQnI02mCkYO
	Z0UOwHRCInFmFUvg+Ud5JF9Q51SRMLtivZs4XConBZIa+mpqzrhSs4uGFQNrmblhO970MgaEQ9h
	7kYE7KKqGO2WiVC/eTWE0FkG9YnlqDGYgp5C/aoGEGce/3/5QATR8GlCostlRvg28Hpke8wWp2A
	2HIK/z6m9ExfSczvL83DOiVuYTNziR+sB/NQgC7xnqXfPxESBaYk5u/jrOA==
X-Google-Smtp-Source: AGHT+IEZMrFSL2BRRPxtTOKjAWDW7xdTVpOSqOm+sRqPhEGgZKYSOVPXEdh1+K0ZhOlHemb5x0jKfg==
X-Received: by 2002:a05:620a:170f:b0:812:afec:d5b8 with SMTP id af79cd13be357-8311186d1f5mr581762485a.52.1758202292862;
        Thu, 18 Sep 2025 06:31:32 -0700 (PDT)
Received: from ?IPv6:2606:6d00:10:aee0::5ac? ([2606:6d00:10:aee0::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4bda8998eafsm14022101cf.31.2025.09.18.06.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 06:31:32 -0700 (PDT)
Message-ID: <3a9f613bfcc560281d7287ca2e411dadcac745b6.camel@ndufresne.ca>
Subject: Re: [PATCH v2 00/12] media: rkvdec: Add support for VDPU381 and
 VDPU383
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Diederik de Haas <didi.debian@cknow.org>, Detlev Casanova
	 <detlev.casanova@collabora.com>, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, 	linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
Date: Thu, 18 Sep 2025 09:31:30 -0400
In-Reply-To: <DCV98UFRGHAS.2DGZOEOVN9WNX@cknow.org>
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
	 <DCV98UFRGHAS.2DGZOEOVN9WNX@cknow.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ka8JQHJLRBiB88+7XTFU"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_063135_377510_11E24E7F 
X-CRM114-Status: GOOD (  26.09  )
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


--=-ka8JQHJLRBiB88+7XTFU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 17 septembre 2025 =C3=A0 19:34 +0200, Diederik de Haas a =C3=A9=
crit=C2=A0:
> Hi Detlev,
>=20
> On Fri Aug 8, 2025 at 10:03 PM CEST, Detlev Casanova wrote:
> > These variants are found respectively in the RK3588 and RK3576 SoCs.
> > This patch only adds support for H264 and H265 in both variants.
>=20
> I tested this on my Rock 5B (rk3588) with (ffmpeg and) mpv on Debian
> Forky with sway and I was quite impressed with the results :-)
>=20
> In my earlier testing I found that the classic BBB video made for a
> really good test video and it played REALLY well. The 1080p version in
> both x264 and 8-bit x265 played without frame drops, although when
> pressing 'I' to show video info over the video it dropped some frames.
> But that never resulted in any visible artifacts.
> On the 2160p version I did see quite a number of dropped frames, but
> didn't notice any visual artifacts. Maybe that it got displayed on a
> 1080p monitor had something to do with it?

Sounds like we have "correctness" with ok performance, so that is enough fo=
r me
to consider the patches. There is few things that are not implemented that =
could
explain lower performance compare to the downstream stuff, such as the lack=
 of
AFBC. It will hopefully come later, giving nice boost when doing GPU stream=
ing.

>=20
> 10-bit encoded x265 files (still) resulted in a completely blue output,
> but I have strong reasons to believe that's due to 'missing pieces' (ie
> NV15 support) in the rest of the display pipeline.

Its still quite early days for NV15 (and its derivatives) upstream of
everything, so I would not block on that. It passes the tests when we read =
back
the pixels from CPU I believe.

>=20
> The displayed video seemed sharper and better then in my other tests.
> I thought I did see an artifact around 5:50 when a big rock almost fell
> on the little animal. Looking further, it appears to be an artifact in
> the original video :-O (I saw it also on my AMD GPU on my amd64 system
> and also when using software decoding).
> The fact I only noticed it when testing this patch set is saying a lot
> ... in a positive way! So I'm happy to provide my

That's it, your video watching experience is now ruined for the rest of you=
r
life :-D

>=20
> Tested-by: Diederik de Haas <didi.debian@cknow.org>=C2=A0 # Rock 5B

thanks a lot for testing,
Nicolas

--=-ka8JQHJLRBiB88+7XTFU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaMwJsgAKCRDZQZRRKWBy
9IXzAQDaymJ1abHUHsMNbl/WYGVN2REm08PxhqTaHUsWwxU6ywEAy2qLFg4QWHSc
KidAMEhUNpEK1hwZcicsIl92zBbgPgY=
=H3qI
-----END PGP SIGNATURE-----

--=-ka8JQHJLRBiB88+7XTFU--

