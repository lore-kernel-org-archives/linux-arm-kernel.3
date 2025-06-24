Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD035C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 12:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43+uI18zfaln0A/qyEjVIwHNhYdMj3BGrAgTLFXWWxM=; b=xRfIUah8wsl7tdZ37uVSjivpQg
	aqomhyOnRwSwZUsy6iMVApZi1XjS0NTmFnb3bctvBDiHdWG2WpOwXhWm8KrHrXPC03TLC5G3gqGYx
	10dr8vs12Qp7ooCxmUxFI3GNV6L7mnI4DnYze0TnzSbs5+eWrJEQrfTVuliF4Uvx6T7KHqXZkMUhB
	FK0Rk0AwnYDgbw7Upomp2AR23P39Kdgs4wutbWEzTZtz0DQMohYEEGkP4TN2Fp7f0Ec1NqZhm5+iq
	kQ3a8Iy/EZ8IzUCmIDStNjnqT4HsQGM7jNLyOWtj/38wY/R47rw2QYE83bq/4grh7XRq56Rap/lYj
	Jfq9a9eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3BX-00000005eZN-3UEq;
	Tue, 24 Jun 2025 12:55:35 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU38E-00000005dor-3sjE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 12:52:12 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4530921461aso3503235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 05:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750769529; x=1751374329; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=43+uI18zfaln0A/qyEjVIwHNhYdMj3BGrAgTLFXWWxM=;
        b=HufBDJQ++Wtgj64rdqH+qTrLrT1mwiqjocibEiSPbR5/5SUI+vGQv9DkCH5LdHSf0c
         zDMwrZUrBcgf0Hj5KI60IAB3qT9C/c98c1onzLJTTMJ/O2D9B70bioPBbC6j6Bisl19H
         QAcHTBLLVz6bGe4opgVpnwDHmOJgoVbj0xsl+2BfoMnuc7nRtsanD3Q1mdsBjatRhMVD
         qcWjGwbwBd2Xk5o6Tww3tcJBEI9rY1p8Dk2UrgBtsriUgEGSeXRaXQnlEZgtFlkOGEoX
         Y4fzCGo7aA72fCxt4zJ1QOvaF1i7mdAZHPAShRjf+1g93IEnFo30D2Vi5kQIgSZBli7O
         NBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750769529; x=1751374329;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=43+uI18zfaln0A/qyEjVIwHNhYdMj3BGrAgTLFXWWxM=;
        b=ZErcMaZ0pZ6PzwKI1wm7Pmp0SFGtfMG/em17W8ANgOCSP43qhzpj+8ciz7XUn1umm+
         bQPRKgNFTlu76AlL19fRZnwNvjY+A2CSWSgbNKssk9dDK04PNtZtv3ZuX1yo1sv0JDjm
         C7gVfkBZTZ69hhScQjZtNXOkm7mumbEFvym6aDsKNhUahaEXmhcGkYb/ffjFuACEeBYu
         B9SAA9tcO6tVXE4iNhaUeJMjmLYdQAjOHP9rldVSyPCYjTi5CQNvg/s6+pGnBsf+4Zqf
         oBpPWBu+MLMD4DrIm/AZ4KwY4KBcpWoQHqIhdeWJVVZdnaGUH5AyytWrJwsQaReFb6uI
         ifWw==
X-Forwarded-Encrypted: i=1; AJvYcCWoRQJfDlKKtPhCwRb45YwkPuhj7WnyNgjGjz8qTDQc63MEzM06Ff6sdb6xPA62jFgdva2VKDYadB/AEgnu5imO@lists.infradead.org
X-Gm-Message-State: AOJu0Yyjo2up30MtCboAs2SXDiax5zUs9J0OL0A5V3PkZvMv02I3fqZY
	2IXwGtn8HfVaOpOmI/WXj8Pgob9YjdOuB94TkUDm+1tVD4mSe02Dr9/gTNZtT7o7GNY=
X-Gm-Gg: ASbGnctObzQ+2F8jBK+wxvOrRxF1vEV1MgAPlwEv2/MhhaJQYFbyHO/KxGzpRiezVJP
	Qm/e/Hb7P1EYdFBMXCmu2XRnFUbKWy4FtBi8dBoaN0QowxWPPSgQtUUkwM6WBOk+uCdiWDtmGZE
	ENzAGiE+4vDWAhhDIYYYrpjeqTDRhXZQ9vucQbwCG1WRsTOg4ocEsD9R1RyaPCiSc3bJYzXJYAZ
	E7UFqhuHc7sTx9RPAVu0lIC6yYGLmPX/Zu9OvqDrq9sctdh7XWZ4Ot3y8pSP0EDkmTqgLY/ivSU
	ON/oIYO0GBGDzsCcTez0iVZ214KD7WhxQkOYvYyLWYyKflHReY9wvBJv5pssjbah9Ng=
X-Google-Smtp-Source: AGHT+IErLDSfI2VkjcDIUdSIKY1bZ0ZcuBWHsbGMIADEqK4joeu4vANmHrHV6WaLOIvIiQcYxWmJnQ==
X-Received: by 2002:a05:600c:3e8c:b0:43c:f81d:34 with SMTP id 5b1f17b1804b1-4536e087050mr114790735e9.9.1750769529202;
        Tue, 24 Jun 2025 05:52:09 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646d7fe5sm139832025e9.16.2025.06.24.05.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 05:52:08 -0700 (PDT)
