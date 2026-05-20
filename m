Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5CBCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIImJajPM9fYtSPEthXg6jhil34ku8GvsFFkCo+lnSY=; b=JT6TJ/7/0A9dkKBe4Bx5MS19+l
	KPp1sgNSXXNxeC54EqILgpxWDnw7hJoJBL2jBZ9zqKv+57pSftpv8x0j8RCQeJjF2lZx1NpQ14Gna
	1ucOTGVZXMaqrX6VndgNAJ+XUpqoRMywr0q1fB5U7xaxi+vs3c0bxMTldyNmw1RfeJHm3bm+n3hqI
	c9jdcqeJ79AaP/Z9R0dihI86sw+0MWpF7QZY91R6Cffphl8HL5+b/rXnqIwCKkp1qoK9Nx7z6XAIL
	mc10jvqz3llQpXLusxAde+/282WVWiZV7S6EOZmi3FpG0v+O/v0tmd6U0VAaTXN6mK7AihyN2Nh7r
	WwWsyVbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPits-0000000510b-3zV4;
	Wed, 20 May 2026 15:32:00 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPitp-000000050z8-0SB3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:31:58 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-44e5624c053so3095515f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779291115; x=1779895915; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZIImJajPM9fYtSPEthXg6jhil34ku8GvsFFkCo+lnSY=;
        b=qj0JtHMH/vJncWgoVPal6t/me3cOfs4tNknE9m1dshoynsyBmjPU/DizKQ4HWjH4zH
         TRg3fisYltyMsg07v3/Su1V3gkAYkcTo1oXFtq1J/6VJ77SjMwY57sU+konEDCGHmJM5
         PXB6lja2G4ygqB4iWq/KdWD5aJrpzI31g9yR4Oujl5VAWbzuA8vEWx7qpw3GtewQ5zO8
         +cLbMqKXKiR/tZogfVc8Zyj+LFraYFSHOE3JB/tDRfJjxtCkw2nL6E3t4VO0aMz9n1Pl
         gRGJUfPp6F1Cxguv2qP+CLhHEo2VZ1A1UEq92OV8+K7vjjTNI1AGZeFAYuSI56UGkxMj
         qHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779291115; x=1779895915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZIImJajPM9fYtSPEthXg6jhil34ku8GvsFFkCo+lnSY=;
        b=ezgApgsxyJdWU979GNtOBgACDpCK6+mV5f21PZe7z8yvPHCNBCijW1Vpa0Fb7BjDFJ
         9Zr0T1M+D7xmsaOIWWjsWIxA/YNkTFceRZ99i4wki02+GfcG7EWnrCKM1cZp5PEbIVW6
         t73eK+DsG6lM0N7NRn1hdAAAbdpKbi1xoXdeOrG6UevuudJ2eOHXgmZXy8R3TErQu1Xz
         Op9SXNvqCgftOUc5BGzTJwXh+9XAIdBav1aJnMkUKsqiwxb9rSZEEuieoRkEUcXuUyDD
         spSG2esa+6Oo+1iBjAncT3BnLZMZoAm8B9IpJ4pliQOTFhnO3k0u3idxfhsqw/GR4oL+
         gCEw==
X-Forwarded-Encrypted: i=1; AFNElJ+vap46O1zawNFM69Mq5HIHEcZYpMuheTH2Vrh9e99ITCRcPMc9w/hqKVS/TipPEwRA7xnqqP0xVPyqOgkDOZa8@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1Kz19t05WIdJYHoeI+dC+0i1Rgg9IiEuep1An9I5z//68kCk0
	s+oIb0nANzuyMAdvYOGiF1rhszO/kU3o1DBMls/H4b8QoaVBEbRz6Krj3I58dtue3c4=
X-Gm-Gg: Acq92OGIJGpKwwOyN6bgLgZpKXr/Wg2kVuUD5LXYcM+j3pmgHbK5TNCHx7TdB+wgN1H
	Kpn7s5bQYokSDmsVw0npJhEKkpleiKZ3CFVWKElSsAPbewYwa8dfzYqD5KAX6Oo6BbHgye80HxO
	YfJIv+2aM7qefkr2KE8rronbHyv2JaM4qb07ChuTrzXZzeDOxW2U+QKf+D1UsWBTkJRUkLjfK9Q
	HjNu6M4xL3bvPIQv3UWGfDUc0A1TTpLZb7Mb26BOA7tLEfzFY1Z6MfgIVRrrcLTVtLX3wVljX9j
	oe52/9/Gtui4WoA4l7nkMxsUEcU5W8XFjKq+aQ2twV/MW4anI2FAbKWqQ+XvlM2rmgoi++TNy3P
	W5Hj0a5c/dUeRgP2URqcgimYBD/oHwk1HsOsrLo9AtdZqHhwp8I4frfh/1cviEKl7+MSoY4nvIA
	gMnL+p5jdBkngUkGmB9KocrGY+pn6a
