Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB437CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 08:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3CuEDhaX34U8xOIhszihEIt8O7F9LQYHVFpCJreLp60=; b=CxW6StfaRi+skQUwLOpeQVOL+1
	/vPjyJi1ZqOegHiRBgwr+zxXKGy5Evc5RC3PAMUr2XbfcQm11CyQB7wx2daDTFBSJjJvCBkI33p5m
	pig9YPFQvGoo+0HSLopYe9himBxg8HErjsuLBGXfy4GEAOnOpZwxUf43501JB9PzqY1F9B+hZTIs/
	WkK3uuSYUT0n9W3xEK3oAi5xV199qpOSbqbjytp9eD6HfWmQ9QN+Jhmo/m2Obx0kuut9MuTsstG7+
	0nr3TwStSvssuCqSyvWc7XLx3vQHuXeDziuaWIuTWWT1nlQzBM/7LBpcP3B8oxQ68R1F6lVmC8fNB
	jid/q/LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjeU-00000003u3e-2EQJ;
	Thu, 08 Oct 2026 08:38:58 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjeS-00000003u37-1A0V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 08:38:57 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48b001cd92bso2595923f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 01:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791448734; x=1792053534; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3CuEDhaX34U8xOIhszihEIt8O7F9LQYHVFpCJreLp60=;
        b=jYLA0B2VwJNBCW7HS0Q5++JF1uBypSNExwsF06ciOpHqp4JXliRd4fpw11KsbqIDPq
         9X9dlxj28q82pBgTObatQaYuzvg2EIbQlIQPJWss8coryUKdiMv1l2mGJH1g2XgW4ROw
         nOT+ryMkzr4qVVE7VjJ+8d8AfLAgpe71xh6di3HDzIEs++wnzG03InhPD/BxbzGe2PaA
         Hdm8ifrawuQpo807Lx2QLgrbgAOFsqpw1Ce4i3LJ+IA2cXfkvQxtLR+EhUzITn70BTEF
         VAdbwSHpBdchpJJBuvWKuaSxi74WG24GeS4rESGgnk1Se9X3FSYa8OyzRXuHh861DvWD
         AQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791448734; x=1792053534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3CuEDhaX34U8xOIhszihEIt8O7F9LQYHVFpCJreLp60=;
        b=zYbxlvHS9BIqOpyreJLpdsd8m6bF4pxTigb/2VsJ9Maloh1MJJ3u50u0BwK9kl13sD
         rM88as03zw2Sfgz36tNYnOovhftJfiWmTChD/GSOjW2nfbp1ecKsYLYmu+ufm7jxramC
         mPE0cipVD9L3Kp9qDtvi5DhfEHIquy2f0mDGyEmPWMjarP4YT+C54EfuySOUnkrdXFFT
         0WQ1xi5Egi42W0aGsVyIoMYooKpWe7Yx6z0DW+2yQBlbTR7I6DcwGqowqXFkMookM7S6
         702ThJcYUp68mEO2zHqmXYQ99vPDGmyB3xqOR8m7fE18RNJBPUAU5ND3d4fpA+3dO4si
         8CkA==
X-Forwarded-Encrypted: i=1; AKwUvBwVB9+zbKibXAbsi8ronR2P3IlmrGFrgbgR+ahzEcoHR8JGJJNiY7Sj6QADH1uc4JDCsE1kiaw6qpgrqYcMSi+V@lists.infradead.org
X-Gm-Message-State: AFq9FYJRW6c2aTN8DxX1VjNR6GCPH1Q8gZzvk1jAAJYr0X+/q/Fxiei7
	ggXwoS4UOyuLIFXfpEDZ1JIzmccOHd+HsXoMDIQOtrl/XudECS0PyGWbTJ7Dcb8U5aY=
X-Gm-Gg: AYBFou03a/pw0w3Bu/80tjyuppGhLzOf2Fd+K6lCi5EP0eya4tNS5dchJ4kMCoYuHzT
	+M0SXX6N8+rqMuMYbfbp1w+QRdcluAzzEFbI77tl6ilcpbIlNSlRmRgOfnsT5rMiCIWn6nZF8F3
	fhClt/yLP3FjloPH+UlGdbQcFk7nLQfIVkJaB3gciOSqnYRivcPbfopwcf3nj1Bgz6m6MfQfzYl
	/wzdodK9vYTzaKij9mC9LlrmvFItiQmcYG5zgYtf+wPQau2txSKRiIoWTyLPFe2Df32DK7TYQ3L
	mT39r28euYpD1UM2ZwJvOe6Au4UnKhiMYvTCCzT83yD23nY0OxGDpgNE8Z0UqK01Vy0Q+1sRQoT
	HTiOL7qe/T+q6fEVDMPbld5Dxbkbd5zz9CGIkXuWW1+sI2945rioMQAu5HbgGyGGzkbivE2fD4X
	m8QSha2LDRe1foPjzO517SxY9vBq721+ougxJDBmGVn8JhibjslFFaxLKdjnRhNiwxtldr5Xibi
	QA=
X-Received: by 2002:adf:f001:0:b0:48a:fbcf:6f43 with SMTP id ffacd0b85a97d-48c72897157mr6861745f8f.54.1791448734070;
        Thu, 08 Oct 2026 01:38:54 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d04c0fsm9919121f8f.10.2026.10.08.01.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 01:38:53 -0700 (PDT)
Message-ID: <ca62f18f-8fa6-4ba1-aae1-59c2db242ab0@linaro.org>
Date: Thu, 8 Oct 2026 09:38:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] coresight: etm4x: Report whether the PMU counts
 external output 1
