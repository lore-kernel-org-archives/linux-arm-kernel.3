Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C76DCAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 09:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFTjY5/OntfnPss18xMJfKbpZ6ztPp46Q2iJkWHJLes=; b=qg+iXSFRQwCYvGoy7VWq8MPYw5
	mt3jGBdkhnSN3Xc7eXTWeElQh4N65gDDEVYf4A509KU/TE1p4EoWqB2mBMRr/u/wEdV3aLzeFfDUM
	0NPLvoxS9Ecw8JRZ97Kczz6ntiOFLiUoAkfnesNNyhJwwZqC6c64IdHrAbcn0bzrpo3UcgcWFyaku
	cSyE6qy7nVeHB8RI7xwe6GgvHF8vEoI5gWqGJ1BIoCSOnWiMaxBBDuyE986famhBGhvBKSAqqZn7V
	QptKxPEseNzUX6t50tNVAsN/sfVpG9Vy8y9zvWPcplCzKvArZu09eTRO3ECQTnUqYx6DN7rVgoJCE
	YvcpbeJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v24Xp-0000000HTTs-3wqS;
	Fri, 26 Sep 2025 09:15:13 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v24Xm-0000000HTRF-2Q8Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 09:15:11 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3f1aff41e7eso1853507f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 02:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758878108; x=1759482908; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KFTjY5/OntfnPss18xMJfKbpZ6ztPp46Q2iJkWHJLes=;
        b=VG18ikB+mwg3a3L35BVo/FWRxKAkSMe7pyIQLcpB5rCBlTrOZWCcWg3/U5BYjUOUQ3
         iJRrxsj1frC7AWCHayGEAYTsK/G6VBVn8ViCBKg3NwFFbN8mKVTCjIVWHUJWTgp2Ekkf
         FNL2+f5Di0ILqjdgxytmlVztMbHfTNVtGk9teLTkZuL31GUlJvlffBF5WLT9A+nZn2ee
         5YTce5yLIlLocckKQpC6nW+moZ/u+SkP0UYTPFaImTtWOtpk/iT5DUmmjQqtS6i/isyP
         Z4/9f7SOGcnTKuIhZ0trDZ3Sid3aNp5GL8z1zoyj3n9l5V12XNELBouTM2L+0vkVjjqH
         xN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758878108; x=1759482908;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KFTjY5/OntfnPss18xMJfKbpZ6ztPp46Q2iJkWHJLes=;
        b=ikocCQ6v8ASiU9hL0vYJP8tHyGtSU49MJDUHKXr4hJzMPl4GM5Hpj5un+zDyIcn7hX
         BMrHfhI1XgwrV9DTvdw9qtzKUXI9MMhLqWfxXwK796a9RsRLdqwwZlPUPt7ZoxVzPrrV
         ZYJ2JWGVG6GMqopwal0kbrOpBNIG5mGFFNKGPk4qXAAHXMlrEO6zAW4cPzH1JxlMSUgY
         5kRWPibuwPcOka907viWi8FMf3hkGmEE8+d6OGxkgI7YnTvj5ze71JnV2LMmsreFF3iu
         6izo8DMtokjeilfU9tJZcT6tbGrb5MZBF29zux9bTs1WXckTlAtpQgmdHNzwbS+0+VM4
         UFrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUavI6/x0+Lv5HQhVkAAQFMKE00YvPHZjEFFwhlh/MMgO0CXYfSkfj9gYWW1wFteEuzMVr/WQKLtOWuL0DLIUFb@lists.infradead.org
X-Gm-Message-State: AOJu0YxAZqOCsqMVLutP43kFWzP8VEUrMhBVCVOMY6gSjptIFj9kLP88
	6PqCt7WojNSeyT9IA7yQtEz8pDiYJEojhNZ2qGLF9RFMNXgj12HBZMEjcbGhKdBb2FI=
