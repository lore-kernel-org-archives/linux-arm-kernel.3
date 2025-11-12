Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF92CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 13:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGXDUZfwsFaeBt+mI+uOkjAH29Y58afQeL3Rc1JtMjU=; b=zsSOO2b97ZaPoDv6Ftw4WbzReF
	imXV0vNJ9ZkbII4D/9HG28UXckPksd85ksUX+g9vAxw4hyi7vzEd2puCg4bWepI1yHC20A8hMm5jO
	B2ESju0CSth8KQRjoqcOixtF6fEGesYl9XVNRTtC6++CsvDI9IumOuhXvgPaCwqCBLaQUQYnySAGi
	91sh3BcgT9+OZVF6d9g3ZDiMFhF84Vlit8cv61cqkylDgsf59rcTG86abjMdESok/IetbR+gkc4cU
	OaM6J/CnbLsAdkJmV/WeUS008Qpgc3rmebHmlUQJXEAPjC78UMyu2LTpcqlwtY+v7OZhexmfdZgxb
	oK3atP+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAzY-00000008r0Y-108p;
	Wed, 12 Nov 2025 13:34:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAzV-00000008qzm-3NK7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 13:34:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC7jh913506684
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 13:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGXDUZfwsFaeBt+mI+uOkjAH29Y58afQeL3Rc1JtMjU=; b=DkzSjzv7o890FYzS
	PBiPzp55r4DJMOP29CmA8Sqo05Q4TKIbmj95EaPeqWWnkd7n7ssJzT3K6OzItw+S
	SiyjcxBWTAHBfIoyfvSdtNrjopSWDFF2z0DEOUztvgtFdJptwCS3nI/ef67tW/ho
	kmDq/sUiFJYzpxvmVLww9GJAyVxCl32gu1Apg/6oi4GqVGn9smOkS/cDbPDlC50T
	7YvxvQyN4QIevIwB6DvVJkSWE50k379exeVVACRgedoP3kTRA+dI8cmfXTrIhfam
	/V6u8uGdGYwaE02sycCc6ANZDLWkvMkv6fosAbUnSW/isUMVUfi/9uLrywQ4/sLQ
	4nyjVw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acdcc2kay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 13:34:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b222111167so22945785a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 05:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762954468; x=1763559268; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qGXDUZfwsFaeBt+mI+uOkjAH29Y58afQeL3Rc1JtMjU=;
        b=Cku55cNOrwSEqi/qqgXBo2qJxrlfhbSzXy7QkKzX8nTY4ncKbYCHJznHrHBBAzE94U
         C5Ed9HjE/AMfspF+/MFkqtl8chTXJqxZ/a3PuOyqZYwL5BCFw/tf/nez3ZnEnoRRgoI7
         P7F/kE06pMhZMIisS+H125tIRKFDg4SCzYiVoM9QzWcmtCVKyghn2/ETumFetYRMZuR1
         ATq0hv3Qd1GIF3qB0B9d752QIUikuX/KBz8BY8Y7G16ZWfsZLtg9kTEtrFyps1Y26Euy
         Eimeip3kkZLc6nt4sGhx7OcnMQhZejNIYgbCYSc0Uwu8OHqChWQwKsNWneCAs7MCuMSd
         uVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762954468; x=1763559268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGXDUZfwsFaeBt+mI+uOkjAH29Y58afQeL3Rc1JtMjU=;
        b=sGR9hCKyOA/6AalTt1VR3bxJi8X60108n3WmNfXWsTBh/ytBacmfQbOZx3PIyWp2un
         eKW+Pd9al+xQJDY1LyMBuYFlA4Y20/wtPZxqGek+sq1g++AtBRBO9ytIBeJGGbz6NxKF
         HdNAg7t91zs1mX8hft2yDNY6FLLFEoxI90jtoF7m0+TG2Zc13rSTU7I0SkuX65+byigt
         lhPGroov9dAmRedCfnzx+BK867Si3tty2S9jYvFAGU/vNGJ/8n9Jm+kN7KxyTe2M/XAr
         /8jNyWBIc4V7zWuZFPYwMmgknfr1qaWr8Pm2HOJxCi9LkfgpqyCmqOIeFoEjcmMRcLx5
         bVxg==
