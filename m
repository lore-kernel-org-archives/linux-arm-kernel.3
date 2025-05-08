Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D07C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 11:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4I3mCeE7NaxK25rclKHFgvE1pFxuXrcbii3YouC46fI=; b=03czv4PBr1yLo8YsW9SWTTTcNq
	rvZCtw+EJwGMSEyAvOdz1Z7B0viynHQvalFyhKq6KxPjdHjq9mdGkE3KP5r4HnROnwJzS8dXXa+Pt
	k+8fux8W+mlJrXthNeQ9IRsKr7lQlbwK9v64XaTPOrM8tjio2OOenlRAQFQ33oL6PdGh7MtTSaH4i
	1sCn5nesQQ63CPpWv99LYnf2T4IDpFp1ig4JZg+NN39YbCdYg06Zo08E47x+cF8BlWQwEDIue2+F3
	uDk9Imx6U/dSnAYzf1akP6aX5tg9LPEiGn7Z4cpGV+TXRHvSL19ZfQ8XF1C0dzhLO6BXv4MdoCbUB
	cgbQS50Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCzYk-00000000VHx-13kO;
	Thu, 08 May 2025 11:37:02 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCzWl-00000000V05-1DXD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 11:35:01 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-e75668006b9so975667276.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 04:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746704098; x=1747308898; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4I3mCeE7NaxK25rclKHFgvE1pFxuXrcbii3YouC46fI=;
        b=F5YINPNKnzxAi5kOkcWSROfIdIzmXLljApUJkQGWUbQWgeEsIG0AJ0/s6pqxQcP7Zo
         T+ST5hEaLOnr1I4Qrl34eGjbECAK5qbuh5ceDVLbsbXXgOflLiRs49GUAtL9cKVXUOh0
         0gP8QUzm6qGkuWHhvDQGQ5T+01+LjfkgcyDiNoPj2Ud/ZSVW6OgdN5F2KDQ8Ni30klNP
         SP8BqmgYqpF2KKqTZBAzCMxnyXTLDnWQhUTRkWQAM/9srqAElW2qs5/BkF4/1tc7uG1t
         eute6wJUM1uF9sL5TST/2K9o5bMT6PClunnN4BMwMQQHzfSGTCIpMR1oKNNm3IQvj57+
         5ecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746704098; x=1747308898;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4I3mCeE7NaxK25rclKHFgvE1pFxuXrcbii3YouC46fI=;
        b=dHdA6j/C9ctEwEw7e0Qte8nx16jVzdvp14V2t3W7RoMmeIOEWccbLZtvuoT9x8BcHd
         TAAev2RlDknhHWlAAwFjtGQFmO7B5KdZKXf2MqgZRmIUpVGjhEtTWtXnk8JIr/hE3kCM
         saySWVpkRClj+HzDqFJU71U/AvJ5OQ7Xmp9YCAhauaiXIVXkQiBSmxtVVL7N+udQFhlT
         N1D6g4qi+0b+Q5zlHE9yTKWoTInqGxdQTnCeNI3ViBJpsw5Stjw2XTy5e2rW3/SP9rZH
         JrCU05IucwboFfhbH7PqApSxJji8QtV0vr8ChXkkFL+LH3J+q7LFXT3a5OsxmJQedlHX
         C6Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWNIEiDNwxI9atOPuBEhug5jJWPgpizUkkCb5+HaaeR/fBuCy2Z885xb+sTtChoTdhYqFfgDmXtqbLgGBzDAu6H@lists.infradead.org
X-Gm-Message-State: AOJu0Yzlz1iaLk56j2U7fAEbJN58eScwo0+JWylPCPfYXARE3uNbd6DI
	As+o60+c4vZYpQKk/zFryooyJ3IIFQwHQvQKG5ewpIbuXlzkUmxvycjnR52e6C0q394xnaFDzWa
	n+MG/X8yyGqKb11FqlX0JQ28OZpgb+CweF8Ffcg==
