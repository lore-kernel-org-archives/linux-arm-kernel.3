Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B253C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 14:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tKjcpDmSDVi0I0Iymsx6pKq7XeGCNlnh/DkEXq+Kvg=; b=As60XZh+RE3sBB/iDV0+UsvYtj
	HFdqiPrxxiOWlOoZoXpI3aO3R4Fd/4SCvk3u7Gn0QUwaUIiLYE4BPYE6paa5HdaDWjajioIEUZo8o
	rCL/Z+VmdzTvs75sk6De/KRRLIGFMQnZw+mr8d/NMNFBvGfvV3Qdb83cKtJz/LyQM2NTgu0mxivx2
	bEraW+biQbobiUddx4Rsj4MoeNR+YhI8Vyv2u1ejjK1U2TXwCPR8xS5ITd/xRfy3/KkFC8+sR+VGQ
	SFWNsp/69lXCfCuVOd1wClAAPCVN4mmtnYufFyVL2tzZtG13GxZyL6gDwl0mYxwjG6BPGjwjv2htM
	CNBoe6Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXhiO-00000008des-22yI;
	Tue, 14 Jan 2025 14:16:20 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXhXr-00000008b9p-39Yx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 14:05:29 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so7568705e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 06:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736863526; x=1737468326; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6tKjcpDmSDVi0I0Iymsx6pKq7XeGCNlnh/DkEXq+Kvg=;
        b=J6YPReEyVwhtvPLwoif+nRbUjeWO+1ZHeaGsEUs1VyNPSS4U9g2jjtdVBYeAGNTpBn
         HcUJXv0yxo/97zVMaUXRfmdrorvFPYxvOvKGhIqTnSvmPHOdAdtOcVzdCkRaATLXIUbP
         TNDG3jVdaA6ckTPkjsmaw1pXjNZ420UIPUaGXTdey/EluPcyL55ejNedexYTj5kwIMGT
         DfCkQGNzUBcdXHxSCnLLAf+m5SDE+lm7Ex2A4wtRmWSgB0okTbtFGHL8gjSD7MZMgY+3
         D5pH7ACzKHo8w5lkqJ2HuyFuPMFERuT/Rgqj+Z/IfRthKEfQ4wI2LPJHFcab3gAp44VQ
         QN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736863526; x=1737468326;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6tKjcpDmSDVi0I0Iymsx6pKq7XeGCNlnh/DkEXq+Kvg=;
        b=h+OIpPxHyhB2btbcpqri6JqEt1i8mHg+jE7mwoP3SeogPiigmD4aClI2ajv8G9U9Ad
         nc1TjuR+Orqm/ypzxivVfjiO40Rl95dhqOEoecU+ZYaCe2DRFcQheDJSiQDvdiEcyDWg
         ZfPfRHLwZ57CCHe9kIK5GWb/Wd1/dvp6GzkmGjaefikpF+pT9RZJ3fbxJl9M5mxgHvMc
         1tNmy0aZnydQzPJL4+ib7FHBjltDmYeJyj+qjioc+D0dSPDAbDHSVCPKD9uGX3sRiWy+
         kMTR5ZNPBjhH4kmoZAJdWdJoNU5PZGioHQGRpT8um9T9tVz3Dkc1SznexJmFIdbZnfdO
         wXPw==
X-Forwarded-Encrypted: i=1; AJvYcCXAV0vYfIsbdKGgHtHJVHudxmLQ6fNk+03QRVlBKx+KEC1MwJqPNTTBvSfhqKP/75sDr/uhHERGX1GP7WhScnny@lists.infradead.org
X-Gm-Message-State: AOJu0YzEKfBY78Z48BeqmZ7ugLsphnE7caENwRXkJKc/7pkyGjAqfBXy
	OsU7A6SVqXLMWFHERFzpA5aq4bYIZT+zRH7hP5bPBo0WfsW4GOpTDwDIdgkyoQU=
X-Gm-Gg: ASbGnctrQmo/DAY0UqJea8U6cR4VnwCu23C2egPUXcOZooWttiGNnf8o8sJjW19ALAf
	c4jMJXM7BUpGb+seu+GcBWE49s9y4nxT2mGCP+ixlwiq0PqXDihZpx2TryEqNGzqB8AYdYn7bH7
	JCjEwHl2tiZtlH4myjKjKo9aYpu5fMCrpxKEC96qdZ1YqDdaincLt0tcmZvZaqMz8516WFlKNHT
	Cf4DQDuQDnlHorDZxqnpOqvsst3tM+bpRAlYoTwPR0+X9D4n2IuRAAJ
