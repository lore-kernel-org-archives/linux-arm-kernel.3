Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFD3CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 14:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JK/Z+bri11S+Q2+9lEL+aRt2H6ClhQSz+SnP/5xTT/Q=; b=Y4XRZBM4n9zAXtMzUnaApOBbY0
	XfBoltYQQr1DJSTjqnCOKwbnIsuGwwUkt5917LpJE8i0kggQSg49+RWYCSLFp86cKXhoYQxD+mEuz
	Glk5x762hYnZKu+9SgvzuPebFT9xIH7UkyBpq6LZ7PNlUOJl49YVfNMzKIjh24rldtf0Ra5Ix9Sfx
	SCsi+h/3+/Lxi56VtE6Zxph6JDU3D8k3AVSV8Zrn6krxzJx4eQpRGl9h//0jl4f8a0UoTZ4Ke0kEp
	e3bHNCZiLk53xlj3ukx2dV4fKyVdC4C4LArEMru9ZyYOkJafMeGV9mO+aiILtVjeT4WN/GmWs4jKd
	4izto1jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8mz-0000000Gs6h-2lAp;
	Thu, 04 Jun 2026 14:11:17 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8mx-0000000Gs68-3Zj1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 14:11:17 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-beb1bee8c16so93077366b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 07:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780582274; x=1781187074; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JK/Z+bri11S+Q2+9lEL+aRt2H6ClhQSz+SnP/5xTT/Q=;
        b=hqy5n1GLfixIbiGwy6ywCruKdDYNt6O58fis2Fz6nyfIvUDjYVRNOVCttZuADAA96s
         j7DqkF0Qkjkp7/AYvWC6PbwdTGGUSP2Vzdd50CdX5tu9JICh0Gb8/+cqlHY7+hTO0n+L
         7+LgIQo1bVE5ZviWT/t/aY71OftSRDqUpxMEzRUwfGN006BWmARdbFqHiACuBycjgw+L
         MHHrKQRwfHJgAlS4pPErI6/HbfZ4jki0uvsel0Nghy+AQ4CXGmtA0W7NIGQSH+VL5ft+
         je/bVAgsETFepQv7LZnQ177we2KEoe1IN37Gf59bUOa7jfTI8H7s8evD835Ql0zkXJGp
         8Teg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780582274; x=1781187074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JK/Z+bri11S+Q2+9lEL+aRt2H6ClhQSz+SnP/5xTT/Q=;
        b=UVG5mXn/2s2P73ksV354VRa5AGgGHvBEeKsT/brf5o8Fzhi82ez49scoWceznqHb31
         V6KfTtH8f1K3GAcSEfPT74XiKBwHKdkCnbX2AcXvo4PRup3RU7Zj1za4bOlQ+GvkjbtM
         B6b/YN10x4WfP+dqXKfRNXvYXh2wraX++Bca3FkDyswwZgWe6hdhHRitO9QY2TzPOIwR
         jag5EBer3y3zR3594Uoqge+S9ul+nuvMdjgK0waITuyAdHdpmEL60jIZveS7cXRRvuc7
         +w0ZCvotFaRfZDWawThgeu78TbqZJxKFUUATjc0HVyRpYjXxRa/jHSCCDoOU5+mUNqHi
         wMfQ==
X-Gm-Message-State: AOJu0YyV2UERWyJNAHC8TqzYAUmjYet+o9s/UPHBu1iDXKxy9106nkED
	6kL0dsdd7d9lk7X3+c4uddB/bjg2CihDL40O2CrcORn6Dgk9s4JwwOQ4nZnXI+Sgy3M=
X-Gm-Gg: Acq92OH7cEIM7gdi/Bm0LaRCn4wgKYRfjKFdILtqpPzgv61WovZ6QxMigvtAGhq4dGb
	RwOMnW2MmigouAh8FlXz6eDQx46xrcEDDk4vDITjkhyIl/8kXQ26F2d9gRdySrZL+qm213gcps0
	RdItW3ZHaIvA9rNMNm+7iaUpl6xASGjovpNYfjbEu/fb6piwiWsROI7g9UslV3y/HivVnhIwmoO
	h8YyBYLOm8QBa9ZEzTtJKTLJCcHKED7ukRJaVtHk5NivHu0cgDnekNpvvqA9gPhqHcCyN/cXtzS
	ALScQAlrTcOvzD1dYj0ZeyRnp2heS6gi8kv2fLzLuPrFKgtxd1iK5uHDSrqDJFSYRM9ZX4ypyXh
	X2fYAkd2ricE6TpT0mdU+ZTNOMmtuyRoiY9K63drh0w/xy9q0TPTcipihTKCqx4uQZN72zGg5L7
	70GrY5bJHtSrUmCQB0bXlRX6YtcmWVDOaB+WERc2A=
