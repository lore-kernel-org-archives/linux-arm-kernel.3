Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96463CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 08:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:In-Reply-To:To:
	References:Date:Subject:Mime-Version:Content-Transfer-Encoding:Content-Type:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74oB9dCRg/IuKwvTPv0f5zd2Mnk280z9T3MLJIHjosU=; b=BPWJX1FTCVaKjnE/WfDSBN/NNR
	am4umCjzTmo+F2w2evPJJb9pYFom6AupJOe8GDTFWehKN+u2Pm/rkoAA8EOr/479zdqXJFG31Ja6z
	cwHPXjM9PFBE08PudTXvInklXn5anEoD9z8r3JKAtH7AvE3NPgdew341/70oukUMfBqIrZvUrrkNS
	rR2BJTqZL513eOwnC4cbbnUYqrG9H+WX9tUVNe8UuQp3/MIUa9383iMDmWTasnpfqQuLQUwgupHgx
	AWo+B8sGpzo1ocv/Bz1IejiKGrvVRq7KSHA3X3+tK2pHvYDkZ6ql0M1n3Wb/J6RevFWBJRPnp3zNL
	EVguH+WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1dD-0000000AlMn-1yyZ;
	Fri, 26 Jun 2026 08:09:47 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1dA-0000000AlLO-3RRq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 08:09:46 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5ad583dc41eso582641e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 01:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782461382; x=1783066182; darn=lists.infradead.org;
        h=message-id:in-reply-to:to:references:date:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74oB9dCRg/IuKwvTPv0f5zd2Mnk280z9T3MLJIHjosU=;
        b=WWrZKhm9g9rsApTee0/C8NTNchd0cYhemvWe3m3Kvj/I4mqKqU4qzHhRpK5A8/ayP8
         NO/RKDb+1k2ooC4qxJl0ikgEIERs6qdCmb6LC6XsnHbsortkhOFxRUoP68gHE0mpGKWj
         vSJKQgfRmgG9ptNJ8J7evjtKg1k9YJnmkVsi9ISeE2cJxteMo5KQnwDcbSyfcPhxEAVJ
         87z91qfSc3GU4VBVqQPeWrpSeOpObf7X7SUKR4rZpqnJe4DJ+Q5u+cQkQeqN6ijP43i4
         0j4E3jUejTjo2G1YYjj7Cs8zZQVPfmG+aH4l4axRytzLf5SRe3+CQ6Epw/+lekDovlBL
         TnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782461382; x=1783066182;
        h=message-id:in-reply-to:to:references:date:subject:mime-version
         :content-transfer-encoding:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=74oB9dCRg/IuKwvTPv0f5zd2Mnk280z9T3MLJIHjosU=;
        b=dnMcv+h2EDjAeZeiBM5zUd4PrsIWAJJ7jXI+aeyvEd/zugNszDEaGu8HviVRC7BQOl
         zZ+Ue2OJl4LHmxovt+qrSz0fFvU6TYxKIHqdmdGpZhEq7v3hQzA6n2yXbDN04+6n+myN
         Ha9H0DiF+oCGwYaIEcYjJFm0mqvDvuaT0TYTrreGDSWx8N87zOIgfQaoEH2BaIgfTRyz
         ykkj31Blg99vyPknQcQgCi0zRgBEB7ElMmSp/99gvhR1PwgSzHikPVuTn0OHhd5zDqaT
         Mi42/bL2Fl3gOG4hqBfqfZJOro9utd8lTQEAQCPWerVJaEXYvYNHBiJEazM5BTtVPa73
         hXpQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYbN5Mbhqla1+vP3KtwoXpiibwyH38QO9TX6yYQs9MbpNa/E4yEC2DOygmVzoqTz8bKY5C5BjaAK85t/VOb7Zt@lists.infradead.org
X-Gm-Message-State: AOJu0Yyff1Uar428rP39VkVv2kyM1y5C0k2H2r+C70cNBsrXpq74GRkl
	80SqvUBNNEEDHCJ/S+3UOMxiG1i3/fQEDfOPWnXsJv4URMZe17FQFWPskBnsPcTb
