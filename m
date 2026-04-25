Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC95FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 14:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7EYHlbPqa3p4xG3vXYgj2RaDIlHF5g4oGE6OypAL558=; b=GLA6wEs8lH7cAjAStOF7KN+Fkc
	e8H02yln/11eiVCWC5dPMTw2zbQuB20mUDoHBvvVq4qdbjIlBqI6LD29JqcPrzYSJ4QfbkYrllKyx
	hbyL8Rp4V/fPe5vulqFMbLASOsXE0Qmcjh1Ob4x5oQttTuMg/RneXFMnHVJaK7v5mshkhgWUcGEoj
	EKESt3ir0Z+wHCZTPPaO/QqBZxprL6bGKZzhSuVdpopBFZ0R0wSpBSroiXNeCj9yfjhrE9Ind3/7i
	VdOwToL1Vo07VRPzb+y+mdRx3iAbAy3/+5Fb6puRg6SnTS6YcdWzl1BEy5fRrtQqlhebRbYjUgP/Y
	TXxDjLiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGdjT-0000000EV8c-09Uv;
	Sat, 25 Apr 2026 14:11:43 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGdjR-0000000EV8C-1lGs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 14:11:42 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-6470d549e10so1262018d50.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 07:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777126300; cv=none;
        d=google.com; s=arc-20240605;
        b=F4TTm+bx28ig1zz/3IdZje88YlyV9n0w9zJHSCSsMzglxdEXpw68u7st10E/SsVRih
         +R2Rtq10BDYgYyZ0pjX/bw/98yDKsuOLDETJOziphoFy37q3Krournif5+GnkUMu0MIf
         VCH+LRYXiD+PUsV2p9YpRJfKbwA/oPENvfMb7ZTecyG96V6NOJx86Sw95hZsVKW0G2Ij
         66sQD7f4kopNI1wDFGBonRBpZVLVuQsmk7n3cptzNuVamvu5gHxUrJRDLMOPkooY53q/
         9ERbVoMhdWp/l7MIedP8O5MEUOy4OSRn5Hz98LVHlpxlM7fJEc41ieUzH22oj27gihRA
         znWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7EYHlbPqa3p4xG3vXYgj2RaDIlHF5g4oGE6OypAL558=;
        fh=BYJmKt2BXkC+JEX8giiuedsp7JAZTvSIzfe5Z4AJ0NI=;
        b=gzayuGOKb7QSyKYwGsuDxIH6N/DV5Y75X0wS33XUrKkarQ0+ySQpsc6eGNrHc5I+se
         nKQP1mhFMFQfLCrRC23yjm+p73HicpI+DvAh1toWk/FHaxSb7RwhcsfQPYuR0BaBIqPM
         uqKsP6b8k7/mtUI/ft8FhrtGW408D11WJfGtnAJGKVYuCeL8FTJeXinxT9trwYpozre6
         lpJo87bjcFcMcJMgMAVVd+tIZMMZiLPeBvoPTCEMQ8rvCglGuRMsMP2vJbspaIOPXfov
         vmMxJZw6wdQxFAfWkZt3OKpmCtWpapzGgj/LTfsuK8SRw75pzqMgNx9kZCmGUAInaP/I
         14ew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777126300; x=1777731100; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7EYHlbPqa3p4xG3vXYgj2RaDIlHF5g4oGE6OypAL558=;
        b=kWzvPtHgXBurSzxmTAjFAvrDjYOMjfBEv3iDZ60xZ0nTJ6jPMT7i3Jwlm9vZpj1e2P
         6uRUH1YwnGLImzsWmQIis5jLuHcHnT9hN7G651QPfBgbvUoNbJzcvxkASGsZ1boFN18X
         RL1a3caIOkj42NdWnUDL2xpVWr/bj+h1BJJed8oBpHD6xniBIxHSJIzae71aDPUfyGRq
         Qxsg+uqqF/uo/rf47t7gIfZj442T0dV1kRSYdNHgYYF8uaWxw40q0AXwpxESrKXclvob
         31Lhfz+cCoBAmSmHq0O8JMdXsm92mYLamDV06ShvMTWTqPKsAbNa3848bon/uro2VEvA
         pVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777126300; x=1777731100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7EYHlbPqa3p4xG3vXYgj2RaDIlHF5g4oGE6OypAL558=;
        b=fMShuVGpSs53izqrcpsHpdTPUk9KNDjHqRYDasmywxWZbVyVTftQLxYC0tiMQuH8jU
         fGTyMWSG/v6UC7jlT5gNgnnht4mr8F+cx1jNlqIief2zwzGNTZk7oCWLAiNY9IVtLfhm
         1axoqlPO07Lx8ni7qZt1oHyFdKdBLvXx1PFZ9XE575UaA1Sewx3Bv2+6o9YGYlk58kuC
         X/G7vIe9AZhKheOAYOgsMnI+Qk2uNEwU+qFXsEQ9HM4Ny9acWqWcIpHHWaF/AP+f3Lqs
         wAnYbRdN6vTN6NCQitFT2jI0Ety+XS1uBqR5jYXrWr/hlJ8exoHxXkS5UEzHrk0PZ3D+
         9lKA==
