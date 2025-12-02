Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF988CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 10:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=th2ta/uFhCmWYoXsGiqxNYGiQhfkxRr8VyWDSYszkyk=; b=NqgJnXpMa3unT5KnnnY/I6u6tH
	Q5qK4Q4uTa+8He4NMSFANlqiHXt/TC//IrsG8OFKtaHoCroslrZ9/VNpLUSqzm7IICFuBq0Inpz1E
	ER5QFGyH3fJKieZHGyiAn2BWFnPltVH0ium6hJSHKtGkiXkPO/gSQGMXWrHNoRLFhfDgT23jYyBKY
	8PnYkuMvL9LHsgvhP01NlykVggragujpceEGhg6DfM8nbPSmNyZiC4vR/w2zc1hRDtHpn+ZZZND/S
	vuvPq/0d7zdlmsYR7zrV56yz72IeKi4RKIU7oCnHluXpZTEZkYAGqkwglS05rOWpldy7Mo+MbeTUq
	2D6SuXvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNoW-00000005GyR-0cbB;
	Tue, 02 Dec 2025 10:40:58 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNoT-00000005Gy4-2bxh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 10:40:55 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso55506975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 02:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764672051; x=1765276851; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=th2ta/uFhCmWYoXsGiqxNYGiQhfkxRr8VyWDSYszkyk=;
        b=fiY8ffs35gb1zf4qEEpCG/8hW/3tQc3gBoVFLzDt96rKMStQgIiTxlZhIYAhdszDKU
         Vnh2VbWkdrWIPXySMe5KGkOa6zsqk6xy4xWtyGDpqekffqFSsYchL8SFXbHWoXp5nMyQ
         s90Qq9nSoDf7qhxkXr8uR6zWNykMzS+zBgGSWrySm9FxPqx7sBU3Te8hgBWPvb6p92mZ
         UxxpW7b67cfx4+4fm5X1nR3wpViezKkIy5amANisbYPaAr9+11n1/abiJc80z0BMAFYX
         lOMXQGH3KJPCd2SR6dqzLc5Hc5Iw+7P4YM4vRGmoCOMZRobTFOyB3YzLuzYVO4Iq5C95
         mzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764672051; x=1765276851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=th2ta/uFhCmWYoXsGiqxNYGiQhfkxRr8VyWDSYszkyk=;
        b=r8tvBbCYyWm42vkbtD6xDtG/zYHU8CrL1ZR78fYwLyD9uS7FxVXknz7RGd4Kec7JZY
         49OOQpoTzh9jyVT7PqKn9OchpJ2RJxsRuCxssHNCF0YaHlUN8CAgeErB1DrdYvl7xN8E
         gZy6UQWzHInRNxVD0MytkrjNnIgII2cbT4Uq5u6QKiX6ivt/qnhPwTA9/7LjISBLflyg
         r1CkHeiA4fb1IFa3mHgFNPUt/TmCsFG/iv/Drv6faPndoQ+CUz828tY8y2rrpncKec4h
         1kGd7+AljXP6t3hMayRuENbebARuCF6k4zQ8JaJrpLIoqrTTN9xPDMp+wLxnv8wru1gG
         4jSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfZ8tAs8iTMswkKoX9eL9AWR3n1WkN1fXLF82AChQND5aCy8ZLnEMNGPgoII6pQpv/q7ly0iGRbLivFc8e7L4D@lists.infradead.org
X-Gm-Message-State: AOJu0YzcCJ+stTB7erRRklo1SMidkQ0MDKTCPeKa+LvUF8Zlkc671cPu
	5K8LkyQaxWRofbzyGk0RgNBCFRjx/tk8uGi3Yjliz4Ubjkx+/ZgkYnCHn1s5Wbt+7KQ=
X-Gm-Gg: ASbGncvaz24pDpXcEyDYoRN+oUBZuX8OzZFK7ctUT5g1IHzDr5pL5dpZ4HjppibRaBG
	wOvKJN+ILGaPBsNd9CszvODonxeOuECvxJXJmw2syRaEL7OsKWUlVfS8Hfb3vCneIjh0FussLGB
	oTBZwsYvCC+q3bAM5fivZGRVnrN/HuuOb5FwHdRF8D5jnlKsdbMR+R0oHcjXfzlJbRHfoBBtmEk
	Ctvra/++fNUYZdzXkbh8aw86gZxdagVVjoUx2YqCQTS8pPzef16zercMBh3LXCZ/XoE0VjqicZ1
	OHOktALeCyRdQ8WXHRvV1XOcY9+oZezRjN039eDGWDsUoJBh8KDRBJ6dI6AiaEHDVLyIpWq/nxR
	7kiMPYuNf+GLr2Re99M7W1llvJ+vfFaTLB5+eSayMb31x0vBR3PwyUDbFzVWDtCQ1tWE8afV6Br
	ny1/SvUzApJFMaMGBU
X-Google-Smtp-Source: AGHT+IFIZZL3ELzhmY7ZxQvV+EVEfV64j2iIUcHf0FIxZBYlBnLylq8S3u+BdSmD7CbXWktYV2cbug==
X-Received: by 2002:a05:600c:3b09:b0:471:13fa:1b84 with SMTP id 5b1f17b1804b1-477c0185bc8mr473893265e9.12.1764672051209;
        Tue, 02 Dec 2025 02:40:51 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4791116c3c0sm291934395e9.8.2025.12.02.02.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 02:40:50 -0800 (PST)
Message-ID: <978dd9b1-1cb0-4338-95fa-575a858cea80@linaro.org>
Date: Tue, 2 Dec 2025 10:40:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] perf tools: Track all user changed config bits
To: Leo Yan <leo.yan@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20251201-james-perf-config-bits-v1-0-22ecbbf8007c@linaro.org>
 <20251201-james-perf-config-bits-v1-1-22ecbbf8007c@linaro.org>
 <20251202101556.GR724103@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251202101556.GR724103@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_024053_717826_C3DE88DB 
X-CRM114-Status: GOOD (  15.67  )
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



On 02/12/2025 10:15 am, Leo Yan wrote:
> On Mon, Dec 01, 2025 at 04:41:04PM +0000, Coresight ML wrote:
> 
> [...]
> 
>> +#define ADD_CONFIG_CHG(format_type, term_type, new_term)		\
>> +{									\
>> +	struct parse_events_term *term;					\
>> +	u64 bits = 0;							\
>> +	int type;							\
>> +									\
>> +	list_for_each_entry(term, &head_config->terms, list) {		\
>> +		if (term->type_term == PARSE_EVENTS__TERM_TYPE_USER) {  \
>> +			type = perf_pmu__format_type(pmu, term->config);\
>> +			if (type != format_type)			\
>> +				continue;				\
>> +			bits |= perf_pmu__format_bits(pmu, term->config); \
>> +		} else if (term->type_term == term_type) {		\
>> +			bits = ~(u64)0;					\
>> +		}							\
>> +	}								\
>> +									\
>> +	if (bits)							\
>> +		ADD_CONFIG_TERM_VAL(new_term, cfg_chg, bits, false);	\
>> +	return 0;							\
> 
> Nitpick: "return 0" is not needed here.  Otherwise:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>

I think it's worse than not needed, it makes it stop collecting the 
changes after the first one.

It was annoying that this had to be a macro instead of a function 
because ADD_CONFIG_TERM_VAL constructs the #define name of the first 
argument.

It's probably worth putting in some effort to make ADD_CONFIG_CHG() a 
function to avoid problems like this and maybe add a test.


