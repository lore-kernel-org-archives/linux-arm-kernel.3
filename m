Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61873CF34C3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyic0whl3s/66BOGI/o5R356Dz7ZHOlIPUtAkuTp3tE=; b=JHZtbfvygQyMaqMNxTeMa6LQBq
	5Lxn5hWTs7LWnSembmeFncegLIDiYbYGCDdREnyVnRxAW4no4YiFOf3J2tJOrSouIdjEargj7J3pX
	VFKIxp+fXgdcvu9qIMVXen5I6BZLp82sETIPuEndOetaJ3PzVAMeKoMZOILa6z3Kx9xGop4EgzrB5
	0pEFy+6X5gQPNa6zCwsSmZ519xSMwX8on/UFeRIGvj4WpweJRrjyjE2PARJvPQ7iDGcY9Stw88GL7
	EfuU67sYS0hTboJtZm73YkOaFChSv+uTDslPPn4SgjHUuYs08QC9FaBdOH5lYFA10K0+oa/hG6zv2
	0N4hlZag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjyS-00000003Tqe-467y;
	Wed, 19 Nov 2025 15:20:00 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjyR-00000003Tpy-1M5q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:20:00 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-42b2a0c18caso3686021f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763565597; x=1764170397; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vyic0whl3s/66BOGI/o5R356Dz7ZHOlIPUtAkuTp3tE=;
        b=JhcZMi9VBtKuJ8Z/obU23VUQ9OVBudm8xTQ95gxNnB4EJJCCDrzkQ2bTMX7rPE3sw2
         5MXR+KefC7kVJmIt1PkAe/m2rF0nBqwKXbmo6JirK6eYs0apjfbIjvuivYJtoA5EGykI
         7ABz7rPcq0cmtKdo3l4HhRXyTLcPnrXfrAm1b525SwiQrFTiv6M5AYmIyKuwLKdU7XwU
         O+tDx68fgIujH2NvcVKLm5LAuDRzSB3DmIXxwBhGuObXEmwEPaUK0dGBaKQffmG1WgGE
         E6Nz1sPcbp0ADcuAhVfjKOaAzRsRer/dFoiNi9Q9E0zrdsA1NyldTwG38WVGDsYkpOj+
         RSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763565597; x=1764170397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vyic0whl3s/66BOGI/o5R356Dz7ZHOlIPUtAkuTp3tE=;
        b=Nh5k2Xi3ous3hdLIw/ckBB7Q5Bpnoz5dBIeTfbrtUnyfVLWH1EBU4gWoWr+xrzWaBv
         W/9E9FqbIJUh/SqiSwbO19BSAla2w5zHgu1cgeVFb1uOhtF3DFxerX9uiQEqoOJtNwXp
         VAQyemUYC7aMEDit8gTo9qie67iZTpOJR+uxoWSad4aTf6iLip1VGlttSwGCRhg1Rqtv
         yizywa9CsJyvvkx6Jb+H1LGwX4bTRKHCfwdAa2/RzClQHGX7/XbuX4FdwQLy5BhTQAWX
         Ykjp3/dY5mFZI+mcCNwkhTGQHjlqMiqzR4NT9eQwrZeAlXjXTbmfSSa8WFPVBAZkMnZq
         5Rpw==
X-Forwarded-Encrypted: i=1; AJvYcCU3wEWKByZHdK8Ol/+7eQODsIV3LvBa9vR9fjtBgUwas4u+XNSGjGHcKzc94JUDmEwMM+hWE1yZ0nTCm2neAucC@lists.infradead.org
X-Gm-Message-State: AOJu0YxtE1pYchCj+4FezXA1G/iTrZxOLeu3ZBtwfWb8rUvxAn9QdNjg
	4Laad+yaU4POKE4CuGt5hrcxdkZJDG00niYyJFppNFVJpbYkwqv24jHoF3OqWJ0ahNw=
