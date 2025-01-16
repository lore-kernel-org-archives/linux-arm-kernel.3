Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A1BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 07:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYWyFdBbqjiuqDzR2Q1cokh3LhhNP2cp+Ofhw7ep51Y=; b=rbRZXh8Ijpzm4ZCTBBxF5r9CfX
	f3P6tFTnCC7ifK7+8nGxclvM86Vs/2DFi438jthInFJ/3g/Ol485BymnGfheV8rEbQbqKP3g7BdG9
	KoihlUFYwOMUjBKJ4l+AcGdC/rJzmhI/VZEFOu4NY/Jfzk4HlJqb0tG6V2AtiqzEn4K23beA4vtj2
	O8FjNJE4qJuuMZEJFGzg6OhKhxwzZxth0VP7tMvFxqoWjGMbeEzUl8VdqEjAZ55fHjBUUTpoR3dsw
	WRSfFnYskWscG3PSRB2fMElw1g/4SVX6x78HE6IpvJAS+lLzWXliA+/BHYP+6BF7d28tmhCahysEI
	RFxCHK2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYJrJ-0000000Dzro-0ghs;
	Thu, 16 Jan 2025 07:00:05 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYJq1-0000000DzY4-1TaN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 06:58:47 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21654fdd5daso8808935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 22:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737010724; x=1737615524; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VYWyFdBbqjiuqDzR2Q1cokh3LhhNP2cp+Ofhw7ep51Y=;
        b=VUwJt8S6kcSx4B5QNbnJIwpYr7VwBq03e7BfKv1Dh7oi1ABrwGlybBsp9xLkHhnU0i
         XQFrGAIVWXpTqaeu2O+ONl8Z8ZJ+UygpM1TojOIc3Mar2cy3uP8wNl1wtZH8vSLXcL4/
         Wy/Aj0T1eee/oCkZKjMVJvuBrW+axfNZsxRoCxjfz90rh5tc1Cl1q+l3jxqmDrXDWltF
         RdE3rXuiWPSIcwd5g68K3E6+hz8UK1KEvgQ/JJOo4CNpDHfd2+9GfDG5tdP76dDfIQdm
         d3ssb+TV8VHHQNU9VJCBLSQS9LDRgTK+DVP5tfzRbT3wdF82tMenlNtf9XyjVwfr1ttY
         d3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737010724; x=1737615524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYWyFdBbqjiuqDzR2Q1cokh3LhhNP2cp+Ofhw7ep51Y=;
        b=pRI37uFhdMscmVk30WnkVQQx/U4w/OCdp2+SaJzI76F6817sV3ms9xEKhywQM/cfeQ
         RgK+fBSUW19smNnIuqGcWnGzpRzKJg1YFgsp48mwQayHvzrQjAcgNOk9sIm1LPhVzq8Z
         j9mYHyr4G1NBwBeF7gcco2Kf0gVs2vi69Oy30FUmUrRXnP3PF6E5TwE4USQFthcTA14k
         u8q/7Pgp256rPPtABv0f5rs0G6UsX00zwZRmUpk8qXWlE35rHg8JsEz/RjJqCxnsiAOX
         8BbDoQHQWDUoKJhdIdRxKLHGWhwsbxaC3DzPUmR2T0KAsXevW6FzCGL71zOGhUm6RG+l
         XBAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5hagL78QR+HiAn71LJOyX+AZZvUu84D04PJCCxQ881iRb7T18k5LSGvW/e3VHhfcyrmmL9GyQTWFDyQZ/Bbyg@lists.infradead.org
X-Gm-Message-State: AOJu0YwIJ0oNqEqbN1OZgkJEG7aX5R8S076PS4xFCHor1rR7qwhffNcA
	EKXMyehHAxSgyY9W0T+nGcN/RhadN6ZGZo8AjVuVpKsO0dXJAaUI1d3N74phe//mGg/cq8N9wt/
	e
X-Gm-Gg: ASbGncv9rFDwzh1USWZjk8lKcXQqn6z1amLgGJhaKjRG9tRmyTV23C9LkYTpvy/Rn+j
	ZHJ55MSosI5uBcI9D0YTsLgt489fXBkQyC595otbs4UoHkzdlfDdE6YQdsR4Yq6ywMt5YWBeZbZ
	hISDp1yIMgZng3fLz5rSqXaLOQalQKFTZyX4ZM38buLKDykHZLMTJBHXW+EPTmGxK8JDlWhR605
	UntHEPeTD3rdpytPh1KILa90REygTirVZVhaE06mZ99QV391Ccg7t6m0Vc=
X-Google-Smtp-Source: AGHT+IHfyji9g5xn54wMiDLFR7sjXJGKkSGFZ63K4uaBwze48pman6UBM+98nFzbsHed64ZW1eUo/g==
X-Received: by 2002:a05:6a21:100c:b0:1e0:c50c:9838 with SMTP id adf61e73a8af0-1e88cf7f7b0mr52617165637.6.1737010724117;
        Wed, 15 Jan 2025 22:58:44 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31d5047fd3sm10524095a12.64.2025.01.15.22.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 22:58:43 -0800 (PST)
Date: Thu, 16 Jan 2025 12:28:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_ffa: Add ffa_add_partition_info()
Message-ID: <20250116065841.g3okyvm7se5vcc2m@vireshk-i7>
References: <9967e35eb1cbdb8d0c0bae3f54401d806700e6b6.1732255888.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9967e35eb1cbdb8d0c0bae3f54401d806700e6b6.1732255888.git.viresh.kumar@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_225845_396450_34FBCC83 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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

On 22-11-24, 11:41, Viresh Kumar wrote:
> Move common code to a new routine. No functional change.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  drivers/firmware/arm_ffa/driver.c | 53 ++++++++++++++-----------------
>  1 file changed, 23 insertions(+), 30 deletions(-)

Ping.

-- 
viresh

