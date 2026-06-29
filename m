Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891F6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 14:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWhKW2eNrkhNPnZK/AJGOmyvgWT8TkmGzQ6dgobIakQ=; b=HgH39g+MvB2oqsl5nyV7ZGMTzC
	ZjQaAPrOHxEse5UZoGJEgxgDCkRUb5KQJ+JFinQq6ywc5+8p93jwel9WGxVArOSXbSwKX5QIOCWaM
	ToRGi2R69Oyal9OX2Lp19WefAZVNNLw4mHK5EwLtshxYDvkZl//0Q+ZXXZ4jcXO4SlUWMmnTM7T18
	3WSnJdcPjxPZ98maZ6/Fe02gB8IWbthBNMpDDp5VvAYXRHFTkKvq1TbISyxB4d9Laxsq3rWhlpT9M
	Cv+fsuu/tA9kvEMCZzuavOX3X1+VwX6ADIZnJD2wN+TqL1SZ8rSrRdDjHj+QGMP+s2nZnptvjMEiv
	5dPLxdcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDHN-0000000Evr8-0n95;
	Mon, 29 Jun 2026 14:48:09 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDHL-0000000Evq8-11Py
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 14:48:08 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-493a613571eso12809035e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 07:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782744485; x=1783349285; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWhKW2eNrkhNPnZK/AJGOmyvgWT8TkmGzQ6dgobIakQ=;
        b=jSqu8OK5dmZTnlKNyu7cH8G+0GcaolJopd8PSwxoi009U57GlvKMXIQA1zutGvUxea
         4SJLj0ShVn8BBFGeGfr7+O+gQjRzOUt1eTO+nhH2K5bosO00wyqhb+o8W0imcpd2Sfwp
         mgONbeNz3GhiTKBzOF05fbTjdtchnWiZNtaWACObdNNsTKD7OurRxuIcmtBde2RyAJDl
         N+5EXHhwm6AWHH/Tk81phO56vU1u9r4/pWshc+vl8E1e6Jvj4y5k5nfNbSe4ZKfx5Ni8
         cFevigonzJZIXLkiU0iqJBMhSUhpdAo3i69K/79s2XKQDN5mKhmZcxWY5i9FD+Z+3Zbc
         ZYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744485; x=1783349285;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QWhKW2eNrkhNPnZK/AJGOmyvgWT8TkmGzQ6dgobIakQ=;
        b=JYQAqdFpHh+si3BKUC15gKdNfitueqa2eBRBbmJj7q5gKHDB0c6+8jqZ2bMlW62DKr
         UQiulgzTlm5YP3hX4bFgpWxzE1SDBPCasu1sUDmyx1uk0KhYrbSL0FLgnJdWkmq7IgXY
         2xPgG3Sinh3KdclNqExdcAQUWR+Wz/0XxzDzGFSkEsd6Zi5j+90tKDSOtH7mnK+GxvuD
         nUnKV4BQUYT8FZt8F/UedbJZrMsX9M3UxFcpYZ8yNXVZSBY2YXlLvD1ptjvbEQRMytQi
         DpO54dBdpj6WCPq5gZR2vm0m82PfFOBU5BPbzAVXVU8ktL87w8MW4mlUfa9QdFKzMe3p
         OjTA==
X-Forwarded-Encrypted: i=1; AFNElJ/5dso1VrLKK7EXfNEWkaSh5/ad5QvjFB2akfxHbGI5bHzTSAx08nq7WtQr3Ja49NQ6l16Ema3XsIZZsp4iCCY4@lists.infradead.org
X-Gm-Message-State: AOJu0YyN0ewPEVzpw2yU8AGGWoqCogEa4ORq/qnq5rbzl9UALgTnIN6c
	VTmmV0jZmKLDxmmMl2GGx5eKLjk36XpYbJbjB+34wh2qU9+3o/6MzqIj
X-Gm-Gg: AfdE7ck89Ng8M6Swk5cLjBb3jua/Hdstr8HpfItAFJ/sohiosHBrc1uMrEv7p9cgW2+
	s3dbPol7sSjUII+QzJdwWiDN1ax3DPF+BOZ5yM8mDWEcXShmrcYE77w9eyktfJtvM7VWfuWKq/v
	gksNTg2n6PFm9+2i7P6XBcOFmb+4n7QSm+QEjoPuO99eORZiKetFbG2/k3jyWOENRA8fPMy8wEc
	KYPPMwUNHp7qc2CzW67T6x/Tq3IXCHNdeQEUz4KnMFXYD2WpTWEU8nEtlJ3VQh7lS98p0M+gUbt
	DS63401+QXNhM3006zv8AL6W8M8hzXeZ74msIyVOUrniueniQOSH2g0a2kCOg43SqRgYUOZaQUy
	zcOY7tWXs5jPjorszztnwTpCw5hPK9lRgjdwZ6eNUWsQrWH/s3QT1WaGdnxklx7schiYCv7tKZN
	eO3ogr3ylsrqJXu6sa1Aje+ldYZHlPmP1H0GDijL1UYY3HPZALyN49AqoXOy8R54CFGbrqXQFse
	gwwL+unzjKr5JCV
