Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB614D44144
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 11:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WSBouoRatInqJbfUCy4gUiCHF5kDVST7sA6zTlqHn1A=; b=N0OFtZk0uC2W17IAEzWkrSz0VX
	AZuvOs010sAMrUgORaUq1gSS4evPWAhVrNMkJJqLRcis3NPlNs7BUSda74B8z37SbRztwWk583/5z
	j8WY43cmf5pWACsjXB10uHh5wzPLXA5/FrU1GGGdtVEd1XszdxENqE9vWIG68Iy/uDsU+4bOJir9c
	L+PRyM0DkSzbEXW6EtafNkroaX9qfwKpn72lJ1y7fi6foFnmuKjlLGDPX6YCHE/N45hNtkDLtd8LN
	hj26FylbuFqyqG4e+0N60gWJ0YSfEQselqneGKbv4O6+bdPc4M9DASvtKWNnp86xQRY30c2SdAUyB
	3TrfAraA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDMGD-0000000CC15-4Bzk;
	Tue, 19 Nov 2024 11:19:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDMFH-0000000CBu9-2pZ8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 11:18:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732015090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WSBouoRatInqJbfUCy4gUiCHF5kDVST7sA6zTlqHn1A=;
	b=IwTp4ote9IueFqjdrOqb80yFNlFWNE3R/MdBi+Baga4oH+PXOF22U5lC6FaMH2IY4DEowY
	o7+3RiYKCOybspGmokhMBGYA0xQZDWKGaQ/Zle8JPF0vDv27PljrvIB/ruzFOrye4U623d
	CCo0KKx2KmSpzXOg2PbchL0FHH+41Io=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-i7iOARFIMbuwM3Zn4B5jxg-1; Tue, 19 Nov 2024 06:18:08 -0500
X-MC-Unique: i7iOARFIMbuwM3Zn4B5jxg-1
X-Mimecast-MFC-AGG-ID: i7iOARFIMbuwM3Zn4B5jxg
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-e38aae1bdb8so2248136276.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 03:18:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732015088; x=1732619888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WSBouoRatInqJbfUCy4gUiCHF5kDVST7sA6zTlqHn1A=;
        b=bxFgFwj4RiZzyPMnIFBHe5phSirha2w9Y/2dRdYNSdMPHD+ZvhrMCJsLDJpEtLQju1
         u8FnsBRtld3z9iFX/ZvBNw4C5TeAOdavios5AOmI7QV8GGWB55sSBsEpMyg0WK0DxUAR
         JzzOaKYCjn1KfRZoOUrLwKnUBaBbI0M1qYJoCk1cCahHtH/AeU1qNQEErWSGc+c5FyI3
         b0FqiCrJQiNpOMfEdX8OsZLfp/oVSs9jU7pmeg/iwW/PFPDM9CaXz4iy6wHEeMP4SPow
         cNG0AU3c1QZiCGh5WU1wYr3prbA6fiZSr+Dcs7JQwtXN5sS9IWefrK262HvtCr29kysr
         ERyA==
X-Forwarded-Encrypted: i=1; AJvYcCUIpEzVBRcG0Jnc7CYaBguBKxJLwYafQ89ssX1KYFsmQ4FzbZ0n5XQrqkzij6JRtmnxDrMGKzk1xsdToKjBpDk9@lists.infradead.org
X-Gm-Message-State: AOJu0YwRQY7bS1mRlAaZO2E73jIlTLQxMUn6iB4uwtAEiGstouRCxsg7
	nIbBluSOMwT7UyA4H+MV1bGQPfLmthtQZxOM4s8wJlJP8YxvmD/PHiv4ukbSSlIG/j9Rl8p+ptX
	51JvEdi7kaDndVN0HPs6ImM07cY6R2NmLtfujSV4Z63yCRHuiapgiyF8jaed444IRiXFlood/
X-Received: by 2002:a05:6902:298a:b0:e30:cc00:b010 with SMTP id 3f1490d57ef6-e382614f9c8mr10200272276.25.1732015088324;
        Tue, 19 Nov 2024 03:18:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE96zkhRwyQeB2qy8231vJaIKfZPGcGVKna3QNScGbU8jvugvr7WKVQycq/NpiNX4wDg/wBiQ==
X-Received: by 2002:a05:6902:298a:b0:e30:cc00:b010 with SMTP id 3f1490d57ef6-e382614f9c8mr10200247276.25.1732015088026;
        Tue, 19 Nov 2024 03:18:08 -0800 (PST)
Received: from [192.168.1.14] (host-79-55-200-170.retail.telecomitalia.it. [79.55.200.170])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46392c44142sm9845691cf.85.2024.11.19.03.18.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 03:18:07 -0800 (PST)
Message-ID: <3cfc2e90-c9b4-425d-80f4-ddace9aff021@redhat.com>
Date: Tue, 19 Nov 2024 12:18:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add standalone ethernet MAC entries for qcs615
To: Yijie Yang <quic_yijiyang@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, quic_tingweiz@quicinc.com,
 quic_aiquny@quicinc.com, quic_tengfan@quicinc.com, quic_jiegan@quicinc.com,
 quic_jingyw@quicinc.com, quic_jsuraj@quicinc.com
References: <20241118-schema-v1-0-11b7c1583c0c@quicinc.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241118-schema-v1-0-11b7c1583c0c@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LG7D-gphEDocu_OyOiksWl45eiPTbPIsDX5-N-D0AXI_1732015088
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_031811_790258_2FB295F5 
X-CRM114-Status: UNSURE (   8.31  )
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

On 11/18/24 07:16, Yijie Yang wrote:
> Add separate EMAC entries for qcs615 since its core version is 2.3.1,
> compared to sm8150's 2.1.2.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
## Form letter - net-next-closed

The merge window for v6.13 has begun and net-next is closed for new
drivers, features, code refactoring and optimizations. We are currently
accepting bug fixes only.

Please repost when net-next reopens after Dec 2nd.

RFC patches sent for review only are welcome at any time.

See:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle



