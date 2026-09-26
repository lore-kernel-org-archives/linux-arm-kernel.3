Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0FAC98332
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 13:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ryy0TaceLombIiL4TAr0+o046iePkO13SoMlmGHBezM=; b=UONKrKQ5fyGi4ypGK/YclBz4A7
	3OWreSkd5z3tsbc6sADnScI/VHhW1VOD1MzHEDdkcEKZKWwDAX4cm2sI1h5DeLbgme4Cap+X7nLV+
	Jn+7X+o1cZarGXUwWIGQcJSLsvdChYT9Hf1NGkDEPh9BFM1iavnO917jz/e1vrC9bDjchUUSq4f6E
	H5mYxIU4ZNm0Yf+S2gKzhhkHqp9WgVuHWbH1NOVZG8aIBBOxFJuCV2NXhXVLgxo4Z/wZw7G/4B4j4
	GXlEXhnZM8P0uhB0SPxSrm4iVW7xRxZDBFEDXeB9lXhRncGvYyQeS2Ciszug1sCCOpcHaY095BJn1
	VzviavbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAScT-0000000FTAb-12Ov;
	Sat, 26 Sep 2026 13:39:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAScQ-0000000FTAH-2AnX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 13:39:11 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QAo2JQ184441
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 13:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ryy0TaceLombIiL4TAr0+o046iePkO13SoMlmGHBezM=; b=U3LxcIkFYFlytTfx
	jKLMqAGBDdHcRGSfy0eyL488h3TuiAXRHbKaj7yFfM6RsQi2DGKYQR1l4GU8vTBH
	FVsE9fjpyCIH3hhsfyWB+2RtyVBl3cHaimRcA5bJUME2qFn3NxV9PW6qvlRrnXje
	EZ3Yoxe81pVs0c+0h7OdHZyjv/eXPVRL+0tpz+AtiYFTdUjz3FwVVLMvt6p9J4aG
	+9uAgrGKAbdbrQLIfqt+o6hQvMaF5Wm0jGf6WunNnLuB4j6x6IDi9/4r5dyzDMjm
	HMl/oSGx736WTdqJY+JoJM8PGofxMkuJj6k/k/fcnWf+rYABFktjTvUsdb3aTKio
	ojh1iw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx5mw90my-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 13:39:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-342a0e1d8c4so3555833eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 06:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790429947; x=1791034747; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ryy0TaceLombIiL4TAr0+o046iePkO13SoMlmGHBezM=;
        b=MS5QpfLXN7333k+w7wlVPQCniG87e4QaRZxfXTZjOcd/d51Hm8tKlcgo+wQmZ0dRBK
         orxJxAc/EDmT2npKc5AoDInXuB9o9Nu5k7pK8Ar76GSDRX/ApAm2GqzgmBTIHESiToLi
         7gjs5l3QxUmfzdHv9c1/q2qqcB0ByPAbPBXBkCVK8TSLYuErX5GFuZaYhtHMnvhtE/uH
         P/Wl1J2gwCwG16siSzRYOCQQl5UsdC9rD4XW3aO+pCBEDtufWKZpFkoeM5EkTfZwaAB4
         D0fuL3d3B2RKayjh7CnnmDgE+Fyg1X23tQiA6d1B+bYDxo5aCgNJLcbHnaTYuDhU9IVF
         KYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790429947; x=1791034747;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ryy0TaceLombIiL4TAr0+o046iePkO13SoMlmGHBezM=;
        b=qdbQ1n4rtfuSAJtNWaE+EJQL60FaOeJl5+AGcnPH2iV4+5lVBxQRqeT9QVA9JKVxj6
         LkIfTtffyD+hDzJJX+sCwVcfqyOFl5jx6yZGcmuzHj9Ao6h2eh4modaEuuSWzSY/Zpye
         LF4Sv3Xm8p2eLF/xGEpQmKQa0JGxi0XFLfeGt6HYrCUMz48xPKi37cvi9EzPv1uGxbT4
         Zs4oYJWX8eso8QgxfRjH8tVqN8Dfmj9eBojHVlrZGpI/551J+JNN2wbVL4mMMsuBv2WP
         n6ycxRF+/V8yIXaPKJkfM7kBe1XBIOCgTnMO8QmtsQmioCpa0oqG+tvZ06/W6yTwprlp
         TBXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhg0lMOszirsysH7Dz+SsbJ2XDrsLOr3DWxskbEQzoqOhpgrMNWvJrLFjh/HRttSftFMxkPN9rqALsyHXoXsKK@lists.infradead.org
X-Gm-Message-State: AFq9FYI2sQu7NV904sCjXZYy/aMtLomBiKPz1M7lkXs4nGgDLSI6zhiB
	ZSzDtRE0eXey3ljE/AjcmCh68LIvvcHFaPVXPekHOpoJv4GVnfsZIWvY0Caw9zsvSuokb5E4q4d
	O4kWJmLsvQJH4ivrcPju6WRcTw9c/iqDz8vSh/LUeH1NzyAir3KFXikAfybkthTB7+y/vs3mZZG
	aDdw==
