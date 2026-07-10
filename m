Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFC1C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 08:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ap9hHDubMVCMsfg7cGTWsN/PZnCJfGCkkJHZ64FkGVU=; b=uvSLyVUShSGdzxifTLPzGq/bQB
	FoV0WtxKxReHZKvexTSQM5hlYphncWeubIJGoDCQ9wkg/oDZ9FekyDbTMMcKc6CQGx9fkL1K50g/7
	Y6eFIeRweNQ5dvsvR1jA2/JRlskI/gkJSRuywwQvj5YOR27oTaSA+XMarY0e2JwuIj5e8Mt4za36a
	6boYkVRXGI0gqG3BuuHSNz8F4MpVkf5OVK1Jc4hUmqLq10WW4UlRyCD3ESFOVb03rshBzmfAlhvnD
	n5uGD1yyfz3N2Jl1kyLdANzE7qURHgH2mOCyfqRcunkF22OJ2pkTsolTUkbLagyB3Ut+6l6e20zv1
	6bWhWILA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6Cp-00000004PSo-01pd;
	Fri, 10 Jul 2026 08:03:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6Cn-00000004PS1-2hCY
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Jul 2026 08:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ap9hHDubMVCMsfg7cGTWsN/PZnCJfGCkkJHZ64FkGVU=; b=BqKix0MNxXiogz/thg7dE85Ejo
	412+5qYl9nM99MUh8DCYTwhEzxeYf/SHUhtyNAmKou5i3H+3llFqpw+swDR9OKRnZti18enKagHbd
	d7rBt4nJ7YJ18kK/qgoBl96qlAgOc9Ow8EsIuJ6G0q9IvMyDLxUMOPHFcjmpghZfKcrTmw0Q20PSN
	J48iY7PfygGEHyPcsOBqJd4SJeC9j0cwboswGvhyLBtT8VBaDEV5VHcCXs9cARJUKN9Q5Csh7zJkz
	ZPlrpJjFOqMHGDn1Su8uLIpoaDvqLoAwk/7sfHa42GCKpWsKJJfxh8Y7g08vP3m0aybzh5z3g/+pr
	e77odwEg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wi6Cj-00000009om1-3b0u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 08:03:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dtFZ188321
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 08:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ap9hHDubMVCMsfg7cGTWsN/PZnCJfGCkkJHZ64FkGVU=; b=XjrkTx//8jIWJS9y
	lM+/LQmLTmT3ouZ77LSTFFa8Fvcvfhj0GCwVIKEHyp+BDzVaVe++gqcHd1f9aiOq
	RlRRCc8kvZ4DEJSTGT6PGSj6fcZAEv7Wb4llLhpBJDpg4/ewoT2w3IXgMK8axCsw
	vDey1eK+YMU14awAgdJ6jY5tcBGrdrfok9mxjMcq61tSsdtBaZ4tbF2aegj+L0re
	ldCS3qoJJFcPVHOmLgbP+WwPtP6zbnCh0+0x0dCc8nJqZtVrt2DJuB1QNF9k5X54
	Ijp0XVGVwVQ7OY3Nz8O0qO74db6+wuZbLWbcMC1nJmQJbLGtOi6TYYGrvrZ2wKYS
	z3nmiQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeesueae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 08:03:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so1018113a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 01:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783670601; x=1784275401; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ap9hHDubMVCMsfg7cGTWsN/PZnCJfGCkkJHZ64FkGVU=;
        b=UlZ51X5WZoArFWAEskt64RCevS9uKpXiahamRajJAdK6gojjOz0KcMiulsJ/Ml0Pjl
         jNEZS9zojMAJTrcgovFWyUfk4M/oDhgbl9MxdORreE41ZCidnAoukrYh8uZEYoxOPUj+
         aS+vQJS14aRy0SA8b6YW7WTbwGwISD8ha/XbqHH5oQLuMK/pgg3emugGqodV30Ogw5YM
         sTS+gqhuO53mxdaOzCrBkBiDf1EMzsgnPS6KBN3Ub4a4Lvy0iQ+OC7wqcUaeZNKagv0T
         FQjL6pL45llRK1FQHCuzR30ll+6B/E+nrdp5FyNMqOoRCJGKYYGE0fl4dzCp4DJQmSOn
         7B2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783670601; x=1784275401;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ap9hHDubMVCMsfg7cGTWsN/PZnCJfGCkkJHZ64FkGVU=;
        b=RI6DhMvJwlhDLpQfDZq8baBfXXkcEiBENubiD3v8+ajLUjDuAdF70FL+AkQerrnPI6
         Gk08QAA8OxrH7jRxUDyAbUh5I4+q+6FvouwGbRGDEuYxV0SutoZu91PvPx7UTRjzHm7r
         vPXrSfCUoQBFB3xlRRySm6Xk29j7M9/0hCiHMLeIkP4V9iesQMDRMZ4x3BgMhJ64o8F5
         zdBtBW9ge3A16Xs9mLJ9xkVYZJvpMd4qJKt4c2Bv83k9G53GAjkpquCcLybnsSdcHAwH
         JvtAkGLfC7vJdzZ75i9cTVsrE4AwgR8ZvPYrkF/5KZKJk65NhWbQjUcUHLddrAqG396O
         KwCQ==
X-Forwarded-Encrypted: i=1; AHgh+RrQKkO06QwNctlHHnj6F4Aaxed2boqeA6qL5NaDwcm2HCGgYljMC0MUblm1i5MVKEdtep5+nqj62mwftzu8zO88@lists.infradead.org
X-Gm-Message-State: AOJu0YwxCvydTtPpPwvakHwfhwSfNHvtq4u9mpB+wEMwaxUVLBWvEt57
	LC3WyU7gdmGIjofVragVTMRwxkATBFPXL2Q/egmPjKVkElzNCRML7p5vrHfWmaDQ+DcVGtd3BWv
	1VQ7qJ3JYae8mjozJJCQ7HSAx8g4Tj/XWsqZVxVYULisTbR7gg/Bv1KBBAqNSf0KAJZHTVblfRU
	ClpQ==
