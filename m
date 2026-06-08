Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AF6CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 18:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ruO8SnBumLZRLs1kOpD88cW4Qstol4o2xlBdcC+hpIQ=; b=XmEAd45RFRo0TRjovvvFcKINm7
	z3RDKPVFXS+nuQNoHUg8zTP4u6HIjJ8DsVxs98zwA5ZlHkgX6ho6wRm101SGzzP9+Xyn7d7/csugr
	Cn6V4NopnmfWAgd09FMRlqBTwsNonVSlT9aNtYUhkvHVIpwYaDUF1iM3DVayhru6zpTiqHRItgQLL
	mvnddhO7rpSeLzAvCAj9wwdB67nRwJXjKkOHVyu/0/5hV5l7uzs/M0D+WGGShp1DSvMAaC6WoQ543
	Gz8ShA2ol8bgubdP4Rw4EjvEAVURl6+Y3APIFik3S3FsIMjkfjb9rU5w+KHmzgV0mkrwiQQDYYh+2
	qT8gkGxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWeMz-00000004FOb-1QZG;
	Mon, 08 Jun 2026 18:06:41 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWeMx-00000004FNr-2BbF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 18:06:40 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-4602e2a0372so3277666f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 11:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780941998; x=1781546798; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ruO8SnBumLZRLs1kOpD88cW4Qstol4o2xlBdcC+hpIQ=;
        b=T0FNAKG8PyxDmyAMXGdTGhtlAxj+VrUMcrxvLIwUv0lITzW/Wwv6O373vx/Y5vnaWo
         dYvEskhQYV+B+ecD02MTRF/BNOPKCuyj6R0e4k9qDpSvF0qlBJdVa5SHGB/n78RRHEUT
         OgoLA7YPE5QpiDz5Pa8RLMcgWDoMCea2yTa1DEg1MZ37Cgxb9WdinJNRldpyL23EyOMG
         2VcM0pMCcGzndI4ZytptP/sQkjaGC7U4HO/ludVkrkxYTnFMVxBkPUxwiaf8CQebRzrM
         8seNm6qsxRAqZk3R6tblpC4SVhHtjaIV66UmOxOAS7crk9EiGW+hK03eXszJSUmXhF1T
         bKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780941998; x=1781546798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ruO8SnBumLZRLs1kOpD88cW4Qstol4o2xlBdcC+hpIQ=;
        b=TQK9wzPQ9u7MGqmv8TUoUd90zb5P09URRBFgnfv42JflRa+pQz6Bu2Ckb67EX19Ldh
         nWeXfSkd/MG3vvJvYdgVLbs6Lv4Hg0A4GFDURO76pFOXjR/RddLSedHVtLpATpgBwvQ5
         0uuVnOG8yeWO1fXZ+98t/LLwo4pZ3IKmLdR08cArreRa3vnbusxGauA/u5yMBxaW2svP
         UeIyIvRgxTNWDyz6MRLNlnLIoQmuVddUCD4im5JQLA363jIVVSmtAf3AS9SXKLzb1Mbt
         jmMw2lThlFFTNDZAg6vcMlRrOav2pmOAGYusHRE8+9xTF9Qjy0ufQN2u17bEJalmK3gF
         +tNw==
X-Forwarded-Encrypted: i=1; AFNElJ9iCjvKxsNI4+CuYU3pYuENBoS5ZKpkWmzCyc7TFfTIKIxv/WxmIgDwuhAZ/wzaKI5hh5Zkl/xGrney+2aASOTk@lists.infradead.org
X-Gm-Message-State: AOJu0YzlJb8gjzaKp0Mln7UB4BnwxqxEUSuHhxXBZS6kHHLtPA50dTh5
	AHgZUJFmyiLQ5JXsEUZ/BSwBW2xeMMqLD33llioD478BoZBkfoCNvSauquQpw6UOBp0=
X-Gm-Gg: Acq92OHGdqz4TLyhZxBDsieFd50Wh6KutSWXaYpHHGTZ/G0VL/YDH4q44KIq3HQwmVq
	aAjMrYbnXHg2Ok4n+61w3EFl0u4bikbiZCwd+KxOSOfLYAwGeiqZHJvC/EpKmBljoG/GBfyiN1x
	wTcqYk9IrSmzghOEoYRnyYFm0eh4shB8cPOUKieTkTbawZ9rK54G9ELZGk1ANzR+/KzlRY7GPcX
	VRhR5qzxKLDv68UE43ctTuXU8E5tBdOGxMDczGjLXkdhjy+zw4uwFsoRNiMqh+G1MSOgcy4ESq9
	zf8pc4l5Ym2LkmHlITHluezkSHMXreOgwZZHOQcx45GKjEQdcg25g2vpsRnpCLP/KtWujv69+YZ
	P/FRhQ7S0SPR0an6nvhJV3Iz53F7RdpQ3Pr/uWlE318Kd944inQPinR6kDRsBTcczIdbgHemH2m
	l/Q4hgfvWZsy/uUuWN0HsjN3TVz7zTqU/2nt4rpMg=
X-Received: by 2002:a05:6000:468d:b0:446:db72:e8ec with SMTP id ffacd0b85a97d-46030643609mr17198053f8f.23.1780941997560;
        Mon, 08 Jun 2026 11:06:37 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm54421372f8f.2.2026.06.08.11.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 11:06:36 -0700 (PDT)
