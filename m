Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E486C02190
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 14:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wy9Kd1tRNPjJ7fX39Zk0IB/RiCX0HA9i6UGO0pbaFf0=; b=qem0/7WprhW6fmxtvQID2w5sCG
	eok2LiJ4Ll0K0NexsnPRgDv/5w0G836Ft7G9gRalfkOZTXqiK2wNGA2qIHqUKcG9FFdOWsLykuH+i
	aeRI63GebTvxx9Kwt+LEr9wt/IVvYCxJio9VONIIiHgr7JN0EkCBNqdJO2TkMtYfk+aRnq6jKHEMK
	DanTh+ZGEFyM+6c1BIBY5vaKg8jYPqdNgvEJwFCUBPHAJPV0vu5g7sFGqn0a6q9OE1x5DWeLxkqYH
	OSu7uMo/j9V1oBfZZ6uKg7IKuZBpmJDffTnNineiUtyfwYVCq3Zb6PtEQI6NttP9b6iHLHBh3o9R2
	s10Ys7Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td9Of-00000007AqZ-1PnC;
	Wed, 29 Jan 2025 14:50:29 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td9NL-00000007Ac5-0V9k;
	Wed, 29 Jan 2025 14:49:08 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5d3cf094768so12796972a12.0;
        Wed, 29 Jan 2025 06:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738162145; x=1738766945; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wy9Kd1tRNPjJ7fX39Zk0IB/RiCX0HA9i6UGO0pbaFf0=;
        b=ngn0cm1HVxWWVbuFJMA/u168vi2dxVqEyc406dh/mVoRSu/F4rh/DJ+oJoEF40wLAN
         +j0q4K+L3SafkOrt3cSUaI1oZXL2sPoS3QhlopeBYwuRI/ukWO3/cSfuImu4qh/ymw2g
         8CslkJh68RXZJ2uoJrzLVI9rb8ofl5Tqv49s/2F1rjyM6D33EEnSNadeRhcdXNYMR+mD
         qEJzB1mtoyOdTSWBv/65wVrRtLEBg6uZV1/gfprp/+x5cupishkf1voBH8zjWX+QDDEr
         ZhNuJ8gEDaNY4NNiCkBOYr7dtnMUuulOERuG+6xrgl9m6RC4EBdpKyivfBcX5Fyh8VdL
         HS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738162145; x=1738766945;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wy9Kd1tRNPjJ7fX39Zk0IB/RiCX0HA9i6UGO0pbaFf0=;
        b=UJfQ8wR5C4/G7nYNR6jgNIB5qL83Wao6Bp7zZ4uB6ui2FY8Oqui3RDIjLqdYtQ1PiZ
         ni7SrVPKi/d6jCBtt7uiMDBs0Wt7hyrI4eAlJnQYgF+rwZ8dzqIQz6LZTkzmkTCv/Zb4
         mPHg8HHq+wyxTwngQDFpfJ2flZmRjp17d3Muzqqz6GeV9VHEgLqTiP81O35DfJM5hiDR
         eWqZ6UxoB6vay4opIG6OrKMBmVbvZ4sJAVXeCdI92Cdx/Qz1Nts5kyz0ddQBpshVkf9N
         j+UWGyNIpFzn3b2kCbe6XzycyUZ4VbkrtmbAaDxNLhqmJFlGw4aeCax2XJIW8rqQrmqz
         K+GA==
X-Forwarded-Encrypted: i=1; AJvYcCVcwT7qt+h0FJIqRUhy7XpFYm1Q9OPR63mtX+aKavNP+FSfYhOoVjqAkl3L/YEffUniLJnhN8KhSqy5ziifiRA=@lists.infradead.org, AJvYcCX3SMd2eyOgVjIfH03glOd9D2v/MNWCiXmtM9WMgIlIWOyGQBs89siH+LJJLfg3wN+evBMvP8xLp8jjj7/FHpPC@lists.infradead.org
X-Gm-Message-State: AOJu0YyQT1lbB6yBYa/s2y47OQ6ipzbH4XdSJ3tBh1mfn7MyavDsFxgI
	qfCS38jxswPpIKN7VgZKmF+eGPPi4fYK7FcZEeSLJNBRlaet4xR5
