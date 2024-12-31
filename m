Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB29EE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 18:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kltap3Pv1hlN9UPAmHZET72hjTYvMQFRlhAGev33Mns=; b=v9Cau2YaCyMcLN7yDxZsozbiKE
	lmNCfLcOPkSPikom1DEumKQ1tphB4bkbnbCsfC265hs7Z9BUdHr9Mpmqls93Pwq/SZPKmJi9U615X
	AxVDEshkG4MM7pnLW0iOMyVKYswZyYMQZWroveMSFB6SQAVZintvTkxuHcKjbfsf/2yg8ChoSU4yY
	k+Npu6luLwsgbvlYNekH4YcHCEm4gfAYTyIbVrRx7z1qu0t0XQobq5gxkR4Y0Tl4/5n0Rl8aw4N+o
	bI6EEHfQXx5qXgLlnkoerc7jl5vM0K06jiCBAYggEosPkhJy5UIkvfTHtXgJ/3YatlrPKRPhLWNcH
	ESo0c6MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tShKb-00000007cLi-0Ew5;
	Tue, 31 Dec 2024 18:51:05 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tShJQ-00000007cFc-2wei;
	Tue, 31 Dec 2024 18:49:54 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2ee709715d9so10995946a91.3;
        Tue, 31 Dec 2024 10:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735670992; x=1736275792; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kltap3Pv1hlN9UPAmHZET72hjTYvMQFRlhAGev33Mns=;
        b=VE9PT2h2eN9iy1SRjCA7ZnYMQs3Tfp30yOKD95uG8aGYPwA9lX2FeFRJdwHkSUgz4D
         2tHG9iE54yNNn90KE9u6veDIy3DBdkCOk4Jz+xgoJzsh8FTNna563t7vbddTWNfyt4sY
         +5s9mPU9dV3ZzqYrf96ct2NDpEM3StQy+3w0vt5nQJxNkF8JDuiCgbHjHuVlP9ACl0lW
         DK2203gW7NHQX5ed0aAw2SRl4hIjvwEmddaE315LdvHN8qMohjPsE7supu4Sa8mPi3Zk
         nETAxXJVWcqMo1qrJjfyKczyiuqLy2uL6CDKr9e5qpS/t0tzcoMZGqTod88+6AamKJ8Y
         dbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735670992; x=1736275792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kltap3Pv1hlN9UPAmHZET72hjTYvMQFRlhAGev33Mns=;
        b=IKjfqOLYNW+paO1W4/AT8c/4kiiz9lvsQcf+ZuEj08X/ZQ0eN5mW8MbQU28b1Z3pKo
         Z8znkCCssecXdZM5u1l90nTlMpxcdk6hqJfQv3LIpeKbvTpOI1ek7CdtdG3X7z74Zfge
         sHjEmYWk4Wdoxz7yslTJeUkmG6+pQIuIQx0T/RK2gc008D4oKrEYxU5F2qnJjagZm3Mh
         L6I3UKSTX5oJ0MawT920eEZR89/zEkHGjipTMbKLwIOkR8YpscPHTMa/DoULBRl+ItPG
         f5nn1sbS7VMcsr8Nx0yVPxHmMERBTZMVEjqk8p2Tute8uXk6+OQyxFWKpzmeGYmVswJY
         zoaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwZqHWp2y1uvo85RkRlv5fN3zz12RT0VCUJDEW36Qhrr+R+bOwylYb3dS6i3IFrbztghyvGGA18ZIAcl/Eg+g=@lists.infradead.org, AJvYcCWgFY73xoUx+SO0S9TXoFA2Xc1ovRpXWoAvpMiKMNUaHDoi6j5XYPIs2KVS3W2poSm/SYT++EfGSn1LP8/ZPiho@lists.infradead.org, AJvYcCWpQgnQapiopXhKiPq+m1e66z4ZStga+5MG+4DIkZuUiAC8qMhNav0W3tkMh6ENOTmoh3tF4/hChEmFVmcRtQ8=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywvo/q6+F7GYLm7XcZgjzi0Cv7cqSs7tjF8vUJ+oKgxQoUJKyvu
	CKTu83zmr/loAoJlg8XqxYT1369Mv2N6IZgKLGD0AiNu78zAsZiMLKHV1YIpiKvAeK0TLAD0K9r
	xyennLr9k2O3lhqGpvWXsRcwuApY=
X-Gm-Gg: ASbGncv9EQhKFIwaNp/ao02RypOBDpc3oHZ+MgROjmqBMavEP2HpYNfBocgoyWIDWi0
	fgowR5UMEWA7pmiL56IfFOvNDF2FzJNWssXvNKt8sUQgYfiyu1HzvcZvHDfLk1KVYWvq7vK0=
