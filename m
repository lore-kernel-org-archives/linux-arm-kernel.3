Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EC6CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 06:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qi4jSexlkWUECSgX2tttLCZoyDCErk3ZozLNSj/B39w=; b=oZRe1OcJoDVqR0R9ASfwAr+b41
	HKupFxujxhOVO3jqDsuO1X95dIv0jBR7EpMB+8Hgv9e7lRhfM9O0/ccnEi7DRf1LFZj6DmDRNNq5x
	ORVMQvVIZ0AO2i4K91OeEhsGThZnnOwsYEk/Gj+7mOqOV5lV7OwR4Sj5qCGVw+PN1qrNYzZPQtMm6
	bpVRsGYYkD94OYCuFvvoHuD7vvEaAlWcp8p7r6l3TARgRQEnIvhrOzy4ZjmlwnKpAUHbT38PtqoD3
	2VKZm+XigvbLbY5ML4rEMpiNSHRyxebOLi2VdEJsxGxxqpb53UC0leFpaVBc1Ivv4Xg4anwVv/Lvp
	d1c7pzdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v61YL-00000001OT9-2P2G;
	Tue, 07 Oct 2025 06:52:05 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v61YI-00000001OSg-2Nmm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 06:52:03 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6395172532fso7841884a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 23:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759819920; x=1760424720; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qi4jSexlkWUECSgX2tttLCZoyDCErk3ZozLNSj/B39w=;
        b=H/OWhGiEDAKMjU6891EUfuqGELUADp+YPvdsoEvsBZqfaoHQAI5GwbqKO/1b5OoBzr
         Rt29lw9SJ1z/t6lQiS5YlKLRJg1yQdxf9MRnKpO8K8DNFyjI+uRD+fwnM4qmo0PRO0bR
         ED5mz9g/gwspQ9LzRDcUXVBSrK7SNo8cmpdP8+gIGMLZv0bejP2Pfm+eCk+TWuFxp4KR
         zp5KsiUNEFGUHNzQ+9czPlSLWgS+hlsLkEtFSjkBSRaS6Za+4hJEVm2tctA8JVPr0G9X
         2lUYBO1GDaums/ZbVRAjBqyvvq+eKQGrMnfP30dnqZxuXpFM3nQZAEckk6wW5mDhCqE1
         ZEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759819920; x=1760424720;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qi4jSexlkWUECSgX2tttLCZoyDCErk3ZozLNSj/B39w=;
        b=Ykg+w9ByYFv93pf7D8gXprlDl9eBeqZSKEn5caxDTismbFi0a109MWvCNim6lEaPaA
         6yLT9EsULtbXUN/JKRKHSLBYHfmBZAoxqKxLYhSvpSOAyE9Py7zhxpHcQc1816pp23pb
         9FPOkLq4XIsZwTtQr2YQm9Mt/yQtzfeoWqShyFIifQIcVQEHmdde2HK8gbDtobm1YBr4
         KbvmoF8F7fUm3meyiyLd57nNvJVpyCFPEDf2ua24K79M4g01rtFMbtNezt66t9ivng3W
         VTBQMshcKO1EIFz2B8iQ8OUQ3HG8jzktbOdliP7zH1VbgZUhZ1TaSLFin2ODFM/JWFp6
         vYsg==
X-Forwarded-Encrypted: i=1; AJvYcCWehY7e1Cb4SdqD3pier+8Y6WEbCNJvm7wIenFfcjMyVDQWGkDUXKzOkOvmsV1KMWycDfm4PMv4B7ugk1B2jBCL@lists.infradead.org
X-Gm-Message-State: AOJu0YwSwp1fYogFK3p7TPRg3cInXEkI5Qu1k0f6SQZK0tDTFkPJh2/i
	/QZ68S9FAtHmX1RZOdk1tVcsKpUgf5mvSl2B6cy1DzGxYhKqgqZCEzSc
