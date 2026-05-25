Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B17CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 12:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrIDVk+3CslyJkUrNGl34AIpYDsI+Gmqf4gQKToWHJM=; b=Fa0S0NdOLK2500QIQahuKQEv7H
	nXlqgsaIvMC9jMYzWDELeBHMX8Vand/9QYCdXS2VV8gOVaRXApYXMHjQKhR3GrKguUyqqnWQcihBD
	3NnfHuGraDeLeCE3E0hdDg14T3x78VC8no1F2qlI1UEgqmEJHw42wNVHu0crSBSweXJp3wjXT7jf7
	jyvwAR9AzQ1W3oDmOUN0MUgnLqXDlW5bX3FUEtQCSUzfjkHKkcnbbysiQX5BjGu9h8AipYqGd+ew5
	+mg8RuRrusZ+7CyWCY97ePvGliD4ogBP2k73LW/SasuijV1dD2QS4kjxGJAWP+WJRoeTo9PHdZ7wV
	2ZmWWnJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUT0-0000000HCDO-2FJk;
	Mon, 25 May 2026 12:31:34 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUSy-0000000HCCv-08Ta
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 12:31:33 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4903974854dso34416525e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 05:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779712290; x=1780317090; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zrIDVk+3CslyJkUrNGl34AIpYDsI+Gmqf4gQKToWHJM=;
        b=hgADeiqkEU6UzDjfmGKA7e4nIpFU3bb9UQF3h8G+mrjAIa9zkxzCQUOOspUqL1OlMw
         9uCT6zhVSaJfvHc4fq/jWP/c+57uy3xFm5xfxRRuZJDbapL2ZjQVbxz0AIkloQkNlXNM
         7d3km1enc/huue8/kIhEMT8gxIAFZpheg7zKZT1oworsp6wlSWT75KZhmfxwSzPOOSMg
         +hMExrpRNX0d6kjgGn4PS9dnU6J/g3qalnf+iP/Fx1tS+NlaJJ7lzQhg+5or/6Ysr+4Z
         vi/KrGqSaILHbkHnX3yELpwZUrua8UnUFApvxKwkw16XlUZLCDNf3jW5KIp6NeTfv4IT
         j3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779712290; x=1780317090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zrIDVk+3CslyJkUrNGl34AIpYDsI+Gmqf4gQKToWHJM=;
        b=k0tLmlLkGTwFtWcsUwhetVTQ1k/eDz1jldfho8HaMUUTTdz2ZtI9/0aPEDV2lkU9De
         CNx8v4NF32l4hZduFgMogfdUrsDh2qk4XRHPN9LWWJtVjlQL1I4sMWUTwrn7vnSw4urv
         ObMf8groh7AdYLlRt+PlSq8SYJzIm2rPMGkBW5QTsopWDGMviBQs77uBzrbbZLYvcYkX
         5ptTzHlapBAhxivZMjJlJ7TvZLDc3cllbAB5VTf8Gncw0DHcrEeBnVy4ituvJCrO36aq
         1gXHK7GWNUe1iSUC7eXL4UJEfJGKD/hiIp7HtgJXAWvtKBhoMt0zHMCPlnDgbv8qxP/T
         c2Xg==
X-Forwarded-Encrypted: i=1; AFNElJ+bwLt6ET5KYFnFHKW+OMbTW3nzqbXQen63cxdw/TKcFO830dspXDm4ioUcC89QSNnCpERB0KURvhnTDsvOtIMz@lists.infradead.org
X-Gm-Message-State: AOJu0YzsegWtpcu+Q0aj1lfykUnZgi11FMS4s2sP7doM0mr54ePc1lEl
	xEnlTKDrxxP1JIXQssZvgCuiMVq1/wCUoAVpU4gg9mmuKX6cpNLbkmjc
