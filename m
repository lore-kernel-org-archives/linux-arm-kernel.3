Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5DDFF8860
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 13:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGQ1Nkb49nhA/wS/U7QyGOOaUJyCf1SaXvIle7aKzjQ=; b=I8KQuhGv/1QJ2L5hgZFHm+Gwnl
	zyzlmDvVt+UUsnDcWjz6EI5Wa1QmSC8QP+7huHy1wPwC9mtFtNAtYdLRU+vXl+maMJITSXiNIZt9h
	rREwqiao+HlPyvb2dptqKfaqa5HwPHp8PdtuvCR3rzjrVh2rL8v3q4LN1GHgcZD4Vfe0Ooi9IskRt
	cTGDYKlXvul5JytzA4TevWTITpRayffupEzZ1DPf/GGd1uuODGXYIUuI4g8j0bFUTqmvrZHUpV94T
	iX8yG31rIvRwhBCsDLn7oILp7Tk6f7pwJ7JvEdzQSk6vTr6WnpBVxrfStf6ElooX4rL5zBiZvDLUP
	Y6cuSI/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGd9k-0000000ETn1-2E6x;
	Sat, 25 Apr 2026 13:34:48 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGd9h-0000000ETme-15Xh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 13:34:46 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-64ebdab2ecfso1080071d50.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 06:34:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777124083; cv=none;
        d=google.com; s=arc-20240605;
        b=b7YiIXQ1nKsX43adbmE0rxMGVl/grkJW2gCfC2kTXYrwJZrPxbnfVfTIpCejrmcAFH
         Rym9Y+OGx5GkBvShMUTrhpY/EDfZu6nFDpqQnVMlVuG+Q5Zngkx+jsSH5iSuhlO/ijcc
         XE1ywHgmCRoVN/JNyOO/XZQYJfaByCuTXvRZxguXrWlJMSxvetMfSif0x1uBcI9JmOKD
         dU+pmzB3rlPxAjRLZBmNNT0LlZrq604UbrWqp7QcAdLC5Y+udyXVWBg5L4WHJhJcIdN2
         ZmQTgYoDHVP5HATzZXz0Y8x1PESYf1KD51D5v+Eh5eNENA1rz9MTmZgenspMZLBOlLNq
         5OPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aGQ1Nkb49nhA/wS/U7QyGOOaUJyCf1SaXvIle7aKzjQ=;
        fh=nzTRJFsUMm8UwtTi19jQtKJ04DHFXb0cD0SL5nhcD/k=;
        b=aDfxzsm1eyca1lG8ssOMchX7oGAxnwPrZHZUpcFr83GGehlhNXBXZqQxGauOFokqKd
         2mGHpI8j06gy7zJbW+cOBQLdBu3TP1XrHpVkZorWmodz3rtv6r4OTIigmth1QyTOaxNV
         U+yRnfZvLKYR9PX7yI63mXgrZRWGAhTlKivWQxAK4XnwPjkK4A1nzvrn+qZ24jW8Ake/
         c/4av/bc9bvTY3rmIskB5vifyBkn6seTDWdjLyUJaEhusDRo2H7NK/2bdd99e8bpYzbe
         /FjwN/OCYuVRGTTH6mP+yTJvEuEDvmYgXrmkhhU3m5kr2DuLujZkhfGcP/kUeFtvlqHX
         XKQg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777124083; x=1777728883; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGQ1Nkb49nhA/wS/U7QyGOOaUJyCf1SaXvIle7aKzjQ=;
        b=dp1TZ0TxgI4XU9FWrgRCqPaYTJ+w7KKPJqIIkpHFXbIOBWtZgewfBEhXLZwpOygRKl
         llfjgafcROZWFc9Ic3J/AJdZKOlNcUPjw1vVZVeJOcRo5R4IP42WKLWopF7wXVf7Y1mu
         RLY8L1EH+XaBjedmuC7gm2HctM/ykBUHGemYE1B+nEihN+i5ECkWhnGW5eM8dqW6U/Uv
         K3hSoDqdop/rf5CBJKEV5z6ntmFqSVXAnCFzFJcNm1XKPryi5LNH47X+HFLLZwQcuTf9
         LPzmkY6AU5X7hwJaORJgZLZmq//5EPXY2LyIodi9t1gaY1j+zCECS5MRqLQ7UlgGDu6j
         TWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777124083; x=1777728883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aGQ1Nkb49nhA/wS/U7QyGOOaUJyCf1SaXvIle7aKzjQ=;
        b=eI8QQG4d3QbsaR7Izi+36emzcz3g5BI75YoIRB3rmKGymeBefEGXokmBqDcnfkUKqG
         MNzN5ZvXtwbgGKgFcAw/+ev0N+0AbV1FvzMwjEhTfa5/6f2D4mw1CgdATaEuC2WhbQ+C
         u7fvWPe6F67QuiX9grtyIQe87EvEC9E+J5kRp06SsJvlFUHN9BzVNUXYmUclKuQ/XSVC
         9OOCwaTkupwNppLluO/DjOJ/dBFHsp+MxyyYY8ffqvZ4IpgFBcLfojvMIN6dVPch/+3g
         NxPYPDwoxeqxG3Mut/bO6YZpNzcEW0fhPmkgg21TwAPuJkqd4Y+z8F6Pi7+Wk5745zYl
         cfHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QfZOAO3twj8QJHpDtk4G7wLTomOQCQyqNfH6l9qhwNT35vd+gtG8GEC42GGIR3jhftiFr98EhGYFMRj8zqGJj@lists.infradead.org
