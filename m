Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEEDC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 10:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9V+xJJn9UsK/pVyATCRXO2AUd9gyP/u93ItX0cM/Mvo=; b=N4ipssvNrVkufUbQip3Kk/qdqB
	YHWdAkDI56UBkAV0IZ0uJ+q1EU8JTWzhKI8i3XuIwE5aduBPOgZkrDykcn5Boc1I5RtWkHB/rlkLZ
	1TZCheW8yK/Po5U5mmf1r8m17sayCwC+Im2vDQe3gbxXSkxzxNdteXujX3TQH3Y82mGPSFAEaqk7/
	Ks0iAgdJ/q556BS7UyitAMmeLolMl2MRZyjkFINt8+bYsHY+qAylRTzANQLd4NMhgAF1pF9ETY0Ht
	IUFc77/VNMgjTXK+SF0xzncPEZuxAiq/TvQibHtoN+jRIJ7FP/eX1NTgdEBSWUdJjGGY/MT5trMxN
	/UUP4uxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAQvf-0000000FAdO-1m0B;
	Thu, 01 May 2025 10:14:07 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAQtI-0000000FAGy-3OFq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 10:11:41 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39c266c1389so559608f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 03:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746094298; x=1746699098; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9V+xJJn9UsK/pVyATCRXO2AUd9gyP/u93ItX0cM/Mvo=;
        b=Sq/Us1hS5dkT+H6tpz8fBBGM4pBtRALiJIpwg5Yx0hBlpJ5fx/433vWAnufYCnbXuD
         aWTQi0/yxqJnIJkzKYuRZGP6ZnurD/p9hxROnwRWjrdD/pyzenj8kjuYpETnmf8wlLa/
         n6XJUDmtvitbQ/eICMBHfcYtgtmOC5POtkiiatZU/b30tehW9Lbp/196bdmI5pselFFH
         FB1mD+mywQ3u3wIZXiGTOL/NN3T+HMb3rMjNFLrF55WUwtmPx27ctlWzpaT2tzc9WbIZ
         u7PoSBnlS4lRd254TITBLSyhKecI2vshHcwmygB2opj4eWhWRRS8PbYRm/VT2kgabpCn
         neqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746094298; x=1746699098;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9V+xJJn9UsK/pVyATCRXO2AUd9gyP/u93ItX0cM/Mvo=;
        b=IFW2zhIgkgXFEMDeLpK1bjfqzeoVz9kpv6kcQ7P6f8r3Qi97CQHZ70bURJMw4PecWi
         xVoaasaEUdDaNrNuNcOVI97o6njsHz2+7LkLS3sjMV+UC5H9n+Xa4Hao26CchiV96Q+p
         5gAP0dSj0yG+xwu36Sbiqq1zFOMTVQWa4XIPGjLd4DerI/Xp/fP3YnHQvGtGWCdrur7f
         yViQe6WbZ/AidOsE8UuUX3r5Kff8FJTgUPMmirvzVq6QZdduLCgCImIsyVh0SDNxKZcj
         XI3RTSBJVETykgxEiDnJxh0qZ8SMEBk+7Qzv9UlS2MyqQMkOSQHN5N+Ogs1ktpT3vY8w
         1DqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNzsdj1rTrPr08Pa02NW//KQnlTc4DFucyOpeBGRYU8nIxpyolnavn+9OFijGv3NbaVTRpzlmTAL2P2wc7HoYl@lists.infradead.org
X-Gm-Message-State: AOJu0YxsOi2OaaLV87X+CvvcZguUkVtZ+1D4hYrBJzZrkhscrS2iyJsm
	IzRrW6P+MYSM9aFrHIsFchsepJQcwpDyXdm1RlvvwbWHX3xE2pqW1eW7WvOYcKo=
X-Gm-Gg: ASbGnctTVD0vELtshOlNPiuWiQn/ObdaJNvXbtGxK6rdXj0K5OzB9BzoapK5g5OqhNH
	XEatbBZDmHNYC2CeM/l0XRdEOZpDARKnHt+1Mtz1ThVqKo5ny+UTuV4jC9n82ujuNRoPPo/YWET
	W1jC9A8C7eRVvvgn38ILTUe2WjBxxS0UadCMMsxVuuUWY/aU32d3/KxSYpFYKSlzojbtIiFTk4d
	Ddk7Y3Gzo2/l3E5NsIJiy6t/UxNLKd+qSu8K5Sc52fXhKeGKcEU+T3C7zcsrtx6yuqSv9MeZ9T/
	Np+bauqONuBsPXLCh++wpZ8hKW0EsSRv5AgyysogKd8=
