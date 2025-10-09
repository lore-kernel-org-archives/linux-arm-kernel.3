Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C44CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 09:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5exwWNyivwXxEPwEj99l0gvTi8WW71D4LDWKxhJVjg=; b=Fo0HZI1RvbzDs4ldrFW1Ds8ZB3
	nu3kgmPwMtq/7Wd2ykwgArWCJRaLJoCoK8mhCFmrWeYVftWqy2WgDcc95QNFJ1UHimQjELfYqi6ED
	DBpw9CTLasjIvOXqokAQdVmzwEuL7dtcbagyvsfdEGDr/TSHIqpaRnHj8kzOn8oXtGuybyKS2DrnV
	tGTNeN23yGOg7ivOD70LObN+AJ4kNw3Nm3hhFs8GhqOptfyDItMPEBxYcDabsAKc8tNSwn6sBBPZ5
	VnBss2SWpjEEex9qPSh9xxi5wK9r9BIWHd1dzuKEVL2pUnvYU5fNihxoGQhv+0LMpVkU8HrIgISX7
	wNrI8+HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nDc-00000005gq5-0KND;
	Thu, 09 Oct 2025 09:45:52 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nDa-00000005gpS-0uDA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 09:45:51 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4060b4b1200so827495f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 02:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760003146; x=1760607946; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B5exwWNyivwXxEPwEj99l0gvTi8WW71D4LDWKxhJVjg=;
        b=GeqEJNK/3pOo2QC2iQi7CrTG+5YaT1K/AXaCJQhZKkddMVD4gqIhix/xWNLhbqltpx
         j/qnHdKyw7jSwpcV3sWqahzS5f/G8qtU734dXHw0aPtzIb4JTAO5I+J/9NOEfUqtB/1A
         DPEl9rzAk/ktagh/PhRNsOcxlU/+rHC9FcM/Si8AJot/XBj7yGuSnI8mJro2t5esTep6
         ueKWt2w2eWQvb7apFAoW6fX3qwnHjh6C0HEzrrKOn18dgg0px6zcOxh82cQc6/EG1Dd7
         a2zXjij8aHZz9IgKkB9HMIB0U3V96eHtBzcbZDJzIdULRb/+1ViPy8HI62LVS9Vy5kHe
         oqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760003146; x=1760607946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B5exwWNyivwXxEPwEj99l0gvTi8WW71D4LDWKxhJVjg=;
        b=O6QkhbVB2NNbxVxuCciAs9nSn/0psiO14tedyfJtW79E+jpu3ermd7JyMXYHehBOv1
         JEs2+WSRAYnzqLVN5M///PSkS4mkqCOQLPxvskMMnniryaS1IakjnLGlmHNz4RGTZskX
         eQUyfV3cEfeW37ByrFG/M86kvBi0IvNfhPK+ccc5eQ5kwzxrKGdOvWv57gPpw85KqvCA
         lYMFzkHwJdkCSOQfZssTOnlzHOfHHyX9t1n9JiK6TxY0bWMxHIBT6PuLUdutV1BxgC1+
         84YlgGU3lcj9vID9RquaQ8icjLJpk9i2LGAPv1Y8TysnVCzA1lDkS2V76i98V5svrSoy
         rL+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvXlyzonnnc+Pf9VG/HtMpGaeAaOq5uOmBtCDXXyU2Rgg5U2iAAaUWHkAkigxe8Ngsdboxj3CWceT9XswkggXK@lists.infradead.org
X-Gm-Message-State: AOJu0YyNcnV5+r690qXh1o261OXhc1YIPk4DniUcWTCU3M4ZX9QEaGNa
	qSYdQLJj7XB/i4aOTUhXngJgq0pOM4/qDAfEIoFRwUj3fgH5fHL2we8/8WWgHPQSoBw=
X-Gm-Gg: ASbGncuFXQ2+e7xDDF9KSk+ifuwdQLvADbwuctTz0wD0EzDLIdhGEFphPYz53VwQjBA
	CHceDL9rnHBckUSr1rilEwgpT3db24eB9E14XSLkRlOKl43CLsv3JFAJ8CVIFojEqZQi9bTQPVZ
	nPPXnSDAbK1G6GSYv4LGRBFQeLbp/0VBDhclBhrUzChlAMZ/XDY5WHhEPOxSyoCxitkq5hj8lJr
	mVYnVtoc8kgNCgWVlxJXSuniB8oo4IAx4Ka+h8/cSxY1GgWPRNrq6fqs66P/vI/AkiZRHG+XEUB
	OBRl3w4u4TCtewDIo/Ebu3apylGqno/F0Qat3BVNhe0UAf59GlTS65hzL3RhLwsEW1CC0Or2FUU
	7Fn/swas86OaaqJZnA0ZUllTgjRPoTcYD+JW8WgmKD03bGsoMTdXaTJz4HT9R0XixYCc=
