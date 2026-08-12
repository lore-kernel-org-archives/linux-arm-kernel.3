Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E0DC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 13:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DsZokZ/iedv/wv6L1wEU+vbKd+fdKYrALL/Ray13yqY=; b=W5JsO3bSnOTuijSfzI+C703F0y
	5nEoKu21XjNs1S5CWiGbVVWD1+foo/G/0eMV9IkdC7vPgMwwf5P3pXK8QxnEGDgCqfBdlJZ3M0ohJ
	HlZJ/RC0zYQduE5qTNhMA6mc6/9l7PJmWzE1XvCaGCG0gFXWie8CWjWL9dGlIr/8MJCOfLSZyFQmU
	dhNVZWEbHm33u2CnokODaZfl/qS9pnDpq/Ty07Rz0Ky0YqX6qANu4fRbBHONi/oh7BerPB7h89/Ad
	TUM8HSmXqNiz1N1u4p0JZWRtWmEHEkqT3D7+UXMi3pG1VMtmVxr84cyyFjx2bkNpa5B5ISbG3bYOw
	RiyJBcyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8p5-0000000GGRG-1ABn;
	Wed, 12 Aug 2026 13:16:47 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8p3-0000000GGQN-0Fsz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 13:16:46 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so529161f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 06:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786540603; x=1787145403; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DsZokZ/iedv/wv6L1wEU+vbKd+fdKYrALL/Ray13yqY=;
        b=Y+JZswjOuo/fjQvCw8iJ4zjFTAbrFHlS1iZ0f8gjCAsMN/YccIyeYDjzvY/NohvifQ
         q0Vb9eYvwbzZGI67c3HuAOgzldpP2uKTDxm8UBTKzYvuu8pmC3mcBWTEvZcB3fwmSDOR
         Vp4Ww0MI261GGMYlhkrWT8BaE7pVPGxjrFl53VvkdMeyP4qtqG3T/qB4TVAiLcydDzHJ
         Ti8xeuKNJ091YJnZf/O6oTOldjcpKRpzy7n4nBPuzFhp5XoZDOqPOIk9eAwN16u6xwbr
         8hWIHj3vFI02FoF/CO+vHOV+svnb41QK7lqCzOC1TKKJ+x2V3cLItDAXy+ub5XHxylR4
         CQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786540603; x=1787145403;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DsZokZ/iedv/wv6L1wEU+vbKd+fdKYrALL/Ray13yqY=;
        b=OcSUR4CjO8uGTxhsXuprG8e9kUc/ORpVxpq8mmXx0gYosxo0yvmTQMw98MGwJ3ldAy
         8bgdjVo5c8ISxFRuSJmxyeiingzB1qlk+Gzts6bV0o8dCR6cj5cb/rV8X37R4D4eFid5
         GGigLaMoBdBBF2bnWshnrNUpTzcCUElsP4TIQ9YTBjetOAtaaI6zmEVWTKfnrjhfTgvC
         V8sphGMKLtTmexc6pprMg+8iy2m5SEfk/ZDGqbria/nFV+aVFShgxSDh7Jn4SqS8579j
         A7ig8ebE12Frwk3bcyQxKlnYB9t4aGdWAzfV3B8TmkH+trgeXbQPCGyoFHOLFVTJYlXD
         q17w==
X-Forwarded-Encrypted: i=1; AHgh+RqMTfWPKDrs3WmGt+A8Gowdd7rH4uza3r4JC+1ZTbyy6HUJef2S80Sz4D4jJzfCI85fTPtZFWbtVhO1s/J6vziD@lists.infradead.org
X-Gm-Message-State: AOJu0YzOuDp2kasVmPDOLPMp1a65tu464zEJPtNlTMtBekV00aj/UX0z
	uwTyW3baQNafNOSojKzqqSkTR1IRW07okKvppkQya8rqTjiUI+ZKS3U2qYadgKTMz+M=