X-Gm-Gg: AYBFou0kGIW18j62ih50087cQ8AvyB+ugJAsm7Bn3eAGzf/Tu3uLFhiWeRNruZrAEeH
	S73yI8AWTRZfnqTg9hXzXmcvN3ON1ckxaUG+1p8KahsitE4lLvill2hrsWfLdqK5RXuOdF2DAGe
	cRsENhnmlDaA5BIlRs7T0Xeqf3WhK6EOrEJtphI1rRmzpBuY7nu2+lgJZVTPukbi2wofSPkF/Kw
	IzTsjDm6kRnG0H/XXYIEqQQ8MvPo3MU/boL+41mGemSWYVdb0xPITIRrGsRW6XPRZbq0pghE+M7
	rofci+Odni0cYZXvArj3+tthrQJfZb9cTwHXJjm0F9ikaNiZHK2gYTl4MwE51QmeZ5C704BQc3o
	1lBGsxkM0MIBhLlCEtU1VdX4ThFME9qDoClo=
X-Received: by 2002:a05:7300:3b28:b0:328:2ea5:bd39 with SMTP id 5a478bee46e88-342705b94bcmr4840003eec.4.1790429947075;
        Sat, 26 Sep 2026 06:39:07 -0700 (PDT)
X-Received: by 2002:a05:7300:3b28:b0:328:2ea5:bd39 with SMTP id 5a478bee46e88-342705b94bcmr4839926eec.4.1790429945792;
        Sat, 26 Sep 2026 06:39:05 -0700 (PDT)
