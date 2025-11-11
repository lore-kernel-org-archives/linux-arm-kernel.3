Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A91FCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 11:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4fv3AqTrlyRPmxlWB1ltGRDPoMxkylJndccFFj9vmU=; b=YfcGr3mZdlGb0EMjb3X0nCMpoY
	ZRPb3qD/lNUu0W9t0QlVyTYt/CuFH0wlV7vlrY7H6iluBX0v7V+qLnAYPY6VimBl9m4iD9xCtuCPo
	NsihHonPrvx7yhN8RWEmJuQOiedJo/9lFDpKb+T7q1l95/TEcIeHeIbkL6ZuO3OonfH2AFpXDrre8
	pEnq6ioBySd8GJcbPtH9pVP8WeILEWKXh8PGmruz4WiKthdwa8uMiJzenGAEHa8YFleGq/Vq/ccNS
	fqKCNnZA9C+miEa/G+it+yqXhyOHLunAY763ZEvUkeq87bXBFrb4+3nE+r4Qdol4yUc8vOFrjjapo
	6NG8FgYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIm78-000000072GB-0th2;
	Tue, 11 Nov 2025 11:00:42 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIm73-000000072Ee-1bCJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 11:00:41 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6418b55f86dso2953721a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 03:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762858822; x=1763463622; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U4fv3AqTrlyRPmxlWB1ltGRDPoMxkylJndccFFj9vmU=;
        b=EiQnyWJut1CYJCr9SJcR9R+yNDQgvJ75r3ZUHfMU/YOh8JwnlFm9Hc2YG9DeR4cKaM
         YW7+bMcYS5VPUULqRLtxH4Fau0JBtqbp98mldhlOIjszy+T8p2IzRNWIIP7NiBU/0Swg
         RRFc19tQzDzV1mwAi9d65DFWWs/6sIfMmxUo2KVv1oU1uf9mZv2xDngIqbvs58DkTCvd
         B18GkIz8U0pOI0W2QozUn8uciUWH0wR/lu3wj+3mbJUUGBF5VUwoi3QDpGLyiQG1z0oV
         81qiYKAfof9YGOWht8HH+EFri8wQZFDV0OMJ0J+B+tdXgJ1RmEHsZSGH+UZGhOZUB4Rb
         BQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762858822; x=1763463622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4fv3AqTrlyRPmxlWB1ltGRDPoMxkylJndccFFj9vmU=;
        b=Ntx25vY2lv2CaIxEwmgDGnZHJR5oI3YyDUmI096nQ/m7Z1zkGhwbKJB2g5hq8+vxH7
         Ma8YRSApo/HUnQfthVJMjcIBENJzDmyir+5o/DDAow3tM7Gvc1YR5GGJ0VLRLd3g/vey
         pvTFWylACP72ONszkNLGwSmt8GXF6FBvyN1DfsHZlVA02uD+0j2L1RHqG7GfIsqM2pPV
         qgvXvqVf4FdqglroxRFs2C9t3gbJiupA5Ox1Ipl+dZlTyZk0Kinw/AAOtaYS0HmtQKe7
         H9rozJ4ZWcgMdssF7jKixRlDp3akkd4hG06C+QB7lOybv2QztH2bgQDcjU8tZvXwOMRN
         FY8w==
X-Forwarded-Encrypted: i=1; AJvYcCW6GtRNlD+2FmR8wvllKEkdZJb6x8s8uhJaDwDmRd+LDGhZQgD7ubprHH1aji9QOktr+egVASpZwvfM3skkHKq3@lists.infradead.org
X-Gm-Message-State: AOJu0YzRN5W3AzaLbsfPQNkuOsa+XnfvR0VzaEIfyvB3VAj69zKN6F25
	mHWps/QNE/LTGsm7JUaZas9LOYzsNYwFvSW6qL6wJvjeT2klcIyRRX7hWBtt2fKYD8GaMF5CTOp
	oHYNLMpM=
X-Gm-Gg: ASbGncsUVY5TipYlosHKLZP5TKAFiab17NfMrCIwPBOuOJ/9jvKpqFYjG8GX8VGQN3T
	yYPIZ5CN48nov7PDQrHp06cGDGJbvWPTjZboypLvy1oXm5TEY3DyI0yR9yxei//I8lnyATpfPgo
	OtaVS0bpB2QVEHWmOGak83uqdd99iKgif7HPEClIQ6CzEfonY9gV0UqGhjpby+vKVXfcYXmWKHb
	pqaDGcphX1db2YVcu9dxqkWs+hFDf0OPRaPcrkwg8gSTHscaF/AiPkAjQP++Sa0A2HRET99UJOn
	Tkn5ADsxroOn4JiLTMJWAyBnQOaQBW5r9029a7xV8FtLo8WZqNEA3b7cAkop1I0F7ap0MYxKAbq
	aRPHSRXKLZ4LQF3TlwGHITrcTJkatOSOx2eFuD+7AtAWgvi0pTfYmuybdBnN6Gfv9RpFo3vL36t
	DBS3b9WOYYV90WoUnN
