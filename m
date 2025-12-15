Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E21D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 10:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQ4DZ1KiE5L590veavXKBgfstDLP94A36MM1K3JZsIU=; b=0LsQIIf+x7FSPfMAKu1ttL6KnH
	mQlfsXEVAsQaQnULiuW/ogLil89DOTYmxM8vBfXXZAHVZij2VIJrndhc/OP2+iledD8k1FGEoqF/W
	HSJe5ZrTLmUzQWvaAgZoyT/0E6NHa5XL5r3bXtTUBQYJpb6pCdDo0j/pYjsFakQEgby7ltiqAb+2P
	cfz5i2MD0/VRa9NO34Rzg7k4lLtGxOB0XwhiuVB1xm/OuiTFeGBTuxGXHmWX3eOJyibtB5/GoxBLJ
	UhLBz4PqMgexAQS/anrzHtVBelTIrcsE03g1ogSDVKdhuiJZ5nvkvoarQ3FZknvkNsBTD/XcxvBH4
	AgkyU6aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV5Wd-00000003QJy-3BC3;
	Mon, 15 Dec 2025 10:09:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV5Wb-00000003QJX-32xM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 10:09:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BF9660T2874245
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 10:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XQ4DZ1KiE5L590veavXKBgfstDLP94A36MM1K3JZsIU=; b=QrHKRD3e4bkyf4Bl
	HQYD2hVFW+hmZegehfKomSPZFkTd+kV5h+c7qsyKDcmbhybuqYmpq0lxHH8rFe3m
	0rkpyW0Be3ZXzl8DIMmOfyQ2H82373ENt9Aqll0Q8w5hMO/YoAHLaGsIUt9gwV4u
	xlJfU7t7QXU1lnXkv50qJ/i9odvN/ddWNptdwApj4yPoAqX3vqu+ziWo3fqInzCR
	YUQwP6aQS9jNm0qVnR92f3xZNsPVjgCJrAENE9mwAwVaKyWyyfHSrOqRwse6ucwP
	BBcg2H7ZhP6vVsNYhKb/94UWABGepjsJYA74ckB8qsWbdpVhbJFTYK6Ht+JHZ2Ns
	G1xcUA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b119t445e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 10:09:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0d058fc56so15531115ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 02:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765793392; x=1766398192; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XQ4DZ1KiE5L590veavXKBgfstDLP94A36MM1K3JZsIU=;
        b=SZ6S5yjuKwpL8v3SU+W4Ijneddt41rI29AyhWIeXWflRToNEpUaKs+sXrlHCFYr83X
         wKMJiJ9kBUeI/Oy4NHFpQCpMA4Fo31g4YWhOMNR/wJQznzC9UWbP6/q/tzWXxYfI3AgO
         IjvYrWsJtzBXYIP2FOoeLLIzwGlCq593XvayVCJEL0JbGVqNSigjQ+VFa+nc6IxgDUbu
         fXK6mm8oDPcHe5rI/zN4N13O9ZLdR1IYJNfw5cUMrzciGZ6Qe3HHB2h4laDU4JZyMu4E
         XZMVDWeecHqwNQcEbBWwU9Cn6n1dFTtIGjubHqIxLFzSGzkZG4X0k+x+9ofUAM1XKESV
         ZlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765793392; x=1766398192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQ4DZ1KiE5L590veavXKBgfstDLP94A36MM1K3JZsIU=;
        b=UEYE1vDxnvXWltBcfjZZGmySJqdaux5aWvvN/7gQ0/R4gilXo+JddrZxpL+JtWT/Eo
         yaQbQ7fV10Hk8zboW9BcBZSFQrDFOHDsyvgW729uTjObkl7cERMA/ygRm2yRHKMp5UGv
         kY9inWe43pjl+tQJen+FmsYQmoPdCJC/j+jyf+kxfdceOud1zKjpA4tB8kQA9uRoJ/9U
         K5Eh8Csl75hzqaPmnhkfHDoDD4Ggfyd0SxV5cAxJDD1TYIbWX9wxuHhqSjsOkPUCtD8r
         xe2K8bjJfAHzRGfMpohINsLKKINvAvZsWNjOpKM8WWeLc1C6b+RyjSpPoDoErWk1/WZ9
         9lkw==
X-Forwarded-Encrypted: i=1; AJvYcCWC7SgWNODpTIS2QWh5E/rNn7pyrRCoOzlKUPvBKf6wJe+ck2NnXwxqHBsi7D1eRBOFLEbcVeIWtsXh0q6r6fwA@lists.infradead.org
X-Gm-Message-State: AOJu0YyzUv96h22GXoct0SlZXVnPdhhoFt7abFX4MsbmVUc5F6gdx6Q1
	99c+4NGImMlkL0mTJ3EHXOzTe5rd3vS+akgYlm/p/h7pD9dgR+R86zsctqS8AMDGaxftE3W6mkj
	6aHDNktfm7xxCl0/N1qFgbZS2q+ZBaHcz0gX9/J6eFZ6dtMOZ9SEbqO2AXl9SIzzm9axg9vLFPr
	kC2A==
