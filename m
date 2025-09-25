Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2577ACAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 10:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOe/V2dIqH8cF6CYVYqeg4xafgczBUe8P8lTChGAnIk=; b=yfdjU7lpu1uERbfNptgujo8z1U
	0QYp953t+Bvbw6b+pU0Mxql8a3zF6wnOoERErb9MxEdzFZjtTiFd51bM/shwT05e0hYDRRydoy+Tf
	GAbY4t9ktsBb1xmd9f2MtxRNGjOSE3yP3OHRHIkjcrmw4LmjOM+R6W50kh2p8up88DFXsVzpEX9nJ
	3X7lMOb0792G+Mxjn13uf9uLUrzUhM1gmallHsspMV3ectIOrzBfwznlU5DKQzNkiEOJT3r1K4Irs
	ShQmdbVUe3VIZQwAPSJbUMVoKiBRTQCLFVRqPJp74P0HWecDpS/WQizpBtdHuSnYT6WxUyLkHxfbp
	5fhvYXJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iwE-00000007xNK-23ti;
	Thu, 25 Sep 2025 10:10:58 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iwB-00000007xKp-1u9m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 10:10:56 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-46e2c3b6d4cso4734205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 03:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758795053; x=1759399853; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rOe/V2dIqH8cF6CYVYqeg4xafgczBUe8P8lTChGAnIk=;
        b=ktnqPsrRik6E+Wa53/uJfa2/Uh7YYM6gxh1AerAPaF+dFZKJ/quZfkhUFK0lc8J+7C
         y6EIs0ARnzfLTJu07MmmgvCBxywiuP0sp6JAvWzs3VnlPmAnWHNRyV3sC6Y73mtfcGCL
         tGdQnPkO7V5zVFiG8EHxg+utyId26kS1Rl1J4i3niE5YXy1WFlI81MUssT2kRlxUh+SW
         r90sL56hc0hzgqmKLjA8xiF+e0hbUcvxMpnRjzngV5Bd9WRIjJj4L6BuX1SAIYUx24OA
         YJzBLZLg+XeWN/SBKQlvmB7p5ZQbP/0G7nUumABUff7cDvmLJKTN8rW9wQso9CxszjRC
         6maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758795053; x=1759399853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rOe/V2dIqH8cF6CYVYqeg4xafgczBUe8P8lTChGAnIk=;
        b=OLkFU5CepJN5CNH2+Mn/XdXEz+yMInECQ3k3OXAVG2CI7b7j4qUj4ggj80JrnsP2PV
         7dDeGRd8vCNzwdm0ns5JsAFMOLF8D2tJfLVONpNNg6NRbA9ss2sNBtS+iXOWFANuU3jb
         8zxW0mNGyY62e/Behwj19dwJNJHDD0deK+jbnEVkrCh0HS+Jder7yJAXw/uBc6IFmUNu
         QV7CFu2Q/FNDAULcCCnumzA20zqnIlxb+PcaJ0cYZmia8Ej96oKXgj/RyHuBWEAq6bb4
         tsLnQhPj4DCDQ9EqXijaeUOd/4FYjRAIT/VNAJQ3rQm8NLuNl9odIG5nFI4RxW4+du+N
         Dfgg==
X-Forwarded-Encrypted: i=1; AJvYcCWp0H2IkpQsnsCHDrqrltBVKmF1IqejHCXXFnA8SERC8tzsYn1og8hYIFKFeq2JZl69t7VfnqraPqFMv2TT5UDV@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5BH5aoUddBf1dvDWE6mEKBUrdCJRYAOYrhgK9jCGloDPn/W2r
	uUhQ0keGpMx36EK0K2ElrPOxw1Mo5jxa/BeE4M7gg9szYXQujzxx12pZ/CmzMRMdwfc=
X-Gm-Gg: ASbGncuH/YU48WdnmBSivOjfNHJMs1j40jYGZyL8fgct+VXDKa7maspEKqtIk52XYK0
	WfSbREXWovnchYdrDbN7C2LF0QrdhA9SiUTkNnCTRbVxAJLnr9SFuS49TaEIS2ShoGuN9/h1H5/
	WCqj7IK4zoLBSdjfqKxXu9pFnKcdgthTDTL4p54yww21CibkhNfQlNLN+lSuR2k7wWVZBtZFrbl
	iEntD15OSTYgMOyj+qrIpIBS0cx7hWWzBdenJEQN453XYwYdupm5nsz3mgfCCplpJLidUvEEN7X
	4Inaj1nZc8X4fqrCPqLAKpBLkjcMDKTZerkEPV3v11gMB/6TS2jbiXBmsxojPETq5cGNVZE7PvV
	a6EGJR6XXVfcx89Cb+836r2MbvZ+x