X-Forwarded-Encrypted: i=1; AJvYcCUE063b1BKuYEOJaoJjeU/Zss5slJcYBSe4T8nSzMSrkxbX2ntvTlrge1RDjxkmJ+aZmflr+HPHlXcRQnZkpbuc@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5MK/i2hf9LqJsAXeFPcQVjKw4OULx6thpjDwBFIdqZyCNgxDr
	nYMAjkxe385mwijUiqSq6dNjrAoIzDMPF1GBFvNdpK5iAY+v1zOAhcibzBa5sPzf7I4FdafZKmX
	Q5z1SDybF3lUKPksU/EwJ64Heg0/Y8/TObMMjOpUw8C1KVpTWGZAG9GwbqTdCVFFwVkxxMcgTly
	uVFLaBbnq7MA==
X-Gm-Gg: ASbGncuYBsX5DTSjjSh7+YScHK5JRKaMgzh+cHertQCJVrwCXI4bjSwCZ2vGtOLji2L
	T/4DXvJYKF+PvmUOy0WxFojhYTFsbJ37XWL+ztt+kdd0GHZU5IP2IwITjwRhdPQ/T/EPrxEb9L4
	BfYup3MOgkGcigomp7OxIX3qRaqIVsgbwM/ChH43sGtcdy8oQGTa57yfwWTz/31SqHNBonVcQRa
	yvv/mLdROyYtmxxptoiRcgpGZJKbz97rg7fuULhjUK7lXjM2++YRL8YpDxt9sLdv2VIUvMj5vKF
	6OmS0XThAAi44RxXoty0zXKkOSydRVVfvGhmtvHLiCMkwdsQJDjSLruHQwwqB5yDQLcRtr0XzK/
	iQEH8HItjT08R535WgdYNHIHDySK5NQwhTRMZqtLgzzZmeqWMRId7a5Xv
X-Received: by 2002:ac8:5808:0:b0:4ed:a8f8:307b with SMTP id d75a77b69052e-4eddba75ee9mr26331631cf.0.1762954467860;
        Wed, 12 Nov 2025 05:34:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxtX+WAajjcT2p8bWAOl+s/zxUhDfeHoxA5vB04XFWyNVaIXKxhv+DFjlp7i/O3F94Gm5Rmg==
X-Received: by 2002:ac8:5808:0:b0:4ed:a8f8:307b with SMTP id d75a77b69052e-4eddba75ee9mr26331151cf.0.1762954467258;
        Wed, 12 Nov 2025 05:34:27 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7339a7078dsm105318066b.6.2025.11.12.05.34.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 05:34:26 -0800 (PST)
Message-ID: <5a1aaf4a-c5d5-42e1-9044-d12a6c231904@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 14:34:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 0/5] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Enric Balletbo i Serra <eballetb@redhat.com>
Cc: robdclark@gmail.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org,
        krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
        dmitry.baryshkov@linaro.org, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Eric Chanudet <echanude@redhat.com>, charan.kalla@oss.qualcomm.com
References: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
 <CALE0LRupg93WsBVc62Lqt-T9qmK5MdEYoScxyP7=ttKJYXAsUA@mail.gmail.com>
 <33826089-54b5-47bc-8a5b-6004c7a276b8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <33826089-54b5-47bc-8a5b-6004c7a276b8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: urEGFtP9Mykd-AbAUrouT6gfq2K01dLq
