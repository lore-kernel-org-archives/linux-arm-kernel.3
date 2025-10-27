Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39CECCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mw12YdzTi9NB3y1kJkoK+Kxt9YSNjct8ry46vaendzw=; b=GcRGSquYsvkK/X+uNwQ/bu12Lb
	zutYdODG+HCe9W5vV41Re1Q3syHWx+hbYjoS5k0/AZVV2ZOGqXihiMnV9FjCb+e698xAJ5CIex/kA
	1eZiB3qbv8gFDjO4SmkiE/FAd37Zf2/K9oGLr135JDgMrbXdzM+hLmZ3XpXqPQ7BDQcvSWP15FYt4
	6i7OO75F/OfBQW8GKCZr6/PdC6ZTItor4uGJHaJP6RZF0b3J54VIOFR7AfeURwyzpnnzCx8wGUR5h
	mJbZNxlEb9Cl4kzF02WO2zUisl8dEarO0eCptmO0RIRd4nETzEtdJh0Qp30wD7cZdVnx1u+SSmcUO
	OT4k9nTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJsX-0000000DZzY-1RJ6;
	Mon, 27 Oct 2025 09:51:05 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJsV-0000000DZz3-2CnV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 09:51:04 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-62fc0b7bf62so243355a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 02:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761558661; x=1762163461; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mw12YdzTi9NB3y1kJkoK+Kxt9YSNjct8ry46vaendzw=;
        b=Ojow7LOHu6aMdBDKQ0c9odFe6FEAktdviNfVfpVFhwW3QTokQQN7uC9y+lw3QZTIKs
         qKf1yxayFeNJ48xjkGofscv41g2pkkQjcjM1iFPD0QNUNc9D59gsd2NtCcquo1IDLORF
         2AK+cU22xzhiFxd9CZjZL1bNMqiuHFH05i7vfNYaGqiwVC9StmR/rmzcF/Tl64Gj9yz4
         sEYpnUTtfV4ZAgkopyMil8TCWfrrriuEBTSNg+tTp7iR/xKWflurfBpNlZh0XlDZ/dtC
         /Tei5yY6yq1Q7mafOnJUFRbQATisbO8B6ndrhisMoRXsx10e7Jc944vl/RHkQW1Rx+G6
         aaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761558661; x=1762163461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mw12YdzTi9NB3y1kJkoK+Kxt9YSNjct8ry46vaendzw=;
        b=PrT2T96Gh45Aba3vACKvNMHnS7q1dwt0CGkrXmJvsTA3KWz6swx5XZBgjYcC2sNPDC
         qS97IIxgqSIRH7uLWVry/bnA8Hln0WrEyqroS680dr40DxMaurvy5OIg24K1UlolLGh/
         xKz56m2RR3ij/ziqq3w+CKBkUzrWPvbgt5ig8UYdFVIDYIY3NI6bJEr7Z+L+Nyyk7BSv
         3fJVB36I8bjaMb/HQr+jri00xlGv19pwgH9Y8Lf6sJ1KdCF7bQ1I5rNnVPqx1luorNv4
         lFas7cT900OEejQf44NqUpF9cbXLJj+X74HfLUBbkgMedxa4iYLGu45V+J2esSky0kTj
         3CDA==
X-Forwarded-Encrypted: i=1; AJvYcCVvrcGiu9eRXn52e8HpemG0nJMTfkCxwZSaplyIAD0yJZemzpCAVgmsv8iiCZpTvhfRVGFgNjo+k9JR/BZ26wC7@lists.infradead.org
X-Gm-Message-State: AOJu0YwVSIuolhS+7HkNEHuV3wXpqfVa2UJkzgZdvf/GtDPPyQYZqDES
	6JM5TPIiaoN/yE/XD/Yi81KPSIVoOeeuTch+FUV7VX5Gj2Pfeyaz0zA1
X-Gm-Gg: ASbGnct0FBREf8I4tsFJJSam7gwkbYBLlELFFyT6SwUEcDxG0DziYHopZQuD+Iq9HpS
	vo2mz7Xvlel0hQj6iGRD2se8JQ75Td0ljXrc9IJvnO27Y3qYcfhoncDwa8IWXgyuJVDH0/HZKq7
	M8N+pE8Tzlwau3vFeZwOUyHB1q3xw4aTzANrxiQw9aOVsN66+VulZoVpdZVd3CsXjAJerDGzztx
	0RgERkmRIH9B9iui3BLt5Wnn+MysedYJl83HhG9fIGC5B5qSf4I78tQUTSIXJH6RlKCbxppVsrX
	cvgde+2B1Ps8VCD5ybDEuP5C9uOwnb8dQqQJULnHh72skQ6OM93LaG/nESnPINEKsI8Iw7Ikh4y
	wDPFo/x2/gVkpjY1HC4qDc6TsOqsDKXBAWpxbtQglaTjTWuLgbcZxSnDelPX+Y6W6LH1g6lkDu7
	K9Emtdktd8cp1fO0In0pI56my05RAT9A==
