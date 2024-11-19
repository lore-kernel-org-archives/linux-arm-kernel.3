Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5B3D4415C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 13:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r5SnbOSPJM2xbQk5uUW2SdrCV3aSiK5t/lke9tIy5ZM=; b=YZ0sramcZ6ewL2
	xuiZOiwClsBmK1KO45DT8P+KqWbYTynJc5TbjVsrGwGmSVSAkz+iqb2/Be9hwtFVHHV1D3zZIZ4+T
	D3bf2RdjiE/SK4GZMRal7aM5RzEANADhhuXkWLph6Ru3BmK3i8klBu2pIE9Z6v7B31zwoW2XhzXfJ
	x8nhvZlT/WxLzHU/ldbZG0SI2H2YLQxuTtVfNnKlG0NtCQHtZ0ho0YGW/iiKk7hAURVr0yowQMA5Z
	GiOrxXb9R44HvQLJXWp45mEDOgmucGV391DVdnTianS02D6t2vZOKJYShHf0tLCet5DiyL/uMuLfq
	jBEKnoX280L4mMhQRYOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDNxF-0000000CSlw-3hWa;
	Tue, 19 Nov 2024 13:07:41 +0000
Received: from mail-lj1-f170.google.com ([209.85.208.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDNvh-0000000CSRw-1DHC;
	Tue, 19 Nov 2024 13:06:06 +0000
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb5014e2daso26590001fa.0;
        Tue, 19 Nov 2024 05:06:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732021561; x=1732626361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r5SnbOSPJM2xbQk5uUW2SdrCV3aSiK5t/lke9tIy5ZM=;
        b=w95RELE+0nDSecZriPzutDPYkFy/mxo37Gn78M2tlk1nDdYnXeG0yr0/DXTh/H8C7J
         e+jIYTzpL4o7DGcUXNu/guUsNkZ63VYaxrEQIe7GzdaAUfSDucnh2auuLEbUYNHYJybd
         /hCIVJWqbkwaFIMb6iRYEDlKf9sGr9kUhow6mOhADwGoQ2ypMoGXVtnArBWD8A6VV5hX
         ck51/qnAMYCH8mCPzltCL4TI0QfSGdXq5/izkpbykBtZoOQ20EgWjC6uUyFADhYppB7L
         0qnxQlGu5sY9MhbMVFEF03yqhHpFNhS1JHeN60UIccx2W4JTcGjzsJRj+enOtyU/3oq8
         ZiXA==
X-Forwarded-Encrypted: i=1; AJvYcCVfI0iG5kOItmHwKLu+CW8wDed2peifygU1TBiq8nwk0aZVKw8f3coa4m4ak/rn4HTGaR8i5LOD2dKUurT6SdBL@lists.infradead.org, AJvYcCWlIn3FMVlIjNSC0tEpzBUMw6W0ZpKcewqf/e9Jh+cT4iK64CCklDl4+tEdUxwZii4HS+2VBW4OQEt9FJ/nHXk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHLSdanxRmibyhBWRzFBJbfdOq3lNhNyLHiBGX92JSzGPC0CBY
	X1Fwm4WnCelqo0tNtHynmAVP4rx8+HbihtIbEePwhVY2ycDGrCLsrlA2DKMw
X-Google-Smtp-Source: AGHT+IFRSTz1dh+uLST2WRk1SId0URyEzSlJ6HSvWi/q0vYP7Gmvz1Oo+juT0CA+A5d2p2fuLdvgPQ==
X-Received: by 2002:a05:651c:1542:b0:2fb:5014:c998 with SMTP id 38308e7fff4ca-2ff606e4b3emr87636821fa.28.1732021561201;
        Tue, 19 Nov 2024 05:06:01 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff6996869asm12170831fa.68.2024.11.19.05.05.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 05:05:55 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so27931981fa.2;
        Tue, 19 Nov 2024 05:05:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1q7j/LtR8KfJAuLMbxEHTTufz8SE3EEcj1uZrbuzy++VqciNvTHMKlLapA6viZZqE2jlFf6nqAQKFdY5OpZAG@lists.infradead.org, AJvYcCVdPz/7h4xww07bYB5V5gcTOGv+ytdZ1bFzLUMF6V1i9zfszGAH9IAoFVCsgqkPmRqvYanOCX1XKnr1D2W3Pcg=@lists.infradead.org
X-Received: by 2002:a05:651c:1582:b0:2f7:4cf1:d6b1 with SMTP id
 38308e7fff4ca-2ff606226a5mr76184521fa.1.1732021553921; Tue, 19 Nov 2024
 05:05:53 -0800 (PST)
MIME-Version: 1.0
References: <6f0297ba884c670d604232c2861347940082c8e6.1732004078.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <6f0297ba884c670d604232c2861347940082c8e6.1732004078.git.u.kleine-koenig@baylibre.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 19 Nov 2024 22:05:42 +0900
X-Gmail-Original-Message-ID: <CAGb2v66f6WEYYVm+UQzmz_V87Vqt4BSUkoW5S_qqr_arczc6ug@mail.gmail.com>
Message-ID: <CAGb2v66f6WEYYVm+UQzmz_V87Vqt4BSUkoW5S_qqr_arczc6ug@mail.gmail.com>
Subject: Re: [PATCH] mailbox: Switch back to struct platform_driver::remove()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_050605_323767_17251D25 
X-CRM114-Status: GOOD (  22.45  )
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

On Tue, Nov 19, 2024 at 5:17=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>
> Convert all platform drivers below drivers/mailbox to use .remove(),
> with the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
>
> Make a few indentions consistent while touching these struct
> initializers.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
> Hello,
>
> I did a single patch for all of drivers/mailbox. While I usually prefer
> to do one logical change per patch, this seems to be overengineering
> here as the individual changes are really trivial and shouldn't be much
> in the way for stable backports. But I'll happily split the patch if you
> prefer it split.
>
> This is based on today's next, if conflicts arise when you apply it at
> some later time and don't want to resolve them, feel free to just drop
> the changes to the conflicting files. I'll notice and followup at a
> later time then. Or ask me for a fixed resend.
>
> Best regards
> Uwe
>
>  drivers/mailbox/bcm-flexrm-mailbox.c    | 2 +-
>  drivers/mailbox/bcm-pdc-mailbox.c       | 2 +-
>  drivers/mailbox/imx-mailbox.c           | 2 +-
>  drivers/mailbox/mailbox-test.c          | 4 ++--
>  drivers/mailbox/mtk-cmdq-mailbox.c      | 2 +-
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 2 +-
>  drivers/mailbox/qcom-ipcc.c             | 2 +-
>  drivers/mailbox/stm32-ipcc.c            | 2 +-


>  drivers/mailbox/sun6i-msgbox.c          | 4 ++--

Acked-by: Chen-Yu Tsai <wens@csie.org>

>  drivers/mailbox/tegra-hsp.c             | 2 +-
>  drivers/mailbox/zynqmp-ipi-mailbox.c    | 2 +-
>  11 files changed, 13 insertions(+), 13 deletions(-)
>

