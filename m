Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0E1C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 04:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QO+zu628e71NdcN+8zZrldfWoYIRQKoPd1ObPN5VIh0=; b=wUvnT/VauoaUkuNI9TvjIx2qFv
	9DUeaFZU+8bXLeyJHcJKDlnXtzcoRo4mA/NvTvFINorLlDkTjMUIfKf8p6r0iaF8BuNNwcwpoPZP8
	dDqIA6FNC+pfENZHq85d8ZxnFdHGEaJMfZg73b1XOPv2+hFFDS+DO4xcizAMIowZjfBO1sftoVCe1
	BMJyagNuau/zoMr3rXtaRS8+RAydsOT3l8TVo2AH0cU3pgV/1NtEJuv6S9n8bm9fIVg9kxpcz+qEI
	T3fKLqhasXH5y9pOEcXF96Wp4VMSC6MseR3H9zl88mwGvod3k1MxJIrzC4mGLveVm/U9c1iZc637d
	gcOZLpww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tinhQ-0000000DdgU-1Ufu;
	Fri, 14 Feb 2025 04:53:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tinex-0000000DdFS-3vN2
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Feb 2025 04:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QO+zu628e71NdcN+8zZrldfWoYIRQKoPd1ObPN5VIh0=; b=ECx/CjZEvII5+T/2c34L8vUbDR
	AvHhhwlyiFQDpWqxjIbNdxoR3QiLjX3pEI6uzxFhI6HSbCdtA/raUMIiExveI36H3J4WC4sx7nG9c
	mnJdOYC2Z8HV3ghPk7S8IQj9e7yFN1w/i9fStmgCyx/FlFA940EuHIF2BH3x96ObaYrlxDNUW7+WS
	WmsYo0whUdUVXHhLIhR7cdv+kOqqEukcKF6Q5Fx7zR6GD/Akgt6IH0R/Fm5L5jRwMM2YAw5p1sEV5
	NyPpNcvd8ga73xgu5xP1BQTxW9RZgzMNOLmvWmCc97Ph4viKerrWN2UTVIKhhvKb33kGxrstuPtF+
	gK/gpLoA==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tineu-00000001BFc-2AUK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 04:50:38 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-220dc3831e3so19269005ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 20:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739508633; x=1740113433; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QO+zu628e71NdcN+8zZrldfWoYIRQKoPd1ObPN5VIh0=;
        b=KKzTLyzbFtFCFj5OCvVCqngPaqHtMbP/D0WU/SPDe7B2J+9+DV0ygE55EE96iS7FLG
         kBYqmwMtFR7XEkieqv6EZ97RuVeI4LDiIPQwJ8BjxQ+YKvhy4CXeThRFcOP4o5DuMFp5
         53Aywki7A2bS574IudvmKzM/9vsWYOaz1hwJRRtxU1R8BRPD6a84tIysRWaHtXbRYkkW
         jBRCGz9w8KwDLdy0HyEHu4b4xUQ0FOfvoJyxKvAT4fYrjN4ON2zJl3wJrspDc3Km8piv
         tOvTh4BxqI+luq8nwCmDCfMbJeY84v8HkNEzILZL8YObIWh2MVosKTA8LKbmCJbfCr9s
         RgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739508633; x=1740113433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QO+zu628e71NdcN+8zZrldfWoYIRQKoPd1ObPN5VIh0=;
        b=lJterDho2rW2O+vBvsyHR+j0O1KZtx3nqcEUtMCArqjHgKSQcX411awFzfZOw1LNa5
         rTmopykhHFitXi0DmHfdRdIvUGofEUQYW+CieljYln70wOfnBGyJuR6gHebp55hGuRGP
         sNdsvC0ud8kQ/NoKe1uDxWukJwmyAi0qwL+6kPpcL/rAzicVRBF05swfpEMLs+ujWyWc
         A5oCVadlSSMTV1f7uphG1Ox/jxB1VWvHKHfQvN3HRKHcPdhjJ8KC6fimllRE5WlHzX+x
         MrNSafnrQxRGEv25w2Lro/BMlwx3SQLQZ5uzu6cEKBgRpZBosdQj6RMvfRT/OehZ/aQ0
         danQ==
X-Gm-Message-State: AOJu0Yz3sMHdkflKcoZdFTkbmms/YSF7ThCuVuOuC4lPvaK+mpXSv24E
	cpXqQLy+KyMbh0P/2/Kpd5HC8sE8nfFBSWdhh0L5syPiH42b8Z1tlC9EhOriaeSetaFOCV99iVF
	1
X-Gm-Gg: ASbGnctYoZvF+3m6dpSHpKpk9SpEU3Ds/630zIi82fTm9huuQfJqTOtzebrnZzvU8sw
	5cv/tyeMev3HkmuPUXLK1e87aSpq9ndmIMOv/HTjQUX6HAR1oiUfitbULxEyyiS7H8LVOJSKaIA
	MoGVgR9KA05SmkjsAekRt8qt003fc2JivZXOIJgzesGiSfSwl93GAmYSuqJ4cK9hZj2+SKOYHJf
	xvScp7DPgjybXeOjxBz2R3GWbrfpwdIfSOJ9Esb0Ozd12s9oAb0rf8cWclMNbXOTj0AHyWAYR+H
	zfFlnqrri9lqMUb1QA==
X-Google-Smtp-Source: AGHT+IEu0lDtclxbef6UwbmqEzWYZeKYwYx7xgSjvSbLYwRCBVDhhxMCDEy15vcZ987LsGRPTI7VuA==
X-Received: by 2002:a05:6a00:3e0b:b0:730:940f:4fbf with SMTP id d2e1a72fcca58-7323c8dd0cdmr9141926b3a.2.1739508633461;
        Thu, 13 Feb 2025 20:50:33 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324d5d4608sm728338b3a.129.2025.02.13.20.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 20:50:33 -0800 (PST)
Date: Fri, 14 Feb 2025 10:20:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/18] firmware: arm_ffa: Refactor addition of
 partition information into XArray
Message-ID: <20250214045030.mfegbypq27gdl6sg@vireshk-i7>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
 <20250131-ffa_updates-v2-6-544ba4e35387@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131-ffa_updates-v2-6-544ba4e35387@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_045036_752113_652A3E69 
X-CRM114-Status: GOOD (  11.02  )
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

On 31-01-25, 11:24, Sudeep Holla wrote:
> @@ -1461,39 +1480,18 @@ static int ffa_setup_partitions(void)
>  		    !(tpbuf->properties & FFA_PARTITION_AARCH64_EXEC))
>  			ffa_mode_32bit_set(ffa_dev);
>  
> -		info = kzalloc(sizeof(*info), GFP_KERNEL);
> -		if (!info) {
> +		if (ffa_xa_add_partition_info(ffa_dev->vm_id)) {
>  			ffa_device_unregister(ffa_dev);
>  			continue;
>  		}
> -		rwlock_init(&info->rw_lock);
> -		ret = xa_insert(&drv_info->partition_info, tpbuf->id,
> -				info, GFP_KERNEL);
> -		if (ret) {
> -			pr_err("%s: failed to save partition ID 0x%x - ret:%d\n",
> -			       __func__, tpbuf->id, ret);
> -			ffa_device_unregister(ffa_dev);
> -			kfree(info);
> -		}
> +

Why extra blank line here ?

>  	}

-- 
viresh

