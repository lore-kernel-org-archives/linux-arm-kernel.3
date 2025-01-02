Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430F0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 10:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFIpwGB23LANAByW/n2mcZ10YJezzuFXcnQMI/Wk7QU=; b=AAhnge9PGHpZxvU+sdXRW9EJQQ
	hO8etOTEANKxbr8msd0DPFtCRnCREXCzAypCi28WC6Rl6gNGJvQBFarRPy2KvN+lgkDDxUXfC4hC9
	b8zyrRO1SRpf9Pn1SU33nUxXCZGDqT13VlSECm46vTWJBRCBOhm6yqpgWkxEAo/nwtaCpNJOxIFSk
	iyQV9O/qXd3/LQs67xFCOlEzyRLNjFX6Z8qK/+GXWit638zyTS66Xo6niu+26t7UCDuHtrFVT91q8
	bW8JSySrxwuL6vOmCJmb/1CoL+YM4L38Tp2D7BwL7NdHctkIcv7I95Ko0tXGNSDVJji6khg64GqsC
	SpNfZRdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTImm-0000000ACXB-1Iyu;
	Thu, 02 Jan 2025 10:50:40 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIkg-0000000ACFw-0F7S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 10:48:31 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3862a921123so7630007f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 02:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1735814908; x=1736419708; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GFIpwGB23LANAByW/n2mcZ10YJezzuFXcnQMI/Wk7QU=;
        b=l9lKnli2WOM1V8iy61zNO/mczkaGyWvRJRJWJ64N7RK7AjQfzVwJKKBW0sjt1kNURA
         6ye0svITdz0YaRQALemxrkUE3/6FswZx1VrLnSWGxNFrSndLIyp2xQDUfdcx05SHo1wh
         a0hSrz6gwzYSiO2PR0BeoqD9yfRtXrB13ZWlFkC/Mo44zkj6Cjy/p/rFUJELUKf+Cjck
         6E60Cf5+712ZXwKCHhluBZnr/yEn1Eq+4tyW6HWHhQTnvQcXHLaESmLVhpR8Pz+veWlM
         PXnGDlW2mGx7rz5YGyyHYcbfs8rjam3DlEIR7xilem6V3BSg9Bh0YV41Ga4jb7m30ZOh
         o/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735814908; x=1736419708;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GFIpwGB23LANAByW/n2mcZ10YJezzuFXcnQMI/Wk7QU=;
        b=nYNiUqRidy489toF8+YAAvfFj6O0towZmzXgN4P7Q7DIq8beHn1eXPBOso0Nwj6LMD
         JvUXdIo3xgpvqCmMjys8IC+ueJbiCxnk2VE3bFy+ieDWqW0UA2U2DxafAuT6sSMUqrQt
         t8SiUimAPe1Ciz0jaTODJA66suy3jGTVDIORJ4Mp/k7zClhkGM/UAMnWNkaQfEBxLPjJ
         hcrJviRVrPU8dunZ9kSm3WwXDnPP6xxq9eWnCoJVUDWZeYW9+I7n8Ofzx5aIygYU3I/9
         VCo24Ej3VcPsiy8+bxvyaw10q1LFC3UU++LwQ/dpASVR9SGSIHAOw3OnE/QwP7I3peVy
         G3SA==
X-Forwarded-Encrypted: i=1; AJvYcCWhEtqQNXd5611hfSz56osc1i6pc9kfsMkm7FvNhzvxEjWT7TJTRBkceTDwMZx6iz+XlzfhiF0tmfwj3A3s/nFM@lists.infradead.org
X-Gm-Message-State: AOJu0Yx223EMqb4O6ZqFIS60VVDIyLKxo8YoCBJueMS3oKh4rkGMX2+O
	zzPyKxXVKa+li/ZETDnD5yNyxfj9Y92SHINmMrxympiZ9xE9TvS2JtnsVK5rGFo=
X-Gm-Gg: ASbGncvJtnA1+WddwqQWnhsRgS1gFYjlh8uKA3u0Yku87ehzpFljEMloNf0ZqWo9820
	c3/wbvfHF9kxRt8nCYEZUMQ1ArNJeC0NRQXxzuunKfHI5sPm1TBAp9bsysEKSNh3eVNfv8LZCTN
	qzXbXj+5JWNY0KchCi5MayRDkMAfZiljQaZqJhwbjMkVej2fPdvqDpEpGvmcY545sAw8bbzCIFS
	YVlwJG253+aDHzc8RalkqoIOWJO4GNURTW7fn8lBb7UVcUNyjnRaDKn77YHhJpzfQ==
