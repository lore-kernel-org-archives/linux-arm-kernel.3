Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D30C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 12:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MQ/1ab/AMMhwdUM5h+TBMpEY47u6kr9GW+SYGBdGrF8=; b=aQt5CFwaEDmDVC790Gbbcq3Hgl
	dv0dxWJH9SomADcirV/DFwRfmolIdMoq1/Xl+86iZWs+XFDHoU42AqgmvG69sOKTRrMbWb9jHR1QS
	HSrEA9ALrCu/sH6MrVwgzCuA4xFxDwdMngNQo73nDf2PeKlhjQrE6h2tENQoQe2P9vbjMiv0DdbS7
	vSrprg+NS3JlehgpytAdrNYCYODE0+foyB7HBKWtU16H6JeBJx/OHhVqAQixAsIV5Ceo4f9yKNWt2
	vWPjWJfEdYROkG+5tTmf8Jm2d4tYPl14LU++b00tipXqbUDtFiAYhmPTqu/n8TGlL6O5C+ZHKg7xm
	nkCwDp+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiCER-00000007Pq1-1foT;
	Wed, 12 Feb 2025 12:52:47 +0000
Received: from mail-vk1-f178.google.com ([209.85.221.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiCD0-00000007Pbl-2HH8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 12:51:19 +0000
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-51eb1a6954cso1861903e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 04:51:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739364676; x=1739969476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQ/1ab/AMMhwdUM5h+TBMpEY47u6kr9GW+SYGBdGrF8=;
        b=tN11hKR/PKLSvWu4QDBo2tIGHEYFc3lAeHq7OUFynRdFQiVswIn0K88jJBsac4GQrH
         7wFycT3iS+dYTfsL22JIQ6DoVo7igjd2jm5QsDaOhAxISOuw0xfADM4gz+EwBww1ePPf
         OI/SFYNaWDGirlAx2b7oQlZ3QZlIqLkxyzKGyB5Nkm+0Lh488zjViixgmX1QcaTtU4Aw
         RlUmmbtE6dEX6fWb1DcGKBV2ERzEmLUX+F+RPUiy4HPYko1t3aSMyQqa4qYQURbNNKn0
         wv7dvMMavlbkjh6NQXH/A/1BhzvA3MTNTEQ5m97BLV3BeQTzYsQDxstFMIUahKc6TYBP
         Gd6g==
X-Forwarded-Encrypted: i=1; AJvYcCXSwa1eHG1etpin7wuwcvbSpHszgZHF/txzL9WYpcItD4LyxRGpy98i49RDau7QG/c3sw7ETA7Eek9xY41/dO+b@lists.infradead.org
X-Gm-Message-State: AOJu0YxqgIs0kFFE6hN6vW9e+84nNyy+UmAubbCuWUScO/ttaa6fPe30
	/UQb1epgBAMdd6k5w0B2IbQF+tbfpflpNmurF+qau+kxHluDdHLxiPbrugiz
X-Gm-Gg: ASbGnct4bPRR31LuzKCGAkCIxycpQ7sBfgWfcUc9hOtjKjmlKIfkfPSdVYmgNTt806K
	BnoOpSfcBD2mJsmQ4FXEMygnnJcfopvrNB8RZcStYZ9vWStuRfIpuGzew8K4wXaD1VHmQ1q38ld
	Q1RvZK5by0NYANWXAj4i0oOkXjncZ1a+QU0BEeg0x+iRTIrYeKd9QEWVoFhhR7+r0jHYSxsYGjj
	OlPF4YT4yforZOPPpIp9MMvMCDYLNi34iIigol0E1VkyzAFgDWZAucs8Og53aJ6Xgj98KioGYzO
	mNwQ49FWpWUu2aIvwokpiFJKeZVpALAZaV4HMF8rJvfVbT8YhHzn2g==
X-Google-Smtp-Source: AGHT+IGtKkkHBNECuyeLjLKjXgzkn6/qXGPvOVtBl7cn+Xm1KEA9NK8+ghz+k5xEP69itQ1gO3DhSg==
X-Received: by 2002:a05:6122:32c6:b0:520:60c2:3fb with SMTP id 71dfb90a1353d-520678bd90cmr2363021e0c.0.1739364676119;
        Wed, 12 Feb 2025 04:51:16 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51fde67e00asm1221390e0c.18.2025.02.12.04.51.15
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 04:51:15 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-864e4f5b253so1814620241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 04:51:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVLo/bzm+989fqiMyBG4jWa3JCyk2O5XyQLHGfwtb47WK8ys239m8UIxfz0gNw6FrcL4aVN/Jh6B9n38eHRaVqF@lists.infradead.org
X-Received: by 2002:a05:6102:3709:b0:4bb:d394:46c5 with SMTP id
 ada2fe7eead31-4bbf21cdce8mr2389568137.9.1739364674977; Wed, 12 Feb 2025
 04:51:14 -0800 (PST)
MIME-Version: 1.0
References: <20250210131826.220318-1-patrice.chotard@foss.st.com> <20250210131826.220318-5-patrice.chotard@foss.st.com>
In-Reply-To: <20250210131826.220318-5-patrice.chotard@foss.st.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Feb 2025 13:51:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVkFym-3byZkszsi9tRoZ6zNOMCT79c2EgQQjn5xd19ig@mail.gmail.com>
X-Gm-Features: AWEUYZnzYg0ThTq4p4M8sQ0EhbXz6WBb20xXzFHLgeW2YGdd91BJTbWp42U4Smo
Message-ID: <CAMuHMdVkFym-3byZkszsi9tRoZ6zNOMCT79c2EgQQjn5xd19ig@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] memory: Add STM32 Octo Memory Manager driver
To: patrice.chotard@foss.st.com
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	christophe.kerello@foss.st.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_045118_581695_E793E4E2 
X-CRM114-Status: GOOD (  34.40  )
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

Hi Patrice,

On Mon, 10 Feb 2025 at 14:21, <patrice.chotard@foss.st.com> wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
>
> Octo Memory Manager driver (OMM) manages:
>   - the muxing between 2 OSPI busses and 2 output ports.
>     There are 4 possible muxing configurations:
>       - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
>         output is on port 2
>       - OSPI1 and OSPI2 are multiplexed over the same output port 1
>       - swapped mode (no multiplexing), OSPI1 output is on port 2,
>         OSPI2 output is on port 1
>       - OSPI1 and OSPI2 are multiplexed over the same output port 2
>   - the split of the memory area shared between the 2 OSPI instances.
>   - chip select selection override.
>   - the time between 2 transactions in multiplexed mode.
>   - check firewall access.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>

Thanks for your patch!

> --- a/drivers/memory/Kconfig
> +++ b/drivers/memory/Kconfig
> @@ -225,6 +225,23 @@ config STM32_FMC2_EBI
>           devices (like SRAM, ethernet adapters, FPGAs, LCD displays, ...) on
>           SOCs containing the FMC2 External Bus Interface.
>
> +config STM32_OMM
> +       tristate "STM32 Octo Memory Manager"
> +       depends on SPI_STM32_OSPI || TEST_COMPILE

COMPILE_TEST

> +       help
> +         This driver manages the muxing between the 2 OSPI busses and
> +         the 2 output ports. There are 4 possible muxing configurations:
> +         - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
> +              output is on port 2
> +         - OSPI1 and OSPI2 are multiplexed over the same output port 1
> +         - swapped mode (no multiplexing), OSPI1 output is on port 2,
> +              OSPI2 output is on port 1
> +         - OSPI1 and OSPI2 are multiplexed over the same output port 2
> +         It also manages :
> +           - the split of the memory area shared between the 2 OSPI instances.
> +           - chip select selection override.
> +           - the time between 2 transactions in multiplexed mode.
> +
>  source "drivers/memory/samsung/Kconfig"
>  source "drivers/memory/tegra/Kconfig"

> --- /dev/null
> +++ b/drivers/memory/stm32_omm.c

> +static int stm32_omm_set_amcr(struct device *dev, bool set)
> +{
> +       struct stm32_omm *omm = dev_get_drvdata(dev);
> +       struct regmap *syscfg_regmap;
> +       struct device_node *node;
> +       struct resource res, res1;
> +       resource_size_t mm_ospi2_size = 0;
> +       static const char * const mm_name[] = { "ospi1", "ospi2" };
> +       u32 amcr_base, amcr_mask;
> +       int ret, i, idx;

unsigned int i

> +       unsigned int amcr, read_amcr;
> +
> +       for (i = 0; i < omm->nb_child; i++) {
> +               idx = of_property_match_string(dev->of_node,
> +                                              "memory-region-names",
> +                                              mm_name[i]);
> +               if (idx < 0)
> +                       continue;
> +
> +               /* res1 only used on second loop iteration */
> +               res1.start = res.start;
> +               res1.end = res.end;
> +
> +               node = of_parse_phandle(dev->of_node, "memory-region", idx);
> +               if (!node)
> +                       continue;
> +
> +               ret = of_address_to_resource(node, 0, &res);
> +               if (ret) {
> +                       dev_err(dev, "unable to resolve memory region\n");
> +                       return ret;
> +               }
> +
> +               /* check that memory region fits inside OMM memory map area */
> +               if (!resource_contains(omm->mm_res, &res)) {
> +                       dev_err(dev, "%s doesn't fit inside OMM memory map area\n",
> +                               mm_name[i]);
> +                       dev_err(dev, "[0x%llx-0x%llx] doesn't fit inside [0x%llx-0x%llx]\n",
> +                               res.start, res.end,
> +                               omm->mm_res->start, omm->mm_res->end);

As reported by the kernel test robot, this fails to build when
resource_size_t differs from unsigned long long.  However, you can
easily print the full resource instead:

    dev_err(dev, "%pR doesn't fit inside %pR\n", &res, omm->mm_res);

https://elixir.bootlin.com/linux/v6.13.2/source/Documentation/core-api/printk-formats.rst#L206

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

