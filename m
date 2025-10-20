Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206BCCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 19:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qz5TY9x2mwFP+v6DHBmNs5rDoED1VITmKzDSzUIYHws=; b=fXnBF+yXOL6iB28ToR9NogIEec
	t18IqG5LtSpkbdQUSi8c0S1E4a9kjnpZzuxBwuF8Bzb4GFIEtPqMgXbIjfDc7KTy6YtLPOoagbGfZ
	wf+pBnFUjciW/dhgbm8Gw8yqm1OMWoQWvWOAdNoj3N+lf/wLkIKTueDC0MTCgKw3SgWSOe5O6q5ds
	6xno2g2cW5MogyV8RlKejeGhEzzp6tx2gRKZpEfwwjgfFLqUDwAOxK4rYZyLzkjD7Wj7pe4pcDuPn
	0vORkG+8cEiR6JkOonBweg1Al+GN1Iiq9lA59bBd1j4sb4ievP50RXM9IP8bealN+ICE+CNLFiy7t
	R5y/SGjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvox-0000000EpDd-1rFH;
	Mon, 20 Oct 2025 19:45:31 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvov-0000000EpCy-0CzB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 19:45:30 +0000
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b4539dddd99so855180066b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760989527; x=1761594327; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qz5TY9x2mwFP+v6DHBmNs5rDoED1VITmKzDSzUIYHws=;
        b=BxloYOxMM1GVvwXg7FiEwoL28MK7tnjCo0lKoH4ItT9DCJZTuNKQsCtDou2zmK0tLa
         PMK/m5QFTBHGo5N1jcbhfv50XJmCTbA3UKwsanWJwdZbr3RIRiaL8oe4gmnCj5GJXCCE
         nAP1rZhM5iPblAB8tb1wZeUrG2G95zj4tbBx63DDCtkWLRMlAPnrI+5+4Xa3jY3wUB7x
         tLOcryqaYGFS43rkIUcZEUKrF4OYx/0E+7xw80udRWELPShi2ut8xMKZP4/VTjLPVf1F
         QJ2bn4G9zDhJ5EY3rF38OaJRwHW5thx5QKnCz7Fg1pmGtQzklUExIEYBnRdJwkpx7j77
         tgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760989527; x=1761594327;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qz5TY9x2mwFP+v6DHBmNs5rDoED1VITmKzDSzUIYHws=;
        b=AgERp/M9GUI6IB1M3gVKeBv0y9vqW2LArkJ+IEj1/YzJINBHBLdpFPNU35fFActN4r
         8WrwTkDYQwUo0jGuzOlXMJlniVpGvWxEJ35nGIxVlcF8md2MNkLAF+kOhkXOC2J1hrBQ
         1MHmDIWa1IImZ26zXslc3WMggMtvg4WPogw1+v3fmcHfaf4lPSFmkLInyDnOjOMuCrVn
         ZfiyHJfrL+VqHJz+AOHXR+/pRXUviF4fyV6wNkXjxBaimuBI5vvm9cUCgesuzTkhnS2R
         PCRpzgwgmPBtXTpwlUy96MQjnLoT5W5aWR0fivEZjBRSxqv9I8XQA2drdb3Z+HoGuDbA
         6ciQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrNHzYCwVRfVPGUVBugPzvOM7GQh6RO3PWkuxnwaTzjIGNM+cAcxJL+NQ3hh1XnPRLb0uFLvY5aBrCW6nmxojK@lists.infradead.org
X-Gm-Message-State: AOJu0YxXZqH/HFedI8CFE9JLqH0IzoBRG+b0csLIJvoO+Biv2N2fzxaL
	dt7r5q+gsji7tL3DlCIpnKnSp+JBjOawVZqCpXSqCl7LPT3RL4lJBgKKb19TjyP1IPA=
X-Gm-Gg: ASbGncvwiXRCc8DwqVFBC/AV3PfPFdE4JcTdT+0LwC1kWn2wWH87ErEy+hAvehj1lGW
	OHM30/easNobURJl0V/EwolD3+6yNRreRX1rV3v2dylgzlwYOYmkZeAgR+VLowCfIx1B75RDFx/
	E0HSM4m3aluD4KRbKJj4PNlVadpk9dR/QR4PXzhoatvJ6cyF08u5tlM/8esAS1NKhV5ElygThYY
	KIK0N4YXBqnZ+DxeJf0QTAi1pdusGaH+GWjhxL+W/kc0/mW2hf/WYqJQnJh5HGz9KGdAIER7aEI
	BhmraRF2KRMjywlfeIEA8j49Apfe38rCECeoLFenQBkkkN7ndqhHgd5LUEPT2WwL2miWTGwrwPZ
	fu+KxFA3Na76KCE1dRdSysCk4o7EeNlUYgoRojggxudMmo5qWsLBsL7naZvolhGYqPHhKbiXdP2
	9rxW7QpQs9DtRf2pWbCLY=
X-Google-Smtp-Source: AGHT+IGCob6piujm3PcDzGeduTMgTD25Owlac554+NOU9vrtDAhPuhqkFthuXzRSWnHKOtAXcaqOWQ==
X-Received: by 2002:a17:907:9482:b0:b2e:9926:3919 with SMTP id a640c23a62f3a-b647314166dmr1286907066b.22.1760989526706;
        Mon, 20 Oct 2025 12:45:26 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb725d80sm874107566b.67.2025.10.20.12.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:45:26 -0700 (PDT)
Message-ID: <b9f50783-6313-4c40-bbf2-c8474ddc2f59@tuxon.dev>
Date: Mon, 20 Oct 2025 22:45:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v4 10/31] clk: at91: clk-generated: use clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <645beaecf4b81c7e08f8adf3b9c74fa4b0176993.1758226719.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <645beaecf4b81c7e08f8adf3b9c74fa4b0176993.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_124529_109381_B018D00E 
X-CRM114-Status: GOOD (  13.17  )
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

On 9/19/25 00:15, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Use struct clk_parent_data instead of struct parent_hw as this leads
> to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
> conversion of existing SoC specific clock drivers from parent_names to
> modern clk_parent_data structures.
> 
> Remove the last of the usage of __clk_get_hw().
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Added SAMA7D65 and SAM9X75 SoCs to the
> clk-generated changes. Adjust clk name variable order.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---

[...]

>  static void __init sama7g5_pmc_setup(struct device_node *np)
>  {
> -	const char *main_xtal_name;
> +	const char *main_xtal_name, *md_slck_name, *td_slck_name;
>  	struct pmc_data *sama7g5_pmc;
>  	void **alloc_mem = NULL;
>  	int alloc_mem_size = 0;
>  	struct regmap *regmap;
>  	struct clk_hw *hw, *main_rc_hw, *main_osc_hw;
> -	struct clk_hw *td_slck_hw, *md_slck_hw;
>  	struct clk_parent_data parent_data[10];
> -	struct clk_hw *parent_hws[10];
>  	struct clk *main_xtal;
>  	bool bypass;
>  	int i, j;
>  
> -	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
> -	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
> +	i = of_property_match_string(np, "clock-names", "td_slck");
> +	if (i < 0)
> +		return;
> +	td_slck_name = of_clk_get_parent_name(np, i);
> +
> +	i = of_property_match_string(np, "clock-names", "md_slck");
> +	if (i < 0)
> +		return;
> +	md_slck_name = of_clk_get_parent_name(np, i);
> +
>  	i = of_property_match_string(np, "clock-names", "main_xtal");
>  
Please drop the resulting empty line here.