X-Received: by 2002:a05:6000:2508:b0:441:239e:2bb8 with SMTP id ffacd0b85a97d-45e5c58fe44mr38877967f8f.7.1779291114659;
        Wed, 20 May 2026 08:31:54 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ed2ffdfsm50958669f8f.15.2026.05.20.08.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 08:31:54 -0700 (PDT)
Message-ID: <463a9739-60c8-4f85-8293-b5a1197a2802@linaro.org>
Date: Wed, 20 May 2026 16:31:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: fix resource leaks on path build failure
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <Mike.Leach@arm.com>
Cc: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Suzuki Poulose <Suzuki.Poulose@arm.com>, Leo Yan <Leo.Yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, nd <nd@arm.com>
References: <20260513-fix-memory-leak-issue-v1-1-49822d7bc7d4@oss.qualcomm.com>
 <f347bad3-4a11-4f65-b35f-f59c6360ac5b@linaro.org>
 <5b3785a1-0f53-4b61-bc18-880091c2ce12@oss.qualcomm.com>
 <dea28a56-a5d8-46ef-a782-a95073714377@linaro.org>
 <PAVPR08MB9674C4C58210122F3A6E07AB8C012@PAVPR08MB9674.eurprd08.prod.outlook.com>
 <c819c469-0ac4-49d7-aff2-d3863a44e35d@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <c819c469-0ac4-49d7-aff2-d3863a44e35d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_083157_212181_67D9BFBA 
X-CRM114-Status: GOOD (  34.14  )
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