X-Google-Smtp-Source: AGHT+IENVLtDm//0s4zoP3FVOCZty2tw9Mx4m7bERvCUo2OJSxiEnc/IIpjbgKoYlXyGt/2cKq0SdQ==
X-Received: by 2002:adf:9b8a:0:b0:38a:4de1:ac6 with SMTP id ffacd0b85a97d-38a4de10f03mr11955498f8f.6.1735814907658;
        Thu, 02 Jan 2025 02:48:27 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e140sm38648430f8f.79.2025.01.02.02.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 02:48:27 -0800 (PST)
Message-ID: <8361a42d-0c70-4a8c-b0a0-7056ba21b508@tuxon.dev>
Date: Thu, 2 Jan 2025 12:48:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/13] clk: at91: sama7d65: add sama7d65 pmc driver
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org,
 arnd@arndb.de
Cc: dharma.b@microchip.com, mihai.sain@microchip.com,
 romain.sioen@microchip.com, varshini.rajendran@microchip.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org
References: <cover.1734723585.git.Ryan.Wanner@microchip.com>
 <549fa8590fe9b4380e413f8eed87392f28754395.1734723585.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <549fa8590fe9b4380e413f8eed87392f28754395.1734723585.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_024830_323729_4F62B748 
X-CRM114-Status: GOOD (  19.46  )
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

Hi, Ryan,

On 20.12.2024 23:07, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add clock support for SAMA7D65 SoC.
> 
> Increase maximum number of valid master clocks. The PMC for the SAMA7D65
> requires 9 master clocks.
> 
> Increase maximum amount of PLLs to 9 to support SAMA7D65 SoC PLL
> requirements.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> ---
>  drivers/clk/at91/Makefile          |    1 +
>  drivers/clk/at91/clk-master.c      |    2 +-
>  drivers/clk/at91/clk-sam9x60-pll.c |    2 +-
>  drivers/clk/at91/pmc.c             |    1 +
>  drivers/clk/at91/sama7d65.c        | 1375 ++++++++++++++++++++++++++++
>  5 files changed, 1379 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/clk/at91/sama7d65.c
> 

[ ... ]