X-Received: by 2002:a05:600c:8b08:b0:490:9d1b:f086 with SMTP id 5b1f17b1804b1-493b8289905mr175815e9.14.1782744484783;
        Mon, 29 Jun 2026 07:48:04 -0700 (PDT)
Received: from smtpclient.apple (static.253.36.98.91.clients.your-server.de. [91.98.36.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fc0f32sm321549885e9.3.2026.06.29.07.48.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:48:04 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF
 datapath on start/stop
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <1jwlvha6xv.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 29 Jun 2026 18:47:44 +0400
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D8EA185E-1F9C-4655-82C9-2C46A035782B@gmail.com>
References: <20260626080422.4191435-1-christianshewitt@gmail.com>
 <CAFBinCD5bn5VixbomCz0nmHuopBmgh0CJc-V4jY2vdXhoP_VCw@mail.gmail.com>
 <1jwlvha6xv.fsf@starbuckisacylon.baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_074807_299190_36EDAA2C 
X-CRM114-Status: GOOD (  18.54  )
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

> On 29 Jun 2026, at 4:04=E2=80=AFpm, Jerome Brunet =
<jbrunet@baylibre.com> wrote:
>=20
> On ven. 26 juin 2026 at 22:41, Martin Blumenstingl =
<martin.blumenstingl@googlemail.com> wrote:
>=20
>> On Fri, Jun 26, 2026 at 10:04=E2=80=AFAM Christian Hewitt
>> <christianshewitt@gmail.com> wrote:
>>>=20
>>> The I2S FIFO soft-resets its fast domain on start (AIU_RST_SOFT bit =
0 +
>>> AIU_I2S_SYNC read in aiu_fifo_i2s_trigger), mirroring the downstream
>>> vendor driver's audio_out_i2s_enable(). The S/PDIF FIFO has no =
equivalent:
>>> it only toggles the IEC958 DCU, so a stale datapath FIFO can be =
replayed,
>>> producing the "machine gun noise" buffer underrun - on start when =
switching
>>> outputs, and on stop when playback ends. The latter is audible on =
devices
>>> with an always-on S/PDIF-fed DAC (e.g. the ES7144 on the WeTek =
Play2).
>>>=20
>>> The vendor driver resets the IEC958 fast domain (AIU_RST_SOFT bit 2) =
on
>>> both enable and disable (audio_hw_958_enable), and when =
reconfiguring
>>> (audio_hw_958_reset clears AIU_958_DCU_FF_CTRL then resets). Do the =
same:
>>> reset before enabling the DCU on start, and after disabling it on =
stop.
>>>=20
>>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>=20
>> This matches the vendor driver, references:
>> - fast-reset SPDIF is triggered on enable and disable: [0]
>> - fast-reset SPDIF is triggered after all of the configuration is
>> written, then DCU_FF_CTRL is enabled: [1]
>=20
> Take what the vendor driver does with a grain of salt, especially when
> it comes to audio
>=20
>>=20
>> [...]
>>>        case SNDRV_PCM_TRIGGER_SUSPEND:
>>>        case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>>>        case SNDRV_PCM_TRIGGER_STOP:
>>>                fifo_spdif_dcu_enable(component, false);
>>> +               snd_soc_component_write(component, AIU_RST_SOFT,
>>> +                                       AIU_RST_SOFT_958_FAST);
>> It doesn't seem to make any difference, so just for the record:
>> The vendor driver first triggers AIU_RST_SOFT_958_FAST then disables =
DCU: [2]
>>=20
>=20
> One could even wonder if there is any point in applying a reset when
> everything is stopped, if the enable path will apply this same
> reset before anything else is started again ? Does it really changes
> anything to the reported issue ?

Using disable/reset or reset/disable didn=E2=80=99t make any difference =
in my
testing, but without any reset playback stop on the WeTek Play2 board
with hardwired DAC always triggers the buffer underrun.

CH.


