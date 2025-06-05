Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2619FC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 14:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zrUi5cv6WmvKUOvdEvSjyHa1HTgMZD5XZ5ETxtLdwo=; b=JDXfzkVzTVnXkMtJf7iNehItN5
	jHXgmr8bb2jA1Whmos7jNJTsqocwMb5qswOcsFPRxxzxHCGsVloyNoIheByDMh/9DD2eO9Y3fEvy3
	CGhu78N1Ifjr4m/rWeAWit8Uo3VOjE6/Radn5M0/0EgAHAbJro40PkU9Xvif+gZYO3rSeOF8mx2FC
	d7JLNfAhtlciYolaPcVmwKQVFuQS6rkWMZoxbZrPIVON0MIX6gA4jH7VZeezJ9GCPElouoVlU2oAe
	MGUVDGgm51XZmrdts18PdL1Euh3o6UM98WfNhMfBjoCGiPABeRudXDmBVFDbg/rlKmvlcrWdoD3ny
	6XlR9FkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNBJP-0000000FjrQ-08tk;
	Thu, 05 Jun 2025 14:11:19 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAzV-0000000Fhbr-24P1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 13:50:46 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-451d54214adso8460975e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 06:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749131443; x=1749736243; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7zrUi5cv6WmvKUOvdEvSjyHa1HTgMZD5XZ5ETxtLdwo=;
        b=tP5XGdeu228SbOcAPqog+GOEjDfyN/BVLho4Ipg2ocnqCTvjCRBY4pXZmCIGhRersR
         yZGHo7svcbOQVrZdtneD/eXtmcnBwC8AMijsAKiC3b+EBmM8/LPqegL++SQhROONsKiU
         Z8L6GGKgFuJ4RtWdTr+1N2AeshOePbB6WhcZoQeDykyWkzQieCkVLaImxRyQId1U/oi3
         pe7tiEXDtLbSnfNJmMjU+DQ+Q3VpmIhos4zanQ9FFhYMRJW2wvY4T5JmV4WhmmROv/Zz
         lQtKUUjaOVA4ikF29ePq0q/MwQ+0z6tL1+gMiK/u6jRqfZ7GRaCFFrFd8507Opix12Lh
         eFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749131443; x=1749736243;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7zrUi5cv6WmvKUOvdEvSjyHa1HTgMZD5XZ5ETxtLdwo=;
        b=veaqhXZfZO4mG7E+uIVk+T2Z88ayU3SBhfxtzm4UP7hlwPRNcRr79eehBdMC07UbFo
         0os2RDG1hoyfbKbfu5ed0neF4BfxYc6QIlKXFAchUbyT2MjGvF2o7W1Y9/kvFC4z5Tjj
         +GmsvAxGMcSk8+mkS8fpmeLRm9S8jtdkH5plL3cLp6+g5B6nhRGE8ylri92vKlFWN5Dl
         +A9oWOjZ+6utdQKi8zcBOnkjzc9XGORmxLyujffs3DVoCf8itsx5mwIDER+R72qQznlr
         x1himk1mKLt2VCOapnPKjGZa/JWPPUuI2wetU1/EunwXsiAAjPYTWnAIqNvmZrNlAqTp
         1wnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/43laJlqNIF0hL20P4CF8pBTOMBfVkdZbiZ4P8BOegWm2uQ06+hHoXu0wn/P9XFCnFov6QIJ9u7PNAzep4Noy@lists.infradead.org
X-Gm-Message-State: AOJu0YyavpQ36eWRejzxkVb9+XHhWczDJeBkY7mvBme4WYCN12V4/4no
	q+NB4B0NiggE5N2N9rnrGYdpm+gEH7NoSRm1skdsACerUWPLkGHHFmCMLuNaEMSkPzmYHXh9CFL
	TUxevf+8=
X-Gm-Gg: ASbGnctuNe3nm1kuoxLbn+0S74Nv1/8sWQ9ZAUEQMNdOe3Dl83CDC8cQCVbgJhoXcrh
	puMasfITRGvZYYxgf8Tm6RwC6OYNtG3XAX1esekp3rzRIweeE1zm4uqW6N/EeLrwzaJPZAaAx53
	uK3zobIN23uujU5gCcawlRreMc2f3F9k1eAE2ufo7A9+kS04ecFbiFvzSxIOADCbJQwe8hktxuX
	8Z0vNxAsoct6DIP3KkbQUIA48pCYAyNdd/gdwalrPY4LkJp7lyg7ba9kXvksh/rq+UGcY1vGr1I
	X9zSJHIiJRxxpgA2AWHghAooYzRKkp7qgfH1m1pte3SrZ87h7Uww/6SmP2ZAZzWHpcc=