X-Google-Smtp-Source: AGHT+IHhoshuEgKwX8/Ru0TwidruwNS7pASY+Vm/EhvoTXpz7woWAzVfFchx4yQuMVjUwDXm+8FRJQ==
X-Received: by 2002:a5d:5d87:0:b0:42b:4069:428b with SMTP id ffacd0b85a97d-42b4069458cmr4219569f8f.51.1762858318427;
        Tue, 11 Nov 2025 02:51:58 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b316775f2sm17429537f8f.16.2025.11.11.02.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 02:51:58 -0800 (PST)
Message-ID: <8078e440-e97c-425c-b046-987b642640f7@linaro.org>
Date: Tue, 11 Nov 2025 10:51:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/5] perf: arm_spe: Add support for filtering on data
 source
To: Peter Zijlstra <peterz@infradead.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20251029-james-perf-feat_spe_eft-v9-0-d22536b9cf94@linaro.org>
 <20251029-james-perf-feat_spe_eft-v9-2-d22536b9cf94@linaro.org>
 <20251110154827.GA278048@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251110154827.GA278048@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_030037_457348_CE35F8C7 
X-CRM114-Status: GOOD (  25.07  )
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



On 10/11/2025 3:48 pm, Peter Zijlstra wrote:
> On Wed, Oct 29, 2025 at 03:46:02PM +0000, James Clark wrote:
>> SPE_FEAT_FDS adds the ability to filter on the data source of packets.
>> Like the other existing filters, enable filtering with PMSFCR_EL1.FDS
>> when any of the filter bits are set.
>>
>> Each bit maps to data sources 0-63 described by bits[0:5] in the data
>> source packet (although the full range of data source is 16 bits so
>> higher value data sources can't be filtered on). The filter is an OR of
>> all the bits, so for example clearing bits 0 and 3 only includes packets
>> from data sources 0 OR 3.
>>
>> Invert the filter given by userspace so that the default value of 0 is
>> equivalent to including all values (no filtering). This allows us to
>> skip adding a new format bit to enable filtering and still support
>> excluding all data sources which would have been a filter value of 0 if
>> not for the inversion.
> 
> So from that I'm reading the config4 field will only have like 16 bits,

The _data source_ is 16 bits, but the _data source filter_ is 64 bits.

> but here:
> 
>> +#define ATTR_CFG_FLD_inv_data_src_filter_CFG	config4	/* inverse of PMSDSFR_EL1 */
>> +#define ATTR_CFG_FLD_inv_data_src_filter_LO	0
>> +#define ATTR_CFG_FLD_inv_data_src_filter_HI	63
> 
> you claim all 64 bits.
> 
> Also, afaict:
> 
>    #define ATTR_CFG_FLD_min_latency_CFG            config2 /* PMSLATFR_EL1.MINLAT */
>    #define ATTR_CFG_FLD_min_latency_LO             0
>    #define ATTR_CFG_FLD_min_latency_HI             11
> 
> Still has more than 16 bits left.
> 
> 
> So why exactly are we needing config4? Can we please get a more solid
> argument?

Each filter bit position maps onto one numerical data source value. The 
16 bit field in the data source packet gives us possible data sources 
from 0 - 65535. The 64 bits of the filter allow us to filter on a subset 
of data sources (0 - 63), but that uses all 64 bits of the filter with 
one bit used for each source.

I think you are assuming the data source filter can only filter on a 
single value as if it was interpreted numerically, rather than bitwise? 
But it's actually interpreted as a separate filter for each bit, which 
allows the OR semantics that are described in the commit message.

It might be clearer if I add a few more words to differentiate "data 
source" and "filter":

   Each bit of the 64 bit filter maps to data sources 0-63 described by
   bits[0:5] in the data source packet (although the full range of data
   source is 16 bits so higher value data sources can't be filtered on).
   The filter is an OR of all the filter bits, so for example clearing
   filter bits 0 and 3 only includes packets from data sources 0 OR 3.