X-Gm-Gg: ASbGncvSNE32xYUXpT5WTSlgJ10x7Hy/jYMoCNhZRd1+XakVvJPTSHSFpQ6P74N99t4
	K/g16DW/vXm8PaquC1xaNhRlLYfpAyQrj8YKyfI6kqbEs6SxoODisitfFqbLjNIVQizpzAqwYro
	wuzXvc2x+haTyyDQ4nomVKNTEZJCkzIYsuBl4/LNsP7Qgicv8eyoIAtn3hEw8vHP8n3GD7SE0cf
	ZncfHRLLZCXR2i5lLYxIaEapYx9HwKFYxqruh85bnwe/9UcvMCcHQXk6eu73wWLa01Kuk173kpF
	T68MxSvKOdJwuo3VCPmlPXIcn3sSbE6Kg9we7x9qfAPKAHodgeYoZwFhycCtybt5Irbkg/iGRK9
	AKAs0aSBAs/g1K2GJe6lo3wuocVR7KduEgObQRPyA+BE=
X-Google-Smtp-Source: AGHT+IEVX7V7+nffT3CJ9dpetDYPOn1G7WuDY6pTt+HXts5dckr78/uI1tL88mQFYL4fesUlu07JBw==
X-Received: by 2002:a05:6000:2585:b0:404:ac77:6598 with SMTP id ffacd0b85a97d-40e429c9c4dmr6196945f8f.11.1758878108352;
        Fri, 26 Sep 2025 02:15:08 -0700 (PDT)
Received: from [10.11.12.107] ([79.118.185.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fe4237f32sm6185169f8f.63.2025.09.26.02.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 02:15:07 -0700 (PDT)
Message-ID: <586c85d8-7638-4e52-8f96-1aa4640afe64@linaro.org>
Date: Fri, 26 Sep 2025 10:15:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] firmware: exynos-acpm: add DVFS protocol
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250924-acpm-clk-v5-0-4cca1fadd00d@linaro.org>
 <20250924-acpm-clk-v5-2-4cca1fadd00d@linaro.org>
 <03cbad1f4f311727b4dce9c969404e2bc138c556.camel@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <03cbad1f4f311727b4dce9c969404e2bc138c556.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_021510_642024_63E51D32 
X-CRM114-Status: GOOD (  11.50  )
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

Hi, André!

On 9/24/25 4:24 PM, André Draszik wrote:
>> +	unsigned long (*get_rate)(const struct acpm_handle *handle,
>> +				  unsigned int acpm_chan_id,
>> +				  unsigned int clk_id, u32 dbg_val);
> Everything seems self-explanatory except this dbg_val. What are API users meant
> to put there? Maybe some kerneldoc could explain it?

I don't really know, there's no documentation. I can guess by reading the
downstream code.

Grepping the downstream sources reveals that this field has a value
other than zero just for the edgetpu driver.

Looking there I see:
#define TPU_DEBUG_REQ (1 << 31)
#define TPU_VDD_TPU_DEBUG (0 << 27)
#define TPU_VDD_TPU_M_DEBUG (1 << 27)
#define TPU_VDD_INT_M_DEBUG (2 << 27)
#define TPU_CLK_CORE_DEBUG (3 << 27)
#define TPU_CLK_CTL_DEBUG (4 << 27)
#define TPU_CLK_AXI_DEBUG (5 << 27)
#define TPU_CLK_APB_DEBUG (6 << 27)
#define TPU_CLK_UART_DEBUG (7 << 27)
#define TPU_CORE_PWR_DEBUG (8 << 27)
#define TPU_DEBUG_VALUE_MASK ((1 << 27) - 1)

And then I see methods like:
static int edgetpu_ctl_rate_get(void *data, u64 *val)
{
        *val = exynos_acpm_get_rate(TPU_ACPM_DOMAIN,
                                    TPU_DEBUG_REQ | TPU_CLK_CTL_DEBUG);
        return 0;
}

or:
static int edgetpu_vdd_tpu_m_get(void *data, u64 *val)
{                                                                                                                                                                                              
        *val = exynos_acpm_get_rate(TPU_ACPM_DOMAIN,
                                    TPU_DEBUG_REQ | TPU_VDD_TPU_M_DEBUG);
        return 0;   
}

These methods are used only to be exposed for debugfs.

So it seems it's used to __get__ clock rates or voltages, and that the dbg_val
acts as a debug command that also specifies a secondary ID, TPU_ACPM_DOMAIN
being the first.

I find this a little ambiguous, so I refrained myself from adding a description.
Since I can't tell what it is, and whether TPU is really the only user or not,
I propose drop the argument or not describe it, as I already did. What's your
preference?

Thanks!
ta

