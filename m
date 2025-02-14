Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28956C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 11:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NT8ucoFGL5fcDV7bVgoLmkubOhcY55Tclpx4BNfINtQ=; b=S5xSnzHJa4GbRbuQnstzeLgXPa
	UigOsaiQZ3NnBjQ/ZffKygBy1cN1cE5eX9QVIWMFnJjR1Lb8cYwou1rSSLU9BGswO9Oru/ISI1QYM
	NR0S5JxijHQ7yPc2QQtaxAnd6WXWlEXPjtSA6QdtwlbNpD7FgKeuCETCG1nEdZriW9sUYMwNbOrwt
	eMUltC4ZB988FHMpPBl/jgi5AYAE8OgJ54/osWzrYzdWkdh5mLYeKGURpqUsnDr/jR89CtipHF3D8
	vD7ooOjlhOatDtxcayh80NzFZooWHqIhROOkCBWC/ufcDZdxzD73Y0h0hCti4YmwCXnZH42MxuMhR
	OtRrlXPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiuDF-0000000EkBh-2zRR;
	Fri, 14 Feb 2025 11:50:29 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1titzk-0000000EhOz-2DR6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 11:36:34 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2fbf5c2f72dso3104684a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 03:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739532991; x=1740137791; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NT8ucoFGL5fcDV7bVgoLmkubOhcY55Tclpx4BNfINtQ=;
        b=MRiCGKlyvjHBiER0PPvs3NnOzg4bRtUUIct4Hz/PBKwvvBvi01FuQui/BlsdTRIVCN
         NLtKoL591Ae2jDnOGY4tLJNvr7/1RBwzMNglluU9Ge6gV2SGh9bxPiSh4JKULnjBgxf8
         CWDF4rJtb1B/RfRWbqbcauP4Z8+qkkXEw4iVttYlbphtLsiHXfENlkRqQ/ZRUmjJ2o3W
         sIdj7ISooP0ztF7f+kO/XnfxY74ZZgcqUIg75popBR05RU2SHu5G28Bn0gU+V1pLyLv4
         WJh89tG4vPk9bBDBlfHpL6rw5kr2Vuz0G5Ma0qVMiN+3x55E+mXL8wtYYXP+jsSgi/zx
         KGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739532991; x=1740137791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NT8ucoFGL5fcDV7bVgoLmkubOhcY55Tclpx4BNfINtQ=;
        b=Wmkh5FyTbNz02xZp5zmRoUq640XfwHcPnvyaMEosP2IRakMw16s/R1nWkpc+ygTIIp
         6nUL9+DcIJiJrSucevsLQ7B0T8oXH7XrGPG7weu5piEqdY0EiU8lY40YrbKfNUIqoNwj
         98wgOt+8ZGV2TcZqRihuN6wY82FXwkMYIV2NIF9NiM6YA/td3R5BAijtM20xHYUcQLyH
         z4c0SljxMKaFbi0Exse9g/+1tllOsWZlW1UFDh3cNzieKpXkezPpIcZAK4QzdF4pKaed
         wCLIFi/4QLGk4vrsgkXcB7iidESoUFIb2AoIA/1vQeR0HtRtP+qae2LmFlgB1uMMhHib
         FV2w==
X-Gm-Message-State: AOJu0Yym/yAo++g9JgkP/6TOx+zlPtkFH9ayrwHEVUIModgT8Wtx5w8w
	YjvwrlSIEZdIOPpXL7muOy/+4ZXTiOYUlBqWuwrHxttZ1igWqHJHrZNIytB9D58=
X-Gm-Gg: ASbGnct8hAj24l28zdjf/U5LhulFrzZLwNcCKgcKVYjrHJz6TJf84xyBD4qQksXKLcr
	7QRoHS79SdJT1VVj/ymy0PzIhVNkMQ5YxQtbAAO5laR6Xm3axbATRtLE4Gbz80eoBPInzwUI3Gt
	RaHFg8bUoBkeYb6lAqWCsRgjoPxsI7gK2fjoJd1xO7TY1t8G4TueiFkNEYmo5frPfHw0cBuPqxj
	JaaZb3EJJJPIREhY372fede8U37uwDX4zRkuqkcC617fKkwGoW1xfLJYN50VvFyvUbEgxr4JTm6
	WU1jCRJi02UkCITSBw==
X-Google-Smtp-Source: AGHT+IEVjN7F7pP/eIsuym2NKFVRaVxEi7sl8PyzIjEMUxWZ54kTqt4ELJYKQfkUDGvLsxVdCr6aKg==
X-Received: by 2002:a17:90b:2dc3:b0:2ee:acb4:fecd with SMTP id 98e67ed59e1d1-2fbf5bf358fmr16875208a91.9.1739532991069;
        Fri, 14 Feb 2025 03:36:31 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5585708sm27058975ad.217.2025.02.14.03.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 03:36:30 -0800 (PST)
Date: Fri, 14 Feb 2025 17:06:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/18] firmware: arm_ffa: Framework notification
 support + other updates and fixes
Message-ID: <20250214113628.djl7uq6kpwut7yax@vireshk-i7>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_033632_579386_9E788A35 
X-CRM114-Status: GOOD (  19.05  )
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
> This bundle of changes mainly have FF-A framework notification support
> along with other minor updates and fixes.
> 
> It adds support to allow multiple UUIDs per partition to register
> individual SRI callback, to handle Rx buffer full framework notification
> in particular and general framework/interface to extend in the future.
> 
> It also adds support for passing UUID in FFA_MSG_SEND2 which improves
> the multiple UUID/services per partition support in the driver and
> an helper to check if a partition can receive REQUEST2 messages or not.
> 
> It also improves cleaning up the partitions by adding unregistration of
> the devices as well as handles the presence of host partition in the
> partition info.
> 
> It also contain fixes big-endian support in couple of functions:
> __ffa_partition_info_regs_get() and __ffa_partition_info_get().
> Big-endian support is still not complete. Only these changes can be
> verified at the moment without any additional application or testing
> support changes.
> 
> Regarding the FF-A versions, it upgrades the driver version to v1.2
> and rejects any higher major version than the driver version as
> incompatible.
> 
> It also fixes the mis-alignment with sync_send_receive{,2} function
> prototypes.
> 
> It replaces UUID buffer to standard UUID format in the ffa_partition_info
> structure and fixes a typo in some FF-A bus macros.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Tested-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

