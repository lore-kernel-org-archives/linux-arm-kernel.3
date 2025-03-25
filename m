Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24B8C36005
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 12:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TuK45YEur4aLi12yY4E91d6DOq3lKYtTL3iTuyXH1Ic=; b=DsR22nZedLvqQBA3QCU1K1yzGb
	2u7xHqJKyK64GzzT1X3KRK+cdhK91jefrH5BBbusbfZR2M8mnrDo8sDur47cy9TOdoz8pnnBagpPm
	zy9iApqMa/N4lf26SHwWGooBk6Tv0k6rd4gCzTSGhWcjgyW0KhKJqUDtvsZu7gd4zcK+EixHHhWlu
	aNJ0l7YgdAcqR9aPIFutqMNycykD2F24shyYDofNw80Y8nw92xMv2r2womftI+c+uxRBA0VhydUif
	4DmqFi1GdRN9H4mHPmGC92hcR1K7TN489FcQxNQqD7u8PMmWlHHLH7ftvRFbCYhLdDxe+N8qKxEXn
	Id7XgMSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3J2-00000005ndx-3qJQ;
	Tue, 25 Mar 2025 12:22:56 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2wt-00000005ie4-2B0o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 12:00:04 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3997205e43eso4600585f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 05:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742904002; x=1743508802; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TuK45YEur4aLi12yY4E91d6DOq3lKYtTL3iTuyXH1Ic=;
        b=orHBoJYkFgHOyBcrDPzJ9BAif1FH/8Fbl7DIkCVKG26Gj+ww8GSX0Gy29h3JXSAdzp
         KJsfpSj+z8QuAMuP+SmsSrMacTH/hMAf3wtWZTIR5I5i94M+AtP4RPn6qGW/Qh1SjZeq
         80q/SQe5rnkmRlZvI3znFFnp6qg+3BPuyJh0Gzbgp4yt33XzmreEOSWaWRJWWE2MMrTw
         aISpGpFYNWQtEK9EvczbpSuKh1ndtsSrcJjF9UEn4r3GD2DgIUdTxS3iNU+N/XOqVxHQ
         pyijoY8olqrvo8WDGMq8XcNEd97MlkE7BK5UdeJpFWJDtEmqyqeICrwSDKTh9GLIT7Ml
         rzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742904002; x=1743508802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TuK45YEur4aLi12yY4E91d6DOq3lKYtTL3iTuyXH1Ic=;
        b=A9rtO7kT/7lESD9VuzUuuaWce2AGjsRGtaEQ505pGE2nnPeubhuKx/OL90BdR4ioiw
         E+2VL/bX04CLaGDJD30Gi4ub89OW1tG5c9TbV8ORj2ox2ylm1rPDYsW3raYorVXQyKgY
         iFugCV9Qs8pj+1HlGrLZ6H3wwzWGNng+qfc7a8yhc3MudO2vQlCfx0/FBdJeGhE01vre
         9fHOiRZSv8GuU4YqdWoeYFpC2AoQxDauF+Y7wmawS2aTqGI+QF4cWehEhm1yFMdYjMTU
         kaStjUKI41Q5CyXU6M2f0RDAVW+XdEo82QLyijtkb4ddgjdd/Ue3EsQu1j7GIeoSiRix
         uBAg==
X-Forwarded-Encrypted: i=1; AJvYcCXUeyAbjZ/lNYxl1n/qXXVja222EqaDPR4Tvmur6JR3bVOW4S3E13b3s69BSR+5Ur8aiGlt5TElpg3gEWktKDn6@lists.infradead.org
X-Gm-Message-State: AOJu0YwCgTPrQ2bny1xcXMTrABKC3xSe1+5Ufi/FtUDnNY2rRWmLAFKn
	+xFkMNeFwrM2gAgBLq7iogueIsn8YgsIrOyiYCcu21yb4WJ5rNXBi9t7jwtLRcM=
