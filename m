Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189DFCA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 08:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBz2qXMgWojuZvA+gqIdsYCtSC6xw/yhzsi3Z9qc1oU=; b=R8ZZMC7BzBvhbTnTUgKtSWtJq3
	jHgZHOc2LPF3Y2dZQItY2aNeOJT5/ytcmWvrppoC4y+ZtxWcnUsomzuudgDA6aAs/gHPOuaatEqLn
	VK70cv7Ff4L5qOZ8RhPvU3wt3pNjsu5t0v9OkufSVd/z87ye3nNRofzwsPv+pp4zkeJGJ40SnKtgw
	2zRDkGdzLKqdFRBzG/TGbxxt7mjxk0+jGJ5d3+XMmGjFkfB8I4sMqraKW4tbRJCYiqBZbc04nu6AB
	es4uvNVnn1dPyou0WPJE5aSOCWYmS0+qbnv7qKW2t5My+svlBJMCupAIZ1DoLH3GUE5eUahGfehbR
	Pl3wiwIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENQA-000000020Db-2r6W;
	Wed, 07 Oct 2026 08:54:42 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENQ7-000000020Cl-1FI1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 08:54:41 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso34408125e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 01:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791363277; x=1791968077; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBz2qXMgWojuZvA+gqIdsYCtSC6xw/yhzsi3Z9qc1oU=;
        b=pntPCEfNK4GaVYuspLRt5yI75lQN0NkHicC2ZVoL/q3JEzZ11stICqYdvz7zyF8EFm
         TvptHE746gaSTP5NPgADnqiDD2qBtKGMGIm1sbO8MoEb4RvdaS4B/smgdfj/5cb6Gv6Q
         LD9F8wWOgPaaeJ65u4jrxQJPUv/Ck3dukO8XA3Myz8ZbInT3W7fuR8wHzdcsTc4aP/eC
         uIad8SvqbWfDFc9tkM1hPYDT4Vme+g08sF5QcRqXt+ZDKFk0CkVqWsFPyIFDhrGsIB6t
         qwVrSntW3i7iR+rzHc0W4LI/vMiRxZE9x0kkybAQLkUsVvetUBIei8TFxrVS9tFJudqf
         63Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363277; x=1791968077;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hBz2qXMgWojuZvA+gqIdsYCtSC6xw/yhzsi3Z9qc1oU=;
        b=cUXGelea63c33vQA4cM5ZEP9/TUxfvCzj9nKf/2BXNqQnmrWNSbyZHYobvaSQSHLqC
         RSNixvyg8wuaSQJoVvOt3/gBdHuJQF61W+smGkJXRZmfr70w+voJHJVHYr6iENMu0npm
         qtwQatLAsmaOseDuccVa/cdpEeiEc92iFW4vFEeRG4MEGgd+XDhkfX+33T54pMOA/KKa
         RI/ZZ/PSk+59s/SGln5JwwS7RFgUWQjcLcTJtWks6PNUtZcJT7huHrZ2jGW3XQZm1ObL
         vSW2jZnEQKIZpDm7ScGQqYxG/3m8+yBiLHuRgOnnSIoEFU3BA+dIqTUnyfWsi67y4IHn
         VFkg==
X-Forwarded-Encrypted: i=1; AKwUvBzTtJxUyGq7CvWD3R7xfuX0wU6MZ5wjjVqddG+EIpINTnKCWQ6uVUms6NMsKs1EOVq1Qg72mc44++UB1Mx+QLK/@lists.infradead.org
X-Gm-Message-State: AFuF++mQU79+lcizrzRCugjQHg7PAsWSQbvaXI6q5trWD+GG4lHVA2B0
	hgEmaSXfvcqZGfV6qV1XxyfLxAmEAa3o6AS3Y5rHDFkqYzVOI7Hypb2V+YGN9nkzf3c=
X-Gm-Gg: AYBFou2pUqo+3Tch8oesyBpO3o19mt2Pvqzz2JOhj7fIBN4jdaY530/gTDI0hhIVP4B
	P7mVDGtUd6rONSs8JuOpZUPQAGrCfPg7Ej49+7NlgbTowFzuESqH8ESWjcaxehvrNOmqZHR0kDs
	18Kkv3q8/AJWljLg53502w/+MorLwVoHyrNwFZAmXtqYGK4XLyGQUAK18J2IbPwQDzuTyHVv8cs
	nWbHbDa1N8JgK/LXqLJ9dALXO38Vx/LluQdpjdpjpp96zMwS6ppCSps6hOJqUFt9sOKCnNifAEi
	gjtZYirsr3aOcbX0w1TpJq/iC6OQibRdMpAjr+eVWJ3WqhoxqKLT/WJrPcIsXzSvv/XFuI5IQMl
	V70+RDglgLTrKECcNPYBNb7OzlnnR5x1JRxi2f0fKzrHSE0nCt2zyXo75zfES/vYoODaClqjnws
	AZrUugNk9dnC2BGPfNouaXpSSjicjGFbNLmMIiSYHYFjjgXC7jPi4f+p3hkbyvCW5j+rz8rAdz7
	3tRZVGpmduNE2U=
X-Received: by 2002:a05:600c:1551:b0:4a0:263c:704f with SMTP id 5b1f17b1804b1-4a1804436c7mr20240445e9.16.1791363277470;
        Wed, 07 Oct 2026 01:54:37 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c5df75sm119201005e9.15.2026.10.07.01.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:54:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
Subject: Re: [PATCH v4 7/7] arm64: dts: amlogic: gx: add AUDIN node
In-Reply-To: <20261001-audin-v4-7-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-7-2476646118b5@baylibre.com>
Date: Wed, 07 Oct 2026 10:54:35 +0200
Message-ID: <1jwlrtyjp0.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_015439_361545_D93BF4DA 
X-CRM114-Status: GOOD (  11.98  )
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

On Thu 01 Oct 2026 at 18:06, Valerio Setti <vsetti@baylibre.com> wrote:

> AUDIN provides audio input support to Amlogic GXBB/GXL SoCs.
>
> What's missing after this to get capture support working is to connect a
> capture capable codec to the SoC. For example to test these changes an
> NXP SGTL5000 chip has been connected to an OdroidC2 (GXBB) board using a
> custom hat board.
>
> The following additions/overlay are required on top of
> 'amlogic/meson-gxbb-odroidc2.dts' to make that hat board to work:
>
>     &sound {
>             audio-routing = "AUDIN I2S Formatter", "AIU I2S Encoder Capture";
>
>             dai-link-1 {
>                     codec-1 {
>                             sound-dai = <&sgtl5000>;
>                     };
>             };
>
>             dai-link-3 {
>                     sound-dai = <&audin 0>;
>             };
>     };
>
>     &audin {
>             status = "okay";
>     };
>
> Then, from userspace:
>
>     $ amixer sset 'AUDIN FIFO0 SRC SEL' 'I2S'
>     $ arecord -l  # find the "FIFO Capture" device
>     $ arecord -D hw:0,<N> -f S16_LE -r 48000 -c 2 /tmp/in.wav
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

