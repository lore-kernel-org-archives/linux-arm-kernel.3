Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476EAD3CCB2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 06:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKkwEaXWrytD3qRHA2b2ej40WFnskIIeWa4NljUliss=; b=Eq/lDPFSzRPL1x3WPpFJwYECaj
	voOkEABrZ988/Y0do9z0vtIQC2C+BDlB6J2q3lPOFWNkz0SMMqBgDrmvyUTw8kBMYqFWBr8lCfaXu
	1zQ/s48M6+L3e+Z2FRf9elHlkqXELr8R6GAArFzyUn25eK/JKoyx+6TQs6lRvf/CtbRjo9fTLLOze
	sCOzjLUTl3x8dlM1mgcJNHHbMjkryc/yJW1Q58Mcd/wvJKI+NsikrUlpe/sbL26Q21mA+NwDLxUn9
	FSgJPgeCBvMp9zIIVN8TZU4RhLGlH8JwW5/MRYDpiGKaJ1u56V53SEKpp1iSVBunQkPdG9FDFLbE5
	FNsSlSJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHBm-0000000BsnY-3wap;
	Thu, 15 Jan 2026 06:50:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHBk-0000000BsnB-2ib7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 06:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768459835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RKkwEaXWrytD3qRHA2b2ej40WFnskIIeWa4NljUliss=;
	b=YjxyLnkYk+AnEFygsjPWxvbSrVPfVqTcjL9kwh2lhQeyy5vxcJcxq5gwYVHHO4A6D30l8G
	zq4T0QjdFMFG0u3yY/oHvN4ZWyY4AXnivOoYVSoVg80dK4u4wmgAvCHgPRvjCyhnPzOO5P
	h5zDEPcj4LDjtseEz5IQTSBNXtOITTc=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-6wiWQjwxONqPrl5DnUqipA-1; Thu, 15 Jan 2026 01:50:33 -0500
X-MC-Unique: 6wiWQjwxONqPrl5DnUqipA-1
X-Mimecast-MFC-AGG-ID: 6wiWQjwxONqPrl5DnUqipA_1768459832
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a08cbeb87eso6405635ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 22:50:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459832; x=1769064632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKkwEaXWrytD3qRHA2b2ej40WFnskIIeWa4NljUliss=;
        b=KxoRiR6n2LsBLl88B2Gv30G1kd3wR47PxGrluJvMiLqnbesNfQ2Hin7TgvOhKOjrT2
         oAz/T7t4L1sRXV+mnKuj2oedQHR3xJ7kXsmywNzDy1Lqa/T4bZEOEKZ/tMsLqdyJDk/r
         UkpAbqNpGF5lO0HZirvUnycjmlW0VKwbyAi9BqPCIFI+s6HDuh1R+YPWOWBgo3XcREmp
         1GFrWnPNGRpGE92zXr2nZmCHxELO84rxyNA2CEiEvxL3FVVH85mwiyb/3OvOcBqLv2mf
         Zg3wZCDRwOeHksaZIEt5HwxQa+xU29ZUDLzpzSLsqFZKf+q/NtaXdyWlTBjHhdDWhC3x
         xfzw==
X-Forwarded-Encrypted: i=1; AJvYcCXctbZ9/DC6lp4cs5zcop81PRaiOklkg2DbR4kIQ7eLraT7zJCqVpLGpql7Ldxf4D07/13H8UhjZolnkCH/DEn6@lists.infradead.org
X-Gm-Message-State: AOJu0YyIpmHI4C1vZT9i4mE+YQm877uOyTZL1rbF+JHFwIoggHzfIzUo
	ODfQUwHaCU0jU6jO1hyqlBLD0KjATWGgqiQmDd3w2XbxW3ZAlMsktaHNkFI5zTdevZP3/jeLcSs
	HCvylPI9xj5Ax/BVYEBT+fTmPUHn5mbRya11yQetfYfbVtGPrZZPn1J+7hUv8HWvAD68Lwcw7ov
	C7
X-Gm-Gg: AY/fxX78bJ3iUDVkzOrQghpFpULP7AGD1WWoexdFyMtfEholknoa1IpzSaVKMRq5UNH
	mIUFB5flze5oOB6ra0iUOZN+Sx0un8Sv47pu3wXlHQQ+eGB3I0h4I8Q154lWS6OrlaEG338loKY
	3tchtG7bCuM9EWqCebY9X1Z90eRR4iw8ILXB4NmP741AtQ4HyKqwZnbK+Z3pGX8CahT79Mj4YZN
	GobBE9aqnPpFp02e4lM9Sszd/0Zi4+L3JovygvbiYSHjCiLCejbBS/aAgDmJTTdxMBBrDER5Qif
	/rI+Q8HNMeAr1c/tijxjjDkB3FjChj9epCE7YVzyf5zi3q/TC+7Wiq48j4inFwnlW7spcxJ/7Y5
	QOsm+tXmAPcc=
X-Received: by 2002:a17:903:22d2:b0:295:5132:1a99 with SMTP id d9443c01a7336-2a599e57882mr56049965ad.44.1768459832543;
        Wed, 14 Jan 2026 22:50:32 -0800 (PST)
X-Received: by 2002:a17:903:22d2:b0:295:5132:1a99 with SMTP id d9443c01a7336-2a599e57882mr56049775ad.44.1768459832168;
        Wed, 14 Jan 2026 22:50:32 -0800 (PST)
Received: from [10.72.112.168] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2906sm242216175ad.87.2026.01.14.22.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 22:50:31 -0800 (PST)
Message-ID: <1d6c1473-7267-47be-930f-a5d3fb525b94@redhat.com>
Date: Thu, 15 Jan 2026 14:50:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/47] arm64: mpam: Re-initialise MPAM regs when CPU
 comes online
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-8-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260112165914.4086692-8-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W06Vzo36XJ77sG9XFsa5iRH1Xq43SA839E_MidBekB4_1768459832
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_225036_764589_35C9C37B 
X-CRM114-Status: GOOD (  14.30  )
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

On 1/13/26 12:58 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> Now that the MPAM system registers are expected to have values that change,
> reprogram them based on the previous value when a CPU is brought online.
> 
> Previously MPAM's 'default PARTID' of 0 was always used for MPAM in
> kernel-space as this is the PARTID that hardware guarantees to
> reset. Because there are a limited number of PARTID, this value is exposed
> to user-space, meaning resctrl changes to the resctrl default group would
> also affect kernel threads.  Instead, use the task's PARTID value for
> kernel work on behalf of user-space too. The default of 0 is kept for both
> user-space and kernel-space when MPAM is not enabled.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> CONFIG_MPAM -> CONFIG_ARM64_MPAM
> Check mpam_enabled
> Comment about relying on ERET for synchronisation
> Update commit message
> ---
>   arch/arm64/kernel/cpufeature.c | 19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>



