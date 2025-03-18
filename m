Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC49FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 09:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7TGD/sTJc0OtjwahroX9tclP8lTIbogOcbW0Jwqg2g=; b=sx6M5edRI16dKmvG2bMa/75lqn
	YqV3WCMHTc3IPNiZYZ604ZEY5DsOtQIXOcuU1Fy2jLaTsvKAvffl70Dwio3WgZg0NI8R/8iwK7XAJ
	/R4KreI4UlZiXaHrblYTzn6cCLKl+pNjp41rdg4GsH/KEzA47LAQrBYt6m6mQ56W685kpZjR6Y8q8
	wKwx/K2hnsUorVX1jO+GkZe53MfDOWBszwEFRtxzPtLbmJcM9zXQlpJ6zFdcszqfjlAE/xntgrlv0
	SBdVPVyJsLlf4kyCQuaDX4bEQiC3eZVYtWGBXCYfjA++IkidPGkA/lk80sB78/3cw9DJqOAQ7OmSH
	M2I/iGJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuTG1-00000005KLU-1u5A;
	Tue, 18 Mar 2025 09:29:09 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuTEA-00000005JYY-1Ci1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 09:27:15 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3913d129c1aso4279451f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 02:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742290032; x=1742894832; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C7TGD/sTJc0OtjwahroX9tclP8lTIbogOcbW0Jwqg2g=;
        b=JsVJxsuiZ7QRKpT1YnqHChe0Iosujy1xghTHeJkzcszvSx4PmHenBhl85ljlOdvKH2
         iN4QxWnnBauuMUrsBL+c6FT4TEO9mLa9NI/1OBEu7JDYFTolV/ZuwobMQwhdRpkLl52r
         tmW/1Mfvj3ntpAHPxVnFMAgSND6p+YYVWfDSqL5/n2+d3dPaZ9e8W316Ux5VrKK5xRhp
         6rNbm6YbHdcfNXBvPX0BUiFi6iVeERol0Fm4CM0ZCByU/3tjYH7nZ83W7Sh498DxmTPU
         S3FeluPAJkXsdl34pIVDExr53A/MRjMqHBPj4kj1yG0xTNQmGanrfsmH91vmuWlmir2s
         jzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742290032; x=1742894832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C7TGD/sTJc0OtjwahroX9tclP8lTIbogOcbW0Jwqg2g=;
        b=WzWntGecoYOCN+8GFZzCaqZrRmG+FUfgFk67dNBv0FOT7BOO83fkvrkmwkdw9O9gio
         yifbMuYuWaG5L5m33GJcQlheIvG4cKWfk/mMTAyweADRF4RAlWFByy8vzYOAxifXi51L
         JdW6F1K9cPMOPfCrpHCeiD1nI+TVPvMxbJTjCZKECmwdjF7lwpcaivA9ew7cdCGHA34s
         qQ40R6dCSB0kAQOZztHbY9yGel3lrBdkWO8rQHLL6ngIbIKDm584E9+rL7dF2yUEsPu9
         zvd+0p3oIt31YNDUCGhAcsYGK6C2vNYDN5BbrdzBw6jtwUflfH86BmNmzuMBz07S4dqO
         Bjew==
X-Forwarded-Encrypted: i=1; AJvYcCUZXl+LjR4nZ7k2tLyF4abB2PJIvMGxTHToqz9wU6zEC4Uk8mOfZxzGKMXDG3jfWfUutWq5mITejc+4YMG9x3/0@lists.infradead.org
X-Gm-Message-State: AOJu0YyE603Fwm1CahZu6cnKyHA18S3BLmDo4v9a81FT/xzPFG9SlRW7
	00GMttMAwf/szGN0aEQdyDtl0rcqDWAgAxc0ds+S3A63OALpiSk/Mkr9xT2jdMa6vxKRqoJPpSK
	h
