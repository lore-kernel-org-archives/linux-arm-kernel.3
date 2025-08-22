Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C86CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 15:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPvTo2XEETbDk4TcDNA4R7e2eQHtVrkf9abfQlGJ7VI=; b=4qTXCNLV2mrgwsuvshMsyqB1Q5
	qLHEwHRtxuuhofTg8qSxBip34/CRUSwEfjxNsElPmfAFo+OUDGOR6q1YTV8Cu5igqrNXOp33q7aHa
	7t4rA3eZVs1jVxgD8194GhSFhRoYtjhzjwPeQDtCuyO5K9QImBZE7uYMJX4D2GIZKCbttxSRf1R/4
	IQUxpJveoE8sKlUM/iTdVcNkvXwfEChXX2dAj8aCV41RnzhVYo7ypyvsyfOs5bMrvJ3vdvlmmTWs8
	c9PGH5EA4v42wim0dlMrFBmClmiMxANAoadULK/4tBOW6FO/YCTzXOtrcPdlWTwwlLkw4N/TOznIa
	JMxw36aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTmU-0000000329M-3B0t;
	Fri, 22 Aug 2025 15:34:18 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upMuX-00000001uJq-0Ncw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 08:14:10 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-afcb7acfde3so279457566b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 01:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755850447; x=1756455247; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LPvTo2XEETbDk4TcDNA4R7e2eQHtVrkf9abfQlGJ7VI=;
        b=tiLUFfy1w+cucov1vCWVH77FyLdLJT9RNDVPwsJal1wIrKcgozJVfpumnuT1w+a+Vd
         ezG8tlYabI/GWOExk8qPrWndDXLgDamkUrQgsiZO2rtSrsh+N3p5aZheNfXufvfigBxt
         UpNRbyxxiANXM4VHvyjbJ13GAuWYGmejWYPaO7I8+Tt53ysDmNSUUghLSZfsu7sVbtSl
         FtHCaaJPf6i/Do0CI7ohk20Eb+y9aKgmWCVHr7NFClecp+6DIJjA2HEUniZdnsWfta1e
         GQEWf8iIZ1bVyPD0Wz6djbDJfenhIL8WkOfcGqnCjoiLRXMPSotKsi3Y40dG5UdaMjNR
         lEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755850447; x=1756455247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LPvTo2XEETbDk4TcDNA4R7e2eQHtVrkf9abfQlGJ7VI=;
        b=kxHV5RDH5862v2ttMdhcA7cftdnimIDed06Cy8JoEkJTW75xIKbPGOU3Y8j1DJnCQ4
         6JBp7L7m9xTEiHhJVOXV9E6KDqEMQjf9wVbTqLmalYeW+MLNFudRU5y1zAKMpSDMDf6h
         hO8QfE+vH7cP8YNXO8S/QbTfL4jeXsK140Higv9LnoB3MWGsVUgaNWh6dctke8MEnRWy
         /ij9kp+i9xAEjhHRihNSTLTvOUeIrEyLwc0J+CfBx6kpIXWbKT8naP5FTbkOnZHkYQH5
         6gwmyaNn+873et4rncc1N35aj4UvmeRVA7NAkHpvhVzhyCt8xR9Q5lE2RrmuS3yWweuP
         q6iQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9JCzHbDPbyNLUnYCI4l2z4+1ZcAYTa3VxU0+XxbekYpYZnYpyzBTecYRcUnkAwAeoQZvgK9DJholOlFoHHEAF@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt6vQpjLoLMdZYxHzGSiMDmo4d4DYVQ1fhrQ622iRo4DGHW9Wq
	H/RVh8jxEVkE3nz28qtaAGh+drmhMyJfpzHeTE9rELBhcarWHNvD4JD2QUf9FtyiywQ=
X-Gm-Gg: ASbGncsk6P8Tz1MT+3g5NlkFoZxzFqekiyCsuQztKZDN7XSVEbO4Mt2y36UIcW0PTl/
	UPw2E4E2Yvd9qDdSDymifbfG2mdxt4T2OzesixYF/OgiTDpUZHwCJRwe4PEb2MxYBhtGGKkBycl
	B+RyZkMdRjXEJAU7TQDiATiq60sgw+9m5p3q+LJKe+J7GiFGsL1EwYjy34SEB1TSN+PXUr6l1QR
	Sy9BBdXQggVIKqsieJTHO3MnktdBgnrL/aNbtIyHkP+h6Y/zHYN6N44brkmASN4oi55GDlvDlkU
	4D92ju6ireES+MaQZ2nswQKAXlYpbxEzAkB9YLQpoAAUkT2MUUNXuLv9+rxJQ10lO+6Mhcj3m/q
	hIStVL9Q+Ab3lS03XWmbJ5NQ1CBgNN7e6
X-Google-Smtp-Source: AGHT+IEGEVoS2KNiJz+rap9NchIlTHp1e7qqv0SERyT7o+gtgwKhQP2IflgiPn4RYqUiBzAj2fr7cQ==
X-Received: by 2002:a17:906:6a1c:b0:af9:9ab0:6f3a with SMTP id a640c23a62f3a-afe28fd7ec3mr185456266b.23.1755850447341;
        Fri, 22 Aug 2025 01:14:07 -0700 (PDT)
Received: from [172.20.10.10] ([213.233.104.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded309ee8sm559576366b.27.2025.08.22.01.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 01:14:06 -0700 (PDT)
Message-ID: <720799b1-04ce-46da-b643-1adbdfc661e6@linaro.org>
Date: Fri, 22 Aug 2025 09:14:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: samsung: add Exynos ACPM clock driver
To: Brian Masney <bmasney@redhat.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 willmcvicker@google.com, kernel-team@android.com
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
 <20250819-acpm-clk-v1-3-6bbd97474671@linaro.org> <aKdmurrT1pFtLSI8@x1>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <aKdmurrT1pFtLSI8@x1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_011409_135256_AE430911 
X-CRM114-Status: GOOD (  16.15  )
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



On 8/21/25 7:34 PM, Brian Masney wrote:
> Hi Tudor,

Hi, Brian,

> 
> On Tue, Aug 19, 2025 at 11:45:38AM +0000, Tudor Ambarus wrote:
>> +static long acpm_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>> +				unsigned long *parent_rate)
>> +{
>> +	/*
>> +	 * We can't figure out what rate it will be, so just return the
>> +	 * rate back to the caller. acpm_clk_recalc_rate() will be called
>> +	 * after the rate is set and we'll know what rate the clock is
>> +	 * running at then.
>> +	 */
>> +	return rate;
>> +}
> 
> ...
> 
>> +
>> +static const struct clk_ops acpm_clk_ops = {
>> +	.recalc_rate = acpm_clk_recalc_rate,
>> +	.round_rate = acpm_clk_round_rate,
>> +	.set_rate = acpm_clk_set_rate,
>> +};
> 
> The round_rate clk op is deprecated. Please convert this over to use
> determine_rate.

I can do that, sure. Shall I also update the kdoc for round_rate(), mark it
as deprecated and add your Suggested-by tag? It would help other newcomers.

Thanks,
ta

