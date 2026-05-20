Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36A7CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 01:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEXZISxwxOfs11/JZOUamWM44R+suinsjRVfMvngbwE=; b=lffmgb83/d/amMlAJU6weOJJv5
	HyvmusiFVWRW7Cjy4GIMeWRmJoOzGHVwKMedKiVw7og3ZlylUlxTAxWm7EHz1OuGSTRSPDNAFLJVR
	iEm3quv/oMzZizvh6h7HvlylT/die/u/x5M1j57ui9ufMdIpYDWnTChcuiKrUgAqKwVVQ9aGGflVs
	xtsjmP96b9MIhvtcGTutpngx61aXnZYziScp6hIuTumT9R09fDXqMkBukf+inMq3inaO4O0DzJzKC
	r290ikpCeH7m93CLmuwlHQ6K9aY3bnFIaLm0AedGR7F8/3UwMHHEvM5B+EH1edh/FLD0N1PPj5RN9
	9MRF9Zjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPWAL-00000003GKJ-1ksu;
	Wed, 20 May 2026 01:56:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPWAH-00000003GJZ-3bkb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 01:56:07 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JN5cpG1636909
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 01:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FEXZISxwxOfs11/JZOUamWM44R+suinsjRVfMvngbwE=; b=jlvDqXGJwc8fumDB
	pMENL0YIAPcwgf/njC9hynTVcTZRWnvYgb5f6Pg4DFPS8sAWTmGuJgM7jER4aA7w
	QTTjdu6OI7opuVR/ed7HIntdMJoGlfIKXJtdHndq0lQbnlodg/eTO5CVNHuQQmyd
	TDCuWO6+4mrYGp1iaDoGpDTPF9FBbsyoWSJvayHhY0WdbuUmhqPusCAd8V6Gblgj
	eXApAqVPQ+/HprykzOxkg164s1wrsUEljFVwRK+l9P1VRu0a27Bdpqz7IAtQK2nv
	LwbdUqD8AdeYIkG1VilbyQr2/Da4NzNOkdBExvk9TFUoSUUdgPrordYKx4S/Dg7o
	+DMO+A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3sab2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 01:56:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc860066a6so30672725ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 18:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779242163; x=1779846963; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FEXZISxwxOfs11/JZOUamWM44R+suinsjRVfMvngbwE=;
        b=fKDD8oFn+K2nFqLIFFMVLkEsBff4PEeV9CxCmLR1JaZpDxCxOwF768uiu3mWHaorBP
         rkz6QWwgFV5S8JemohwYQ0XZO2go7ZokH0f6p5N2s2qT+Lkj7TVjIRAFymMFpuuikuty
         8r6Xj8ADw2AtpnyPWV9i4TnU9gtn3QeIieTzJrWV/Xc52GMwNBwnknqwvwOLySrOAjrR
         e4a3qLxqmT4VJNl8Nul0FCjAzIsftWua4QaIJFsTkZfEhXNNos6eA/PP3EQPkAfp/th+
         c1meKe+0e3wdfcA8K29C2CDbw2WYFcC1er3+j+SdkPHHTrxZwb63ThQxTdGbSDOYQXKo
         vSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779242163; x=1779846963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FEXZISxwxOfs11/JZOUamWM44R+suinsjRVfMvngbwE=;
        b=qePM4dgzdcF/PQvrWv1cobHuIChzmsRRLleCORluX+om3897VcrPVTaegaaedywIIr
         gZnmzmcWOw9ulHOq1de/BILYNm5iP28qU6rpKvDzrR6DSF+Wc3w+WCOttWc6uCnH9QtL
         un/jd3lV78w0Eyb19o2Ga7frB+Aqu0Fvxzh/6kOMge55c8GcsLV29T+NAPNxzE0kn/Gw
         kumVddb5X36flrweIQe22h2RxMAz6kfLKh7TJZBP3XvbubTYU91DpztWIymXQJF+oGDG
         8gccWPyoJ3O7cpdTS7AFK9V1J8Q1aoufqQWMwsuwd7Yp4EJQ0tuV4P8UxMDk0LViKK5+
         UPVA==
