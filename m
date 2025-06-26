Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F5EC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 18:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mWPkFFmTIdZEAaU2As3DwN6xujYoIXmrnl7uwmSiIkg=; b=fhXbhq1dLmvwXiWfsK5IelOUsx
	SR7X7SXqwbI8DdH6O1USyM3NfFRNXUYVShDmd0sBQdW521PhRkcISLh3O+b5psh7sFDLWMN/xeT+a
	WJKH2Mrv5YXKk7/iuI4jq1kr+bj4b+m6ZCWk1c/QA3V5LVTRUZebTr+5wlRFi9L1qLJ7idCroBnhQ
	PMPNwKp75Fnd1ZQeF0K6AbFguWEWCMcTMAndWiHW3sbTH0tGcOddRlMt+F92OQi8kAuJvkKA5FRFt
	KLxKvabLGcz4ZRaETEw/4TPrz4LPBjB5j75Gl6a+mvDobDkI6605Xqd3foMoMiBI8Fk5BPwDhC2XR
	o1NxNWJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUrSF-0000000CT38-3We8;
	Thu, 26 Jun 2025 18:36:11 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUrEv-0000000CRva-0FRO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 18:22:27 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-23694cec0feso15176965ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 11:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1750962143; x=1751566943; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mWPkFFmTIdZEAaU2As3DwN6xujYoIXmrnl7uwmSiIkg=;
        b=UhXyiHXh0DigaAV6TVUt9p1EgkQPMvvoltoUiJT5bCGxgV/SxughjasUSE9OUr6Fv9
         h2bos7hAEganjxjBtJrrYswiVUJvTKIUJneoUQqvWX6Qfb9YO79bFHKI7HFf5igLrQNj
         SOk430KPun2UIlQgdf1uqzEOutdEd5mD2ukIRyT4tZ372pvD2h9t2fVIY0RPRK9CqMzs
         dqO6l/l99WajApFyYsOyow/FPdZWsKZHzjzweWYXrSsyz3X7s/Mo79ZFkZEQsxawTzxu
         AaLWw4RE1tGUQmLygzVmZUalz59mbRMZjYYFZlF4gFXsslXLAdWZTMfQJnhbC3EzRUkp
         9tDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750962143; x=1751566943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mWPkFFmTIdZEAaU2As3DwN6xujYoIXmrnl7uwmSiIkg=;
        b=a8qfqMSvngKK6+NToHaUoet3h5wzlaJG7K5A7lU7zrOhcwn/Zk472UB9LTdWfqMP0E
         v9EpFpLaK7kQJH2ofecfBlZYuz8fPL7EMOEU1oR+N2CFS8DoEd1cJgUauoTHaPc2Kf0M
         oIPvPUnsZx6CSDxQWI3daPKgYTT9lpS+wLwyvEqJs3mDlc0faCdD9+QQ7MkOm0E6QNu3
         K+X8XMd0gntIYaJNTsRvDT1QgRhqGn/7haHWZ92D7ONLSUbIv2aCriv5C1PGqn9sUB76
         wSeg0HegAsJdH/d6US9n0KGkf6F/ndhEmrC0odApCzxIGNK8o/b5ieY/QCZt/CNo4d0w
         Cw+w==
X-Forwarded-Encrypted: i=1; AJvYcCVInNaHtIH8CYTRfzYY+Sae+HUXtYkOQ7cqnoZ0Ro0eWGvBEnKHMDYxPYNW9KaYUKJ17a7l2RX1pEMa8peBg65o@lists.infradead.org
X-Gm-Message-State: AOJu0YwDJK/ZaeJQgJdPjsLkVw2e4Q+m2ZwXsYP8CMFTMId7AT0lJrVy
	M1DJ41YJOopuWwSmLIpHUF3k5N6DzcxFGKtJL2AaWUqOxiRnA8rTLN2prdm8g0Hqs8M=
