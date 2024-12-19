Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456D8E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 10:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aVaHqJdzzc6/RXsrUMqwYr4L9WjHePTtMi55G/q79tg=; b=aE24rrQ/TmcCqMVJt5v8aACHfO
	SdPBlA3Ltnqnua1TM1iLW16bZ5EPVyJi3aMVaJiOf6EYq2UK6Vtd1DkwKiYk49TBpWEcMspRdmoW+
	5GDRpNZlw2dAFZ5GvKbu9XZwM1+zDr0DIVL15pRkgIaDZZ1AGvxeUih4exjNS4iVhrckurRNd4+hK
	90INXVGPkbui74LVzmD0rbDiYRrBrtOsy3m8CbIsP2/1x1uzBgE9o7rVyZ3eqYsLREABq/npWJvOG
	Ebq4+5/PasW3FemgSmBiKjnOHXJenBm4+Q7onPNjK1YFlolbUk2Bqijw0wt9d/zeYKbe4Xhsq1WEJ
	o7PhOxPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOE9X-00000001aHV-0aCj;
	Thu, 19 Dec 2024 10:53:11 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOE7T-00000001Zxl-0cjF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 10:51:04 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aa66c1345caso55938966b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 02:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734605461; x=1735210261; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aVaHqJdzzc6/RXsrUMqwYr4L9WjHePTtMi55G/q79tg=;
        b=XH4gBI50kDFNjxlnF+rXMvy6gWImLc/UT1K1FAb2rHMoRRR1eacjc5ZHIxP9HAjahT
         AvmeKAz3C9szgrzZHKqm5UsRRqntfj+IEOygnBIV5jTBx7vSdqf/QF7dUno8qWrcL7ZK
         HzDlodpV4GmctHHGKhrdz+v1a+A7Je7vM/sitdoik11wGc593qOYeCOvoH0RyH+Lcdg1
         KNwADMjwZEZJGQu/OAx/RdsM4FWLpQzOB88HTx8IaxllCUmO/IQXhIRhf5efULbwQHsE
         MrUGcnzAOC/dLw4AZbmlOMxiJdeOrbnxPhxvYpicfx+3RrozD+XSZSnYr3ZC73hyeFEl
         xKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734605461; x=1735210261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aVaHqJdzzc6/RXsrUMqwYr4L9WjHePTtMi55G/q79tg=;
        b=N8hS5w8uCytSQyWIoo5Hepjnv+oiXL+k3ijZ4m4r5xp76DR48HcH4tkHjgQejxWicu
         uLslsQUbZ98B3v8nKlMuYYeHKVwt03BPzEJqhXRWjt2/JpS1+z2+ZVF1yfFTVWotfviA
         ngcUaX3OsnCTb4hpeRfTWTpcTvw6/gvWDktgCzBs+34FI5BHgorT/TIARCBmQhIS0yL2
         H/it4tOJMUTUKdcgJq6srONziNWXlLtTQ9aLAxRjurXPb4m5GIY1anTQiDcSkWY5jBBR
         HbTsZwd3c8niLxaie0RMgCHpZZY2pB6/esKOWNa1WGTgl1emSKLlPrVIZ5CQKO0yFxbl
         G3oA==
X-Forwarded-Encrypted: i=1; AJvYcCVbq5+dFuCPrIlf5wCe+GvLqEOEuNmaLYrGoYUy+xAZLg4KCwGAvvhV9sqX5XM9II5YVI7JVEeWmu1+xPn5ghEm@lists.infradead.org
X-Gm-Message-State: AOJu0YyZh1oAOdKiRsRWkTSXdoiCpB7qRNOYXDTXOpHCdNMoYiCLB4st
	4G3NOnchRGT7x+uhW12XseKthLJ5IFuA0LrUzHtkh+QigYP4lHTGYptXQtMEH80=
X-Gm-Gg: ASbGncu7gV1tjf1TM1LH/ssa6gH22Hwu+kDf2TNQKQCffFw2EMD5Er5BdEPF9RP+Aot
	llCvnUAHmlyYbt7uhDspRJuABqa2VTzFG+QBe+pdQEPW+ENTiSkW2KkhY7ngHuBghNevHa2YB+r
	vClyGaSWCrmCM4uvglZ+SnnMFDjm0e6TEPRByKnFCBmAMlOYdf7Fm58FlXYzvm1+qfu75t3YALs
	pvSMRNjlc9OPU0X1wtpQnTZNEaShFXMhLjX40UBPMjcuyLV8PhihvzDtAlcpkFG
X-Google-Smtp-Source: AGHT+IHBuRkyoQD1EHB9ZmOyTHsx9PCdtAK0b+CCDpTw9RoYQfSOBxBrLbZUs1ESOuaSGAfTefp1Fg==
X-Received: by 2002:a17:906:3145:b0:aa6:b4b3:5923 with SMTP id a640c23a62f3a-aabf47baa14mr514507566b.33.1734605461426;
        Thu, 19 Dec 2024 02:51:01 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06cf19sm51704366b.198.2024.12.19.02.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 02:51:00 -0800 (PST)
Message-ID: <ec3cdfd1-df7a-466c-8581-c9546ca6b089@linaro.org>
Date: Thu, 19 Dec 2024 10:50:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: mailbox: add google,gs101-mbox
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com,
 willmcvicker@google.com, daniel.lezcano@linaro.org,
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
 <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_025103_250798_CB6824AF 
X-CRM114-Status: GOOD (  11.85  )
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

Hi, Krzysztof, Jassi,

On 12/17/24 9:40 AM, Tudor Ambarus wrote:

> diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml

cut

> +
> +  '#mbox-cells':
> +    description: |
> +      <&phandle type channel>
> +      phandle : label name of controller.
> +      type    : channel type, doorbell or data-transfer.
> +      channel : channel number.
> +
> +      Here is how a client can reference them:
> +      mboxes = <&ap2apm_mailbox DOORBELL 2>;
> +      mboxes = <&ap2apm_mailbox DATA 3>;
> +    const: 2
> +

Revisiting this, I think that for the ACPM interface mailbox client use
case, it would be better to introduce a mbox property where I reference
just the phandle to the controller:
	mbox = <&ap2apm_mailbox>;

The ACPM interface discovers the mailbox channel IDs at runtime by
parsing SRAM. And all ACPM's channels are of type DOORBELL, thus
specifying the type and channel in DT is redundant.

It would require to extend a bit the mailbox core to provide a
mbox_request_channel_by_args() method. I already wrote a draft and
tested it.

Do you find the idea fine?

Thanks,
ta