X-Gm-Gg: ASbGnct8bw/XmDt9xuXVaJHnHXojTlvw1PDVi27L2serOiJPnczWa5iF/8Knoq1DY7G
	+Hz9sG0xRMN5Af7EdG8LrmC/saWvHXDUXNPTTweHscBqSQMfG5Y8AEW/IYrMcbPBVL1jbbTADqk
	1OOUs9HlPZQkpWNYfeEFzgZH/o4GaSE0Yk8g==
X-Google-Smtp-Source: AGHT+IFISwEmEaUPEIGkAw+pjWlFVBT86sEjNE/qTVOISvnuF8D1u+N13cESKrEtVLIEhG9cDQKZ22WKp9cDBmU869o=
X-Received: by 2002:a05:6902:230f:b0:e73:1ff1:ca2f with SMTP id
 3f1490d57ef6-e78ef6f7c55mr3350492276.32.1746704097920; Thu, 08 May 2025
 04:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <edc560afe2a8763c93341d161daeb8b33ba606c6.1746199917.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <edc560afe2a8763c93341d161daeb8b33ba606c6.1746199917.git.christophe.jaillet@wanadoo.fr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 8 May 2025 13:34:22 +0200
X-Gm-Features: ATxdqUFTyHds9ofNJKemjngwN8NRV53Nc2rYed1UjoRSW5B2VKN5wXgtKbJ3AXY
Message-ID: <CAPDyKFpQPj8ky-QkOTgb0KQFoj+cP0EPE-uFu_MQozPC2vosOQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: amlogic: Constify some structures
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_043459_339161_910EC52E 
X-CRM114-Status: GOOD (  20.98  )
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

On Fri, 2 May 2025 at 17:32, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Most structures in this driver are not modified.
>
> Constifying these structures moves some data to a read-only section, so
> increase overall security, especially when the structure holds some
> function pointers. (This is the case for see meson_ee_pwrc_domain_desc)
>
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text    data     bss     dec     hex filename
>    8924    3832       0   12756    31d4 drivers/pmdomain/amlogic/meson-ee-pwrc.o
>
> After:
> =====
>    text    data     bss     dec     hex filename
>   12396     336       0   12732    31bc drivers/pmdomain/amlogic/meson-ee-pwrc.o
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for next, thanks!

Kind regards
Uffe

