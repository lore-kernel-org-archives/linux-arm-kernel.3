Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCDCCA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 10:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fsEC2ObM81Hk4wNSJw0hwoJxDbidZYEWvF/d0koOBjc=; b=4kCGoT4YeIVWNb2qPlkM4t7vcu
	A+2ngihgumCuwDcJSnVinVlHEadyTaboiH99GzOv9W2B53DdRwWh3aDvNLMrd5xWdQBhOgCBy2Roo
	qI7NIEN//cS/WBljjkpkhtrFjuwJZ2LFHt/osB5//2zXvq5FnZtYSfiD1WQkglINubcgSVs3OWEzY
	GXV8yOLs79XDef9lLFakVJLz5z03phZmMWYljwmo8pxUOR5loF8bNt1C5NJrkJPtT6r5rANODMrsq
	5WOFRTBFkbCpIunF1vVbMFcir0m/OqLGY5RqkZa/CInyymo8an3QdZlYS1p6hZDlV7GcZ8mPbynkH
	7XW2T9+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCE7G-00000008W9E-0gir;
	Thu, 01 Oct 2026 10:34:18 +0000
Received: from mail-ej2-x0f.google.com ([2a00:1450:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCE7D-00000008W8j-05tX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 10:34:16 +0000
Received: by mail-ej2-x0f.google.com with SMTP id a640c23a62f3a-c2e27d11f43so94990866b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 03:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790850853; x=1791455653; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fsEC2ObM81Hk4wNSJw0hwoJxDbidZYEWvF/d0koOBjc=;
        b=C1OF6OULJ/mn6TXsCF55p6hK/cgJF0u/Kyuq02vsZ4ZeJfq2aY0tjFENp3zV6gXaIH
         gb9W4/wagALz+V8kEMsWvVaqBGWWv7R/JDO7yRaDpUIxZAttfpc0F2fc6HLrCmpEM4qQ
         8VbH1LNF5Jdkcpu0kOn/9SwSja/1tKSC7hYBuAv6khTLLwN84S991BaMD03vwnkGcI2K
         T+7yZJ88LMIiUKZEaF9wktj04kp+dVGmS+0CbYljnx8jvRJ05e1GMwCJyvWrVYVrMTIO
         eTdEcuCNsoUKU0UrMKhm5aZYEER1fAGuG7HVTnT8Q9PV0Gyt/UtXW9zHMxoZ8SnEae08
         tiyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790850853; x=1791455653;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fsEC2ObM81Hk4wNSJw0hwoJxDbidZYEWvF/d0koOBjc=;
        b=mT1WB9KcsN8u/0n03dVuRYMh9AjdiHePOoLS3pZuso2ADwmH/ze12RQM6BxK7P+luv
         IyoSJRbE9exHpk/pcMT9wKHpApjXRCxD/WL5yeUQQ1Y0EOoCuU1k+mXHOilNtu2ugFg0
         bMTmMb1bjg6tTK1qyUsMXabI2/60U/vs9e3IgHHAVtU1npCo/nkjwH4b4hKXv1P67rY5
         E4E8wa0PtoYQMJSGuEi+NU/8oZzZ9vf7KIagVhgS8iYXJHW/0PuflkUtLaHFzphiGKyU
         uHQTM3MJwVjMUFCkaPw5oWZMcBQX6nJDEr4VaNXf8cNkvSZAmSVM37HvdrADc9THVB0H
         OboA==
X-Forwarded-Encrypted: i=1; AKwUvBxedl4RLSWgG27v85kl542Vo6Ul78oqALCvBJOP+I0OAKCuQLkcnST8SZsvHGMIQbSEz7LkSfgrfBSRy+mnGVPm@lists.infradead.org
X-Gm-Message-State: AFuF++nEMjJuxpsw/FhxGVYL57rFADpjpVes9QdL3bYOU5Y1GW0uS1bL
	2oa9a9Gnf8FjWCvCPtbPGLELf2Uyl1+F2IeTwgir7uLVlEa9DZGw9dMCzuL4uu0zP74=
X-Gm-Gg: AYBFou2eNhLISozag5xMKVPnFWNk0Wtgwy/EoJ74kvt4NmaKsXiC1cXOF/5esfbUyAP
	BtBHimqcXsb/a2QD0cGBLHFFqjBRd9jz/E4HRIQnPE1ZCCABECSa5pD4R7De4XTUikrMxGf94+1
	5YwCUGWhpR6P+WB6tpOGgVaXgUSTa6MTd3FYuGaHccw7LjAFIEbREOT2hFr71sQC9bOKfZSkotW
	7GYwVi9GImX84Q/kXKpgow4qHb5nffnvWqfEuPtsSDIpGG/DZ9isNOalDcMdf2E5WhJC/PXWfPS
	2jyz+sgk0j8H1vNIK7gto3mmEd/A2IZCHvCf2+SaJGyeWabVIijVXaniLtJL8z1u1DZGV8xa/Hn
	CpgeN+/DyHPu3VaUR0mi+g4m5q44ZHkFyDsavFM2S2s7VdGEruWO1o1X0RR4aalSD3utilW6Fp3
	7XnUjQrwSfVtw5PDjwyC6G1eGAq+NUJBBXNc397lQGOOi3Pvc2W498avV80x6MGry8bVreZ8QwJ
	5Y=
X-Received: by 2002:a17:907:7287:b0:c2d:d4dd:8b5 with SMTP id a640c23a62f3a-c2e33e610bdmr207503066b.19.1790850853125;
        Thu, 01 Oct 2026 03:34:13 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31a3eb32sm135974866b.3.2026.10.01.03.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 03:34:12 -0700 (PDT)
Message-ID: <dc7a2922-bee7-42d1-b4a0-7469cd06f4b5@linaro.org>
Date: Thu, 1 Oct 2026 11:34:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] perf: cs-etm: Don't add global v0 HW_IDs to
 unformatted queues
To: Leo Yan <leo.yan@arm.com>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Suyash Mahar <smahar@meta.com>,
 Amir Ayupov <aaupov@fb.com>, Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260821-james-cs-hw_id-output-failure-v1-0-9d532ddabcc3@linaro.org>
 <20260821-james-cs-hw_id-output-failure-v1-1-9d532ddabcc3@linaro.org>
 <20260904164309.GZ8904@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260904164309.GZ8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_033415_089067_DFE518CF 
X-CRM114-Status: GOOD (  15.75  )
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



On 04/09/2026 17:43, Leo Yan wrote:
> On Fri, Aug 21, 2026 at 10:50:29AM +0100, James Clark wrote:
>> In the case of mixed formatted and unformatted trace with v0 HW_IDs, or
>> no HW_IDs at all resulting in the cs_etm__map_trace_ids_metadata()
>> fallback, formatted queues will write their HW_IDs to unformatted
>> queues.
> 
> I understand a session can support multiple sinks, but I don't expect
> to mix up formatted and unformatted trace (see sinks_compatible()).
> 

But sinks_compatible() is only called multiple times for per-thread 
sessions. For per-CPU, userspace opens separate events per-CPU. If the 
user doesn't specify a sink then the default one is chosen which can be 
a different type for each CPU/path.

> For the mentioned fallback, I am also struggling to establish a case.
> Even AUX_OUTPUT_HW_ID records are absent randomly, I don't think this
> impacts the queue's format initalization, no?

The fallback uses the metadata only, without sink information, which is 
equivalent to v0 records. So it's just another way to trigger the same 
problem.

If you're using global v0 mappings, then we assume that all trace IDs 
are possible in all queues, which results in multiple decoders being 
created and triggers an error in OpenCSD once it sees that being 
combined with unformatted.


