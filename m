Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0D3D39403
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 09:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rEH5WzWrgYk3Nyry0RXufGI5C4aPoskx4NXm70qvdmI=; b=FC/iZUpyeF+lxpRCtEebe3rMzO
	08mHTRBfi9FCAi00eiEs1OIdOcs0SXFn3ypn9sSk6RL4qJnFilMorGFLEaX4W/g0obTff9l88cjX8
	cCQJIBhL9fKqlvTqirS8CO+TeG/LDkK3W3g3S75ZvfueKpwoCOFnEkld/TpMi9TiE5QGEGnuB02QA
	M/+snn/Qqqfyjj4sHd3pjz9QDm+YP321+Pks1ka+XswxuoylmSexcHRk3KJ5I3YcX/wFMhs8GycHG
	sMgUVzVZbc/41lhQXDB3QgS1cFzasFFEwyxij7j76vo7XLqrLKAxv6+7UPFI7IgPAdHya8XREjLSC
	xoiI6Mhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EgR-0000000HIXx-3dLG;
	Thu, 02 Apr 2026 09:49:51 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EgP-0000000HIXH-1z8K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 09:49:50 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-43cf7683a28so413516f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 02:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775123388; x=1775728188; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rEH5WzWrgYk3Nyry0RXufGI5C4aPoskx4NXm70qvdmI=;
        b=DCBTIOxmW/vOYlyE/dVcr2sIK+JMtqdy/5te1nQ8qdeGZU/AbELPUPnOusIT3njJyZ
         idY5SDhOQYf9AIm1rl+vfELcmIytfx15ZVGTppEYZfukmSAQXs+LJp0ZBzf7IdqNH6bz
         fdKCvD/tMsyzH2C76ZazVRnJfP3LWPVI+BaNQwo9Fh8x7a06s1Rahi1n/v+mRAkW1Al5
         sgSPnXYaV5PEzMlZcRGeh3LXMuyne7MAGeEchpcozOVr6SfAm549+aC1vEQTPZwTbJlm
         3mwNCkOHfQQGgFQnU+xkfeU1Qbj60dZSzb8Isz5aMarGDlro7egNSa02M9vzp/Acih5w
         iyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775123388; x=1775728188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEH5WzWrgYk3Nyry0RXufGI5C4aPoskx4NXm70qvdmI=;
        b=UbPphMu36qyM7Y4xey/kP7scZuX/G7Pz2gnMpn97fx+tJFgqQCAFGMI2gR5PthP9YC
         VwInxBZs42mQN4jGqTxrQU/rqBFUw+tPzoqNzJprHF8mX21hT4GG/hbj5+roHe44p+pF
         mLDKsGzjnLgIrJ/RMb/L84fDIGhjWsOA67NphumdcK6sdpYZs+NhGqz0BLguKZM/mKJ1
         pH1OADrc+KlxrqlGtOM6x4zy7tpS8hun4b7Ha3CzymIIBpTkBlIMoSEe5voulWW5ZVRu
         asrsc2wblZL0zK3JKbpTakR+DtEeMLnoZEx7Z+RY+B0J9Wv061lL5HvwLYj0Yl197asc
         jumA==
X-Forwarded-Encrypted: i=1; AJvYcCX/ru6oO1kGqXK8ewNLE1IGwOeGHz44WT024lQUHkmeyH7jHo4bjnCssjhY6QRQx5cTHMyojnfWkqN860tunjXN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx41fZJkUzHPVjz5BDdYWpjjbg7nm13H1xrJYxkzglSj76Kmcds
	E18kHjX9A+ntWOxCuIhsem8ToPtpzkl2oSkiob5innWhxSny+hh/24Ng8uFToKuerds=
X-Gm-Gg: AeBDietVNXDkBeD2p+QKdjT/twawM8+AibR3YAqory6pbnTQ6wfzFpUJQCl3NdVbLYW
	2qdSsPNDNuT49iJ13UdLM/sWUySOaDhCtj6fJ2i2aipO+V/af6aHHRMRpil/ocZ1talVMnayLQE
	tD4732kyFxsBqgZPBG61w4Q5rR30Xz7E7acdPUjW8pNyvOMNjps4b8LSkmX46iUQQMAhXHjXaKo
	aRUaQ5NEDczp37ef0TcRoPFR6LSgmsDkwE0HRm4ODq/3+qS3SdSepCKwab7F+guBlRA5RIulPhF
	ZELdQIg6S5hilBPp0TqeT0mQlwMZQpkegVr5BJ6ny8j4LuAL0keNDj+nADcZyD3NWFG1n+v0i6A
	kNnFITGF7493k5+gy5iVsYF+T5KzrlBiU1YjvBmfbG9k/2T8f5ufN1IOq5wGBw1TkU2n9Pn2xKF
	UQYlPwZ5gNK2ztvhS/zz1FZIpZZ2jS
X-Received: by 2002:adf:eac1:0:b0:43d:1c49:ce35 with SMTP id ffacd0b85a97d-43d1c49ce84mr6224854f8f.3.1775123387496;
        Thu, 02 Apr 2026 02:49:47 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f13sm6644433f8f.3.2026.04.02.02.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 02:49:47 -0700 (PDT)
Message-ID: <11fd32e8-07e1-4889-bd02-5eb38b7e1ed1@linaro.org>
Date: Thu, 2 Apr 2026 10:49:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] perf arm_spe: Decode Arm N1 IMPDEF events
To: Leo Yan <leo.yan@arm.com>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Al Grant <al.grant@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260401-james-spe-impdef-decode-v1-0-ad0d372c220c@linaro.org>
 <20260401-james-spe-impdef-decode-v1-3-ad0d372c220c@linaro.org>
 <20260402093234.GG356832@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260402093234.GG356832@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_024949_522010_6CE4F929 
X-CRM114-Status: GOOD (  14.38  )
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



On 02/04/2026 10:32 am, Leo Yan wrote:
> On Wed, Apr 01, 2026 at 03:25:51PM +0100, James Clark wrote:
> 
> [...]
> 
>>   static int arm_spe_pkt_desc_event(const struct arm_spe_pkt *packet,
>> -				  char *buf, size_t buf_len)
>> +				  char *buf, size_t buf_len, u64 midr)
> 
> Just wandering if we can add a "midr" field into struct arm_spe_pkt ?
> Then we don't need to change many functions for populating midr.
> 
> The rest is good for me.
> 
> Thanks,
> Leo

Yeah I can do that. I was worried they were stored in an array and it 
would be a waste of space, but they're not so it's ok.


