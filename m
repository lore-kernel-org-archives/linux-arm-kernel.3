Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15277C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 15:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZ2S+gHwbsXckxzFFhUyQLhk9IBYR1YjauglVfzrk5M=; b=D//Bm6e14MQxJr7CRY3y6cMicI
	xmZiaFP7MhkzXKJKq+IRiq3LmUYYNyxlq3eqk6yUc44lSPnM6529E3NP6s7cTcZSGbRa1yAuwnfRI
	20EC6LeNADkhlpVZoT3fdohFkEocMbvvGTAAlkdThqTBZXeBGX2kbewr4dA9mRHp7J7spSYbaoj5t
	+EfRLsBoF4GJBdoWdIz/3PHhHb6ifVDg5FEx4xnWkFf3XamTp3Za1DsLFH3cMiz5rHW4OmvavBAfz
	TW0xnIjKRpW9TuG6KDUgdR1muMDt/y4guGlRPkW0QcrpSGlqL0ZxizlIgKT/0BzsbM/3AW6jr34sJ
	K75eyzJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpr3r-00000008ZWw-38FJ;
	Wed, 05 Mar 2025 15:53:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpr2H-00000008ZQV-1KYA
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 15:51:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=DZ2S+gHwbsXckxzFFhUyQLhk9IBYR1YjauglVfzrk5M=; b=q0ZXWKKbMRpQgygZCGbfLZOo3X
	RDDbdEl6EE6dY2F2vpIcMna+pz3HQ2UlaCfzrQn54eH11lxXDzGmGEONpHjk2puxTBDYSWGwBaHNA
	Ow8wAcOV6frYqIy0qCU/DgJGPyt93CJSd6Fi78SEjrHpBVHLdzVuZmpxHGhWDksmPnlyHZtO3x7Bj
	RCM/H4D8vKRBIr8pErd0H2PYqe6wOxwE8oNWrVOO/qgaUpVjmlfz2+k9qy99LWI6fAmOwEmmDXWsc
	VNiUi84/mlQq6TbE7QAIW02dK5PzA5AoIgNspa4mkq0MeuV6nOw3rkH5VUpt1l9ClYBW6UJV09HgG
	W/1umk4A==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpr2E-00000005nB5-1nrz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 15:51:52 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43bc4b16135so21793295e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 07:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741189908; x=1741794708; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DZ2S+gHwbsXckxzFFhUyQLhk9IBYR1YjauglVfzrk5M=;
        b=Xl/LogBV2uPdwkMloSUYnMUjJUyT/2q7aCXaftnvK+J8JHZ935Loj9GGW7OrlHLGbK
         tL8yPYsUQ5NA5mJF/RK2EJkUdvcRRMs1dbuuD2cioMNWoWGgppeQj0x/LYI3OXhvrYf6
         Hph8w4904+b9+xFGwEB4ltfssreDCyOpHLNcwbmgH6kHZzJ1ARqcJPLMX/QX3c+HBI/B
         abdzBhA0+sQRfwCG4ErstWn/RzMHYZjnrLzLqFkoHymt1kayh221qdYIHkAruPwhk0XH
         b41Mu6HYpkKAS5kyew2h0XTJb3wrZ+6tDIkKNP/BL0JCgjNPzU4Ns5qI00vXMM2tMpd7
         4+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741189908; x=1741794708;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZ2S+gHwbsXckxzFFhUyQLhk9IBYR1YjauglVfzrk5M=;
        b=wLAZlxQDwG43V0qeWEEonQ/GfXvGWrAmWbnIJMTgkaIWhR3ahwLFhslmHSrbc1shY7
         pMn369v35SIYoIBTwmgls1sS6aDjjr9aFyJ3KAbpsRIquqiMhs6bRQGJtFhyw6Sl4trl
         QXpIQ/EYS8TrBjIi6xx1u3k4kNTf4wNLNmrJZDDuAB5bgq7MHDsFRgPv8/MTYFeMOLjr
         5o8DXjiSy8NAT9cHAa6oK5PQ3JXNreaNafhVS3b23KjV7vrsTGEeaip4Fc8Jv7yGAsUi
         r+yUi3QQYyjJG8bR1EgdFg5uV+aILDkeOQwAGuLko/67bY8n8pOLtdfNK1RbOzzRWPfu
         XKoA==
X-Forwarded-Encrypted: i=1; AJvYcCVKHpycH9Apqrf759nwNi2H/3d38UXn8eeDzrDhHVC3KqAoxQfLb+ONuCMvBHph/gnLNz201aV+W95ibOI1uLv/@lists.infradead.org
X-Gm-Message-State: AOJu0YzHrKWTfzXlt6cFKv+04emcJpXWQ694CbdIW3pgdtByFI+VjVP3
	Qs0CJ8YDXtoigwGB982QglRPluHO+nC49BMOCNu5sRYM67pr8Od9E9oxrhFvHNY=
X-Gm-Gg: ASbGnctvAi4DH05ZeEIMRQAAjR1v45bg/O4VthTt3EmY1YQ+s4t7HvSODvsnC06m06v
	HWTFAyW2k/jxSiUPFaNtYa6hlZ9YVYE+8qRrMFwhDO9NTBNrsXzzgsemFRkJe/J9Qi/q+Xxyi/5
	2kg38uj60xaMccV8arDXwLArLWXDpmP6ltmRkaG1H9Q3SxTd9EIukjGbu2TfIU7jziJsS/CO0Q9
	We5XYYWyg3n0Rn/YneU6C0GO+W9Zb0vUz2oU45UkYVpuy4FyXAvaRhCLB+aEO/p6V9QCsHMaeuH
	5Wm5ZCom0sqHNTKUg9CZU9Xiqkj47Jn7C7UufL0k4e44gGHabQbXhkg=
X-Google-Smtp-Source: AGHT+IG7qv+nb9cXjGGw9HHaPPCvBWbDrCLu9uLjG/6FTP2fC03dynof25NfR+yCRjeYdVlhkyXSaw==
X-Received: by 2002:a05:600c:3b95:b0:43b:cfbb:3806 with SMTP id 5b1f17b1804b1-43bd29d2d84mr29598645e9.14.1741189907949;
        Wed, 05 Mar 2025 07:51:47 -0800 (PST)
Received: from [192.168.1.247] ([209.198.129.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd4352eb1sm20794925e9.31.2025.03.05.07.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 07:51:47 -0800 (PST)
Message-ID: <7ac4947b-76b1-4748-8ea0-a949613a3cfc@linaro.org>
Date: Wed, 5 Mar 2025 15:51:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: docs: Remove target sink from examples
To: coresight@lists.linaro.org
Cc: yeoreum.yun@arm.com, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Leo Yan <leo.yan@linux.dev>, Namhyung Kim <namhyung@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241210144933.295798-1-james.clark@linaro.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241210144933.295798-1-james.clark@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_155150_510255_21388AF2 
X-CRM114-Status: GOOD (  10.28  )
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



On 10/12/2024 2:49 pm, James Clark wrote:
> Previously the sink had to be specified, but now it auto selects one by
> default. Including a sink in the examples causes issues when copy
> pasting the command because it might not work if that sink isn't
> present. Remove the sink from all the basic examples and create a new
> section specifically about overriding the default one.
> 
> Make the text a but more concise now that it's in the advanced section,
> and similarly for removing the old kernel advice.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---

Ping, thanks.

I think Steve's comments are somewhat related, but shouldn't block this 
change going in.


