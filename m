Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F2CC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 08:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8F3pQMHzn57/+12Z4uNur6aObL1w83B09wCI7//oKZ4=; b=g2GCk6wUuBTSGLsvXqpcNTdp/v
	ZKD1glhKyYkEW/URf6Ii9ppYvL0cvPmCeDyksCe3MmQgoiqnYM+TQe5RO3UGjPb/5gbH++YaxtvOw
	a8JhDYhpysgmgxuglZUqzOopRp/9G21s4ZoQdPmxp4BvtkCTDrwR7uEyRQRxD1eVVZFnN8lVnr7vW
	K6v6TAo1r9uqaLTgXwo11S6TB5wZ1UIhjoRrTyibeGPt5h+Ze0AT4zCCErh46gObifK0cS0SERKQq
	cWE+LHXAhklXMHlOrJSUGjHNIobAvoIMfKINpW7MmbtGbYF4nvu3ZYV1E1H2p+9miZuzE23VKP4i8
	6eCVB3Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueVJt-00000004RPc-1epp;
	Wed, 23 Jul 2025 08:59:25 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUjK-00000004MWY-3nBb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 08:21:40 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ae708b0e83eso1151605966b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 01:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753258897; x=1753863697; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8F3pQMHzn57/+12Z4uNur6aObL1w83B09wCI7//oKZ4=;
        b=Iv5EKv2rzA45QyyD0pWiHlZ0EIca16UJOgWXAcrzijLg8i7c0hlJmCACROUd6SM/2A
         OLCaUc6w52nnx7ChN2LVAyNn8kP9ONoEStY6QbjW/tzTQDpdxul2+PZYvYZ0lVn1GaF/
         AcehE8Tz1y9etwwvdzD34jXBntecBHJTa20YLFwPhG8dq/nhzB8iHR3rW0kVoi3iIV/L
         lG6wqKWsD526nhz0Aowa83Jp5orbJf0lpxfo5yViMCJhKGPA93cL7ZRJ9Ep656x8/559
         +lhNN4mE+R+efjYLhpz9tW2n8kTvFyjETzAGSzXjFCoR8aqrLlA0ZmazP73un42je3l5
         gpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753258897; x=1753863697;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8F3pQMHzn57/+12Z4uNur6aObL1w83B09wCI7//oKZ4=;
        b=KXJnVBAqwxPtKMUfwtOEWon5zoaXF9pvjgrSD0uaNG8LGlCyncTnYQiXMLAk/kDoeU
         wLACym+vNql1LGhrTsEPuafjnSbJUfGx/b7mHk79IeimqDfcWRU/wsuJbAkI089/rCjH
         trSsuW5y+c2HiNbNDpsBK6swNMp7tIELn82B0ivKpXQZnl7R2qZ8K+bIRCgr+49PFXez
         OqcxMW03LCFJ9IfKi9u61GawSZJ9/B1Vu9cf4Jzsb/sOyMle/DR8r9L2KYaxZKiQvZX+
         Mpp5wb58NQ4z9fIzy9QqC6YzMNfj7f056ktUTZLP6KNksc/V9EVax2mxBBCZWtr3awUt
         BRcA==
X-Forwarded-Encrypted: i=1; AJvYcCXtozWAtRguZ+csGiBvKDSl//5WZNseFq20iJKSwypv66IvIzsj+SmgwYo1VhpcexsQfUxobPIls18Gep/N92Hb@lists.infradead.org
X-Gm-Message-State: AOJu0YwhZoHLynK7wwKxCo/k1tCMbxIs+kJrx129h1B8J6RfLEvJE2IJ
	doEKONzhJU9NuSb4sDVFkNovrg74n7YTpq0Ua5EQNtGeF1mwRKVEgrvO
X-Gm-Gg: ASbGncvtR/IQZzes7rYy0f/8MfwWp4NMYRD1Ar9ZznVufGW/NZ9lc/X4cdxSdUrVfM3
	cosR1iTS+b/0KHGZGELB6p6lwsQpR0O1F50xQDESAsyKsHhsMchk+E3qQ7KzFwFi11kLbdQkZTt
	Ocdx1QcvnAmmNRDyTBkJWay/zcvnkcdznoZyVeXO1KjL/0Cm6T64+jQK10UbE/cTMFPTFwD/Kpt
	88dtc7Y7mWFQdUo9Y2LzQV0dEQGB2VdCjLcZujB4o8Krkxdpv+9sXUzb4Hh0jdpMxbBYVmFVxH7
	4j8DEMrdeBgv61l1UKVLR8AZcRbfkBm3R5aaVhd/9Xq225L+9lX5Ar9zI+yAwp/qMxJCRpK/dC0
	sGFY4W/ssyfYUkpSjBPHGv4Ip++Of3hndhmqG9zim+fdFQ4GwLrGhX204DGcUriCCQOG9bxSAJU
	tUh6GH86StW30=
X-Google-Smtp-Source: AGHT+IFkHHbkODiYmV8sFSEk8SQuRIN7oO8/OiWydt0ur7eqjtb3ORcfV4x9u44p8Y75cAtJBRVFpA==
X-Received: by 2002:a17:907:971a:b0:ae3:67c7:54a6 with SMTP id a640c23a62f3a-af2f865c46bmr173733466b.34.1753258896982;
        Wed, 23 Jul 2025 01:21:36 -0700 (PDT)
Received: from [192.168.1.107] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca7e074sm1002144766b.124.2025.07.23.01.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 01:21:36 -0700 (PDT)
Message-ID: <3e1d7be9-e99f-41c3-8b0d-aaa426aa9de8@gmail.com>
Date: Wed, 23 Jul 2025 11:21:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: soc: samsung: usi: allow 64-bit
 address space
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250722121037.443385-1-ivo.ivanov.ivanov1@gmail.com>
 <20250723-hypnotic-malkoha-of-trust-9efdb6@kuoka>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250723-hypnotic-malkoha-of-trust-9efdb6@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_012138_954714_48288F58 
X-CRM114-Status: GOOD (  13.95  )
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

On 7/23/25 11:15, Krzysztof Kozlowski wrote:
> On Tue, Jul 22, 2025 at 03:10:36PM +0300, Ivaylo Ivanov wrote:
>> Some device trees, like the exynos2200 one, configure the root node
>> with #address-cells and #size-cells set to 2. However, the usi binding
>> expects 32 bit address space only. Allow these determining properties to
> So if USI expects 32 bit, then why do we allow 64?
>
> Switching this to 2 means you use 64-bit addressing for children

I don't, but the main point was to avoid defining ranges for every single usi
node, because they are a lot.

Best regards,
Ivaylo

>  and
> allowing DMA for >32 bit. This should be the true reason - what is the
> address space and DMA range for children?
>
> Best regards,
> Krzysztof
>


