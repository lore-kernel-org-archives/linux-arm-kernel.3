Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70082CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 09:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eG5zsQP87SBHZTXWU9NhLhnIuxMOy7HmwxVPsoHLI5Q=; b=gGfMgEUhelWyNIw3KqpH696D1r
	pvTvvSe5kIZeZJMBloCrtjdeb+Puu7e9lSfEf5HFAdrdA1rabNw5UvlJlz1BYqlqPGjaVaA1ELbKb
	9pH2c83XsWjFvnBm6oilYNATL+F/tpIjgQvMrjDiF2MqI8uANR4yWbCXVpcW7RwiwMScdGHNX2vDN
	zrbHSvo3r/ph6FA9gvw8SdRl58AzHyLgezx//WkcwLTxSHOYv4jPULhdSNZLm+PJ6S5C0OyH0N9T+
	IDxRIvFesJm7432vmuln+geUKKIyeHzsw9leKjF+JHtCjS+SC8vUN6R4kUtGCjum/hCITJPN2rzCB
	wJqs/nKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa93S-00000000xnj-42oO;
	Thu, 18 Jun 2026 09:28:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa93Q-00000000xmN-1yxV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 09:28:57 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8Fu0e1252615
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 09:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eG5zsQP87SBHZTXWU9NhLhnIuxMOy7HmwxVPsoHLI5Q=; b=Nb+ExJoKPrZnZUDd
	7ZNuwFiLLwUionlJ0TLwqBXCS/Csod2cbRdklqc8B13YBTjkdHz8kjEriLfbTx8r
	M1/T4UGZbS6akBVNdIzTYq3PuLgoQwV90Cr13XPM39RjdbOKtFx+QkBRnGtUnxav
	KXt5a+ou+cmZrbfZ9IAxC9UvLsK0y5kQ8OxtZJ/UYxmGldjC77sopevEcMHp1qbU
	0hUUfkzDuWpKlGZ8qMru1tAY1rDqmIxD3QG+6f+bvXxzsgU60TPzdBTxgWN0sTZM
	VkXqZyeM47VAr0KEqv8U/d0u9ieji1ITrYMAYGbiRB9PDMHeMtuHRN7aXjjiVZ2H
	YChpIg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0g7k0gn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 09:28:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9158ecbfbc2so13865785a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 02:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781774935; x=1782379735; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eG5zsQP87SBHZTXWU9NhLhnIuxMOy7HmwxVPsoHLI5Q=;
        b=HNb2gp3RRjPSu6ggNojFijp7gNyajCgj4Cv2AN36JFXjaGgdnFD7TlNomXoiPwc8K6
         1hvVJXc4OPaz1Amx+Fbh+iLuTVlHzqzf9CBGoCQenIDhT5p1qU1QWJM5jhBmyQQ8XTCe
         mNhkpldrXpoLuwooL3mPjmGEaEc+fwrYf3W8rz+OBWhUoSLuWEP+7O+vV2Jo4AxcDGQP
         v6Alwx1huuMY0A7Z1ez6w04z+UDsoTmrOBKr9I9bNdei5I8/BbozO3AXrImw5y2Pvsay
         p7Vtmbf5xh2TN//VgUSgv5UuWWKlA7xHHBN23MnZD3G5pgZvhu20HVe+Qez/BPQp/r9i
         gFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781774935; x=1782379735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eG5zsQP87SBHZTXWU9NhLhnIuxMOy7HmwxVPsoHLI5Q=;
        b=DarSw+zOSCj5/PtTqOl2MRaCvSKFy9eF6734rvn4cQUs/m4bTeiRAmDSTDakZHx3vw
         ZvfUx3iPNPiNFo7FFFIuQMi+LvuwvJRocZ4Lc69rAW2HCe7RshZFpeV5MvsB9xF9hcsP
         D0mm6bKF1naZDZEjzoEWENuOoxxbtQT2AakMd4PYzfOnL+siBKfx9BZB1AisA0l1L1Yl
         uT49XYDOuHz2Ynarop3WZ7SDxSRJOxDP87fHq5nDKJZ5IycQRS4xBOx6rRRu5iGKSmKa
         mD07Gim7PS+/cAhV8EgzyadEalGP9UDYc6loPWR6Wb8b5uY8Z68YS4OOoLxldrGlHSuE
         HnxA==
