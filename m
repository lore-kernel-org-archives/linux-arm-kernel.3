Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94777CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 07:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9goTM/XMiiNX86aLJBJ8fJF1NxfmrSk55ouvKAkbHtc=; b=ki9PkTJqu81RyqjKNHur7e0kt4
	/A+9ty9ZH5+fKTTJ2lgp17a154PZzRun6JwQJUMqjL07nyq2d1bh25vH5lRc+nDPRs3YPNOLHRrTO
	pr8FQCJIFU3M2utdMDfnpSOp+dqSBycfMdwohbWXAygnfL3sfZNHMDEPptxX6IVBdGvjvD/8oJGfE
	o+xsMYhab8dH6h0XLMEPj0YAcNLpZMdKND2uGQHFovqbZn8D7YCv4SDhrQgpd/jxCeUQyPKj9C9E3
	rEufXFtr002FSP5qokrKHjz7zM1gKDWcziMGpkf9uVJxJpjaRkEuUMpfyp08L9AK3sLVW0Q127GnW
	68MnmMSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjEm-00000006j8B-17JZ;
	Tue, 11 Nov 2025 07:56:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjEk-00000006j7i-0URH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 07:56:23 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB7k5er1582922
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 07:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9goTM/XMiiNX86aLJBJ8fJF1NxfmrSk55ouvKAkbHtc=; b=dGini1GHVtbvFhXN
	MA2eDCyeQ+fpiiBRaF6XXD4lSAnejs6QZlN4xGYbzweuC3TWIXE2ZADR8NchmrVe
	K2Cq4t7KmqkcAo4HMFXZL4zqo7oSVVbORLv/IGBPDkDjPulbMK43/BOSNk0bYlDl
	F+C4fNonshs42PPEWlnX3i1T+FVH9tiEH82gJbuo01+Gndn1uxDv5AKlLAx81Q+b
	I9XcvsRg94cyIqfT/afxLZ96ONeq5XVSwyVPQIWU1bEs09U6GyDLVCIAKk6gHbmB
	QLr0Ev4MrH5NGPxfvA0ZxI3eY3t1DYUY1oFaGqcNtlA64p9tiIRWhWrzw/k5T4Mg
	duVNwQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac11x00v5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 07:56:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297e66542afso72947605ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 23:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762847780; x=1763452580; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9goTM/XMiiNX86aLJBJ8fJF1NxfmrSk55ouvKAkbHtc=;
        b=OV1UvCbM3mfaRlpKNtqBvJisdIU9zjXfe15HuNycKWoPk/AspC5ECsZoxJ8fdkRkjs
         bMI18qstTGsk1d1XkwF4+P5kwm3lK8IXUXv67I7wBPbPW53XtvtE75E3lyNuS2ubpIK2
         5YrWMNY6Q6S5NmUsgXjkQbHSgmBeEaC+SvzxLvQKyN3AH6TWCc4kTQ4zgkFjmMRI9jJJ
         kxBB+3nYO28ZobaTe5gHSKiE1sN8FPoLRa7PLXL6flnGZ7ClAxk6jeAOIHFpLtTp1OJJ
         w42cZssI5lPEuyyzd6fAOxSgOq6KxTd5vYu5VT47NF2MYGSmI3UCAysT+9I+SYo/VQVt
         bslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762847780; x=1763452580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9goTM/XMiiNX86aLJBJ8fJF1NxfmrSk55ouvKAkbHtc=;
        b=BT3SAgQuIUdZWfxNsl/DI3HZ4G2VolTaeg1lU7ZPyub2TUPxtOuxz9J9jxV6r2XnwB
         iWC0zRgs+0QO3zBRXe/j4ixgKSsENIYM3d9iVibe0M0kl8kNIXGHIY8Vaj/JX3lNw6GC
         kQwx15+WLPTsPQUD/+3isNcsKhDROvFm+NWwduVX+bPc8DthGudQ7XgJ3VHbaGIlgxv9
         yyBdHlsybkJ0ct0jOyfCoKvB+Qu3F3by7gifO2TMuR18HUcEAY+IllVW8d0GmdNppIkx
         /3ekiKoMHhxqFgKEfRQ5lDPbb+piOPo0n58zu+980EU4Fz9o7zNzIrPBlgtpitTVhux/
         zfQg==
X-Forwarded-Encrypted: i=1; AJvYcCW8a+Iu33VLoLUV5fwR2KjfmnIDvfnbBImhThPWjI2mSm5LPBc8KoTaKvBlGB71t1zD2Ky1USaeKnKTK6BJhO2j@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/3GZROOeK0mdU696cuSvxe5P8bBiOIk+rprBkpEspXElWJmzT
	fkLtvHMsH/K1Awefr5uf3UTZQb9IR42PJJpoRP1f7KkdRMHWpslC0WKXibfkkR5ci7gZ/V412mO
	7ZRHSRClEmBDO/lG1XZjRHCg13vqfmWP1QAv9yC5m2goyHiwWj8CH/TGRvz8YKPVNiI+yxLV8Q6
	FykQ==