Message-ID: <48f06bc5-0283-4720-a5e5-843af16cb9dd@linaro.org>
Date: Mon, 8 Jun 2026 19:06:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] perf: Use a union to clear branch entry bitfields
To: Puranjay Mohan <puranjay@kernel.org>, bpf@vger.kernel.org
Cc: Puranjay Mohan <puranjay12@gmail.com>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Leo Yan <leo.yan@arm.com>,
 Rob Herring <robh@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Shuah Khan <shuah@kernel.org>,
 Breno Leitao <leitao@debian.org>, Ravi Bangoria <ravi.bangoria@amd.com>,
 Stephane Eranian <eranian@google.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Usama Arif
 <usama.arif@linux.dev>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20260527121207.2312181-1-puranjay@kernel.org>
 <20260527121207.2312181-3-puranjay@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260527121207.2312181-3-puranjay@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_110639_612880_767E6747 
X-CRM114-Status: GOOD (  22.89  )
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



On 27/05/2026 1:11 pm, Puranjay Mohan wrote:
> perf_clear_branch_entry_bitfields() zeroes individual bitfields of struct
> perf_branch_entry but has repeatedly fallen out of sync when new fields
> were added (new_type and priv were missed).
> 
> Wrap the bitfields in an anonymous struct inside a union with a u64
> bitfields member, and clear them all with a single assignment. This
> avoids having to update the clearing function every time a new bitfield
> is added.
> 
> Fixes: bfe4daf850f4 ("perf/core: Add perf_clear_branch_entry_bitfields() helper")
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> ---
>   include/linux/perf_event.h            |  9 +--------
>   include/uapi/linux/perf_event.h       | 25 +++++++++++++++----------
>   tools/include/uapi/linux/perf_event.h | 25 +++++++++++++++----------
>   3 files changed, 31 insertions(+), 28 deletions(-)
> 
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 48d851fbd8ea..f7360c43f902 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -1474,14 +1474,7 @@ static inline u32 perf_sample_data_size(struct perf_sample_data *data,
>    */
>   static inline void perf_clear_branch_entry_bitfields(struct perf_branch_entry *br)
>   {
> -	br->mispred	= 0;
> -	br->predicted	= 0;
> -	br->in_tx	= 0;
> -	br->abort	= 0;
> -	br->cycles	= 0;
> -	br->type	= 0;
> -	br->spec	= PERF_BR_SPEC_NA;
> -	br->reserved	= 0;
> +	br->bitfields = 0;

The comment above here says:

  * The to and from fields are not cleared because they are
  * systematically modified by caller.

But this is an inline function and the to/from fields are always 
assigned right after calling it. Surely the compiler can work that out 
and this was a premature optimization.

If we rename it to perf_clear_branch_entry() and do:

   *br = (struct perf_branch_entry) {0};

Then we can delete a big comment, remove a potential source of bugs if 
even more members are added, not have to update the uapi headers and 
simplify it instead of working around the original issue.

>   }
>   
>   extern void perf_output_sample(struct perf_output_handle *handle,
> diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
> index fd10aa8d697f..c2e7b1b1c4fa 100644
> --- a/include/uapi/linux/perf_event.h
> +++ b/include/uapi/linux/perf_event.h
> @@ -1491,16 +1491,21 @@ union perf_mem_data_src {
>   struct perf_branch_entry {
>   	__u64	from;
>   	__u64	to;
> -	__u64	mispred   :  1, /* target mispredicted */
> -		predicted :  1, /* target predicted */
> -		in_tx     :  1, /* in transaction */
> -		abort     :  1, /* transaction abort */
> -		cycles    : 16, /* cycle count to last branch */
> -		type      :  4, /* branch type */
> -		spec      :  2, /* branch speculation info */
> -		new_type  :  4, /* additional branch type */
> -		priv      :  3, /* privilege level */
> -		reserved  : 31;
> +	union {
> +		struct {
> +			__u64	mispred   :  1, /* target mispredicted */
> +				predicted :  1, /* target predicted */
> +				in_tx     :  1, /* in transaction */
> +				abort     :  1, /* transaction abort */
> +				cycles    : 16, /* cycle count to last branch */
> +				type      :  4, /* branch type */
> +				spec      :  2, /* branch speculation info */
> +				new_type  :  4, /* additional branch type */
> +				priv      :  3, /* privilege level */
> +				reserved  : 31;
> +		};
> +		__u64	bitfields;
> +	};
>   };
>   
>   /* Size of used info bits in struct perf_branch_entry */
> diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
> index fd10aa8d697f..c2e7b1b1c4fa 100644
> --- a/tools/include/uapi/linux/perf_event.h
> +++ b/tools/include/uapi/linux/perf_event.h
> @@ -1491,16 +1491,21 @@ union perf_mem_data_src {
>   struct perf_branch_entry {
>   	__u64	from;
>   	__u64	to;
> -	__u64	mispred   :  1, /* target mispredicted */
> -		predicted :  1, /* target predicted */
> -		in_tx     :  1, /* in transaction */
> -		abort     :  1, /* transaction abort */
> -		cycles    : 16, /* cycle count to last branch */
> -		type      :  4, /* branch type */
> -		spec      :  2, /* branch speculation info */
> -		new_type  :  4, /* additional branch type */
> -		priv      :  3, /* privilege level */
> -		reserved  : 31;
> +	union {
> +		struct {
> +			__u64	mispred   :  1, /* target mispredicted */
> +				predicted :  1, /* target predicted */
> +				in_tx     :  1, /* in transaction */
> +				abort     :  1, /* transaction abort */
> +				cycles    : 16, /* cycle count to last branch */
> +				type      :  4, /* branch type */
> +				spec      :  2, /* branch speculation info */
> +				new_type  :  4, /* additional branch type */
> +				priv      :  3, /* privilege level */
> +				reserved  : 31;
> +		};
> +		__u64	bitfields;
> +	};
>   };
>   
>   /* Size of used info bits in struct perf_branch_entry */