X-Google-Smtp-Source: AGHT+IERBzNr1pRW9aQQMHx51xdoW3UzXmbId6nlUYrZzGZ0Z6AgDbAWku/q0c+3JyA6dFoSGcQW5w==
X-Received: by 2002:a05:6402:2787:b0:63b:d7f0:d940 with SMTP id 4fb4d7f45d1cf-63c1f6300fbmr32209099a12.1.1761558661210;
        Mon, 27 Oct 2025 02:51:01 -0700 (PDT)
Received: from [10.25.208.2] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef82907sm5888719a12.12.2025.10.27.02.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 02:51:00 -0700 (PDT)
Message-ID: <9e5f5166-75c3-4c7c-804a-8cb24c67f416@gmail.com>
Date: Mon, 27 Oct 2025 02:50:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] clk: imx: add driver for imx8ulp's sim lpav
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
 <20251017112025.11997-4-laurentiumihalcea111@gmail.com>
 <20251022140315.GA11174@nxa18884-linux.ap.freescale.net>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20251022140315.GA11174@nxa18884-linux.ap.freescale.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_025103_601194_A05C9400 
X-CRM114-Status: GOOD (  27.86  )
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


On 10/22/2025 7:03 AM, Peng Fan wrote:
> Hi Laurentiu,
>
> On Fri, Oct 17, 2025 at 04:20:20AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> The i.MX8ULP System Integration Module (SIM) LPAV module is a block
>> control module found inside the LPAV subsystem, which offers some clock
>> gating options and reset line assertion/de-assertion capabilities.
>>
>> Therefore, the clock gate management is supported by registering the
>> module's driver as a clock provider, while the reset capabilities are
>> managed via the auxiliary device API to allow the DT node to act as a
>> reset and clock provider.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
> ....
>> +struct clk_imx8ulp_sim_lpav_data {
>> +	void __iomem *base;
>> +	struct regmap *regmap;
>> +	spinlock_t lock; /* shared by MUX, clock gate and reset */
>> +	unsigned long flags; /* for spinlock usage */
> This does not need to be here, put it as function local variable should
> be fine.
>
>> +	struct clk_hw_onecell_data clk_data; /*  keep last */
>> +};
>> +
>> +struct clk_imx8ulp_sim_lpav_gate {
>> +	const char *name;
>> +	int id;
>> +	const struct clk_parent_data parent;
>> +	u8 bit;
>> +};
>> +
>> +static struct clk_imx8ulp_sim_lpav_gate gates[] = {
>> +	IMX8ULP_HIFI_CLK_GATE("hifi_core", CORE, "hifi_core", 17),
>> +	IMX8ULP_HIFI_CLK_GATE("hifi_pbclk", PBCLK, "lpav_bus", 18),
>> +	IMX8ULP_HIFI_CLK_GATE("hifi_plat", PLAT, "hifi_plat", 19)
> For the parent name, my understanding is they should be the one
> from clk-imx8ulp.c, but I not find them, or may I miss something?


we want to use parent names local to the SIM LPAV provider (i.e. names specified via clock-names)

instead of the global ones. See definition of "struct clk_parent_data".


while we're at it, maybe it would be a good idea to drop the ".name = pname" assignment bit

as that won't work anyways since we're relying on local parent names?


>
>> +};
>> +
>> +#ifdef CONFIG_RESET_CONTROLLER
>> +static void clk_imx8ulp_sim_lpav_aux_reset_release(struct device *dev)
>> +{
>> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
>> +
>> +	kfree(adev);
>> +}
>> +
>> +static void clk_imx8ulp_sim_lpav_unregister_aux_reset(void *data)
>> +{
>> +	struct auxiliary_device *adev = data;
>> +
>> +	auxiliary_device_delete(adev);
>> +	auxiliary_device_uninit(adev);
>> +}
>> +
>> +static int clk_imx8ulp_sim_lpav_register_aux_reset(struct platform_device *pdev)
>> +{
>> +	struct auxiliary_device *adev __free(kfree) = NULL;
>> +	int ret;
>> +
>> +	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
>> +	if (!adev)
>> +		return -ENOMEM;
>> +
>> +	adev->name = "reset";
>> +	adev->dev.parent = &pdev->dev;
>> +	adev->dev.release = clk_imx8ulp_sim_lpav_aux_reset_release;
>> +
>> +	ret = auxiliary_device_init(adev);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "failed to initialize aux dev\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = auxiliary_device_add(adev);
>> +	if (ret) {
>> +		auxiliary_device_uninit(adev);
>> +		dev_err(&pdev->dev, "failed to add aux dev\n");
>> +		return ret;
>> +	}
>> +
>> +	return devm_add_action_or_reset(&pdev->dev,
>> +					clk_imx8ulp_sim_lpav_unregister_aux_reset,
>> +					no_free_ptr(adev));
> clk_imx8ulp_sim_lpav_unregister_aux_reset() clean up the resources, if
> moving this before auxiliary_device_add(), then no need
> auxiliary_device_uninit() when add fails?


the whole chunk guarded by the #ifdef CONFIG_RESET_CONTROLLER should go away

anyways once I switch to devres as Frank suggested


>
>> +}
> Regards
> Peng