X-Forwarded-Encrypted: i=1; AFNElJ+sSwMD9igpiEr1w1g7FRyIIYKNme5XJwSFgdaBixmhgKQ7XLKroW2avShknbrvTc9Ydi5CNvtNWBF43SjtSyTu@lists.infradead.org
X-Gm-Message-State: AOJu0YydaocRSOvwNyshp/UsXudBpbi9RHJG6NJ1+7MNw4OwzcM5nHm0
	bbc1tzRr/701f+uj1h33hF2CuXdE3QIK6AVTAEXFT8h7+ep5I4yDbPsmpS+gBHzNyiwWm2eqC6X
	i99adXnZ9i8GJTnqGUJE7s78AnWDKlp6QZWHtrBKoVtAfw4CNLrchcfLduxmsy0Fsqx1IBhKRBl
	Y2Vw==
X-Gm-Gg: Acq92OGXDTOKCaQJkYuV+N+LemybcN/ExlsjypkhMGELikbIGk40xMHT8zo1fA85Q06
	ZjSYr9LXy/o33zBK+mXPNm/28OIoGlR1djuBCltZ8hlf6BgeRq08ItPxqD3G4no5ieGO+jgpP3m
	TitadweX46pakIexKRldzTEbWqGJEX11upnqDHC1zHBi41FZuHXshHodnR+6aI9pgA/PKeT4T3Q
	M08v7TnayNMXFLewsaRhkDDRDKCRkmuOuptQJO6DcTE9jtgwhxfrbo0bKldvkt0WoiE3MGNPTaV
	c/hP2mtcNPdKNwBWxUfLnw3o5UMZtmFYdPfFVa+MpIRMb9WvipAGdPof4mCpKn5SZSSEUhoBEgh
	M6m3QrolAqJBZOusouQE4SThVly9YjA8rcKc=
X-Received: by 2002:a05:620a:1991:b0:915:f92e:86 with SMTP id af79cd13be357-91f27cd63c2mr293830085a.2.1781774934803;
        Thu, 18 Jun 2026 02:28:54 -0700 (PDT)
X-Received: by 2002:a05:620a:1991:b0:915:f92e:86 with SMTP id af79cd13be357-91f27cd63c2mr293827285a.2.1781774934250;
        Thu, 18 Jun 2026 02:28:54 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69595d7934dsm1638902a12.30.2026.06.18.02.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 02:28:53 -0700 (PDT)
Message-ID: <299d54c5-fb93-47ee-9495-fbf48a3204fd@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 11:28:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
 <7xfxlxfqjcqdzl6gckaoyy2ioefglc7bgi66yv5khrbl6fi2zc@ivtiukdaj4jv>
 <d25f24ca-5bb3-4276-ac8f-8340e8fb4ce8@oss.qualcomm.com>
 <sdm7sqiokmsgczeat2mxch42ois5rwabav6c5fm7abct2xoepf@j3kraqrjvpoc>
 <ea345832-711d-4e32-af0f-bc74d8646aef@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ea345832-711d-4e32-af0f-bc74d8646aef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4NyBTYWx0ZWRfX7yITxqb9ttPN
 biO9bjOTQFCDYICJvwZNefo8zxgxdnUpF+2sdFIdHF9ySQK2dbPrwVdEedM/H691Mq4gOByHw+L
 BI5h8Dbc5b9V2gSqlxI40sHqjOUjjKFSAgz7p2CBjzwDJaqQj4Vv1O92LMYbs7CVFI4QHalsTnk
 Ek3TL6/zvsBB1/PTIRSIyKWed/ftunWX1frHPlbWJ50sNcKgca9CAZEXTNidZTpncIPIQSvE4du
 rXJBtrtnzlnJCeaSPPk0YtaefrJH7Q4IsSFe3FbJI9L1+l0okgLXam+qxORs9yr7XhRAFjgEm/F
 eFD30dqHChf5iLaG4SwNZ6yXQkV/pI93Hqy4kBrmRj/QuX2/ONi0AeZYiBcJbcG1EWj1qcY7YBw
 tdM9U0SwSgjmiuwJgyQH+twPQqDH4K9ONW7KXGtj3TMhycCscpHLGmT8/ahSwBmulpEIUj6SeaV
 pPujtroqFrUFWewIeXQ==
X-Proofpoint-GUID: h_hk7xl13SfGagY_SwFZwX89z9u34Yrf
X-Proofpoint-ORIG-GUID: h_hk7xl13SfGagY_SwFZwX89z9u34Yrf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4NyBTYWx0ZWRfX4Tkj/tKVWX8+
 dyDFhrWTPdSSR6T+nqKdA55wFw4naGvb28ScidP2dCnUpDnp9qNratjQ4CIel/VLMQ91kNLsd17
 Niu7hv6uDaGWEKMRAPLgHsuHj7COwJY=
