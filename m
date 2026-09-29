Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CBDCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 14:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xe4sMjFI7Bnhs5VJABLcVxZS9wdqwlCcJPQVGcmwjL0=; b=XrZZ+PdG3hgmXb7GDWN9ovryeK
	hn0aicPRc2EFQGGKtJBD46sGyMPqlATc9VCiqKoGQGJK985gCp68Hodedu844J5cOfwSpGS+EbkDY
	fzayhU4Hxx6fDyVCUjsSqj1zgdqwvFn2eh1GF0stFFHeD+w7mwF7Vr8ZmpFn8K25xR9VeljUZ2SMG
	sf7+FZGhvKTJzwUMveGve9urKmyQGiklhDncfCBeklihlsJ8JqlVa46Y8NSN7p0VU+f2w9sOC4fjS
	cS+5NutN3u+Yrn+fwP9Cpod5ABffxC8NU8CkPT6ofvNbVegNltyGAqx2yfinv9TSg1zYrpyInw8Dj
	+0ySIVVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYVp-00000003kti-3wvq;
	Tue, 29 Sep 2026 14:08:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYVo-00000003ktT-32go
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 14:08:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xe4sMjFI7Bnhs5VJABLcVxZS9wdqwlCcJPQVGcmwjL0=; b=ngj/FJEWFSMtZW7ECVphdZXvr1
	gjguCoTgqA7pKwFQmr6UlY21Y/7w9L38OPqp4LH+L8m5mhTPjZZmLpCyPR4tyOkniUNtax1RXL9t7
	Y6/UeVs563xnfaurkGWQOX4J9XJ7JLMclj67gY1QoTrvKYL7hBYLc3TfdP0EgnhJZhUJs4nWWzFwp
	3qAqx5HBibHkx0Nn+BQVYzq15m2CluUeysR4E1CnoillM0HBxsYIVoTk3l67ptZc1lnbiwbgnQRH4
	kGwhmOF61YGIxE6XJN+YK3Ca1l4dV+eYfkNSbQSGmdvybKKczStRWQK4gLLUqIzhQJVGlJ/OY9N8t
	/5MMDYQw==;