X-Gm-Gg: ASbGnct9ToajPUdal/eVpsxgpeWbBGpWoGGFbqHv1Q5X8orj6t67XFRomT6YrOjL4Rx
	Mg1eZoMFqIJ2x40JoQOgSL5ohOtVo2Io/YolWJoSdiaQNjeVAMyDxFfps1a8q8YFGlsL5OULz0j
	NqnLXpO/nnQ+SfPH1n+zvwJcQU1W9IF+sb1mSqPeSuyF/TKsEnwISKe2ypHDJZ0c/nkbaqcpRjG
	jn39oi3xEsRby9zrmEy9a2oaHo7TFpWW31Ab3HgP9PV3E342snIA1oy5e3US96DCzOO4atlsxs5
	8c1JAiidXQptvh6Gw8ZIqPQ0oKZMWD2N1cPSvFoaJvUsopyW2/HcETrzDTElgxrBWbSQkSsEo7f
	9tgywXNngFAX6y30JJzA1DsnpG/1Mpy0s4ZBR4mS6fl6FIX3ObHpvzq0/Mp+Hmvv4kiC/aTP3A7
	gS/4smQVBhOExtODw0S/480yiWUWw=
X-Google-Smtp-Source: AGHT+IHhum7ci1FG32u2L11uYc3xrbLPRx/1PwbQogH3nhs3kuJ41GL17yFl3Y1Yn/zqa/7qzDJaIA==
X-Received: by 2002:a05:6000:1a87:b0:429:d66b:508f with SMTP id ffacd0b85a97d-42b595a498bmr19217954f8f.30.1763565597155;
        Wed, 19 Nov 2025 07:19:57 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42c9628ebacsm25830649f8f.30.2025.11.19.07.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 07:19:56 -0800 (PST)
Message-ID: <3ab75fd3-b739-4348-9a89-e67224e23488@linaro.org>
Date: Wed, 19 Nov 2025 15:19:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/15] coresight: Move CPU hotplug callbacks to core
 layer
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
 <20251104-arm_coresight_path_power_management_improvement-v4-15-3d4bba674709@arm.com>
 <f01585fc-919d-4059-81e2-7131dd54553a@linaro.org>
 <20251119144813.GE8204@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251119144813.GE8204@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_071959_391830_82F0549B 
X-CRM114-Status: GOOD (  23.90  )
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



On 19/11/2025 2:48 pm, Leo Yan wrote:
> On Mon, Nov 10, 2025 at 12:20:06PM +0000, James Clark wrote:
> 
> [...]
> 
>>> +static int coresight_dying_cpu(unsigned int cpu)
>>> +{
>>> +	struct coresight_device *source = per_cpu(csdev_source, cpu);
>>> +	struct coresight_path *path;
>>> +
>>> +	if (!source || !source->path)
>>> +		return 0;
>>> +
>>> +	/*
>>> +	 * The perf event layer will disable PMU events in the CPU hotplug.
>>> +	 * CoreSight driver should never handle the CS_MODE_PERF case.
>>> +	 */
>>> +	if (coresight_get_mode(source) != CS_MODE_SYSFS)
>>> +		return 0;
>>> +
>>> +	/*
>>> +	 * Save 'source->path' here, as it will be cleared in
>>> +	 * coresight_disable_source().
>>> +	 */
>>> +	path = source->path;
>>> +
>>> +	coresight_disable_source(source, NULL);
>>> +	coresight_disable_path(path);
>>> +	return 0;
>>
>> If the user is expected to re-enable and this new state is visible, don't
>> you need to use the regular coresight_disable_sysfs() function? It calls
>> coresight_disable_source_sysfs() which updates a refcount.
> 
> Good point!  We only need to maintain refcnt for system tracers (e.g.,
> STM).  The per-CPU tracer is only binary states (on or off), we can
> simply use "mode" to track state and no need refcnt.
> 
> I will use a separate patch to refactor refcnt.
> 

If you remove the refcount then wouldn't it break scripts that make 
multiple enable calls? I thought the same logic for the system sources 
applies to CPU sources.

TBH I don't really know what problem the refcount and multiple balanced 
enable/disable calls solves. But even if we decide it's not needed, it's 
too late to change now.

>> Maybe you didn't do it because it has a mutex in it? It would be easier to
>> change that to a spinlock or take the mutex in a wrapper function and share
>> the core disabling code with the hotplug path.
> 
> We have used cpus_read_lock() to avoid race between sysfs knobs and CPU
> hotplug callbacks, we should not acquire mutex or spinlock in this
> case.  For this reason, I would keep to call low level functions.
> 
> Thanks,
> Leo


