Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C36E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 11:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26RXT7+kDrUKYJZdXzBZ/W6d+4HGXX7y6cw0oURm71o=; b=bh0D7AoJqk4IZGYyIm2M3NNK9V
	zkqMERypzDE7U1pgBf7CTR2bHxPzijMub/tlS+B1UWAe/9V6cr/vk+unnbLe4J+Oz6KjXTp4JjWFZ
	ZZvQsnBvXzvZbB0ojmOCWMhw9ute+m6IJy6yFQPNTCdC15r8Kh8ENUPvGz5Vbr9BnO3/5QHoIdSj8
	nWs2nuw9xLXVJdeU39iLoJJ/EehVtlLJHoei+WGdbRUAz1PNDhq93JikFH/Mkl1rhbyxzTeh2Wpzk
	YOmU67J4SB7codDzXmuoAe9Zup6tFpdH6UZd7gDHRoLQ9NwyOk6/tjQvnTpjL84qmLkTgNySNJJWu
	vRspLd5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ3JW-0000000Bt3S-0ShX;
	Tue, 24 Dec 2024 11:43:02 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ3IJ-0000000BsyT-3swy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 11:41:49 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-436249df846so34679455e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Dec 2024 03:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735040505; x=1735645305; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=26RXT7+kDrUKYJZdXzBZ/W6d+4HGXX7y6cw0oURm71o=;
        b=rN3FZ9WzunArT6tkveQvX8Ox9OiUgeKlfl/5EMmpPVDhjSYgYhQgm7jtSyPSnlxxhB
         86tkRoicazdw9clFzjC6f14yvkMxtgvUhvL4zQhYFvPZYiGPcNGy74dRthi3enKmwp7k
         pBOqOeDLVurW/gepUma0c2bMyMMwyzeQH2j7PTqYTuFLGPNYJZxwzUMoRDGG+fWTjDfu
         vlJnaLGdoU8A61dR1VMPRIxd4F3+wPlk/MescrnnBeN7iAIcTSBJZPwnJIXEYbQ5EwuR
         wsW3bcn1TIdPTt8saYOXkblsbnQwEoaxm5wsoUGti9yvOrBPD+jA7vJQ7WEDgCRb+k8L
         vDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735040505; x=1735645305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=26RXT7+kDrUKYJZdXzBZ/W6d+4HGXX7y6cw0oURm71o=;
        b=eXk27aD8PC/eQh6VUoGu+spfT9XodwVd8tZIfEVlP96Cn6IeCfNVav9wzcUTRaIpgW
         G4DqmLI8nUppQqkMX0+DWC9MxPFWpbURoA3eZD7RbQ+rKekrXpdqezujofylZXdjTTt8
         dgqi1ESZ+aMmaw0PRanjR4Y1Tfq5opCi6/ARKjdtebjqT4XQcZdFfRB6auEzDSJOm0Z2
         97YGAKnk3zpMBJB+z9NtWXyn/IGV1SitSeF6XR+/6h80IzEfykhgFHzUIpaFAbB5nVYH
         oc2fJzRJT+mMHXSGVkUQcTL9Lnw3vq2VTnz9Vy0wT4X/Q2IQCScwaIXDSo35b4nSwn1a
         epxg==
X-Forwarded-Encrypted: i=1; AJvYcCVl023t+SXaWX0ocDcmtqzfFiEAHuECpbZ6/rKdYjH0d+hKXR/5aKifuajMacNLYUALC3yt6LcvqY/fTmJruR+P@lists.infradead.org
X-Gm-Message-State: AOJu0YwjcrPhQAibmGUavV4yuGC8u1CPWbY8z0WVyA6BxTVsCM95cLfo
	yOkawVdneFNC/s4OoyaIW84oLzytsoATIeuVaSOrXzT23E+8vXDMvAghCcOlh7M=