Message-ID: <55ed3483-c373-4dac-8057-96e31a2e8881@linaro.org>
Date: Tue, 24 Jun 2025 13:52:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/11] coresight: Save activated path into source
 device
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, Yabin Cui <yabinc@google.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20250516160742.1200904-1-leo.yan@arm.com>
 <20250516160742.1200904-6-leo.yan@arm.com>
 <788e698d-aa1a-47ba-829f-aef9cd4b7417@linaro.org>
 <20250620142439.GL794930@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250620142439.GL794930@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_055210_970106_A421E208 
X-CRM114-Status: GOOD (  35.78  )
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



On 20/06/2025 3:24 pm, Leo Yan wrote:
> On Tue, Jun 03, 2025 at 03:49:26PM +0100, James Clark wrote:
> 
> [...]
> 
>>> @@ -577,6 +583,10 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>>>    		}
>>>    	}
>>> +	source = coresight_get_source(path);
>>> +	if (coresight_is_percpu_source(source))
>>> +		source->path = path;
>>> +
>>>    out:
>>>    	return ret;
>>>    err_disable_helpers:
>>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>>> index 64cee4040daa..cd9709a36b9c 100644
>>> --- a/include/linux/coresight.h
>>> +++ b/include/linux/coresight.h
>>> @@ -265,6 +265,7 @@ struct coresight_trace_id_map {
>>>     *		CS_MODE_SYSFS. Otherwise it must be accessed from inside the
>>>     *		spinlock.
>>>     * @orphan:	true if the component has connections that haven't been linked.
>>> + * @path:	activated path pointer (only used for source device).
>>>     * @sysfs_sink_activated: 'true' when a sink has been selected for use via sysfs
>>>     *		by writing a 1 to the 'enable_sink' file.  A sink can be
>>>     *		activated but not yet enabled.  Enabling for a _sink_ happens
>>> @@ -291,6 +292,8 @@ struct coresight_device {
>>>    	local_t	mode;
>>>    	int refcnt;
>>>    	bool orphan;
>>> +	/* activated path (for source only) */
>>> +	struct coresight_path *path;
>>
>> This is probably cleaner if it's saved in the new global per-cpu you added
>> in patch 2. It's even more specific than "for source only", it's actually
>> only for per-cpu sources so it's not worth having it on every device.
> 
> We can maintain Coresight path pointers in a global per-CPU data
> structure. These path pointers are set and cleared during path enable
> and disable operations, respectively. Idle threads can then access
> these pointers for power management purposes.
> 
> However, the challenge is how we can safely access the path pointer from
> an idle thread - particularly because idle threads cannot acquire
> coresight_mutex, which is a sleepable lock. Consider a race condition
> scenario where SysFS knobs frequently enable and disable paths, while
> the corresponding CPUs enter and exit idle states. In such cases, if
> an idle thread attempts to access the path pointers, we would need to
> use raw spinlocks to ensure safety. This is problematic, as it could
> result in the CPU suspend/resume flow waiting on SysFS operations.
> 
> This is why it turns out to use lockless approach. Two key background
> info:
> 
> - Path pointers are not guaranteed to be safe to access in CPU power
>    management (PM) notifiers. In contrast, the coresight_device pointer
>    of a source device (e.g., an ETM) is safe to access.
> 
>    A path's lifecycle begins and ends with SysFS enable and disable
>    operations. OTOH, an ETM’s coresight_device pointer is initialized
>    during the probe phase and cleared during module removal. Module
>    loading and unloading trigger SMP calls for initialization and
>    cleanup. These synchronized SMP calls ensure that it is safe for CPU
>    PM notifiers to access the source device structure.
> 
> - Another factor is that the device mode is used to determine whether
>    it is safe to access the path pointer. When a source device is
>    enabled, we must ensure that its state transitions from DISABLED to
>    an enabled state on the target CPU. This guarantees that the mode,
>    and any subsequent operations dependent on it, follow a strictly
>    sequential order.
> 
>    CPU0                                    CPU1
>    etm4_enable()
>     ` etm4_enable_sysfs()
>        ` smp_call_function_single() ---->  etm4_enable_hw_smp_call()
>                                             ` coresight_take_mode(SYSFS)
> 
>                                             CPU idle:
>                                             etm4_cpu_save()
>                                              ` coresight_get_mode()
>                                                 ^^^
>                                                 Read out the SYSFS mode
>                                                 Safely access coresight_device::path
> 
> Therefore, safe access to the Coresight path heavily relies on the
> mode (as part of the state machine). This is why the patch adds the
> path pointer to the same structure as the mode.
> 
> Thanks,
> Leo
> 

I'm not suggesting to change the flow for accessing it, only where it's 
stored to not waste space storing it for devices that never need it. It 
also makes the code a bit more readable because you know that variable 
is never accessed for other device types by the fact that it doesn't exist.

Because we only have 1 per-CPU source for each CPU, there is no 
functional difference between storing it in the device or in a global 
per-cpu area.

If we imagine that the path pointer saved in the device is actually a 
pointer to a pointer, and that pointer happens to point to the per-CPU area,

  struct coresight_device {
     struct coresight_path **path;  ---------------------
  }                                                      |
                                                         |
                                                        \ /
  static DEFINE_PER_CPU(struct coresight_device *, csdev_cpu_path);

then the argument for safely accessing doesn't really make sense, it's 
just a stored somewhere else. Moving it doesn't add or remove any safety 
or concurrency issues, it just has a different address than the one in 
the struct coresight_device and looks a bit different in the code.


>>>    	/* sink specific fields */
>>>    	bool sysfs_sink_activated;
>>>    	struct dev_ext_attribute *ea;
>>


