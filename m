Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3166EE8FDB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 10:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEHua9B0eiJ9krPOOGN9l1YijNcHX4oQExQFKvr6EFA=; b=LNfi+bhXLkh4NHhdmzEwwY1LYM
	jL5+oxu7tj2QcurXGiiUaDoZ6QSsws+rkTNhaESkntdSw4tdodQ5hXpZWh0l1VHjEZJzLlZSEVgN6
	gqvUPRoJ3cY8j+Y2BimpdtAdlnn5Q9V92pF5jhEwE/9P954Qo2qDQjC6HH2SREthWoNbHPxVLd7++
	zJBWQWGsxGqwaY/lwmwMACxbOK75vUdHL0nMBQi2NIZXc4scf13M1GPCvxNsiv2rfZVmp4jxHNGvq
	9R0CGM6YateqIdk7gu0/DGSHC25JQSs3Xs+n0mfPd0NIcm95eClZ1ZK6NOS43BjBV5+AkNhmp/wWr
	pmzrWaig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaALG-00000003Z47-3utk;
	Mon, 29 Dec 2025 10:19:10 +0000
Received: from mail-vk1-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaALE-00000003Z3g-27B0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 10:19:09 +0000
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-55b09d690dcso3116377e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 02:19:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767003546; x=1767608346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEHua9B0eiJ9krPOOGN9l1YijNcHX4oQExQFKvr6EFA=;
        b=WOe9EMEzqCYMI1SyWj5n1hdS94pN8tBZirrbKQxT20qdPzGJMq8dJk0MAo5p8iSlvU
         70Mmsu0sKQmwuTF0bOCnmRAP+Fe63WCcmVO9BrY85AH98v59ft2kfPB+1ToiWrik3auy
         kO+qwJXmc1jejNgCj7ZOPyEOQcYx1bhSnLf4xWpwCtQJkFN0VVC5ruOqBes4o+dlvsUt
         GTDvpG1VA5sWiBIbsVdGaHh2G1m40rVdgjgaZDTFBOB2u+rBryF0IvwXHyK0v0OxTcVz
         8tvC22pcffqSJ1D5RzqzZPEmW+Al4KlIuI8w0fflWKQu4xd1ln0lb13Ji8eeITnCdbHg
         fYcg==
X-Forwarded-Encrypted: i=1; AJvYcCWExQdohyZMFkRXiH8XLAIEw0HhlhgjS8or59GJrwA3TuPhsKito2Iy17rPfm8tRwyce00MbxRVvn57PeMPNsIQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyB1L94I1VqB9SFIh8GLP/lPtMDMF/lpbFARK5bdngrsjJgxLbB
	glCsqoGVSJjYad2UXpRH+DhqkhWzp3aKiMfJ7aLhmc0AIsox68yZDnAEfLJVms7s
X-Gm-Gg: AY/fxX475FgqcQOTqzmzWvv37Yi8+wHIQxkdkQ6SmjNvZ1ICPjvJ8CEScRRNSe2cy9d
	6ZG7r4AL7Ur34F7wdK4WYoI27pnJ7sNqiD7qeuZZqqVtUYSMDBGY/cf2d+1A0unf/WggrWQPZ8S
	wvsuJxMWbn4tAkRG6t8BGjyl240t2FAH6c55KNKJ3tkuggJpbPzCk0A45cOb9MY2o5ncnX86vGq
	zN0XW8AupCgdyw5X9DCTuVYUUV9I6XWbMs/xjnVAnvQyiyPC69U2t2pMkOMy+eeoyw6J2QjxM6+
	v01FHR/ysaGy5mqtosiX3Ha3SfkRYrpUL23VWjbljEF7GytOE//jnYQgsIGxely5SDytZjBKdvP
	4p40WETqaniGao9n05TqcAdcFjpKL+sDNSW7Ws+nOTBk+kXx/B41HmQTDkBonSSw+Qcc9voy33m
	rS7/5DmxDhF1p3jrPn5oejkqnjxcdiEnetE+Uu3iutXBV6apIjOBcG
X-Google-Smtp-Source: AGHT+IHYL9gf9lIXX0B252LVn0mb66y9LXExa6mBbOvDaJqx8b/Rw2j8HcC5hNDjUOfIYxx7dcCsgQ==
X-Received: by 2002:a05:6122:884:b0:55b:d85:5073 with SMTP id 71dfb90a1353d-5615bd1b390mr10680004e0c.4.1767003546234;
        Mon, 29 Dec 2025 02:19:06 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d04b70fsm9287395e0c.4.2025.12.29.02.19.03
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 02:19:04 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-55e8c539b11so6303976e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 02:19:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXFa1aXbRx3/F6gehNNfTifv84yc5RqdGsYI0qWqS/kINU8NU6E/2nUm4AEKZ6830bOjy2gabrh377E94yV1vSi@lists.infradead.org
X-Received: by 2002:a05:6122:d85:b0:557:ddc4:dea4 with SMTP id
 71dfb90a1353d-5615bd7150bmr9849393e0c.5.1767003543582; Mon, 29 Dec 2025
 02:19:03 -0800 (PST)
MIME-Version: 1.0
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com> <20251212-phy-clk-round-rate-v3-9-beae3962f767@redhat.com>
In-Reply-To: <20251212-phy-clk-round-rate-v3-9-beae3962f767@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Dec 2025 11:18:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXudWW3MPKqP0-d+DyMNRF-X62oyHRnj=MM_9MSpJw6sw@mail.gmail.com>
X-Gm-Features: AQt7F2rKWfaXfoMj8qssy3Tj3BKKzf9SWfuNGXkoZ2xYV04eFqP8YoD995Ts3mk
Message-ID: <CAMuHMdXudWW3MPKqP0-d+DyMNRF-X62oyHRnj=MM_9MSpJw6sw@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] phy: ti: phy-j721e-wiz: convert from round_rate()
 to determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_021908_551838_2514FFB5 
X-CRM114-Status: GOOD (  24.13  )
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

Hi Brian,

On Fri, 12 Dec 2025 at 00:21, Brian Masney <bmasney@redhat.com> wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Thanks for your patch, which is now commit 27287e3b52b5954b ("phy:
ti: phy-j721e-wiz: convert from round_rate() to determine_rate()")
in phy/next

> --- a/drivers/phy/ti/phy-j721e-wiz.c
> +++ b/drivers/phy/ti/phy-j721e-wiz.c
> @@ -934,12 +934,15 @@ static unsigned long wiz_clk_div_recalc_rate(struct clk_hw *hw,
>         return divider_recalc_rate(hw, parent_rate, val, div->table, 0x0, 2);
>  }
>
> -static long wiz_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
> -                                  unsigned long *prate)
> +static int wiz_clk_div_determine_rate(struct clk_hw *hw,
> +                                     struct clk_rate_request *req)
>  {
>         struct wiz_clk_divider *div = to_wiz_clk_div(hw);
>
> -       return divider_round_rate(hw, rate, prate, div->table, 2, 0x0);
> +       req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
> +                                      div->table, 2, 0x0);

Is this correct?  divider_round_rate() can return a negative error code
(from divider_ro_determine_rate()), which is not handled here?

Looks like several other users of divider_round_rate() use this
same logic, and thus are affected, too.

> +
> +       return 0;
>  }
>
>  static int wiz_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