X-Gm-Gg: AR+sD12P6sllbE4dDHeKNDuHXc0fsFpFpDO4ISoAqkl3XnnmDIQGIfVEc7nFg6p/Bem
	w03SXDEDtKY9KqZAQRnaLoVExvQVwo7ypc/A+ywylx81uVCRAir1hV2p1+3lM2T6vStMJCd3RBO
	UXlb9vs1R9ZoRwhPjopoGlonrfCLtmzqytRiGsT7B28etTttJlRXU4KTcOqFEkw5NFyskM9b+/l
	bRbZ/7kiUMHidjLZTDHoAb9V1MgFzl+0OQPptr+xaxtLzenlHrHwZO5eKsNw45A4FDf7ZBwva8q
	5P2gMWspZjsfPTEPdYJOjL9XkL85e18gEnWGRRSwdF98W6VKKEFgBP7z5bcbQR4m0Ecs7mwwkd1
	JLn3FV1lyG+ua905+KfPWZghwQLYodQcF2bs/2REr2PPCGFCFeIrA0UGWFyb+oSJ9MYO6jVd6LT
	gJsbZ3mcxtE/e5S5F5CBlo7srQschLs9/zpl7pjbH56h1B6POjhekvTUwvsRR0Cp11PQ==
X-Received: by 2002:a05:600c:4504:b0:495:737a:7afe with SMTP id 5b1f17b1804b1-4997c12592cmr68779655e9.15.1786540602720;
        Wed, 12 Aug 2026 06:16:42 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997b34afe3sm57791515e9.2.2026.08.12.06.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 06:16:42 -0700 (PDT)
Message-ID: <274fdcb1-70fa-4976-8f13-bdf6568e12af@linaro.org>
Date: Wed, 12 Aug 2026 14:16:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] perf thread-stack: Report branch stack hw_idx as not
 available
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
 <20260803090640.2412336-2-aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260803090640.2412336-2-aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_061645_231609_C49117D8 
X-CRM114-Status: GOOD (  21.72  )
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
> thread_stack__br_sample() and thread_stack__br_sample_late() fill a
> caller-supplied branch_stack that is typically allocated with zalloc(),
> leaving hw_idx as 0. Zero is a valid hardware index, so consumers that
> honour PERF_SAMPLE_BRANCH_HW_INDEX see a reconstructed branch stack
> claiming to start at LBR TOS entry 0.
> 
> These branch stacks are reconstructed from instruction trace and have no
> hardware index at all. Set hw_idx to -1ULL, which is the established way
> to say "not available" and matches what intel-pt and cs-etm already put
> in the branch stacks they synthesise directly.
> 

This fix makes sense in case someone doesn't overwrite it, but I think 
"matches what cs-etm already puts in the branch stacks" isn't quite 
right. Based on the hw_id docs, cs-etm should be setting 0 shouldn't it?

  * For the architectures whose raw branch records are
  * already stored in age order, the hw_idx should be 0.

-1 "unknown" isn't accurate as we do know what the order is because we 
generate them in order. If anyone is reading the field 0 is much more 
useful than -1.

Can we change cs_etm__synth_branch_sample() to 0 and update this commit 
message to not say that -1 is right for cs-etm?

> Signed-off-by: Amir Ayupov <aaupov@fb.com>
> ---
>   tools/perf/util/thread-stack.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tools/perf/util/thread-stack.c b/tools/perf/util/thread-stack.c
> index c5ce741b07446..1a3dffa83bde2 100644
> --- a/tools/perf/util/thread-stack.c
> +++ b/tools/perf/util/thread-stack.c
> @@ -624,6 +624,7 @@ void thread_stack__br_sample(struct thread *thread, int cpu,
>   	unsigned int nr;
>   
>   	dst->nr = 0;
> +	dst->hw_idx = -1ULL;
>   
>   	if (!ts)
>   		return;
> @@ -686,6 +687,7 @@ void thread_stack__br_sample_late(struct thread *thread, int cpu,
>   	bool start = false;
>   
>   	dst->nr = 0;
> +	dst->hw_idx = -1ULL;
>   
>   	if (!ts)
>   		return;