X-Google-Smtp-Source: AGHT+IFKLqOqt62stWM0T5kpVyIEL9lneNcZ++3W9gEaCXSNMWcezei1Wkk6UZpKhu4oEPAHFgNNEA==
X-Received: by 2002:a05:600c:6306:b0:46d:9d28:fb5e with SMTP id 5b1f17b1804b1-46e329ab29cmr30602985e9.5.1758795053180;
        Thu, 25 Sep 2025 03:10:53 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2ab7d4e3sm69919775e9.23.2025.09.25.03.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 03:10:52 -0700 (PDT)
Message-ID: <635ba698-d7a9-40d0-9285-4ec108d4a536@linaro.org>
Date: Thu, 25 Sep 2025 11:10:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] coresight: tmc: add the handle of the event to
 the path
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>,
 Leo Yan <leo.yan@arm.com>
Cc: Carl Worth <carl@os.amperecomputing.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250922-fix_helper_data-v1-0-905e8115a24e@oss.qualcomm.com>
 <20250922-fix_helper_data-v1-1-905e8115a24e@oss.qualcomm.com>
 <874isuo0m2.fsf@rasp.cworth.amperemail.amperecomputing.com>
 <f7be3833-9b33-4935-b821-a2e0000a2557@oss.qualcomm.com>
 <CAJ9a7VjaUE+iy=FFwPhCdfXgoGR3rP9WSx-ZkKYeCHhqJ2yzMg@mail.gmail.com>
 <3b16607f-8995-46b1-aecf-c6aa79f66f9d@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <3b16607f-8995-46b1-aecf-c6aa79f66f9d@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_031055_570250_A484F5EF 
X-CRM114-Status: GOOD (  39.74  )
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



On 24/09/2025 5:42 pm, Suzuki K Poulose wrote:
> On 24/09/2025 11:21, Mike Leach wrote:
>> Hi,
>>
>> On Tue, 23 Sept 2025 at 02:49, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>>
>>>
>>>
>>> On 9/23/2025 1:31 AM, Carl Worth wrote:
>>>> Jie Gan <jie.gan@oss.qualcomm.com> writes:
>>>>> From: Carl Worth <carl@os.amperecomputing.com>
>>>>>
>>>>> The handle is essential for retrieving the AUX_EVENT of each CPU 
>>>>> and is
>>>>> required in perf mode. It has been added to the coresight_path so that
>>>>> dependent devices can access it from the path when needed.
>>>>
>>>> I'd still like to have the original command I used to trigger the 
>>>> bug in
>>>> the commit message. I really like having reproduction steps captured in
>>>> commit messages when I look back at commits in the future. So, that 
>>>> was:
>>>>
>>>>         perf record -e cs_etm//k -C 0-9 dd if=/dev/zero of=/dev/null
>>>>
>>>
>>> Sure, I’ll include your commit message in the formal patch series, I
>>> think it's V3 since you have submitted two versions, if you're okay with
>>> me sending it out.
>>>
>>>>>    /**
>>>>>     * struct coresight_path - data needed by enable/disable path
>>>>> - * @path_list:              path from source to sink.
>>>>> - * @trace_id:          trace_id of the whole path.
>>>>> + * @path_list:                      path from source to sink.
>>>>> + * @trace_id:                       trace_id of the whole path.
>>>>> + * struct perf_output_handle:       handle of the aux_event.
>>>>>     */
>>>>
>>>> Fixing to "@handle" was mentioned in another comment already.
>>>>
>>>> Something about the above still feels a little off to me. It feels like
>>>> we're throwing new data into a structure just because it happens to be
>>>> conveniently at hand for the code paths we're needing, and not because
>>>> it really _belongs_ there.
>>>>
>>>
>> This data is perf specific - not path generic; so I agree that this
>> structure should go elsewhere.
>>
>> I would suggest in the csdev (coresight_device) structure itself. We
>> already have some sink specific data in here e.g. perf_sink_id_map.
>>
>> This could then be set/clear in the functions coresight-etm-perf.c
>> file, where there is a significant amount of code dealing with the
>> perf handle and ensuring it is valid and in scope.
>>
>> This can then be set only when appropriate - for source / sink devices
>> and only when in perf mode, and avoid the need to pass the handle
>> around as API call parameters.
> 
> I think this data is specific to the session we are enabling the
> device(s) in. e.g., we keep the trace-id in the path.
> So, I don't mind having this in the path structure.
> Instead of modifying csdev with additional locking from "etm-perf"
> it is always cleaner to handle this in the path.
> 
> 
> Suzuki
> 
> 

