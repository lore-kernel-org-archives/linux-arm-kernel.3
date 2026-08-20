Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E80C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8u2zk+UMLCr8IYSxUT7KHSPV+PCcsMNjHBcMIg9fE3Q=; b=yG34qY8ebhmn7ghiQ91ejThV0v
	WNEl0vC6GeoQhT+7lQvW63z2sq+1iM+8hqifvHOp/oVcy97GBUsl4z2oi8HBP2d8w5cGOuj6b+aa6
	WyeI+4OyXQJ5OrbZuwhl/NsBMbWzHo/aThabdI+0in/1zdYuR82loL2YLs5ElCKLPgvAQSE3Ap/2q
	fs1qp9f3Jw4r2U3Wsu/9VXbh2zXuEk3vJ3EIOKYwNtHSxTPcYuUEwdhEaO870NTPW653CSBnZ1G60
	z4RxTJPRwlmwsvnIAyIsHblQ6A1uwc5qtrZzuizeKqgM222yycLlX1k+HRTHcv2Nk5Rt8fE9OXbht
	84Omcnkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwzJ0-0000000BI9J-2EE1;
	Thu, 20 Aug 2026 09:43:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwzIt-0000000BI8h-0FQn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787218996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8u2zk+UMLCr8IYSxUT7KHSPV+PCcsMNjHBcMIg9fE3Q=;
	b=MGD/AQ3mfNYiYCQTbR3q8gSqjQtnvigiZjiUad/hRU0xxey6mX+TOM0EicUSXKmue9d3gg
	/e5zKu1MRMoMJdfT3jCBkJb4f5zwj5KuRpeiBydJ0L186M12z7VC8mf/SMkYBNXGnr/Oc2
	905TojxOasdIJDRFNHxwd0WvcNYOKoM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-7BxrdwfmOySkOiwMXtwDZQ-1; Thu, 20 Aug 2026 05:43:14 -0400
X-MC-Unique: 7BxrdwfmOySkOiwMXtwDZQ-1
X-Mimecast-MFC-AGG-ID: 7BxrdwfmOySkOiwMXtwDZQ_1787218993
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4815b878101so909357f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787218993; x=1787823793;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8u2zk+UMLCr8IYSxUT7KHSPV+PCcsMNjHBcMIg9fE3Q=;
        b=o7KjN+1R2GF4RZdzQ2LGIMspLUs8AIJeK90xTYNMzInjXO7FegtJFluzwmpU32eKa+
         jUkbHvJlLmxNphx68K9W3uR5YyDfEe4yWtHpoOkXYEAp7c2/LBxRzR2wOXXoxtuSR53V
         XilK4Iv2Or2CAbQ3jTzTnVQmASDwtHbyd0NIFbItCvIm4l24UhffBnkc21wYHTLRQ4RE
         nALXdeC64wYFhIrcqd0yc/1E95Ao87JjH7Fh088vjdCHf2Vz3hAq+PwNr22OYtcQR+ZW
         Xr+PBpq5YmXncIT8oKJ2u4kiBegDBbemBSisYNSSjETcumX2DA8kvyt/+Uu8M9QsuL0x
         D9bA==
X-Forwarded-Encrypted: i=1; AHgh+Rpxb6ltxSSzKuXNVKxF8NxZknxMqoDr0qtC2MI/0BJkjp9O7vYTuqQZVjg4ihmwMjPRgp0P/uEGzXjSzOoYGaPY@lists.infradead.org
X-Gm-Message-State: AOJu0YwxXvwk9zA5LKcDcy0lGPPuUVccD29Oo0AuMXQOPQGI4sGMNf40
	siXGuA95bQHocMuasLJ1mLBMcfuLll6kkur3hvrpgMLwMcEXE9hIungaX5uwWdhaIiiQ8HwWRq0
	fgq+BGNpQs9ZID4aNZYeujwY2tmk1t+NrZzbaVqx5eC2pgxvhQQl85yav8QDes1zEhV8VF2kgbX
	7e
X-Gm-Gg: AR+sD13jqH+AV6402EvxXbJ/mRl6ktftfB3qBC2DHsscRyG42uCxOeIwv4B4dwzgCU7
	Xjd8QLBpAfWOlgDF60K6B/mGandW3Q2z2JW3GM2874HmnB4/i8lHflotKukJvUy3OFzOR5L1OIf
	qmnHDuNVhWDpBdj0CQ8V1acySUKEUU9869meNr7EcEolmUaE747GKbTR3bEBOUkKvKxSdkbg7uD
	RPnsjx7Nil8b8jDS5vP+xlwqwRIiVaa+fIG+Cf1LxUrBzkciGSHgiH2e3S1gkSGNgCFYPFn8gxB
	Dyqc3bdLaaynv1NSCp/fivgwKzB3rijJn0v2L6kyMHDxUKrCeOJSOm7szkKZ8zyPXzmePxNVPG5
	IcKqv5zbQFSxO3mehKSTK15RAWVgq0hyvvkxkKthSKhjiYeg7OpQanjIlqf4ZH4zAV0EnD38BKR
	M=
X-Received: by 2002:a05:600c:3150:b0:499:900c:9c68 with SMTP id 5b1f17b1804b1-499aa1a471bmr185691095e9.6.1787218992111;
        Thu, 20 Aug 2026 02:43:12 -0700 (PDT)
X-Received: by 2002:a05:600c:3150:b0:499:900c:9c68 with SMTP id 5b1f17b1804b1-499aa1a471bmr185688495e9.6.1787218990527;
        Thu, 20 Aug 2026 02:43:10 -0700 (PDT)
Received: from [192.168.188.103] (ip239-44-231-195.pool-bba.aruba.it. [195.231.44.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b2af1973sm15366435e9.3.2026.08.20.02.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 02:43:09 -0700 (PDT)
Message-ID: <d6770227-a034-48e8-ae36-ff49ef3f83ec@redhat.com>
Date: Thu, 20 Aug 2026 11:42:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] net: xilinx: axienet: Handle optional IRQ return
 value correctly
To: "Pandey, Radhey Shyam" <radheys@amd.com>, phucduc.bui@gmail.com,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260817105241.63345-1-phucduc.bui@gmail.com>
 <20260817105241.63345-2-phucduc.bui@gmail.com>
 <38099370-269b-4d3e-a686-5b29d806e6a3@amd.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <38099370-269b-4d3e-a686-5b29d806e6a3@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kLazLU1XHEse2e2rAhWInVS2VItdbdqoUpyzcd8T6NA_1787218993
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_024319_173293_FF317BF5 
X-CRM114-Status: GOOD (  10.63  )
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

On 8/18/26 8:39 AM, Pandey, Radhey Shyam wrote:
> On 8/17/2026 4:22 PM, phucduc.bui@gmail.com wrote:
>> From: bui duc phuc <phucduc.bui@gmail.com>
>>
>> lp->eth_irq is assigned from platform_get_irq_optional(), which returns
>> a non-zero interrupt number on success or a negative error number on
>> failure. Errors other than -ENXIO are handled before this check,
>> so -ENXIO is the only error value that can reach this point.
>>
>> Check for a negative value instead of treating 0 as an undefined IRQ.
>>
>> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> 
> Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> Thanks!
IMHO even this one is 'net' material deserving a fixes tag.

@bui: please re-submit the whole series targeting the proper tree and
including the needed tags. Be sure to read and understand the relevant
documentation including:

Documentation/process/maintainer-netdev.rst

before submitting the next revision.

/P


