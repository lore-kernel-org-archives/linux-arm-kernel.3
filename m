Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2F7C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 07:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5JQMc0JK4aWXwOcpwJILt54UlEg8yqOSNknC98xAh/4=; b=gRlXNVVzzLZj6NE5VWRoheVvs8
	+AVWwjjphParN2xZAnJS3Ejn9c64r6ShjQWik8bZyl/t2Cv7ssRPGQdKrDQmDIH4ooaNqIjnkFCde
	93G1aLm9rySJqc4qiObemXNbXypYY+3v8QroVAhZ6ZplKQBNsRud0C9nO81T0GA7w8aLLrRikn4Wj
	Wvx9FM4Fuao03D3YLfpNppIbJbC61iHXuQv0KGY+d9vhvYcBsGb4/vfHdrXfYjX59nLaVvjr+NK7R
	W/fseDgadDlffo6Nkp2QXI/maoB78F0udo8y8lO5fvFFoOhYgog75cYMGLNlDYQ01Py8s8vtdnYdp
	aV8RG4jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGH2-00000007fpZ-2gSw;
	Wed, 12 Mar 2025 07:13:04 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGFM-00000007fQI-3Jaq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 07:11:22 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso37837575e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 00:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741763478; x=1742368278; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5JQMc0JK4aWXwOcpwJILt54UlEg8yqOSNknC98xAh/4=;
        b=THVN/BiwNK9qkUo/kXfFmDniYRoZwWu9ITUTGerYrtPkdzEW4cEXTCQFrII97sOgEZ
         97G2l8jMz/j/YVF2wQbiG2g5sAd4jfJrGfrMWudCK2s+RUDBmurPRIuJ/7mzFgrR5FfL
         ia2w0kQ2LNAm3bYR3ccwycQWff6RlQnlYfUg3/yWasErIxXkKEjXfuuNHlgTsL+q+QJI
         iSllmD3e/6BEhCWaC9LBWxpEKXRsikk0PNaWtuoMUNcbqLRwkoHXfMKIBcBzIh/RXiKV
         l1UF4O/s8Xx2WfmASwUoFrwfzs8yC21L9ROOgkqlf5x90UJ2+6JATMSKzP/90H+1RK3F
         tJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741763478; x=1742368278;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5JQMc0JK4aWXwOcpwJILt54UlEg8yqOSNknC98xAh/4=;
        b=jpzX+aycZ2PrFxYp+mngYTFCU0MuBNVRmkbB73Ovji+uamTRbJ9Tvsj/FEn4zG9veg
         GH2xjKPmBFACjhUizlmJW2y5NOKWBI+5xQriiwwn9PdI6ZY5X0t9Ue6FXHA8ECxuu56r
         yXrcG3m4Zxe0BY3wemvZRb0f36gEGiYhCPkTi/xP4D0SvOzYcqls14Vlcjercu54/yVh
         hMsgGGaZAtfiMJ8QTbk/GydPWeH1ftMwLlPv/uy8AXSIGVR3f+YKseN+vhy1cTCI8yWs
         KuCwjMRx2dBl5Bjw74z6DAgg4d/Ku5sJfXCaLgQTP521Xjq5IPZpgXOpm+r+pz5+I8Ud
         S2IQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1ljkf0HQKquXdHWdu3ofpS9vwCr/mg4PLVq2kk8idbnTZjvmtfklFXIJGbofMsV6mikzKJhG9hhmQhoNeIyFQ@lists.infradead.org
X-Gm-Message-State: AOJu0YziW6oUZPYtDp/DcrX4GkOebPpGUHL/C6+JMqcuGiLQvgSDH4WV
	wTTRs4s7SYxBiOY+tTvICeS9c4zFw0PBMnnnOREyLaWfCyK+yUNd5C3jYdHoY2A=
X-Gm-Gg: ASbGncvX168lkzw95DJQHECj8lRFTF2JmAvsr3ub8oDdHeMST2D4u8jTnryXHxnuoXL
	VG1opJdRiukTYrlBkQ/Al/6/tMIzDjC5KaaTdsNA0DULcN/EZrxLND9HlGEL/7D+W73+xf2cEB1
	4WdFrDjEVzJpIMSx8YuYaSXbVwBxjkUHx8mIXF0y9BGg7cMikCy591bFcxYo/MX10/ea+0b8cZj
	4BGyaZnFRsZq1zVCZ4ci9HMvtp+XQzk0NGPpC0mJCkXRpErQNqdNnDsdbpg0uEAQMv92JHUu5NV
	Y4TmwOg6LB/1BYVIhP9l3TFG+BjC5d1RMm5ky1sVNDMYgqX3ZMpUrA==