X-Gm-Gg: ASbGncvuwWQzdyWKtKIuCaOJLZcXX0HSr8vh5KRVL84+7gGaSZfR+fy8FUfeUMtjRGm
	Lh6M8dFt41gksb0fTk+LTyzqIlmHCEn1SUAdnlyO7rX5ntY6qeKhGrUo3kcWa3y1jJTukF2a3nE
	Q3Huk2L8XiBukk87n+SGXkNl7i3wBxg8QNSAxlFSlwQ6DuLkOsZTIE0iqM1IGCvmtJ8iH0BDwfF
	TA0R50UZ1I4Ymwnk7T12Ezw0Gpl/mHICpLVUl4ulLXHLch6qu3GAHOalNipGD6H41kZz+r/fCml
	O8sJZWdSP6e6wh/FIHfeyju21jqylpGCPuvGX9t4XCeKN33qTu90sg==
X-Google-Smtp-Source: AGHT+IETxWtVPyIY7fJYRcwqnqDBdA3ddGHgl67zvBSSoa79y7HsEg5c/va5aTKA+O2h9SpvZDcVOQ==
X-Received: by 2002:a5d:64e7:0:b0:391:3f4f:a172 with SMTP id ffacd0b85a97d-3997f940e3fmr12824268f8f.49.1742904001825;
        Tue, 25 Mar 2025 05:00:01 -0700 (PDT)
Received: from [192.168.1.247] ([145.224.90.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43fdac92sm199600525e9.26.2025.03.25.05.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 05:00:01 -0700 (PDT)
Message-ID: <47e8486c-7d7a-46cf-a4e1-9420a3be4357@linaro.org>
Date: Tue, 25 Mar 2025 12:00:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] coresight: Convert tag clear function to take a
 struct cs_access
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, leo.yan@arm.com
References: <20250320-james-coresight-claim-tags-v3-0-d3145c153820@linaro.org>
 <20250320-james-coresight-claim-tags-v3-1-d3145c153820@linaro.org>
 <3bbf8aee-7b84-405a-8a3f-648c74196c2c@arm.com>
 <2d3fb704-172c-4632-9e95-02bbfb8c0f90@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <2d3fb704-172c-4632-9e95-02bbfb8c0f90@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_050003_562897_DBABD153 
X-CRM114-Status: GOOD (  14.38  )
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



On 21/03/2025 12:42 pm, Suzuki K Poulose wrote:
> On 21/03/2025 11:02, Suzuki K Poulose wrote:
>> On 20/03/2025 14:34, James Clark wrote:
>>> The self hosted claim tag will be reset on device probe in a later
>>> commit. We'll want to do this before coresight_register() is called so
>>> won't have a coresight_device and have to use cs_access instead.
>>>
>>> Also make them public and create locked and unlocked versions for
>>> later use.
>>>
>>> These look functions look like they set the whole tags register as one
>>> value, but they only set and clear the self hosted bit using a SET/CLR
>>> bits mechanism so also rename the functions to reflect this better.
>>>
>>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>> ---
>>>   drivers/hwtracing/coresight/coresight-core.c | 27 +++++++++++++++++ 
>>> + +--------
>>>   include/linux/coresight.h                    |  3 ++-
>>>   2 files changed, 21 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>>> hwtracing/coresight/coresight-core.c
>>> index fb43ef6a3b1f..8471aefeac76 100644
>>> --- a/drivers/hwtracing/coresight/coresight-core.c
>>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>>> @@ -144,19 +144,30 @@ static inline bool 
>>> coresight_is_claimed_any(struct coresight_device *csdev)
>>>       return coresight_read_claim_tags(csdev) != 0;
>>>   }
>>> -static inline void coresight_set_claim_tags(struct coresight_device 
>>> *csdev)
>>> +static inline void coresight_set_self_claim_tag(struct 
>>> coresight_device *csdev)
>>
>> nit: For consistency, this should be renamed to _unlocked ?
>>
> 
> minor nit on the subject;
> 
> s/cs_access/csdev_access/
> 
> Suzuki
> 
> 
>>
> 
> Rest looks fine to me

Fixed those two in v4, thanks.


