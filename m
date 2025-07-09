Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315FCC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 03:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2WLrs8UFl83Bka6HJdVR44cmF3Cl8IJgCemJs93MWgM=; b=NDP2TM7Cr5xx5E
	FBfyQTrz8Fwwqjr9lzNpEIS/1NfqHSKlbJij64iFElRyfpMkviCsdI21bWDh8zk02stDbtUCvcim5
	iAt7dhNxwbjqB6gRzZHUrO00+bAAozZZxhA3/g+5N2RFAQvbFaRJI4Kcv2Jhvl0pg9Wv+jwjmgBt+
	p9sL/OKHvf74d4utWHZUeZDz7iYQ88FGo6jiMrK3KKIIO2cJMdrRVrt75xO5SM0cJnl56BwkCsaOM
	YLIMLYszWAPMqFoZI5j77+Z5a2gbL1GdfcDwsi/oU3WFAu0UWdhhGNpnCySsHDjKQzLJ5fw5I8hpi
	VMlkbJ6tY5ADMYvuKcMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZLu5-00000007LAt-2NrG;
	Wed, 09 Jul 2025 03:55:29 +0000
Received: from mail-lf1-f49.google.com ([209.85.167.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZLrg-00000007L5m-3McY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 03:53:02 +0000
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553b16a0e38so5492915e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 20:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752033174; x=1752637974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2WLrs8UFl83Bka6HJdVR44cmF3Cl8IJgCemJs93MWgM=;
        b=NmOG49Jx9Uh0a2g2Q4sjlyEDCImoSW49XzYv7LnOzq6LGbHQwmqMND3hlwLp0FVhd8
         BVsPnGCbtT2wh0PzO0/WQTj6T+lGWGqBCXA6XDMupQmJPBVZL721q/Sdzz/5VP2r9vo6
         Qedga2EvqZIDeU6DZD0jiCyEmXTDIItekn0ls0TbKW8KhYW5j5CSJxOQeMPYxXxlXclR
         41erdkLzirToF2JNuvKPfJjfh7OU1Y7XuywxX2xRXC8OxGjfOxv/B6iKNKsZZ/Y+0Bc0
         DBfSVMMQCBGbm+kMkJPDh8MabkpTz302dzWOHJbKg0WUx0Y4K2Ud0gGuOLSIL5nAg0xw
         RvYw==
X-Forwarded-Encrypted: i=1; AJvYcCWUocyj8HY4KTVkuj26ENHG742nnCJYZ+avRxz2Eb1q91tVk7OAP9nnOxx0s15hSM4SDQv+sLV1h5/iA/7/tbv+@lists.infradead.org
X-Gm-Message-State: AOJu0YyR97xbdcW4l19G1oW5HW1sIqfmKWon8f/f4qzIWfDUQy7t8EDL
	bk+Ve+OelmJw/eXA8vqbg+RYtdUlFfYfGg5WMLifVUH6hEb/wJoTQUz8r9rshzdZpMz6Rg==
X-Gm-Gg: ASbGncvv8C4LTesAmJ2c+TvaURDk58D/GLbiEu7+p97oqjB/iVdSWN2afuBfKPFTyUj
	I9m+xrBiNp9TqloROFjodKVWw9fKFTdIiLOjT8Rwc0kb/Dsns5hUj+WQ77R2YcpMtGJDZ2RRSm2
	1SXHDx2wV7LJn1nPr+q3wcsiWxNC5Qjg5qn5XQhed6mw9zO+kuJMW9nSREEvdWYsGPKPbb8uvVp
	vgP8wP4rwkS/Z17aIQOiKKrQ54ZxPfLg/PAnFwfDzsE4Ixx25LFwkMgCqotZX2RrwMCLTtuQs57
	c7Mq5W+8ZJw8xTRofNGjQSmXv3Bw3SPSF0WgY5pUnda7Kgp4D3ZY3j4P20wgjdCITFTvuxld5yv
	DNC0XcNpzlppZCpyU2mw=
X-Google-Smtp-Source: AGHT+IFZju1xo7Yv3YPuCRMyVvNzaXewXHa0ejuFvjDg+eOOzBqbkStKJQcgXD9Rt0aScPYNTTTz7A==
X-Received: by 2002:a05:6512:3c84:b0:553:cfa8:dd33 with SMTP id 2adb3069b0e04-558fa89b9dcmr264544e87.19.1752033173677;
        Tue, 08 Jul 2025 20:52:53 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384a9e50sm1801873e87.166.2025.07.08.20.52.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 20:52:53 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32b49ac6431so41414791fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 20:52:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtoVwxGz9yo51NxxLhR6cT7I/vW1Fspul48S5fcWN9VWC0f2u1BW57ZDIogaO/gZdzkiJ2ioXhQndHoK3rhVSA@lists.infradead.org
X-Received: by 2002:a05:651c:221c:b0:32a:888e:b30f with SMTP id
 38308e7fff4ca-32f48421a2emr1518491fa.6.1752033172370; Tue, 08 Jul 2025
 20:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250708231144.971170-1-sakari.ailus@linux.intel.com> <20250708231152.971398-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250708231152.971398-1-sakari.ailus@linux.intel.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 9 Jul 2025 11:52:39 +0800
X-Gmail-Original-Message-ID: <CAGb2v67zSf6X5B0rvkKPb1sOna+EW7f5JzqduO1rt1hSUo3p8w@mail.gmail.com>
X-Gm-Features: Ac12FXwreyUxlabds-QeysMrnIp1a5yDkx7pVnlh5FRhGlmU6_2tIIE3jiUb5cg
Message-ID: <CAGb2v67zSf6X5B0rvkKPb1sOna+EW7f5JzqduO1rt1hSUo3p8w@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] iio: adc: Remove redundant pm_runtime_mark_last_busy()
 calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Marek Vasut <marek.vasut@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Francesco Dolcini <francesco@dolcini.it>, 
	=?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Stephan <jstephan@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_205300_840555_78E49D92 
X-CRM114-Status: GOOD (  11.23  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jul 9, 2025 at 7:12=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---

>  drivers/iio/adc/sun4i-gpadc-iio.c  |  2 --

Acked-by: Chen-Yu Tsai <wens@csie.org>