X-Gm-Gg: AfdE7ckXFO5w0U3Qqqg7+Voz5uc26b+seqNpvNRDBH7Y6lipoSAN0Gq2/kdSdYBusVl
	zpN3ZXvF155hLyi8/J+UOC06INU9O0WiC7gi/d/LqFCbOjUMmGDlFwddWY+KMi/l2aI6jDhyDDk
	cFE9YBJwSq5VROs86O1HjrGzqR+JKUJIojRWP2chEc9fIO7afgL5Ue25+gREk5qpbh6MJ+b+jxI
	EVR/5x440CV725+G0k1fOACx3VQK55Tnz0tIaZLL0oLlULmOGcDHiuUBKGYHljMktj8DqsWUhU3
	WYKtE0uUFeVm+9BACBvvqrWgehdYHAgHGe63sVcBT/5F/XB+7+msugmMMpPiVkgqBNM4MkySqdS
	xRbdxYORiuS+ke0fMC7EdIUgYNFU100r1oGQRhpZn8W4uqYfEJqG7kFzai3WQAYWAZAXve+nnDZ
	oh
X-Received: by 2002:a05:6a20:3d94:b0:39b:ba95:b14c with SMTP id adf61e73a8af0-3c0bceccfabmr12625902637.24.1783670600508;
        Fri, 10 Jul 2026 01:03:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d94:b0:39b:ba95:b14c with SMTP id adf61e73a8af0-3c0bceccfabmr12625864637.24.1783670600014;
        Fri, 10 Jul 2026 01:03:20 -0700 (PDT)
Received: from [10.133.33.242] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643ecdsm4926620a12.24.2026.07.10.01.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 01:03:18 -0700 (PDT)
Message-ID: <3f8a74b0-1f0b-41de-af64-03cb6e983a04@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 16:03:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] coresight: Fix clock refcount imbalance on
 platform remove
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Yeoreum Yun <yeoreum.yun@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260702-fix-clock-refcount-unbalance-v2-0-2383fbb9952e@oss.qualcomm.com>
 <20260702-fix-clock-refcount-unbalance-v2-1-2383fbb9952e@oss.qualcomm.com>
 <20260709152410.GE1024232@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260709152410.GE1024232@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: S3Yf48o772CjbFT54zVU3D95mqm0xIG-
X-Authority-Analysis: v=2.4 cv=bbpbluPB c=1 sm=1 tr=0 ts=6a50a749 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=d1ZDJawjCgYNIZ84EkIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA3NyBTYWx0ZWRfX39HeBz+32Pnd
 EtV99zgg60OPlPPNfKvExsqLf6jNBCvlvCONGB0Oc1pHos1vkrCUDeVeFHGsou9rKly0xsu8aDC
 9JUCt+uI1lJpJKGRc+fUgYITU5PeuRA=
X-Proofpoint-ORIG-GUID: S3Yf48o772CjbFT54zVU3D95mqm0xIG-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA3NyBTYWx0ZWRfX/JvsfFuVOVkr
 L6A+rb7/hFOWMLWWpyjEcHk0Y15mfSwewG/yIHhFeqb56KzLdT6Yva99w3rIUDlrsFOOm5aBxcH
 NQfBBuu6soNU651evef0O2Q2o1d+z6mIgJT7KUUPYMjeTZCGEODnpWT/84SC+zvP3F9ojKpRji7
 R0qDIC8rpedZ3lI8LeZF20/fzlbnMxwJp4q6lHo19L2gabBQiY/ECo+Pd21/Wz0dcshDwyzmF0V
 fvZYZq0GpE3KdeHle4Vt0lRhFWuDHBNakOOXya2GQj1Y/lUq14EU/4mXROo4Ym2TkRY1IkGsMN6
 H7G2XFrPN+NExllDSujDCp0tnP7K3EdET+rTcfAxDADQ5agU8qeh+aappC/I8/zM2XGV6iMvEYb
 zGr4OIxI/7D5dDPkABQZ1406urhH3csC1pSENpd/hkfoGFwtqf3Q8e8qy9W86Plh6nNT2Zzrx5L
 dDMvLjymGikqyOBA2MQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_090326_832796_6E91DA3E 
X-CRM114-Status: GOOD (  17.94  )
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



On 7/9/2026 11:24 PM, Leo Yan wrote:
> On Thu, Jul 02, 2026 at 04:54:19PM +0800, Jie Gan wrote:
> 
> [...]
> 
>>   static void etm4_remove_platform_dev(struct platform_device *pdev)
>>   {
>>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
>>   
>>   	if (drvdata)
>>   		etm4_remove_dev(drvdata);
> 
> I understood this is not an issue caused by this patch, could you refine
> a bit as blow so can be consistent:
> 
>          if (WARN_ON(!drvdata))
>              return;
> 
>> +	/*
>> +	 * Resume the device so its clocks are enabled again, balancing the
>> +	 * clk_disable_unprepare() that devm runs when the driver detaches.
>> +	 * Then mark it suspended and drop the usage count taken here.
>> +	 */
>> +	pm_runtime_get_sync(&pdev->dev);
> 
>          etm4_remove_dev(drvdata);
> 
>>   	pm_runtime_disable(&pdev->dev);
>> +	pm_runtime_set_suspended(&pdev->dev);
>> +	pm_runtime_put_noidle(&pdev->dev);
>>   }
> 
> With above change:

Fixed and sent new version.

Thanks,
Jie

> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>


