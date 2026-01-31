Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80495D79745
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 14:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6LG4U0xyn/EsldzzleuKDCZCw6DeoE0txtcEiAls1GQ=; b=yObHfc1xT58hmtagrmEsBMfeT0
	aUqQBdW+RlFNFquzyBJwhDK4+l1lZ6d0Zw3KIHbuujafBHwCtKjWcWs0zffS+QofBgge0KlaK+z+q
	ypGeCVsjsq7t5y3zU1X1HZrPk3G6I3KDjoAoLzQ5akwOvE1UqlvqFPwFIwBc0Y10Gl41aeJRZgcL8
	JCpNGqu+27dYUUZMum8QfOqBsKKvsxKwi7XGKviNADaLcvYPJBYb5hniWq6/Yigs6y4oJkMWBSAWZ
	xyOuwlMZkCcb4dU8XNnSbpvA0Hhle9ncqH1G/upz38C8K2AXF4+iATQV1A8aMUAyDxm+WxFOfkdF8
	bV2DuxQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmBpI-00000002gYE-44Mw;
	Sat, 31 Jan 2026 14:19:52 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmBpF-00000002gXV-0ywk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 14:19:51 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so23364455e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 06:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769869187; x=1770473987; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6LG4U0xyn/EsldzzleuKDCZCw6DeoE0txtcEiAls1GQ=;
        b=Ju3qOeCFP1EQsPKXHvZ9i6BsPkZgMyS2mqGyGHGr388ETm2MZDuV3B520FP0dKFTyh
         Li5tQVpWtHrUWxqwXAnNzX8DXkyf0hNr0cIzEoJyFB7O6upY3X52m5ApfWlmLqikkltQ
         Iltw+Tiq3sOdAxm7yI1gd1HVzajDDS1AQjpls5Cd+5j8k6oR2LPoisvgBE51T8koodHc
         gkCNVaqwb4lAm3n1NRi2ogaSKGGEv7D+CV8ssq9inWFxN5dTRMhtX+5h3ok8WkH6+4g0
         rrSrdUAuLMHD9PLwK8XQmnoofYLe9gWcpZUxFAzsDbw2clXh/oWVGAaOVKUnDxyisQIv
         bBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769869187; x=1770473987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6LG4U0xyn/EsldzzleuKDCZCw6DeoE0txtcEiAls1GQ=;
        b=L3kmnlWeTuURGdJPAtnUfj59/JfTkEfs5HYRCX4z7Duv4/YACI8nySbXWdYNnyFIVZ
         H/u+q2VbqjRKl+2BJoPGphI+WBmSosT6EEEsHcx+8PVGmHo91ZQ5sKgct3Zf1mwX00dd
         J/A4vVe2W5Gyq0fj7LELEHAPikH2Zf0AWfvqvdXyy6H6my8I4xlD5OEAQDymQkDUE5by
         9xjNjBP49Zpgt/oCNbUKb1jSRh+gEEPPMxsHSaK2jfZYZ+5PM77lWihlaZ4DkcCHq+ek
         b+UiuBzpOmyCGmQUMWky96rF056I3OWnR8MuJ9REw/hw1lZ1fZ2rX3U8XgdAkPb0TJlz
         oTfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk2sfqYuInEqJbZ6epyTNZuZinkO1YChj5Kb2bt6uesSHi0fg7H2jWR7PDhNKDz46jFh6qNqPupZlfjahdPvPV@lists.infradead.org
X-Gm-Message-State: AOJu0YwzNhwbSC7EzH3JF7s58LHqAeeK5KCkToBdbvZd0KGWsTDjzD1o
	NhnJ+ARgV60H5794EWKmxYIOynj+P6et3OFQi1ENuWRrZpcGzwZlgiX3/++yzB4cFjk=
X-Gm-Gg: AZuq6aLI0Lti5mKAvqkF04ceE5Cxvnuz33Ymx35VyGFPGsFPNF3nLVkBBt+xU49RoBH
	qwRkUDT55je4iQg3N5JxzhuICOZHvKPJp0hWQKSGeKqL2umfLnPqr+HXNLcIcSf3DDqGBnf9ID7
	BUJ8Qk6/skTADlRpMODHbnssPheeROyOBs6UMQJaqtPFgOcz3ywvWA/0q6BbaqOa+KakUkdMwrh
	ziPh0GEwiwDeEaLETiPnCHTAxdOLN2xzvVZvnIyIuPtyx7zkXWRyf61KQWq2m6qyYDG5/DG/XrK
	uP8AhIA/IqjqCsGP7s6l9gdKyAT+08bLkqeMZBEpR2yzqvYP6iZwFFx9kK7zB4MwLou8PdGMAnO
	S2ETyPihhlAj/qpOfxm87PeVbbpYGOplUPVLZyuZgqs7NhU4HFjY0BjzhEfwOgpnQMpFA0j0i5M
	/gFJ5cNtbz+DG3gDpPKw==
X-Received: by 2002:a05:600c:46c8:b0:47e:e949:37e8 with SMTP id 5b1f17b1804b1-482db4ed389mr82265315e9.30.1769869187325;
        Sat, 31 Jan 2026 06:19:47 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e04a082dsm42641605e9.3.2026.01.31.06.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 06:19:46 -0800 (PST)
Message-ID: <70333077-3223-4f99-bfc9-cd3069a25d98@tuxon.dev>
Date: Sat, 31 Jan 2026 16:19:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 29/31] clk: at91: at91sam9g45: switch to parent_data
 and parent_hw
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <8ea67feaf45ddcaa32eab27c3b6716368979e198.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <8ea67feaf45ddcaa32eab27c3b6716368979e198.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_061949_660128_3722D344 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
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

Same here as in the previous patch.

On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Switch AT91SAM9G45 clocks to use parent_hw and parent_data. Having
> parent_data instead of parent names improves to clock registration
> speed and re-parenting.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
[ ...]

>   static void __init at91sam9g45_pmc_setup(struct device_node *np)
>   {
>   	const char *slck_name, *mainxtal_name;
> +	struct clk_parent_data parent_data[5];

Please mention in the patch description that you've also changed this while at 
it along with a reason.

Everything else LGTM.


>   	struct pmc_data *at91sam9g45_pmc;
> -	const char *parent_names[6];
> +	struct clk_hw *usbck_hw, *hw;
>   	struct regmap *regmap;
> -	struct clk_hw *hw;
>   	int i;
>   	bool bypass;
>   