Received: from [192.168.68.104] ([49.207.195.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141a4a00dsm15522844eec.1.2026.09.26.06.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 06:39:05 -0700 (PDT)
Message-ID: <23f281ef-d724-4fdb-aa1d-408c368d941c@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 19:08:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 3/7] firmware: arm_rmm: Configure the RMM with the
 host's page size
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
        sudeep.holla@arm.com, trilok.soni@oss.qualcomm.com
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-4-suzuki.poulose@arm.com>
 <20260924100313.00003be7@oss.qualcomm.com>
 <d4b768e5-c942-43cf-aea2-c266a8bab353@oss.qualcomm.com>
 <bb4a6fa1-721c-44f8-a8d2-54e80b5449c6@arm.com>
Content-Language: en-US
From: Venkata Rao Kakani <venkata.kakani@oss.qualcomm.com>
In-Reply-To: <bb4a6fa1-721c-44f8-a8d2-54e80b5449c6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VVqSEBub0VKLIye5bmWnOZjr99mUD8Si
X-Authority-Analysis: v=2.4 cv=QvPLTlyd c=1 sm=1 tr=0 ts=6ab7cafc cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=lfboiZ0IWGQn+/ls2+s3/g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=VEZfdOmQvSGR4K_WtDcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: VVqSEBub0VKLIye5bmWnOZjr99mUD8Si
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA1NCBTYWx0ZWRfX2WwU8bzXHHJe
 p5tsSZRl2mpHPWJ38130BTs1PhEIYk+2pyRdFhhVguiJEdJJ/0pN7pFR7cVPv54NC9SlG/LuyM0
 HqXejkT0+/tn44qvJ+lUn8gntJrllt8O86Bko+36d1muk+aLeQ59eN5U+T2c2Vhn48QX9O3IaZ9
 PxS7+gAEjhi4KCHA6rmflI7ti+/rH3SC1pbRWHqbr6InGPGgkX411ZilDV+n0wmYLk3eect7LIR
 sQYn/yoA1CIHYWkM/BHWBJ5VtWoJ9aC1tcGQ73LPncIimtYiyAzsn8UWPKi0J0YpupREcpCHfUp
 olv/WAA2naric4FBjlhSs5aSrcMm8HOmEHLkZiyMSaNhIkvDX2LdFEm5mT0vooRVwLwGRy+11XM
 ShKtKKsstnJhV9dXSDIg1I8eZEHEmWw/wID+pomW0jmqOjHZxny9JZWlGSTyq8J0VdB96jJHnOa
 bCMEA3Xp/iZPV3cY/ew==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA1NCBTYWx0ZWRfX//oq0GpUtmUv
 yEwl5DscDbfTjUGIztKKC+mcrvVsHY9TQfZoc5aYcTFjOTiboQ1/ghcgwMpIagnLO6lqKYr6F/N
 ginkC3cjlifIRqUOz4ViiG5+lOlzN2Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_063910_681126_068640BE 
X-CRM114-Status: GOOD (  28.20  )
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


On 25-09-2026 08:26 pm, Suzuki K Poulose wrote:
> On 25/09/2026 14:23, Venkata Rao Kakani wrote:
>> Hi Suzuki,
>>
>
> Hi Venkat,
>
>> Now, with this patch Host can set RMM Granule size equal to 
>> PAGE_SIZE. Does RMM send the request to root to set GPT physical 
>> granule size = PAGE_SIZE?
>
> I don't think FIRME lets you do that and it would be too complex. Please
> remember that the GPT is not just for the Non-secure/Realm world, but
> also for the Secure world.
> So, the Physical Granule size would be statically configured to 4KB on a
> platform unless it supports the 4KB granule size, to support all
> possible Sofware components.
>
>
>>
>> In a scenario where, GPT granule size (|GPCCR_EL3|) set to 64K and 
>> Host PAGE_SIZE set to 4K, how does root handle GPT granule mappings, 
>> when Host send RMI_GRANULE_DELEGATE(PAGE_SIZE)?
>
> If GPCCR_EL3 is set to 64K, RMM must not report it supports 4K GRANULE
> size.
>
> nit: Please avoid top posting your comments and use plain text for
> discussions on the list.
>
> Suzuki
>
>
>
>
>>
>>
>> -- Venkat
>>
>> On 24-09-2026 10:33 pm, Jonathan Cameron wrote:
>>> On Thu, 24 Sep 2026 14:51:57 +0100
>>> Suzuki K Poulose<suzuki.poulose@arm.com> wrote:
>>>
>>>> RMM v2.0 brings the ability to set the RMM's granule size. Check the
>>>> feature registers and configure the RMM so that it matches the host's
>>>> page size. This means that operations can be done with a granularity
>>>> equal to PAGE_SIZE.
>>>>
>>>> Signed-off-by: Steven Price<steven.price@arm.com>
>>>> Signed-off-by: Suzuki K Poulose<suzuki.poulose@arm.com>
>>> Hi Suzuki,
>>>
>>> Some trivial stuff inline.  Assuming that is addressed.
>>>
>>> Reviewed-by: Jonathan Cameron<jonathan.cameron@oss.qualcomm.com>
>>>
>>>> ---
>>>>   drivers/firmware/arm_rmm/rmi.c | 70 
>>>> ++++++++++++++++++++++++++++++++++
>>>>   1 file changed, 70 insertions(+)
>>>>
>>>> diff --git a/drivers/firmware/arm_rmm/rmi.c 
>>>> b/drivers/firmware/arm_rmm/rmi.c
>>>> index 3baba931f92e4..c9ea964fd9081 100644
>>>> --- a/drivers/firmware/arm_rmm/rmi.c
>>>> +++ b/drivers/firmware/arm_rmm/rmi.c
>>>> +
>>>> +static int rmi_configure(void)
>>>> +{
>>>> +    unsigned long granule_feature;
>>>> +    unsigned long granule_size;
>>>> +    int ret = 0;
>>> Value not used.  Fine if it is future churn reduction, but I didn't 
>>> spot
>>> where if so. I'm guessing left over from refactoring
>>>
>>>> +
>>>> +    switch (PAGE_SIZE) {
>>>> +    case SZ_4K:
>>>> +        granule_size = RMI_GRANULE_SIZE_4KB;
>>>> +        granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_4KB;
>>>> +        break;
>>>> +    case SZ_16K:
>>>> +        granule_size = RMI_GRANULE_SIZE_16KB;
>>>> +        granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_16KB;
>>>> +        break;
>>>> +    case SZ_64K:
>>>> +        granule_size = RMI_GRANULE_SIZE_64KB;
>>>> +        granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_64KB;
>>>> +        break;
>>>> +    default:
>>>> +        BUILD_BUG();
>>>> +    }
>>>> +
>>>> +    if (!(rmi_feat_reg(1) & granule_feature)) {
>>>> +        pr_err("RMM does not support %luKB granules\n",
>>>> +               PAGE_SIZE >> 10);
>>>> +        return -ENXIO;
>>>> +    }
>>>> +
>>>> +    struct rmm_config *config __free(free_page) =
>>>> +        (struct rmm_config *)get_zeroed_page(GFP_KERNEL);
>>>> +
>>>> +    if (!config) {
>>>> +        pr_err("Unable to allocate memory for RMM config\n");
>>>> +        return -ENOMEM;
>>>> +    }
>>>> +
>>>> +    config->rmi_granule_size = granule_size;
>>>> +
>>>> +    /*
>>>> +     * For now we set the tracking_region_size to 0 which is the 
>>>> only option
>>>> +     * for 4KB PAGE_SIZE (1GB for 4KB PAGE_SIZE, 32MB/512MB for 
>>>> 16KB/64KB).
>>>> +     * TODO: Support other tracking sizes via Kconfig option for 
>>>> other
>>>> +     * PAGE_SIZES
>>>> +     */
>>>> +    config->tracking_region_size = 0;
>>>> +
>>>> +    ret = rmi_rmm_config_set(virt_to_phys(config));
>>>> +    if (ret) {
>>>> +        pr_err("RMM config set failed (%d)\n", ret);
>>>> +        ret = -EINVAL;
>>>         return -EINVAL;
>>>
>>>> +    }
>>>> +
>>>> +    return ret;
>>>     return 0;
>>>
>>> So obvious this is the good path without anyone having to think 
>>> about it!
>>>
>>> I did quick check on whether this was to reduce churn due to later 
>>> changes
>>> but couldn't immediately spot anything
>>>
>>>
>>>> +}
>
Understood. Thanks Suzuki.

