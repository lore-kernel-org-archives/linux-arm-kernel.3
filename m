Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39922CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 14:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EkH9UhD037/tOlhct2dcf8bkxNsOyHNCUyc1hozxGl4=; b=mrRoHLr4POlr5GgCO+/4GBImPx
	rYK89IBtcVAhqsHBcLUacApDO4CGvuYFxgIKAEdrLG4lgjuljqx7zhn6TsVOK5XYnV+FkUgGkPBI/
	zlOBJEVuGP6NZzfyhd8o8s9JDWWbUml8ItzEQzTb4j7MD7UY0SrKViNLV7RHOM2x58T41gTdN5l/f
	omGW9RcJaJiUS/Hv90kX4bPNF7NtJ9dimBDUfnolXbLwJJcHuf9xDRJFrYsg4oZrEE1vtgosDph9V
	yd9VMcizX5kwUIoFlq1lUqULoLr+LmerPfAlmep6EMfvqQolOpo0ri+9E0HiD+W/5J+gbTSvagueW
	6sW6Za3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5ok-0000000Ct07-3JO0;
	Mon, 01 Sep 2025 14:47:34 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3Wy-0000000CLxH-1xd2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:21:05 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3d4dcf3863dso839284f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 05:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756729263; x=1757334063; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EkH9UhD037/tOlhct2dcf8bkxNsOyHNCUyc1hozxGl4=;
        b=YQiwmYZiOtT42MxbIf326C7j3FoNgAyNo46UNKFegDdRvs+lAlkcgpE6EEcx2ohfOu
         cTCoJ0JiWcO4mhADwQi36hnexAqH8D6G04Z1gwwPnSWtQL4f5BNEK0OvVQsH9Tr6N6wR
         J0GbW1IS/NhdtQJ+Y5b/dO168abcS3FzXZe2p5xpt8FPDQdfEnOO/8O9npwpTtmLsB/i
         bpOhk3ff57JV8/unH9fsSG7oBrwZUkxVP+d3kiJAmOoPzyJkytQtXfU0LJ2Rf0sBUq1F
         zBXGY8OgA0oGpX7Ry0OcWZ9KvGWe6LmyZbU5VijNi8/qvdrxJqfN2zNHvUpX/KKM2znt
         NO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756729263; x=1757334063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EkH9UhD037/tOlhct2dcf8bkxNsOyHNCUyc1hozxGl4=;
        b=cPfMMAgbJbWa+8LYaJABDUoDRXHOOodsSfyLmVOBtYvQaWX9ePC37jEbcw8hBQiHUf
         2EMc4PbpeIFnyuXsvhvI30bR7Xv0TsKT4x2YvpJJtfQFQu3uiqXOTV+9ho61xKrHio2L
         Y1tc4w9HsozQO+gujNHd5lQ/KdNL7/3s2oSRAxIS4xds5f/jjx/dbb8HxjIaGV+d6gOj
         5isuCax3V9U7Ulh2FY5V3Ydg3GHIgLsczWVxommPSS1ocV6ooQoHGKrzM3Ts9ZqEbVpB
         9bAfRocD25UQsd4NNZpMs5n6JuKwd/jHwCcP0/NGiU3kUm5Q13MCKTYi/gxjojnaGqj4
         Q+4A==
X-Forwarded-Encrypted: i=1; AJvYcCW+CYl0UkPqy2ovVzikIV7q+qFyBmgJL98CrXUSp/NVxAoj8J3WGmi4gXqCtmYMQw8PndDiPruX9zt2eGDKP7wa@lists.infradead.org
X-Gm-Message-State: AOJu0YwCdSJcmMmbG9913JKKgT82vMAmutf8uQvqSxBAFgzJ+EXXujHO
	V4qQ6ek/2WiYMaRNgui7NhlJghUaq9NV0B97uhmQSqWQnoP3k+AyYxo0B3lo3MnvIWc=
