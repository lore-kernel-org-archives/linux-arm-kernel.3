Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F54FCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 09:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gKrFZuQAG0a3aCq2kSwLA6HFHDfSA7RjUUcLjgAHyTk=; b=CZda+Y/d19f8yyTxBsUFiFYHBZ
	BKqlKOqBSBNWnXBuLOdAuz/Kp1OT/MG+9P8V/6esP48CNptTO9EGxsGyM3w3weya/H8iY0VhZY7Wd
	4I4xox0sqYogb4/DYwgja4dbS/8Kv1CWryt7x6fpIM9teYYGuF0BjguuZZ5PLNFFUCeARilg05pfA
	MCywZHGTx1iR+v25L7YmDq7m8s7LRZ80boGJtFvYiMxdiMk11a2yzvsRyReCHQXtCfOP1ZBW/I3yo
	h6/932JQeS/4WAjecG+sf++n+bhpYPvFWVOByguUD9PDLxKsTDwR+hp6ruhyk4Z2zEtC1xzH3mwBj
	/vV7dfJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULsa-0000000CiZg-0l1c;
	Tue, 02 Jun 2026 09:57:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULsV-0000000CiYD-1nvm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 09:57:46 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6529UZBs3355398
	for <linux-arm-kernel@lists.infradead.org>; Tue, 2 Jun 2026 09:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gKrFZuQAG0a3aCq2kSwLA6HFHDfSA7RjUUcLjgAHyTk=; b=Ml0VidQalj29yJsu
	yjtrGcwJfFwI4bUKkiGPkA64nbJfMJPF7txo6qLnsHeKQRxXb/1WesRQl6mKOMbg
	S3ZZ0uUzvjIoHxHwATSbrl4fxCBZow+sBhWoHIQMYY6t1QHKleEVYnHHX4Fmsg2h
	HjGvTIYxiOUilZ3t9NJQR49EZF7epF8pYG3PBmdJxyRPLirUUMtSzPxcAfi49FQ8
	lxjK+YLD92qCnNjbrWY8fttXN1oWlOvhV7/6DGiaxr6jirzJWgePxVPvkPX8cjr1
	DtEobXlQ3CfNufWByrUTt4Qz+Um/WUJS5ILhPKgbeD9lwsxsJAEyIKqQEQhWihGR
	R1OQnA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehvkx83aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 09:57:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5176d5d7222so7648661cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 02:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780394261; x=1780999061; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gKrFZuQAG0a3aCq2kSwLA6HFHDfSA7RjUUcLjgAHyTk=;
        b=eacQi0TN9I9LybGrEwZcogMaJNRCYlgq/u5OoCToFllBE76g9aTGA2eqAR5jPFtRMA
         QBKVMe9gHIgr0aAmOehuyRfzc4AS47GAAzjgOTO7Sk3Zifi7eCIrB9K88xdeCBFHAVu5
         TEfaP0T1pVEN7v7IB2+TC9L8NPgHW9A33d4aqCnGIHWz12PuFjPP9DuNiSFkByrA819q
         SWiujwVC6ElJ9Tx5gP33x0eeZQnOA6lhNOzOKNpVGsG6pzY5cNGST2KvAZ2wvfEckf39
         6cVKReitW9LGTsvKmW7uX7Ua9DVih54owMod6h27uxsc+g4aqI/8V9mdomGllsuX99rF
         41FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780394261; x=1780999061;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gKrFZuQAG0a3aCq2kSwLA6HFHDfSA7RjUUcLjgAHyTk=;
        b=fTga1i97g9boszq+mjXC3R4T9qVS3V2BM962lreOePzLzxMK279+P4PIw3xwyZCyoV
         TLtLyBhS2K9GX2JhZOKcJ1ntA61eZrtsxxjwCmyx04e8DHZ+SgIf4NanS3JoQ19mYNPg
         1pPTiQfMJ0K/3zawFcXBnJ5f51FEoPY+I01PDHScScdSFVK20UKa3VEHoIpz1zxDIZzQ
         uA/o3R7ugQzX6rAETrLMXnv0iUoYchfSZt5C5Ulip7kqLUraDQAdBvZISJKO0+84VcQ4
         ibzD4TmSkti3TLP7CddFTW5vLY96pK+raqRuPejvhVTVvgOzp3xA9JOXHkyi8I2sSG3E
         gkNg==
X-Forwarded-Encrypted: i=1; AFNElJ94mE1mzzBuQDydxtM06QHnyxhI5HAGd22upXTNsj7NN+1gldKHZVkmeFq1UgN/OSt13IOYleEKg3NrBQjJ580x@lists.infradead.org
X-Gm-Message-State: AOJu0YxDrzaHBKLfEMoigjLikwENtLHeWf+620umXvrW69ST5KPrYIgm
	afNQf893T9eReaBScv/pGtKhwbxLjqi9+ioj6jILtYyl44rDI3lgnrje1fj1gP+O1e7sEVsWZGt
	FDAC9Onl4xn8CH93UcpAvzIgGVE9TO4ju2RsQABu9PSC5cl6X+Pj4Ca4Nq8GMOnZps1cOYQ/vlI
	6UjQ==