X-Gm-Message-State: AOJu0YzKEGmRla6iKI+FmWlO8V/s32DVa+Yx6L/P2MZGB8cIOZLs26Sx
	zV0QOtyHRhhi8jBsFKFETuZpkCpK1qbTY+0lHSCOHYz2ACXfNPVRWvbJLzsxTshbGvuZvh/9MQZ
	2EhM/W+kg4hf9r8ukSWbHrPpXaNfibxk=
X-Gm-Gg: AeBDietm6LIlYvMci2MbO0CH9Lbb1O/aT1Zb1eBRvNwv6R+VKJX8gCzo4c6sZ1CTjmc
	XRAxWm5VZQq2xgra1yiZxz5coeeeQS8ODEIKTjSdZujg6s/P8ftWDmv11Go8BRqcKTIvpwZj7kv
	F68FPNUVWMd0lspwJat8znDByvc9hzfWbt51Ki1fFGgvx+x8ACW8GSNSJwdNr4/D7Or0mDzC1+p
	sFAZ5P1lbdrs0/jIgKGC1mLeJYJI3leBsPUZdbAWZanrxxvfyR9pmjoPLC2SAlkUk0TQ8iiseQS
	SYikr04nCrwxV2jyyBipqM7jaw==
X-Received: by 2002:a05:690c:6c91:b0:79e:631e:67b with SMTP id
 00721157ae682-7b9ecfc22a0mr233059967b3.4.1777124083091; Sat, 25 Apr 2026
 06:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260422210936.20095-1-l.rubusch@gmail.com> <a82278e5-9b5e-4fb9-9e7a-800ef2898ec5@app.fastmail.com>
In-Reply-To: <a82278e5-9b5e-4fb9-9e7a-800ef2898ec5@app.fastmail.com>
From: Lothar Rubusch <l.rubusch@gmail.com>
Date: Sat, 25 Apr 2026 15:34:07 +0200
X-Gm-Features: AQROBzCmsBuaXju-NqY78Bw0VoyzGEz_6XU6QAWYP44UpTkOPq9HD768Tc8rUWE
Message-ID: <CAFXKEHbc74tB1pxuDmw9z-HWBQiktwwbo0ciN_rHQn2Y2D843A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] crypto: atmel-sha204a - multiple RNG fixes
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Thorsten Blum <thorsten.blum@linux.dev>, 
	davem@davemloft.net, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
	Linus Walleij <linusw@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_063445_339207_E56B8407 
X-CRM114-Status: GOOD (  45.89  )
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

Hi Ard and ML!