X-Google-Smtp-Source: AGHT+IFIIhKCcmom8mdp1AUShBH2bxfbvTwtYDQyJE1UCTRRyhAvqBGXgYyC2tfJmGHzzizRZVCtjQ==
X-Received: by 2002:a05:600c:4446:b0:441:ac58:ead5 with SMTP id 5b1f17b1804b1-451f0b3e164mr76182145e9.31.1749131443334;
        Thu, 05 Jun 2025 06:50:43 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a52a1993ebsm1756368f8f.93.2025.06.05.06.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 06:50:42 -0700 (PDT)
Message-ID: <29c83380-6df4-4c92-a2ab-6af994afea04@linaro.org>
Date: Thu, 5 Jun 2025 14:50:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/11] CoreSight: Refactor CPU PM and hotplug
To: Leo Yan <leo.yan@arm.com>
References: <20250516160742.1200904-1-leo.yan@arm.com>
Content-Language: en-US
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, Yabin Cui <yabinc@google.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250516160742.1200904-1-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_065045_544021_487ED791 
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



On 16/05/2025 5:07 pm, Leo Yan wrote:
> Besides managing tracers (ETM) in CPU PM and hotplug flows, the
> CoreSight framework is found the issues below:
> 
> Firstly, on some hardware platforms, CoreSight links (e.g., funnels and
> replicators, etc) reside in a cluster power domain.  If the cluster is
> powered off, the link components also will lose their context.  In this
> case, Arm CoreSight drivers report errors when detect unpaired self-host
> claim tags.
> 
> Secondly, if a path has been activated from per CPU's tracer (ETM) to
> links and a sink in Sysfs mode, then when the CPU is hot-plugged off,
> only the associated ETM will be disabled.  Afterwards, the links and the
> sink always keep on and no chance to be disabled.
> 
> The last issue was reported by Yabin Cui (Google) that the TRBE driver
> misses to save and restore context during CPU low power states.  As a
> result, it may cause hardware lockup issue on some devices.
> 
> To resolve the power management issues, this series extends CPU power
> management to cover the entire activated path, including links and
> sinks.  It moves CPU PM and hotplug notifiers from the ETMv4 driver to
> the CoreSight core layer.  The core layer has sufficient info to
> maintain activated paths and can traverse the entire path to manipulate
> CoreSight modules accordingly.
> 
> Patch 01 is to fix a bug in ETMv4 save and restore callbacks.
> 
> Patches 02 ~ 06 move CPU PM code from ETMv4 driver to the core layer, and
> extends to maintain activated paths and control links.
> 
> Patches 07 and 08 support save and restore context for per-CPU sink
> (TRBE).  Note, for avoid long latency, system level's sinks in an
> activated path are not touched during CPU suspend and resume.
> 
> Patches 09 ~ 11 move CPU hotplug notifier from ETMv4 driver to the core
> layer.  The entire path will be controlled if the corresponding CPU is
> hot-plugged on or off.
> 
> This series has been verified on Hikey960 for CPUIdle and hotplug.  And
> it is tested on FVP for verifying TRBE with idle states.
> 
> 

Hi Leo,

I ran this stress test on Juno by enabling and disabling concurrently 
with no sleeps:

   # echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
   # while true; do \
         echo 0 > /sys/devices/system/cpu/cpu2/online; \
         echo 1 > /sys/devices/system/cpu/cpu2/online; \
         done &

   # while true; do \
         echo 1 > /sys/bus/coresight/devices/etm2/enable_source; \
         echo 0 > /sys/bus/coresight/devices/etm2/enable_source; \
         done &

I get lots of these:

   coresight tmc_etr0: timeout while waiting for TMC to be Ready
   coresight tmc_etr0: Failed to enable : TMC not ready

And then even after disabling the source and sink the Perf tests don't 
pass anymore:

   # perf test -F -vvv "arm coresight trace"
   --- start ---
   Recording trace (only user mode) with path: CPU0 => tmc_etf0
   Looking at perf.data file for dumping branch samples:
   CoreSight path testing (CPU0 -> tmc_etf0): FAIL

I suppose it's possible this isn't entirely related to your changes, and 
I know we've seen some of those timeout issues before. But it's probably 
worth investigating.

Thanks
James


