Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DE6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 19:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ifrsZS6VTC65RgZqrSr3SMUWgTLKO2G/Lh7qiZeZxM=; b=zBsFeRZ9W0qz4y/hgonhuail2U
	o3RxmMQwkeHi60Y1aQCTdxED4rHdERjtI+5IPyyYPdjJ4MqvsmQ5Q0PRQMLMaeaLrmRH3sYVVAPCT
	j8LYDGw7GXEkC/FUIu9AGpENa4Kh75CE2SyldRwCaCm2nQk+ccVUsRZemCPu+3VRAG/pkHnzmqclB
	N9jhmoMu5Kqw7DqA7iZgLTzOLfhcOwhk7nZo97ICzcyc8+u6k0PA8bkkZMoQmuSnNyuT3Iey/zbBR
	l1CuKdISbaApEtZ/v/puJ9Ya53DIhmcqWNJzEwgN8u4fjwgMA2Pe+Tk/an9xRQZ30ZFdfHysG2dVo
	rJV/EgVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQsz-0000000BHK8-1ecc;
	Thu, 02 Jan 2025 19:29:37 +0000
Received: from mail-vk1-f177.google.com ([209.85.221.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQro-0000000BHAB-49V7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 19:28:26 +0000
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5187cd9b8e5so3564261e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 11:28:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735846102; x=1736450902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ifrsZS6VTC65RgZqrSr3SMUWgTLKO2G/Lh7qiZeZxM=;
        b=cHn1R2EbUr2ohGIfCPKVJBSGx1BFRYlQbknt7TPLgU9CkbOuCWru0/aFcs4bQDZX0S
         9yNLId1eHxG7Ka5t+OfPUJ2NhCu92eeVkvyIGk4NalsJImJaxKGMKjZHwHvL7GQqFPqG
         dLOindKM9bq3PuZ0z9XNMAZhId5BA3ZkqxOE1V37nr7/R30ZX5CkqgSiZKRxe42tgx6v
         vdaVMNVhIJpHZ96motyEvdNXTgienZmaImJlizSKxb0AK4Ute+HNOQYdKM5vMBbnhM9O
         WLIQpabXHbkhRm5ZwE1AYWz60rjtCwj5JcXYJpg22/Jkxa2ODUokp9WLH+wB5lKvIai1
         fl9w==
X-Forwarded-Encrypted: i=1; AJvYcCWsGOV23laKggqBulYs4bNfAVE9pfR4gjjWZYYRI4UWP8utMUDT0uTk1kbOuUZ5TxQLqd7AQunTCzKTRs7SLe6v@lists.infradead.org
X-Gm-Message-State: AOJu0YwDZVArGebjEwiySRzDXC5dAZXl8XnBbR3NybAzTIydTx+gVyNI
	3I7/QTdLkpqNCc9SaiXSs1po2n7+no554GvjPVfoELyaKB2lk5Fi3CidjUZu
X-Gm-Gg: ASbGncs5BB0dOtxYixR0EiDoTkAK6nx3xbpg789krSviF4WxYmO17+yi7Zhxl5xSrvx
	DuAW2bjTuVs2CAMjw9wKVnwtwkjQZNMEYmMrwmw2J+9zM+aaJ5/gdDWSWWgbjIAIIbFldWXBxIs
	Z6G74SapM3aDDCeWgXgTiMq3eoruEyLzAoCSCVwyaXPuJn59TZEcLyVeS7IuIpInBqLBLWqRnSf
	2jG3sU9aqci2X9xvbui/dLSbFyPHDf8/D85bVbqBkq8mSYF869q+nUr1/FQ70HjbVqR4S/BRUQC
	42F2fhu8PZKo8C1sbG8=
X-Google-Smtp-Source: AGHT+IFdfkQBlAIoUiOpDNkR7sjrXdiL+9kmROi4+VxO2e8Nez8tjukbptky387Krwtw2oxyQfn8Uw==
X-Received: by 2002:a05:6122:1816:b0:517:4fb0:74bc with SMTP id 71dfb90a1353d-51b75c3fe42mr37423664e0c.3.1735846102212;
        Thu, 02 Jan 2025 11:28:22 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68bfad6dsm3059648e0c.31.2025.01.02.11.28.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 11:28:21 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4afe7429d37so2926556137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 11:28:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVGAjwC+hmKBUibjCJa6bLNIn0D3iYoCXrD89FQNbZROwX/4XFk96VIBdzr0xykjnYx0p6tHH63DDE+yXZXDGPq@lists.infradead.org
X-Received: by 2002:a05:6102:549f:b0:4b2:7996:6ba4 with SMTP id
 ada2fe7eead31-4b2cc48a41cmr36642516137.25.1735846101400; Thu, 02 Jan 2025
 11:28:21 -0800 (PST)
MIME-Version: 1.0
References: <20250102170359.761670-1-rohit.visavalia@amd.com> <20250102170359.761670-3-rohit.visavalia@amd.com>
In-Reply-To: <20250102170359.761670-3-rohit.visavalia@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Jan 2025 20:28:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV9iZK3FOXhSmvvxK=HqBe3hUnNcZZ2aL1G--XHFgN07A@mail.gmail.com>
Message-ID: <CAMuHMdV9iZK3FOXhSmvvxK=HqBe3hUnNcZZ2aL1G--XHFgN07A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] clk: xilinx: vcu: don't set pll_ref as parent of
 VCU(enc/dec) clocks
To: Rohit Visavalia <rohit.visavalia@amd.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, michal.simek@amd.com, 
	vishal.sagar@amd.com, javier.carrasco.cruz@gmail.com, geert+renesas@glider.be, 
	u.kleine-koenig@baylibre.com, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_112825_035163_E4C3C441 
X-CRM114-Status: GOOD (  23.16  )
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

Hi Rohit,

On Thu, Jan 2, 2025 at 6:04=E2=80=AFPM Rohit Visavalia <rohit.visavalia@amd=
.com> wrote:
> CCF will try to adjust parent clock to set desire clock frequency of
> child clock. So if pll_ref is not a fixed-clock then while setting rate
> of enc/dec clocks pll_ref may get change, which may make VCU malfunction.
>
> Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
> ---
> Changes in v2:
>   - none
>   - Link to v1: https://lore.kernel.org/linux-clk/20241226122023.3439559-=
3-rohit.visavalia@amd.com
> ---
>  drivers/clk/xilinx/xlnx_vcu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.=
c
> index 88b3fd8250c2..c520ae1ba65e 100644
> --- a/drivers/clk/xilinx/xlnx_vcu.c
> +++ b/drivers/clk/xilinx/xlnx_vcu.c
> @@ -547,7 +547,7 @@ static int xvcu_register_clock_provider(struct xvcu_d=
evice *xvcu)
>                 return PTR_ERR(hw);
>         xvcu->pll_post =3D hw;
>
> -       parent_data[0].fw_name =3D "pll_ref";
> +       parent_data[0].fw_name =3D "dummy_name";
>         parent_data[1].hw =3D xvcu->pll_post;
>
>         hws[CLK_XVCU_ENC_CORE] =3D

You completely ignored Stephen's comment, which suggests to not pas
CLK_SET_RATE_PARENT instead (see xvcu_clk_hw_register_leaf()).

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

