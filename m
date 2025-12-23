Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340DFE6F07B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZaR+VLWbkJkXmW2vL4cv5W5+vLpcKE/YHys3L1wv5k=; b=v73657evYoqrQ+fD3bI9aQB85t
	GguU0UgRPsxMjG0P43mZANx56754FVgWpy08VyTju3SkO/EaFp+LiI7jd9tj6YUCBQ+jYJZeB3QNg
	qM/34z1/08bFXFhb5Bz8nVxr4Uuzw01CokA0cpmaVO603Q3Gby6tFbKAjgSBTYwFu57C+HGkBR9Gk
	zF7GrJfRsgB7100yC5dF958SC+NcBAQG1ud0Tt/jvltd3r+Nvv4dYVtRGCjhPMgdrwOkIMl4TJ8zk
	vOL2EKZD5tNX7FQENGyDbDBUJ7aPOpAybsz3qSE2LK73w29c3x7odbhwizVk+1RR7PdLeIw/idEG+
	SLRFP0aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzPu-0000000EsFr-06Xo;
	Tue, 23 Dec 2025 10:14:58 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzPs-0000000EsFN-0meW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:14:57 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47a80d4a065so24749595e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766484894; x=1767089694; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CZaR+VLWbkJkXmW2vL4cv5W5+vLpcKE/YHys3L1wv5k=;
        b=nQrs8fWnjldceM40YtPp3yx83gkhNKQLdAtpW1FuZlvgcxDs6YIvAFZeak41aBX4Eu
         z3L2Rl20Yi/DrA96vY9KEmzxijoLBfv/nlN76HzR8g5noZTpGjG//VYa0XnXteHEQDtJ
         EITFjYlfDeEGkB8HJJnkJW8XJKA2kTEevCrH3lAPfhV9Lo3xmWB3APZQOoy3I+uvlpxI
         c6S/DrfBu5LD31V5x4/8/OZCexzBiz7vwROiqHZWH/S9nXkVs7z1x3aV84R7P/kXWHa7
         RZhk6rJZ94R+9m3TSiQUJ0AMwRR/9RFGI8rIwKcaOJOUIwqU8OekRRG2vmylTa/e2fNx
         GP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484894; x=1767089694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CZaR+VLWbkJkXmW2vL4cv5W5+vLpcKE/YHys3L1wv5k=;
        b=r8Ct5koOPZTL4xtuM/0d6EKOtolh3GykwUMNJhtJj5jDeYOHAsQqy+q5U67Sd2HLmz
         zQ6N8ZMPqkJ8gL9KZWfIHSixHuFuRY5a2PYVOWbpRXVZ1WnUcmL+T9XBHcquADlEocFy
         a//5n8fFzfyLf5M9CXaOZ4e22F/wP9tHmuu0qbbSD7At+GvnyU6N+ffttlz37jFayjlu
         SIWifYarrb8Lc5w5+hH/CVlUwG2xCHa2/IlqED12oBSI7NAvLBm7jx7ippUPLKkVApOP
         6oZYwbIqu113A4+t+0T+MT5+gjsBnbOw/oyz5weWeL4VJJRujGZqzft8RWXXgYRAU5HX
         O0tg==
X-Forwarded-Encrypted: i=1; AJvYcCWmoTlGIjTZKECr58qigostits17BLWWD7UN8fXNhHkXtNg9USzYE8Rd1UjY2nGzxUw0vQM8mKShreLopon/9Y7@lists.infradead.org
X-Gm-Message-State: AOJu0Yzywnt32vxm55GPi/1KwqyhwACo9oXBmw6OD173WPjzgqfRExbd
	6jp1CjdoDDS5aBgbYmpMys3MsK7JKd+qWUNiqT2BQTFEWI9VLQOh9rmApqr+G0bhy5k=
X-Gm-Gg: AY/fxX423UhFbGNjnlXDf8S8WZwp4HITgRIb+RTwjG0Uo7j23Y4cIUF5VDGOXcbzLoU
	HH8kGqEMXW5DsZfqM2+DQJPmESpwPt6A1bSAYDm89yR8XZsa5tLPmVWxvTuCNVfoEVo1Jw6pfji
	LZ6g3mNG2C2bdt75KFUUvMA0ln7X7njNZ4EDhiRAYTdHwR/+j+MEpExrwYXAs34mOOPmtbZ0KIG
	vz4wgl4GdZu52ADUJ7Pxrsr6PcPUvqAE9hiO1F3q3lqIyDTuv0R/Gmve3lNkgLEswfiWQBXYGPk
	dHf8S4LGqCJ6mFFZ0m7uAgTOQkmN1F4SJJYwZmlZc5QEp9ZgVo2Rm8hk1ky6hxhOkx7xBuOSdjs
	SftUbGb1cvm4iNDbfJ4WCCS/RNGJzYpqWmeU5HEiClIrUDBHaJiwh0a5OYoMJj99OFZI/V0k6hw
	uIYVCihY2Sxv6T7amwNjkSfrJ5pKmqIjo=
X-Google-Smtp-Source: AGHT+IGkYED9TKqYRj98ZVsQIZdbyoBxf1Q0pfuNnIsOb1AlKfTwyNT9W3VSOvf2y07a+vc1dZJIgg==
X-Received: by 2002:a05:600c:4e8f:b0:475:e007:baf1 with SMTP id 5b1f17b1804b1-47d19591166mr131317275e9.34.1766484894279;
        Tue, 23 Dec 2025 02:14:54 -0800 (PST)
Received: from [172.20.10.10] ([46.97.169.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm294947695e9.7.2025.12.23.02.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 02:14:53 -0800 (PST)
Message-ID: <51565d98-ac0a-44f4-af30-6d42b68661da@linaro.org>
Date: Tue, 23 Dec 2025 12:14:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] soc: samsung: exynos-chipid: rename method
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org,
 willmcvicker@google.com, kernel-team@android.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
 <20251222-gs101-chipid-v4-2-aa8e20ce7bb3@linaro.org>
 <bf1bca0af63f161afe351cb0e449896cec11cdcc.camel@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <bf1bca0af63f161afe351cb0e449896cec11cdcc.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_021456_245260_EA027FC8 
X-CRM114-Status: GOOD (  16.01  )
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



On 12/23/25 11:55 AM, André Draszik wrote:
> On Mon, 2025-12-22 at 16:30 +0000, Tudor Ambarus wrote:
>> s/product_id_to_soc_id/exynos_product_id_to_name.
>> Prepend exynos_ to avoid name space pollution. The method translates the
>> product id to a name, rename the method to make that clear. While
>> touching the code where it is called, add a blank line for readability
>> purposes.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  drivers/soc/samsung/exynos-chipid.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> I'm not sure this change helps with anything, in particular as the
> return value is used to assign to soc_id, but in case it gets applied:

what drove me to do the rename, and prepend exynos_ to the method name,
was that IP specific drivers should not use generic names for methods ->
those shall be left for the core.

Now about the s/soc_id/name, you're right, I could kept soc_id to align
with the soc interface. Happy to resend for this if you think it is worth
it, or drop altogether.
> 
> Reviewed-by: André Draszik <andre.draszik@linaro.org>

Cheers,
ta