> ---
> Compile tested-only.
> ---
>  drivers/pmdomain/amlogic/meson-ee-pwrc.c | 78 ++++++++++++------------
>  1 file changed, 39 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/pmdomain/amlogic/meson-ee-pwrc.c b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> index fbb2b4103930..55c8c9f66a1b 100644
> --- a/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> @@ -69,27 +69,27 @@ struct meson_ee_pwrc_domain_desc {
>         char *name;
>         unsigned int reset_names_count;
>         unsigned int clk_names_count;
> -       struct meson_ee_pwrc_top_domain *top_pd;
> +       const struct meson_ee_pwrc_top_domain *top_pd;
>         unsigned int mem_pd_count;
> -       struct meson_ee_pwrc_mem_domain *mem_pd;
> +       const struct meson_ee_pwrc_mem_domain *mem_pd;
>         bool (*is_powered_off)(struct meson_ee_pwrc_domain *pwrc_domain);
>  };
>
>  struct meson_ee_pwrc_domain_data {
>         unsigned int count;
> -       struct meson_ee_pwrc_domain_desc *domains;
> +       const struct meson_ee_pwrc_domain_desc *domains;
>  };
>
>  /* TOP Power Domains */
>
> -static struct meson_ee_pwrc_top_domain gx_pwrc_vpu = {
> +static const struct meson_ee_pwrc_top_domain gx_pwrc_vpu = {
>         .sleep_reg = GX_AO_RTI_GEN_PWR_SLEEP0,
>         .sleep_mask = BIT(8),
>         .iso_reg = GX_AO_RTI_GEN_PWR_SLEEP0,
>         .iso_mask = BIT(9),
>  };
>
> -static struct meson_ee_pwrc_top_domain meson8_pwrc_vpu = {
> +static const struct meson_ee_pwrc_top_domain meson8_pwrc_vpu = {
>         .sleep_reg = MESON8_AO_RTI_GEN_PWR_SLEEP0,
>         .sleep_mask = BIT(8),
>         .iso_reg = MESON8_AO_RTI_GEN_PWR_SLEEP0,
> @@ -104,20 +104,20 @@ static struct meson_ee_pwrc_top_domain meson8_pwrc_vpu = {
>                 .iso_mask = BIT(__bit),                         \
>         }
>
> -static struct meson_ee_pwrc_top_domain sm1_pwrc_vpu = SM1_EE_PD(8);
> -static struct meson_ee_pwrc_top_domain sm1_pwrc_nna = SM1_EE_PD(16);
> -static struct meson_ee_pwrc_top_domain sm1_pwrc_usb = SM1_EE_PD(17);
> -static struct meson_ee_pwrc_top_domain sm1_pwrc_pci = SM1_EE_PD(18);
> -static struct meson_ee_pwrc_top_domain sm1_pwrc_ge2d = SM1_EE_PD(19);
> +static const struct meson_ee_pwrc_top_domain sm1_pwrc_vpu = SM1_EE_PD(8);
> +static const struct meson_ee_pwrc_top_domain sm1_pwrc_nna = SM1_EE_PD(16);
> +static const struct meson_ee_pwrc_top_domain sm1_pwrc_usb = SM1_EE_PD(17);
> +static const struct meson_ee_pwrc_top_domain sm1_pwrc_pci = SM1_EE_PD(18);
> +static const struct meson_ee_pwrc_top_domain sm1_pwrc_ge2d = SM1_EE_PD(19);
>
> -static struct meson_ee_pwrc_top_domain g12a_pwrc_nna = {
> +static const struct meson_ee_pwrc_top_domain g12a_pwrc_nna = {
>         .sleep_reg = GX_AO_RTI_GEN_PWR_SLEEP0,
>         .sleep_mask = BIT(16) | BIT(17),
>         .iso_reg = GX_AO_RTI_GEN_PWR_ISO0,
>         .iso_mask = BIT(16) | BIT(17),
>  };
>
> -static struct meson_ee_pwrc_top_domain g12a_pwrc_isp = {
> +static const struct meson_ee_pwrc_top_domain g12a_pwrc_isp = {
>         .sleep_reg = GX_AO_RTI_GEN_PWR_SLEEP0,
>         .sleep_mask = BIT(18) | BIT(19),
>         .iso_reg = GX_AO_RTI_GEN_PWR_ISO0,
> @@ -154,39 +154,39 @@ static struct meson_ee_pwrc_top_domain g12a_pwrc_isp = {
>         { __reg, BIT(14) },                                     \
>         { __reg, BIT(15) }
>
> -static struct meson_ee_pwrc_mem_domain axg_pwrc_mem_vpu[] = {
> +static const struct meson_ee_pwrc_mem_domain axg_pwrc_mem_vpu[] = {
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
>         VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
>  };
>
> -static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_vpu[] = {
> +static const struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_vpu[] = {
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG1),
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG2),
>         VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
>  };
>
> -static struct meson_ee_pwrc_mem_domain gxbb_pwrc_mem_vpu[] = {
> +static const struct meson_ee_pwrc_mem_domain gxbb_pwrc_mem_vpu[] = {
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG1),
>         VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
>  };
>
> -static struct meson_ee_pwrc_mem_domain meson_pwrc_mem_eth[] = {
> +static const struct meson_ee_pwrc_mem_domain meson_pwrc_mem_eth[] = {
>         { HHI_MEM_PD_REG0, GENMASK(3, 2) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain meson8_pwrc_audio_dsp_mem[] = {
> +static const struct meson_ee_pwrc_mem_domain meson8_pwrc_audio_dsp_mem[] = {
>         { HHI_MEM_PD_REG0, GENMASK(1, 0) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain meson8_pwrc_mem_vpu[] = {
> +static const struct meson_ee_pwrc_mem_domain meson8_pwrc_mem_vpu[] = {
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG1),
>         VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
>  };
>
> -static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_vpu[] = {
> +static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_vpu[] = {
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG1),
>         VPU_MEMPD(HHI_VPU_MEM_PD_REG2),
> @@ -198,28 +198,28 @@ static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_vpu[] = {
>         VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
>  };
>
> -static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_nna[] = {
> +static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_nna[] = {
>         { HHI_NANOQ_MEM_PD_REG0, 0xff },
>         { HHI_NANOQ_MEM_PD_REG1, 0xff },
>  };
>
> -static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_usb[] = {
> +static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_usb[] = {
>         { HHI_MEM_PD_REG0, GENMASK(31, 30) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_pcie[] = {
> +static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_pcie[] = {
>         { HHI_MEM_PD_REG0, GENMASK(29, 26) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_ge2d[] = {
> +static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_ge2d[] = {
>         { HHI_MEM_PD_REG0, GENMASK(25, 18) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain axg_pwrc_mem_audio[] = {
> +static const struct meson_ee_pwrc_mem_domain axg_pwrc_mem_audio[] = {
>         { HHI_MEM_PD_REG0, GENMASK(5, 4) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
> +static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
>         { HHI_MEM_PD_REG0, GENMASK(5, 4) },
>         { HHI_AUDIO_MEM_PD_REG0, GENMASK(1, 0) },
>         { HHI_AUDIO_MEM_PD_REG0, GENMASK(3, 2) },
> @@ -235,12 +235,12 @@ static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
>         { HHI_AUDIO_MEM_PD_REG0, GENMASK(27, 26) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_nna[] = {
> +static const struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_nna[] = {
>         { G12A_HHI_NANOQ_MEM_PD_REG0, GENMASK(31, 0) },
>         { G12A_HHI_NANOQ_MEM_PD_REG1, GENMASK(31, 0) },
>  };
>
> -static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_isp[] = {
> +static const struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_isp[] = {
>         { G12A_HHI_ISP_MEM_PD_REG0, GENMASK(31, 0) },
>         { G12A_HHI_ISP_MEM_PD_REG1, GENMASK(31, 0) },
>  };
> @@ -270,14 +270,14 @@ static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_isp[] = {
>
>  static bool pwrc_ee_is_powered_off(struct meson_ee_pwrc_domain *pwrc_domain);
>
> -static struct meson_ee_pwrc_domain_desc axg_pwrc_domains[] = {
> +static const struct meson_ee_pwrc_domain_desc axg_pwrc_domains[] = {
>         [PWRC_AXG_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, axg_pwrc_mem_vpu,
>                                      pwrc_ee_is_powered_off, 5, 2),
>         [PWRC_AXG_ETHERNET_MEM_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
>         [PWRC_AXG_AUDIO_ID] = MEM_PD("AUDIO", axg_pwrc_mem_audio),
>  };
>
> -static struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
> +static const struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
>         [PWRC_G12A_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, g12a_pwrc_mem_vpu,
>                                      pwrc_ee_is_powered_off, 11, 2),
>         [PWRC_G12A_ETH_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
> @@ -287,13 +287,13 @@ static struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
>                                     pwrc_ee_is_powered_off),
>  };
>
> -static struct meson_ee_pwrc_domain_desc gxbb_pwrc_domains[] = {
> +static const struct meson_ee_pwrc_domain_desc gxbb_pwrc_domains[] = {
>         [PWRC_GXBB_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, gxbb_pwrc_mem_vpu,
>                                      pwrc_ee_is_powered_off, 12, 2),
>         [PWRC_GXBB_ETHERNET_MEM_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
>  };
>
> -static struct meson_ee_pwrc_domain_desc meson8_pwrc_domains[] = {
> +static const struct meson_ee_pwrc_domain_desc meson8_pwrc_domains[] = {
>         [PWRC_MESON8_VPU_ID]  = VPU_PD("VPU", &meson8_pwrc_vpu,
>                                        meson8_pwrc_mem_vpu,
>                                        pwrc_ee_is_powered_off, 0, 1),
> @@ -303,7 +303,7 @@ static struct meson_ee_pwrc_domain_desc meson8_pwrc_domains[] = {
>                                                 meson8_pwrc_audio_dsp_mem),
>  };
>
> -static struct meson_ee_pwrc_domain_desc meson8b_pwrc_domains[] = {
> +static const struct meson_ee_pwrc_domain_desc meson8b_pwrc_domains[] = {
>         [PWRC_MESON8_VPU_ID]  = VPU_PD("VPU", &meson8_pwrc_vpu,
>                                        meson8_pwrc_mem_vpu,
>                                        pwrc_ee_is_powered_off, 11, 1),
> @@ -313,7 +313,7 @@ static struct meson_ee_pwrc_domain_desc meson8b_pwrc_domains[] = {
>                                                 meson8_pwrc_audio_dsp_mem),
>  };
>
> -static struct meson_ee_pwrc_domain_desc sm1_pwrc_domains[] = {
> +static const struct meson_ee_pwrc_domain_desc sm1_pwrc_domains[] = {
>         [PWRC_SM1_VPU_ID]  = VPU_PD("VPU", &sm1_pwrc_vpu, sm1_pwrc_mem_vpu,
>                                     pwrc_ee_is_powered_off, 11, 2),
>         [PWRC_SM1_NNA_ID]  = TOP_PD("NNA", &sm1_pwrc_nna, sm1_pwrc_mem_nna,
> @@ -576,32 +576,32 @@ static void meson_ee_pwrc_shutdown(struct platform_device *pdev)
>         }
>  }
>
> -static struct meson_ee_pwrc_domain_data meson_ee_g12a_pwrc_data = {
> +static const struct meson_ee_pwrc_domain_data meson_ee_g12a_pwrc_data = {
>         .count = ARRAY_SIZE(g12a_pwrc_domains),
>         .domains = g12a_pwrc_domains,
>  };
>
> -static struct meson_ee_pwrc_domain_data meson_ee_axg_pwrc_data = {
> +static const struct meson_ee_pwrc_domain_data meson_ee_axg_pwrc_data = {
>         .count = ARRAY_SIZE(axg_pwrc_domains),
>         .domains = axg_pwrc_domains,
>  };
>
> -static struct meson_ee_pwrc_domain_data meson_ee_gxbb_pwrc_data = {
> +static const struct meson_ee_pwrc_domain_data meson_ee_gxbb_pwrc_data = {
>         .count = ARRAY_SIZE(gxbb_pwrc_domains),
>         .domains = gxbb_pwrc_domains,
>  };
>
> -static struct meson_ee_pwrc_domain_data meson_ee_m8_pwrc_data = {
> +static const struct meson_ee_pwrc_domain_data meson_ee_m8_pwrc_data = {
>         .count = ARRAY_SIZE(meson8_pwrc_domains),
>         .domains = meson8_pwrc_domains,
>  };
>
> -static struct meson_ee_pwrc_domain_data meson_ee_m8b_pwrc_data = {
> +static const struct meson_ee_pwrc_domain_data meson_ee_m8b_pwrc_data = {
>         .count = ARRAY_SIZE(meson8b_pwrc_domains),
>         .domains = meson8b_pwrc_domains,
>  };
>
> -static struct meson_ee_pwrc_domain_data meson_ee_sm1_pwrc_data = {
> +static const struct meson_ee_pwrc_domain_data meson_ee_sm1_pwrc_data = {
>         .count = ARRAY_SIZE(sm1_pwrc_domains),
>         .domains = sm1_pwrc_domains,
>  };
> --
> 2.49.0
>

