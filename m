Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716F0E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 07:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gWUSTVMYq8BWWEAYYe37DF6F5cN3F7NwUno8STAUMA4=; b=RTERkOs9xA1ku/eZqCLhtn/nsO
	gd9yExH8yvxIVSheVBNVCg1SsTtyn2ohPr2T6wxWDtguiL+NhyPS7roRWdVOHjjvoYNbdlOWojJap
	wElgeKgqaFBWvrYpZaX9RbOd4e/jqiVkusuQ7CnsXli0jvTIQpiFD9dHtL+nAk7YGhYAOAOFu9Le8
	7wr8g/nKIt919zdBDNceMI3ZyzH9B3v5uafzot7Vjw0D8MCcjHDHJu0q/oD7Swop2otrES6cRwGla
	w+UB0UE6nZU/vLHalxkxce/RVOS4xBwhrz7KWr8e2SqrMEnBUUNMm5lStLhL1qMFBey3FXAghs6Zu
	Y4lGrHRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLdOs-0000000H8B6-0IN1;
	Thu, 12 Dec 2024 07:14:18 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLdI3-0000000H755-3VgW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 07:07:17 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-728e1799d95so329306b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 23:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733987235; x=1734592035; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gWUSTVMYq8BWWEAYYe37DF6F5cN3F7NwUno8STAUMA4=;
        b=O/RgnZFeHNTivviloSWouyHj9PeUZJbJSqd1p5/+m5dduhcXvZ6gnfJBz03fO28qiz
         fJuCwp32k2mH4BolxuVHJrqzbfMkWW1gxKfNMRjj6fXQFiq+inTyStBv8YyiFR5s+GJD
         ZL9V+JKGW7WLDiHKELHkD9DWCsQaLsYp+9aSMWV/r476DkO2F2UwWvhO1eMcb+BJXzfL
         s8U7aNdef+vIid/u1y2SQ1wgjvlj0Ze+4Z32jJI8VNPCreVjS8sC6rPk14X4N4RD1glJ
         opakxi1S8wn6hQ06xXrGYKoHQoAQCvo1T4FXnNe++n+9IV1rYl76poSBtiq0p30M9oCg
         suvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733987235; x=1734592035;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gWUSTVMYq8BWWEAYYe37DF6F5cN3F7NwUno8STAUMA4=;
        b=V5trmiG+RsdujzAuHnOd2r4sQgH7KDQ67qJkBHo75L8k6cdUsVE7oSbPy+odSZi9Nw
         h6qEBOAn8lcdUCUTAoja15ELOy4b4+RdisC+i0pkfkuSbQqH59bqg4Ry9QegfV6aD1bn
         6XVQNAYa8PpObR47TBIGrD8Y7u17tfSmV+MxlyBF7ZK/jMQVwcDvYiNy96WdUQQT4Dq0
         XIIipsP4gsksWpoe3TqW4mngg4zceuuhUKCanucnPwEOBHz4zbGMug2onhXUUgOEKFvW
         1U+J0s6KwSLhzzBMLhLkr1eqlcgQ1gVY7b7ra9Cri+qE4N1Ijburv+2c4bXh5LsZbGej
         QADA==
X-Forwarded-Encrypted: i=1; AJvYcCVtL7hk9bj2WBKNI9HyO3/UySiYBmpxKKIDQRdoXSvsYdco0DcOl86MTaXD2hMz54g7Nqa1bQlSA4kWBXGx2OlP@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz4LNcmMFjgoJBynNwfiD3l5yt9S5gsXXcjM/3zYoLC8VWekns
	p8HbJdZ6vlUOLlRzLrG5TIrGnZssuMI4Ga2+/jvsTwCluvMirWS3WspoWtBzGeQ=