X-Gm-Gg: ASbGnct5j+pnHZFfG6e+O4VtfpCfG8pPo17W2Bm2V7C/ysuJ/4F6uaCQ3o34WpLDfqT
	jml5gidKE+RHCOGcj29K77+Bh151vY0dic5azeBRWoibV++Wl61U+hQgUXaiYFVZVdSTjIuJlUK
	rePiUgd6xvJYDTPvH7lxEI+G4ZfIPrq4hbBgq2AqhY9PJdx7HLV+MTMejGUtvdh3oj2fy9pFv0a
	+8dfWmPbs37xOqEIJ9KhyOgbxQeebar0vjXpHeMWCulgp3lm00i4kqzrD0nY7xnr8swWcm9DPDI
	JcHZcJMJUwWdZsHYGTxW7PGIIU4HXutae33/ivMKXByd9SlloLffFemqbYo5Un8mkdlZzaw7
X-Google-Smtp-Source: AGHT+IH2RX223oR2m9txbeNFTWl5Np8ejjscYRjYqWj/WLr3tsu0nZkXz1s69kvMjRYyH6ERTmSECQ==
X-Received: by 2002:a05:6402:5251:b0:5d9:cde9:29c6 with SMTP id 4fb4d7f45d1cf-5dc5effb151mr3128289a12.27.1738162144793;
        Wed, 29 Jan 2025 06:49:04 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc18628a5dsm9075610a12.26.2025.01.29.06.49.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jan 2025 06:49:04 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <5969581.LvFx2qVVIh@arisu>
Date: Wed, 29 Jan 2025 15:48:51 +0100
Cc: linux-kernel@vger.kernel.org,
 Diederik de Haas <didi.debian@cknow.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>,
 Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <CE4343FE-94AA-4F84-8C43-8366013AED84@gmail.com>
References: <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <20240615015734.1612108-2-detlev.casanova@collabora.com>
 <3333233.eAoTOS8U2s@bagend> <5969581.LvFx2qVVIh@arisu>
To: Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_064907_158532_3CF05650 
X-CRM114-Status: GOOD (  10.91  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Detlev Casanova =
<detlev.casanova@collabora.com> w dniu 15 cze 2024, o godz. 21:44:
>>=20
>>=20
>>=20

> Yes, the vdpu34x decoder on rk356x socs should be supported by this =
driver but=20
> I don't have boards to test that unfortunately.
>=20

Detlev,

Just FYI:

I done some tests of rkvdec2 on 6.12.11 on 3588, 3568 and 3566

For enabling rkvdec2 on 356x i:
-add 356x compatible in rkvdec2.c
-add dtsi nodes like this: =
https://github.com/warpme/minimyth2/blob/master/script/kernel/linux-6.12/f=
iles/1078-arm64-dtsi-rockchip-rk356x-add-rkvdec2-video-decoder-nodes.patch=


With this i can say:
-on rk3588 i have some hevc 4k decoding perfectly but some others are =
failing
-on rk3566/3568 only subset of 3588=E2=80=99s samples is decoded well. =
(but is works then works perfectly fine)
-when not failing on 3588 sample fails on 356x - is see errors like:

[   95.666669] iova: 0x00000000f2e80000 already mapped to =
0x0000000037378000 cannot remap to phys: 0x000000002f8c0000 prot: 0x3
[   95.745082] iova: 0x00000000f2f46000 already mapped to =
0x00000000372b6000 cannot remap to phys: 0x000000003a403000 prot: 0x3
[   95.822012] iova: 0x00000000f2ee6000 already mapped to =
0x0000000037126000 cannot remap to phys: 0x000000003a803000 prot: 0x3
[   95.896802] iova: 0x00000000f2ec6000 already mapped to =
0x0000000029fe6000 cannot remap to phys: 0x000000003a403000 prot: 0x3
 turning-off iommu makes above errors disappear - but sample still =
fails.

If anybody hints me for way/tool to analyse of playing/failing samples =
to catch: what encoding specifics makes given sample failing to decode  =
on rkvdec2 - i'll be more that happy to provide details=E2=80=A6    =20
(doing simple mediainfo <file> shows no differences for me=E2=80=A6)