X-Gm-Gg: ASbGnctRfI+d9T8Sciw9gSgqyTORNx9itYKzErqbJFdkOaWSW1DVrgrFFUnjoJhHuER
	+m1cOmWcOaG3YbMDEod4WFwBDXB7RisgFKJV0mn/FGGGAbb8Q/Ey7UpPzCeuhIlBBVuVhHXaKWX
	0SO2TvsUCsB5+kFi0nRfJgmL89ZDCCwSW8ZRWfxxVwxUpIbsVzK/r1YSQtUBG2Nf96FoKqE8t3C
	xSI5Mn2MHDmBafruUbrwDQwYWmvp3Jt/yRFxiDCtsSIMwal4GGvgJDbFk1vz1a161uBLSgsdpap
	Z8NafQSBX+3C3iQZKMTBOI2jrXu6GCTs00iBBQ5yg0TyEMa1b1H0sz0aAmoUYudTKuF4HLD6wmJ
	xXC6fglJgWYuSnnciXBngO4Csg2PSGxbFYaYOc/4nHIgI
X-Google-Smtp-Source: AGHT+IFs4LXLMUtFT0x8igFmtJwtvhLFafnH7Rh09VBF8jTCmNg60iWTU5jnzKU2s9hGJmkA1FJNHQ==
X-Received: by 2002:a17:903:3c4e:b0:236:93cb:48b with SMTP id d9443c01a7336-23ac4680b53mr5089785ad.44.1750962142748;
        Thu, 26 Jun 2025 11:22:22 -0700 (PDT)