X-Google-Smtp-Source: AGHT+IEuXY7MXWFObfOK+QblA+xufcpRh5i/X3Iuc1VjgyYalpax2gpUt647nv9NMhwLnsjpZk83TQ==
X-Received: by 2002:a05:6000:2484:b0:3ec:2529:b4e5 with SMTP id ffacd0b85a97d-4266e8f8008mr4842482f8f.38.1760003146040;
        Thu, 09 Oct 2025 02:45:46 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46faf1841aasm37389825e9.18.2025.10.09.02.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 02:45:45 -0700 (PDT)
Message-ID: <07902090-801d-456d-bcaf-5f3b2254564d@linaro.org>
Date: Thu, 9 Oct 2025 10:45:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/25] perf arm_spe: Expose length for SVE and SME
 operations
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
References: <20250929-perf_support_arm_spev1-3-v1-0-1150b3c83857@arm.com>
 <20250929-perf_support_arm_spev1-3-v1-17-1150b3c83857@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250929-perf_support_arm_spev1-3-v1-17-1150b3c83857@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_024550_298469_3C274391 
X-CRM114-Status: GOOD (  18.31  )
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



On 29/09/2025 5:37 pm, Leo Yan wrote:
> Record length for SVE and SME operations into records.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/arm-spe-decoder/arm-spe-decoder.c | 3 +++
>   tools/perf/util/arm-spe-decoder/arm-spe-decoder.h | 1 +
>   2 files changed, 4 insertions(+)
> 
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
> index 9e02b2bdd1177193996d071dd88f969e25b1ad86..82e3053131db62603553bd092388879ce9a9bcd4 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.c
> @@ -220,6 +220,7 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
>   						decoder->record.op |= ARM_SPE_OP_ATOMIC;
>   				} else if (SPE_OP_PKT_LDST_SUBCLASS_SVE_SME_REG(payload)) {
>   					decoder->record.op |= ARM_SPE_OP_SVE;
> +					decoder->record.length = SPE_OP_PKG_SVE_EVL(payload);
>   					if (payload & SPE_OP_PKT_SVE_PRED)
>   						decoder->record.op |= ARM_SPE_OP_PRED;
>   					if (payload & SPE_OP_PKT_SVE_SG)
> @@ -239,12 +240,14 @@ static int arm_spe_read_record(struct arm_spe_decoder *decoder)
>   				decoder->record.op |= ARM_SPE_OP_OTHER;
>   				if (SPE_OP_PKT_OTHER_SUBCLASS_SVE(payload)) {
>   					decoder->record.op |= ARM_SPE_OP_SVE | ARM_SPE_OP_DP;
> +					decoder->record.length = SPE_OP_PKG_SVE_EVL(payload);
>   					if (payload & SPE_OP_PKT_OTHER_FP)
>   						decoder->record.op |= ARM_SPE_OP_FP;
>   					if (payload & SPE_OP_PKT_SVE_PRED)
>   						decoder->record.op |= ARM_SPE_OP_PRED;
>   				} else if (SPE_OP_PKT_OTHER_SUBCLASS_SME(payload)) {
>   					decoder->record.op |= ARM_SPE_OP_SME;
> +					decoder->record.length = SPE_OP_PKG_SME_ETS(payload);

These are all assigned but never read. I'm not sure if that's a mistake 
or they're just there for completeness. I don't think there's much point 
in going for completeness unless it actually makes it all the way to the 
user though. It would be better to leave it out and finish it another time.

>   					if (payload & SPE_OP_PKT_OTHER_FP)
>   						decoder->record.op |= ARM_SPE_OP_FP;
>   				} else if (SPE_OP_PKT_OTHER_SUBCLASS_OTHER(payload)) {
> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> index d4574268cf793efe154f252b3e2af9c721bada97..b9288cd774bea2534d9991213c942dcbaf2a7232 100644
> --- a/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-decoder.h
> @@ -122,6 +122,7 @@ struct arm_spe_record {
>   	u64 phys_addr;
>   	u64 context_id;
>   	u16 source;
> +	u32 length;
>   };
>   
>   struct arm_spe_insn;
> 


