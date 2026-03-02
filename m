Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862C9EA4E3F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 16:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32KLibA2LnxuiBPJQhexbcq4h5vz7CZtFSoqgdy1YZE=; b=zxrwXIwK27ZULLYEjLYcZLnG6t
	DcHET25ViinfOgs6hNpVaTP5kRYM+2O5V45WukC5zvLoy2fzpmlgQhG+/HpHuxalWBKa7mm2RXGJT
	KzbkwVwHsmWdEEyioIyTI0Ij30UP5DlnaXH0D1tCGnCkRv3puU0XiD18NixAZLfWjqwpeGAIuRKY/
	l8FpGc29I3ub7F1bU10nSy5uTaIISLVGUf1EB0p+l06uG2TFUQKpCJDhUSmSvGyoxdCt+mKpAnBO5
	EmcM5PKiZ3yPCu9BK0m7ZWpF25huQNZX+mqq2GpzC/qKCGNcXg9+rgEth8RvOhaEVIIICHfa7KxXD
	qY+CS61A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6IA-0000000DVl5-3rCq;
	Mon, 02 Mar 2026 16:38:46 +0000
Received: from mail-qk1-f173.google.com ([209.85.222.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6I8-0000000DVkK-0wez
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 16:38:46 +0000
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8cb3825b0fbso448096985a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 08:38:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772469522; x=1773074322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32KLibA2LnxuiBPJQhexbcq4h5vz7CZtFSoqgdy1YZE=;
        b=rySs6dYL8kbdr0Z/H5t54EJGBLOjIgId31Zq9RLlUuzD2Cw3ftOVVRXpwKNvE2HL8/
         LZz2XDebYhzyLMDpUVhWLIpmLI5dZsaL7KPXS5ARgIUcWRcmBYeEGbA7dAarVvfZGpav
         xTS8WmppPgvhkN0SkDeGsObM7hUlyaSQRZxrmtBkrUXn5CBWM1ISO3wvNgDanruJDfCw
         lFpnOojqG+N5BhNzvBInG9AgoQ8LHpVs/+W9AS6TXKuTZ+evXLFoOy3p7P0VQfowz/8z
         LGWsLv47+jBFV4GNy8aXqCNmlczXsCH0n7BcfrKckOlMh8LuswKTNXEWtuAdQWPZjROC
         Fczg==
X-Forwarded-Encrypted: i=1; AJvYcCWJCt5BYNgxJZCjtrQ1x0zMAuCO+MFewEkyuHZdRTLf/JWB7J8FiOTaj6ydOoFukELU+zsd5p2/AJTBZ0m485wQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwDnUvCobczTI9arotLpDSqVNrHokg587Bl3y66m3CvyUEJIkCx
	IStpQgU8lSN6E/DJTDucEenCCGVdrHCDdk6DHfSfHm9XHJAHA6EMJoLIFCRsdp/p
X-Gm-Gg: ATEYQzwKFSI17gdtYc40yDHqx1R3bjXv0HRX2MvEE66Mt4T9I1fWyRd7TP8cwiZOAtv
	P35f167wagcz5BTDcu3SwUztU2VrzrsxHdh5TXmKMjU+zYc7AvjYIDsQxhHGXtRFU1xTkqYVNeW
	i019lK2UBHU9sXt5JiBDVp9hDbooOQ5PFDXG6BIMufq+KlPof4Xulxr8rMB9jzCHIgLti73n25p
	bJtSGeXLTPDrx48m5eMREK/LtcXiYT4534Sy/ZmgXChl5VoxyF+AqBWWwlHeKayqE742WMwG+Zl
	/4GJjJo6qT2Bg/NeJYayIXkRzTAQCcalMapjX+jgBGBlsrE4O+DLejB4UhP0Kpfzla0P0dRpC07
	isxxIQ1oAdg9rUE2ZviDFUJdF8HHduqd9SeqDBgALRw3nvH+Aakr9/M5NzMrVIc6B0Z00HqdOJb
	hvSPub3U7+CwoRKNolWEsAzArv2v6jWFoGluqr8FmCrZbIq9F+P1rqb/feMUegx2+m
X-Received: by 2002:a05:620a:4410:b0:8ca:3c67:8914 with SMTP id af79cd13be357-8cbc8e17411mr1678255085a.72.1772469522486;
        Mon, 02 Mar 2026 08:38:42 -0800 (PST)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6f5c41sm1169504985a.24.2026.03.02.08.38.42
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 08:38:42 -0800 (PST)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cb4097794dso457556485a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 08:38:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUoX3jpUm4d4L1vIbL8IhFDAUx2a6qFXg7Qa2uH7JKMwgX+CUZewTI62v82SR3eoWq2f8wIbqr/VIVmadnjY9tv@lists.infradead.org
X-Received: by 2002:a05:6102:a4c:b0:5ee:a1e5:6504 with SMTP id
 ada2fe7eead31-5ff3257ef76mr5247593137.36.1772469141709; Mon, 02 Mar 2026
 08:32:21 -0800 (PST)
MIME-Version: 1.0
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com> <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com>
In-Reply-To: <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 17:32:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-rdzLhOFEJYBXzCYX5jH2E1=ydGWKgNkD0Nqx-tGr4Q@mail.gmail.com>
X-Gm-Features: AaiRm53oB2X0Qg0vbG2fw10FsfcqVt_uYNXkS-NKRd6s-Lft2nvlJyc42VLB5T0
Message-ID: <CAMuHMdX-rdzLhOFEJYBXzCYX5jH2E1=ydGWKgNkD0Nqx-tGr4Q@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] soc: renesas: don't access of_root directly
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_083844_272431_21C3A7A1 
X-CRM114-Status: GOOD (  26.66  )
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

Hi Bartosz,

On Mon, 23 Feb 2026 at 14:38, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
> to retrieve the relevant information.
>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

> --- a/drivers/soc/renesas/renesas-soc.c
> +++ b/drivers/soc/renesas/renesas-soc.c

> @@ -468,7 +469,11 @@ static int __init renesas_soc_init(void)
>         const char *soc_id;
>         int ret;
>
> -       match = of_match_node(renesas_socs, of_root);
> +       struct device_node *root __free(device_node) = of_find_node_by_path("/");
> +       if (!root)
> +               return -ENOENT;
> +
> +       match = of_match_node(renesas_socs, root);
>         if (!match)
>                 return -ENODEV;
>

I still find it silly to add a call to of_find_node_by_path().
In your reply to my comment on v1, you said you don't want to add
another helper.

Currently we have two helpers in this area:
  1. of_machine_device_match(), which returns bool, and tells if a
     match is available,
  2. of_machine_get_match_data(), which returns the match data, if a
     match is available.
But there is no helper to return the actual match?
of_machine_device_match() would be fine, if it wouldn't cast the result
to bool...

As there is no cost (binary size-wise) in having the helper that returns
the match, too, I have sent a series[1] to do that. The last patch[2]
is an alternative to this patch, avoiding the need to add a call to
of_find_node_by_path().

[1] "[PATCH 0/7] of: Add and use of_machine_get_match() helper"
    https://lore.kernel.org/cover.1772468323.git.geert+renesas@glider.be
[2] "[PATCH 7/7] soc: renesas: Convert to of_machine_get_match()"
    https://lore.kernel.org/10876b30a8bdb7d1cfcc2f23fb859f2ffea335fe.1772468323.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

