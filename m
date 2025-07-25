Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7825EC87FCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 08:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fiOi7M9IeQ+/7DA3YnW9XKEAkbfV4pJGPhG8hDHADkI=; b=QepQyoGD1P4VHAG18+s68KCFJW
	fwaroEj/8KKnzo+rH8F1FrJThtBMGD3fxJn+KurB3g3/0q2H2ICBkMEt+WolwHABsZwHJL/Lwbk+I
	WvTsfJTOrCQD4UT8Bwc0SLpLUXVq/QAhK3/leP81oLmhMnfXh1o8w+Cd1pDnMtKFr5qWrWg03UObJ
	uAyX5uDK9MysIK1Lw8gQPiJwSDGIojQ7TB6dn/vmAgXJrZS95XHJeyRYTCw9wDAKb/Hy5pe6v1bHa
	tAmh5FSSOyxsbFBo2++5sFwPN0RuC7/UTJ9OuKBGLgDkaol1ljmS6vpSCbbPLn5RSGA+MTmkP6Vdm
	2swL0wnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufE60-00000009O83-1RJy;
	Fri, 25 Jul 2025 08:48:04 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufE3X-00000009Ntx-2Ogk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 08:45:32 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so1236025f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 01:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753433129; x=1754037929; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fiOi7M9IeQ+/7DA3YnW9XKEAkbfV4pJGPhG8hDHADkI=;
        b=RhS+X/sh+OHNyW4FQIX0a39m2irKvRfuYfe1oP9hBehbS6a8IbIF2ZXmalLHbVC4mV
         8SxQ+Wj81pDA6yg/zXJWHANC7o0aXOlivtLZjNm77JcJGBNDTSTlD/fPPtC5G+0ozDlK
         LCj/Vg9MOS6fjY/OVhfO9+5mAu0j1O6OOHK4qweVIVPbnejhYHcz1EG9YbD+QruOTzLK
         QHayL9H4SY8c8+tzjhLR5/9F0sQKj6KGk9NGgn6GyZoIuuI841V8ywEiLrhlS+k4cPtg
         bVjscxWaX+tVxsaeTrFiL+E1kiy0XUUAoahw+7dgjbKAGu8jM6p0+75Ba1OuUIorVL5Z
         tSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753433129; x=1754037929;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fiOi7M9IeQ+/7DA3YnW9XKEAkbfV4pJGPhG8hDHADkI=;
        b=RX8dmwf27Nwe/PL82wH4jfwJeN5dgAgk7RXYOQ0Pew4Y6zLuqZyNKngNwZye17uVrK
         ueU+in/o6uwI1yI4vNYMw7TatXSzE590T6p5sjs+l7NiOMVrpt67ygLzzxn1Rvlonk2o
         y8+bNoDeB4NTzOcwqV1+BvyLhLIr2Bz/1RmuBOnbpzlbbkjIn0o2eOm1Wos6TecyNry6
         O+5E0VDxXnxTAtsKv1uMf22rReZspnpB9OsfcY+imAgcMhMXuWG9xw15WvIqFCi/z1eS
         4e03JWFF4jtN7CLMhyVC59hLeSOEwpkwELJS7drpG+dIPg1huJzoDx9ZpDzBhuaX8rbr
         jwjw==
X-Forwarded-Encrypted: i=1; AJvYcCXa8jhwCTBUuE0Fm2nAHdvrbyhaGqpnIKZHOxUSuEJa00jNrzblQUYkz0D0N2OqZjxTCq1Z2mnDXihAeO3t8C0w@lists.infradead.org
X-Gm-Message-State: AOJu0YzMby0HLHzKy5/EohX9HbbJ8zNGrP6iSQSJ0tJFnnEWSsDK/pCM
	YraymFaAl4HLxojQ96fhT56R9XWoIjqPNyy4tuvT+5iY17Yco1ynow2yao69gasUv8g/dIPxWS3
	8XXZwMHc=
X-Gm-Gg: ASbGncsg5hjTZXeE1JdGIqRetgOh6MONHXE+PMpT5YivomAI5Wc/EV3hagxCjGaiEUJ
	h2rIJGaDb2NUlhIvBTkSM4jh+oz75tMubR4GSmOtUIcFxbL6wrdkscIFhBZxU9TRE1I6xNrDL8p
	OjPx7ezeJAjVLLhJbExdelmIywITguhOE5ku3zb1Z3uMKkhfOf9lhFgWmDZmn4ENDG6qgiYRTnh
	tuK1oi3nfWW1aJ/Zp04tug7GczA4kLr5AfXmYxepH/cFVgXPhkeevvajByGAqBo1JydHQotvmLx
	DbC+P2kBTRhfulenia3Ub00kn3sfX1FJvYHZOnts7Wc81Rd+v2O1dE3aUqYcnZiOzsNgGE35JUm
	9fp8gmXdjb9kmTpZ3UyY66bs9no0=