X-Gm-Gg: ASbGncv/MDy/OdwmYw+ec4UxLyL0LYVfIZwa2Ppp4Zd2NtGcUCHV4o18OtYXE7EpGLb
	9Pb5yhingQLxfixD+D2fm/MrQk7pFtfjOzszqxuacssrD2HbZNdAhhi2xataOAtfREJaS2yNjEa
	8KzhsINpSyqXfBOILuv8a8FaSOYNJXo2AqawTuPxmmAur3pPQSkX1zxzOy3HWoHBJABMoyu6cxh
	uWEZ6ir4RgKNRiMVc9NZBEusy5AVJFA1ubiXsvcwQWj7/M082XCmCx9s9s=
X-Google-Smtp-Source: AGHT+IENxoHonYKam4dKHihrFBZZ3t2m1GlwpQo36E6FIiGVq5NKmR5l1Fyzj203B0EBrt1cbsUdog==
X-Received: by 2002:a05:6a20:7289:b0:1e0:be48:177d with SMTP id adf61e73a8af0-1e1cea52e56mr3771734637.3.1733987234861;
        Wed, 11 Dec 2024 23:07:14 -0800 (PST)
Received: from localhost ([122.172.83.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725d3dd4cbasm8926045b3a.142.2024.12.11.23.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 23:07:14 -0800 (PST)
Date: Thu, 12 Dec 2024 12:37:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: bschnei@gmail.com, Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Benjamin Schneider <ben@bens.haus>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH] cpufreq: enable 1200Mhz clock speed for armada-37xx
Message-ID: <20241212070712.txkxgmiugzji3doz@vireshk-i7>
References: <20241125211452.14987-1-ben@bens.haus>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241125211452.14987-1-ben@bens.haus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_230715_887247_81C08612 
X-CRM114-Status: GOOD (  21.19  )
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

Marek,

On 25-11-24, 13:14, bschnei@gmail.com wrote:
> From: Benjamin Schneider <ben@bens.haus>
> 
> This frequency was disabled because of stability problems whose source could
> not be accurately identified[1]. After seven months of testing, the evidence
> points to an incorrectly configured bootloader as the source of the historical
> instability. Testing was performed on two A3720 devices with this frequency
> enabled and the ondemand policy in use. Marvell merged[2] changes to their
> bootloader source needed to address the stability issue. This driver should
> expose this frequency option to users.
> 
> [1] https://github.com/torvalds/linux/commit/484f2b7c61b9ae58cc00c5127bcbcd9177af8dfe
> [2] https://github.com/MarvellEmbeddedProcessors/mv-ddr-marvell/pull/44
> 
> Signed-off-by: Benjamin Schneider <ben@bens.haus>
> Reviewed-by: Pali Rohár <pali@kernel.org>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  drivers/cpufreq/armada-37xx-cpufreq.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/cpufreq/armada-37xx-cpufreq.c b/drivers/cpufreq/armada-37xx-cpufreq.c
> index bea41ccabf1f..f28a4435fba7 100644
> --- a/drivers/cpufreq/armada-37xx-cpufreq.c
> +++ b/drivers/cpufreq/armada-37xx-cpufreq.c
> @@ -102,11 +102,7 @@ struct armada_37xx_dvfs {
>  };
>  
>  static struct armada_37xx_dvfs armada_37xx_dvfs[] = {
> -	/*
> -	 * The cpufreq scaling for 1.2 GHz variant of the SOC is currently
> -	 * unstable because we do not know how to configure it properly.
> -	 */
> -	/* {.cpu_freq_max = 1200*1000*1000, .divider = {1, 2, 4, 6} }, */
> +	{.cpu_freq_max = 1200*1000*1000, .divider = {1, 2, 4, 6} },
>  	{.cpu_freq_max = 1000*1000*1000, .divider = {1, 2, 4, 5} },
>  	{.cpu_freq_max = 800*1000*1000,  .divider = {1, 2, 3, 4} },
>  	{.cpu_freq_max = 600*1000*1000,  .divider = {2, 4, 5, 6} },

Any inputs on this before I apply it ?

-- 
viresh

