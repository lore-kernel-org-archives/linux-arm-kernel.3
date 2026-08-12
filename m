Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971EDC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 14:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HpEHIdjrgsJVHjWro/18EmwhZ9NM+fW368nfv0gWPro=; b=grHRcwlCSEmCh/8NmB9OSyjMXk
	cwUtk3MoVLntKl3a/MNEx4Nj436rSbPGl8vOSmN2xbgz0kirJlAKDR4+n9WTEkq+J6fvgwY4vl/1D
	vxmqyWADD/KNFgD+ZktxVvT5NlpPHqm3byeEYt81PpoC2vWJxvNyvkeQQEYqEKOk2JeSgITJ675nv
	JhmOT1nm6AUTPgI5hSFBhkdVXUfnxawSvwEu9HnqmtQARJwDljmlzrUF4/Kcs4kgEqqoIgoGYN20q
	Qw4rSHcCSqExJKclE8ibvA4UjaUAh7twSRuM1vPkNAX3jwjgEBKaexDBq1UrG4f0W5PKXDCWfswnK
	yLx1+Y+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu9ju-0000000GMim-1UQW;
	Wed, 12 Aug 2026 14:15:30 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu9jr-0000000GMi8-2Nd4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 14:15:28 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47f84023916so856982f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 07:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786544126; x=1787148926; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HpEHIdjrgsJVHjWro/18EmwhZ9NM+fW368nfv0gWPro=;
        b=HWXWDigxNlZeRT4ZuTC5L6mHI6tP1IrjXxxLn8LVLrxYA2uc26Jqq9lGAP2AqMS1HS
         eT0HaihzUL0KTZ4dh9rDWAhwnY+UQSaKJ2Jptf4y1oXrIv3faS8GU3FdUSi1WFAWMCJ0
         O7VG6sRv/eDHY0Fre1Jh5ZZ0GUfxOlRe/Ee5BLCWVlySi4COfgNhTIGxW/pj/ZfRdkxd
         yVlquO9HgabGE9EEFuvv/gRT8V4e6/7z+FbdW/ge8WBWsN/VRZYSXdNBnMQwsnrUfX4Q
         jHTVbVw47SByedqXpLKPKRwc1NJ6I50kWH+35NZliXEpIQqRM8Ox4eKnzLHLjbADts+1
         Ze8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786544126; x=1787148926;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HpEHIdjrgsJVHjWro/18EmwhZ9NM+fW368nfv0gWPro=;
        b=P1n+ZFRqygQpKtSPessulMFZHy6MfbnEGLhAwyE5nNR3Or2iFlxQ6d5dsYcG/i/KM4
         U0n7L0IyryxTYUzGFo0QAK9K7t9c3AaeSNnRHfkMqHvJagPwAJr8jQpz1ZedyrdcMss0
         iREGncfjJk0PtSi8xvPnKRVEnAr17AfZUBRMBzp3z3XiN/ldC0F9IBEk2Is+CNFm50f/
         vmeOsebXxoZxBIOLDCkuTuMb1lmPCvsoBHkuG3GqLkfPCxzroI/OjFBNl71zCPq3GB03
         myn6mufr36BLE/zXGCuOhpTEhvjSA4SqMSG3+wXJo7egHXM5CggvBWUXrUUUotrYfvUa
         7eOA==
X-Forwarded-Encrypted: i=1; AHgh+RrG0W69qKXAph3ZGoYj0xg0fWR1LIB/ufF0RJH+69XlwxBL7roVqTiQs5gZ7aZ77eL8L/ONhg3QnHfdTlZ69QCM@lists.infradead.org
X-Gm-Message-State: AOJu0YxThonoIUPrf0+B/oWuTvd/Q6EbQu5m9s7AIoukX2NQTm1yKaLH
	kj5qmqUDPEciTgv6lvZ7e+nCTGFQJmaRRrBQvuCQPXqSTp7QtCqeR2m+Ri/13/TfQ+wPFiIo/Xm
	yZtgmBY8dIg==