X-Forwarded-Encrypted: i=1; AFNElJ8T8Lx6tTTmXuZovDhqLcxekJ3yiSjEyQ9es7Nl2qDbLjc4Mc+/kgi9R1DfzWmfLKpZXK5ynTBOEQ8Cww/WIwOh@lists.infradead.org
X-Gm-Message-State: AOJu0YxJxj1Bby9SWBYzSE6aDlqlvXYrnm/BJ9DwtaD8AE61WxK3lz1i
	Rt3vYsxQ14Xm7BbhcK2D/8QACEIWOGySpaiMgwkHvXR6vj1X+9H2rNDd2GtYvzaI4Z6EKiXYIBM
	DVT6KWT5STCy5csvVmcmDg0eWOCLSWJM=
X-Gm-Gg: AeBDievzrkxV7fR/VT95B+jEqSB5XOg9wAJuisAVWH0q/c2+JoRtPYizCy1+Svx/hgl
	IjHjpOZ7PY3/M/vS9FYQO2iSJDv5WDOmvzbElQqK5oWjhnXCIkz1eU5Xx3q5hMhhPPC8MyQRiW6
	Z6IqN0AwDXwDl2/Bx99ZpubHRa4Gh5BK1YEA78emOyhkjuMq7czJKUT91dVMV2DqYUf+0f2DMIa
	Hg2Qdd37boFH+1cwaD0Afk4KH3jcekvVziNSxt0sjYrEuRCPe9jZAHwTsrq03QEZJYpfPAuQbSy
	Tyn6dG2K8DIMw5w=
X-Received: by 2002:a05:690e:130d:b0:651:bb8f:743f with SMTP id
 956f58d0204a3-653107c15e9mr22710224d50.1.1777126300230; Sat, 25 Apr 2026
 07:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260422210936.20095-1-l.rubusch@gmail.com> <20260422210936.20095-3-l.rubusch@gmail.com>
 <aezFsF8gLkABZZ1O@linux.dev>
In-Reply-To: <aezFsF8gLkABZZ1O@linux.dev>
From: Lothar Rubusch <l.rubusch@gmail.com>
Date: Sat, 25 Apr 2026 16:11:04 +0200
X-Gm-Features: AQROBzA9bYbkmLhKL7_Xzf1pHwgDKe9ObTv_Mco1PkAMHTOhGYRQ2E1mPJCUc70
Message-ID: <CAFXKEHZ+tkSWfm858shA4PCK+nz-0gHg=qVRKcGbX+OW6Rg=KA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] crypto: atmel-sha204a - fix truncated 32-byte
 blocking read
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, ardb@kernel.org, linusw@kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_071141_471826_67FC8A8A 
X-CRM114-Status: GOOD (  35.58  )
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

Hi Thorsten!