Received: from mail-ed2-x0e.google.com ([2a00:1450:4864:33::e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBYVi-00000002ihs-44Lg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 14:08:50 +0000
Received: by mail-ed2-x0e.google.com with SMTP id 4fb4d7f45d1cf-6aaf688ebb0so5027036a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 07:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790690924; x=1791295724; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xe4sMjFI7Bnhs5VJABLcVxZS9wdqwlCcJPQVGcmwjL0=;
        b=ZJRsaS73xg8D4O840fV/6kULFS9PDVJgif8khdJQl8baSLNa1SUL9kAzyX/YDG8UMf
         0+87ypTRvfXm1GuikqYEF7OY7yIDWVxm9Nfp5wua1zGEWIMD4EljiKTRnSBE5rF8BAGP
         MTRH2tXRmCtyXl5GXJdzGehl99evnwSaerjhVqzKWRE9aT4+X6dCpI3CPcZQiYNGUAxR
         WCGP5eJnBOG4ZmTQ5crvUq/cN8xDT8I7ubglZX4/7oCAJ2RBtNgrbI4QzHSB0ZVvNuV3
         /3mGstNDtOnnVlelY+nN2xKFMFpw40T2SKAv2zxysNGcssaAExKcZ6fUuHJl5OJloWDb
         g6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690924; x=1791295724;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xe4sMjFI7Bnhs5VJABLcVxZS9wdqwlCcJPQVGcmwjL0=;
        b=QQcVnjQfHbo+Eu1cY7K29ovRyhMAi34r0QVm83igt0UcIUX4fenghnviy48v/V0xgb
         qMy1tavojNj5YYKL7QH7Zfyf4dHlEsa0L9hcx+k3zaNDjD/yKXlqz2/vxNtSZtr/k4hi
         fnKbZvYkDY9UbzfiSqlf3Q2b8g9btg0oejOEQlVSLBzbB3cO+4J0ZLod3v7yMwFKj2un
         TZptvfoGu/7P2fItZHK+/Bg3lvbQhe4DbletnXKvVvUUjCUkPEo7vL/jcQje0s7L4Hhj
         4Zfco8glrQYdPOXns7ylHOo9LMQsKe6uw/Y0Hd/l8okFlyOKBoO9uVhFAYIUfwuuZtke
         +O9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwCPpbG+PoWi6CnRzBl6BRZb1TVSo/6fh8zS5JZv09CMVgjQBtZPDJ1yv0y/nSKVpVocg9UZYLxzJhMFbNOpCRx@lists.infradead.org
X-Gm-Message-State: AFuF++mrUtPrAdhg8Xv/Qht1LLKVscmgc7iGXF7VneBQm+tOS7Y0x4KD
	syYOkX4R+52HT6KJ8niIhPZBdp98jTAsLywROwIuumrVMaoIKyUky9qT15A/IvyZH/8=
X-Gm-Gg: AYBFou2M+uFnX9B7DDFNGi7K2MYribvR1SfzcXvgRhiYcn/EzKU9PAbXKL7GxmlEv38
	xDgYfp5jZWmhFE/XXQT8uJkOCynlN824p89BW1t84zor2JqvIqZjYm42cnqjw1oYBLc7FZEzauC
	gIsSrzBBcBKYFWcITkFRViiuPUZgQR/+Y3wA+mmaa59GcJKzqxFB5NdWAgGJUrmwTbxnRNUSv/7
	C3GoKhvt2kIyxJr9SRW3fW/GmMlmUri0GHSuk6h/s9wswDnleiG1qM8WBL/AazHy6YHEUcuEAFA
	qD983RQjm5Gsn6ZRdPSl7UUN/RPNdYkGHasQbpPMzQRgO5rE7mwZ5q8QMkeEo5TCR8E6tjUG239
	x7qj9uSK451IJoR5mso0JcL23UvOZJyf6HY3ZHHAjdQE0Vi4oFVpL6Dfep5RTIKjClC3x0SSwVM
	x8DggJdIQ/Peg+qymo0nFrfnzBzvcU/RLM6JNMiiYoSuo3tYRhJG8X+yEHsPDoDQM6kV7exoKbb
	RY=
X-Received: by 2002:a17:907:c71b:b0:c29:53eb:9913 with SMTP id a640c23a62f3a-c2ac2531dafmr1335251266b.38.1790690924276;
        Tue, 29 Sep 2026 07:08:44 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dd68a6f18sm337834066b.52.2026.09.29.07.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 07:08:43 -0700 (PDT)
Message-ID: <7bed4275-0b97-46d7-b250-5039aa95eccf@linaro.org>
Date: Tue, 29 Sep 2026 15:08:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/14] perf cs-etm: Classify exception calls using the
 exception packet
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Mike Leach <mike.leach@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20260923-perf_cs_etm_fix_non_taken-v2-0-6ab8c07a5455@arm.com>
 <20260923-perf_cs_etm_fix_non_taken-v2-9-6ab8c07a5455@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260923-perf_cs_etm_fix_non_taken-v2-9-6ab8c07a5455@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_150847_121145_6403D551 
X-CRM114-Status: GOOD (  26.87  )
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



On 23/09/2026 16:21, Leo Yan wrote:
> ETMv4 and ETE use the same exception number for SVC, HVC and SMC.
> Identify SVC by inspecting the instruction before the preferred return
> address in the exception packet.
> 
> Preserve the exception level and preferred return address from OpenCSD,
> and use them with the packet's ISA in cs_etm__is_syscall() and
> cs_etm__is_sync_exception(). This makes exception call classification
> independent of the preceding instruction range.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/cs-etm-decoder/cs-etm-decoder.c |  7 ++++++-
>   tools/perf/util/cs-etm.c                        | 10 +++-------
>   tools/perf/util/cs-etm.h                        |  1 +
>   3 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> index 469aba5e596a791289c5bcece132aba7b0baf6c3..48e8c355a3e495cc30dcb4056c04a034d10ce860 100644
> --- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> +++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> @@ -511,7 +511,8 @@ cs_etm_decoder__buffer_exception(struct cs_etm_queue *etmq,
>   				 struct cs_etm_packet_queue *queue,
>   				 const ocsd_generic_trace_elem *elem,
>   				 const uint8_t trace_chan_id)
> -{	int ret = 0;
> +{
> +	int ret = 0;
>   	struct cs_etm_packet *packet;
>   
>   	ret = cs_etm_decoder__buffer_packet(etmq, queue, elem, trace_chan_id,
> @@ -521,6 +522,10 @@ cs_etm_decoder__buffer_exception(struct cs_etm_queue *etmq,
>   
>   	packet = &queue->packet_buffer[queue->tail];
>   	packet->exception_number = elem->exception_number;
> +	if (elem->context.el_valid)
> +		packet->el = elem->context.exception_level;
> +	if (elem->excep_ret_addr)
> +		packet->end_addr = elem->en_addr;
>   
>   	return ret;
>   }
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index c8a92b5dba6001329d68766d540b9b7ead90e9e6..a40b3b2fe2e6318154111d9b7ebd05bee53934f1 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -2019,7 +2019,7 @@ static int cs_etm__exception(struct cs_etm_traceid_queue *tidq)
>   	 * to generate branch sample for the instruction range before the
>   	 * exception is trapped to kernel or before the exception returning.
>   	 *
> -	 * The exception packet includes the dummy address values, so don't
> +	 * The exception packet does not describe an instruction range, so don't
>   	 * swap PACKET with PREV_PACKET.  This keeps PREV_PACKET to be useful
>   	 * for generating instruction and branch samples.
>   	 */
> @@ -2225,7 +2225,6 @@ static bool cs_etm__is_syscall(struct cs_etm_queue *etmq,
>   			       struct cs_etm_traceid_queue *tidq, u64 magic)
>   {
>   	struct cs_etm_packet *packet = tidq->packet;
> -	struct cs_etm_packet *prev_packet = tidq->prev_packet;
>   
>   	if (magic == __perf_cs_etmv3_magic)
>   		if (packet->exception_number == CS_ETMV3_EXC_SVC)
> @@ -2238,8 +2237,7 @@ static bool cs_etm__is_syscall(struct cs_etm_queue *etmq,
>   	 */
>   	if (magic == __perf_cs_etmv4_magic || magic == __perf_cs_ete_magic) {
>   		if (packet->exception_number == CS_ETMV4_EXC_CALL &&
> -		    cs_etm__is_svc_instr(etmq, tidq, prev_packet,
> -					 prev_packet->end_addr))
> +		    cs_etm__is_svc_instr(etmq, tidq, packet, packet->end_addr))
>   			return true;
>   	}
>   
> @@ -2277,7 +2275,6 @@ static bool cs_etm__is_sync_exception(struct cs_etm_queue *etmq,
>   				      u64 magic)
>   {
>   	struct cs_etm_packet *packet = tidq->packet;
> -	struct cs_etm_packet *prev_packet = tidq->prev_packet;
>   
>   	if (magic == __perf_cs_etmv3_magic)
>   		if (packet->exception_number == CS_ETMV3_EXC_SMC ||
> @@ -2301,8 +2298,7 @@ static bool cs_etm__is_sync_exception(struct cs_etm_queue *etmq,
>   		 * (SMC, HVC) are taken as sync exceptions.
>   		 */
>   		if (packet->exception_number == CS_ETMV4_EXC_CALL &&
> -		    !cs_etm__is_svc_instr(etmq, tidq, prev_packet,
> -					  prev_packet->end_addr))
> +		    !cs_etm__is_svc_instr(etmq, tidq, packet, packet->end_addr))
>   			return true;
>   
>   		/*
> diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
> index b81099c2b301c25f894cc9a50edfde87aceff49d..4d03f2a680b58aacd91c9f6c957fb2d38e7ac2ad 100644
> --- a/tools/perf/util/cs-etm.h
> +++ b/tools/perf/util/cs-etm.h
> @@ -174,6 +174,7 @@ struct cs_etm_packet {
>   	enum cs_etm_sample_type sample_type;
>   	enum cs_etm_isa isa;
>   	u64 start_addr;
> +	/* For exceptions: preferred return address, or CS_ETM_INVAL_ADDR. */
>   	u64 end_addr;

Minor nit, but you could use a union. I don't know how clear re-using 
"end_addr" id for exception packets is when reading the code.

        union {
            u64 end_addr; // Range packets
            u64 pref_ret_addr; // Exception packets
        };


>   	u32 instr_count;
>   	u32 last_instr_type;
> 


