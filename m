Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3483EC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 11:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXuugUouKlB/CUW4LY6w9L6J1o6zPDA0wz2TTB2Kat4=; b=Xdxw54xCFe3G3Bh0pCsmmk13NZ
	jBnqejaEAll4BYuXxS5y4UsT+NfN4N159Qtgnd61X2Xkb+8WvYk4e9Wz6D10dhIuyhP6R9IvxCKYF
	v7yISf6mwx+QlBAwMDYES6Oel6+KdAfPZxbBsDf0bMI7JXd8TZ/oAJjEl7Qop2tmiydEYqEw7fXq+
	McJA9PY16IVAOdOy83dKyfkv/mzyoeHtdDMxNVhezVB911JJv0d4AT/IOeUWXisN7W0KheGCjIrXC
	3nNiMyY3vD1+5TrXe6nHxMUmd8J8VpAkmFkxDHuNnJGji9vv53ttwErLLSqMpABmP6Bm344JI1gbm
	SJbv4epQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgvT-00000002Aq7-3KIb;
	Fri, 17 Jul 2026 11:40:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgvR-00000002ApX-3wpP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 11:40:19 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HATCjh1557947
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 11:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KXuugUouKlB/CUW4LY6w9L6J1o6zPDA0wz2TTB2Kat4=; b=a2v8hqQK+5NFF89D
	97D6u2gu1GhLs3KiOzhJ9ucraCDlBeBTtrCFilTzkcsuq9OcGN9kl9X0Up4NKBW0
	k8plGKaONU2Bzc6E1gTHBP91QyRnTHCCKPUs7Eocnr7Lw/AYnrWS8mWgabM3brTf
	zNzQfLgUss/CGIKIpFSeoxa5zrxGstJ0SuHwOhNKlxP+dS73z/EQae0t3glkeB9f
	2yO4euksQGEzVf/SST7/9nJAgB6TdMC6y1iWmS/hunc/ene9xhV9+RTFBFHUlYqd
	cLZIT408D4tIFli89y1czok8b1kU2nzfSKyDjgwSyDMlN1joZXxW9XCuCDxt+qvJ
	rrlsCw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff8113wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 11:40:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84a4d8fd6deso5746363b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 04:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784288415; x=1784893215; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KXuugUouKlB/CUW4LY6w9L6J1o6zPDA0wz2TTB2Kat4=;
        b=URW9AkxYNOCUdeAg16loXqiCTGhFYXvjGyFtqtDaJl6R6tvLGn4ndOyOxxNhJc4UTx
         rErWAZ30pKv6b16VrBzu42C8ydYPCSuLb1KdHcjG7+zkJGlfCKVm4i8s8C3B7a0BOLi9
         GzDX3Wir1Zzlg8Gxs3v5fo5qfDjIq8H+cRDmH0PJW+9ujjNObqKqawmVS8E5zUitHSQM
         mU2m9Jb8ITcL6Hvwo0OaR/7fljHFUWEj7cDRIRVzOUiiHKRBLmQf7A6bk7NBSVsP/6k2
         /z0GZrSizodGCTqPn87La+OcPctGbSe0CsGr4nKh6m3osqkfo3nJdOR9uYcwiiAqI2md
         hI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784288415; x=1784893215;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXuugUouKlB/CUW4LY6w9L6J1o6zPDA0wz2TTB2Kat4=;
        b=N8R8ZPfATe1cyXNh0bWrGk35WSF2xETmnEN093IGup179NYEoDJJBXvS548T6hzokk
         eaTEft4uSoVFn1Mp+rIeMw8sntvyLgqiITp0+Qhsg003gV5TngDKEn7d8zPlCwAGFcXQ
         UODKM+SPqUARVNggMwuMdav5JYHKF7YgmqDaOJjJOhd0XiikXBWr2vdGI2fMQTZq7vqP
         2Rebif/u0vvk9kB67WT7ehYy0UeNeqvgVD3KtB6blJsWzIiGRJ8dCv9cRZs2l8/YIDPH
         tKdK1pIw6x5AYPS73MlKrjTT4fh/TLQ53Mvy/tdOi5oeNqhTWL/Qga6WyQ41VS/WpoV+
         IeAA==
X-Forwarded-Encrypted: i=1; AHgh+RpMG7RESuEHi+OcN0P7bcmuRXnX4d1xdznFOI+oIxR3DnFA1tFYa7aeRW2t/sEbFIOcho8BrnOL3+fdw11EocBA@lists.infradead.org
X-Gm-Message-State: AOJu0YznIz7C2jptbqbB1g8fn449+e4ZiEm6ydgM4r903GRzIPTCvOMb
	J+ku5swQPQtS0Q8ACUE2NCok/7bukc1cXOpHNQhfF+PwKmJXF00KD0XPeIh6uyX9xV+UPuulLNC
	etVnC2WPDMG/8WyH07Qf+05lHTsAu45qmrkBQHtUWqwomFXzKWE4cmkHV1JXi/oyXcHSeGHewiQ
	RNQQ==
