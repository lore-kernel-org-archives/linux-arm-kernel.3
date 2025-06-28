Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F98C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 08:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rH9BlYUujAtn0szsEikQz+xplSeERMbYhhICLQkcGk=; b=uXAzPVqC503y4g8801vsoAcdV6
	HZBmkFEg0bXiGs57p3IPnHoHsAIhX4HUMxWFaH7J38LXWsToGy0xUHQ5WU0cLn0mJRdk9PZ2Au8d3
	iKDKnPp09czEmaqZg2OxE5OqJ6XKdRbas6FgVDfl3qDKxFVeqiJi4BxwJWZJPTfC1bPlwaeklkadi
	v9DhW3l+Bm8fkD57GpUm/79WFyyKHHSbBHF2KmS65TyBU6TnwPHZ90KiYEiDnZh8S+y+Jfyaoqjl+
	6VHiRRouki2itteb2facMszZ6aqDSbfFucaWsvsxGxnhuMjtJ8GZLkQvUMaDhvXgTBK/hAg3VWR5R
	nwtxJ/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVR56-0000000GZDG-1ZcV;
	Sat, 28 Jun 2025 08:38:40 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVR2k-0000000GZ1w-0Sek
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 08:36:15 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-606aadc1433so372753a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Jun 2025 01:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751099772; x=1751704572; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2rH9BlYUujAtn0szsEikQz+xplSeERMbYhhICLQkcGk=;
        b=rzK+R15agPSKnEKTihKYdojGQ99XmEBUT/+lgUB8eMOqY6GrkexvAsFW8h8n80SlgO
         tR/DaPlGhjhIwvdm0h+UmqZ8jxtqmUQSlO/I5B8WF8oBjlTod9gPRncd5m6afKlYNv9q
         tUCmAnLxeteNK4YwGsvWbQ8fhujpdo8CDgvSmAw8J934v8gVOYEPF8bw7+IO0p3ow4yx
         Gflq6VcSmvGp6ajUrxHeIIBjVENNLL5AwVrLDr6ef2IpnKbLMTAy1N1q3Apbl6mQPQPM
         LaLhCxGx+yzq04DdVoDBvlZH+03VNwrXm7vqpvFKr3b8nBp6oX4/0IpRHPLaL7/KBEzG
         1zpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751099772; x=1751704572;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2rH9BlYUujAtn0szsEikQz+xplSeERMbYhhICLQkcGk=;
        b=RFcgWWbw8MR+saOgikhZ4Mi5p4saERQe73qUfSlq7OE78DhAGIndNkSlNTrr2peeeQ
         S7C0ZXPFvnXle+3IHoH1iOYrwRu9euWsdheLeRCRHAGBoVmdycofbah9JU42Qs8wsOZ8
         +yKWYbRDO+l0clU+PLJnOrQJl8Ab2Mj9gGvUh4Eug25xO3Wixoqkt6/i2fEZ36fQhcC+
         QWeQBMc9Vg5DEs40NT3wvDQGRJg66E0L1tFtfEemZlhWu1WaI7aAzswZeyoFHNWxOhTd
         MevdBHPfrVp5t5bRk7eBm4AuLKChXPl9qP+qBz0M/I3OVu+Rqmo9BtXOFWzErd6vAejN
         8/WQ==
X-Forwarded-Encrypted: i=1; AJvYcCU62VZjje2dd5wdCXmdGAKyJ0S1E/1iBs/6XgBEZNXvlZWCx8RKKvOovHeinXh9Uk4ZSwHcLltFN85mlxH2B852@lists.infradead.org
X-Gm-Message-State: AOJu0YwvVsBNwGIEQFB01cYlVKcF4w93pLzyFRfeD3ZSnQXGI78VID9M
	tpBDsnK74FYGNGnZl0FQ12AoAawzXDtFQaZgAMtP1SmrWK8WmaHng52SHdaU6zVgfGw=
X-Gm-Gg: ASbGncvn0mj2BOEM1a20PdHm93I3fWZ59kQqHZXdDtSc/20uLS0DcEhaWPaImytgGmE
	U2wW8WnWemBHiJQib1m46XPcO1dkW2LaIDdH3JsdfXWJn7I7bQWKeTn4zxj8gJD0wD3DGlb3nai
	2ItZfogxh6ZMT6Q3sZSy41VdFvhPDutoU5UHNHJ8gAQG3R+UAV1629v7HPuPZwIGG3pp/VNvDxa
	xyyggNZanTGdPgawmLCn0OeVD4KSe3I6LOWexb8hOeWTbjj43uVF2y9XWo1RdMsyFJ01+HDnotj
	LpxPrIYFYtL9WmLJ60y19DZf1D74K7h9JtpK2cjGpgUcafddqrj6quVxpfE4oLk2pcsEr1IaxC5
	tmyHwIP4crDRhNrc=
X-Google-Smtp-Source: AGHT+IEC95YGQTUZplG6mM1XnXrpcmt1FOskC/y/jwxAHjVTucahWCeAyjJhBLY/WgD8AnFYJNssQQ==
X-Received: by 2002:a17:907:940c:b0:ade:328a:95d1 with SMTP id a640c23a62f3a-ae36aa096b6mr69794866b.10.1751099772128;
        Sat, 28 Jun 2025 01:36:12 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363aff6sm277044866b.19.2025.06.28.01.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jun 2025 01:36:11 -0700 (PDT)
Message-ID: <47937e98-c6b0-45f9-b610-cd2754f9e861@linaro.org>
Date: Sat, 28 Jun 2025 10:36:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/mediatek-v1: Tidy up probe_finalize
To: Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org, will@kernel.org
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com
References: <7c78149504900bc6c98a9c48f4418934b72d89ac.1751036478.git.robin.murphy@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <7c78149504900bc6c98a9c48f4418934b72d89ac.1751036478.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_013614_180203_9C48CE39 
X-CRM114-Status: GOOD (  10.60  )
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

On 27/06/2025 17:07, Robin Murphy wrote:
> Krzysztof points out that although the driver now supports COMPILE_TEST
> for other architectures, it does not build cleanly with W=1 where the
> stubbed-out ARM API can lead to an unused variable warning.
> 
> Since this is effectively the correct intent of the code in such cases,
> mark it as __maybe_unused, tidying up some cruft in the process.
> 
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> Since I'd already got as far as thinking this through, I figure I may
> as well save Krzysztof the trouble of rewriting it :)

Sure, thanks!

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

