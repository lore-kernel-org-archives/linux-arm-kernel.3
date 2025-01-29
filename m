Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4C8C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 16:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AASPGoZdR79efbOZhdjcAbczy5T4cO1CnTVAPCvMgDc=; b=lKXKjGQ/022TbL0sxEAg9bHs/m
	UaiojBZkpJvkbCf+wc20zaydpDOtOs1o+GDBPJA43TfM9tKN+PTEE1xb0BwBOqXYug4Op0GUR+vU7
	darK6vZoqItzNi+NxrYYLmJn9fBgNTxGGVsu/LrsROYcRfUbbGn8psFmoZtTp7U2jtHegSdr3gpBe
	YZpK1q7nQVY84Cr1MXdScmz1p847pjvJjKxtLXDTv8PhDYhsEhlwQfHnLxfNwA/2DJcSYqXA/suRJ
	gCB/1dRYaOWsMR/3/fO9Z72ra98h7ONQWiGSMi/HiaGpf73JCJeoc8xYXgrNnpNJwlsXx3XhZv3LF
	Mi7z8mqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdApP-00000007NQY-1nS3;
	Wed, 29 Jan 2025 16:22:11 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdAng-00000007N7L-1mrN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 16:20:26 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7b6c3629816so387113985a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 08:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1738167623; x=1738772423; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AASPGoZdR79efbOZhdjcAbczy5T4cO1CnTVAPCvMgDc=;
        b=K9W4szLP7e5IAyuNth4K09u5BG/xCpFbmLiSW/C8sR6pM4AHRhVdilxpRPpv60vJPa
         TFqSKgRcJDcdWG1R74xwn1PCXbpS5oXG8ayBhf7DYq6ZvXS+kiiyu5JPbuObn7WGJEvl
         jaqMyOAOcI/LzhSkTYh0WqgFRhiKHsfYJwk68ZBPQwDb/4RTQRGEWej5rqrEttuIPfIx
         DHlo3dIBrLyphhaguvdQ7n6mgFVH4ERqrrVdpN/vxFahuDGwNt8gW/88AOXgCXZMfbTQ
         DLmoXGKzHUo+kCCWhFGnkuivdnom95nhCXF7zoSJ7vJgPahZphAa8gFiM+PBWmzqtUI0
         hhIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738167623; x=1738772423;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AASPGoZdR79efbOZhdjcAbczy5T4cO1CnTVAPCvMgDc=;
        b=u+3ju/j598W+1JmQtFVhkSwr1OFYEEI7jt7gKOpXAVU94240RMZApupOYlR3fATU/i
         SO+o1wwg1S+XQL3Lpcp4zmM33DcITXJkwH3fBlGesau4crGxFDSehBjLVAvJLa2FqQXe
         NFn4+2MndTqTxoAZOu4EqTkDIYfXRiBFd26HayXwFCRkNXYokpj8spj8y4xX/nQGP1sp
         HN7MZhhXv7gnqzgwyW7FCQ4RM9dUNWPUj2Dv3YLcrd7IN3EDbqTKaYNElclrd97F54LV
         aRInUK9wRmVfNI/wvu3yOwwEN8/tA9k5nP16HjkPKh1Yn4PfYuYD0dmCgJQEv6BhAIos
         QGKA==
X-Forwarded-Encrypted: i=1; AJvYcCVcgY0BGJaem/8821NoBaydljaVB83X+TuBfJ2ThVhPk64pKB4zri7TMbT8/tkeuzbVMd1sorBMWitk/xjVFaNo@lists.infradead.org
X-Gm-Message-State: AOJu0YxnssXj0OwsKJ2MJezICUC3+oQ8vbCN2mDxxjZiVIfc8F1vSk4s
	WXB0JpgIkirofe29qWdzVd8gGQYP+1/8ZUEXHscW6qiVXAH/DFvpKQBnyfEsDZM=
X-Gm-Gg: ASbGncuweHcOlwnyPO19oIUSVr2k38yiykh+vTnIX+nXboHnF06KLIt2R3y2lm1qRkv
	MYPrz9DWU1wertEEgoByEGkjY2c6ht1R0EZAykiYRU6AKZHrYJzn92Mkd+2GGo0hDybr+SwHFoV
	aYrG9GA333fIDwOOhbH/pq0ROHbQI4n/jNhxTc2x+nGLJdwffo1OF39MmTYObWaw3WCHffbccJJ
	SGdIhPYjxdJTlgbLSrZAvu19NDN0ohHbgJXky6yEpnmB29ARcehqw2McQrStvjcMRBcUWo5+RpV
	KPRnEiSDRE/+fs9S
X-Google-Smtp-Source: AGHT+IGppDxv2MaMp8XMUqVjUk8aPzK+5B86GRXvdwYxAlIS5cCU4yod4npv5CwwFk+ECmoEn75I5Q==
X-Received: by 2002:a05:620a:280e:b0:7b6:cedf:1b4e with SMTP id af79cd13be357-7bffcd900aemr507124485a.41.1738167622668;
        Wed, 29 Jan 2025 08:20:22 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:e976::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be9ae7dd05sm637120385a.13.2025.01.29.08.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 08:20:22 -0800 (PST)