X-Gm-Gg: ASbGncvwqqzR7Mv3boQxAnT6ZtjNtSLQ2XzKI3Jb/vPX95Y/6ADX2Cna7DzPxwfiRd3
	j7VmYCyyVLKIAwCD9S1BG3buda2oaW3NJfFHTWaUw8X7c1/T2iI1O46hUNhXc6JWvlGW7ulX5ly
	ds+Feu6qRDvEXYCo1muTydNRjzLGlaAR5z+LUCV/qz0lxLgGzis/3mc77S8W3LZEiXu3kXffhUJ
	4O4CHHaiU7ly6dqu/Y8RSiJU/0g+7z1JoAluzscuGmLdcRxKhXb6tLilbswkGqK2HY3qzDEEFGD
	IpezPk/bsvr7zkslD53Sad9ctJFCLspTKy7FP+T0hEEcd3rAkq8/VQ==
X-Google-Smtp-Source: AGHT+IH73QS1D5UWCRs0ctMHCS8bma4/x/bL3ofL41GBF2GkxNIuYWlfCICxcIlvecm4Hmc0Weksew==
X-Received: by 2002:a5d:64c3:0:b0:38d:ba8e:7327 with SMTP id ffacd0b85a97d-3996b935107mr1858488f8f.8.1742290032371;
        Tue, 18 Mar 2025 02:27:12 -0700 (PDT)
Received: from [192.168.1.247] ([145.224.67.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318a3dsm17661397f8f.74.2025.03.18.02.27.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 02:27:11 -0700 (PDT)
Message-ID: <b6c2622a-5c54-4951-be23-7f05599fc10d@linaro.org>
Date: Tue, 18 Mar 2025 09:27:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] coresight: Convert disclaim functions to take a
 struct cs_access
To: Leo Yan <leo.yan@arm.com>
Cc: lcherian@marvell.com, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250211103945.967495-1-james.clark@linaro.org>
 <20250211103945.967495-3-james.clark@linaro.org>
 <20250313145456.GR9682@e132581.arm.com>
 <c6a86373-64be-4101-a08a-74aa302bf64c@linaro.org>
 <20250317182957.GL2487211@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250317182957.GL2487211@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_022714_342793_5ED15373 
X-CRM114-Status: GOOD (  22.26  )
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



On 17/03/2025 6:29 pm, Leo Yan wrote:
> On Mon, Mar 17, 2025 at 11:36:40AM +0000, James Clark wrote:
>>
>>
>> On 13/03/2025 2:54 pm, Leo Yan wrote:
>>> On Tue, Feb 11, 2025 at 10:39:38AM +0000, James Clark wrote:
>>>
>>> [...]
>>>
>>>>    static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
>>>>    {
>>>> -       return coresight_read_claim_tags(csdev) != 0;
>>>> +       return coresight_read_claim_tags(&csdev->access) != 0;
>>>>    }
>>>
>>> Likewise other claim functions, can coresight_is_claimed_any() change its
>>> argument type from struct coresight_device to struct csdev_access?
>>
>> I only wanted to change the ones that I had to. I think we should prioritize
>> passing csdev as much as possible in the coresight framework to make
>> everything consistent. Otherwise it's extra churn for no benefit, and if we
>> need something from csdev here in the future we'll have to change this one
>> back again.
> 
> The function coresight_is_claimed_any() has been deleted in a later
> patch.  So this is fine for me.
> 
> In theory, claim tags are low level operations and don't need a
> CoreSight device context, I prefer we can keep them as simple as
> possible.
> 
> With this series, we can see coresight_claim_device() and
> coresight_disclaim_device() are inconsistent for their parameters:
> one is using "struct coresight_device *" and another is
> "struct csdev_access *".  Maybe we just proceed to use csdev_access
> for all claim tag functions?
> 

That's because coresight_claim_device() has logging which requires the 
device name to make it useful. If anything, coresight_disclaim_device() 
should actually take a csdev and then print a better log message. I 
don't think there's a way to make it consistent when there are different 
requirements for each level of operations. The ones with logging need a 
csdev and the lower level ones used on probe need to work with only csa.

> If later we need to use a CoreSight device context when operating
> claim tags, it means we might have different scenarios and we can
> handle that separately.
> 
> Thanks,
> Leo



