Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857BBC43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mc8cfwvLT4bAM4tk7++9grOS37/A0u8v1goWlPe04Vo=; b=svDjntSd0Af/BtfnFL1yzI4Qic
	hu/9Cp9b8KEeR/6BZasOC9GkDC7FMPBJ1BRWFBb8tlK/LrljTafUVfkj8MMB5UX0m0kYY1GxBYfyT
	IYnqevxyq/TUYg5gjSyLkLknjsLvQYnYr1Gyk18UTi0KZnAFmW7G66bgvHtyqA4cLVtfFLOMP7vlt
	VXxnnoW9svEW4zoiiLbZqQErT+GQ+8TLa47OjCwAQ/5yrzcPzCMM4i3CET/35Uu/pUBF8Ysxxt6q4
	nXzoPmZ0zD5dRrVO5p79sR+Qzdal6C6Syd4EZT40BSAMAlGqE6sIVHY5MZ5clFrCwJIp0hhJcHHei
	esd+/sug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUYL-0000000GN5m-2EUP;
	Tue, 30 Jun 2026 09:14:49 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUYI-0000000GN3i-0AB7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:14:47 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2c8c30492a0so36041525ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 02:14:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782810885; cv=none;
        d=google.com; s=arc-20260327;
        b=BT0OorqYejZZM4I3rHPgEs7KdRHPHv3SmCD71f5vPgWg9Tb3c4rPGsAlajWP+UUoMg
         jNSL4fByZqQ8P/NcjkxX+WhEA0Qdgupwwj9d9GvaXoTx26naeUcMKA6QMsWSGpWZTMu/
         mQFFM8hUBCOyveZiu+W4eTHN5vUtd1vExGbeC36VM2wU4tbnB74iEXx3+6GooBNQcHIV
         rq4AF38LwhPgkct6Ntt/FS5YSDRtSVy5oYocLa30NaL6UB2thvpuCSfKHTXuZki11R71
         Fnx8eJaiwCREw6EKLR1EFYqACSwFkANnzsPTfHXvrxcUTsb0k6x7QcZP9B9LtH4+JLEL
         Bt8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mc8cfwvLT4bAM4tk7++9grOS37/A0u8v1goWlPe04Vo=;
        fh=b3W355VaO4ejNig4GYg9ShTZd0b1FA5vinIM5vjvB8c=;
        b=F15TVemokAN1YwWUQ5o5lc2vLwZHfguE3SN2cqy0b9v6USG/0C0Iib66nFuFqfuzci
         jZOoOkOJAM71r2t6CJdmSQZQg+Z0aW1xrVkYN1IN8GvJGCE+sr/ZyBnFYarRmktu7af7
         UJp1QRbaIvXZQ4sMS3bwY1VRHiOwotUL2C7Q/guERwiqaJ4LxGl2JZtwSKUje0exA8SR
         Jo0XYpRmDqKgYNLYUaPIwd5t8B8N4f1WKJQB212Hc6rPxIWDna5XkUHyuqqcOSGCN7xp
         k2XrBJNxPauc2XBp04L1fxp98KZxmxh/0XEqjW9CSqvddGNoHUQ+526J/34q7ugzwBZh
         nwFg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782810885; x=1783415685; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mc8cfwvLT4bAM4tk7++9grOS37/A0u8v1goWlPe04Vo=;
        b=PtpXDbDtdjq0391tEKvPG4p7uLRz40nQsdKURCNnmNxYBEqgJ1TDg3MtEMBmCLd8rf
         1u6p+oiDyrXljMyr3gAEGLI0L3x39TLhmypn3h9oItiY0A625CQmRXKlFw9u1D6VYbK9
         umlwPh4aThEUNU5k5PAiqJfDFi7cBR0+aGM/ja+hjskBzzJ6QPLP+2bmqVcKLmvSGDr4
         6Ijvw5zNKCG9AAUXftjqjYx3T0FhOi0iG+w523NU50Ut2TWqbxrTlBzAp8BpwEG/3M6A
         PVJwkOuXir0YYvU+4Ni2fK2QtRQ8IJSKMxFPqYMUCed9qwJ7uL9OGbxHmB3w+p4kzBux
         ZUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782810885; x=1783415685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mc8cfwvLT4bAM4tk7++9grOS37/A0u8v1goWlPe04Vo=;
        b=E9vmBKPgxuygyVYyB1zhHPTvAVxcgHKfL07S+DBhSnW6x0aBBaG9YY+7mAYYiAvua6
         Kth7cl7rgVx2iTN8pzBVuiMskxgwDxeE8zymfia2TBBMGRG1as1ppEUIykt//jbx3CT0
         ICwCBnXslWNnz9U7sEZVh4JAZ2WiDiYg+qQLS2IzdnBwtLrZ+v89EuBGP/vUlp6xdHVa
         ZZ/qaV8NqrjrAbY1nbjpESHba00XfYE2TaoPVpQ7Qc5yzxuxGWkt/Dwgnm7BYGQPMmoV
         l1ggpd1BLaUZp67lDBXzdP88+cwI4BjvDN0B70MzhoNp64ecWZKXGp1z4x1or6AVUmlv
         Upkg==