> +
> +	parent_hws[0] = md_slck_hw;
> +	parent_hws[1] = td_slck_hw;
> +	parent_hws[2] = sama7d65_pmc->chws[PMC_MAIN];
> +	for (i = PCK_PARENT_HW_MCK1; i < ARRAY_SIZE(sama7d65_mckx); i++) {
> +		u8 num_parents = 3 + sama7d65_mckx[i].ep_count;
> +		struct clk_hw *tmp_parent_hws[8];
> +		u32 *mux_table;
> +
> +		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
> +					  GFP_KERNEL);
> +		if (!mux_table)
> +			goto err_free;
> +
> +		PMC_INIT_TABLE(mux_table, 3);
> +		PMC_FILL_TABLE(&mux_table[3], sama7d65_mckx[i].ep_mux_table,
> +			       sama7d65_mckx[i].ep_count);
> +		for (j = 0; j < sama7d65_mckx[i].ep_count; j++) {
> +			u8 pll_id = sama7d65_mckx[i].ep[j].pll_id;
> +			u8 pll_compid = sama7d65_mckx[i].ep[j].pll_compid;
> +
> +			tmp_parent_hws[j] = sama7d65_plls[pll_id][pll_compid].hw;
> +		}
> +		PMC_FILL_TABLE(&parent_hws[3], tmp_parent_hws,
> +			       sama7d65_mckx[i].ep_count);
> +
> +		hw = at91_clk_sama7g5_register_master(regmap, sama7d65_mckx[i].n,
> +						      num_parents, NULL, parent_hws,
> +						      mux_table, &pmc_mckX_lock,
> +						      sama7d65_mckx[i].id,
> +						      sama7d65_mckx[i].c,
> +						      sama7d65_mckx[i].ep_chg_id);
> +		alloc_mem[alloc_mem_size++] = mux_table;
> +
> +		if (IS_ERR(hw)) {
> +			kfree(mux_table);

Now mux_table is freed twice, once here, once in err_free section. Having
mux_table added to alloc_mem[] is enough. I'll do the propoer adjustment
while applying.

> +			goto err_free;
> +		}
> +
> +		sama7d65_mckx[i].hw = hw;
> +		if (sama7d65_mckx[i].eid)
> +			sama7d65_pmc->chws[sama7d65_mckx[i].eid] = hw;
> +	}
> +
> +	parent_names[0] = "syspll_divpmcck";
> +	parent_names[1] = "usbpll_divpmcck";
> +	parent_names[2] = "main_osc";
> +	hw = sam9x60_clk_register_usb(regmap, "usbck", parent_names, 3);
> +	if (IS_ERR(hw))
> +		goto err_free;
> +
> +	parent_hws[0] = md_slck_hw;
> +	parent_hws[1] = td_slck_hw;
> +	parent_hws[2] = sama7d65_pmc->chws[PMC_MAIN];
> +	parent_hws[3] = sama7d65_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw;
> +	parent_hws[4] = sama7d65_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw;
> +	parent_hws[5] = sama7d65_plls[PLL_ID_GPU][PLL_COMPID_DIV0].hw;
> +	parent_hws[6] = sama7d65_plls[PLL_ID_BAUD][PLL_COMPID_DIV0].hw;
> +	parent_hws[7] = sama7d65_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw;
> +	parent_hws[8] = sama7d65_plls[PLL_ID_ETH][PLL_COMPID_DIV0].hw;
> +
> +	for (i = 0; i < 8; i++) {
> +		char name[6];
> +
> +		snprintf(name, sizeof(name), "prog%d", i);
> +
> +		hw = at91_clk_register_programmable(regmap, name, NULL, parent_hws,
> +						    9, i,
> +						    &programmable_layout,
> +						    sama7d65_prog_mux_table);
> +		if (IS_ERR(hw))
> +			goto err_free;
> +
> +		sama7d65_pmc->pchws[i] = hw;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(sama7d65_systemck); i++) {
> +		hw = at91_clk_register_system(regmap, sama7d65_systemck[i].n,
> +					      sama7d65_systemck[i].p, NULL,
> +					      sama7d65_systemck[i].id, 0);
> +		if (IS_ERR(hw))
> +			goto err_free;
> +
> +		sama7d65_pmc->shws[sama7d65_systemck[i].id] = hw;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(sama7d65_periphck); i++) {
> +		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
> +							 &sama7d65_pcr_layout,
> +							 sama7d65_periphck[i].n,
> +							 NULL,
> +							 sama7d65_mckx[sama7d65_periphck[i].p].hw,
> +							 sama7d65_periphck[i].id,
> +							 &sama7d65_periphck[i].r,
> +							 sama7d65_periphck[i].chgp ? 0 :
> +							 INT_MIN, 0);
> +		if (IS_ERR(hw))
> +			goto err_free;
> +
> +		sama7d65_pmc->phws[sama7d65_periphck[i].id] = hw;
> +	}
> +
> +	parent_hws[0] = md_slck_hw;
> +	parent_hws[1] = td_slck_hw;
> +	parent_hws[2] = sama7d65_pmc->chws[PMC_MAIN];
> +	parent_hws[3] = sama7d65_pmc->chws[PMC_MCK1];
> +	for (i = 0; i < ARRAY_SIZE(sama7d65_gck); i++) {
> +		u8 num_parents = 4 + sama7d65_gck[i].pp_count;
> +		struct clk_hw *tmp_parent_hws[8];
> +		u32 *mux_table;
> +
> +		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
> +					  GFP_KERNEL);
> +		if (!mux_table)
> +			goto err_free;
> +
> +		PMC_INIT_TABLE(mux_table, 4);
> +		PMC_FILL_TABLE(&mux_table[4], sama7d65_gck[i].pp_mux_table,
> +			       sama7d65_gck[i].pp_count);
> +		for (j = 0; j < sama7d65_gck[i].pp_count; j++) {
> +			u8 pll_id = sama7d65_gck[i].pp[j].pll_id;
> +			u8 pll_compid = sama7d65_gck[i].pp[j].pll_compid;
> +
> +			tmp_parent_hws[j] = sama7d65_plls[pll_id][pll_compid].hw;
> +		}
> +		PMC_FILL_TABLE(&parent_hws[4], tmp_parent_hws,
> +			       sama7d65_gck[i].pp_count);
> +
> +		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
> +						 &sama7d65_pcr_layout,
> +						 sama7d65_gck[i].n, NULL,
> +						 parent_hws, mux_table,
> +						 num_parents,
> +						 sama7d65_gck[i].id,
> +						 &sama7d65_gck[i].r,
> +						 sama7d65_gck[i].pp_chg_id);
> +		if (IS_ERR(hw))
> +			goto err_free;
> +
> +		sama7d65_pmc->ghws[sama7d65_gck[i].id] = hw;
> +		alloc_mem[alloc_mem_size++] = mux_table;

This should have been added just after:

		if (!mux_table)
			goto err_free;

I'll adjust it while applying.

> +	}
> +
> +	of_clk_add_hw_provider(np, of_clk_hw_pmc_get, sama7d65_pmc);
> +	kfree(alloc_mem);
> +
> +	return;
> +
> +err_free:
> +	if (alloc_mem) {
> +		for (i = 0; i < alloc_mem_size; i++)
> +			kfree(alloc_mem[i]);
> +		kfree(alloc_mem);
> +	}
> +
> +	kfree(sama7d65_pmc);
> +}
> +
> +/* Some clks are used for a clocksource */
> +CLK_OF_DECLARE(sama7d65_pmc, "microchip,sama7d65-pmc", sama7d65_pmc_setup);


