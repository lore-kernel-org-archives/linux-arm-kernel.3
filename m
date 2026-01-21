Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C98EC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 15:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZVraHTvGYWHeUSeCM7zloSyYdx+u7Hx5nno7KP+9/hA=; b=ZulzrR528GYYA6SB19wDseekoG
	iMYmKFkwk56TLSRsFn4jE/+efNzWAyfR9jpbHV1C7C/ifoQMvJg8+zxCWA9wmTMlA09SkoRVWFnpp
	09gsjl1maUhdzpsl5o4dk2+ViKEBFvKSz5lW34IFzb02nTA/oNacLhta8mtjA1GfcqWjYWQkDYTMD
	saeQQTycJJwrKOS+JvLLqWD+pg6XKunYnPL/R43HirIC6Odva0neRbSG6T5VO05i23rqqkG7noIZQ
	7+o0LsnYsrjodfcyABIBgYt5Mn778FURB3LLXm1e3OS7hhJ2Fxmi+t8hMfsezsulsblpPxSjAdDuh
	ENot/DKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1via9i-00000005ilJ-1q9B;
	Wed, 21 Jan 2026 15:30:02 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1via9e-00000005ikU-2tfY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 15:30:00 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so47029835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 07:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769009394; x=1769614194; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZVraHTvGYWHeUSeCM7zloSyYdx+u7Hx5nno7KP+9/hA=;
        b=Bl66CHR0AO4G3UtePxWtQKszLJQZcdcgka06WVJ856zkd8KgON/VXM4/86Cxz4F8ay
         MbSY3Ix42ACc4v2FMxbugO6d3quTga6VguOc3+DA2WzqfFKOY5FvcGjNayjK8OpyTvx2
         bcASIpYmdsasAbSdlniU8y+3rsyA7yQsSCC0iQfm3c6iYp5+xcVlHwlb34R2x0EsuncG
         Kd/avltWXyREGzlVUjBak1SKuF9m1MNIU1Ju/KGgrMRpS7D6qZCOqk0X1HRPu411AZbM
         2tRdHvtc8auIY2Z6lr84s5eecV8sVThvhaJL7X5NHvWk0W0a2RPHHXeE5wIyGSlLN7fu
         XqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769009394; x=1769614194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVraHTvGYWHeUSeCM7zloSyYdx+u7Hx5nno7KP+9/hA=;
        b=pe44uS90h2GASYxFq2LXITfSee+qm2fJv1mTwDvGHyYGXtQ6yT2MHCewbV3MRe/Pap
         9Ay+JSrs0HviQBpXG64fdMDyJGlD5zqhWYKdxoP4ERgQbEV0yCxDliWTDsXVKO9S6pCN
         S0eVyuqvKnqWG7rP6heSQHiI4v2Hj75DTJNBbVNFsJaY22RaRvw7Tm60EX0GtdCR/YZi
         xP12iP3yUOjwcpQA+P0HncrKyp4Yya9svYhcBiFPe0K/MQcp0zeawLNJCbqrO9Qlhc+3
         D2lxRBbpqBb7SyVohfrSNOl+ZOowmQCKcaM/Bm3mppvECyhIGxNAKML+x3SK1PR2h1dX
         B8KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaAUBTSmkH/pxjUrYkUkWVMSDxBzY+lgkEVhFiIMsH7m4F2+CXgUI5VF6piCBfFuATjHRVLSuuZ2Ja1sAzeAux@lists.infradead.org
X-Gm-Message-State: AOJu0YxkKkAcCT2SLdRizxJmlD64CNrmfcJuQ2mg5bdenMCqGkcR1V/l
	+fqUI+54mjMeKIYzi41Oi0DIXOWzovWMLWpauN67VxXWyIt61UNWMXkLk+c0UdwDEnQ=
X-Gm-Gg: AZuq6aIcwpDdJLl2GQO6VPC8T9GDLoh37BFa3x40OWTagy32VjLAi+PaBcLhlOveddW
	NK6v2Zw/J3I/HbJSP+bOntJCnzlJ28QEQypMPPwgAoQj8Vz9g9L52XMsj5H07MCO8HPmTmZAPXF
	ugNy1u61YqVGXRwWqQW9sa1btZBx6+EyhxGXX2wNBmkHbcDwzUfjgTbmKjQqT+FptJof5PJi54A
	UPIM7K1a0TfocnYCvt6Ht7xo8uj+AqWAeszqvQH6qb089b0HA9j61TuEaJzcmLFLJ6wQKm+ouSg
	OJjLgtdI8C+Y3kvduu1EOb3eay2gkMQzfyWM4Lh9q3FKdHh2lCKZI1L+OSJV0bPj9kL+XLBiwru
	mpoymB9gvlaZq9WaKLVcdwWIQh09bgLRuEhsplshaMMKZBORtrrcPoOjs2Bw6otYCRukiKCjXhr
	DY2/4Nba7/+8gmzs4AqJTdQ1gc6dB4aKEi8JSye3J/IZlXP6duaRO6K6s+f+8J7/Q6doqHEJWCA
	A==
X-Received: by 2002:a05:600c:310e:b0:47d:885d:d2ff with SMTP id 5b1f17b1804b1-4801eb11002mr229658175e9.29.1769009394082;
        Wed, 21 Jan 2026 07:29:54 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:ebda:5627:9bc:1ede? ([2a05:6e02:1041:c10:ebda:5627:9bc:1ede])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43596090493sm9305361f8f.25.2026.01.21.07.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 07:29:53 -0800 (PST)
Message-ID: <9131900c-f095-4c2a-a6c6-15b875d5b8ec@linaro.org>
Date: Wed, 21 Jan 2026 16:29:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] thermal: stm32: Use predefined HZ_PER_MHZ instead
 of a custom one
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-pm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20260114092808.273695-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20260114092808.273695-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_072958_743095_DB6BD1AF 
X-CRM114-Status: UNSURE (   6.51  )
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

On 1/14/26 10:28, Andy Shevchenko wrote:
> Use predefined HZ_PER_MHZ instead of a custom one. No functional changes.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