X-Gm-Gg: ASbGncsdHrZVkGuB2G0A67D7NqFrbbMNIjT6IGhlvTWXshBTNoGaXCXYTGUmco4KIba
	mUw+5RtFq99CbSihYNQuejOFNTxy5g28/MIuNc3x2iTcDtFfc1fBpMgITGHuC7XUe4JzNlL+Oda
	X4kUKr3mCdfBQswjxXhXcOjZNlAqB9sue3tswVVHZdCI/xaC5wuaa3RbqQrwUM5Uadf6W5RViaX
	iFBM3TYg51x1HzX4yW8VXBQNSj0Z8oYPPUAHlKkipQwyv0PFmxaNY0Oc8i4i+2Z4g==
X-Google-Smtp-Source: AGHT+IHwyztgKd0z2u3jgbXnkAOo1ZLdfstQSQyPw5AjgaWpasVuihPk3mudTcZsXf30mhvcn9Eo+A==
X-Received: by 2002:adf:8902:0:b0:38a:36a3:fec3 with SMTP id ffacd0b85a97d-38a36a3ff3fmr2368166f8f.0.1735040505005;
        Tue, 24 Dec 2024 03:41:45 -0800 (PST)
Received: from [192.168.68.163] ([145.224.66.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828a8dsm14055725f8f.2.2024.12.24.03.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Dec 2024 03:41:44 -0800 (PST)
Message-ID: <79e11033-181a-418a-a56f-068b9ca62f56@linaro.org>
Date: Tue, 24 Dec 2024 11:41:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] coresight: prevent deactivate active config while
 enable the config
To: Yeoreum Yun <yeoreum.yun@arm.com>, Mike Leach <mike.leach@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, nd@arm.com, suzuki.poulose@arm.com,
 alexander.shishkin@linux.intel.com
References: <20241218084833.609876-1-yeoreum.yun@arm.com>
 <0efe4ef1-30f5-47f8-b818-79b4cfa0891f@linaro.org>
 <Z2qJMGPD8x2npFaX@e129823.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <Z2qJMGPD8x2npFaX@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_034148_838245_70FD24D4 
X-CRM114-Status: GOOD (  16.10  )
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



On 24/12/2024 10:13 am, Yeoreum Yun wrote:
> Hi James.
>>> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
>>> index a70c1454b410..dfa7dcbaf25d 100644
>>> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
>>> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
>>> @@ -953,7 +953,8 @@ int cscfg_config_sysfs_activate(struct cscfg_config_desc *config_desc, bool acti
>>>    			cscfg_mgr->sysfs_active_config = cfg_hash;
>>>    	} else {
>>>    		/* disable if matching current value */
>>> -		if (cscfg_mgr->sysfs_active_config == cfg_hash) {
>>> +		if (cscfg_mgr->sysfs_active_config == cfg_hash &&
>>> +		    !atomic_read(&cscfg_mgr->sys_enable_cnt)) {
>>>    			_cscfg_deactivate_config(cfg_hash);
>>
>> So is sys_enable_cnt a global value? If a fix is needed doesn't it need to
>> be a per-config refcount?
>>
>> Say you have two active configs, sys_enable_cnt is now 2, how do you disable
>> one without it always skipping here when the other config is enabled?
> 
> Sorry to miss this one!.
> Because when one configuration is enabled,
> cscfg_mgr->sysfs_active_config becomes !NULL, so it wouldn't happen
> there is no two activate configurations. so sys_enable_cnt wouldn't be
> 2.
> 
> 
> 

Maybe "sys_enabled" is a better name then. Count implies that it can be 
more than one. And the doc could be updated to say it's only ever 0 or 1.

But what about my other point about enabled always being a subset of 
active? Can we not change "sys_active_cnt" to a more generic "refcount", 
then both activation and enabling steps increment that same refcount, 
because they are both technically users of the config. Then you can 
solve the problem without adding another separate counter. I think 
that's potentially easier to understand.

Although the easiest is just locking every function with the mutex (or a 
spinlock if it also needs to be used from Perf). Obviously all these 
atomics are harder to get right than that, and this isn't performance 
sensitive in any way.