X-Proofpoint-ORIG-GUID: urEGFtP9Mykd-AbAUrouT6gfq2K01dLq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEwOSBTYWx0ZWRfX9i7maxlSNiuG
 VEP+7RwYH95m9o8BfZKYbj0HfnXH0cHT84PEND8fkpR9Km8qLKR0tan67bSSJQuUnLJs/neYe6K
 Ku1elSfCST09Z9Rh7PpvqNNN9aKalIhBs4x3fC0FikHzwOSWM4uui9Y0U+FwNxZH7a95ACRJJ6W
 tvd7+Fs0Pw4+q2xoTMR5iN2Fzj+u2HJjO0N7YHMQySPzbFI+IJEHc5iwumNgbF+CpoR/53qp2sP
 NCWKaHRW5dQJ9g/BVgVzSGyxZaqwjwJDf3yCPbScb+4Sq/XG+i9xcFieCI1c9OKJM5IqCt5ftnp
 j07X/K24kB6IJWPb1Eo/zEZKoERBwznh+vtDyzsFNHIbcDFHX91ou10Tu8EwMNWzLZlylHiuh3n
 CDbZ7O+YXekEs14yZfNL76Aepf2w8A==
X-Authority-Analysis: v=2.4 cv=L/0QguT8 c=1 sm=1 tr=0 ts=69148ce5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8
 a=i3X5FwGiAAAA:8 a=EUspDBNiAAAA:8 a=SKrgUew0zp_WtuwtRiYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_053429_873603_5A43E1BD 
X-CRM114-Status: GOOD (  30.16  )
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