X-Received: by 2002:a17:906:8a74:b0:bed:83ee:9224 with SMTP id a640c23a62f3a-bf1d1b8ad87mr130727066b.8.1780582273741;
        Thu, 04 Jun 2026 07:11:13 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05208e897sm307332366b.25.2026.06.04.07.11.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 07:11:13 -0700 (PDT)
Message-ID: <02fe627c-9a98-4de2-9bf4-6ce35bb470db@linaro.org>
Date: Thu, 4 Jun 2026 15:11:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] perf cs-etm: Refactor instruction size handling
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, Leo Yan <leo.yan@linux.dev>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>,
 Paschalis Mpeis <paschalis.mpeis@arm.com>, Amir Ayupov <aaupov@fb.com>
References: <20260526-b4-arm_cs_callchain_support_v1-v6-0-f9f49f53c9dd@arm.com>
 <20260526-b4-arm_cs_callchain_support_v1-v6-2-f9f49f53c9dd@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260526-b4-arm_cs_callchain_support_v1-v6-2-f9f49f53c9dd@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_071115_914602_4DC73F0C 
X-CRM114-Status: GOOD (  21.66  )
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



On 26/05/2026 5:59 pm, Leo Yan wrote:
> From: Leo Yan <leo.yan@linaro.org>
> 
> This patch introduces a new function cs_etm__instr_size() to calculate
> the instruction size based on ISA type and instruction address.
> 
> Given the trace data can be MB and most likely that will be A64/A32 on
> a lot of platforms, cs_etm__instr_addr() keeps a single ISA type check
> for A64/A32 and executes an optimized calculation (addr + offset * 4).
> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/cs-etm.c | 44 +++++++++++++++++++++++---------------------
>   1 file changed, 23 insertions(+), 21 deletions(-)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index ab79d08f5a6095448470e2c3ec85ff3db2fb5634..5bff8811d61e423463b7bd4e20d599d5b5307a1a 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -1347,6 +1347,17 @@ static inline int cs_etm__t32_instr_size(struct cs_etm_queue *etmq,
>   	return ((instrBytes[1] & 0xF8) >= 0xE8) ? 4 : 2;
>   }
>   
> +static inline int cs_etm__instr_size(struct cs_etm_queue *etmq,
> +				     u8 trace_chan_id,
> +				     enum cs_etm_isa isa, u64 addr)
> +{
> +	if (isa == CS_ETM_ISA_T32)
> +		return cs_etm__t32_instr_size(etmq, trace_chan_id, addr);
> +
> +	/* Otherwise, 4-byte instruction size for A32/A64 */
> +	return 4;
> +}
> +
>   static inline u64 cs_etm__first_executed_instr(struct cs_etm_packet *packet)
>   {
>   	/*
> @@ -1375,19 +1386,18 @@ static inline u64 cs_etm__instr_addr(struct cs_etm_queue *etmq,
>   				     const struct cs_etm_packet *packet,
>   				     u64 offset)
>   {
> -	if (packet->isa == CS_ETM_ISA_T32) {
> -		u64 addr = packet->start_addr;
> +	u64 addr = packet->start_addr;
>   
> -		while (offset) {
> -			addr += cs_etm__t32_instr_size(etmq,
> -						       trace_chan_id, addr);
> -			offset--;
> -		}
> -		return addr;
> -	}
> +	/* 4-byte instruction size for A32/A64 */
> +	if (packet->isa == CS_ETM_ISA_A64 || packet->isa == CS_ETM_ISA_A32)
> +		return addr + offset * 4;
>   
> -	/* Assume a 4 byte instruction size (A32/A64) */
> -	return packet->start_addr + offset * 4;
> +	while (offset) {
> +		addr += cs_etm__instr_size(etmq, trace_chan_id,
> +					   packet->isa, addr);
> +		offset--;
> +	}
> +	return addr;
>   }
>   
>   static void cs_etm__update_last_branch_rb(struct cs_etm_queue *etmq,
> @@ -1540,16 +1550,8 @@ static void cs_etm__copy_insn(struct cs_etm_queue *etmq,
>   		return;
>   	}
>   
> -	/*
> -	 * T32 instruction size might be 32-bit or 16-bit, decide by calling
> -	 * cs_etm__t32_instr_size().
> -	 */
> -	if (packet->isa == CS_ETM_ISA_T32)
> -		sample->insn_len = cs_etm__t32_instr_size(etmq, trace_chan_id,
> -							  sample->ip);
> -	/* Otherwise, A64 and A32 instruction size are always 32-bit. */
> -	else
> -		sample->insn_len = 4;
> +	sample->insn_len = cs_etm__instr_size(etmq, trace_chan_id,
> +					      packet->isa, sample->ip);
>   
>   	cs_etm__mem_access(etmq, trace_chan_id, sample->ip, sample->insn_len,
>   			   (void *)sample->insn, 0);
> 

Reviewed-by: James Clark <james.clark@linaro.org>