X-Google-Smtp-Source: AGHT+IGr0PvB3BndUJjSS9kG3O/gNXghvVYeFYDKeqpUNDpaISXj6KCONZSa8uNvTsi4A58GUNun/w==
X-Received: by 2002:a05:6000:4021:b0:3a5:8991:64b7 with SMTP id ffacd0b85a97d-3b77137beefmr3824470f8f.26.1753433129557;
        Fri, 25 Jul 2025 01:45:29 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b773768440sm2731164f8f.24.2025.07.25.01.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 01:45:29 -0700 (PDT)
Message-ID: <4c1161d3-fc7d-4b3c-8197-7b632e85280f@linaro.org>
Date: Fri, 25 Jul 2025 09:45:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/10] coresight: Fix and improve clock usage
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20250724-arm_cs_fix_clock_v4-v5-0-63f648dae021@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250724-arm_cs_fix_clock_v4-v5-0-63f648dae021@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_014531_620266_BBF0CB4D 
X-CRM114-Status: GOOD (  22.49  )
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



On 24/07/2025 4:22 pm, Leo Yan wrote:
> This series fixes and improves clock usage in the Arm CoreSight drivers.
> 
> Based on the DT binding documents, the trace clock (atclk) is defined in
> some CoreSight modules, but support is absent. In most cases, the issue
> is hidden because the atclk clock is shared by multiple CoreSight
> modules and the clock is enabled anyway by other drivers. The first
> three patches address this issue.
> 
> The programming clock (pclk) management in CoreSight drivers does not
> use the devm_XXX() variant APIs, the drivers needs to manually disable
> and release clocks for errors and for normal module exit.  However, the
> drivers miss to disable clocks during module exit. The atclk may also
> not be disabled in CoreSight drivers during module exit. By using devm
> APIs, patches 04 and 05 fix clock disabling issues.
> 
> Another issue is pclk might be enabled twice in init phase - once by
> AMBA bus driver, and again by CoreSight drivers. This is fixed in
> patch 06.
> 
> Patches 07 to 10 refactor the clock related code. Patch 07 consolidates
> the clock initialization into a central place. Patch 08 polishes driver
> data allocation. Patch 09 makes the clock enabling sequence consistent.
> Patch 09 removes redundant condition checks and adds error handling in
> runtime PM.
> 
> This series has been verified on Arm64 Juno platform, for both DT and
> ACPI modes.
> 

Tested on N1SDP with ACPI:

Tested-by: James Clark <james.clark@linaro.org>

> ---
> Changes in v5:
> - Skip clock management for ACPI devices (Suzuki).
> - Link to v4: https://lore.kernel.org/r/20250627-arm_cs_fix_clock_v4-v4-0-0ce0009c38f8@arm.com
> 
> Changes in v4:
> - Separated patch 07 into two patches, one is for clock consolidation
>    and another is for polishing driver data allocation (Anshuman).
> 
> Changes in v3:
> - Updated subjects for patches 04 and 05 (Anshuman).
> - Refined condition checking "if (dev_is_amba(dev))" in patch 07
>    (Anshuman).
> 
> ---
> Leo Yan (10):
>        coresight: tmc: Support atclk
>        coresight: catu: Support atclk
>        coresight: etm4x: Support atclk
>        coresight: Appropriately disable programming clocks
>        coresight: Appropriately disable trace bus clocks
>        coresight: Avoid enable programming clock duplicately
>        coresight: Consolidate clock enabling
>        coresight: Refactor driver data allocation
>        coresight: Make clock sequence consistent
>        coresight: Refactor runtime PM
> 
>   drivers/hwtracing/coresight/coresight-catu.c       | 53 ++++++++---------
>   drivers/hwtracing/coresight/coresight-catu.h       |  1 +
>   drivers/hwtracing/coresight/coresight-core.c       | 48 ++++++++++++++++
>   drivers/hwtracing/coresight/coresight-cpu-debug.c  | 41 +++++---------
>   drivers/hwtracing/coresight/coresight-ctcu-core.c  | 24 +++-----
>   drivers/hwtracing/coresight/coresight-etb10.c      | 18 ++----
>   drivers/hwtracing/coresight/coresight-etm3x-core.c | 17 ++----
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 32 ++++++-----
>   drivers/hwtracing/coresight/coresight-etm4x.h      |  4 +-
>   drivers/hwtracing/coresight/coresight-funnel.c     | 66 ++++++++--------------
>   drivers/hwtracing/coresight/coresight-replicator.c | 63 ++++++++-------------
>   drivers/hwtracing/coresight/coresight-stm.c        | 34 +++++------
>   drivers/hwtracing/coresight/coresight-tmc-core.c   | 48 ++++++++--------
>   drivers/hwtracing/coresight/coresight-tmc.h        |  2 +
>   drivers/hwtracing/coresight/coresight-tpiu.c       | 36 +++++-------
>   include/linux/coresight.h                          | 31 +---------
>   16 files changed, 228 insertions(+), 290 deletions(-)
> ---
> base-commit: a80198ba650f50d266d7fc4a6c5262df9970f9f2
> change-id: 20250627-arm_cs_fix_clock_v4-e24b1e1f8920
> 
> Best regards,