To: Leo Yan <leo.yan@arm.com>, Amir Ayupov <aaupov@fb.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261001063744.2143819-1-aaupov@fb.com>
 <20261007162406.GA26205@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261007162406.GA26205@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_013856_353434_976D0DEE 
X-CRM114-Status: GOOD (  36.23  )
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



On 07/10/2026 17:24, Leo Yan wrote:
> Hi Amir,
> 
> Thanks for the patch. I have a few initial comments below. We may have
> further feedback after our internal review.
> 
> On Wed, Sep 30, 2026 at 11:37:43PM -0700, Amir Ayupov wrote:
> 
> [...]
> 
>>   #define CS_CFG_MATCH_CLASS_SRC_ALL	0x0001	/* match any source */
>>   #define CS_CFG_MATCH_CLASS_SRC_ETM4	0x0002	/* match any ETMv4 device */
>> +/* ETM external output 1 is countable by the PMU as TRCEXTOUT1 */
>> +#define CS_CFG_MATCH_CAP_PMU_EXTOUT1	0x0004
> 
> Do we need to tie this capability to TRCEXTOUT1? For example, Neoverse
> V2 exposes TRCEXTOUT0 through TRCEXTOUT3 as PMU events.
> 

Shouldn't we also use TRCEXTOUT0 instead of 1? Isn't 1 for devices that 
have two external outputs, but some devices might only have 1 output so 
only have TRCEXTOUT0?

>>   /* flags defining device instance matching - used in config match desc data. */
>>   #define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance of a class */
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
>> index e1a59b4345052..2847d2d7f7bed 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
>> @@ -174,9 +174,14 @@ static int etm4_cfg_load_feature(struct coresight_device *csdev,
>>   
>>   int etm4_cscfg_register(struct coresight_device *csdev)
>>   {
>> +	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>   	struct cscfg_csdev_feat_ops ops;
>> +	u32 match_flags = CS_CFG_ETM4_MATCH_FLAGS;
>>   
>>   	ops.load_feat = &etm4_cfg_load_feature;
>>   
>> -	return cscfg_register_csdev(csdev, CS_CFG_ETM4_MATCH_FLAGS, &ops);
>> +	if (drvdata->pmu_extout1)
>> +		match_flags |= CS_CFG_MATCH_CAP_PMU_EXTOUT1;
>> +
>> +	return cscfg_register_csdev(csdev, match_flags, &ops);
> 
> The current matching logic succeeds if a device and feature share any
> flag bit. If the feature sets both CS_CFG_MATCH_CLASS_SRC_ETM4 and
> CS_CFG_MATCH_CAP_PMU_EXTOUT1, it will still load on an ETM4 device that
> lacks the capability.
> 
> Could we check the capability separately when loading the feature,
> perhaps in cscfg_load_feat_csdev(), and skip it on unsupported devices?
> 
>> +static bool etm4_pmu_has_extout1(struct etmv4_drvdata *drvdata)
>> +{
>> +	int pmuver = read_pmuver();
>> +
>> +	if (!is_midr_in_range_list(etm4_pmu_extout1_cpus))
>> +		return false;
> 
> Based on specific CPU variant, we should already have identified
> TRCEXTOUT has supported.
> 
> So either we only base on MIDR list or we can figure out a reliable
> way to detect the feature dynamically.
> 

At least with ETE the ARM says:

  D4.6.12  External Outputs

  SRBKWBThe   TRCIDR0.NUMEVENT field shows how many ETEEvents are
              for the particular implementation

  0x4011, TRCEXTOUT1, Trace unit external output 1


  D14 PMU Event Descriptions

  The counter counts each event signaled by the trace unit on external
  event 1.

  It is IMPLEMENTATION DEFINED whether this event is available as an
  external input to the ETE.

  PMCEID0_EL0[49] reads as 1 if this event is implemented and 0
  otherwise.

The number of outputs and the PMU event are both discoverable. It 
specifically says that only the external input is implementation 
defined, implying that if it's available it's always connected as an output.

We could leave the MIDR list to only support errata when the external 
output isn't connected to the PMU event.



>> +
>> +	/* PMCEID0_EL0[63:32] describe events 0x4000-0x401f from PMUv3p1 */
>> +	if (!pmuv3_implemented(pmuver) || pmuver < ID_AA64DFR0_EL1_PMUVer_V3P1)
>> +		return false;
>> +	if (!(read_pmceid0() & BIT_ULL(32 + ARMV8_PMUV3_PERFCTR_TRCEXTOUT1 -
>> +				       ARMV8_PMUV3_EXT_COMMON_EVENT_BASE)))
>> +		return false;
>> +
>> +	/* nr_event is TRCIDR0.NUMEVENT, the number of events minus one */
>> +	return drvdata->nr_event >= 1;
>> +}
> 
> [...]
> 
>> @@ -1116,6 +1116,13 @@ int cscfg_csdev_enable_active_config(struct coresight_device *csdev,
>>   
>>   		if (err)
>>   			cscfg_config_desc_put(config_desc);
>> +	} else {
>> +		/*
>> +		 * The configuration is active but was not loaded on this
>> +		 * device, for example because the device lacks a capability
>> +		 * its features require. Fail rather than trace without it.
>> +		 */
>> +		err = -EINVAL;
>>   	}
> 
> This fixes a pre-existing issue. It is worther to put it in a separate
> patch with fixes tag:
> 
> An early return would also avoid the normal enable path's indentation:
> 
> 	if (!config_csdev_active)
> 		return -EINVAL;
> 
> 	err = cscfg_csdev_enable_config(config_csdev_active, preset);
> 	...
> 
> Thanks,
> Leo