Received: from ?IPV6:2804:14d:8084:946d:411e:e43:f1b:c7d3? ([2804:14d:8084:946d:411e:e43:f1b:c7d3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23abe3f859dsm3626425ad.172.2025.06.26.11.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 11:22:22 -0700 (PDT)
Message-ID: <ba35b960-a981-4671-9f7f-060da10feaa1@usp.br>
Date: Thu, 26 Jun 2025 15:22:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] staging: vchiq_arm: Create keep-alive thread during
 probe
To: Stefan Wahren <wahrenst@gmx.net>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
 Ojaswin Mujoo <ojaswin98@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 kernel-list@raspberrypi.com, linux-staging@lists.linux.dev
References: <20250309125014.37166-1-wahrenst@gmx.net>
 <20250309125014.37166-5-wahrenst@gmx.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <maira.canal@usp.br>
In-Reply-To: <20250309125014.37166-5-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_112225_619064_C1600825 
X-CRM114-Status: GOOD (  21.42  )
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

Hi Stefan,

On 09/03/25 09:50, Stefan Wahren wrote:
> Creating the keep-alive thread in vchiq_platform_init_state have
> the following advantages:
> - abort driver probe if kthread_create fails (more consistent behavior)
> - make resource release process easier
> 
> Since vchiq_keepalive_thread_func is defined below
> vchiq_platform_init_state, the latter must be moved.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>   .../interface/vchiq_arm/vchiq_arm.c           | 69 +++++++++----------
>   1 file changed, 34 insertions(+), 35 deletions(-)
> 

After this patch landed on 6.12 stable, I started to observe the
following warning in Mesa CI [1]:

20:07:07.830: [  242.653532] INFO: task vchiq-keep/0:85 blocked for more 
than 120 seconds.
20:07:07.835: [  242.660404]       Not tainted 6.12.34-v8-+ #13
20:07:07.843: [  242.666173] "echo 0 > 
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
20:07:07.852: [  242.677126] task:vchiq-keep/0    state:D stack:0 
pid:85    tgid:85    ppid:2      flags:0x00000008
20:07:07.854: [  242.690734] Call trace:
20:07:07.857: [  242.693191]  __switch_to+0x188/0x230
20:07:07.858: [  242.697010]  __schedule+0xa54/0xb28
20:07:07.859: [  242.704889]  schedule+0x80/0x120
20:07:07.859: [  242.712581]  schedule_preempt_disabled+0x30/0x50
20:07:07.860: [  242.721437]  kthread+0xd4/0x1a0
20:07:07.861: [  242.724606]  ret_from_fork+0x10/0x20

If I revert this patch, I no longer get those warnings. From that, I was
wondering: is it possible that in some scenarios, we might never
actually get to the connected state and therefore, we wouldn't wake up
the kthread that we created when we initialized the state?

[1] https://gitlab.freedesktop.org/mairacanal/mesa/-/jobs/78940369

Best Regards,
- Maíra

> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 0c7ea2d0ee85..64f9536f1232 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -280,29 +280,6 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
>   	return 0;
>   }
> 
> -int
> -vchiq_platform_init_state(struct vchiq_state *state)
> -{
> -	struct vchiq_arm_state *platform_state;
> -
> -	platform_state = devm_kzalloc(state->dev, sizeof(*platform_state), GFP_KERNEL);
> -	if (!platform_state)
> -		return -ENOMEM;
> -
> -	rwlock_init(&platform_state->susp_res_lock);
> -
> -	init_completion(&platform_state->ka_evt);
> -	atomic_set(&platform_state->ka_use_count, 0);
> -	atomic_set(&platform_state->ka_use_ack_count, 0);
> -	atomic_set(&platform_state->ka_release_count, 0);
> -
> -	platform_state->state = state;
> -
> -	state->platform_state = (struct opaque_platform_state *)platform_state;
> -
> -	return 0;
> -}
> -
>   static struct vchiq_arm_state *vchiq_platform_get_arm_state(struct vchiq_state *state)
>   {
>   	return (struct vchiq_arm_state *)state->platform_state;
> @@ -1011,6 +988,39 @@ vchiq_keepalive_thread_func(void *v)
>   	return 0;
>   }
> 
> +int
> +vchiq_platform_init_state(struct vchiq_state *state)
> +{
> +	struct vchiq_arm_state *platform_state;
> +	char threadname[16];
> +
> +	platform_state = devm_kzalloc(state->dev, sizeof(*platform_state), GFP_KERNEL);
> +	if (!platform_state)
> +		return -ENOMEM;
> +
> +	snprintf(threadname, sizeof(threadname), "vchiq-keep/%d",
> +		 state->id);
> +	platform_state->ka_thread = kthread_create(&vchiq_keepalive_thread_func,
> +						   (void *)state, threadname);
> +	if (IS_ERR(platform_state->ka_thread)) {
> +		dev_err(state->dev, "couldn't create thread %s\n", threadname);
> +		return PTR_ERR(platform_state->ka_thread);
> +	}
> +
> +	rwlock_init(&platform_state->susp_res_lock);
> +
> +	init_completion(&platform_state->ka_evt);
> +	atomic_set(&platform_state->ka_use_count, 0);
> +	atomic_set(&platform_state->ka_use_ack_count, 0);
> +	atomic_set(&platform_state->ka_release_count, 0);
> +
> +	platform_state->state = state;
> +
> +	state->platform_state = (struct opaque_platform_state *)platform_state;
> +
> +	return 0;
> +}
> +
>   int
>   vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
>   		   enum USE_TYPE_E use_type)
> @@ -1331,7 +1341,6 @@ void vchiq_platform_conn_state_changed(struct vchiq_state *state,
>   				       enum vchiq_connstate newstate)
>   {
>   	struct vchiq_arm_state *arm_state = vchiq_platform_get_arm_state(state);
> -	char threadname[16];
> 
>   	dev_dbg(state->dev, "suspend: %d: %s->%s\n",
>   		state->id, get_conn_state_name(oldstate), get_conn_state_name(newstate));
> @@ -1346,17 +1355,7 @@ void vchiq_platform_conn_state_changed(struct vchiq_state *state,
> 
>   	arm_state->first_connect = 1;
>   	write_unlock_bh(&arm_state->susp_res_lock);
> -	snprintf(threadname, sizeof(threadname), "vchiq-keep/%d",
> -		 state->id);
> -	arm_state->ka_thread = kthread_create(&vchiq_keepalive_thread_func,
> -					      (void *)state,
> -					      threadname);
> -	if (IS_ERR(arm_state->ka_thread)) {
> -		dev_err(state->dev, "suspend: Couldn't create thread %s\n",
> -			threadname);
> -	} else {
> -		wake_up_process(arm_state->ka_thread);
> -	}
> +	wake_up_process(arm_state->ka_thread);
>   }
> 
>   static const struct of_device_id vchiq_of_match[] = {
> --
> 2.34.1
> 
> 