X-Gm-Gg: AfdE7cnmSLiPVibSihvWT9wymTMjXL94MMePOHzY/NE2R1IHZM1QJFpCjD0Yon0+lKj
	DLYf8D+nyw8P8ivonLdIemFEZX1eoZCdWgph5R9uZ/P2i1oS+KOWIKAgJh1GTSY/5+ZrRYnVqS3
	Si2clf2UkPACtuFNG47WI3ws0x2Zsx4+A6MY6mohZHMS5kodQm/WUAiq5L2Wnz9GU9Acm+uULjX
	+ocY8PYAmliZ+iiHCsImEGmLWEanq2DUqZQqI8/sCAHbXfegkAX9dJbHWa4CooKdPs67rGK39cN
	+7DC10Qjq1Gwo2Kx19IQulDdbjIo2zQ8Guf2T0eQagEC1bBnqsgA/GHWb6BsTpoMzoDN0wezE8n
	2NgZHUZLpFcMxOp8QjCwn5qOZlNJQ
X-Received: by 2002:a05:6a00:80a:b0:847:97a4:d6b3 with SMTP id d2e1a72fcca58-84c2922630cmr2362996b3a.16.1784288415369;
        Fri, 17 Jul 2026 04:40:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:80a:b0:847:97a4:d6b3 with SMTP id d2e1a72fcca58-84c2922630cmr2362945b3a.16.1784288414707;
        Fri, 17 Jul 2026 04:40:14 -0700 (PDT)
