Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860EBC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ks1EJyaV3dJWopJIxPGTdysgQbtxzRdmygE8oecODfI=; b=Jn3gywQhXMVWJ1K5BMiMOlCbld
	5bCdc9EYZNWwJiFel3ZKRLZXDUOMkF6uoF7DnvcHHSqRxw9liXGkJC7KqmtWI+XnqvugYnAQjYkcj
	E1kOfg1l2W5Jh+P+/F940x7wqvcSRtCNqomaCjLIVD7Y1P0qER0H9rPaElF9j5cuv/gRWi9RyEaZk
	HPMPLzmoZ9Khg3olqVgWrOW3EYwmnWU6oNMLeSdF6N6jzjb1aL0V1tZT2K45Qwk2H/dLx2pS22Z7x
	cA/COc1eH+Al8UA8qmhie26Slbjep24FdAbrw3H/hT49JiLb71WOZ67GPEddKgZQy/hTCRKGB2QrO
	yeLQWalw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0Sx-00000006Cyj-17sM;
	Thu, 06 Feb 2025 11:54:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzZa-000000062Cu-1TVT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738839449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ks1EJyaV3dJWopJIxPGTdysgQbtxzRdmygE8oecODfI=;
	b=Ikm7+dAxneZRtIfnyXXwxGJuOfGnf0ZVEQwQq4QH3ArFiNxcrAph9E8kXrGFxu3+Kae937
	yXhtgiAp9shhVHGMrxwMXb/qAtthfdbdhq2FzbEhBrt8M5B0GEN6lEg1AUjl+JGeNtkP1q
	BAAYjhUN3G5zicbnk4GPly/SkR4GymI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-PPgYSWhKONC1cOzho7qHxQ-1; Thu, 06 Feb 2025 05:57:27 -0500
X-MC-Unique: PPgYSWhKONC1cOzho7qHxQ-1
X-Mimecast-MFC-AGG-ID: PPgYSWhKONC1cOzho7qHxQ
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-436723bf7ffso6069185e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:57:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738839446; x=1739444246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ks1EJyaV3dJWopJIxPGTdysgQbtxzRdmygE8oecODfI=;
        b=t13wyljOIBAC+OnU5vhjEh+mrA/B55AY1Bn1tnUrq1k+JKr4mETV1YReVV9usaFqKl
         rYjv7OrxRuOPoIsf8sp2M0tXHhEMx7+VGXy/mRLjg8vxt6VtZfFMwpviyQM9rGFinUIT
         4aWB37EyqZfUN1qnzojj+aNt78Fgor+aJFE/a/OUMCTHPyJFS9ECvYpYWFfOiqBid698
         wrrc+01ioX5V/OgYqhOUI7nVgxF85MgOQRmU7Y9xwvm0PYXkK5V2+OrfHvxzar/1RvMy
         Wov+1mdM6vKJC9X3JiLZHmxBaj/l3pAEHOEfuHGDHtP6v/my6ox3yLuRVkajAqKIRqJJ
         qn0g==
X-Forwarded-Encrypted: i=1; AJvYcCXvxqCDB9HLfLY24IniJ+IZi2MJ7GYSTDEpWVazJm47AGJxbMTstvQR5TPXGvAylGADPfqpTkef6d39KBcK0J0B@lists.infradead.org
X-Gm-Message-State: AOJu0YwTH5lIluziboSABUnwM/rMjg8BwvePug/qRe+4HC/BRtVR+zVW
	BdV2d31VjAp+zuWgwYfj2YACjR6bOzl29FBDROFrbo48Vz/woip5gi3IY0AIUr8hitFkECRpnbd
	3w1u0VwGjqqt1AF0yXHF/AMC1fKV9w4jtRmWyTzyFg6sHFP4Yg0nfJltc6oLLWwl6xp6uDxua
