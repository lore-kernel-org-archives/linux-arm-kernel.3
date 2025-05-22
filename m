Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3425C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 12:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDSvBOeKveZYF6b9S5X4vui4DH9xu/TEm/3/m9avi9k=; b=03BRfaBn9Cu/NVvidf4vvAbKrx
	KSD7twKINHwsSYMsnYDg6DNa2yuPtEsSnDDxzIFO3nGXydFlngkygY/PJ2rSfOwI3uIO7YEldatHH
	MBjDG8Bs5/2oJnx5O5Fka9EbqZwm8gFh009tbCmknzV/VAmmOjWCI7bNVbtIVfG+EgkpXFjTJWV6V
	k+8RqazwZDwXwom6Kpd6czZJ6xDeHFopuRibGtubrx2mSKU6Z5oDQJhtkT7nHwDeLSQzmiD81Pb6q
	pHq9V8dtyIlaNZRpwHBtE099Ang4A1T8Ze8d36YhOr0lpqwJQcQRFK2lKSJ90nReRlT4MmbvoHnM2
	zcfypSqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI4wy-00000000z7X-1bzz;
	Thu, 22 May 2025 12:23:04 +0000
Received: from ni.piap.pl ([195.187.100.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI4se-00000000ybV-0ib8;
	Thu, 22 May 2025 12:18:37 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 4D218C405A45;
	Thu, 22 May 2025 14:18:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 4D218C405A45
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,  Dafna Hirschfeld
 <dafna@fastmail.com>,  Mauro Carvalho Chehab <mchehab@kernel.org>,  Heiko
 Stuebner <heiko@sntech.de>,  linux-media@vger.kernel.org,
  linux-rockchip@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  Jacopo Mondi <jacopo.mondi@ideasonboard.com>,  Ondrej Jirman
 <megi@xff.cz>,  Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
  stefan.klug@ideasonboard.com
Subject: Re: [PATCH] RKISP1: correct histogram window size
In-Reply-To: <174784811736.14042.11404187248848039485@calcite> (Paul Elder's
	message of "Wed, 21 May 2025 19:21:57 +0200")
References: <m3tt5u9q7h.fsf@t19.piap.pl> <aB31Eg6oRpcHHEsb@pyrite.rasen.tech>
	<m3jz6b8lb1.fsf@t19.piap.pl>
	<20250521101042.GC12514@pendragon.ideasonboard.com>
	<174784811736.14042.11404187248848039485@calcite>
Date: Thu, 22 May 2025 14:18:34 +0200
Message-ID: <m3wma87s9x.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_051836_370249_C8ED7C0F 
X-CRM114-Status: GOOD (  12.13  )
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

Paul Elder <paul.elder@ideasonboard.com> writes:

>> > Setting "2", the same input scene:
>> > 32E12400: 15h
>> > 32E12414: 0 0 0 2194 1263 1096 1406 2528 5228 5052 4291 6354 8322 6943=
 13201 460522
>> > which sums to 518400 =3D 1920*1080/4.
>
> Yes, these look good (although I think you might've copy&pasted the wrong
> number for the sum)

Definitely :-)

> Oh? I would've expected 2^20-1 =3D 1048575 to be the magic number, but ok=
 I
> suppose the hardware caps at 1048559 instead. It probably overflowed and =
that's
> why the sum is so low.

I don't know. It seems it counts all right until reaching this magic
1048559 =3D 0xFFFEF. Then it stops at this value and stays there.

>> > 32E12400: Dh
>> > 32E12414: 0 0 0 0 0 0 184 3059 11970 75298 114898 211444 429772 439922=
 400358 386695
>> > total =3D 2073600. But don't rely on it too much, the "1" has problems.
>
> That's interesting. My guess would be that in practice a divider of 1 wou=
ld
> still work as long as you make sure that it doesn't overflow. Maybe the u=
sage
> documentation was based on a rule-of-thumb.

I don't know. TBH I guess I haven't tested it with mainline kernel (and
RK1ISP driver), only with the NXP VVCAM driver. But with stepsize =3D 1
I was getting certain differences in total number of pixels (not big
ones and not always - maybe 10% of frames or so, or less). Without
reaching the magic value, I mean.

If if was simple cap at 1048559 we could correct it in software (up to
2 Mpixels) - there could only be one bin overflowing.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