X-Gm-Gg: ASbGncsGFKtNtpG3FPq3InK+5+eRsjiRAv7VKkSsHgZiryYuD/aed/8/bin6R2U0bqu
	bY81KVKhZl2r5hFB9YcRQ7SvOcYr5itz0z7YDII6BYM4wAazVf7fgSvgO05mugUFVI2Hpd0UJJG
	vouxDtwNNaXQI57lB+47zKtuin28+oJd+jZqpgN/k0L+DVUKgJ1OgL24OLtPF/gQ0wAo0MHu1Xe
	UYk/3A8nCNxA4dENdBhPK2Az76cUHifxqDdKSTCpoKMVYhzAJeXFlIpZxb0q3laeYJ9+mMH7TZn
	dOo5/YJqyb4FTOcLne6UVfJBFpU410P99mibWxyW2I5cQtWZgJWKAqH8jlaYY6xhb0LF+JSR7Q+
	fcoJ9TPiQfPlzWKGqoYkDMsTCNZhPM9OEh7Fv+derrOgPvjboQdIasGqm9f9gNP2Ro+ihkMqbtr
	l7f5fh3ghrU6rrA1ETag==
X-Google-Smtp-Source: AGHT+IFvQ+6sECDp6X1RNdh4i7W+52rk1hyacY0z/SIBtBQwCNvXpsQ4sXmTPd2Hk7QYTKW33PKEiw==
X-Received: by 2002:a17:907:7ea6:b0:b43:5c22:7e62 with SMTP id a640c23a62f3a-b49c408734dmr2046124866b.50.1759819919751;
        Mon, 06 Oct 2025 23:51:59 -0700 (PDT)
Received: from [192.168.1.10] (83.21.74.153.ipv4.supernova.orange.pl. [83.21.74.153])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970a684sm1299412866b.52.2025.10.06.23.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 23:51:59 -0700 (PDT)
Message-ID: <cd54058e-0208-4357-8a5b-4c6bb9f6cfb9@gmail.com>
Date: Tue, 7 Oct 2025 08:51:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v6 0/9] clk: bcm: kona: Add bus clock support, bus
 clocks for BCM21664/BCM281xx
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>,
 Rob Herring <robh@kernel.org>, Scott Branden <sbranden@broadcom.com>
Cc: Alex Elder <elder@kernel.org>, Stanislav Jakubek
 <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alex Elder <elder@riscstar.com>
References: <20250901-kona-bus-clock-v6-0-c3ac8215bd4d@gmail.com>
 <d36c5597-e26e-4ddc-93b3-222d8b40dab7@broadcom.com>
 <175834646902.4354.13114906749225372224@lazor>
 <7eed7848-b3ca-4415-85c6-7267c91560a6@broadcom.com>
Content-Language: en-US
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <7eed7848-b3ca-4415-85c6-7267c91560a6@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_235202_676627_525A0FD2 
X-CRM114-Status: GOOD (  16.59  )
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



On 25.09.2025 23:04, Florian Fainelli wrote:
> 
> 
> On 9/19/2025 10:34 PM, Stephen Boyd wrote:
>> Quoting Florian Fainelli (2025-09-04 11:28:34)
>>> On 9/1/25 10:07, Artur Weber wrote:
>>>> This patchset does the following:
>>>>
>>>> - Introduce support for bus clocks. These are fairly similar to
>>>>     peripheral clocks, but only implement policy, gate and hyst.
>>>>
>>>> - Add matching bus clocks for BCM21664 and BCM281xx peripheral clocks
>>>>     and update device tree bindings to match.
>>>>
>>>> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
>>>
>>> Stephen, are you OK with taking all of those patches through the clock
>>> tree? Patches #8 and #9 have a dependency on patches #2 and #3.
>>>
>>
>> I don't normally do that but sure. Is that a Reviewed-by?
> 
> Sure, let's make it official:
> 
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> 
> if you prefer that I take those patches through the ARM SoC tree, that 
> works just as well, I would need a suitable acknowledgement from you to 
> do that.
> 
> Thanks

If it helps, I could re-submit the DTS commits as a separate patchset, 
and only keep the clock subsystem changes here. Then the clock patchset
can be merged first, and the DTS patchset can be merged once that lands.

Best regards
Artur

