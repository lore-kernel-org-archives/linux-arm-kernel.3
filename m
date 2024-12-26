Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA83E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 09:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNLCGvzUscrhE8DerepH+jSw+ytsX5ncOa/i7T7TvEo=; b=q52fqwSpja9nE5KDDxVobWu17E
	aNA5FJzx01WpEXOcMSkbhiV2AXnxjsQv4maO2NqoQlC0Jdwc4CvOXd0XewyqT5k1FXqWSE0h6L7dc
	sQGBAu7ls9I5vyQ29WzmGZ7yuMWYAxbMhAf9/nt1RQ1IT2qhyDa00No48CJOSSV0Wj1HKYe6GHBRy
	N/l70d39+MtUdRm8WSn1R6HW4hKMQaAIcf1KUbLIUwkgkmLl2kA85QWsJP3e/kSP9KVPrqsvU9idp
	y9SldYCYi9lqflp1F0nLRKllMU/rDnB1kpqCUsQDcLR+OSwahLGGctvg46GN7umgxKMmuA8endqX+
	BnsunJUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQkWu-0000000FZAD-49LZ;
	Thu, 26 Dec 2024 09:51:44 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQkVd-0000000FZ43-42iN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 09:50:27 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso43531055e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Dec 2024 01:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735206624; x=1735811424; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BNLCGvzUscrhE8DerepH+jSw+ytsX5ncOa/i7T7TvEo=;
        b=QA5jt8/iNyFAMxWnr2RBh3N25IWET4pHaz1f3izBlR71u/OxGUIe7zj17UnjgtRxse
         +9vdvkpX0tzfbhWyaRmgOV5NGpe+ei0Ro0csGUvIvDPtsFH+WshSBQxSkkYNUck5axyM
         byxxxD2+E3x9/GHhnJaYuzTe7tLFCRAuSi4RxnF6i4+hB5jCc1K03r0pvqngksMR/Coo
         urQdt2qQlaUvMJs7vSpwSfTRiKq/dwimMv33qeWYXkNMebXwqYK4we7a5mV7BWXxZPxR
         Oxe5aE8qIAzuupcQBtYGqPiPpST0qWHAP4Je2L10F44pGaT+WOJvriQ/U0txVzHgKkFq
         yZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735206624; x=1735811424;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BNLCGvzUscrhE8DerepH+jSw+ytsX5ncOa/i7T7TvEo=;
        b=I6rloGrbkl+TcrayKXLhN/0wsmO+iCb8dncURvoDRTFs8BQUS+09rpyGttBSRUEY+r
         He/T+iFq5+J3umYrMiQd2BVA3xhH+GqxLumazZE5WdhVLFOM78MxsJZC8dIC42TCtFjg
         yXrLGqT7j7fSwJQHdxK6fNaErQduk2TLPy72lvSXWNuXAXIalF4IBPUJG1FiuOF4VpEn
         RKz8l1aQCxkvMuJcqiLd/99fY5Ljqrup904I2Ia1bqNfF0+wQrCTEuEWGL8hgOrOR1Tp
         Yc5GC973/5nWcI5DDEpE6ZE5swqn1Ma+O8pGvo9V6Z84ayINLlHe1J8LBjfDYhsj7rcZ
         ebwg==
X-Forwarded-Encrypted: i=1; AJvYcCW1uhq4HmqhXE/5PwTnMdZYwLcNLaFt/x8zg580DDp3gX20gKQvtxMHzzVRtGY5+0TVpdyilwCPeNW1JFtQb4Zt@lists.infradead.org
X-Gm-Message-State: AOJu0YzIki5SNtdlz2eU6wFFPfTZ1XWCH6W6DOvbvKHKRGnScehq6FLv
	avKrs+Uq7zx80HbK06uOAJiJZHaNHloNtn3sBQbeju2W6CrausBe
