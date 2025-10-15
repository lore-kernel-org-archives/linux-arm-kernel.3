Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AC3CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 14:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2NWaYEYLQddik1cbxrMAgVpyoQxDPjwCbyrPoo8tvR8=; b=lbDWxHT1LFbFF6JNNBOC+JHeiS
	VEzOm2pO0Co7VPqCzQv4lielf14sRuH5xJJmYWPALQFuPVvYCVTFmfb7bzglrWfzMLk4QD+OjiDLe
	eD9Hct61LOlh3TJ9ZBJk+FnLjqJzEd3HXpkt+v2Qd7fkMwoPE9Rf/KhWSYYvL0+hytlWCEtgIC6VL
	piC49JWjAdKyJTuydQ4sxsvjhF6cbuwHhe9LyAsPzfc6wFgej+nTAfBoi+Je/oVOgrbQAbK3sHMSK
	Irap39RxNxfY9viqIArGqKXGfmtoPp402XfyEV5X/QEKKxoA2Gnsv8cAyV/YlD+9wyBAuZPW7oVSW
	BZXERbiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92ey-00000001vU0-1HFX;
	Wed, 15 Oct 2025 14:39:24 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92ev-00000001vT0-3pOw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 14:39:23 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-46e33b260b9so53910085e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 07:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760539160; x=1761143960; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2NWaYEYLQddik1cbxrMAgVpyoQxDPjwCbyrPoo8tvR8=;
        b=lDUbq1a1tDYseT/0q7NLtKZ0rJRXaUt6QRLsROpqfKJ+YGAa9GRBNlQW62hsEJrts8
         7rZUHVS52A1+G1GjnsCtQXbHemsyIrFG24VCUY0BNR5AjfzS+cFXlqdFdLd/CMhtall+
         hSj7pO12hCpAlpVExOMwdlmhreR5kegM1IDAmcUdSYkrbdyCUu8gid38mhxXSj824glS
         otSflEtIgyC3NQ59RYNHXfwi+oA8HswjDxBy+8o9B31X+Tx/s2LVolkjecW9ukMU6sfz
         iIxLfEVDmL4daFXm0Vu5xpFVh7F/9HKgRi0usjmV/JoppWAqHLwlvo0keapH/hIdyglY
         YjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760539160; x=1761143960;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2NWaYEYLQddik1cbxrMAgVpyoQxDPjwCbyrPoo8tvR8=;
        b=NTyqRo5xk/kVf7ELezZFGvKTQRoYwdFuiuCR3TgZ0F1BldOrEcDzZVR+lZabNWmwdS
         Rz97XxwT9g6vp9Q9nMGmSrH+a2xy/vPJ3V7/teBlLCRMu6maBXf/QMlaFEItxrciMVe6
         Y5zbE4FAVGr/n7cgjHDxeLXE1zBzWCicsZPk7dFqIvupk/IxIJJlE/gsP1ChoddYIFm2
         /r++Ui8VI0mA51R6FhNJDX2qAYYL6vv/vaZ2OukBS9xujS5Adn+xZe45Sxp7f/UPPvIx
         jkIWqtj6NArp+xMtNdE8eL4nluVTgWtZFNcudawQRXAiGenFAMBsKxetXFvAXAlZvXO5
         cr/A==
X-Forwarded-Encrypted: i=1; AJvYcCWNf0CDVrBixtXDbVJqp2uZFzT2ytWEeWvRPe01cTGG96e4AxuCTguIHIPSvYZ9hfVKsnt4C0sPmvrcjs1Tsxex@lists.infradead.org
X-Gm-Message-State: AOJu0YwP38meuo8onHp4IXcn0bmqSHKaw/R+bjDmAffdzAo/jhkfP3aJ
	JkWEG+IR9v4bU7AvGON2HcBMdyQUC7e2IR9E4pyI4VQKIuTXGd6eUDY08ehS3wVq0j0=
X-Gm-Gg: ASbGnctQ4KoKTDYkRVyVg85YmbWY8+09itXLrY2fWDV7Np8XoBOyKqFqoXrmDBTg9gH
	hsUMUo5HoF7R3vIFoBMiTNqp4gz5e4pEclbcP/aU90B5eJ7esiSMb+mYj4MAejwmXkXghUBQ/Dv
	5N2bbf8spwcd81gk6a6Jqlia4jlPZQGhoO8wxzBsmwf408+7ss2AmzvYFiIEJ3jqoLrBfLTPyYD
	PIaNrEesVIrwHcQdk7mps7PG4waiexvO8oHfLKpFW3WtUTnMqJWjy5OgmGVPy7LYI9kuI7h3OmP
	pE16h1xU+Voqb1JWg1S8b4KaLph4B7aeD21QtHky7EEMgppNLZW3NpXIPrc+lNNqqFqHlWd1fw/
	TEPC4XSEyr02bvXBouyXub0h2lYS4GLQR5U+DDQrSf6ZcMw4umbk=