X-Google-Smtp-Source: AGHT+IE7CFqZ+AbL0Q4cb87iC4MZdbphZY+v7bJCpcP2ShGQtgySl1i2tbL1wMwKn/N8LmsPbsCRyA==
X-Received: by 2002:a05:600c:19cc:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-43d04e92a66mr49813565e9.7.1741763469875;
        Wed, 12 Mar 2025 00:11:09 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a72ec8bsm12210285e9.5.2025.03.12.00.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 00:11:09 -0700 (PDT)
Message-ID: <696494b8-14e9-4b9b-bf26-2a94a915b2ec@linaro.org>
Date: Wed, 12 Mar 2025 07:11:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] firmware: samsung: add ACPM debugfs support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: andre.draszik@linaro.org, peter.griffin@linaro.org,
 willmcvicker@google.com, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250224-acpm-debugfs-v1-0-2418a3ea1b17@linaro.org>
 <20250224-acpm-debugfs-v1-3-2418a3ea1b17@linaro.org>
 <005424c2-7fb7-48db-b38c-c62f9f8b3897@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <005424c2-7fb7-48db-b38c-c62f9f8b3897@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_001120_843037_9DA63939 
X-CRM114-Status: GOOD (  24.91  )
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

Hi, Krzysztof,

On 3/5/25 7:37 PM, Krzysztof Kozlowski wrote:
> On 24/02/2025 09:01, Tudor Ambarus wrote:

cut
> Please add something like above also as a comment to the driver, so the
> interface will be documented.

okay, will add.

cut

>> +static struct dentry *rootdir;
> 
> exynos-apcm.c is not a singleton, so neither should this be. You should
> create entries per device (so with device name as subdirectory), just
> for correctness.
> 
>> +
>> +static DEFINE_MUTEX(acpm_log_level_mutex);
> 
> And this also looks per-device-instance.

okay, will create per device instances.

>> +
>> +static void acpm_log_print_entry(struct acpm_info *acpm,
>> +				 const union acpm_log_entry *log_entry)
>> +{

cut

>> +		dev_info(acpm->dev, "[ACPM_FW] : %llu id:%u, %s, %x\n", time,
>> +			 log_entry->plugin_id, (char *)&msg, log_entry->data);
> 
> 
> I don't think these should be printed to dmesg - these are not system
> logs. You either return the contents to the caller's read() on debugfs
> entry or, if this is anyhow crashdump related, it goes to
> pstore/minidump once triggered. Or to ramoops.
> 
> Depends what these logs are (so please also explain what do you find
> there in the commit msg).
> 
> Maybe something like CHROMEOS_PSTORE?
> 
> IOW, if enabled, this should go to ramoops/pstore unconditionally. For
> runtime debugging this should be returned somehow to the userspace
> reading the file. I think usually debugfs and sysfs is not expected to
> provide more than PAGE_SIZE data, so this second part has to be
> rethinked still.
> 

This is a logging feature, it's not oops/panic related. These logs are
referred to as "block logs". A "block" is the start of a mailbox command
to its end, so it logs every ACPM mailbox command issued to the
firmware. After each end of a block, we see the state of all regulators,
frequencies and devices up/down extracted from the block.

These are indeed system logs, and using the dmesg ring buffer seems fine
as we typically care about the recent logs, we don't care if the ring
starts all over again.

>> +DEFINE_DEBUGFS_ATTRIBUTE(acpm_log_level_fops, acpm_log_level_get,
>> +			 acpm_log_level_set, "0%llu\n");
> 
> I also do not think debugfs is a knob to control loglevel of messages
> going to dmesg.
> 

This debugfs entry controls which SRAM log ring buffers are queried -
there are 2 SRAM buffers.

I guess you thought about the "logb_gprio_level" entry, which controls
the ACPM print verbosity. 0xf being ERR, and 0x0 all logs. The firmware
defaults on printing all logs. I can't tell right now other way of
controlling the logs verbosity, maybe via sysfs, but it's equivalent and
with more restrictions. Or maybe you think that I shall always print all
logs?

Thanks,
ta