X-Gm-Gg: ASbGncvBhUl/sb1iUXyJNQomdQ7KuirLl+QBHMaCdRkeimbZNiTOziIDUIFi5bFuqC7
	pM+TDGqL9I9bCukNTH7fylORzKVhYrjsKbvXBwU9VuptcjYxnqVCVOsnPw7Qmmf63nuDpePvqv6
	q/IbzpHCIm8W9TbeG3j5ScXdgsHCEpOOEuSW9eX3jkyOpsUXclTaXS40FXm/GRR8B5GjyChf7BW
	/1y2Y4HXukG7niOK42jh5Tdfe4p4aH7C1nE069AqHgpbJRoU3368w6edzK9cnTR575QT+WHiA==
X-Google-Smtp-Source: AGHT+IH1vPF2yBNf9acUDO94c4harHqUE+o6S9YimBB9B6UkN15rPNW1AYhFIZiHD2u4Qj/D2KcHGw==
X-Received: by 2002:a05:600c:3b8b:b0:434:f2af:6e74 with SMTP id 5b1f17b1804b1-4368d6e8d7bmr48232435e9.15.1735206623459;
        Thu, 26 Dec 2024 01:50:23 -0800 (PST)
Received: from [192.168.1.102] ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea3e0sm230270745e9.7.2024.12.26.01.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Dec 2024 01:50:23 -0800 (PST)
Message-ID: <2cbb3ecf-fae8-4019-9b3e-43d48f3c9b25@gmail.com>
Date: Thu, 26 Dec 2024 11:50:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i2c: exynos5: Add support for Exynos8895 SoC
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241221151937.1659139-1-ivo.ivanov.ivanov1@gmail.com>
 <20241221151937.1659139-3-ivo.ivanov.ivanov1@gmail.com>
 <djpcvn7von4rizjucplqwxlmpuaemrl7x3jsbqmojgzhybfu6o@n6l3dmtjy7jy>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <djpcvn7von4rizjucplqwxlmpuaemrl7x3jsbqmojgzhybfu6o@n6l3dmtjy7jy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_015026_034468_EDE02D75 
X-CRM114-Status: GOOD (  14.71  )
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

On 12/26/24 00:59, Andi Shyti wrote:
> Hi Ivaylo,
>
> On Sat, Dec 21, 2024 at 05:19:37PM +0200, Ivaylo Ivanov wrote:
>> Exynos8895 functioning logic mostly follows I2C_TYPE_EXYNOS7, but timing
>> and temp calculations are slightly changed according to the following
> /changed/different/

Sure.

>
>> logic:
>>
>> FPCLK / FI2C = (CLK_DIV + 1) * (TSCLK_L + TSCLK_H + 2) + 2 *
>> ((FLT_CYCLE + 3) - (FLT_CYCLE + 3) % (CLK_DIV + 1))
>>
>> temp := (FPCLK / FI2C) - (FLT_CYCLE + 3) * 2
>>
> ...
>
>> @@ -352,11 +369,19 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
>>  	 *
>>  	 */
>>  	t_ftl_cycle = (readl(i2c->regs + HSI2C_CONF) >> 16) & 0x7;
>> -	temp = clkin / op_clk - 8 - t_ftl_cycle;
>> +	if (i2c->variant->hw == I2C_TYPE_EXYNOS8895)
>> +		temp = clkin / op_clk - (t_ftl_cycle + 3) * 2;
>> +	else
>> +		temp = clkin / op_clk - 8 - t_ftl_cycle;
>>  	if (i2c->variant->hw != I2C_TYPE_EXYNOS7)
>>  		temp -= t_ftl_cycle;
> Could you please make this:
>
> 	if (i2c->variant->hw == I2C_TYPE_EXYNOS8895)
> 		...
> 	else if (i2c->variant->hw == I2C_TYPE_EXYNOS7)
> 		...
> 	else
> 		...
>
> For a better clarity.

Alright. Will post a v3 soon.

Thanks!
Best regards, Ivo.

>
> Thanks,
> Andi