On 20/05/2026 11:13 am, Jie Gan wrote:
> 
> 
> On 5/20/2026 5:27 PM, Mike Leach wrote:
>>
>>
>>> -----Original Message-----
>>> From: James Clark <james.clark@linaro.org>
>>> Sent: Wednesday, May 20, 2026 9:38 AM
>>> To: Jie Gan <jie.gan@oss.qualcomm.com>
>>> Cc: coresight@lists.linaro.org; linux-arm-kernel@lists.infradead.org; 
>>> linux-
>>> kernel@vger.kernel.org; Suzuki Poulose <Suzuki.Poulose@arm.com>; Mike
>>> Leach <Mike.Leach@arm.com>; Leo Yan <Leo.Yan@arm.com>; Alexander
>>> Shishkin <alexander.shishkin@linux.intel.com>; Mathieu Poirier
>>> <mathieu.poirier@linaro.org>; Tingwei Zhang
>>> <tingwei.zhang@oss.qualcomm.com>; Greg Kroah-Hartman
>>> <gregkh@linuxfoundation.org>
>>> Subject: Re: [PATCH] coresight: fix resource leaks on path build failure
>>>
>>>
>>>
>>> On 20/05/2026 2:55 am, Jie Gan wrote:
>>>>
>>>>
>>>> On 5/19/2026 9:57 PM, James Clark wrote:
>>>>>
>>>>>
>>>>> On 13/05/2026 2:32 am, Jie Gan wrote:
>>>>>> Two related leaks when _coresight_build_path() encounters an error 
>>>>>> after
>>>>>> coresight_grab_device() has already incremented the pm_runtime,
>>> module,
>>>>>> and device references for a node:
>>>>>>
>>>>>> 1. In _coresight_build_path(), if kzalloc_obj() for the path node 
>>>>>> fails
>>>>>>      after coresight_grab_device() succeeds, 
>>>>>> coresight_drop_device() was
>>>>>>      never called, permanently leaking all three references.
>>>>>>
>>>>>> 2. In coresight_build_path(), on failure the partial path was 
>>>>>> freed with
>>>>>>      kfree(path) instead of coresight_release_path(path).  kfree() 
>>>>>> only
>>>>>>      frees the coresight_path struct itself; it does not iterate
>>>>>> path_list
>>>>>>      to call coresight_drop_device() and kfree() for each 
>>>>>> coresight_node
>>>>>>      already added by deeper recursive calls, leaking both the
>>>>>> pm_runtime,
>>>>>>      module, and device references and the node memory for every 
>>>>>> element
>>>>>>      on the partial path.
>>>>>>
>>>>>> Fix both by adding coresight_drop_device() in the OOM unwind of
>>>>>> _coresight_build_path(), and replacing kfree(path) with
>>>>>> coresight_release_path(path) in coresight_build_path().
>>>>>>
>>>>>> Fixes: 32b0707a4182 ("coresight: Add try_get_module() in
>>>>>> coresight_grab_device()")
>>>>>> Fixes: b3e94405941e ("coresight: associating path with session rather
>>>>>> than tracer")
>>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>>> ---
>>>>>>    drivers/hwtracing/coresight/coresight-core.c | 6 ++++--
>>>>>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/
>>>>>> hwtracing/coresight/coresight-core.c
>>>>>> index 46f247f73cf6..c1354ea8e11d 100644
>>>>>> --- a/drivers/hwtracing/coresight/coresight-core.c
>>>>>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>>>>>> @@ -825,8 +825,10 @@ static int _coresight_build_path(struct
>>>>>> coresight_device *csdev,
>>>>>>            return ret;
>>>>>>        node = kzalloc_obj(struct coresight_node);
>>>>>> -    if (!node)
>>>>>> +    if (!node) {
>>>>>> +        coresight_drop_device(csdev);
>>>>>>            return -ENOMEM;
>>>>>> +    }
>>>>>>        node->csdev = csdev;
>>>>>>        list_add(&node->link, &path->path_list);
>>>>>> @@ -851,7 +853,7 @@ struct coresight_path
>>>>>> *coresight_build_path(struct coresight_device *source,
>>>>>>        rc = _coresight_build_path(source, source, sink, path);
>>>>>>        if (rc) {
>>>>>> -        kfree(path);
>>>>>> +        coresight_release_path(path);
>>>>>>            return ERR_PTR(rc);
>>>>>>        }
>>>>>>
>>>>>> ---
>>>>>> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
>>>>>> change-id: 20260513-fix-memory-leak-issue-034b4a45265e
>>>>>>
>>>>>> Best regards,
>>>>>
>>>>> Looks good to me, but sashiko is complaining: https://sashiko.dev/#/
>>>>> patchset/20260513-fix-memory-leak-issue-
>>>>> v1-1-49822d7bc7d4%40oss.qualcomm.com
>>>>>
>>>>> I'm trying to understand why it's saying that, but I think the
>>>>> scenario is that if there are multiple correct paths to a sink, when
>>>>> one path partially fails and a second path succeeds you could get a
>>>>> path_list with some garbage entries in it.
>>>>
>>>> I think the coresight_release_path is added to address this situation.
>>>> We suffered the path partially failure, and we need release all nodes
>>>> already added to the path.
>>>>
>>>
>>> It wouldn't call coresight_release_path() in this case though. If one
>>> path ends up building to success but a parallel path partially failed
>>> then _coresight_build_path() still returns success. During the search it
>>> would have still added the nodes from the partially failed path to the
>>> path_list. This is only an issue if there are multiple correct paths.
>>>
> 
> The point here is there are multiple routes from the same source device 
> to the same sink device, am right?
> 
> I have no experience on this scenario. So with the scenario, the 
> build_path may succeeded in one route and failed in another route, but 
> finally, the _coresight_build_path still returns success, is that correct?
> 
>>>>>
>>>>> That's kind of a different and existing issue to the one you've fixed,
>>>>> and assumes that multiple paths to one sink are possible, which I'm
>>>>> not sure is supported?
>>>>
>>>> Each path is unique. We only deal with the issue path for balancing the
>>>> reference count.
>>>>
>>>> Thanks,
>>>> Jie
>>>>
>>>
>>> I'm not exactly sure what you mean by unique, but the same source and
>>> sink could potentially be connected through two different sets of links.
>>>
>>
>> Multiple paths between a source and sink are not permitted under the 
>> CoreSight spec.
>>
> 
> As Mike mentioned, my understanding is that a source device is only 
> allowed to be added to one valid path—this is what I mean by “unique.”
> 
> Thanks,
> Jie
> 

That's ok then we can ignore this for this patch. But it would be good 
to enforce that in _coresight_build_path() with some kind of assert. Or 
at least add a comment to appease the AI reviewers.

>> If such a system was to be built - then a fix would need to be in the 
>> declaration of connections - e.g. miss one path out in the device tree 
>> for example. Not up to the Coresight drivers to handle out of 
>> specification hardware.
>>
>> Mike
>>
>>
>>>>>
>>>>> It might be as easy as breaking the loop early for any return value
>>>>> other than -ENODEV, but I'll leave it to you to decide whether to do
>>>>> that here or not.
>>>>>
>>>>> Reviewed-by: James Clark <james.clark@linaro.org>
>>>>>
>>>>
>>
> 