X-Forwarded-Encrypted: i=1; AHgh+Rrk0s5p7xL6jO7Btgb6MatOvro2GaGnoMAX1BVJdsIa+THOd6zFDMlTkbwbJ13GjRRrCkxAsH8ekTsaq76DEkrP@lists.infradead.org
X-Gm-Message-State: AOJu0YwAUcClmPDtihn6CD5SpNvkaa8r9/VBOer+ONvWEoflRbJtQnw6
	CMjKYdLotCALeCP3SV62wlhwd9BKA54I6M5JN1nA8yCiz37ArhNqGUnHAHEG/r/0E/31yxesuib
	v7C7otH6tlyWyNiHdvCKxPfZJqPAIr+s=
X-Gm-Gg: AfdE7cnIRXw0SvHA6iQPWldyaYk03VPiH/HYmhxJVLaBToYVrNrBq5+2UxVJhiotxN5
	frS2xadwas0Mi/GFzIaH8P8HmnAQcp8Ve/1EZmCuJKH5wUkaDYi5QPqnq5KzWP7el1U8vfyNiaz
	5dObMH+8Fivhr1PyotzFgZugM9jWqAdgaWvPQEYtetJIXmCjtu9Lobus9c/C/19AaHx7waWCvpE
	QFQxIW4EBGuwlt68tUfIYcZU9AY6YBNo6B8kwOy0nIFAF/q+UgcsJUpjurdWyjHG0ebPXZOikgM
	ioBgarwECAXOvLAh46p1vs1GGnA=
X-Received: by 2002:a17:902:fd83:b0:2c9:97a7:3276 with SMTP id
 d9443c01a7336-2ca2ea335c2mr19419135ad.39.1782810884946; Tue, 30 Jun 2026
 02:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
 <20260630063449.503996-10-phucduc.bui@gmail.com> <20260630092821.650c30ec@bootlin.com>
In-Reply-To: <20260630092821.650c30ec@bootlin.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 30 Jun 2026 16:14:33 +0700
X-Gm-Features: AVVi8CdpcGsQO7j2elPBPz0Nft0JM37FEMmCfPqP7T8On5LblxvKpA_DrRSwZCQ
Message-ID: <CAABR9nG5Wo1Wb+2_T6dR+6XTw8Vs9awSpQrSZ+k6=jp_ogoGCw@mail.gmail.com>
Subject: Re: [PATCH 09/27] ASoC: codecs: idt821034: Use guard() for mutex locks
To: Herve Codina <herve.codina@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_021446_096917_7F73A2DC 
X-CRM114-Status: GOOD (  27.00  )
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

