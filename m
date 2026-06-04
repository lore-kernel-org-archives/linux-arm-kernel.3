Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5695CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 14:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnIodUEuNnOHA2tst2ZqiQsOh5UQYABgRLPNUrbWXpI=; b=qKnS5xAW99JZyN3oFjVZC0TQ+a
	LWJLe/lMA/yqb5CPsfVHD/c12g2YF7VyVh3ffIXY0NLrMEX8S21UlgNM1whKCsRP43cv+AipIZK4H
	73IEKIB1XGxxZlYiw2QuGWVUO/ULAUvoPPDq7mEzJXaK6vFjj2tklo+WJ56OxU3FKnNNz9S16fI9m
	Dg4yirpPQhBwBU7f8o6+90SRiDnpZ+c2brzEXZp5xIHKFeRilIgM/Mukt7Zhy9YpA9VP5s4Pbm3K4
	85lxkbpE6tb1g8n1ePoW7bX89RzsdNdPGpUI/W/uBamf4lAT0ssK/09d5yyjI/mK5av0yqn5iGoLd
	ZYXmDDyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8nw-0000000GsFI-3jCN;
	Thu, 04 Jun 2026 14:12:16 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8nt-0000000GsEX-3ydN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 14:12:15 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-68c1630159bso875558a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 07:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780582332; x=1781187132; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WnIodUEuNnOHA2tst2ZqiQsOh5UQYABgRLPNUrbWXpI=;
        b=IqaNEbn940vNNq/vq7s4taS+Mgld5vdBadpkr45Hh2eAgcQXp/eubk6DO7a9e28Kvj
         FQrmTygUda3VA999zNrgU50AzS6aT7bwmyZtQtccWp7LVG00GxF5lQBq0WC98M61W8wk
         Iv4oBv66/HSrS1++v8CAo2870CfSS02wjmPFDH7FmYffMfrYj6rzBYtyM0XID+BrVFei
         eiFV/Oep7G9oW9F0xva5/v91s8SV/yqi58rnGm8WHF9zimAbl2PoDgm5uXtkZyeEFAUN
         yIJ/zKjH7tLihNQLkBI/6BWGiMs7dlKf/d7pMXu47SA+kcIJoijSuo2Gb9vQxhnq3Kw4
         TSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780582332; x=1781187132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnIodUEuNnOHA2tst2ZqiQsOh5UQYABgRLPNUrbWXpI=;
        b=F8HW7eOMqY9H/b/ubtFoGm9gPa6aWfjT0+90WVCxgT3O2of6K5x6cTiuSMHTe/lLaW
         AKCjMbfcOeK/nSocUVNKE8S3yuKm6T+UDpZc4ZdaUSZ4BgMvwYZN6FQHZA1Q5UPmWRaj
         ebYKQfCUJKan+I0vVjw9Q2SiPl+TTGM6nj5SpCBXTvk3U94aNB88LCNVJNmxQ8/oBUBG
         qZAfNllKsS/uzcknxnIMCG/VL3ppS1qcW5U0tGfR0J1IAahYtX/fvcGBYONXuov/SPVT
         yhxwXPsUDQV87JX4kpGPezI5fDBD+5jqSKEAjlFCBogrQx7mtM5KhR4Yt/oQwRQ7V0cX
         Gj0A==
X-Gm-Message-State: AOJu0Yy6tC0k/+QZfkymjcnivBXDPLa95TdZJ8XSgnzAkj3GK6mZ0T6X
	/QQ7QjIa8qpl2eKUqHquR6I5hGcykZ0b7OTUVgdXK9cxMercqrN0htcz6WkT5idHc0s=
X-Gm-Gg: Acq92OG9khmCIrobNEiwNd4MMHLNe7gF9v5bOhPoQ//OSikZ8q906+XV2z4FGmeDFtk
	t/NFEabaUTy6IgIGzr9ReE1MPwUR9kENs1qN7xLSFvbNWe1mkj3U8gnfTy76zBefOMg5gqmi7+J
	hV135t2x+5fqOL3KXfFr72NSJkikoWPCb7RTo9u1ms6MGrx9738dNkNL+m3cOWosAYnACR7WuLA
	UWFymz7mXtO9qKdLM5psBp53cffVXcJDsoP2zfwZmIJbal3YnkPW67xHx4HnNEta3+sDPCss5hh
	STQUS19kQaAng38ZLhmEO6LcwpS6lfsYnftEoK6alLWSH9CTCsi1y7/qebDqEWotygeHkKLWXvs
	VtmhIIBqp8HNxKqhR9pa7SEfpAjm4d5dXZDij7AIovFpF2yCxhEnzq4dnjjoTBkOQ0JBD3mko/f
	hSGHAJLjrHIAvGZ6U0ruOrw0RJUKFEesjmF6VQDHk=
