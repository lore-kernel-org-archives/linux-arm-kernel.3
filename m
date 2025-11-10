Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DF9CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 11:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExEG6kaP1rEO2aruYE4rUQ9JOoP4nrt4oMyMC9fmdWY=; b=HqA3Wx4CYoQ68B77LkjK5dKQ3S
	ydUZClq/dIO8FTiQXnzCL8a7LA/xMljd1396p7AZ+MiWWUMdLOEFTiwaozw/WMvR7wrxvcffl/6w3
	kBYLfr94slBP2h2GiqCOPcxouF4G+dmtMb+/CX3Mo7zNYLLPs9XyqWKKuOw/RwFsMcBgtO4ltmL+8
	PCo022Ka/Vu8bZDOuRt1sEEvasMQH9RtyhIGX5oYodcp9bIfoK30qO6cFFI/ubJ/Tij6pQf4Oo35T
	Ks7mH35CI2t+ZNccVZPuqLY9KL4FgbJ032343Se5RWUaexgZk9uFWkEbgHS4bYC7fY70m9A48V/bz
	Ww1e7E8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPm0-00000005GoR-0ySw;
	Mon, 10 Nov 2025 11:09:24 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPlx-00000005Gnk-0jcc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 11:09:22 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-429c48e05aeso1505050f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 03:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762772959; x=1763377759; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ExEG6kaP1rEO2aruYE4rUQ9JOoP4nrt4oMyMC9fmdWY=;
        b=eivWk9hvMJXJIqYST2p4gRCzeg5zEyvWxoNCddru3NVDvixe8dFmsl9Im29R4Ums9h
         XXXtHz3YdfAkYHijprZZ0SrmnqoKfcMEN9QfNhOjcjtNYSBnUsfsWIbI+9qWDWzU2iAQ
         0phxHntW7lTYQkT1+GCDFPa0lO3A1/iPhzQzXxiX/ftDAYGer6KW4dJEQQzzeLdVNAIO
         DIK5bGXG2mwVkV68DpIUq4oWKltnZAiVejlk4/Je5IGN3RJ+awCCdA0u1tzowfUp1z60
         VNsy3HsfTLQPCOIP9HJjG/CbhV4x0FA8dgz7RXcKW6jPNw1NLoEkNOdO65wovpLeR9Wa
         FgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772959; x=1763377759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExEG6kaP1rEO2aruYE4rUQ9JOoP4nrt4oMyMC9fmdWY=;
        b=P0vVNQHq/mvYEAb2bQFGk7rqVd9PpguwLIYBMWU8YP1SWdhdnXJlYtGjnDUt2jKRvF
         qSP4vV94/IkL4fKZ/EAwFeQ1I+gRRKqhucmhNvZeP5jnC7XlYXmtVOgVPhKFGfG3W2Nz
         c3zzffUmzNR9Q6V6oyRdT4G1mbPNfxXOpyIC5wuKodethpyJOo3FPO4OEEd5RznfeN9G
         BGv6XHA7nVpvk+O7AfJJ8xUkoOTmcUulda4YXC4RjTwzsseLzBVUwuW1dNPUShbDGSfB
         VPZzurCykIXdzqk05H2EYLq2jxGBsT6YKYq/kepK1f2ZmDeoxRIgu9tM2iSBn1+uYqSf
         yM7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHnqOtXYlaV4i6LLEfapY5sEyw5tLYHjkb5OeuCH0GhzZmuVR67+GDsAqhZzqzZslHXLcG4ua0r0Hxp0d6MGIr@lists.infradead.org
X-Gm-Message-State: AOJu0YyphdlV0jwBTmeIsHl9FYDnTNaRx2ZPTHSiDinhnwIgaYlKdH7A
	T+NI0mqK00LQAxtyXCIBhNCPr6bhoiUP+qJYBDR2RKWNFR8r7Lrc3CdlyoOOsXeBP78=
X-Gm-Gg: ASbGnctFi7DUxOeV5mD4JF+g6rymbHpUL3nwNbW67gVSlE0QwODNZd2MzoD+WD0SLFj
	m2rkqhdBaXFlI72+Ar6RkX/k/YbiBczffXs7WiZo2WDuXEWar/RBAs5uCfkV3LnJrloafpoWKbP
	5/RnlndQUwsGVsss1Au+B41w2mg2aWgAoTJiEY/IcBg6Coy7+DoSbIZ6KDfJ4wnJ3KnPKKUn6WF
	ivuSxzCNWKw/pMHvAWM0eV/Vm91i2g7evmDp+jzuJWeFirY6fU1fbzfuZhkMAyZgHvnpPUh4zhO
	XYKhh/XnVHFtNic9S4i75n1WbL3X20DvZvPY3ND31K5BgI8TdvaVvQenATVpvwkcu6mhYb+kG7f
	BVkozsz82uow69KjyUf1FLPQGN0iBsmJctnuZ7Y7s5Lp2VpF+xj+U/ZrzP41U34PoJ/dkQoOA8K
	RlcReQHkAZShRMuR4p
X-Google-Smtp-Source: AGHT+IEiWosqOoml/053h3/0pbVDM6uHslIrEjePgzq0Ut+/JvMBEtJgZLmQRjK8wllKL3FcU5WLmQ==
X-Received: by 2002:a5d:5d81:0:b0:429:c555:a53f with SMTP id ffacd0b85a97d-42b2c6a16bemr6598563f8f.30.1762772959072;
        Mon, 10 Nov 2025 03:09:19 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe62bf35sm21578747f8f.7.2025.11.10.03.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 03:09:18 -0800 (PST)