Received: from [10.218.33.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af317c8sm859795b3a.30.2026.07.17.04.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 04:40:14 -0700 (PDT)
Message-ID: <2c21041d-f84c-4fa7-a977-555f9203d8b5@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 17:10:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC interconnect
 for adreno SMMU
To: Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-3-afdca0125a65@oss.qualcomm.com>
 <h6opbtr2ced3sannj3ym573qc2sjk7ek3clpto5j5mtqfrfk6w@34sk2zraoqtj>
 <807f145d-88d3-460a-9862-b63fe2a52cf7@oss.qualcomm.com>
 <a4f5sod3aflubxkk4mm4k5ozddydqcnqeac4s6vnozkd2nvxbi@hmh6zclsw5z3>
 <4e5a3d82-b946-4490-885a-ea7061939c32@oss.qualcomm.com>
 <ak5qkRKk2eHHLYmo@baldur>
Content-Language: en-US
In-Reply-To: <ak5qkRKk2eHHLYmo@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RbqgzVtv c=1 sm=1 tr=0 ts=6a5a14a0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qc56rwwszmrP7wb0vM8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: TTIK5lEpceWw7PP-iQZJABichRnd2US0
X-Proofpoint-ORIG-GUID: TTIK5lEpceWw7PP-iQZJABichRnd2US0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDExOCBTYWx0ZWRfXw9iUTAd0VCvo
 1t/glsu4km9QajPHKR/qHu0bNZ9z+SN3uTeEa4hluLr0+e0Zj4vaJmakVKDgvHCvGtKOSErsmJi
 bfrDetmq2+GqDaA1Ve71WL161GWlSXFMEwD698dDbXSB7WwLstEMzZmQmhF6QWxvg1H/W9MslnG
 bXWx8HGe5PX+QmXmxhfkdxqtnDZ+IJYwARNULiGmPMlEXQFNut5xpAjK9O9Ex/Zh/J9BV0e86gJ
 4vkLg4qub3eoYJswBkL2HpnSJVioG4iTnu0QLtqonFFeJ6uWd5zWBPCxjKMf5HImrH2lY8hIaGF
 i1yoFdJHJIRHZsjrT5IR18Y4/3mraoyjyz3IQg8TQXWU+4JqSvnC9w0NViMXUpiHm2fyxgNDhy5
 qidE0H28R/ScOclacmEbsfcNKHb8xEsWfFrWEhaAOYFnQGMC8Z9n6n2rVwwc/QNmiVSfYBCgKd0
 Fzxehbtf4zi6MQL/VFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDExOCBTYWx0ZWRfX/F2K+cwuO1qW
 ckrhFuBtKF6hr2UuT3TWNGe4LpIKE+em5KQbrWddNo80c8OPnt2b78jws6AQEgyt3txQXnlBvJv
 ukxB7VgLnO8T6KbgB9LI7PhmOB9hocI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_044018_105964_2369BC1C 
X-CRM114-Status: GOOD (  32.18  )
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



On 7/8/2026 8:56 PM, Bjorn Andersson wrote:
> On Wed, Jul 08, 2026 at 03:31:07PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 7/7/2026 10:14 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jul 07, 2026 at 06:37:24PM +0530, Bibek Kumar Patro wrote:
>>>>
>>>>
>>>> On 7/6/2026 11:12 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, Jul 06, 2026 at 10:26:36PM +0530, Bibek Kumar Patro wrote:
>>>>>> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
>>>>>> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
>>>>>> are accessible. Without this vote, the SMMU may become unreachable,
>>>>>> leading to intermittent probe failures and runtime issues.
>>>>>>
>>>>>> Add the required interconnect to ensure reliable register access.
>>>>>>
>>>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>>>> ---
>>>>>>     arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>>>>>>     1 file changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>>>> index 90e50c245c0c..721526f023dd 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>>>> @@ -3389,6 +3389,8 @@ adreno_smmu: iommu@3da0000 {
>>>>>>     			power-domains = <&gpucc GPU_CC_CX_GDSC>;
>>>>>>     			dma-coherent;
>>>>>> +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
>>>>>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>>>>
>>>>> Why is it ALWAYS? Would it be better to declare it as ACTIVE_ONLY and
>>>>
>>>> Added QCOM_ICC_TAG_ALWAYS, to hold the vote in SLEEP bucket as well
>>>> preventing gem_noc going to sleep when icc_set_bw is being called.
>>>
>>> _why_?
>>>
>>
>> Now when i think of where we implemented the hooks, ALWAYS is not needed. We
>> should keep it ACTIVE_ONLY since we are already voting it
>> back in resume pah. I'll fix it in next revision.
>>
> 
> The path is between the SMMU and DDR, so clearly it has to do with the
> TCU's ability to fetch things from DDR.
> 

Yes as you rightly mentioned, this series is helping to resolve the race 
in TCU DDR clink

> ACTIVE_ONLY states that the vote should only be applied when the
> application subsystem (CPUSS) is not in low-power mode (CPU is active).
> 
> So, are you saying that in all cases that cpuidle might select such
> low-power state the GPU TCU is "stopped", and does not need to perform
> any memory transactions?
> 

I rechecked the architectural block diagram, GPU TCU is
independent of the CPUSS, unlike system TCU.

This means CPUSS can be powered down while the GPU TCU remains voted up. 
While this series was intended to avoid a DDR voting race between the
GPU TCU and its clients, using ACTIVE_ONLY could have possibly
introduced a race between CPUSS and the GPU TCU itself.

Thanks for catching this in my reply Bjorn.

ACTIVE_ONLY would have been suitable for system TCU (apps_smmu)
for which the interconnect field is anyways not needed, but
unsuitable for GPU TCU.

> 
> To me these two are orthogonal and TAG_ALWAYS is logically correct, but
> perhaps there's some practical dependency that I'm missing?
> 

We can ignore my acknowledgment [1] on previous response, Dmitry.
ALWAYS TAG is correct here instead of ACTIVE_ONLY in the interconnect 
field for adreno SMMU.

[1]: 
https://lore.kernel.org/all/4e5a3d82-b946-4490-885a-ea7061939c32@oss.qualcomm.com/#:~:text=Yes%2C%20I%20think%20we%20should%20go%20with%20the%20ACTIVE_ONLY%20flag

Thanks & regards,
Bibek

> Regards,
> Bjorn
> 
>>>>
>>>>> then drop the extra suspend/resume play?
>>>>
>>>> Not sure if I understood it correctly.
>>>> Did you mean the extra suspend/resume play in arm_smmu_runtime_suspend
>>>> or in arm_smmu_device_shutdown() path?
>>>
>>> runtime_suspend/resume. I might be incorrect here, but I think it is
>>> exactly what you need.
>>>
>>
>> Yes, I think we should go with the ACTIVE_ONLY flag and we would need
>> this voting in suspend resume path (For the same reason mentioned in commit
>> description and cover letter of the series).
>>
>> ALWAYS would avoid the need for this handling, it would keep the vote active
>> unnecessarily, but still that would have been nondeterministic.
>>
>> Thanks & regards,
>> Bibek
>>
>>>>
>>>> Thanks & regards,
>>>> Bibek
>>>>
>>>>>
>>>>>>     		};
>>>>>>     		gfx_0_tbu: tbu@3dd9000 {
>>>>>>
>>>>>> -- 
>>>>>> 2.34.1
>>>>>>
>>>>>
>>>>
>>>
>>


