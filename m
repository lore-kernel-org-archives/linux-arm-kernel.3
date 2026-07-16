Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5F2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 04:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iB6KfLcA87MVL2uvw6XnHDjxNkfUh6b01BHrTKH5fhY=; b=jUwBNtEPNLHsZBf/DGHSEsgz8e
	Z+TCp+j2h8Age3DvY2f7sG8X99G0Mq4yo3hL5bOlBsuX8pZdiykYXLnW3czsuicSkXSKANRb1vMyc
	EfKf4gSjVVBjhXfVk2pcfnKqPRvAwGXFFHVWZ0WA4q9zFYm6I1rXVBeL3wMC57hk0UCxtiOQ4aPuw
	6+mVj+Lf+Vzj1To5gIQ9NybYPoEiIakIXFOwnuH9kRLV+MozVI8jjZ3IKXD0wIyS/e8ISjIrkpIue
	j8lv1T7jHm+hiVxq8yk+sDXthkPPTrd8aHHDSCsj0MYHj7cyn9H1CvbEFu0m8UrxmfNdm1/7pQdMD
	lJTTzpiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkDin-0000000GPT4-1rbl;
	Thu, 16 Jul 2026 04:29:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkDil-0000000GPSc-3DkN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 04:29:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784176154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iB6KfLcA87MVL2uvw6XnHDjxNkfUh6b01BHrTKH5fhY=;
	b=FvFEgaA05eMLzprBG9PHUTeBgAnIQeVx5fYj0gbt+444YfI81Q1ZcJqI63/jCJzwYpyexw
	roVR8nuddvuzQ3b/VtI30ZjBDsqWUg/k4rrF91mhnA8Pei31gSRObLgr7M9iHEHD8N/o0x
	wt7pi71MC6Ikf4dht76R7y0bCwR4qzs=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-n5lAFBNBM_uqsDN2b2NZkA-1; Thu, 16 Jul 2026 00:29:12 -0400
X-MC-Unique: n5lAFBNBM_uqsDN2b2NZkA-1
X-Mimecast-MFC-AGG-ID: n5lAFBNBM_uqsDN2b2NZkA_1784176151
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so2454742a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 21:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784176151; x=1784780951;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iB6KfLcA87MVL2uvw6XnHDjxNkfUh6b01BHrTKH5fhY=;
        b=GrtSDFCrZ0swcb5a74yuFmNBzsBMYTRxIvSyH0/03anK1UiV25qw0IlZq7ZWQCu+CJ
         6HVlPsn3bNIA3QCQo5wfMaEt1gJKr4OVIH2RVaZsl02Af57d7UVswmnDs+ehSIWIn6N9
         469kCxwu3JNeFop01gGu9ETddVj6fE1p29wPa7miVNi5r/2SXWIj+N+dBn/HokykMvWZ
         slCOFlRHcjku9VjUaX9mBJsceUdQr6P5HgklxUBAcOXdG23jD9PBjJBIUTLSwE0VGgYX
         RTJFhA1cPMQkrXOfam37/9qkeuaeHfQnU/8TBHbdVXSPs0SOFsbPRdiUwp+hnj3saj7F
         EnTA==
X-Forwarded-Encrypted: i=1; AHgh+RoZ8PxWpfY6DjJP2XXuxi7yRi/V6I+tNcY9TWkmu2F3pL4eVJZK3D2o+A5zNQBY55O+U9BbGSmxiqvGeoUnkodq@lists.infradead.org
X-Gm-Message-State: AOJu0YzM4O4lzkqzOWXvtX/6Xf6lMAj6B4V6bmELpwjtqygKOXKD/wPl
	LIMyDbwlaK4nUQkbNAQnDPvpviU2ZkwnvpML75A75Y7eHhVxKyfjeLZBe5fUtxHaxdp6yz/Znde
	ops2aBofKs26EfR3sfvuvm5yc03ltWZE3DkK764abuXPQ3zV0B+W5npvC0pLN56xerQqjz2YYw2
	AR