X-Gm-Gg: ASbGncu4p+PT44mQ3GW+HnnW0OKCqR4Y6NdwlxbMz1V4JqgbQEmYtkyrbZuCItsQfkR
	72Dk7tznIU5TLd05pl/Vl7t5bVuZFzcZ7O7vCY0N3LjVt2MjB0OqFu/rGisgMIZ4im2xUPwspQ3
	+uloyaipBFnZ0veRMOB0aU6oFqhs/TzbzkpmTkkfp/8w3EczCX+eSfHIHMFqiPprt3eceW95EvS
	3OYrOnBB2kKiUtyHTW9k+v1+1aqrnlUKMQZ4/CizjwTjm/cWkP7jDTMkFzGFW0qav7uZTHnVDqo
	impRp0NJJn9/fSDANHUDPEIATiYdhxOwdZc=
X-Received: by 2002:a05:6000:401e:b0:38d:be61:2592 with SMTP id ffacd0b85a97d-38dbe61266bmr1223902f8f.42.1738839446084;
        Thu, 06 Feb 2025 02:57:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLyD8qKeYPHkk51RV7daxUs9XqUUKgX6jSRdYNwnc255CmiNF1pLJ6S6c+04Q/17xlRqYqpA==
X-Received: by 2002:a05:6000:401e:b0:38d:be61:2592 with SMTP id ffacd0b85a97d-38dbe61266bmr1223877f8f.42.1738839445638;
        Thu, 06 Feb 2025 02:57:25 -0800 (PST)
Received: from [192.168.88.253] (146-241-41-201.dyn.eolo.it. [146.241.41.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde31d9bsm1414982f8f.94.2025.02.06.02.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 02:57:25 -0800 (PST)
Message-ID: <8f891a0b-249c-4c4c-ac76-da9ac41ca857@redhat.com>
Date: Thu, 6 Feb 2025 11:57:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] Revert "net: stmmac: Specify hardware capability
 value when FIFO size isn't specified"
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <E1tfeyR-003YGJ-Gb@rmk-PC.armlinux.org.uk>
 <2cff81d8-9bda-4aa0-80b6-2ef92cd960a6@redhat.com>
 <Z6STSb0ZSKN1e1rX@shell.armlinux.org.uk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <Z6STSb0ZSKN1e1rX@shell.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _Fk742RQNDapVXUD5mi15DG8Sc33129eYDyN6KN93LY_1738839446
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_025730_475329_7CFA5B62 
X-CRM114-Status: GOOD (  15.19  )
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

On 2/6/25 11:47 AM, Russell King (Oracle) wrote:
> On Thu, Feb 06, 2025 at 09:08:10AM +0100, Paolo Abeni wrote:
>> On 2/5/25 1:57 PM, Russell King (Oracle) wrote:
>>> This reverts commit 8865d22656b4, which caused breakage for platforms
>>> which are not using xgmac2 or gmac4. Only these two cores have the
>>> capability of providing the FIFO sizes from hardware capability fields
>>> (which are provided in priv->dma_cap.[tr]x_fifo_size.)
>>>
>>> All other cores can not, which results in these two fields containing
>>> zero. We also have platforms that do not provide a value in
>>> priv->plat->[tr]x_fifo_size, resulting in these also being zero.
>>>
>>> This causes the new tests introduced by the reverted commit to fail,
>>> and produce e.g.:
>>>
>>> 	stmmaceth f0804000.eth: Can't specify Rx FIFO size
>>>
>>> An example of such a platform which fails is QEMU's npcm750-evb.
>>> This uses dwmac1000 which, as noted above, does not have the capability
>>> to provide the FIFO sizes from hardware.
>>>
>>> Therefore, revert the commit to maintain compatibility with the way
>>> the driver used to work.
>>>
>>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>>> Link: https://lore.kernel.org/r/4e98f967-f636-46fb-9eca-d383b9495b86@roeck-us.net
>>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>>
>> Given the fallout caused by the blamed commit, the imminent net PR, and
>> the substantial agreement about the patch already shared by many persons
>> on the ML, unless someone raises very serious concerns very soon, I'm
>> going to apply this patch (a little) earlier than the 24h grace period,
>> to fit the mentioned PR.
> 
> Thanks. Here's the missing Fixes tag that I missed:
> 
> Fixes: 8865d22656b4 ("net: stmmac: Specify hardware capability value when
> FIFO size isn't specified")
> 
> Not sure if patchwork will pick that up.

Thank you indeed for the missing piece. I'll add that when applying the
patch (~now).

/P