On Sat, Apr 25, 2026 at 3:46=E2=80=AFPM Thorsten Blum <thorsten.blum@linux.=
dev> wrote:
>
> Hi Lothar,
>
> On Wed, Apr 22, 2026 at 09:09:35PM +0000, Lothar Rubusch wrote:
> > The ATSHA204A returns a 35-byte packet consisting of a 1-byte count,
> > 32 bytes of entropy, and a 2-byte CRC. The current blocking read
> > implementation was incorrectly copying data starting from the
> > count byte, leading to offset data and truncated entropy.
> >
> > Additionally, the chip requires significant execution time to
> > generate random numbers, going by the datasheet. Reading the I2C bus
> > too early results in the chip NACK-ing or returning a partial buffer
> > followed by zeros.
> >
> > Verification:
> > Tests before showed repeadetly reading only 8 bytes of entropy:
> > $ head -c 32 /dev/hwrng | hexdump -C
> > 00000000  02 28 85 b3 47 40 f2 ee  00 00 00 00 00 00 00 00  |.(..G@....=
......|
> > 00000010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..........=
......|
> > 00000020
> >
> > After this patch applied, the result will be as follows:
> > $ head -c 32 /dev/hwrng | hexdump -C
> > 00000000  5a fc 3f 13 14 68 fe 06  68 0a bd 04 83 6e 09 69  |Z.?..h..h.=
...n.i|
> > 00000010  75 ff cf 87 10 84 3b c9  c1 df ae eb 45 53 4c c3  |u.....;...=
..ESL.|
> > 00000020
> >
> > Fix these issues by:
> > Increase cmd.msecs to 30ms to provide sufficient execution time. Then
> > set cmd.rxsize to RANDOM_RSP_SIZE (35 bytes) to capture the entire
> > hardware response. Eventually, correct the memcpy() offset to index 1 o=
f
> > the data buffer to skip the count byte and retrieve exactly 32 bytes of
> > entropy.
> >
> > Fixes: da001fb651b0 ("crypto: atmel-i2c - add support for SHA204A rando=
m number generator")
> > Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
>
> Thank you for your patches. I tested patch 2/3 on real hardware and it
> fixes rngtest for me. However, I have a few comments below.
>
> > ---
> >  drivers/crypto/atmel-sha204a.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha2=
04a.c
> > index 19720bdd446d..f7dc00d0f4cd 100644
> > --- a/drivers/crypto/atmel-sha204a.c
> > +++ b/drivers/crypto/atmel-sha204a.c
> > @@ -19,6 +19,9 @@
> >  #include <linux/workqueue.h>
> >  #include "atmel-i2c.h"
> >
> > +#define ATMEL_RNG_BLOCK_SIZE 32
> > +#define ATMEL_RNG_EXEC_TIME 30
> > +
> >  static void atmel_sha204a_rng_done(struct atmel_i2c_work_data *work_da=
ta,
> >                                  void *areq, int status)
> >  {
> > @@ -91,13 +94,15 @@ static int atmel_sha204a_rng_read(struct hwrng *rng=
, void *data, size_t max,
> >       i2c_priv =3D container_of(rng, struct atmel_i2c_client_priv, hwrn=
g);
> >
> >       atmel_i2c_init_random_cmd(&cmd);
> > +     cmd.msecs =3D ATMEL_RNG_EXEC_TIME;
> > +     cmd.rxsize =3D RANDOM_RSP_SIZE;
>
> atmel_i2c_init_random_cmd() already sets cmd.rxsize to RANDOM_RSP_SIZE.
>
> Changing cmd.msecs does not appear to be strictly necessary for the fix.
> The only difference I observe is that rngtest runs faster with the new
> value.
>
> Here are my test results without changing cmd.msecs:
>
> $ sudo head -c 300000 /dev/hwrng | rngtest -c 100
> [...]
> rngtest: starting FIPS tests...
> rngtest: bits received from input: 2000032
> rngtest: FIPS 140-2 successes: 100
> rngtest: FIPS 140-2 failures: 0
> [...]
> rngtest: input channel speed: (min=3D1.118; avg=3D3.746; max=3D6510416.66=
7)Kibits/s
> rngtest: FIPS tests speed: (min=3D26.272; avg=3D27.471; max=3D32.829)Mibi=
ts/s
> rngtest: Program run time: 538942640 microseconds
>
> and with 'cmd.msecs =3D ATMEL_RNG_EXEC_TIME':
>
> $ sudo head -c 300000 /dev/hwrng | rngtest -c 100
> [...]
> rngtest: starting FIPS tests...
> rngtest: bits received from input: 2000032
> rngtest: FIPS 140-2 successes: 100
> rngtest: FIPS 140-2 failures: 0
> [...]
> rngtest: input channel speed: (min=3D1.584; avg=3D5.295; max=3D6510416.66=
7)Kibits/s
> rngtest: FIPS tests speed: (min=3D26.602; avg=3D27.321; max=3D28.257)Mibi=
ts/s
> rngtest: Program run time: 381309284 microseconds
>
> >       ret =3D atmel_i2c_send_receive(i2c_priv->client, &cmd);
> >       if (ret)
> >               return ret;
> >
> > -     max =3D min(sizeof(cmd.data), max);
> > -     memcpy(data, cmd.data, max);
> > +     max =3D min_t(size_t, ATMEL_RNG_BLOCK_SIZE, max);
> > +     memcpy(data, &cmd.data[1], max);
>
> This works and fixes rngtest for me on real hardware.
>
> min_t() is not strictly necessary here, since the types are compatible
> and min() is sufficient.
>
> I agree with Ard that patch 2/3 should be a separate patch for easier
> stable backporting.
>

I appreciate your answers and will take the review into account. Looks
like we had similar plans for
this weekend. So, since I answered to Ard quite in parallel to your
review, I'll restructure as I said in my
last mail on this list. I'll go through your comments and think about it.

Best,
L




> Thanks,
> Thorsten