X-Gm-Gg: ASbGnctWdqmFvBBxTsKPGKNEWmyBULsKzgkXbDwYtuY319gQQa2sjf1JJ1EpdL1wwMX
	Owh53+yCSKiHAQsDcigVcxh5K59WID7K3zIihURxP4g4RCSUgciKvP1ttA3OF8ST7YnHhIPPR2H
	SRYLazpw6Bp7gn+Es5XkR4u5YipL7Qn244nAoGk8U20O5/orI6Xg0Hy04bJD/vuTy5/HPHEAHJ1
	nPA7l+2nObTjrgDX9gVK6GUYqiJegkC+TyLLsYrw9+InYXIm7vvk0o3xB65rDtmUVoDE/CyeDWq
	moLXnhDZPuUBtAiw/dEW1EbtO98BItSF3ePGOPHAP4gBgnUTjCv9hq7c0JU2iRW5bIcC8FuoudH
	A/fZPGvHGVT4SOMi3JRsm4R21zCc=
X-Received: by 2002:a17:902:f64f:b0:298:1156:acd5 with SMTP id d9443c01a7336-2981156ad51mr97475465ad.39.1762847779851;
        Mon, 10 Nov 2025 23:56:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6hrGKFsEODF67hPKuu/GXPSRhYuLLhxF+PyTk/xwREJ4g4uK32OyhVOg7l+TWL2LTnadutw==
X-Received: by 2002:a17:902:f64f:b0:298:1156:acd5 with SMTP id d9443c01a7336-2981156ad51mr97475195ad.39.1762847779368;
        Mon, 10 Nov 2025 23:56:19 -0800 (PST)
Received: from [10.219.56.14] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5c6b3sm169109865ad.24.2025.11.10.23.56.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 23:56:18 -0800 (PST)
Message-ID: <fbd49b9e-5198-4825-a601-cf2b446f1150@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 13:26:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu: add actlr settings for mdss and fastrpc
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        robin.clark@oss.qualcomm.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, dmitry.baryshkov@oss.qualcomm.com
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251105075307.1658329-1-charan.kalla@oss.qualcomm.com>
 <eb596f7a-e13b-4edd-8ee7-05424ea3d9e5@oss.qualcomm.com>
Content-Language: en-US
From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
In-Reply-To: <eb596f7a-e13b-4edd-8ee7-05424ea3d9e5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA2MSBTYWx0ZWRfX61NPxIwcdVzI
 B5r3TCYQV9zXw2h4OL0TUa6JK2H2+1e3WpJWS5VRGkOCi0+0oKplyD+tkuFfCaNCG1eA61mPpS0
 akr2iNaOikkoVISdjqyVhfkGOwVv3wkH/f124AgHKNi+AVmmCY9pDVlvE7TZ9qb2ZcZ6mRdNUeX
 EGyV/h3NwPd/0znOB2IAhzOQ1tDAzg3TRz1GvAjL8QiTuC8u1rZfv9rS7fZ5Tq7/qfvyTEHjuzC
 8aRE7NYFdYVUzYB696t8MTMwTr6bd5jnYfoa2ozW/oyj2h+4HACFCXSmt0UOMQOYZbENAndxGDG
 jKtdxwfOP63f+oOOubDcjs+dK7XkSSmc+4bskYD7A2M5WfW9DsiL2HnwscZZpPygFTbkZdS31JU
 BVXip07NMIgLauEq3jtA41G7t+Bjhg==
X-Proofpoint-ORIG-GUID: swqDnUFlLvokZBAG5nJwwP-1KCO71xpR
X-Authority-Analysis: v=2.4 cv=L94QguT8 c=1 sm=1 tr=0 ts=6912ec24 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=K3xFcsKITfcsgejFPk0A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: swqDnUFlLvokZBAG5nJwwP-1KCO71xpR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_235622_167115_322E1C42 
X-CRM114-Status: GOOD (  18.60  )
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



On 11/5/2025 2:44 PM, Konrad Dybcio wrote:
>> Add ACTLR settings for the device nodes with below compatibility
>> and is mainly targeted for sa8775p:
> The commit subject should mention it's the lemans MDSS specifically
>> 1) sa8775p-mdss
>> 2) qcom,fastrpc-compute-cb
>>
>> As a side note, "qcom,fastrpc" compatibility is already defined but that
>> seems inept as the devices that will be attached to the SMMU is going to
>> be with "qcom,fastrpc-compute-cb" compat string.
> If you say it's a NOP after all, please split the fastrpc change into
> a separate commit explaining the issue and removing the wrong entry
> 
>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>> ---
>>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index c21a401c71eb..c76f6076f487 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -47,6 +47,10 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
>>  			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>>  	{ .compatible = "qcom,sm8550-mdss",
>>  			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>> +	{ .compatible = "qcom,sa8775p-mdss",
>> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> This list should be sorted alphanumerically
> 
>> +	{ .compatible = "qcom,fastrpc-compute-cb",
>> +			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> This will be globally applied to all smmu-v2 targets with fastrpc,
> starting from MSM8996 ending at Kaanapali and everything inbetween
> 
> Are these settings always valid?
Let me separate out patches for mdss and w/ more details for fastrpc.

Thanks,
Charan


