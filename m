Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30A4C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 07:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0FIvnATmtkNNdXQbt1Fz7I3kCcVI6Dqou2JsI1LDaQ=; b=j80ZgRDSqgLn7MOok80+c0n36A
	NXPJbBT1RF/VkPjvhhrCubscyx/lXgJvpjLZZlunoDuZHESHBz67meCcZewtBbmYULGfOzeO6kPxh
	0q0oJZEqlYGcrRdLXp4bH2Q43IGiQz2vZf9vG9+3sOduNEJ1u2KIVzM996/QBQWMMd9GxkP+VUb4j
	VUMyhsqXaoiWZ3cFOk224QD941QIS7m2uZ03pn8a9B6RkUJQtscPKfhrebIbpk/C3wqUAztV8kFts
	xOVSQR0aRrAm7CRUoZqBBaHF2TJyidJSGZPsIXpzi5LV9kBsqT3ibd5yQjKhpUCaevTPQSoPooil6
	oDEl+boQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKBOn-0000000CSV0-3Qig;
	Wed, 28 May 2025 07:40:29 +0000
Received: from mail-vs1-f50.google.com ([209.85.217.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKBMT-0000000CS9K-1DLK;
	Wed, 28 May 2025 07:38:06 +0000
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4e5962a0f20so376316137.1;
        Wed, 28 May 2025 00:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748417882; x=1749022682;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0FIvnATmtkNNdXQbt1Fz7I3kCcVI6Dqou2JsI1LDaQ=;
        b=WG4QOeN7Azm8d7p/swGivPoViQvLnOer0+w32aaiBbaoY4CbzFsstGfrY3ZRRz0cSk
         E96nL6B4ZKXlwvTZNevt9FYDRhU4x0QtH5bq6xfHr5UrgZH9dvcIcpvYfWFT02vlZbA6
         WGeB6xbNj8ag1KTMXiZjxiSVy+XrXt4QcK4V9Xhk53DlBzxT/vjjEoi/JVS/mX4qYvzt
         Ih24vLmpX8s2mMlKplIYIagLVQUoG9kndNibtMJE66wZt8OphFFoyObxZB0h20S3l1fg
         a9Hl4ux4oc5S4dw5eV2jmWw9dTaaraTCAg6L1DttGaURP/6wGBU2nPGaDVYwSh3R8s7j
         /aFA==
X-Forwarded-Encrypted: i=1; AJvYcCUzkkdt4ciSF34MQQZravGrn1RLt2DlbIr5kVW4DbK5SdbvLdnOapXxqicooKSlhW6cEgHdbYaVOMdlm7Er@lists.infradead.org, AJvYcCVR077wA5OVA8I6Cug1caDDTMJC80v4WO/XWn/fOdLzhnGawuYk6KCd5OeLlJZgTDsYNlnd2+pLMWb4CWaDqgSZ3g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqQ2OL9ysFZgq5sN0cLBtOf/rLN4jZjwJ9k19ltgLmMVqU6vPj
	y6gXsykRhcKSkHjniVsyGu96fGdC3MXJApnOFj++GcX4FqfmP1GNk4+yZ5gD/Jhx
X-Gm-Gg: ASbGncvzrUkSgSrE96WKZhSlNoMwgn6tidk23JpRJW1Z1yq0KHbrFLu5RI31t1b4Aw+
	QLG1P3vew5HNrgEGOyCzHwX7ptsQ438faIykKVHmNEKEQfMe0yde0nPgUimUDbld6SNwvffHUwK
	ap6OG2a1eKJNT06XpilgjnUTZvo3VZaafBsBbQ6GzGF4A9GR+hkjmslOgQSm7dLEzXwhjG11QZq
	JIz/TgUE+Md+CVj7stukDdtGvrLXOOyaWJhydspiBGO6HRNhkCjKEsDh2A3OP0S6p4SaVqUF3xx
	qehYGlkUTdbFj/OPFnHOifGl6cfJ4GJC5mvT4Lv1y3EhikVVmPq9iSJxgvdJlW+aR2Hj5A5PJL5
	bSAGVK4ioNVmfnA==
X-Google-Smtp-Source: AGHT+IEFaPNRqPPi3MyCEZW9acytXY+IFhU/Y2eSjXj/1RN5oQ6LbWtjy5mQKVdaNjjkqDdI/hcgmQ==
X-Received: by 2002:a05:6102:3f56:b0:4e2:aafe:1bde with SMTP id ada2fe7eead31-4e4240b0ed0mr12626131137.9.1748417881726;
        Wed, 28 May 2025 00:38:01 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87e1f03fcdbsm457424241.19.2025.05.28.00.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 00:38:00 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4e5962a0f20so376299137.1;
        Wed, 28 May 2025 00:38:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVat/PUA1i79VIt01iHkoVdGMdUPxMSX6D4BddX7xQDwVsErxDtrFH8tyIq2mOHNPq/Fk86K0+nVD4nS4MKVFBazg==@lists.infradead.org, AJvYcCVrHJRkJEZkXeORKis/zRYecdMDN79HwN9ttF0udE6ssnKbtblke32yEWcvf5U/nyMaz3ojE6Ql6FO2qPpd@lists.infradead.org
X-Received: by 2002:a05:6102:d87:b0:4e5:9731:6ded with SMTP id
 ada2fe7eead31-4e597316ebfmr3313200137.6.1748417879962; Wed, 28 May 2025
 00:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250527082446.2265500-1-aichao@kylinos.cn> <20250527082446.2265500-3-aichao@kylinos.cn>
In-Reply-To: <20250527082446.2265500-3-aichao@kylinos.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 May 2025 09:37:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5ZhJrRiuEWLbU_gFcv40+izLpR0HN0EZU415s3QAkVg@mail.gmail.com>
X-Gm-Features: AX0GCFve4Aj5WArc9KkplJVctpVO9pqz2wSMOeJzSTUgarGo2ZgOa2T8YLQGOCU
Message-ID: <CAMuHMdV5ZhJrRiuEWLbU_gFcv40+izLpR0HN0EZU415s3QAkVg@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] ALSA: aoa: Use helper function for_each_child_of_node_scoped()
To: Ai Chao <aichao@kylinos.cn>
Cc: perex@perex.cz, tiwai@suse.com, johannes@sipsolutions.net, 
	kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com, broonie@kernel.org, 
	jbrunet@baylibre.com, neil.armstrong@linaro.org, khilman@baylibre.com, 
	martin.blumenstingl@googlemail.com, shengjiu.wang@gmail.com, 
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, srinivas.kandagatla@linaro.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	imx@lists.linux.dev, kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_003805_332794_D6E24F1E 
X-CRM114-Status: GOOD (  21.16  )
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

Hi Ai,

On Tue, 27 May 2025 at 12:52, Ai Chao <aichao@kylinos.cn> wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically.
>
> Signed-off-by: Ai Chao <aichao@kylinos.cn>

Thanks for your patch!

> --- a/sound/aoa/soundbus/i2sbus/core.c
> +++ b/sound/aoa/soundbus/i2sbus/core.c
> @@ -155,7 +155,7 @@ static int i2sbus_add_dev(struct macio_dev *macio,
>                           struct device_node *np)
>  {
>         struct i2sbus_dev *dev;
> -       struct device_node *child, *sound = NULL;
> +       struct device_node *sound = NULL;
>         struct resource *r;
>         int i, layout = 0, rlen, ok = force;
>         char node_name[8];
> @@ -178,7 +178,7 @@ static int i2sbus_add_dev(struct macio_dev *macio,
>                 return 0;
>
>         i = 0;
> -       for_each_child_of_node(np, child) {
> +       for_each_child_of_node_scoped(np, child) {
>                 if (of_node_name_eq(child, "sound")) {
>                         i++;
>                         sound = child;

As people pointed out before, the original (and new) code is buggy,
as child is saved to sound, and the latter is used after this loop.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