On Tue, Jun 30, 2026 at 2:28=E2=80=AFPM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> Hi,
>
> On Tue, 30 Jun 2026 13:34:31 +0700
> phucduc.bui@gmail.com wrote:
>
> > From: bui duc phuc <phucduc.bui@gmail.com>
> >
> > Clean up the code using guard() for mutex locks.
> > Merely code refactoring, and no behavior change.
> >
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
> >  sound/soc/codecs/idt821034.c | 121 +++++++++++++++--------------------
> >  1 file changed, 51 insertions(+), 70 deletions(-)
> >
> > diff --git a/sound/soc/codecs/idt821034.c b/sound/soc/codecs/idt821034.=
c
> > index 084090ccef77..078de6c9c395 100644
> > --- a/sound/soc/codecs/idt821034.c
> > +++ b/sound/soc/codecs/idt821034.c
> > @@ -6,6 +6,7 @@
> >  //
> >  // Author: Herve Codina <herve.codina@bootlin.com>
> >
> > +#include <linux/cleanup.h>
> >  #include <linux/bitrev.h>
> >  #include <linux/gpio/driver.h>
> >  #include <linux/module.h>
>
> Alphabetic order. Move <linux/cleanup.h> after <linux/bitrev.h>.
>
> ...
>
> > @@ -456,7 +457,7 @@ static int idt821034_kctrl_gain_put(struct snd_kcon=
trol *kcontrol,
> >
> >       ch =3D IDT821034_ID_GET_CHAN(mc->reg);
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       if (IDT821034_ID_IS_OUT(mc->reg)) {
> >               amp =3D &idt821034->amps.ch[ch].amp_out;
> > @@ -466,21 +467,18 @@ static int idt821034_kctrl_gain_put(struct snd_kc=
ontrol *kcontrol,
> >               gain_type =3D IDT821034_GAIN_TX;
> >       }
> >
> > -     if (amp->gain =3D=3D val) {
> > -             ret =3D 0;
> > -             goto end;
> > -     }
> > +     if (amp->gain =3D=3D val)
> > +             return 0;
> >
> >       if (!amp->is_muted) {
> >               ret =3D idt821034_set_gain_channel(idt821034, ch, gain_ty=
pe, val);
> >               if (ret)
> > -                     goto end;
> > +                     return ret;
> >       }
> >
> >       amp->gain =3D val;
> >       ret =3D 1; /* The value changed */
> > -end:
> > -     mutex_unlock(&idt821034->mutex);
> > +
> >       return ret;
>
> Instead of
>         ret =3D 1; /* The value changed */
>         return ret;
>
> Call directly
>         return 1; /* The value changed */
>
> >  }
>
> ...
> > @@ -521,7 +519,7 @@ static int idt821034_kctrl_mute_put(struct snd_kcon=
trol *kcontrol,
> >       ch =3D IDT821034_ID_GET_CHAN(id);
> >       is_mute =3D !ucontrol->value.integer.value[0];
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       if (IDT821034_ID_IS_OUT(id)) {
> >               amp =3D &idt821034->amps.ch[ch].amp_out;
> > @@ -531,20 +529,17 @@ static int idt821034_kctrl_mute_put(struct snd_kc=
ontrol *kcontrol,
> >               gain_type =3D IDT821034_GAIN_TX;
> >       }
> >
> > -     if (amp->is_muted =3D=3D is_mute) {
> > -             ret =3D 0;
> > -             goto end;
> > -     }
> > +     if (amp->is_muted =3D=3D is_mute)
> > +             return 0;
> >
> >       ret =3D idt821034_set_gain_channel(idt821034, ch, gain_type,
> >                                        is_mute ? 0 : amp->gain);
> >       if (ret)
> > -             goto end;
> > +             return ret;
> >
> >       amp->is_muted =3D is_mute;
> >       ret =3D 1; /* The value changed */
> > -end:
> > -     mutex_unlock(&idt821034->mutex);
> > +
> >       return ret;
>
> Instead of
>         ret =3D 1; /* The value changed */
>         return ret;
>
> Call directly
>         return 1; /* The value changed */
>
> >  }
> >
> > @@ -629,7 +624,7 @@ static int idt821034_power_event(struct snd_soc_dap=
m_widget *w,
> >       ch =3D IDT821034_ID_GET_CHAN(id);
> >       mask =3D IDT821034_ID_IS_OUT(id) ? IDT821034_CONF_PWRUP_RX : IDT8=
21034_CONF_PWRUP_TX;
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       power =3D idt821034_get_channel_power(idt821034, ch);
> >       if (SND_SOC_DAPM_EVENT_ON(event))
> > @@ -638,8 +633,6 @@ static int idt821034_power_event(struct snd_soc_dap=
m_widget *w,
> >               power &=3D ~mask;
> >       ret =3D idt821034_set_channel_power(idt821034, ch, power);
> >
> > -     mutex_unlock(&idt821034->mutex);
> > -
> >       return ret;
>
> Instead of
>         ret =3D idt821034_set_channel_power(idt821034, ch, power);
>         return ret;
>
> return directly:
>
>         return idt821034_set_channel_power(idt821034, ch, power);
>
> and remove the 'ret' variable (no more used)
>
> >  }
> >
>
> ...
> > @@ -771,7 +764,7 @@ static int idt821034_dai_set_fmt(struct snd_soc_dai=
 *dai, unsigned int fmt)
> >       u8 conf;
> >       int ret;
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       conf =3D idt821034_get_codec_conf(idt821034);
> >
> > @@ -785,12 +778,10 @@ static int idt821034_dai_set_fmt(struct snd_soc_d=
ai *dai, unsigned int fmt)
> >       default:
> >               dev_err(dai->dev, "Unsupported DAI format 0x%x\n",
> >                       fmt & SND_SOC_DAIFMT_FORMAT_MASK);
> > -             ret =3D -EINVAL;
> > -             goto end;
> > +             return -EINVAL;
> >       }
> >       ret =3D idt821034_set_codec_conf(idt821034, conf);
> > -end:
> > -     mutex_unlock(&idt821034->mutex);
> > +
> >       return ret;
>
> Instead of
>         ret =3D idt821034_set_codec_conf(idt821034, conf);
>         return ret;
>
> return directly:
>         return idt821034_set_codec_conf(idt821034, conf);
>
> and remove the 'ret' variable.
>
> >  }
> >
> > @@ -802,7 +793,7 @@ static int idt821034_dai_hw_params(struct snd_pcm_s=
ubstream *substream,
> >       u8 conf;
> >       int ret;
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       conf =3D idt821034_get_codec_conf(idt821034);
> >
> > @@ -816,12 +807,10 @@ static int idt821034_dai_hw_params(struct snd_pcm=
_substream *substream,
> >       default:
> >               dev_err(dai->dev, "Unsupported PCM format 0x%x\n",
> >                       params_format(params));
> > -             ret =3D -EINVAL;
> > -             goto end;
> > +             return -EINVAL;
> >       }
> >       ret =3D idt821034_set_codec_conf(idt821034, conf);
> > -end:
> > -     mutex_unlock(&idt821034->mutex);
> > +
> >       return ret;
>
> Idem here:
>         return idt821034_set_codec_conf(idt821034, conf);
>
> and remove 'ret'.
>
>
> >  }
> >
> > @@ -897,11 +886,11 @@ static int idt821034_reset_audio(struct idt821034=
 *idt821034)
> >       int ret;
> >       u8 i;
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       ret =3D idt821034_set_codec_conf(idt821034, 0);
> >       if (ret)
> > -             goto end;
> > +             return ret;
> >
> >       for (i =3D 0; i < IDT821034_NB_CHANNEL; i++) {
> >               idt821034->amps.ch[i].amp_out.gain =3D IDT821034_GAIN_OUT=
_INIT_RAW;
> > @@ -909,23 +898,22 @@ static int idt821034_reset_audio(struct idt821034=
 *idt821034)
> >               ret =3D idt821034_set_gain_channel(idt821034, i, IDT82103=
4_GAIN_RX,
> >                                                idt821034->amps.ch[i].am=
p_out.gain);
> >               if (ret)
> > -                     goto end;
> > +                     return ret;
> >
> >               idt821034->amps.ch[i].amp_in.gain =3D IDT821034_GAIN_IN_I=
NIT_RAW;
> >               idt821034->amps.ch[i].amp_in.is_muted =3D false;
> >               ret =3D idt821034_set_gain_channel(idt821034, i, IDT82103=
4_GAIN_TX,
> >                                                idt821034->amps.ch[i].am=
p_in.gain);
> >               if (ret)
> > -                     goto end;
> > +                     return ret;
> >
> >               ret =3D idt821034_set_channel_power(idt821034, i, 0);
> >               if (ret)
> > -                     goto end;
> > +                     return ret;
> >       }
> >
> >       ret =3D 0;
> > -end:
> > -     mutex_unlock(&idt821034->mutex);
> > +
> >       return ret;
>
> Instead of
>         ret =3D 0;
>         return ret;
>
> return directly
>         return 0;
>
> >  }
> >
> ...
>
> >
> > @@ -1079,23 +1061,22 @@ static int idt821034_reset_gpio(struct idt82103=
4 *idt821034)
> >       int ret;
> >       u8 i;
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       /* IO0 and IO1 as input for all channels and output IO set to 0 *=
/
> >       for (i =3D 0; i < IDT821034_NB_CHANNEL; i++) {
> >               ret =3D idt821034_set_slic_conf(idt821034, i,
> >                                             IDT821034_SLIC_IO1_IN | IDT=
821034_SLIC_IO0_IN);
> >               if (ret)
> > -                     goto end;
> > +                     return ret;
> >
> >               ret =3D idt821034_write_slic_raw(idt821034, i, 0);
> >               if (ret)
> > -                     goto end;
> > +                     return ret;
> >
> >       }
> >       ret =3D 0;
> > -end:
> > -     mutex_unlock(&idt821034->mutex);
> > +
> >       return ret;
>
> return 0;
>
> >  }
> >
>
> Best regards,
> Herv=C3=A9
>

Hi Herv=C3=A9,

Thank you for the very detailed review.
I hadn't realized I had missed so many issues.
I'll fix them all and include the updates in v2.

Best regards,
Phuc