X-Google-Smtp-Source: AGHT+IGdqR8qzjYLlpQD4/uFhernwMAGhF3KyzSPj/rMCAGy6rGk1PYMRuH4BRffLmFXhwB8a2kWkQ==
X-Received: by 2002:a05:6000:2203:b0:390:f2f1:2a17 with SMTP id ffacd0b85a97d-3a09417d67dmr1700384f8f.53.1746094298398;
        Thu, 01 May 2025 03:11:38 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a4b968sm440260f8f.45.2025.05.01.03.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 03:11:37 -0700 (PDT)
Message-ID: <2ef27237-e5b4-4c9c-9810-9d1800d96596@linaro.org>
Date: Thu, 1 May 2025 11:11:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Arm CoreSight: Support AUX pause and resume
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
References: <20250401180708.385396-1-leo.yan@arm.com>
Content-Language: en-US
Cc: Mike Leach <mike.leach@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250401180708.385396-1-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_031140_868012_58E70BD8 
X-CRM114-Status: GOOD (  19.58  )
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



On 01/04/2025 7:07 pm, Leo Yan wrote:
> This series is to enable AUX pause and resume on Arm CoreSight.
> 
> The first patch extracts the trace unit controlling operations to two
> functions.  These two functions will be used by AUX pause and resume.
> 
> Patches 02 and 03 change the ETMv4 driver to prepare callback functions
> for AUX pause and resume.
> 
> Patch 04 changes the ETM perf layer to support AUX pause and resume in a
> perf session.  The patch 05 re-enables sinks after buffer update, based
> on it, the patch 06 updates buffer on AUX pause occasion, which can
> mitigate the trace data lose issue.
> 
> Patch 07 documents the AUX pause usages with Arm CoreSight.
> 
> This patch set has been verified on the Hikey960 board.
> 
> It is suggested to disable CPUIdle (add `nohlt` option in Linux command
> line) when verifying this series.  ETM and funnel drivers are found
> issues during CPU suspend and resume which will be addressed separately.
> 
> Changes from v3:
> - Re-enabled sink in buffer update callbacks (Suzuki).
> 
> Changes from v2:
> - Rebased on CoreSight next branch.
> - Dropped the uAPI 'update_buf_on_pause' and updated document
>    respectively (Suzuki).
> - Renamed ETM callbacks to .pause_perf() and .resume_perf() (Suzuki).
> - Minor improvement for error handling in the AUX resume flow.
> 
> Changes from v1:
> - Added validation function pointers in pause and resume APIs (Mike).
> 
> 
> Leo Yan (7):
>    coresight: etm4x: Extract the trace unit controlling
>    coresight: Introduce pause and resume APIs for source
>    coresight: etm4x: Hook pause and resume callbacks
>    coresight: perf: Support AUX trace pause and resume
>    coresight: tmc: Re-enable sink after buffer update
>    coresight: perf: Update buffer on AUX pause
>    Documentation: coresight: Document AUX pause and resume
> 
>   Documentation/trace/coresight/coresight-perf.rst   |  31 +++++++++
>   drivers/hwtracing/coresight/coresight-core.c       |  22 +++++++
>   drivers/hwtracing/coresight/coresight-etm-perf.c   |  84 +++++++++++++++++++++++-
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 143 +++++++++++++++++++++++++++++------------
>   drivers/hwtracing/coresight/coresight-etm4x.h      |   2 +
>   drivers/hwtracing/coresight/coresight-priv.h       |   2 +
>   drivers/hwtracing/coresight/coresight-tmc-etf.c    |   9 +++
>   drivers/hwtracing/coresight/coresight-tmc-etr.c    |  10 +++
>   include/linux/coresight.h                          |   4 ++
>   9 files changed, 265 insertions(+), 42 deletions(-)
> 

Reviewed-by: James Clark <james.clark@linaro.org>