X-Gm-Gg: AfdE7cnK9d/Ha0WDRJfTixOoCzLTjecyIx12eqeWGSU7Sd0xid8smzYrlvMDC+wAUuw
	TmVNNcDxkGpUtjF81PayuC2iA7Prx/xWAELBVeny5MXaVefhUEueoKDAo1DRq6rv7HrDRI4QhXp
	LTqFm/p9K3aZDyX2lMO1RNnJoAGD+EfUT4LJljsb2dfF6kVzCp+5q/L/poSv9WeEiKWwU24GsxM
	kkD/jxxTRnYudKHinyQz8g1SaCoRITVFHRezFxEDuCVZnz2y7FwP2831xTIulSqqOLZDmOF7Dfa
	EAkwPYKp8RqZWNvcmdwNv1tgSqovxztDftrd+48XXhQgeQnK5KXHG1a4QIVnUew0I1smG8r8DC/
	6iOTsUhlF+GMpV8QRcblha/GvAgMhXHshTjSu3SiveRyaL0Cc788k76hJauGu8+CIFOmkepGwsM
	byjQDVzxpjGrpbJshhzMpjryVonrnZ9DNg1VU+RQzNUg==
X-Received: by 2002:a05:6512:3087:b0:5ad:5daa:9c90 with SMTP id 2adb3069b0e04-5aea1f579b6mr2196508e87.52.1782461382239;
        Fri, 26 Jun 2026 01:09:42 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea80d4722sm186240e87.26.2026.06.26.01.09.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jun 2026 01:09:41 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF
 datapath on start/stop
Date: Fri, 26 Jun 2026 12:09:26 +0400
References: <20260626080422.4191435-1-christianshewitt@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260626080422.4191435-1-christianshewitt@gmail.com>
Message-Id: <82AA2E33-70B4-4EEC-882A-EABDB51904FA@gmail.com>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_010944_887622_03865572 
X-CRM114-Status: GOOD (  17.94  )
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

> On 26 Jun 2026, at 12:04=E2=80=AFpm, Christian Hewitt =
<christianshewitt@gmail.com> wrote:
>=20
> The I2S FIFO soft-resets its fast domain on start (AIU_RST_SOFT bit 0 =
+
> AIU_I2S_SYNC read in aiu_fifo_i2s_trigger), mirroring the downstream
> vendor driver's audio_out_i2s_enable(). The S/PDIF FIFO has no =
equivalent:
> it only toggles the IEC958 DCU, so a stale datapath FIFO can be =
replayed,
> producing the "machine gun noise" buffer underrun - on start when =
switching
> outputs, and on stop when playback ends. The latter is audible on =
devices
> with an always-on S/PDIF-fed DAC (e.g. the ES7144 on the WeTek Play2).
>=20
> The vendor driver resets the IEC958 fast domain (AIU_RST_SOFT bit 2) =
on
> both enable and disable (audio_hw_958_enable), and when reconfiguring
> (audio_hw_958_reset clears AIU_958_DCU_FF_CTRL then resets). Do the =
same:
> reset before enabling the DCU on start, and after disabling it on =
stop.

Fixes: 6ae9ca9ce986bf ("ASoC: meson: aiu: add i2s and spdif support=E2=80=9D=
)

^ I can send a v2 with it done properly if needed?

> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> sound/soc/meson/aiu-fifo-spdif.c | 5 +++++
> 1 file changed, 5 insertions(+)
>=20
> diff --git a/sound/soc/meson/aiu-fifo-spdif.c =
b/sound/soc/meson/aiu-fifo-spdif.c
> index e0e00ec026dc..826055a71421 100644
> --- a/sound/soc/meson/aiu-fifo-spdif.c
> +++ b/sound/soc/meson/aiu-fifo-spdif.c
> @@ -24,6 +24,7 @@
> #define AIU_MEM_IEC958_CONTROL_MODE_16BIT BIT(7)
> #define AIU_MEM_IEC958_CONTROL_MODE_LINEAR BIT(8)
> #define AIU_MEM_IEC958_BUF_CNTL_INIT BIT(0)
> +#define AIU_RST_SOFT_958_FAST BIT(2)
>=20
> #define AIU_FIFO_SPDIF_BLOCK 8
>=20
> @@ -68,12 +69,16 @@ static int fifo_spdif_trigger(struct =
snd_pcm_substream *substream, int cmd,
> case SNDRV_PCM_TRIGGER_START:
> case SNDRV_PCM_TRIGGER_RESUME:
> case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> + snd_soc_component_write(component, AIU_RST_SOFT,
> + AIU_RST_SOFT_958_FAST);
> fifo_spdif_dcu_enable(component, true);
> break;
> case SNDRV_PCM_TRIGGER_SUSPEND:
> case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> case SNDRV_PCM_TRIGGER_STOP:
> fifo_spdif_dcu_enable(component, false);
> + snd_soc_component_write(component, AIU_RST_SOFT,
> + AIU_RST_SOFT_958_FAST);
> break;
> default:
> return -EINVAL;
> --=20
> 2.43.0