X-Google-Smtp-Source: AGHT+IGYBCH61RKlTG9lkoFWiyGMe6exY5OKDG7Opi27JjRz3QS+q+QxKENJfYtPEqBwzJBVByTGvA==
X-Received: by 2002:a05:600c:1d03:b0:434:a0bf:98ea with SMTP id 5b1f17b1804b1-436e2699e91mr225375155e9.9.1736863525942;
        Tue, 14 Jan 2025 06:05:25 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:317c:3d93:b7d4:96cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddc5f5sm210760595e9.18.2025.01.14.06.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 06:05:25 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>,
  Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-sound@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 2/3] ASoC: meson: s4:support for the on-chip audio
In-Reply-To: <e69cd38e-898c-4cbc-a327-14148a71c764@amlogic.com> (Jiebing
	Chen's message of "Tue, 14 Jan 2025 19:20:00 +0800")
References: <20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com>
	<20250113-audio_drvier-v1-2-8c14770f38a0@amlogic.com>
	<1jwmey9451.fsf@starbuckisacylon.baylibre.com>
	<e2f26ca2-4c38-4b07-bf17-95544588a2f2@amlogic.com>
	<e69cd38e-898c-4cbc-a327-14148a71c764@amlogic.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 14 Jan 2025 15:05:24 +0100
Message-ID: <1j8qrd7aor.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_060527_792086_93EE5B2F 
X-CRM114-Status: GOOD (  21.72  )
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

On Tue 14 Jan 2025 at 19:20, Jiebing Chen <jiebing.chen@amlogic.com> wrote:

>>>> +
>>>> +MODULE_DESCRIPTION("Amlogic to codec driver");
>>>> +MODULE_AUTHOR("jiebing.chen@amlogic.com");
>>>> +MODULE_LICENSE("GPL");
>>>> diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
>>>> index
>>>> 571f65788c592050abdca264f5656d4d1a9d99f6..2db1cd18cf2cea507f3d7282054e=
03d953586648
>>>> 100644
>>>> --- a/sound/soc/meson/t9015.c
>>>> +++ b/sound/soc/meson/t9015.c
>>>> @@ -89,10 +89,7 @@ static struct snd_soc_dai_driver t9015_dai =3D {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 .channels_min =3D 1,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 .channels_max =3D 2,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 .rates =3D SNDRV_PCM_RATE_8000_96000,
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 .formats =3D (SNDRV_PCM_FMTBIT_S8 |
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 SNDRV_PCM_FMTBIT_S16_LE |
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 SNDRV_PCM_FMTBIT_S20_LE |
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 SNDRV_PCM_FMTBIT_S24_LE),
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 .formats =3D (SNDRV_PCM_FMTBIT_S16_LE |
>>>> SNDRV_PCM_FMTBIT_S32_LE),
>>> Again, mixed up changes with zero justification.
>>>
>>> This drops S8 and S16 format support for the existing SoCs (such as GXL)
>>> which is known to work and add S32 support on an HW documented as 24bits
>>> only. Can you explain ?
>
> for g12a, sm1 etc, it is use new audio ip, GXL is old ip,

If there are chips difference we did not know about, then you should
introduce those difference, without breaking existing support -
including for GXL, which is what you did IIUC.

> the new ip not support 24 bit,

Are sure about that ? that code has been there for a while.

If sm1 does not support SNDRV_PCM_FMTBIT_S24_LE, you should a fix up patch =
for
that, with the proper "Fixes:" tag, how to reproduce the problem and
explaining the fix.

>
> usually support 16/32 bit for new audio ip , for SNDRV_PCM_FMTBIT_S24_LE,
> it width =3D24, phy =3D32

Yes physical of SNDRV_PCM_FMTBIT_S24_LE, so most chip supporting 32 bits
width would support this S24_LE, unless there is something odd.

>
> it was=C2=A0 treated as 32 bit to send for tdm, so we can only add the S3=
2LE
> base on it , right ?

You are asking me ? How am I suppose to know ?

> but if the gxl not support the 32bit

I don't see a problem with a DAC taking input on 32bits physical
interface and ignoring some bit on processing.

If that's not the case, please send a proper fix change with some explanati=
on

>
> we need add new snd_soc_dai_driver t9015_dai_s4 ?
>

If I understood correctly format depends on the chip and needs to
adjusted including for sm1.=20

>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ops =3D &t9015_dai_ops,
>>>> =C2=A0 };
>>> -- Jerome

--=20
Jerome