X-Google-Smtp-Source: AGHT+IGH5AEBTaoFH9gRVPnvA7F0J9tUlRbBsBoHjKor3wYJNGBDeV5cNwCHITXzKqNJHSYykywIdw==
X-Received: by 2002:a05:600c:1e87:b0:46e:4b89:13d9 with SMTP id 5b1f17b1804b1-46fa9a22e67mr203510305e9.0.1760539159786;
        Wed, 15 Oct 2025 07:39:19 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47106fc96bbsm10994375e9.3.2025.10.15.07.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 07:39:19 -0700 (PDT)
Message-ID: <776064a4-d5e1-4a1e-b992-8f776d68da88@linaro.org>
Date: Wed, 15 Oct 2025 15:39:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] coresight: Refactor etm4_config_timestamp_event()
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org>
 <20251002-james-cs-syncfreq-v3-3-fe5df2bf91d1@linaro.org>
 <CAJ9a7VgOO1pmS0chOXugC7eR06v_Tu8onjJA7rnbqcBdZ2m1iA@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAJ9a7VgOO1pmS0chOXugC7eR06v_Tu8onjJA7rnbqcBdZ2m1iA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_073922_021550_628FFAA2 
X-CRM114-Status: GOOD (  45.66  )
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



On 09/10/2025 5:02 pm, Mike Leach wrote:
> Hi James,
> 
> On Thu, 2 Oct 2025 at 11:09, James Clark <james.clark@linaro.org> wrote:
>>
>> Remove some of the magic numbers and try to clarify some of the
>> documentation so it's clearer how this sets up the timestamp interval.
>>
>> Return errors directly instead of jumping to out and returning ret,
>> nothing needs to be cleaned up at the end and it only obscures the flow
>> and return value.
>>
>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 95 ++++++++++++++--------
>>   drivers/hwtracing/coresight/coresight-etm4x.h      | 20 +++--
>>   2 files changed, 77 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> index 020f070bf17d..920d092ef862 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>> @@ -609,18 +609,33 @@ static void etm4_enable_hw_smp_call(void *info)
>>    * TRCRSCTLR1 (always true) used to get the counter to decrement.  From
>>    * there a resource selector is configured with the counter and the
>>    * timestamp control register to use the resource selector to trigger the
>> - * event that will insert a timestamp packet in the stream.
>> + * event that will insert a timestamp packet in the stream:
>> + *
>> + *  +--------------+
>> + *  | Resource 1   |   fixed "always-true" resource
>> + *  +--------------+
>> + *         |
>> + *  +------v-------+
>> + *  | Counter x    |   (reload to 1 on underflow)
>> + *  +--------------+
>> + *         |
>> + *  +------v--------------+
>> + *  | Resource Selector y |   (trigger on counter x == 0)
>> + *  +---------------------+
>> + *         |
>> + *  +------v---------------+
>> + *  | Timestamp Generator  |  (timestamp on resource y)
>> + *  +----------------------+
>>    */
>>   static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>>   {
>> -       int ctridx, ret = -EINVAL;
>> -       int counter, rselector;
>> -       u32 val = 0;
>> +       int ctridx;
>> +       int rselector;
>>          struct etmv4_config *config = &drvdata->config;
>>
>>          /* No point in trying if we don't have at least one counter */
>>          if (!drvdata->nr_cntr)
>> -               goto out;
>> +               return -EINVAL;
> 
> As you mention elsewhere - TS will always be output for at least every
> 4096 bytes - so if we have no counter perhaps we can live with that.
> Previously we where trying to get as fast as possible, now we want to
> slow them down - so every 4096 looks a decent compromise if the
> hardware has no counters.
> TRCTSCTLR will be 0 - which selects the false event - so only the
> non-event timestamps occur. Returning 0 here will enable the non event
> timestamps
> 
> What this means is if the user selects timestamps, there will always
> be at least some timestamps output.
> 
> Alternatively, TRCTSCTLR = 0x1 selects the TRUE event - which might
> result once again in the etm attempting to insert timestamps at every
> available opportunity. - though never tried this!
> 

I tested it and it doesn't make a difference to the frequency (on N1SDP) 
whether the TRUE resource is used directly or routed through the counter 
with reload value = 1. When I first looked at the function I was under 
the impression that TRCTSCTLR.SEL couldn't use the TRUE resource 
directly, and it had to go through a counter. But looks like that's not 
the case so I'm not sure why it wasn't done that way in the first place.

We could change it so that if ts_level == 1 then don't consume a counter 
and use the TRUE resource. But I'm not sure if it's worth it because 
nobody ever complained, so it could be adding complexity where it's not 
needed.

I also wouldn't do it if ts_level > 1 and no counters are available. I 
think continuing to return an error is better in that case because we 
can't give the user what they asked for.

>>
>>          /* Find a counter that hasn't been initialised */
>>          for (ctridx = 0; ctridx < drvdata->nr_cntr; ctridx++)
>> @@ -630,15 +645,17 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>>          /* All the counters have been configured already, bail out */
>>          if (ctridx == drvdata->nr_cntr) {
>>                  pr_debug("%s: no available counter found\n", __func__);
>> -               ret = -ENOSPC;
>> -               goto out;
>> +               return -ENOSPC;
>>          }
>>
>>          /*
>> -        * Searching for an available resource selector to use, starting at
>> -        * '2' since every implementation has at least 2 resource selector.
>> -        * ETMIDR4 gives the number of resource selector _pairs_,
>> -        * hence multiply by 2.
> 
> Well - from ETMv4.3 that statement is not true - there can be no RS
> pairs - but no RS pairs forces no counters so should not actually get
> here.
> Needs comment to reflect this.
> 
> 

Will insert "...every implementation _with counters_ has at least..."

>> +        * Searching for an available resource selector to use, starting at '2'
>> +        * since resource 0 is the fixed 'always returns false' resource and 1
>> +        * is the fixed 'always returns true' resource. See IHI0064H_b '7.3.64
>> +        * TRCRSCTLRn, Resource Selection Control Registers, n=2-31'.
>> +        *
>> +        * ETMIDR4 gives the number of resource selector _pairs_, hence multiply
>> +        * by 2.
>>           */
>>          for (rselector = 2; rselector < drvdata->nr_resource * 2; rselector++)
>>                  if (!config->res_ctrl[rselector])
>> @@ -647,13 +664,9 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>>          if (rselector == drvdata->nr_resource * 2) {
>>                  pr_debug("%s: no available resource selector found\n",
>>                           __func__);
>> -               ret = -ENOSPC;
>> -               goto out;
>> +               return -ENOSPC;
>>          }
>>
>> -       /* Remember what counter we used */
>> -       counter = 1 << ctridx;
>> -
>>          /*
>>           * Initialise original and reload counter value to the smallest
>>           * possible value in order to get as much precision as we can.
>> @@ -661,26 +674,42 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata)
>>          config->cntr_val[ctridx] = 1;
>>          config->cntrldvr[ctridx] = 1;
>>
>> -       /* Set the trace counter control register */
>> -       val =  0x1 << 16        |  /* Bit 16, reload counter automatically */
>> -              0x0 << 7         |  /* Select single resource selector */
>> -              0x1;                /* Resource selector 1, i.e always true */
>> -
>> -       config->cntr_ctrl[ctridx] = val;
>> -
>> -       val = 0x2 << 16         | /* Group 0b0010 - Counter and sequencers */
>> -             counter << 0;       /* Counter to use */
>> -
>> -       config->res_ctrl[rselector] = val;
>> +       /*
>> +        * Trace Counter Control Register TRCCNTCTLRn
>> +        *
>> +        * CNTCHAIN = 0, don't reload on the previous counter
>> +        * RLDSELF = true, reload counter automatically on underflow
>> +        * RLDTYPE = 0, one reload input resource
>> +        * RLDSEL = 0, reload on resource 0 (fixed always false resource, never
>> +        *             reload)
>> +        * CNTTYPE = 0, one count input resource
>> +        * CNTSEL = 1, count on resource 1 (fixed always true resource, always
>> +        *             decrement)
>> +        */
>> +       config->cntr_ctrl[ctridx] = TRCCNTCTLRn_RLDSELF |
>> +                                   FIELD_PREP(TRCCNTCTLRn_CNTSEL_MASK, 1);
>>
> 
> if we are eliminating magic numbers - the '1' here should be something
> like RESOURCE_SEL_TRUE?
> 

Given that resource 0 and 1 are fixed function, yes I think a #define 
for them could be clearer.


Thanks
James

>> -       val = 0x0 << 7          | /* Select single resource selector */
>> -             rselector;          /* Resource selector */
>> +       /*
>> +        * Resource Selection Control Register TRCRSCTLRn
>> +        *
>> +        * PAIRINV = 0, INV = 0, don't invert
>> +        * GROUP = 2, SELECT = ctridx, trigger when counter 'ctridx' reaches 0
>> +        *
>> +        * Multiple counters can be selected, and each bit signifies a counter,
>> +        * so set bit 'ctridx' to select our counter.
>> +        */
>> +       config->res_ctrl[rselector] = FIELD_PREP(TRCRSCTLRn_GROUP_MASK, 2) |
>> +                                     FIELD_PREP(TRCRSCTLRn_SELECT_MASK, 1 << ctridx);
>>
>> -       config->ts_ctrl = val;
>> +       /*
>> +        * Global Timestamp Control Register TRCTSCTLR
>> +        *
>> +        * TYPE = 0, one input resource
>> +        * SEL = rselector, generate timestamp on resource 'rselector'
>> +        */
>> +       config->ts_ctrl = FIELD_PREP(TRCTSCTLR_SEL_MASK, rselector);
>>
>> -       ret = 0;
>> -out:
>> -       return ret;
>> +       return 0;
>>   }
>>
>>   static int etm4_parse_event_config(struct coresight_device *csdev,
>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
>> index 813e7208ad17..a06338851ef5 100644
>> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
>> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
>> @@ -225,6 +225,16 @@
>>   #define TRCRSCTLRn_GROUP_MASK                  GENMASK(19, 16)
>>   #define TRCRSCTLRn_SELECT_MASK                 GENMASK(15, 0)
>>
>> +#define TRCCNTCTLRn_CNTCHAIN                   BIT(17)
>> +#define TRCCNTCTLRn_RLDSELF                    BIT(16)
>> +#define TRCCNTCTLRn_RLDTYPE                    BIT(15)
>> +#define TRCCNTCTLRn_RLDSEL_MASK                        GENMASK(12, 8)
>> +#define TRCCNTCTLRn_CNTTYPE_MASK               BIT(7)
>> +#define TRCCNTCTLRn_CNTSEL_MASK                        GENMASK(4, 0)
>> +
>> +#define TRCTSCTLR_TYPE                         BIT(7)
>> +#define TRCTSCTLR_SEL_MASK                     GENMASK(4, 0)
>> +
>>   /*
>>    * System instructions to access ETM registers.
>>    * See ETMv4.4 spec ARM IHI0064F section 4.3.6 System instructions
>> @@ -824,7 +834,7 @@ struct etmv4_config {
>>          u32                             eventctrl0;
>>          u32                             eventctrl1;
>>          u32                             stall_ctrl;
>> -       u32                             ts_ctrl;
>> +       u32                             ts_ctrl; /* TRCTSCTLR */
>>          u32                             ccctlr;
>>          u32                             bb_ctrl;
>>          u32                             vinst_ctrl;
>> @@ -837,11 +847,11 @@ struct etmv4_config {
>>          u32                             seq_rst;
>>          u32                             seq_state;
>>          u8                              cntr_idx;
>> -       u32                             cntrldvr[ETMv4_MAX_CNTR];
>> -       u32                             cntr_ctrl[ETMv4_MAX_CNTR];
>> -       u32                             cntr_val[ETMv4_MAX_CNTR];
>> +       u32                             cntrldvr[ETMv4_MAX_CNTR]; /* TRCCNTRLDVRn */
>> +       u32                             cntr_ctrl[ETMv4_MAX_CNTR];  /* TRCCNTCTLRn */
>> +       u32                             cntr_val[ETMv4_MAX_CNTR]; /* TRCCNTVRn */
>>          u8                              res_idx;
>> -       u32                             res_ctrl[ETM_MAX_RES_SEL];
>> +       u32                             res_ctrl[ETM_MAX_RES_SEL]; /* TRCRSCTLRn */
>>          u8                              ss_idx;
>>          u32                             ss_ctrl[ETM_MAX_SS_CMP];
>>          u32                             ss_status[ETM_MAX_SS_CMP];
>>
>> --
>> 2.34.1
>>
> 
> Regards
> 
> Mike
> 
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK


