Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C56CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 08:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4oh6onDlVjvp1IfHH4qQc3z7nyZeWUrRcec4LCAE8p8=; b=T8yu3ptbDXMU5T5OTzuL1pxjP1
	BmqUF/E9QAN9fcm4pRZZEuTYC8RLYngDnI4TnIIOuB8G93QSqsOoRzf2PLA0kdW/yRJHRhVTuSRLY
	kkUczfb6lLVMkv/3PP0GGHC916ZT1B7G2T2xASvkhsvgXsm8481pzX57siZ9ZoPZAEcFvRja22Oaf
	iHGwTTB1HwvUJM3RMmUmbnQmIV79Yv1rnpyc+fNfUNFChP/st7A86hkwewq7oEB5Syhc+dd3lLXke
	KU8XkGKwF1BSks3amAJet/u6DTUoGkZDmC1g9yFQruL0ZAE9FmnZQ9bR35FeN/Vj64HQA/A4vsyc7
	PqwEsNeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPcRh-00000003yjv-3il1;
	Wed, 20 May 2026 08:38:29 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPcRe-00000003yjE-2rua
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 08:38:28 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so29593535e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 01:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779266305; x=1779871105; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4oh6onDlVjvp1IfHH4qQc3z7nyZeWUrRcec4LCAE8p8=;
        b=NHSpGrtFUvjp/rZ3/6YIgrJy403FSmeVBEvyUZDWqFF5bEU4XUFKpKkPk/vvlUmsMP
         IcKdzo3d7+SgTAUQc7AhzPXXdlRlNQVq5Jk8F4zPdM8ahvXUvYX+sExwJjn5Fa3FdKCd
         T6/S/zk0/GbmtYZvs7g0f2Y3BHVwwsweUWxsSMNYLBLHTLyUiYrJ6C2tzIDJb+c8uCgc
         XdpqcGKAF/Opzg2v/CElLai6QzcX+GGLBX3AJMpzlBqdPi/7LshIJF5MVwsfQOC+bURl
         k7YxOH8zZELOqvMklGV7X4+Cc8LcTlYsWefLv1WkEQyBOkvY1ZGWI/MKgqcj00BflYHR
         vmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779266305; x=1779871105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4oh6onDlVjvp1IfHH4qQc3z7nyZeWUrRcec4LCAE8p8=;
        b=SKoIw6mFC443LSImmOM7cDwWXrfb4ev0CbwJo74Fguqsw5Ql0Mt7Jh6wD3xl2kExsO
         qLhHVhXKqSxzkdcWChWOkUx8hDCfK1rOTK/pLLgu4fFiW2B7otT7b6B5rMtLSzXOUXQM
         6+3sX6ZbW9IhZZoHazsouzLrmFEUzqoAeGsFqRa29ZF1gzHtushFoRs8HHF6XM0e+apq
         L281IJqpHT7jA3adDK6lD0TsdlHpM91mDS6As1I8CNBv8RNBgvEOzAx19JTNdXM31O8l
         BHaBTTZIjIEv29KavstoFUDuLM1lV8KFzyeBM7fm7W9Eaf2L7iDuQt0W/1qa/VZK3s3A
         YacQ==
X-Forwarded-Encrypted: i=1; AFNElJ+alhabGOeCu/v5NczOxQPb49xDTACzAUUzRLRPHeBNMBdISCHhJAYurXxBaVWs5CI4cYOIC3EOdAaGdBj9W2g+@lists.infradead.org
X-Gm-Message-State: AOJu0YzZqzZcPBjZG7jHrExr2c+h4h2LuZCVflAYtawsHUb8lv/GL3Sl
	0fuuQfhePoYcOL5UE58+RdBV8mD5h914al4BbWDoup0YA6KFB3NXPkhPnl6wyu6OeSM=
X-Gm-Gg: Acq92OFlOVHLxv9Wep1DRmbJC9347mcyBRXZEQh0wcKj+UfyPptdWIe8SW8WjXFnEBn
	2AwIGSMw4YDR9n5ZXSqBujZi2+0J2k7z3eqKsFxH/S4Wv3end7L8WuzJhn2CYvrUGkNRVcxzaCy
	pdGNTswQMI1fN99SktYt5OhAxodTGOQrEoAZbW2gKGSnEaAYanjWSGxSIdLPdHSYITHkQPvEuC+
	1sukD4ThVteIoUAsP0xo4FW/lxthz3NHnhoq94vJ/q8V3dgjZSNE9DpcafUKEMlzUuu6G8PdqzZ
	jlnSwtXERvnynM0iT6QmgJdGS/U9ehOGcT7qGmffVYOu5Hn4pb17C6Vn7OTzcbt5PRT07mejzBB
	xPXtN5iOnsmeDKZuP737/+AY5UgQrTA3lbBwn5mcUez78kooI624nAFPaQPNAiEwORkrXzYibFP
	R63RLqiREsPsHfeXvLOCkq62tcxN6e
X-Received: by 2002:a05:600d:644f:10b0:48e:9134:6ae7 with SMTP id 5b1f17b1804b1-48fd62d9be0mr298109465e9.0.1779266304817;
        Wed, 20 May 2026 01:38:24 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a17ec2sm49106031f8f.24.2026.05.20.01.38.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 01:38:24 -0700 (PDT)
Message-ID: <dea28a56-a5d8-46ef-a782-a95073714377@linaro.org>
Date: Wed, 20 May 2026 09:38:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: fix resource leaks on path build failure
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260513-fix-memory-leak-issue-v1-1-49822d7bc7d4@oss.qualcomm.com>
 <f347bad3-4a11-4f65-b35f-f59c6360ac5b@linaro.org>
 <5b3785a1-0f53-4b61-bc18-880091c2ce12@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <5b3785a1-0f53-4b61-bc18-880091c2ce12@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_013826_756637_2FADAEC3 
X-CRM114-Status: GOOD (  26.90  )
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



On 20/05/2026 2:55 am, Jie Gan wrote:
> 
> 
> On 5/19/2026 9:57 PM, James Clark wrote:
>>
>>
>> On 13/05/2026 2:32 am, Jie Gan wrote:
>>> Two related leaks when _coresight_build_path() encounters an error after
>>> coresight_grab_device() has already incremented the pm_runtime, module,
>>> and device references for a node:
>>>
>>> 1. In _coresight_build_path(), if kzalloc_obj() for the path node fails
>>>     after coresight_grab_device() succeeds, coresight_drop_device() was
>>>     never called, permanently leaking all three references.
>>>
>>> 2. In coresight_build_path(), on failure the partial path was freed with
>>>     kfree(path) instead of coresight_release_path(path).  kfree() only
>>>     frees the coresight_path struct itself; it does not iterate 
>>> path_list
>>>     to call coresight_drop_device() and kfree() for each coresight_node
>>>     already added by deeper recursive calls, leaking both the 
>>> pm_runtime,
>>>     module, and device references and the node memory for every element
>>>     on the partial path.
>>>
>>> Fix both by adding coresight_drop_device() in the OOM unwind of
>>> _coresight_build_path(), and replacing kfree(path) with
>>> coresight_release_path(path) in coresight_build_path().
>>>
>>> Fixes: 32b0707a4182 ("coresight: Add try_get_module() in 
>>> coresight_grab_device()")
>>> Fixes: b3e94405941e ("coresight: associating path with session rather 
>>> than tracer")
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>>   drivers/hwtracing/coresight/coresight-core.c | 6 ++++--
>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>>> hwtracing/coresight/coresight-core.c
>>> index 46f247f73cf6..c1354ea8e11d 100644
>>> --- a/drivers/hwtracing/coresight/coresight-core.c
>>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>>> @@ -825,8 +825,10 @@ static int _coresight_build_path(struct 
>>> coresight_device *csdev,
>>>           return ret;
>>>       node = kzalloc_obj(struct coresight_node);
>>> -    if (!node)
>>> +    if (!node) {
>>> +        coresight_drop_device(csdev);
>>>           return -ENOMEM;
>>> +    }
>>>       node->csdev = csdev;
>>>       list_add(&node->link, &path->path_list);
>>> @@ -851,7 +853,7 @@ struct coresight_path 
>>> *coresight_build_path(struct coresight_device *source,
>>>       rc = _coresight_build_path(source, source, sink, path);
>>>       if (rc) {
>>> -        kfree(path);
>>> +        coresight_release_path(path);
>>>           return ERR_PTR(rc);
>>>       }
>>>
>>> ---
>>> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
>>> change-id: 20260513-fix-memory-leak-issue-034b4a45265e
>>>
>>> Best regards,
>>
>> Looks good to me, but sashiko is complaining: https://sashiko.dev/#/ 
>> patchset/20260513-fix-memory-leak-issue- 
>> v1-1-49822d7bc7d4%40oss.qualcomm.com
>>
>> I'm trying to understand why it's saying that, but I think the 
>> scenario is that if there are multiple correct paths to a sink, when 
>> one path partially fails and a second path succeeds you could get a 
>> path_list with some garbage entries in it.
> 
> I think the coresight_release_path is added to address this situation.
> We suffered the path partially failure, and we need release all nodes 
> already added to the path.
> 

It wouldn't call coresight_release_path() in this case though. If one 
path ends up building to success but a parallel path partially failed 
then _coresight_build_path() still returns success. During the search it 
would have still added the nodes from the partially failed path to the 
path_list. This is only an issue if there are multiple correct paths.

>>
>> That's kind of a different and existing issue to the one you've fixed, 
>> and assumes that multiple paths to one sink are possible, which I'm 
>> not sure is supported?
> 
> Each path is unique. We only deal with the issue path for balancing the 
> reference count.
> 
> Thanks,
> Jie
> 

I'm not exactly sure what you mean by unique, but the same source and 
sink could potentially be connected through two different sets of links.

>>
>> It might be as easy as breaking the loop early for any return value 
>> other than -ENODEV, but I'll leave it to you to decide whether to do 
>> that here or not.
>>
>> Reviewed-by: James Clark <james.clark@linaro.org>
>>
> 


