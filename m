Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806CECCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 09:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J48rQBykDWCT3Ii30eoI2mL/LdKQbtj2BoXwRMrCGE8=; b=c12oAfUcjh2v4UUSTr7yV1Pldb
	mb+bu+Vwih26eZii2r4AwmASg3qbqyAo2hzr6B6B7TKB7SbsVL8g9feq5OOeuwrLU2KUCNq8yzh7H
	0NklwPouphxQw0f3GPDkzL0ytm3391FE23wXCHPA7v9fRHqqimQdsrYnBR3ZLE799P8YY9VVYanxD
	PYsbIkVYOpw6F+opVXyQzJNWKQS23rMwbmVMQsqLCWjuJ3czfa6tHPZu4gYs1TzA3WBKWpfxVbhFm
	5Z5aFbfSBCoKVY7vFsoS2/wPODWtKHETZYySsXknSLd8W6A5jiCEH2tmOw1jo1ujERTACkTW907jQ
	mp/t5SsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mbh-00000005bIE-0Ei1;
	Thu, 09 Oct 2025 09:06:41 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mbd-00000005bH3-40J4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 09:06:39 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-46e2e6a708fso4835485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 02:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760000796; x=1760605596; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J48rQBykDWCT3Ii30eoI2mL/LdKQbtj2BoXwRMrCGE8=;
        b=kaYrDFq+TcauPHMf5F4IBICR7zE1A3ofobHfr3jtB6DKmqyL8eDDW7IbueXqINCm/6
         3pu9rLzUyIUgWh7Zlv67jux286kwr9GOU9xZvBAyqlMq3ZyQocMhWqOuXOLLAxtgY5Yj
         mzTqVZeyjLGa2O6acrp3eqnGF+44hSh6SI/GmdkFIT3sYhtOCw3CSFcf62y/A/nR+T8B
         GzVWYmuWruiZBnKpV1vboh0CoVbqvjsMSPwmNiM3+u2BUNECmlGkgBbbOce2oQkvpmLw
         RM3stXsrQoUjf6Gh4tHEeHPk0cvdeY5JWMQRcqFNCUqIZ8EhVefNeyoH0yeS1wQQHsTb
         oB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760000796; x=1760605596;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J48rQBykDWCT3Ii30eoI2mL/LdKQbtj2BoXwRMrCGE8=;
        b=B19ORR8p0NGOW6nr/jYtMGwTlWza7Id2HyLMY7VIPY9i5I1RMePR+TT37LqABdWmDi
         D4ncWmu7eNvIjzljxr6U9plRyIsVs0et5b+tZVnixd31Csrck9P+vIS1LP0qzL6WYVC6
         pZcnXChnNNvTKyVA4W5Bxx502ydp+fxoGddgOhmoAl2wodYlfU753vb7mcAC3ioMp5bi
         +DVFI9q1Esnqvq0PJLP1uWxReOPlCZBsemvMhECvwl+YuJykEQi37+E4ewxUBzbDlviQ
         1NxjEMcdHcpWXMwvAje4mAnKjEw4HT/UWm1p+iGuwT9crKxzxvigVDPo9IocDnRhlFyp
         iaTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcwLrO9TQ4iyPIWLadhqSlZ/6BtKC/GS48mbaFMOGZTQNUccB3jQ/4hvbFW6IYMF22nThsJm1epaHSlJr1IUca@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg3TNIPkO3JFP+gXmaMmqUFFBlXQmk0P4HaP1EuwbnvU3H+5bH
	UFfbo6R/54tDXcs63jGuXD+eqLqZQ9e5I5hnIPpTmb1s0UWVVlrHbPG+x3sG9bRFWbQ=
X-Gm-Gg: ASbGncsRArOTlRiJ8OhY6N3fXmZvnuj2c4NMw750+fs6rSDeaSZ6mwQWsXNW81cZqJh
	Cg487Sjg29P6IWPuXKn7OSP8HpyCXb3W/KVII6S+AqTgFJzuXQlpDr2kqX/VPpnwiBHpD8KVcZI
	LwL0y4YdeVyBMzFym9Tbh9Q+IFIcqpeeHhhe5uJdYJFKUvIAuHKUkFCZIV1PNHCnB1EQUuhB4PL
	nya1jSx7a3tlooh+ZMIwxkWmsWACt8eDzrf5mC2m4H5iBLywmkUItZoDBHt3mEDBWlV580xa7+c
	3jAGjgLvJgtnUC6QZBNGWgwC2yPqP7ao7+cpl6IDbbktcdNBFKnZTzelAfZUikpnFKKGJ8guu0Q
	EedIV60kKJy3IsevpTZFeQ8d9pLXjBcW/gOZoI3LPLYMpQ/EB/4T5O6w4
X-Google-Smtp-Source: AGHT+IEAe10HGupW0C0imyF3812fO4JpavJhwuTnW9WFqcLxeal+Kei55mpY2juDKAUc7lZYLtm4UQ==
X-Received: by 2002:a05:600c:4745:b0:46e:59f8:8546 with SMTP id 5b1f17b1804b1-46fa9af35e7mr46222785e9.17.1760000796024;
        Thu, 09 Oct 2025 02:06:36 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e9719sm34426273f8f.31.2025.10.09.02.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 02:06:35 -0700 (PDT)