X-Gm-Gg: AR+sD12KolXy8Yr7CXP5eJ2S9lOnmZqb3FvQdcDCakBaQVtvJHQlboOLgpBLfGb2XNM
	uq5FUK2pZEUg83HE4Qt5LCYVgUeaCBRDuQtscoa2MEkxjOtX1maJkPzuwClQjXqRVTWDMvKpns8
	bai3/wR8trGYpBe94TJm2l4Waem6F92VLHjV9rL4xe0f3kWm8bcC7ppSD928n7JR2u0KXWxbotU
	Q0bVu8K/eROrdRIO0ibS2U5Yc0yTUMd++fthmqoHh4iLyA81pmqfLPBnSVuDjJZAUdTNhrxtOGo
	/PVrZmrI0mIS5hInNRjGURMmzS+OGRKZxPW4zj+metYL1Y0DcS5uDF8earuDbsC0bV9yeg4ZWkP
	R+ERlcrzqPES1PwM4p3mmugoEycDOqT3jIz1Ed+URS+v2zA8/zsQ8fcyh1W4Q1HnG7qfY8M2kGM
	w7ADfhbckoID6MPl7+swKjqaDo6vsQ6mguH6bCLygaipWBFPI3Rbvh37YM3uweARKIiw==
X-Received: by 2002:a05:6000:606:b0:47d:ee9d:90c8 with SMTP id ffacd0b85a97d-481528ad9cbmr8183311f8f.3.1786544125695;
        Wed, 12 Aug 2026 07:15:25 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d72232sm7848055f8f.37.2026.08.12.07.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 07:15:25 -0700 (PDT)
Message-ID: <80a801e9-5c95-46f6-8ee0-f07a17cfd287@linaro.org>
Date: Wed, 12 Aug 2026 15:15:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] perf test cs-etm: Test branch history on existing
 samples
To: Amir Ayupov <aaupov@fb.com>
Cc: linux-doc@vger.kernel.org, Mike Leach <mike.leach@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Swapnil Sapkal <swapnil.sapkal@amd.com>, linux-perf-users@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, John Garry
 <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>
References: <20260803090640.2412336-1-aaupov@fb.com>
 <20260803090640.2412336-7-aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260803090640.2412336-7-aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_071527_641289_80BB69B0 
X-CRM114-Status: GOOD (  16.57  )
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



On 03/08/2026 10:06, Amir Ayupov wrote:
> Add a CoreSight shell test for --itrace=L. Record timestamped ETM trace
> with explicit -T sample timestamps and AUX pause/resume events, then
> check that the pause samples carry both a multi-frame callchain and a
> non-empty branch stack for each of the workload's two processes.
> 
> Decode the same recording with L4 and L64 and reject any branch stack
> deeper than the requested depth.
> 
> The test skips when cs_etm is absent, when not run as root, or when the
> recording turns out to lack virtual timestamps. It exercises the
> timestamp-gated path and the requested-depth bound; it does not attempt
> to verify that the attached history is correlated to the sample.
> 
> Signed-off-by: Amir Ayupov <aaupov@fb.com>
> ---
>   .../tests/shell/coresight/add_last_branch.sh  | 175 ++++++++++++++++++
>   1 file changed, 175 insertions(+)
>   create mode 100755 tools/perf/tests/shell/coresight/add_last_branch.sh
> 

[...]

> +
> +record_data
> +check_callchains
> +
> +decode 4 "$tmpdir/script-l4"
> +check_process_samples "$tmpdir/script-l4"

Minor nit, but these should be capital L. l is a different option.

> +check_branch_stacks "$tmpdir/script-l4" 4
> +
> +decode 64 "$tmpdir/script-l64"
> +check_process_samples "$tmpdir/script-l64"
> +check_branch_stacks "$tmpdir/script-l64" 64
> +
> +cleanup
> +exit 0


