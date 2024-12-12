Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F00BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 06:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AzE1O+wEcFJCWBuWQepSclrHJZ9pm/tyRfOt1u5cgLg=; b=uYgFXTw7bfHddpDephNhwm+H0K
	jPGTXUKbGl7LoNEsV/907mLBcVqHK/i9z0JFLIStHsCmW6S+ETLwjMylYaHURf+wWUplLqq3CIOGJ
	qdItPnNofq1gsgUPUp14mG3dhaV1a1vpBaWVmv8IjmpyrHLywbpxhKaWLehNK53HcPcye/0zFxE12
	jJE3eNfP+6ZF95TRYWvAv/FxPZOUddbBMJhavPBg+8yGhd7N2Jp9xLqUeYXcxzffm+FD9n/gzZ795
	/rfT2mySjmmaI/wYtxQR1oVjNAuwiMuQTmQ3RyjYXQCMIiZXIH4V17tRWrKxhlOVv5k5VMBCKkpbE
	yN6QsWYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLd3S-0000000H56P-1szE;
	Thu, 12 Dec 2024 06:52:10 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLd2O-0000000H50k-2Dux
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 06:51:05 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-728eccf836bso244267b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 22:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733986263; x=1734591063; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AzE1O+wEcFJCWBuWQepSclrHJZ9pm/tyRfOt1u5cgLg=;
        b=aQgKUU2+OJiPmoa7a7U5z5cWe37Zf8abMz7S1mZcnvzojWfuJP3VzihPepDiVggfxU
         aUsTOBpT2fl956zpxrqlbK1QKBGSeiW+LMwCVz8SjObq1DBTNn7x1rcfu9kpaIjkey9H
         0nxk6l9P/XgfoOZ5p4dBA9cOGaIRO+VS+1WBoPrCNVt5gooDCow3o2xo/Yo/1KKaeXck
         rSkqW7r2RM+6sCgKseLnXQwacd48MrHRplswFROOuswgyotBRmuywTWn/Y4DQD100AG2
         JHwvfgjdOSPPCZnWVl9nJpgbwX++1P8DFS9FCi+amhzxq7W+hn5RwOlgFX7S/en6jV6D
         RPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733986263; x=1734591063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzE1O+wEcFJCWBuWQepSclrHJZ9pm/tyRfOt1u5cgLg=;
        b=F0baWlRRLD7p1V48wIp4PYFANj+WzeX5w2oAdUY0XYFmthTk2Ps+7vUSivVxCaGY+/
         hCzQL5joy7tOJl63ioHSP809NlyX+uWyCX6Tw1ts688/IBrlbFwC3OKRSKAc3yCZK96h
         vHuK76mqCDY8TzycKz3Qxo1aA64FK6QMDrCG1Gu8qJVdNJZTnFeWRDC/cZFFdFqO0hF2
         yLEt5Jg9H9uqpuK0Srlbw7Oq/5roVb8iDLFZHWt7Nlvpst/wjHQbnP8Tu5ithvIA+g7I
         S9oemh3LnAEUa972ou9ccpdWFg82wnW0Tg5EGEh2nVHQ3Tvs+0k5QEez1DnuxgKOfU4g
         P5Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVIE+jFtXc/we5rf6z3ty6UWyO3zRcyDZB7s5Ikd/uqCKNQC4SiuFOdnW3eHXTx2ZkDf47StWW4KnM3I2AHmEPN@lists.infradead.org
X-Gm-Message-State: AOJu0YzuoT2tLIIVFOxR8F0T7ppm6SEAtubbwgWEMeJC5DtdqyhGeapS
	z9rLgzuBQhRI3w/NpVONwdrOEzATdPLLZwre6AJ4GrIeh57rFb1/ANMh1G5cxKM=
X-Gm-Gg: ASbGncu9dKpOTw0+kWXoa/Y25A/WIgcRNfrLRry0eel/rlCv1bCKA57d20t0qukW6Ax
	E+MP2oh7FQEirfw+vtCS84whRjMUYCtE9lnewpBrOmOfA1sdLItKZGrMzguMRppGWJE7m23GSLF
	5OV1bTvZN7mY+Mca7zq39heIPSBLX1hQ3aL7UIGYzAApmr7RH41UuKWXVTU/QYlj+XMAguMBGCG
	b7yxiAt1WBdMstiupF9QCwpJD3d3M9lFHdo0xqPRGaAjAKwvxEYTjcjAVY=
X-Google-Smtp-Source: AGHT+IFE78oKDXfbnWAKipxIsGcsj9ziBXqvMJZisKuD8EuJoQLV1Ku/T9xLrtjkJtyJVpTFpdinxQ==
X-Received: by 2002:a05:6a00:9aa:b0:725:e325:ab3a with SMTP id d2e1a72fcca58-728faa1ce63mr3316269b3a.14.1733986263004;
        Wed, 11 Dec 2024 22:51:03 -0800 (PST)
Received: from localhost ([122.172.83.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e82197e4sm7131155b3a.72.2024.12.11.22.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 22:51:02 -0800 (PST)
Date: Thu, 12 Dec 2024 12:21:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	rafael@kernel.org, sumitg@nvidia.com, yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
	zhanjie9@hisilicon.com, Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Phil Auld <pauld@redhat.com>,
	x86@kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v8 1/4] cpufreq: Introduce an optional cpuinfo_avg_freq
 sysfs entry
Message-ID: <20241212065100.sjb7lrlmksbm2hdk@vireshk-i7>
References: <20241206135600.4083965-1-beata.michalska@arm.com>
 <20241206135600.4083965-2-beata.michalska@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206135600.4083965-2-beata.michalska@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_225104_591246_F16AC41C 
X-CRM114-Status: GOOD (  12.44  )
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

On 06-12-24, 13:55, Beata Michalska wrote:
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 04fc786dd2c0..70df2a24437b 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -747,9 +747,14 @@ show_one(cpuinfo_transition_latency, cpuinfo.transition_latency);
>  show_one(scaling_min_freq, min);
>  show_one(scaling_max_freq, max);
>  
> -__weak unsigned int arch_freq_get_on_cpu(int cpu)
> +__weak int arch_freq_get_on_cpu(int cpu)
>  {
> -	return 0;
> +	return -EOPNOTSUPP;

I did suggest not doing this as it may not be acceptable.

https://lore.kernel.org/all/CAKohpokFUpQyHYO017kOn-Jbt0CFZ1GuxoG3N-fenWJ_poW=4Q@mail.gmail.com/

-- 
viresh