On 11/12/25 9:45 AM, Bibek Kumar Patro wrote:
> 
> 
> On 11/7/2025 2:58 PM, Enric Balletbo i Serra wrote:
>> On Thu, Dec 12, 2024 at 4:14 PM Bibek Kumar Patro
>> <quic_bibekkum@quicinc.com> wrote:
>>>
>>> This patch series consist of six parts and covers the following:
>>>
>>> 1. Provide option to re-enable context caching to retain prefetcher
>>>     settings during reset and runtime suspend.
>>>
>>> 2. Remove cfg inside qcom_smmu structure and replace it with single
>>>     pointer to qcom_smmu_match_data avoiding replication of multiple
>>>     members from same.
>>>
>>> 3. Add support for ACTLR PRR bit setup via adreno-smmu-priv interface.
>>>
>>> 4. Introduce intital set of driver changes to implement ACTLR register
>>>     for custom prefetcher settings in Qualcomm SoCs.
>>>
>>> 5. Add ACTLR data and support for qcom_smmu_500.
>>>
>>> Changes in v18 from v17_RESEND:
>>>   - 1/5 : No changes
>>>   - 2/5 : No changes - reviewed-by tags collected
>>>   - 3/5 : Addition of
>>>     pm_runtime_resume_and_get()/pm_runtime_put_autosuspend()
>>>     around register access of PRR related private interfaces
>>>     as discussed in v17_RESEND.
>>>   - 4/5, 5/5 : No changes - reviewed-by tags collected
>>>   Link to v17_RESEND:
>>>   https://lore.kernel.org/all/20241114160721.1527934-1-quic_bibekkum@quicinc.com/
>>>
>>> Resend of v17:
>>>   Addition of minor fix of the build warning reported by kernel test robot [1] by powerpc_random config [2].
>>>   [1]:https://lore.kernel.org/all/202411140748.6mcFdJdO-lkp@intel.com/#t
>>>   [2]:https://download.01.org/0day-ci/archive/20241114/202411140748.6mcFdJdO-lkp@intel.com/config
>>>
>>> Changes in v17 from v16:
>>>   Tags provided earlier not collected yet on patch 1/5, 3/5, 4/5, 5/5
>>>   due to the following revisions:
>>>   - 1/5 : Move the CPRE workaround out of qualcomm specific logic and gate with config
>>>           , update the silicon-errata.rst file
>>>   - 2/5 : No changes - reviewed-by tags collected
>>>   - 3/5 : Move the compatible check before assignment of callback as suggested.
>>>   - 4/5 : Add the actlr setting for *adreno variant* of MMU-500 as well.
>>>   - 5/5 : Due to changes in 1/5, minor refactoring had to be done before adding table.
>>>   Link to v16:
>>>   https://lore.kernel.org/all/20241008125410.3422512-1-quic_bibekkum@quicinc.com/
>>>
>>> Changes in v16 from v15:
>>>   - Incorporate Dimitry's suggestion on patch 4/5 to use dev_dbg instead of dev_notice.
>>>   - Fix kernel test robot warning [1] coming for 32bit architecture configuration.
>>>   - Updatingthe tags
>>>   [1]: https://lore.kernel.org/all/202409230343.Q8KnYl2w-lkp@intel.com/
>>>   Link to v15:
>>>   https://lore.kernel.org/all/20240920155813.3434021-1-quic_bibekkum@quicinc.com/
>>>
>>> Changes in v15 from v14:
>>>   - As discussed with Robin and Dmitry modify the actlr table and logic to use
>>>     compatible string instead of sid, mask for device matching which is
>>>     similar to qcom_smmu_client_of_match mechanism.
>>>   - Expand the comment in qcom_smmu500_reset to document reason why CPRE bit is re-enabled again
>>>     after arm_mmu500_reset resets the bit.
>>>   - Rearrange the series in order to keep prefetch setting patches in the end.
>>>   Link to v14:
>>>   https://lore.kernel.org/all/20240816174259.2056829-1-quic_bibekkum@quicinc.com/
>>>
>>
>> Hi all,
>>
>> I've been looking at the evolution of the Qualcomm SMMU driver
>> (arm-smmu-qcom.c) and had a question about the design change for
>> configuring the SMMU_CB_ACTLR register.
>>
>> It appears there are two different approaches:
>>
>> 1. The "SID" Approach (Older): In some versions, a driver would use a
>> large, platform-specific struct (e.g., sa8775p_apps_actlr_cfg) that
>> maps individual Stream IDs (SIDs) to specific ACTLR values. This
>> allowed for very granular, per-SID tuning. For example, a device with
>> 10 SIDs could have a specific setting for just one (0x2141), while the
>> others used a default.
>>
>> 2. The "Compatible String" Approach (Newer/Upstream): The current
>> upstream driver appears to use a client_match array (an of_device_id
>> list) in qcom_smmu_init_context. This maps a device's compatible
>> string to a single ACTLR value, which is then written to the device's
>> assigned Context Bank.
>>
>> I want to make sure I understand the implications of this new, simpler
>> approach, as it seems to introduce a trade-off where granularity is
>> lost:
>>
>> Multiple SIDs, One Device: A single device that uses many SIDs in the
>> device tree (e.g., the video codec, which might list 0x2141, 0x25C1,
>> 0x2161, etc.) will now have one ACTLR setting applied to the Context
>> Bank that serves all of those SIDs, even if the old SID-based list
>> only specified a setting for one of them.
>>
>> Am I correct in this analysis? I'm assuming this was an intentional
>> design choice to simplify the driver, based on the assumption that all
>> SIDs for a single device (and all devices with the same compatible)
>> can share the same ACTLR tuning.
>>
> 
> Hi Eric,
> 
> If a device has multiple SIDs, all serving the same functionality and grouped under the same "iommus" field, for example:
> 
> iommus = <&apps_smmu, 0x2141, 0x0>,
>           <&apps_smmu, 0x25c1, 0x0>,
>           <&apps_smmu, 0x2161, 0x0>;
> 
> In this case, all the SIDs will be associated with the same context bank. Even if the three SIDs have different ACTLR settings, since SMMU_CB_ACTLR is per CB setting, all SIDs attached to that bank will share the same ACTLR configuration. This is why we designed it to be "per device / per compatible".

Does that suggest the settings may be slightly suboptimal?

There's some work being done to allow more granular association of
the passed SIDs:

https://lore.kernel.org/linux-arm-msm/20250928171718.436440-1-charan.kalla@oss.qualcomm.com/

Konrad