Yeah, and perf_sink_id_map only "needs" to be in the csdev because it 
controls sharing IDs between multiple paths which can't be accomplished 
by storing it in the path.

This one is just a pointer to the perf handle which really does belong 
to the session rather than the device. This makes it more of a path 
thing than a csdev thing. Maybe we can rename path to be more like 
"session", which also happens to contain a path. But I think path is 
fine for now.

However in this case handle is per-cpu data that is only accessed on the 
same cpu in tmc_etr_get_buffer(). Assigning it in etm_event_start() just 
copies the same per-cpu variable into a non per-cpu place that 
eventually gets accessed on the same cpu anyway.

If we exported it then it can be used directly without worrying where to 
store it:

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c 
b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 17afa0f4cdee..4c33f442c80b 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -42,12 +42,8 @@ static bool etm_perf_up;
   * the ETM. Thus the event_data for the session must be part of the 
ETM context
   * to make sure we can disable the trace path.
   */
-struct etm_ctxt {
-       struct perf_output_handle handle;
-       struct etm_event_data *event_data;
-};
-
-static DEFINE_PER_CPU(struct etm_ctxt, etm_ctxt);
+DEFINE_PER_CPU(struct etm_ctxt, etm_ctxt);
+EXPORT_SYMBOL_GPL(etm_ctxt);
  static DEFINE_PER_CPU(struct coresight_device *, csdev_src);

  /*
diff --git a/drivers/hwtracing/coresight/coresight-priv.h 
b/drivers/hwtracing/coresight/coresight-priv.h
index fd896ac07942..b834e8bef2a5 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -14,6 +14,7 @@

  extern struct mutex coresight_mutex;
  extern const struct device_type coresight_dev_type[];
+DECLARE_PER_CPU(struct etm_ctxt, etm_ctxt);

  /*
   * Coresight management registers (0xf00-0xfcc)
@@ -49,6 +50,11 @@ extern const struct device_type coresight_dev_type[];
  #define ETM_MODE_EXCL_HOST     BIT(32)
  #define ETM_MODE_EXCL_GUEST    BIT(33)

+struct etm_ctxt {
+       struct perf_output_handle handle;
+       struct etm_event_data *event_data;
+};
+
  struct cs_pair_attribute {
         struct device_attribute attr;
         u32 lo_off;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c 
b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index bf08f6117a7f..7026994b02b3 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1328,8 +1328,9 @@ struct etr_buf *tmc_etr_get_buffer(struct 
coresight_device *csdev,
                                    enum cs_mode mode,
                                    struct coresight_path *path)
  {
-       struct perf_output_handle *handle = path->handle;
         struct etr_perf_buffer *etr_perf;
+       struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
+       struct perf_output_handle *handle = &ctxt->handle;

         switch (mode) {
         case CS_MODE_SYSFS:


>>
>> Regards
>>
>> Mike.
>>
>>
>>
>>
>>> The core idea behind coresight_path is that it can hold all the data
>>> potentially needed by any device along the path.
>>>
>>> For example with the path ETM->Link->ETR->CATU:
>>>
>>> All the mentioned devices operate by forming a path, for which the
>>> system constructs a coresight_path. This 'path' is then passed to each
>>> device along the route, allowing any device to directly access the
>>> required data from coresight_path instead of receiving it as a separate
>>> argument.
>>>
>>> Imagine a device that requires more than two or three arguments, and you
>>> want to pass them through coresight_enable_path or similar functions...
>>>
>>> For certain coresight_path instances, we may not need the handle or
>>> other parameters. Since these values are initialized, it's acceptable to
>>> leave them as NULL or 0.
>>>
>>>
>>>> Or, maybe it's the right place for it, and the cause of my concern is
>>>> that "path" is an overly-narrow name in struct coresight_path?
>>>>
>>>
>>> It defines the direction of data flow—serving as the path for trace 
>>> data.
>>>
>>> Thanks,
>>> Jie
>>>
>>>> But if a renaming of this structure would improve the code, I'd also be
>>>> fine with that happening in a subsequent commit, so I won't try to hold
>>>> up the current series based on that.
>>>>
>>>> -Carl
>>>
>>
>>
>> -- 
>> Mike Leach
>> Principal Engineer, ARM Ltd.
>> Manchester Design Centre. UK
> 