On Thu, Apr 23, 2026 at 11:25=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> w=
rote:
>
> Hi Lothar,
>
> On Wed, 22 Apr 2026, at 23:09, Lothar Rubusch wrote:
> > When testing the RNG functionality on the Atmel SHA204a hardware, I
> > found the following issues: rngtest reported failures and hexdump
> > reveiled only the first 8 bytes out of 32 provided actually entropy.
> >
> > Having a closer look into it, I found a (small) memory leak, missing
> > to free work_data, miss-reading of the count field into the entropy
> > fields and parts of the 32 random bytes staying 0 due to reading the
> > slow i2c device.
> >
> > The series proposes fixes and how fixed functionality can be/was
> > verified. Executing rngtest afterward showed a decent result, due
> > to the i2c bus a bit slow.
> >
> > All setups require selecting the Atmel-sha204a as active RNG.
> > $ cat /sys/class/misc/hw_random/rng_available
> >     3f104000.rng 1-0064 none
> >
> > $ echo 1-0064 > /sys/class/misc/hw_random/rng_current
> >
> > $ cat /sys/class/misc/hw_random/rng_current
> >     1-0064
> >
> > Testing RNG properties currently shows problematic results:
> > $ rngtest < /dev/hwrng
> >     rngtest 2.6
> >     Copyright (c) 2004 by Henrique de Moraes Holschuh
> >     This is free software; see the source for copying conditions.  Ther=
e is NO
> >     warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR =
PURPOSE.
> >
> >     rngtest: starting FIPS tests...
> >     rngtest: bits received from input: 1040032
> >     rngtest: FIPS 140-2 successes: 0
> >     rngtest: FIPS 140-2 failures: 52
> >     rngtest: FIPS 140-2(2001-10-10) Monobit: 52
> >     rngtest: FIPS 140-2(2001-10-10) Poker: 52
> >     rngtest: FIPS 140-2(2001-10-10) Runs: 52
> >     rngtest: FIPS 140-2(2001-10-10) Long run: 52
> >     rngtest: FIPS 140-2(2001-10-10) Continuous run: 52
> >     rngtest: input channel speed: (min=3D7.631; avg=3D7.804; max=3D7.82=
7)Kibits/s
> >     rngtest: FIPS tests speed: (min=3D32.273; avg=3D32.701; max=3D33.05=
6)Mibits/s
> >     rngtest: Program run time: 130177956 microseconds
> >
> > Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
> > ---
> > v2 -> v3: Removal blank line, rebased
> > v1 -> v2: Removal of C++ style comment (I saw it too late, sry for that=
)
> > ---
> > Lothar Rubusch (3):
> >   crypto: atmel-sha204a - fix memory leak at non-blocking RNG work_data
> >   crypto: atmel-sha204a - fix truncated 32-byte blocking read
> >   crypto: atmel-sha204a - fix non-blocking read logic
> >
> >  drivers/crypto/atmel-sha204a.c | 60 ++++++++++++++++++++++------------
> >  1 file changed, 39 insertions(+), 21 deletions(-)
> >
>
> Thanks for the report and the fixes. However, I'm not sure you are entire=
ly
> on the right track here. I managed to fix the rngtest issues that you rep=
ort by
> making the changes below. As I already replied, I think it would be bette=
r to
> propose this as a standalone patch, and backport it to stable.
>

Thank you so much for taking the time and answering, I really appreciate!

Like two months ago I started playing a bit more with these Atmel i2c
devices. Actually I wanted to prepare something
different (and still pretend doing so). Figuring out things here, I
noticed this RNG feature did not work as I expected.
Around that time I prepared this patch set.
Probably, I was a bit too euphoric - I mean, it's a bit unlikely the
driver was upstreamed and never really worked.
I have to admit, I did not go thoroughly through the git history
first, since the driver does not do significantly more than
RNG, there must have happened a degradation. I'll keep this in mind:
first to build up better understanding of the driver
history. than to start digging into the code. Anyway, I wanted to get
some feedback.

> The remaining changes are somewhat debatable IMO: the leak is not really =
a leak,
> so I'd like to understand better what you are fixing here. The command fi=
eld
> changes seems completely misguided (unless I am missing something)
>

So, firstly in the current RNG implementation I definitely see an
issue. If that's ok, I'll to prepare a patch to re-init probably
rather
to what you proposed, since it makes more sense to me now. Thank you
for pointing this out.

Secondly, I noticed the device is picky about its i2c communication
timings. Yes, definitely. Nowadays, after having worked with
it a bit more, I'd rather say generally reducing response time is
probably not the solution. I still think I see some timing issue,
which
I wanted to better address in an upcoming patch set (but probably not
related to this RNG thing). Currently the AtSHA204a and
the AtECC508a (and related families) are sharing the same Atmel i2c
driver. This core driver uses hardcoded max timings for
its i2c command operations. Going over the datasheets of both chips,
both have totally different max timings.
Currently just having RNG for AtSHA204a and ECDH and related for AtECC
- it probably doesn't matter too much. Anyway, also
read and write command timings differ and mix up then in the Atmel i2c
core driver. I guess, this was kind of a starting point for
me to dig deeper. So, I probably will drop that i2c timing change from
this RNG fix set.

Thirdly, the "leak" I think is probably rather a theoretic issue. I'll
sepearate it out, think over it, and in case prepare something,
let me then know what you think.

>
>
> --- a/drivers/crypto/atmel-sha204a.c
> +++ b/drivers/crypto/atmel-sha204a.c
> @@ -47,8 +47,8 @@
>
>         if (rng->priv) {
>                 work_data =3D (struct atmel_i2c_work_data *)rng->priv;
> -               max =3D min(sizeof(work_data->cmd.data), max);
> -               memcpy(data, &work_data->cmd.data, max);
> +               max =3D min(RANDOM_RSP_SIZE - CMD_OVERHEAD_SIZE, max);
> +               memcpy(data, &work_data->cmd.data[1], max);
>                 rng->priv =3D 0;
>         } else {
>                 work_data =3D kmalloc_obj(*work_data, GFP_ATOMIC);
> @@ -86,8 +86,8 @@
>         if (ret)
>                 return ret;
>
> -       max =3D min(sizeof(cmd.data), max);
> -       memcpy(data, cmd.data, max);
> +       max =3D min(RANDOM_RSP_SIZE - CMD_OVERHEAD_SIZE, max);
> +       memcpy(data, &cmd.data[1], max);
>
>         return max;
>  }