X-Authority-Analysis: v=2.4 cv=YrI/gYYX c=1 sm=1 tr=0 ts=6a33ba57 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=gDzzPNA0uyMDLQwxZz4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_022856_625577_068DBBDF 
X-CRM114-Status: GOOD (  26.01  )
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

On 6/17/26 4:26 PM, Bibek Kumar Patro wrote:
> 
> 
> On 6/16/2026 5:51 AM, Dmitry Baryshkov wrote:
>> On Mon, Jun 15, 2026 at 06:36:51PM +0530, Bibek Kumar Patro wrote:
>>>
>>>
>>> On 6/8/2026 7:25 PM, Dmitry Baryshkov wrote:
>>>> On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
>>>>> On some SoCs the SMMU registers require an active interconnect
>>>>> bandwidth vote to be accessible. While other clients typically
>>>>> satisfy this requirement implicitly, certain corner cases (e.g.
>>>>> during sleep/wakeup transitions) can leave the SMMU without a
>>>>> vote, causing intermittent register access failures.
>>>>>
>>>>> Add support for an optional interconnect path to the arm-smmu
>>>>> driver and vote for bandwidth while the SMMU is active. The path
>>>>> is acquired from DT if present and ignored otherwise.
>>>>>
>>>>> The bandwidth vote is enabled before accessing SMMU registers
>>>>> during probe and runtime resume, and released during runtime
>>>>> suspend and on error paths.
>>>>>
>>>>> Generally, from an architectural perspective, GEM_NOC and DDR are
>>>>> expected to have an active vote whenever the adreno_smmu block is
>>>>> powered on. In most common use cases, this requirement is implicitly
>>>>> satisfied because other GPU-related clients (for example, the GMU
>>>>> device) already hold a GEM_NOC vote when adreno_smmu is enabled.
>>>>>
>>>>> However, there are certain corner cases, such as during sleep/wakeup
>>>>> transitions, where the GEM_NOC vote can be removed before adreno_smmu
>>>>> is powered down. If adreno_smmu is then accessed while the interconnect
>>>>> vote is missing, it can lead to the observed failures. Because of the
>>>>> precise ordering involved, this scenario is difficult to reproduce
>>>>> consistently.
>>>>> (also GDSC is involved in adreno usecases can have an independent vote)
>>>>>
>>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>>> ---
>>>>>    drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>>>>>    drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>>>>>    2 files changed, 57 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>> @@ -53,6 +53,11 @@
>>>>>    #define MSI_IOVA_BASE            0x8000000
>>>>>    #define MSI_IOVA_LENGTH            0x100000
>>>>> +/* Interconnect bandwidth vote values for the SMMU register access path */
>>>>> +#define ARM_SMMU_ICC_AVG_BW        0
>>>>> +#define ARM_SMMU_ICC_PEAK_BW_HIGH    1000
>>>>
>>>> totally random numbers, which might be different for non-Qualcomm platform.
>>>>
>>>
>>> Ideally, any non-zero value would be enough to keep the path active.
>>
>> This is true for Qualcomm devices. However, you are adding this to a
>> generic code.
>>
>>> Here 1 Would be enough to keep the path active, but might be too small to
>>> reliably keep the bus active.
>>> Other is UINT_MAX, which will reliably keep the bus active but might cause a
>>> power penalty.
>>>
>>> #define ARM_SMMU_ICC_PEAK_BW_HIGH    UINT_MAX
>>>
>>> seems to be suitable here to reliably keep the bus active by BCM
>>> for both Qualcomm and non-Qualcomm platforms (with some power penalty).
>>>
>>> LMK, if you feel otherwise.
>>
>> Shift it to the qcom instance or provide platform-specific values? (My
>> preference would be towards the first solution).
>>
> 
> 
> To support platform-specific values, we may need to introduce a LUT-based approach in the driver. (Bandwidth voting values cannot be placed in device-tree property IIRC ?)
> 
> Currently, all Qualcomm platforms use 0x1000 for SMMU ICC voting. I

(you used decimal 1000)

> can evaluate if this could be moved to a Qualcomm-specific
> implementation.

Add a vendor hook to arm_smmu_runtime_suspend/resume and handle it within
the QC driver

Konrad

