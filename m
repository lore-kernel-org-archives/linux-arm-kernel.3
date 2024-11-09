Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299B5D5E376
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 16:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oenLxzEzs2z/WFco/RA5EkTJEBkKi12h1iB/gMJYaSM=; b=ElGNNotK4mxY32
	+ggQ+OQGAc0I/1BBlTv52o8ps2HttDyvpEjt7b8REQEGj4YVKH8IEJWZtpsI4DvrVuOH2Ifw8Xvfk
	6RyriYfveMEBLCEriOUIwIGAUGQhf5ng7wfBJbSWHWqEZnvuWZyame8+tA4RmyQPmb5fls/fpVHJh
	PKeU8Tei2wd2B92zMRUQcyaLsgT/xSMHeBBALboXto9wjJEZVtgP9GRokPcULuzia0Xyz6Mdp9LD6
	gBKy9bKGLQ1QW6N8QDHYK9nF1EUjrazHExUMh2aUMmSZqgUJGTkvglZkjyiZdaot9/T1P80T5IrVL
	PNZRjwL7Zx/DXBQVpbHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9nx0-0000000DbiY-38W3;
	Sat, 09 Nov 2024 16:04:38 +0000
Received: from mail-lj1-f182.google.com ([209.85.208.182])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9nvF-0000000DbUk-1XSO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 16:02:51 +0000
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so26453431fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Nov 2024 08:02:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731168165; x=1731772965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oenLxzEzs2z/WFco/RA5EkTJEBkKi12h1iB/gMJYaSM=;
        b=l8np7R9YCNQvlrnnLcyte9NGchzxPjOq0htUccYe57Qfu4ExMmfhQGnviBDcmw2/Ss
         DaHd0TuJmI3wjQe538CwYo4DIzs4cI3/Fz86sqTPsTQYd+qlApr3jh5ZjdRPH6HeSGyp
         CIw3KE7g02aj3NzTLJi4PNPPywGz5p0c184muFTmpyN1wIf8dicKFJxDUD3NqD4DzocX
         T4I0TwlfCil8wooKxGdEbeF+r3Uq8UWjPy68BYo4YK9Sng08TObMR/O1ko5IRN1rQMe9
         C3eZaOpULrVzbGdSQ1SkSjMhC3xFpJKDtHGG9qkA8s4/q40AqwOTijozh9d0o6S6focd
         Qmpw==
X-Forwarded-Encrypted: i=1; AJvYcCVM3v3N3lG2ptAcEufZMnVy6TG0Yu48LXUHBcfFIPvUP7Liqf8CxQINXJZowA/0yPq85q5Of/ASZ0QkzDHL15HF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4jXMN3enrQKBrIY6UQrS1eAATymU4EAEZh3UQ3cIxbdUyvq6m
	IVaY5YmAwFI4sINq9rDVaWLIMZgi6UJ3Z9Vync1TjkczQ8XP9xgxJRNop26e
X-Google-Smtp-Source: AGHT+IFuL/s7Ss//ZDcoIMTTk2khfvSeUFTYE7NOHaL4WwdB/HRe1C6FUYE3UXZqV3iHRhQlnLnzlg==
X-Received: by 2002:a05:6512:2212:b0:536:a533:c03a with SMTP id 2adb3069b0e04-53d862d3347mr3393626e87.17.1731168165263;
        Sat, 09 Nov 2024 08:02:45 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826855a5sm976726e87.58.2024.11.09.08.02.43
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Nov 2024 08:02:43 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so26452911fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Nov 2024 08:02:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULc5eKkNrOXyQRxxmK1YoHIRvRh/fqCiLrER7J9Vy6Xre6Gxp4S3NwlRbC1wt7Oo6PF0JBmljeXx5ig1tofPnE@lists.infradead.org
X-Received: by 2002:a2e:bea8:0:b0:2fa:d84a:bd8f with SMTP id
 38308e7fff4ca-2ff2028a865mr26875221fa.30.1731168162943; Sat, 09 Nov 2024
 08:02:42 -0800 (PST)