Message-ID: <bd5abd7f1e29853729c1c9b57b62e2e4a9524e6d.camel@ndufresne.ca>
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, Detlev Casanova
	 <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Diederik de Haas <didi.debian@cknow.org>, 
 Mauro Carvalho Chehab	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner	 <heiko@sntech.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,  Sebastian Reichel
 <sebastian.reichel@collabora.com>, Dragan Simic <dsimic@manjaro.org>,
 Alexey Charkov	 <alchark@gmail.com>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>,  Andy Yan <andy.yan@rock-chips.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-staging@lists.linux.dev
Date: Wed, 29 Jan 2025 11:20:21 -0500
In-Reply-To: <CE4343FE-94AA-4F84-8C43-8366013AED84@gmail.com>
References: <20240615015734.1612108-1-detlev.casanova@collabora.com>
	 <20240615015734.1612108-2-detlev.casanova@collabora.com>
	 <3333233.eAoTOS8U2s@bagend> <5969581.LvFx2qVVIh@arisu>
	 <CE4343FE-94AA-4F84-8C43-8366013AED84@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_082024_725971_3908717E 
X-CRM114-Status: GOOD (  19.24  )
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

Hi Piotr,

Le mercredi 29 janvier 2025 =C3=A0 15:48 +0100, Piotr Oniszczuk a =C3=A9cri=
t=C2=A0:
>=20
> > Wiadomo=C5=9B=C4=87 napisana przez Detlev Casanova <detlev.casanova@col=
labora.com> w dniu 15 cze 2024, o godz. 21:44:
> > >=20
> > >=20
> > >=20
>=20
> > Yes, the vdpu34x decoder on rk356x socs should be supported by this dri=
ver but=20
> > I don't have boards to test that unfortunately.
> >=20
>=20
> Detlev,
>=20
> Just FYI:
>=20
> I done some tests of rkvdec2 on 6.12.11 on 3588, 3568 and 3566
>=20
> For enabling rkvdec2 on 356x i:
> -add 356x compatible in rkvdec2.c
> -add dtsi nodes like this: https://github.com/warpme/minimyth2/blob/maste=
r/script/kernel/linux-6.12/files/1078-arm64-dtsi-rockchip-rk356x-add-rkvdec=
2-video-decoder-nodes.patch
>=20
> With this i can say:
> -on rk3588 i have some hevc 4k decoding perfectly but some others are fai=
ling
> -on rk3566/3568 only subset of 3588=E2=80=99s samples is decoded well. (b=
ut is works then works perfectly fine)
> -when not failing on 3588 sample fails on 356x - is see errors like:
>=20
> [   95.666669] iova: 0x00000000f2e80000 already mapped to 0x0000000037378=
000 cannot remap to phys: 0x000000002f8c0000 prot: 0x3
> [   95.745082] iova: 0x00000000f2f46000 already mapped to 0x00000000372b6=
000 cannot remap to phys: 0x000000003a403000 prot: 0x3
> [   95.822012] iova: 0x00000000f2ee6000 already mapped to 0x0000000037126=
000 cannot remap to phys: 0x000000003a803000 prot: 0x3
> [   95.896802] iova: 0x00000000f2ec6000 already mapped to 0x0000000029fe6=
000 cannot remap to phys: 0x000000003a403000 prot: 0x3
>  turning-off iommu makes above errors disappear - but sample still fails.
>=20
> If anybody hints me for way/tool to analyse of playing/failing samples to=
 catch: what encoding specifics makes given sample failing to decode  on rk=
vdec2 - i'll be more that happy to provide details=E2=80=A6    =20
> (doing simple mediainfo <file> shows no differences for me=E2=80=A6)

Not sure where it is saved, but we have a mainline kernel with the MPP serv=
ices
driver up-levelled (you can probably do that yourself, its not that hard). =
You
have to have the MPP library and probably the gstreamer plugins from rockch=
ip
installed.

The general approach is to dump the register prior to every codec trigger, =
and
compare. Appart from memory addresses, pretty much all register should be
identical for decoders. If you happen to have a stream that fails on MPP, s=
imply
report that to them, they are generally fast on fixing their own stuff. And=
 we
can then used that knowledge to fix our implementation.

As for most codec, when working with larger group of developpers, its bette=
r to
start with getting the ITU conformance tests passing. Once we reach an exce=
llant
score then we can start looking at specific streams. The benefit is that IT=
U
conformance can be run with fluster which removes a lot of possible human
errors.

Nicolas

p.s. Jonas Karlman has been working on IOMMU fixes and resets that helps re=
cover
from faults that are sticky in the dedicated IOMMUs despite the HW self res=
et
mechanism.

