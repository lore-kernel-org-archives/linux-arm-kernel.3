Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3700E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 23:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/HK4E/A1XXBdIojpdswgpBBjDQ20PrFgHRSAU0uFOc=; b=16lgCrHnyUFevy74KMzAC8Ewut
	6TB9R9Ji5dfRPwY6kQON6o/Ai6wKPQOf3LMpbV767u82mNDa49XPPfq97Bu4oFmJojKc/eJqNYT0m
	RJ5ubT3QmaKCoOmgfNyNjNbvYFEU9DDJeq2CF1wi53F6jGK3LldHZdPRI1w2699uBbHH/oYvve/Mi
	BEnwYGxpk75S75D6we1fN4CzOdlCKCqb1cCZWh7W9DpQQBsGDdgoZV6c4CwJK2WvtxWDEwsk+cRYe
	GhA/wUCQmoa6BptC0zfxSIkINn5a7rmTYBYONAVCDgL/H7tJ8fx8I6RJvrNmKxa95nAvaG0rrDmAh
	Em4TfpZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMySI-00000008fCt-3vxF;
	Sun, 15 Dec 2024 23:55:22 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMyRC-00000008f76-2OyO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Dec 2024 23:54:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A1951048AF66;
	Mon, 16 Dec 2024 00:54:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1734306849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e/HK4E/A1XXBdIojpdswgpBBjDQ20PrFgHRSAU0uFOc=;
	b=TI7J14mpcYLmk+Tft8b38gaO5OjyC2RhtCvv/s76ISz51SobZbUQTpF5irmWtztnhqb/8D
	WXqZmlujV1tilLbaStVeCJkJ8MiBVCOe69mCms1/XOS4oVHx5Hj4ScqwsxlITAYr8tI7RP
	xZGTJEyU/cIcTFjkW9Zo161mNGsDuPRaGaQ6TXIkdu3/5cq+/Kg1hp5s0xe1YhIuE+l8kN
	+yg9m/bRcu7SAcLPpmhUAJkYDGTMh/Lz33RNLx/1G1HoXkRAuqQdZ3eJmP6S0t9nPK+j9/
	tvRV/E3IT9S7+4O3mvjShrjXRnXfjkOUWTAgjxb30ru9k2KCFXnCuvLabHUrrw==
Message-ID: <9745b3ee-ae89-4edb-8ff7-b20096dbe1de@denx.de>
Date: Mon, 16 Dec 2024 00:41:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] pinctrl: stm32: Add check for clk_enable()
To: Mingwei Zheng <zmw12306@gmail.com>, antonio.borneo@foss.st.com
Cc: linus.walleij@linaro.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, make24@iscas.ac.cn, peng.fan@nxp.com,
 fabien.dessenne@foss.st.com, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>
References: <20241215204014.4076659-1-zmw12306@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241215204014.4076659-1-zmw12306@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_155414_772435_2D986037 
X-CRM114-Status: UNSURE (   9.31  )
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

On 12/15/24 9:40 PM, Mingwei Zheng wrote:

[...]

> @@ -1617,10 +1602,18 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   		return -EINVAL;
>   	}
>   	pctl->banks = devm_kcalloc(dev, banks, sizeof(*pctl->banks),
> -			GFP_KERNEL);
> +				   GFP_KERNEL);

Please drop this one change.

>   	if (!pctl->banks)
>   		return -ENOMEM;
>   
> +	pctl->clks = devm_kcalloc(dev, banks, sizeof(*pctl->clks),
> +				  GFP_KERNEL);
> +	if (!pctl->clks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < banks; ++i)
> +		pctl->clks[i].id = "";

Is this ^ assignment necessary ? If so, why ?

[...]