X-Gm-Gg: AY/fxX573XKJii2vPVlXFXP5iGJDO3K0OgkqREpO/C/pln4v/TcJFks4SrLqdeFIrS0
	SXH03hf/4XBI7TUFjTepj3dc6IC58z5KXuqmxSnu8O57WjNtiMTYbTbjj2Pm+2B3amBNnf2uOcJ
	fGEgbEToP9M4/R1go/dzB6fuSdRM5m5qm29Ah9XV+/Kdd8ZaVa05kHoQTT43bVr3a8Qtan/5b0K
	wqZ5YlKM1Ni/UJ3KPUHExI8szjy4c/MbvBljdtK0UDNSaDKhsGHsXd3XbZmTm7nRzRnLvhK6GPV
	U+Nb3bMHBPUd84MYdSm/LBJTWU6Qk+dXjz2HGWa3NTxq9lKHqq/GSwv+8FHfwDoLyvH3WgO3Mvl
	wSJ2MMUdk0YVr0LWB8Uw7bOy0HCLCdAILCK0se9gv9uwaow88HVCuKjsUvpbqOxIOGWBSTMQtOp
	E=
X-Received: by 2002:a17:903:2f50:b0:27e:ef96:c153 with SMTP id d9443c01a7336-29f23e6eb35mr103664155ad.19.1765793392226;
        Mon, 15 Dec 2025 02:09:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWec5hjICjl1sGxg9VkQ5x2vkWQbWzR7eOuDA/Udz/Oy1CGb16uGqInntsurGtyzQXYw3Vgg==
X-Received: by 2002:a17:903:2f50:b0:27e:ef96:c153 with SMTP id d9443c01a7336-29f23e6eb35mr103663895ad.19.1765793391697;
        Mon, 15 Dec 2025 02:09:51 -0800 (PST)
Received: from [10.133.33.126] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efb3657f0sm115430205ad.72.2025.12.15.02.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 02:09:51 -0800 (PST)
Message-ID: <f85c7d37-4980-46f0-9136-353a35a8f0ed@oss.qualcomm.com>
Date: Mon, 15 Dec 2025 18:09:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND] coresight: etm-perf: Fix reference count leak
 in etm_setup_aux
To: Leo Yan <leo.yan@arm.com>, James Clark <james.clark@linaro.org>
Cc: Ma Ke <make24@iscas.ac.cn>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        akpm@linux-foundation.org, stable@vger.kernel.org,
        suzuki.poulose@arm.com, mike.leach@linaro.org,
        alexander.shishkin@linux.intel.com, mathieu.poirier@linaro.org
References: <20251215022709.17220-1-make24@iscas.ac.cn>
 <c698d581-da15-42bf-9612-62f1bad66615@linaro.org>
 <20251215095103.GA681384@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251215095103.GA681384@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA4NiBTYWx0ZWRfX8HlQyGtFD1Fx
 MakRCazZ9ny22aGbDw2dGwJP/cmJ0ivMVc/S7yGhGVgb6uYhslKMy/6RJxQGZ5KzwbVn9o5o++i
 6ABEa6FixymyKboxOuv9f+N0heCVB4NGqtC430nM8uesbDa99f+aG0/PefnoSjX43NjXr1rMcNO
 wLIJ9bE+C601TgNpjHtPk8PTX6or8hLqHa7vqay9ohqWR+ln23K4a0Ydh3nBTAPmczkAc+ZzIpt
 2ECpcS37iZ3lIvFZUr4ik78RiU1uGrBF/kqRbfG9XNaBYZWtDjna/SUzM+NOT/jfrO2KYcoMrT3
 pd7kRYvp33PgyLfGgDea56a2ShprGB+uoje1/QY8qLsCSytLngfrvBihfyxLdYZEbCzV55FogDJ
 A8MO+6Kr7NkNCU8qKztjU9nqnKCFvg==
X-Proofpoint-GUID: JbnGFrg-WoGSH2_0m8JYPQyOkfGHLz-K
X-Authority-Analysis: v=2.4 cv=E6nAZKdl c=1 sm=1 tr=0 ts=693fde71 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=quK4xr9WOROKk1m0v-0A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: JbnGFrg-WoGSH2_0m8JYPQyOkfGHLz-K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_020953_801815_7926CCB1 
X-CRM114-Status: GOOD (  18.61  )
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



On 12/15/2025 5:51 PM, Leo Yan wrote:
> On Mon, Dec 15, 2025 at 11:02:08AM +0200, James Clark wrote:
>>
>>
>> On 15/12/2025 04:27, Ma Ke wrote:
>>> In etm_setup_aux(), when a user sink is obtained via
>>> coresight_get_sink_by_id(), it increments the reference count of the
>>> sink device. However, if the sink is used in path building, the path
>>> holds a reference, but the initial reference from
>>> coresight_get_sink_by_id() is not released, causing a reference count
>>> leak. We should release the initial reference after the path is built.
>>>
>>> Found by code review.
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: 0e6c20517596 ("coresight: etm-perf: Allow an event to use different sinks")
>>> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
>>> ---
>>> Changes in v2:
>>> - modified the patch as suggestions.
>>
>> I think Leo's comment on the previous v2 is still unaddressed. But releasing
>> it in coresight_get_sink_by_id() would make it consistent with
>> coresight_find_csdev_by_fwnode() and prevent further mistakes.
> 
> The point is the coresight core layer uses coresight_grab_device() to
> increase the device's refcnt.  This is why we don't need to grab a
> device when setup AUX.

That make sense. We dont need to hold the refcnt for a while and it 
should be released immediately after locating the required device.

Thanks,
Jie

> 
>> It also leads me to see that users of coresight_find_device_by_fwnode()
>> should also release it, but only one out of two appears to.
> 
> Good finding!
> 
> Thanks,
> Leo
> 