X-Gm-Gg: AfdE7ckUvQndo3ZFEGHNzqAwGKLIudd25PJZiNVMJ+5YzhAtqy+xVfY09oRbeqWDz3I
	1w3VUaeWjkuErpUNh6WKhjbBSGFBjZc6ZYmCGrGGSJrrLLyVhqcmurkigW11DUY89fG4BkX5dOJ
	LIV9f/tOw4+n9vXuxTbLOrOZc/pUwzuBb628yr7M9CxtkeAzH4ODV2tHXgc6QeAGszxLO8FrQ5m
	5aVa2V35PwPe31CXPPZu23PXjuXipDl3/jd33U+YzYKaursZ19XDaHSE2Hhk4uN5g/nwtK3bwnV
	qysxDfkILO1LM8OVt8efKRnlV6ER3LAD7K+aPskM8FgVZO1qRXCbJ3g4OqXZk8iP++V4dvLSN7f
	tICMIz1j12cxrN8cGA+cw0Xc53VRTfF+9m/MX9wNI6uM=
X-Received: by 2002:a05:6a20:b7a7:b0:3bf:c07b:a9ab with SMTP id adf61e73a8af0-3c110ad48bcmr20256063637.55.1784176150981;
        Wed, 15 Jul 2026 21:29:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:b7a7:b0:3bf:c07b:a9ab with SMTP id adf61e73a8af0-3c110ad48bcmr20256030637.55.1784176150300;
        Wed, 15 Jul 2026 21:29:10 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6c0702sm6532622eec.22.2026.07.15.21.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 21:29:09 -0700 (PDT)
Message-ID: <8e7f992c-db87-4b79-8d92-d9a44295a0a6@redhat.com>
Date: Thu, 16 Jul 2026 14:29:03 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/11] arm_mpam: Add missing mon_sel locking in MBWU
 restore
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260710115546.29644-1-ben.horgan@arm.com>
 <20260710115546.29644-5-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260710115546.29644-5-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -XT2upSiAOzLaWmt-ZnJ3vol6lkF3hw9UAzTZvcumP8_1784176151
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_212915_891180_7F25919C 
X-CRM114-Status: GOOD (  19.26  )
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

On 7/10/26 9:55 PM, Ben Horgan wrote:
> The mon_sel_lock is used to protect the mbwu_state, as well as h/w accesses
> that use MPAMCFG_MON_SEL. However, in mpam_restore_mbwu_state() mbwu_state
> is accessed without holding the mon_sel_lock.
> 
> Add the missing locking.
> 
> Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 11b10c3bc334..b34e2a368516 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1648,16 +1648,24 @@ static int mpam_restore_mbwu_state(void *_ris)
>   	u64 val;
>   	struct mon_read mwbu_arg;
>   	struct mpam_msc_ris *ris = _ris;
> +	struct mpam_msc *msc = ris->vmsc->msc;
>   	struct mpam_class *class = ris->vmsc->comp->class;
>   
>   	for (i = 0; i < ris->props.num_mbwu_mon; i++) {
> +		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
> +			return -EIO;
> +

The code can be simplified by avoiding the unnecessary nested conditional statement,
something like below:

		if (!ris->mbwu_state[i].enabled) {
			mpam_mon_sel_unlock(msc);
			continue;
		}

		mwbu_arg.ris = ris;
                 mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
		mwbu_arg.type = mpam_msmon_choose_counter(class);
		mwbu_arg.val = &val;

                 mpam_mon_sel_unlock(msc);

                 __ris_msmon_read(&mwbu_arg);

>   		if (ris->mbwu_state[i].enabled) {
>   			mwbu_arg.ris = ris;
>   			mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
>   			mwbu_arg.type = mpam_msmon_choose_counter(class);
>   			mwbu_arg.val = &val;
>   
> +			mpam_mon_sel_unlock(msc);
> +
>   			__ris_msmon_read(&mwbu_arg);
> +		} else {
> +			mpam_mon_sel_unlock(msc);
>   		}
>   	}
>   

Thanks,
Gavin


