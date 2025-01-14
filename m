Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5446CC02180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 01:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1DH/dRPY0Nuv7rtnJpzenWYHpKBr5t8Ih4nWX4KnGc=; b=IznC2L/S0Ugi+ewV5lbErt2R3c
	2IUay8VIrVk/DTy15DVxE5uCs1pDxRdmR10Jc0oJY9JVHb0zabfPpmaBMplxbd7mkzVjZ+mIooUxM
	ml0YTjUd9Sfis5J5QGbkNwCKZ9QreycWMT1oXEKq+wRjQfQGj5VyNe6RejogYCBS9MNpLkM5nafjo
	6JSPmJkeJFyTbeLCEeUVTtTTidCoFYnzH950mVI2rYHZLYyUdQlWIgks3imT80OtVmaYuvzVlz0wC
	+JeMbq6nlzVzxGOG1nFUm9JNsnn7Cl5dItWJ9WxSVk4+B9EeHMtOh7pPPuBBt7pojrNNSssaLPAtd
	QFcj597Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXWDY-00000007CCS-1gFE;
	Tue, 14 Jan 2025 01:59:44 +0000
Received: from out-187.mta0.migadu.com ([2001:41d0:1004:224b::bb])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXWCI-00000007C5D-1wQ0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 01:58:28 +0000
Message-ID: <e48f70bd-bb2b-4443-bb76-1b3511700043@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736819898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P1DH/dRPY0Nuv7rtnJpzenWYHpKBr5t8Ih4nWX4KnGc=;
	b=F+yGNX+EtQuMGlvoRx0cEcpciJ9enfIt5EaNKn6B6+JuXPjh0SxIMd7/fpqz1spYD3oTjD
	bNMwUbsGPaQhWVE2B9NdjxMqqkYWVpXNjOkeHWI0JGrv5g8zl3uQiSMWaYv+hOA5gqPcwp
	X50P45HGDhNCF2i2HNQQY3B6FjCuqC0=
Date: Tue, 14 Jan 2025 09:58:08 +0800
MIME-Version: 1.0
Subject: Re: [PATCH net-next 5/5] net: stmmac: stm32: Use
 syscon_regmap_lookup_by_phandle_args
To: Andrew Lunn <andrew@lunn.ch>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev
References: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
 <20250112-syscon-phandle-args-net-v1-5-3423889935f7@linaro.org>
 <5d97dd34-f293-4403-b605-c0ae7b5490fd@linux.dev>
 <c4714984-8250-4bf2-9ac1-5a9204d3aca8@lunn.ch>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <c4714984-8250-4bf2-9ac1-5a9204d3aca8@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_175826_791461_4278F43E 
X-CRM114-Status: GOOD (  19.03  )
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




在 2025/1/14 01:01, Andrew Lunn 写道:
> On Mon, Jan 13, 2025 at 04:05:13PM +0800, Yanteng Si wrote:
>> 在 2025/1/12 21:32, Krzysztof Kozlowski 写道:
>>> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
>>> syscon_regmap_lookup_by_phandle() combined with getting the syscon
>>> argument.  Except simpler code this annotates within one line that given
>>> phandle has arguments, so grepping for code would be easier.
>>>
>>> There is also no real benefit in printing errors on missing syscon
>>> argument, because this is done just too late: runtime check on
>>> static/build-time data.  Dtschema and Devicetree bindings offer the
>>> static/build-time check for this already.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>    drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c | 9 ++-------
>>>    1 file changed, 2 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
>>> index 1e8bac665cc9bc95c3aa96e87a8e95d9c63ba8e1..1fcb74e9e3ffacdc7581b267febb55d015a83aed 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
>>> @@ -419,16 +419,11 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
>>>    	}
>>>    	/* Get mode register */
>>> -	dwmac->regmap = syscon_regmap_lookup_by_phandle(np, "st,syscon");
>>> +	dwmac->regmap = syscon_regmap_lookup_by_phandle_args(np, "st,syscon",
>>> +							     1, &dwmac->mode_reg);
>> The network subsystem still requires that the length of
>> each line of code should not exceed 80 characters.
>> So, let's silence the warning:
>>
>> WARNING: line length of 83 exceeds 80 columns
>> #33: FILE: drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c:307:
>> +							     &dwmac->intf_reg_off);
> checkpatch should be considered a guide, not a strict conformance
> tool. You often need to look at its output and consider does what it
> suggest really make the code better? In this case, i would disagree
> with checkpatch and allow this code.
>
> If the code had all been on one long line, then i would suggest to
> wrap it. But as it is, it keeps with the spirit of 80 characters, even
> if it is technically not.
Oh, I got it! Thanks for explaining. You cleared up my confusion.

I made those comments based on my past experience. Actually, I
hesitated for ages before hitting the send button. I couldn't
figure out a better way other than refactoring the function.
I guess I might have come across as a bit unreasonable. But
now I understand the reasoning behind the ‘80 - character’
thing. I'll be more confident when dealing with this kind
of situation in the future.


Thanks，
Yanteng

> 	Andrew