X-Forwarded-Encrypted: i=1; AFNElJ8gkSe5GJk5FdOUKv+f2mfms9tIoGMv6hoYOCf//gZEznFRXTGKoSvYuN1IgEVGa8U4ZJ7FtudzEqFrYoLlkFqJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzqQJ/A7XS340BO2Jt4AbXSbF2ksgJqq830S3anBSsB9s3AhlzJ
	cLCZiesVT5+Sz9BiL5Vy3UrAp2V8jst1lOzvsZNExHwuw4Lrlwebwa8rS6I7SIMFGFxZY4IRhFn
	mFep9XCBoWDzivrVIJIihBn2wN3LOpXioiFzoKxPObgGBdanGgMVHdltGQVGMOyygKJuczX5cDj
	KmJg==
X-Gm-Gg: Acq92OHFsYrrajz//DXcIu7dsLi3Xjl1O9L4u+iSo+DAG8OiMLJ/SPvV/JLu7QPByOU
	XfNdjIUvaS+JyxRzBtChs/CnSLnVjJd3IQJbhdSQRKsq2Srfm8o4CJouVKAIjFBq9Bx9fpaQKjF
	Tftaq16w2uhH84WLVXaK36nkvEfwbtfVUWlhQh9377cw5gPDCZqra2FW6YLIGUBjecJh2dLNePW
	IAJC311vrGfQ6rivIbyn9hwtt24AVnKZRMHButY83yTrRE5Na5y/35Eg9Z06wTX7xbxRO0H5VNX
	Dq+IqZahUhYgB5YO7ii1I34Ne4AbjdK+wQNZin1Tqtdo99V8YSwAGNHk1DYfC94c5qJvY70HV0S
	SAbpFRPAQ3OY4iXhIiHm1eLWhQe8EshM0/faGZuAbO+7wWnYoxgRxUluPHhJ+bJvfYoHlx+3PiT
	+hk11P+7KOYzU=
X-Received: by 2002:a17:903:3c6e:b0:2bd:8c9a:a684 with SMTP id d9443c01a7336-2bd8c9aa6famr221078965ad.4.1779242162661;
        Tue, 19 May 2026 18:56:02 -0700 (PDT)
X-Received: by 2002:a17:903:3c6e:b0:2bd:8c9a:a684 with SMTP id d9443c01a7336-2bd8c9aa6famr221078795ad.4.1779242162173;
        Tue, 19 May 2026 18:56:02 -0700 (PDT)
Received: from [10.133.33.129] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2be2f604fdfsm53223025ad.18.2026.05.19.18.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 18:56:01 -0700 (PDT)
Message-ID: <5b3785a1-0f53-4b61-bc18-880091c2ce12@oss.qualcomm.com>
Date: Wed, 20 May 2026 09:55:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: fix resource leaks on path build failure
To: James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260513-fix-memory-leak-issue-v1-1-49822d7bc7d4@oss.qualcomm.com>
 <f347bad3-4a11-4f65-b35f-f59c6360ac5b@linaro.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <f347bad3-4a11-4f65-b35f-f59c6360ac5b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDAxNSBTYWx0ZWRfX+hwS26ceueSX
 Fv1o8aWx4obnSI6u4wS4guo+c9syvY+eVsT5APbLcGOZuHUOgYFvhxq8Z0UOtqMPNpa31BEZvId
 NE0A7DCgWXJ9HIuvyOoRSXg6J0D4X1/BmmOQe14i31mv6cgENJJ6YAkbU6BjHPXUvqnl2vSuOm5
 kC4CYvpdP/yakKsv4XSHhjAN1QhBICIU1GBxsHhVcB1Q1MWDr2tIgrjMwtUhIKknnOiEM4O35Gg
 GQBXm1msN1/7Qyf5mmTGZjCgQ9qkjPzYVg3CBNLjvnSHKnIY7yWzFz/DGffY3GjnrZxvwhIBbOy
 KH5ioJ7FJ8Dx1/KrWuvifs9C+sTZ9uMvltMoeBlcFBSEXhkbEprIqchtwHFBxxM8s7CzjSN4tmr
 c6IABfQTgTrcP+zArPK99aQ4U8nEIx47+EhtigZXnUHL7L/G7cycN93d+Lmq29m+g5yknBQdPPt
 snFkZpdGxs8dVgZpKqg==