MIME-Version: 1.0
References: <20241109003739.3440904-1-masterr3c0rd@epochal.quest>
In-Reply-To: <20241109003739.3440904-1-masterr3c0rd@epochal.quest>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 10 Nov 2024 00:02:30 +0800
X-Gmail-Original-Message-ID: <CAGb2v663xMyiEx4BpPkuRew9t8fAgbz6EENEj--8Y57E87Lgcg@mail.gmail.com>
Message-ID: <CAGb2v663xMyiEx4BpPkuRew9t8fAgbz6EENEj--8Y57E87Lgcg@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: a100: enable MMC clock reparenting
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Yangtao Li <frank@allwinnertech.com>, Maxime Ripard <mripard@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Parthiban <parthiban@linumiz.com>, 
	Andre Przywara <andre.przywara@arm.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_080249_430766_D2CA9CEA 
X-CRM114-Status: GOOD (  20.50  )
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

On Sat, Nov 9, 2024 at 8:38=E2=80=AFAM Cody Eksal <masterr3c0rd@epochal.que=
st> wrote:
>
> While testing the MMC nodes proposed in [1], it was noted that mmc0/1
> would fail to initialize, with "mmc: fatal err update clk timeout" in
> the kernel logs. A closer look at the clock definitions showed that the M=
MC
> MPs had the "CLK_SET_RATE_NO_REPARENT" flag set. No reason was given for
> adding this flag in the first place, and its original purpose is unknown,
> but it doesn't seem to make sense and results in severe limitations to MM=
C
> speeds. Thus, remove this flag from the 3 MMC MPs.
>
> [1] https://msgid.link/20241024170540.2721307-10-masterr3c0rd@epochal.que=
st
>
> Fixes: fb038ce4db55 ("clk: sunxi-ng: add support for the Allwinner A100 C=
CU")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

You should still keep the version number from the original series if
resending or increment it if changes were made.

ChenYu

> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-a100.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a100.c b/drivers/clk/sunxi-n=
g/ccu-sun50i-a100.c
> index bbaa82978716..a59e420b195d 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-a100.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a100.c
> @@ -436,7 +436,7 @@ static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc0_clk, "=
mmc0", mmc_parents, 0x830,
>                                           24, 2,        /* mux */
>                                           BIT(31),      /* gate */
>                                           2,            /* post-div */
> -                                         CLK_SET_RATE_NO_REPARENT);
> +                                         0);
>
>  static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc1_clk, "mmc1", mmc_parents,=
 0x834,
>                                           0, 4,         /* M */
> @@ -444,7 +444,7 @@ static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc1_clk, "=
mmc1", mmc_parents, 0x834,
>                                           24, 2,        /* mux */
>                                           BIT(31),      /* gate */
>                                           2,            /* post-div */
> -                                         CLK_SET_RATE_NO_REPARENT);
> +                                         0);
>
>  static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc2_clk, "mmc2", mmc_parents,=
 0x838,
>                                           0, 4,         /* M */
> @@ -452,7 +452,7 @@ static SUNXI_CCU_MP_WITH_MUX_GATE_POSTDIV(mmc2_clk, "=
mmc2", mmc_parents, 0x838,
>                                           24, 2,        /* mux */
>                                           BIT(31),      /* gate */
>                                           2,            /* post-div */
> -                                         CLK_SET_RATE_NO_REPARENT);
> +                                         0);
>
>  static SUNXI_CCU_GATE(bus_mmc0_clk, "bus-mmc0", "ahb3", 0x84c, BIT(0), 0=
);
>  static SUNXI_CCU_GATE(bus_mmc1_clk, "bus-mmc1", "ahb3", 0x84c, BIT(1), 0=
);
> --
> 2.47.0
>
>