X-Google-Smtp-Source: AGHT+IG5FmkROQoSQHWr4cIegxX2It9OOsT8OUh7KWPdH7VQgx2qIDviezjcsQv6GTMSR51Q0h0ZJEqmX+Qz4Kpzuw4=
X-Received: by 2002:a17:90a:d645:b0:2ef:30ec:14c9 with SMTP id
 98e67ed59e1d1-2f452e4ad37mr57281196a91.18.1735670991720; Tue, 31 Dec 2024
 10:49:51 -0800 (PST)
MIME-Version: 1.0
References: <20241224-drm-bridge-hdmi-connector-v10-3-dc89577cd438@linaro.org>
 <20241231004311.2574720-1-martin.blumenstingl@googlemail.com> <l3u3wtnxyhrwjynevkwfjwarisc4yt4xy2rbzf5kb7k5l5dw3n@lxqtimymyjg6>
In-Reply-To: <l3u3wtnxyhrwjynevkwfjwarisc4yt4xy2rbzf5kb7k5l5dw3n@lxqtimymyjg6>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 31 Dec 2024 19:49:40 +0100
Message-ID: <CAFBinCAh8iazDNx6GtOOJyXh_V-NfUs6Uf=ywN9kvQGPEmjrKQ@mail.gmail.com>
Subject: Re: [PATCH v10 03/10] drm/connector: implement generic HDMI audio helpers
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
	alain.volmat@foss.st.com, alim.akhtar@samsung.com, andrzej.hajda@intel.com, 
	andy.yan@rock-chips.com, angelogioacchino.delregno@collabora.com, 
	broonie@kernel.org, chunkuang.hu@kernel.org, dave.stevenson@raspberrypi.com, 
	dri-devel@lists.freedesktop.org, heiko@sntech.de, hjc@rock-chips.com, 
	inki.dae@samsung.com, jani.nikula@linux.intel.com, jernej.skrabec@gmail.com, 
	jonas@kwiboo.se, kernel-list@raspberrypi.com, krzk@kernel.org, 
	kyungmin.park@samsung.com, lgirdwood@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com, 
	matthias.bgg@gmail.com, mcanal@igalia.com, mripard@kernel.org, 
	neil.armstrong@linaro.org, p.zabel@pengutronix.de, perex@perex.cz, 
	ple@baylibre.com, rfoss@kernel.org, rgallaispou@gmail.com, simona@ffwll.ch, 
	sw0312.kim@samsung.com, tiwai@suse.com, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_104952_745680_5D774895 
X-CRM114-Status: GOOD (  16.87  )
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

On Tue, Dec 31, 2024 at 3:34=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
[...]
> > I checked all instances of struct hdmi_codec_ops in v6.13-rc3 and it
> > seems that there is only a single driver which uses the .prepare
> > callback (drivers/gpu/drm/vc4/vc4_hdmi.c). All other drivers seem to
> > implement .hw_params instead.
>
> Yes. However .hw_params don't have access to the infoframe contents, so
> I had to settle on implementing .prepare.
While debugging I noticed something unrelated to my problem:
hdmi_codec_spdif_dai_ops does not implement .prepare().
FYI just in case someone wants to use your patches and feed the
hdmi-codec with SPDIF instead of I2S.

> >
> > The audio controller code for my platform is already upstream:
> > - sound/soc/meson/aiu-codec-ctrl.c
> > - sound/soc/meson/aiu-encoder-i2s.c
> > - sound/soc/meson/aiu-fifo-i2s.c
> >
> > My understanding is that you have a platform with a lontium-lt9611
> > HDMI controller available for testing. Can you please help me
> > investigate and find out which piece of code is calling
> > hdmi_codec_prepare() and therefore lt9611_hdmi_audio_prepare() on
> > your board?
>
> Sure, this is the call trace on my platform (Qualcomm SDM845,
> sdm845-db845c.dts):
>
> lt9611_hdmi_audio_prepare+0x1c/0xc0 (P)
> drm_bridge_connector_audio_prepare+0x2c/0x40 (L)
> drm_bridge_connector_audio_prepare+0x2c/0x40
> drm_connector_hdmi_audio_prepare+0x24/0x30
> hdmi_codec_prepare+0xec/0x144
> snd_soc_pcm_dai_prepare+0x78/0x10c
Thank you, this helps! snd_soc_pcm_dai_prepare() is where it breaks for me.
I suspect that it's an sound card issue on our platform, so I'm hoping
that Jerome (author of the Amlogic ASoC drivers) will help me debug
it: [0]


Best regards,
Martin


[0] https://lore.kernel.org/linux-amlogic/CAFBinCDdiJ3UNVUcShjq=3D7U2=3DoUw=
T3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com/

