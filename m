Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CECCD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 09:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGesHuAvDA8fba+DIY6ELAjuney/OORm4DuvscE0E4k=; b=12eXOSuAxealq9QKbjTDvq48za
	n7v0iKXI9g4nMx1lHCMksWR+BoBHZTIw88td21iFSZsJUGVBRLzErNX9IwipNNS90DLrHZvc52x7m
	U69sDTkui9X0quL92XJPpdybDZknt9bK4aO/ReF8nQTnrZufYJBL1cIfTjFD99gVNEjn8ecZ51Qch
	czbr3h5agH3GVspegzz8Sp8O4WkCCG/OuVRIWI0POnWZ81+7s1PgMnqDkgr0Wgdid+EVc3ks0vTYU
	/reIk0uH94BZdfvIyrM1mOXyZISbi3mt82mUTPTyCjUriziD/Op81E8mdt5Eq5yZN8gpFTGsEyG4S
	yjArPPXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5yO-00000001w6z-0EHv;
	Wed, 13 May 2026 09:33:48 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5yM-00000001w5w-1WBi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 09:33:47 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-43d75312379so4943967f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 02:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778664822; x=1779269622; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xGesHuAvDA8fba+DIY6ELAjuney/OORm4DuvscE0E4k=;
        b=p0DxgZTtWxofqLZvCxVmZMp4aMfGKYeqT3hEfk8c/1EZHjV7nZLnHpWSSpJDOVXYOB
         ftreqJnbi2R9FqC8K/G2lG2a6bSn9lC7mWEYjkNA15m+rdLcl0wwOuGn954xvOyIDKAe
         EBjg6AxqjSr6/l9pbAZTI+XhAXRRU4kKLfrxnXHCNevMEeytU27jamJerWU1/z0/4n3t
         794RsqaayeyUk68xJoWPVX4abvGM85Ho6OXnc3JgMQgAOri6uZrMFwh3VqaZRhcNXoEz
         9O/9XXbzr3pdtiOIcz6nvSw+g/lBUt8itqS36ne0gBeBFH6t2HiXrdOQrdyXlkeT12aL
         C86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778664822; x=1779269622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGesHuAvDA8fba+DIY6ELAjuney/OORm4DuvscE0E4k=;
        b=ozfmsmdZ2bCtI2AGRx903jbtFulwPzz23ZIfXS/XCwCVkeys2t8BopNq12ats4Us/q
         k0Q8FnRG/gQnWrnB/XrOW2ZK2Lmd/X8+2Fa0mvi/NMrHLhWWtMLn8bQO3b7RxTOEnLDB
         ob2PGCwdcYlmxDOYo6gf7+geTW+nqI1K0VA3JcvJlmFIZkqUBk3iRZSqN/5dgt/lGK+k
         mVQ5geCEF3U72O2dip/c8GNUIHhqx5hKMh1JPirTDbKK6xa648m+f9Dr07QHKuOWE3IS
         mYqYMZ+BZEah9zssTjakrADYJ8bU+uo0FWuB2tnYBqmuktRKEqyJjLjy2AQ+aanXmxib
         DHTQ==
X-Forwarded-Encrypted: i=1; AFNElJ932jF58ldkRhIamcoyJTIjYATxUr2hHtTIzYAR+XDt5/IpSsowOPUx4gnMNzJto7OonMC6jMGFQG0aB7d6AAhy@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz6BFZFQZjm7Wt7dRFd3xgqV1eSRfZjHOkUJK8ynXUbZvI3v4e
	Y1kA7sMiawvYu/kiP4pPYI1v/ohSI7jt5PQ/pfeji9Q2TAuNPJhd9bffIqDCG1Xs3WE=
X-Gm-Gg: Acq92OGLoRDKaqTiR7icMNoTiaW6zoi1l67mntAzIcnm9pZd3O24rptrvmXcNq8KXup
	LonhaurvRQhnQr6k5GmpdXziQexUde1zHUXfPIIv5+iokh9J1Z4gGhfcZnC2Oyf/qc1Q6tCiQLq
	YR5IvY3eYguf7aIWVISuy0HwcRNB0VvFyX/UzzqHjVrCo/nu7Btq5lH2Dc5cxEol4trelDGotK5
	h2mpqMDi1h/RnvpQHcRDAhbvuE1JDegrAgTuvToHzaLwWtRqpFq3DAVfpJlh9V+VXjOUDyOb9MK
	GwGgvnhMxcdBkAFMuedYWDxn1qKe4kQDk1vtOGszYC7F15XVwoc1EsVABrf9PY09FabZznuLx6B
	XZwf8Y4brGtKBpLQf8l8ftY5chUFcoXCWZnFx55FsMBrExfMoUCsbq2ms8zzZ/0yXHIlM7QHHbj
	OTBcn6Vvce+N1bsWe7ddc3+csrD8+O
X-Received: by 2002:a05:600c:1990:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-48fc9966d5cmr32956555e9.14.1778664822176;
        Wed, 13 May 2026 02:33:42 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f40e340sm57201465e9.6.2026.05.13.02.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 02:33:41 -0700 (PDT)
Message-ID: <cfb27efd-4887-4d47-8b38-99fc2d7bcfac@linaro.org>
Date: Wed, 13 May 2026 10:33:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: trbe: Hide enable_sink sysfs file
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260507-james-cs-hide-trbe-enable-v1-1-b4e40439f44c@linaro.org>
 <20260513081551.GC34802@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260513081551.GC34802@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_023346_417604_87BFD829 
X-CRM114-Status: GOOD (  13.26  )
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



On 13/05/2026 9:15 am, Leo Yan wrote:
> On Thu, May 07, 2026 at 11:53:45AM +0100, James Clark wrote:
> 
> [...]
> 
>> +static umode_t coresight_attr_is_visible(struct kobject *kobj,
>> +					 struct attribute *attr, int n)
>>   {
>>   	struct device *dev = kobj_to_dev(kobj);
>> +	struct coresight_device *csdev = to_coresight_device(dev);
>>   
>>   	if (attr == &dev_attr_label.attr) {
>>   		if (fwnode_property_present(dev_fwnode(dev), "label"))
>>   			return attr->mode;
>>   		else
>>   			return 0;
>> +	} else if (attr == &dev_attr_enable_sink.attr ||
>> +		   attr == &dev_attr_enable_source.attr) {
>> +		if (csdev->no_sysfs_mode)
>> +			return 0;
>> +		else
>> +			return attr->mode;
> 
> I'd prefer no_sysfs_mode to work as a general flag rather than being
> limited to sink/source devices only. Otherwise, LGTM.
> 
> Thanks,
> Leo

Which other files would you hide though? These are the only two that I 
could think of.

I wouldn't hide all sysfs files for 'no_sysfs_mode' as there are read 
only things that aren't strictly related to sysfs mode.