Message-ID: <56344438-5730-4dfe-86ca-738aa94ef483@linaro.org>
Date: Mon, 10 Nov 2025 11:09:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/15] coresight: syscfg: Use spinlock to protect
 active variables
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
 <20251104-arm_coresight_path_power_management_improvement-v4-7-3d4bba674709@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251104-arm_coresight_path_power_management_improvement-v4-7-3d4bba674709@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_030921_244359_CE938376 
X-CRM114-Status: GOOD (  23.22  )
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



On 04/11/2025 3:21 pm, Leo Yan wrote:
> To support dynamically enabling and disabling the CoreSight path during
> CPU idle, cscfg_config_sysfs_get_active_cfg() may be called by the ETM
> driver in an atomic context. However, the function currently acquires a
> mutex, which is a sleepable lock, and this is not allowed in atomic
> context.
> 
> To make cscfg_config_sysfs_get_active_cfg() called in the idle flow,
> replace the mutex with a raw spinlock to protect the active
> variables.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: James Clark <james.clark@linaro.org>

> ---
>   drivers/hwtracing/coresight/coresight-syscfg.c | 22 +++++++++++++---------
>   drivers/hwtracing/coresight/coresight-syscfg.h |  2 ++
>   2 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> index 6836b05986e8091b4f8ad7d082d6a016f8cf7d74..53aa1a44f9ac8f65b4e3cce06a33255abfc17351 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> @@ -957,15 +957,19 @@ int cscfg_config_sysfs_activate(struct cscfg_config_desc *config_desc, bool acti
>   
>   	cfg_hash = (unsigned long)config_desc->event_ea->var;
>   
> +	raw_spin_lock(&cscfg_mgr->spinlock);
> +
>   	if (activate) {
> +
>   		/* cannot be a current active value to activate this */
>   		if (cscfg_mgr->sysfs_active_config) {
>   			err = -EBUSY;
> -			goto exit_unlock;
> +		} else {
> +			err = _cscfg_activate_config(cfg_hash);
> +			if (!err)
> +				cscfg_mgr->sysfs_active_config = cfg_hash;
>   		}
> -		err = _cscfg_activate_config(cfg_hash);
> -		if (!err)
> -			cscfg_mgr->sysfs_active_config = cfg_hash;
> +
>   	} else {
>   		/* disable if matching current value */
>   		if (cscfg_mgr->sysfs_active_config == cfg_hash) {
> @@ -975,7 +979,8 @@ int cscfg_config_sysfs_activate(struct cscfg_config_desc *config_desc, bool acti
>   			err = -EINVAL;
>   	}
>   
> -exit_unlock:
> +	raw_spin_unlock(&cscfg_mgr->spinlock);
> +
>   	mutex_unlock(&cscfg_mutex);
>   	return err;
>   }
> @@ -983,9 +988,8 @@ int cscfg_config_sysfs_activate(struct cscfg_config_desc *config_desc, bool acti
>   /* set the sysfs preset value */
>   void cscfg_config_sysfs_set_preset(int preset)
>   {
> -	mutex_lock(&cscfg_mutex);
> +	guard(raw_spinlock)(&cscfg_mgr->spinlock);
>   	cscfg_mgr->sysfs_active_preset = preset;
> -	mutex_unlock(&cscfg_mutex);
>   }
>   
>   /*
> @@ -994,10 +998,9 @@ void cscfg_config_sysfs_set_preset(int preset)
>    */
>   void cscfg_config_sysfs_get_active_cfg(unsigned long *cfg_hash, int *preset)
>   {
> -	mutex_lock(&cscfg_mutex);
> +	guard(raw_spinlock)(&cscfg_mgr->spinlock);
>   	*preset = cscfg_mgr->sysfs_active_preset;
>   	*cfg_hash = cscfg_mgr->sysfs_active_config;
> -	mutex_unlock(&cscfg_mutex);
>   }
>   EXPORT_SYMBOL_GPL(cscfg_config_sysfs_get_active_cfg);
>   
> @@ -1201,6 +1204,7 @@ static int cscfg_create_device(void)
>   	INIT_LIST_HEAD(&cscfg_mgr->load_order_list);
>   	atomic_set(&cscfg_mgr->sys_active_cnt, 0);
>   	cscfg_mgr->load_state = CSCFG_NONE;
> +	raw_spin_lock_init(&cscfg_mgr->spinlock);
>   
>   	/* setup the device */
>   	dev = cscfg_device();
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.h b/drivers/hwtracing/coresight/coresight-syscfg.h
> index 66e2db890d8203853a0c3c907b48aa66dd8014e6..f52aba4608dadc1c7666e0e28c9b43dc1c33d1eb 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.h
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.h
> @@ -42,6 +42,7 @@ enum cscfg_load_ops {
>    * @sysfs_active_config:Active config hash used if CoreSight controlled from sysfs.
>    * @sysfs_active_preset:Active preset index used if CoreSight controlled from sysfs.
>    * @load_state:		A multi-stage load/unload operation is in progress.
> + * @spinlock:		Exclusive access sysfs_active_* variables.
>    */
>   struct cscfg_manager {
>   	struct device dev;
> @@ -54,6 +55,7 @@ struct cscfg_manager {
>   	u32 sysfs_active_config;
>   	int sysfs_active_preset;
>   	enum cscfg_load_ops load_state;
> +	raw_spinlock_t spinlock;
>   };
>   
>   /* get reference to dev in cscfg_manager */
> 