X-Gm-Gg: Acq92OF4E035piMRscMEzix0P82RmYWSSFrit835w2uhntNwJSuesQ0RI64Q1im9qOf
	O71KjnI7NAuRdQBi1bXWnQksYBZxtw5YnaGeFTMzsLrURE2bu58giz2JIQIzOwBwzeAxtMTs6Jk
	Q2do7oRkqTca+eXkA5yDStVyAROYYuv35CrNnZyHfnOYc6ugYXQ+hg5fj/5saPKWI0OwEVH9K1M
	BhoZD+GkhcwXJkPmqoIWX90u4mP99h+V0rkZsnBREC7j1R9GIrBCqSXL8kArEywgcWzKH7PAdiT
	3yf8BnG40dPB/6yS6nsnTy9lA1NErMesezRqs3Sray/bAp3XAgfNcpjRtJdPSLYnA3D34lmV7WD
	HWsWMqPq85IFYvoUrKOFFrR7S9MqqAh14rczTCEStYdaHSLktU+kbKy0lZOyNdjD+tE/tRb148e
	rTj3MUzZI862n0O+XjXutXtPOTEJrGMuZttmz+/VS/rnCWAHcB5qxgZMOE
X-Received: by 2002:a05:600c:3d96:b0:490:5429:1513 with SMTP id 5b1f17b1804b1-49054291bbamr158545285e9.6.1779712289494;
        Mon, 25 May 2026 05:31:29 -0700 (PDT)
Received: from [10.25.212.250] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428e6d68sm85965215e9.22.2026.05.25.05.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 05:31:28 -0700 (PDT)
Message-ID: <9fb59c65-8cee-4502-bc10-1375f276e25c@gmail.com>
Date: Mon, 25 May 2026 05:31:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] remoteproc: imx_rpoc: fix carveout name parsing
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
 <20260522111849.783-3-laurentiumihalcea111@gmail.com>
 <ahOwO7LBXCYFIngw@shlinux89>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <ahOwO7LBXCYFIngw@shlinux89>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_053132_092988_D9D6742E 
X-CRM114-Status: GOOD (  19.05  )
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



On 5/24/2026 7:13 PM, Peng Fan wrote:
> On Fri, May 22, 2026 at 04:18:46AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> The imx remoteproc driver assumes that the names of the reserved memory
>> regions reflect their usage (e.g. "vdevbuffer", "vdev0vring0", etc.). This
>> conflicts with the devicetree specification's recommendation, which states
>> that the names of the devicetree nodes should be generic.
>>
>> Therefore, instead of relying on the node names, use the names passed via
>> the "memory-region-names" property if present. Otherwise, keep the old
>> behavior.
>>
>> The definition of imx_rproc_rmem_to_resource() is added to a common place
>> as imx_dsp_rproc.c can also use it given that it suffers from the same
>> aforementioned problem.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>> drivers/remoteproc/imx_rproc.c |  7 +++++--
>> drivers/remoteproc/imx_rproc.h | 19 +++++++++++++++++++
>> 2 files changed, 24 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>> index 7f54322244ac..1ee1c658dcc1 100644
>> --- a/drivers/remoteproc/imx_rproc.c
>> +++ b/drivers/remoteproc/imx_rproc.c
>> @@ -672,7 +672,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
>> 		int err;
>> 		struct resource res;
>>
>> -		err = of_reserved_mem_region_to_resource(np, i++, &res);
>> +		err = imx_rproc_rmem_to_resource(np, i++, &res);
>> 		if (err)
>> 			break;
>>
>> @@ -850,11 +850,14 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>> 	if (nph <= 0)
>> 		return 0;
>>
>> +	if (!of_property_present(np, "memory-region-names"))
>> +		dev_warn(dev, "using node names for carveouts should be avoided\n");
> 
> Please check 'memory-regions && !memory-region-names', some demos may not
> need to use memory regions.
> 
> Regards
> Peng
> 

What for? You'll not reach this check unless "memory-regions" is specified?