X-Authority-Analysis: v=2.4 cv=Oc6oyBTY c=1 sm=1 tr=0 ts=6a0d14b3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Rcy_sKP7lcXEsWT_VP8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=GvGzcOZaWPEFPQC_NcjD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jjvGWbV9wiLSPzP5LoFwzcIyTfDdBXnQ
X-Proofpoint-ORIG-GUID: jjvGWbV9wiLSPzP5LoFwzcIyTfDdBXnQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_185606_022118_CBA28380 
X-CRM114-Status: GOOD (  29.73  )
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



On 5/19/2026 9:57 PM, James Clark wrote:
> 
> 
> On 13/05/2026 2:32 am, Jie Gan wrote:
>> Two related leaks when _coresight_build_path() encounters an error after
>> coresight_grab_device() has already incremented the pm_runtime, module,
>> and device references for a node:
>>
>> 1. In _coresight_build_path(), if kzalloc_obj() for the path node fails
>>     after coresight_grab_device() succeeds, coresight_drop_device() was
>>     never called, permanently leaking all three references.
>>
>> 2. In coresight_build_path(), on failure the partial path was freed with
>>     kfree(path) instead of coresight_release_path(path).  kfree() only
>>     frees the coresight_path struct itself; it does not iterate path_list
>>     to call coresight_drop_device() and kfree() for each coresight_node
>>     already added by deeper recursive calls, leaking both the pm_runtime,
>>     module, and device references and the node memory for every element
>>     on the partial path.
>>
>> Fix both by adding coresight_drop_device() in the OOM unwind of
>> _coresight_build_path(), and replacing kfree(path) with
>> coresight_release_path(path) in coresight_build_path().
>>
>> Fixes: 32b0707a4182 ("coresight: Add try_get_module() in 
>> coresight_grab_device()")
>> Fixes: b3e94405941e ("coresight: associating path with session rather 
>> than tracer")
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>> hwtracing/coresight/coresight-core.c
>> index 46f247f73cf6..c1354ea8e11d 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -825,8 +825,10 @@ static int _coresight_build_path(struct 
>> coresight_device *csdev,
>>           return ret;
>>       node = kzalloc_obj(struct coresight_node);
>> -    if (!node)
>> +    if (!node) {
>> +        coresight_drop_device(csdev);
>>           return -ENOMEM;
>> +    }
>>       node->csdev = csdev;
>>       list_add(&node->link, &path->path_list);
>> @@ -851,7 +853,7 @@ struct coresight_path *coresight_build_path(struct 
>> coresight_device *source,
>>       rc = _coresight_build_path(source, source, sink, path);
>>       if (rc) {
>> -        kfree(path);
>> +        coresight_release_path(path);
>>           return ERR_PTR(rc);
>>       }
>>
>> ---
>> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
>> change-id: 20260513-fix-memory-leak-issue-034b4a45265e
>>
>> Best regards,
> 
> Looks good to me, but sashiko is complaining: https://sashiko.dev/#/ 
> patchset/20260513-fix-memory-leak-issue- 
> v1-1-49822d7bc7d4%40oss.qualcomm.com
> 
> I'm trying to understand why it's saying that, but I think the scenario 
> is that if there are multiple correct paths to a sink, when one path 
> partially fails and a second path succeeds you could get a path_list 
> with some garbage entries in it.

I think the coresight_release_path is added to address this situation.
We suffered the path partially failure, and we need release all nodes 
already added to the path.

> 
> That's kind of a different and existing issue to the one you've fixed, 
> and assumes that multiple paths to one sink are possible, which I'm not 
> sure is supported?

Each path is unique. We only deal with the issue path for balancing the 
reference count.

Thanks,
Jie

> 
> It might be as easy as breaking the loop early for any return value 
> other than -ENODEV, but I'll leave it to you to decide whether to do 
> that here or not.
> 
> Reviewed-by: James Clark <james.clark@linaro.org>
> 