X-Gm-Gg: Acq92OHc62rSq9AnQTGLFH6fsa57XydSL7W20CLUQAAaoxLwM6Mq5pKF5B7VsSD4px5
	T0fLFrTFXsxlP63lZjerfERRvjgd3e3LemeRsWyT6Q8FRA1dqYFbnpZmgc6e4uRx0/+amAG3RzX
	YgKHzusPQqNqS9cuwzH9oYG+GjtWnzxJbVOaQNDgTv9uSdIIdaXKDmifyMYPNj++Z+r7YhzITV3
	pg9jwnVZEOcqZ+gDqNqarnwwl00ytp5err8nGW4RrEhX1i2xBKytJ6LFe9xl9YrufgOJZf4oeof
	3vnZ5BEsawAfqh8yVC2Fvcy8f6KK1QUphYjZrBtj2/pPlQnyqy5WyTyO2BWt68H+qaBqI4xEak8
	a0TGv/uIghlV0MNncSs5Q0BoXqAScAmDA+RhhCLumxHT2o1QoreFuEkFU4n/2E+QMIQrJpyIHvT
	se
X-Received: by 2002:a05:622a:790e:b0:516:e033:f5a8 with SMTP id d75a77b69052e-5173a8daddcmr155758501cf.59.1780394261427;
        Tue, 02 Jun 2026 02:57:41 -0700 (PDT)
X-Received: by 2002:a05:622a:790e:b0:516:e033:f5a8 with SMTP id d75a77b69052e-5173a8daddcmr155758251cf.59.1780394260962;
        Tue, 02 Jun 2026 02:57:40 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490af0babdcsm37044295e9.0.2026.06.02.02.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 02:57:40 -0700 (PDT)
Message-ID: <59afecd4-7749-4be5-a261-a850634178b1@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 11:57:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: meson: sm: add stub functions when
 CONFIG_MESON_SM is disabled
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        kernel test robot <lkp@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>
References: <20260531-fix-missing-meson_sm-symbol-v2-1-1def8c3c169f@aliel.fr>
 <8c11a91b-cfbf-4b9c-a46f-907989bf8305@oss.qualcomm.com>
 <12d74340-0213-4f7e-a494-10ce147844ad@aliel.fr>
 <0c5033f7-1535-49e8-a502-426e54333496@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0c5033f7-1535-49e8-a502-426e54333496@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ez_K0qPH4ypadZPzFIQn6nR4jEObI0Rv
X-Authority-Analysis: v=2.4 cv=GYknWwXL c=1 sm=1 tr=0 ts=6a1ea916 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Fuur4Mi3Lvfw3V_heQcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ez_K0qPH4ypadZPzFIQn6nR4jEObI0Rv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA5NCBTYWx0ZWRfX+8mhfzAR2mzk
 wFEHt+z2qSO2ChlzWBVlKirEzEWjP3ZsPKzcyhbcqj2hyMJYlJZ1mfPKxVBa0Gr5VZKR87C6L8i
 6JWYF3erccStRftA016t3qojjQbpfcgu6Qvcb2muJ8wG1w1D7BSe/B7xSZADQcDNFFe+Q0YlkqI
 b4gFDQ4CkYZkYaGL+J3H/qKsKo5PbFKj5p/b3Img+TffSU3IHFdHMbMocTRjIx9/SP4eTYGSQUg
 jBHkBbDTMWLR0VEyj1y8617teYNNkVVCSlTZByF+YE1c3/ZOzBx8JBHlORVf2Ajad50Wz60+eDI
 B+6jZ9b4MLuruGo8OoBjPmHY0iWPUQ4FzYFLerWR1oWbTb3D8r5rqZ5sT+2bmiJN8XCZWIgEoDs
 5yhK3eoiPe/GIBYmY2KDeOpRNhmRKAHeP7wTMQgiW11A2VSAGQQcgokHiRNnbXLbIWjK7qH38lS
 0ri48eU/fQAjVwzSt1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_025743_616072_5D225D59 
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

On 5/31/26 21:58, Daniel Lezcano wrote:
> On 5/31/26 19:49, Ronald Claveau wrote:
>> On 5/31/26 10:41 AM, Daniel Lezcano wrote:
>>> On 5/31/26 09:51, Ronald Claveau via B4 Relay wrote:
>>>> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> [ ... ]
> 
>>>> +#if IS_ENABLED(CONFIG_MESON_SM)
>>>> +
>>>>    struct meson_sm_firmware *meson_sm_get(struct device_node
>>>> *firmware_node);
>>>>    int meson_sm_get_thermal_calib(struct meson_sm_firmware *fw, u32
>>>> *trim_info,
>>>>                       u32 tsensor_id);
>>>
>>> Do you really want to compile meson_sm as a module ?
>>>
>>>
>>>
>>
>> I don't want, but if I send a patch to change tristate to bool, it will
>> raise a warning because 'm' is not valid.
>> If it is accepted to ignore this warning, I can send another patch.
> 

[ ... ]

> Compiling the firmware as a module means it must be loaded before the 
> amlogic thermal driver, right ? Where is the dependency declared in the 
> module ?
> 
> If the sm_meson is in the platform, it should be selected as part of the 
> platform's component. No need to have an option for that, no ?

The questions remain and PR is approaching ...

