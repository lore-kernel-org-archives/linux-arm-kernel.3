Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C65CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 07:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RiPjeOB66FDKJZfr/ttLTVqavYTkJ/P7VOQby544s4=; b=T4oDHvzsriXn/fwfpdAf+lovuH
	dmQdndZHlYPbfnZqwguDWSZTJUdlggIATGJm93UO/dbWHt95p+NBlfBTSjLwm5j2QK3jSecB+Tl/0
	ucCwkzfyhhZ4QlYRFywll9+MZwt2Z+8BQY9K8qoc2ET2JL88UMdG/WfciCUYFrV095n/RRk132Yaf
	pv2ouHTrJgDlG64fZV67IY+popFDfKVlQIBDA7ZjQy7k2ltuXTio48q7nlUfma4TjemeARsZAg9t/
	vKJrnBjkuxQ2AEq3n1WgSAklqSLMZy66TmfV6wLBa7NR9dAGtGqQkQBegD+0uxsdTXhla3zEjOcd9
	UBTF9E5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszK4-0000000BUNN-0xCm;
	Mon, 01 Sep 2025 07:51:28 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usycJ-0000000BPAX-3bFe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 07:06:17 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45b8b2712d8so9747285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 00:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756710374; x=1757315174; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5RiPjeOB66FDKJZfr/ttLTVqavYTkJ/P7VOQby544s4=;
        b=I7/j1+/NKpoXFrAlm2/kqHh9CZpLeerkqDVgJy7NprLNnmuAo8y8VX0wVKCllRvgUq
         dV4/Qo2se+9MDG/MUccqst9EPeOFMOURjqMXdfd6SEqtELNXKm85Cie94nb1L4Hx50Mw
         HdeaEcKNWc2+YOQHOprfA42M6XkVTPv1czdhdAp2COOHv+s3ztvmeQxXVb5QFBGP4rFD
         ywrsqQblBpTjMg5erXhc6Mp7+wIONcwNNMyH0YfDU8usE9bCcaKNSlV9jehHE4RZEGxP
         8Joevu3QiCCDZB7ys20pDLSqB5hKy8IGOl133idHSy19CBJUFQuuKWAkpHeziTAJkIHR
         a1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756710374; x=1757315174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5RiPjeOB66FDKJZfr/ttLTVqavYTkJ/P7VOQby544s4=;
        b=G1KNUU0vK7pQ3bWy40xLXmpnzrteiYRIgDx37dZC8WKbJKoSt0UG2t/PgF8FonqOL8
         gPxjFsLxe1iH4DtWM643HF2vTXska6uREHn4NvEMbmRYI+cDAfYaR0yOiIcaLp9Z7YID
         xNeBP7+d1WZEbEYEGGIw442CwtnQggYRlPQkbEJUOhPComQuvNVm4vsDPr5Cff3844Lc
         gypX7Hr/yXVlnVPzXjhrdWksfPwE0iIXzV0Obdwrt9JtUhL7j/+RflgmJR9cB23J/Ss1
         kHkHbt81ucSRRW2NGrjK1xp7ZqnuwBqCixCU408KYw3E8jpVjdGZimFh5mX+6HWWw8E7
         QZ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBcCk8lVCPUqn33kZOoShhagz964bmKzw47kl51LE3eZ88IrLQYcc+REk9i2yupEBqLJt1jDwi6QXFhXOg5b4r@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjxl3fdmzf5yvf+QdsmQXhJiBbCBxuXKmHZK7hNw+yeX7TPdAc
	DOVnesXX2pukyxDKvCe0CFjwDRmeeoFZQhieclhBsbe8N8FZUwpxLFx6jSQXq/k3McA=
X-Gm-Gg: ASbGnctP7CG1MhUWcdkXR4YKwfIMSXKHVWljgCi2VWqv+yb1wzczK5Z8GA9GytapQ4U
	9bRi7rmw9K3hDBA3y260m3hBNGMFe1ebN+NrUSwYvuGzxm6v/KmUtzj4gY6bY0LLbvaTcsJ+DXs
	8TKBt3eUk1bN4jGRTIfqxb9/cnEsmAzRtGCYnWDvdKzsEVkccr+iL84Ju8772UB868xZ9cgucrV
	YiwnGWCR+MmoJEM8lKQqCtWqEY10Z9ApIwCq7txPvhck1EftSfYXi9rGqZwzzwgni0aT3b5oH+o
	iE7gydcey6Evd/kWyEX2KvYrti7CBiphKHH1LzauYWesMWdE4pZnd34trzsrOTt5GKtjZqqthF4
	ZbtbyI7QGVKNvQhBHbJswgRhQUXyjjwBOdIwnHmOH
X-Google-Smtp-Source: AGHT+IFnBbOE5ba7PQ9iK6x0QBC9gheBMd69i0QeCPDpf2UAKrxEuZOeM6Cz6ka7pF/Dx8JiLhhRIQ==
X-Received: by 2002:a05:600c:a44:b0:45b:7f72:340 with SMTP id 5b1f17b1804b1-45b8557c68cmr60349155e9.25.1756710374198;
        Mon, 01 Sep 2025 00:06:14 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d85f80d8casm541692f8f.54.2025.09.01.00.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 00:06:13 -0700 (PDT)
Message-ID: <73674a4e-2397-4470-8743-763e0fb7435d@linaro.org>
Date: Mon, 1 Sep 2025 08:06:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] exynos-acpm: add DVFS protocol and clock driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
 <28b5b033-76de-4fed-af6b-6d8342362c47@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <28b5b033-76de-4fed-af6b-6d8342362c47@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_000615_910585_CBFA3FA9 
X-CRM114-Status: GOOD (  16.86  )
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



On 8/31/25 11:42 AM, Krzysztof Kozlowski wrote:
> On 27/08/2025 14:42, Tudor Ambarus wrote:
>> The Alive CLock and Power Manager (ACPM) firmware exposes clocks that
>> are variable and index based. These clocks don't provide an entire range
>> of values between the limits but only discrete points within the range.
>> The firmware also manages the voltage scaling appropriately with the
>> clock scaling. Make the ACPM node a clock provider.
>>
>> Add support for the ACPM DVFS protocol. It translates clock frequency
>> requests to messages that can be interpreted by the ACPM firmware.
>> Add an ACPM clock driver to model the clocks exposed by the ACPM firmware.
>>
>> All patches can go through the samsung tree.
> 
> You really should have explained the dependencies instead of me trying
> to decipher how to handle this patch. It's really not trivial.

My apologies, I forgot. If I tested individual patches, I would have
remind about the dependency. Something to automate for the next time ...
> 
> You do understand that clock is completely different subsystem (Stephen
> Boyd)?
> 

Yes, I do, sorry.

Cheers,
ta