Message-ID: <a252e477-2f5c-41ef-8cf9-bcee5e0e7574@linaro.org>
Date: Thu, 9 Oct 2025 10:06:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/25] perf arm_spe: Decode ASE and FP fields in other
 operation
From: James Clark <james.clark@linaro.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
References: <20250929-perf_support_arm_spev1-3-v1-0-1150b3c83857@arm.com>
 <20250929-perf_support_arm_spev1-3-v1-5-1150b3c83857@arm.com>
 <897c28a8-599f-44b3-8939-8279d2639f2c@linaro.org>
Content-Language: en-US
In-Reply-To: <897c28a8-599f-44b3-8939-8279d2639f2c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_020638_023020_8B5879CB 
X-CRM114-Status: GOOD (  15.91  )
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



On 09/10/2025 10:04 am, James Clark wrote:
> 
> 
> On 29/09/2025 5:37 pm, Leo Yan wrote:
>> Add a check for other operation, which prevents any incorrectly
>> classifying. Parse the ASE and FP fields.
>>
>> After:
>>
>>    .  0000002f:  48 06                                           OTHER 
>> ASE FP INSN-OTHER
>>    .  00000031:  b2 08 80 48 01 08 00 ff ff                      VA 
>> 0xffff000801488008
>>    .  0000003a:  9a 00 00                                        LAT 0 
>> XLAT
>>    .  0000003d:  42 16                                           EV 
>> RETIRED L1D-ACCESS TLB-ACCESS
>>
>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>> ---
>>   tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c | 6 +++++-
>>   tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h | 4 ++++
>>   2 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c b/ 
>> tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
>> index 
>> 533920b738cbcb39136d1ba3d88e99f9d8009e74..21b65a9b40f481b6cb25aaf01ab627ade046ff72 100644
>> --- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
>> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c
>> @@ -351,8 +351,12 @@ static int arm_spe_pkt_desc_op_type(const struct 
>> arm_spe_pkt *packet,
>>                   arm_spe_pkt_out_string(&err, &buf, &buf_len, " FP");
>>               if (payload & SPE_OP_PKT_SVE_PRED)
>>                   arm_spe_pkt_out_string(&err, &buf, &buf_len, " PRED");
>> -        } else {
>> +        } else if (SPE_OP_PKT_OTHER_SUBCLASS_OTHER(payload)) {
>>               arm_spe_pkt_out_string(&err, &buf, &buf_len, "OTHER");
>> +            if (payload & SPE_OP_PKT_OTHER_ASE)
>> +                arm_spe_pkt_out_string(&err, &buf, &buf_len, " ASE");
>> +            if (payload & SPE_OP_PKT_OTHER_FP)
>> +                arm_spe_pkt_out_string(&err, &buf, &buf_len, " FP");
>>               arm_spe_pkt_out_string(&err, &buf, &buf_len, " %s",
>>                              payload & SPE_OP_PKT_COND ?
>>                              "COND-SELECT" : "INSN-OTHER");
> 
> A warning for unknown packet type would be useful here now that there is 
> no final else catch-all.
> 

Although I see it's consistent with other cases now. Maybe it could be a 
later fix to add unknown packet type warnings for all cases.

>> diff --git a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h b/ 
>> tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
>> index 
>> 48bd9e9ef132b11b79ffe2e2fbc7cfe4c340ff92..704601c6dbe30e93f83a82670d0d60344a22222a 100644
>> --- a/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
>> +++ b/tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.h
>> @@ -123,8 +123,12 @@ enum arm_spe_events {
>>   #define SPE_OP_PKT_HDR_CLASS_LD_ST_ATOMIC    0x1
>>   #define SPE_OP_PKT_HDR_CLASS_BR_ERET        0x2
>> +#define SPE_OP_PKT_OTHER_SUBCLASS_OTHER(v)    (((v) & GENMASK_ULL(7, 
>> 3)) == 0x0)
>>   #define SPE_OP_PKT_OTHER_SUBCLASS_SVE(v)    (((v) & (BIT(7) | BIT(3) 
>> | BIT(0))) == 0x8)
>> +#define SPE_OP_PKT_OTHER_ASE            BIT(2)
>> +#define SPE_OP_PKT_OTHER_FP            BIT(1)
>> +
>>   #define SPE_OP_PKT_LDST_SUBCLASS_GP_REG(v)    (((v) & GENMASK_ULL(7, 
>> 1)) == 0x0)
>>   #define SPE_OP_PKT_LDST_SUBCLASS_SIMD_FP(v)    (((v) & 
>> GENMASK_ULL(7, 1)) == 0x4)
>>   #define SPE_OP_PKT_LDST_SUBCLASS_UNSPEC_REG(v)    (((v) & 
>> GENMASK_ULL(7, 1)) == 0x10)
>>
> 