X-Received: by 2002:a17:907:d8b:b0:bf0:550:d9f with SMTP id a640c23a62f3a-bf0ae9f9d78mr401378666b.31.1780582332084;
        Thu, 04 Jun 2026 07:12:12 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f1aaasm309629366b.59.2026.06.04.07.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 07:12:11 -0700 (PDT)
Message-ID: <8bcb7a89-96db-4898-9d91-62360606602f@linaro.org>
Date: Thu, 4 Jun 2026 15:12:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/8] perf cs-etm: Flush thread stacks after decoder
 reset
To: Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo
 <acme@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Mike Leach <mike.leach@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Namhyung Kim
 <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>,
 Paschalis Mpeis <paschalis.mpeis@arm.com>, Amir Ayupov <aaupov@fb.com>
References: <20260526-b4-arm_cs_callchain_support_v1-v6-0-f9f49f53c9dd@arm.com>
 <20260526-b4-arm_cs_callchain_support_v1-v6-4-f9f49f53c9dd@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260526-b4-arm_cs_callchain_support_v1-v6-4-f9f49f53c9dd@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_071214_009568_707BF663 
X-CRM114-Status: GOOD (  20.86  )
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
> Perf resets the CoreSight decoder when moving to a new AUX trace buffer,
> this causes trace discontinunity globally.
> 
> For callchain synthesis, keeping thread-stack state after decoder reset
> can leave stale call/return history attached to threads that are decoded
> later, producing incorrect synthesized callchains.
> 
> Flush all host thread stacks after a decoder reset. When virtualization
> is present, flush the guest thread stacks as well.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/cs-etm.c | 37 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 398ab3b7a429d402cc8e5f6cccb35c0b7c253732..ea2424175558ddc0a6f20a9de6c30f377facdc52 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -1956,6 +1956,37 @@ static int cs_etm__end_block(struct cs_etm_queue *etmq,
>   
>   	return 0;
>   }
> +
> +static int cs_etm__flush_stack_cb(struct thread *thread,
> +				  void *data __maybe_unused)
> +{
> +	thread_stack__flush(thread);
> +	return 0;
> +}
> +
> +static void cs_etm__flush_machine_stack(struct cs_etm_queue *etmq, pid_t pid)
> +{
> +	struct machine *machine;
> +
> +	machine = machines__find(&etmq->etm->session->machines, pid);
> +	if (machine)
> +		machine__for_each_thread(machine, cs_etm__flush_stack_cb, NULL);
> +}
> +
> +static void cs_etm__flush_all_stack(struct cs_etm_queue *etmq)
> +{
> +	enum cs_etm_pid_fmt pid_fmt = cs_etm__get_pid_fmt(etmq);
> +
> +	if (!etmq->etm->synth_opts.last_branch)
> +		return;
> +
> +	cs_etm__flush_machine_stack(etmq, HOST_KERNEL_ID);
> +
> +	/* Clear the guest stack if virtualization is supported */
> +	if (pid_fmt == CS_ETM_PIDFMT_CTXTID2)
> +		cs_etm__flush_machine_stack(etmq, DEFAULT_GUEST_KERNEL_ID);
> +}
> +
>   /*
>    * cs_etm__get_data_block: Fetch a block from the auxtrace_buffer queue
>    *			   if need be.
> @@ -1978,6 +2009,12 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
>   		ret = cs_etm_decoder__reset(etmq->decoder);
>   		if (ret)
>   			return ret;
> +
> +		/*
> +		 * Since the decoder is reset, this causes a global trace
> +		 * discontinuity. Flush all thread stacks.
> +		 */
> +		cs_etm__flush_all_stack(etmq);
>   	}
>   
>   	return etmq->buf_len;
> 

Reviewed-by: James Clark <james.clark@linaro.org>



