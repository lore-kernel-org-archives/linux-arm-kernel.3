Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2030EE7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 08:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcuNFQWJylkhPh7t8gonvzvwWsZ6sN4LnbhC8eusAv0=; b=DswLgeEc/JtsPPuQKqe6uu1sfD
	R5ZbmvzcQMHxTeEGpgU4RoBrMD0AHbHCNXJOar6xqF3o36AEFU+X7OqLEcGQw6gbHsjZfjud+XT2/
	Ul7y6b1z/cY6NtEY+ql/R5tcalzPJkRnFNYQM8CTcJm7g3C5iMP7S20lrjam0oipPRgu9g4ZgNDX9
	jMSOSsBtqWKJQA812gBErWjXmjKdbVKNoi0+LDs/cqvsz5kxrLGT+NJFAhqb/bErDFDc+PSmXkI7N
	nBapXsj8CvO+xcD1bBN9KYQRATOdlF7rBTrhCH0iRBEhS7o1/0B160zPOE5BfY8iekgSX9+1/oGxL
	dx5UJvrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFTq-00000004JxZ-44JS;
	Mon, 13 Jan 2025 08:07:26 +0000
Received: from out-187.mta0.migadu.com ([91.218.175.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXFSY-00000004Jep-3feh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 08:06:11 +0000
Message-ID: <5d97dd34-f293-4403-b605-c0ae7b5490fd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736755559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pcuNFQWJylkhPh7t8gonvzvwWsZ6sN4LnbhC8eusAv0=;
	b=X8Hz6+4QavDAiS3Ew+4O7uWu/tOuSMl4stek9qSeQKLJAusNsXpq1L88iuACDbzN77VEkg
	dwdnWW1K6ANumpRwxOSgxq1C3eSzvUt0qkcxWVD99BYd1ErmKtoYhWWYw2jQuObsjnhUpf
	UnCeBErX+lqVQJ7NUvQ5rjqnRMFbWy4=
Date: Mon, 13 Jan 2025 16:05:13 +0800
MIME-Version: 1.0
Subject: Re: [PATCH net-next 5/5] net: stmmac: stm32: Use
 syscon_regmap_lookup_by_phandle_args
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 imx@lists.linux.dev
References: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
 <20250112-syscon-phandle-args-net-v1-5-3423889935f7@linaro.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250112-syscon-phandle-args-net-v1-5-3423889935f7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_000607_384977_FED0798D 
X-CRM114-Status: GOOD (  17.24  )
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

在 2025/1/12 21:32, Krzysztof Kozlowski 写道:
> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
> syscon_regmap_lookup_by_phandle() combined with getting the syscon
> argument.  Except simpler code this annotates within one line that given
> phandle has arguments, so grepping for code would be easier.
> 
> There is also no real benefit in printing errors on missing syscon
> argument, because this is done just too late: runtime check on
> static/build-time data.  Dtschema and Devicetree bindings offer the
> static/build-time check for this already.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> index 1e8bac665cc9bc95c3aa96e87a8e95d9c63ba8e1..1fcb74e9e3ffacdc7581b267febb55d015a83aed 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> @@ -419,16 +419,11 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
>   	}
>   
>   	/* Get mode register */
> -	dwmac->regmap = syscon_regmap_lookup_by_phandle(np, "st,syscon");
> +	dwmac->regmap = syscon_regmap_lookup_by_phandle_args(np, "st,syscon",
> +							     1, &dwmac->mode_reg);
The network subsystem still requires that the length of
each line of code should not exceed 80 characters.
So, let's silence the warning:

WARNING: line length of 83 exceeds 80 columns
#33: FILE: drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c:307:
+							     &dwmac->intf_reg_off);


BTW, The other two stmmac patches also need to adjust
the code so that each line doesn't exceed 80 characters.

Thanks,
Yanteng