X-Gm-Gg: ASbGncvT2t9IosPYouVVVm/lFS30cdmmMd17YKpowYeE17r9YogTnxoippWR2gFaRgt
	sX+ddub8HX32vJmQJJugtiimE5HuAAA6bQmgw0B2sujIFfUFzXPSaZ8XRAzIhJj3nrrDNCKpKSj
	6vaL0SEfacGXoDh14M87jaXQf5ZAX8ifZ9eGl2/08fICs6Vv9SL2FyDzGo4eLOpu2inyBBRtZaV
	cG+78qBvWzTCkvvBYjL+wI59RLuKlPFqht9StN2vx/XHMElV5k+k4cIfLpwRfXSG3zbpWgR8AuI
	bccXLvMbGiho1otd1YZn5/IafugYgZIfmlY4DJ9n5RqRZtQ/cF2r9tMn8g3uoajHIjm8Awr5Rei
	4Wb0GOkRSUayx3Ce/BkKYWXcBWH8=
X-Google-Smtp-Source: AGHT+IHbSmwRu3Gk1EehF9mFzPZ3IgKGG6T2VrHQ2WXexIn9NyB08JhzOfdoNYyeZhdmO1rufQhWyA==
X-Received: by 2002:a05:6000:1ace:b0:3c4:bc55:65e1 with SMTP id ffacd0b85a97d-3d1dd434397mr6103249f8f.24.1756729262852;
        Mon, 01 Sep 2025 05:21:02 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d60cf93cb2sm5542282f8f.12.2025.09.01.05.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 05:21:02 -0700 (PDT)
Message-ID: <bd224e52-d786-4922-b2ba-b52f0c73badf@linaro.org>
Date: Mon, 1 Sep 2025 13:21:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/12] arm64/boot: Enable EL2 requirements for
 SPE_FEAT_FDS
To: Leo Yan <leo.yan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org>
 <20250814-james-perf-feat_spe_eft-v7-6-6a743f7fa259@linaro.org>
 <20250901101904.GK745921@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250901101904.GK745921@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052104_514268_601583B6 
X-CRM114-Status: GOOD (  17.70  )
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



On 01/09/2025 11:19 am, Leo Yan wrote:
> On Thu, Aug 14, 2025 at 10:25:28AM +0100, James Clark wrote:
> 
> [...]
> 
>> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
>> index 3a4ca7f9acfb..a0361ddcdca4 100644
>> --- a/arch/arm64/include/asm/el2_setup.h
>> +++ b/arch/arm64/include/asm/el2_setup.h
>> @@ -392,6 +392,17 @@
>>   	orr	x0, x0, #HDFGRTR2_EL2_nPMICFILTR_EL0
>>   	orr	x0, x0, #HDFGRTR2_EL2_nPMUACR_EL1
>>   .Lskip_pmuv3p9_\@:
>> +	/* If SPE is implemented, */
>> +	__spe_vers_imp .Lskip_spefds_\@, ID_AA64DFR0_EL1_PMSVer_IMP, x1
>> +	/* we can read PMSIDR and */
>> +	mrs_s	x1, SYS_PMSIDR_EL1
>> +	and	x1, x1,  #PMSIDR_EL1_FDS
>> +	/* if FEAT_SPE_FDS is implemented, */
>> +	cbz	x1, .Lskip_spefds_\@
>> +	/* disable traps to PMSDSFR. */
> 
> Nitpick: the comment is a bit ambiguous for me. Would it be better to
> say "disable traps to EL2" or "set the PMSDSFR bit to disable trapping" ?
> 
> Otherwise, LGTM:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>

The bit we're setting is actually called nPMSDSFR_EL1, but I can change 
it to:

   /* disable traps of PMSDSFR to EL2 */

> 
>> +	orr	x0, x0, #HDFGRTR2_EL2_nPMSDSFR_EL1
>> +
>> +.Lskip_spefds_\@:
>>   	msr_s   SYS_HDFGRTR2_EL2, x0
>>   	msr_s   SYS_HDFGWTR2_EL2, x0
>>   	msr_s   SYS_HFGRTR2_EL2, xzr
>>
>> -- 
>> 2.34.1
>>


