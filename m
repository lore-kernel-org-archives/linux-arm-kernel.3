Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB36BC636B6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 20:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5/Rd3t51ulL2jFj2PIuw2mldaS4mUMnXa7fZq+qDTU=; b=Qbbear66UX1WLYwbyBYOFjtio4
	8SC+f3Akp9EL6kXfcClxb9PTcur7547MUcB7oDfc9aqebA5k1nlye7lqWskIyB+AjGgUaa/MI96Po
	vZOBAw4kplrEYkrKYcBejrr1SDYU/mR7xFt5gYx5ttqeaRXvnXg0dbp+Nl3EW3aXpjI3FHyp3OdlO
	Hf/mZWSuXb75omTGRa3JsfDWVThhAA0fh0fJwlb5fDG6LRulsd7dMUd1q6OTEpeOnZ0cH1GAIB+9i
	2reb+04FtqwLOs8SUOHOUElJVDVB0Dg/SlNL5eTetwsYTWMkOB10ViTjRSw2qx3I7JSWGVKkpKR08
	0AMRRhTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuFmV-0000000GuWb-1CX6;
	Sun, 22 Feb 2026 20:10:19 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuFmR-0000000GuW8-33et
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Feb 2026 20:10:18 +0000
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771791008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j5/Rd3t51ulL2jFj2PIuw2mldaS4mUMnXa7fZq+qDTU=;
	b=HtyXJS95iLIvZpEwYhy/cJ1s9QItwZQidbLXFje43L+iVIb4y2QpgRgk2PYH2FfHgcJssh
	gFGIrdelKpdbIGrFTeLDI69DiQDB9SB06p82SI16SpsbMVbl+sGPFcJTHY/FeCbbSsQF+j
	zopLHP9sOV+4xYL4aWXQDIYKdxXHiRc=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH] crypto: atmel-sha204a - Fix error codes in OTP reads
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <CAFXKEHZ9TTZMdzKr8_5UesUdajGoQNm_u_paakggtGONbzjPcQ@mail.gmail.com>
Date: Sun, 22 Feb 2026 21:10:02 +0100
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 stable@vger.kernel.org,
 linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <5B6971FE-BE8B-47F7-9FB3-E32D554FC19A@linux.dev>
References: <20260215205152.518472-3-thorsten.blum@linux.dev>
 <CAFXKEHZ9TTZMdzKr8_5UesUdajGoQNm_u_paakggtGONbzjPcQ@mail.gmail.com>
To: Lothar Rubusch <l.rubusch@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_121016_683493_FC858AFA 
X-CRM114-Status: GOOD (  16.45  )
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

On 22. Feb 2026, at 18:03, Lothar Rubusch wrote:
> On Sun, Feb 15, 2026 at 9:52=E2=80=AFPM Thorsten Blum wrote:
>> Return -EINVAL from atmel_i2c_init_read_otp_cmd() on invalid =
addresses
>> instead of -1. Since the OTP zone is accessed in 4-byte blocks, valid
>> addresses range from 0 to OTP_ZONE_SIZE / 4 - 1. Fix the bounds check
>> accordingly.
>>=20
>> In atmel_sha204a_otp_read(), propagate the actual error code from
>> atmel_i2c_init_read_otp_cmd() instead of -1. Also, return -EIO =
instead
>> of -EINVAL when the device is not ready.
>>=20
>> Cc: stable@vger.kernel.org
>> Fixes: e05ce444e9e5 ("crypto: atmel-sha204a - add reading from otp =
zone")
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>> ---
>> [...]
>>=20
>> @@ -106,7 +107,7 @@ static int atmel_sha204a_otp_read(struct =
i2c_client *client, u16 addr, u8 *otp)
>>=20
>>    if (cmd.data[0] =3D=3D 0xff) {
>>            dev_err(&client->dev, "failed, device not ready\n");
>> -               return -EINVAL;
>> +               return -EIO;
> The cmd.data holding 0xff here is not a bus error. AFAIR it can have
> to do with the locking state, pre-initialization,
> typically the atmel watchdog kicked in / timeout, etc - so the
> response is invalid, although hardware connection (I2C) is
> supposed to work. Currently the caller of this function does not
> distinguish anyway.
>=20
> But why is EIO preferable here, over EINVAL?

AFAIK, -EINVAL is used for invalid arguments or bad input passed by the
caller, which is why the address range check returns -EINVAL.

-EIO signals an I/O error or communication failure, e.g., the caller
passed a valid address, but the device isn't ready yet, for whatever
reason. Maybe -EAGAIN or -EBUSY instead? -EIO seemed like the most
reasonable choice to me.

Since the error code will be propagated by my other patch [1], now would
probably be a good time to adjust it.

Thanks,
Thorsten

[1] =
https://lore.kernel.org/lkml/20260216074552.656814-1-thorsten.blum@linux.d=
ev/


