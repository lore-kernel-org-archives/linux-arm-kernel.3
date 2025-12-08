Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C84D3B7E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 19:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8yjmOYzXN+OctMZKMBsFTo1QqywLTcddJM6KrHURgSQ=; b=NMBQ5xMd6flO35ie2Xz5Wn2hd9
	0kt99eiWwyXpzxtl957gEUvRexK0mdjE6t1tbwzgCBHBccgRadJDQlb5WxnkBmPYFMaIGimT03hSq
	4Zi1FgJaUCx8s+ixB59ooh2eGqJQ0irphpgw8TQEB0Es26e/VYh/+nIG52nsTjkzU5Dn15JoRREHl
	bRdALoaE60F0IXlhjb7sWNUXpvZ8+0bKPnlhXzs3xzdwqe9IfBtXO9/Mu9qjpbD/Y9/nvEmydQqdl
	bEro4uA7aWpMzu1c+6YPGe8Jx2+9fzzmZAHW517fZrVMc0VdAcigiN6tNYjEVZe69r51jxCRj/srC
	zPMUxuHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSgun-0000000DT8o-1uMN;
	Mon, 08 Dec 2025 19:28:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSguj-0000000DT7u-0Rw8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 19:28:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8B49pb1130466
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Dec 2025 19:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8yjmOYzXN+OctMZKMBsFTo1QqywLTcddJM6KrHURgSQ=; b=LvSBS+OYd+2eregL
	O0PXOxOfNBD1FHgof/+gg1nBzVqqG6ydlVohK3Wggpd/klUdsMhpbVe8yGfKjcio
	QUa6v6/8hzB1/vAU5KP4850ZHQe3smd7FDJHjiwQdpL18WwbyydMak0RMUt2Keml
	JBLwUtzKxXHF5j/8xRiSaHPUWe9VQ80GkwANv0aS/01MmxN1E84aklIB621bea5e
	PG+fCNCF8jNe6R5cpWQTIeNLSHFzqj2Lmd8yEC8YwNTwReCCMcKOj+q+YD4ZogwN
	pR5nwa08x2xaQPOVaO87zo769f6/UG1/1f5vbeNxvimfVnNuabop95FE4EF1vV7P
	v2hPtA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awwfr9g1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 19:28:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b9208e1976so8648326b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 11:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765222130; x=1765826930; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8yjmOYzXN+OctMZKMBsFTo1QqywLTcddJM6KrHURgSQ=;
        b=gtBgjIXIeqlggzCCErcEA4eISj7WflT+vq9ADIElqEHTqsZZD2vWHPMHSXlau0NFiO
         1iZ6zqtUvtLKKuu+C7/SwLpQGulypu3S4Ui2EIHd5msl/o0425S8zvhEHrnrLnyqB3Vo
         dvrZtIH8Q9ykEaN8rEuQEBDw2Zccm9d0S+9yuTPQHYFZ6mD8xvU10l+mkMirjb3sNi/7
         VGLt/LmGKBD3wet6levOOIZzIaVHwhxKha5ih+8TzEiHB7PufdLoG/4V2TAaIMWKF6XS
         Y8F/HqCVOffu7RJIezZIdBIjQ6eBAdltMnW5wxYxz21R+CePRbjKyWztqIxLSOBd8gKA
         JIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765222130; x=1765826930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8yjmOYzXN+OctMZKMBsFTo1QqywLTcddJM6KrHURgSQ=;
        b=YmerJ2nDwoGYGeZfC7s3/acGyqd7TLGTZ8OqJa81qHFoMYP9s7rGGWykWxzLIrjMYr
         q6+K8WLvVS9Sekrzy0r05ID+UIG32qMf7XxoApW/wsG42uX3N6L9Kh5Oi/LUYaVAu3zq
         bdXe2dahBoLqQnoopYlfmGhpbw111a/3UvRvsrvxtovyzd8EWyYCrZFoZgdQulbASM4L
         hjSe9qaBIs8u6g/tzyryiYlB450ivY1a5sAgnac4DHs9tEV6S+gSQfjHuONhe98msYFk
         aR61XYZCC8QBoQaizIGJhCQCmeSh1emNYajcFKar4wYXDvk5sj5+1hsgSAbuvCgEAg1M
         uRBw==
X-Forwarded-Encrypted: i=1; AJvYcCVheX/lVKTZ9QQMQXLmtWTGrNnigmu3KmxDpJ3PuZme6IOrEW19MV5AjYPXJzCanUTx8hFpSWzkEFJ5JRRaF7Sf@lists.infradead.org
X-Gm-Message-State: AOJu0YxkI5keNw+C0V0got0Bpelua3eZNc99p//PmKxNSLDTTpkRbzfX
	HaPPpMo7OEPO7bdEKkScrfidf46mySr3PgK7oCqJCa9OP88Cffz26QPVxFCID669Q1nh9fby9tO
	hR2w7MZtl2oQSjDcW9LnQnOKuwgnFk0e/QSdHe4KNNtOoKqzQ0smxzOrjaDchsOfiX2IBsMvvUG
	0Phg==
X-Gm-Gg: ASbGncscZdXDeczV7DwtPxx1HQN+xN8uZklcO74IjpJpKzG1Fi+V/aE4l+ejbyEvvXF
	MDmd04mM2YH56apKDyOw+f5vdvgO4ay/O+jSCVbvHcU5UESNKa6vGK3dzOiVMCr5vCLGaKMQ50L
	yhlTQ/qLtt+PezDK+r88z25g6Tj4hIFcsvguAfXaka60OZ7AMSAU7+F/y5qHN/HVvaLD1a6Jlp/
	se2wZ/deo9oa+N7pbBAA38/sdm0fCZys5sRsDerRxiJkUqq0cQQMBx1tl8B9/iscl6kzBNDvIBZ
	IJOcxTgwDxlu6lagCESnBVj2HltwGnHKxaUF2Hu4HjZht++C88cRGMPjKos5Dl7weQkuq/IQI4/
	JhNlSV7Bw2UbqNJryje2I3WR0N48fpGLoxrp7PA==
X-Received: by 2002:a05:6a00:23d2:b0:7e8:4398:b364 with SMTP id d2e1a72fcca58-7e8c580c004mr6248306b3a.55.1765222130197;
        Mon, 08 Dec 2025 11:28:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgn8R1nKUS0tnoxZy4qldCHnZ4XqbLpBA9yEzu93LuDAdycaH4O4tgmsv1jTQ8CYb1UTfXdg==
X-Received: by 2002:a05:6a00:23d2:b0:7e8:4398:b364 with SMTP id d2e1a72fcca58-7e8c580c004mr6248289b3a.55.1765222129672;
        Mon, 08 Dec 2025 11:28:49 -0800 (PST)
Received: from [192.168.0.7] ([49.205.254.144])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2adc5c17esm13814703b3a.34.2025.12.08.11.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 11:28:49 -0800 (PST)
Message-ID: <0bcd5a92-5213-4862-9a31-8ea539b1b72c@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 00:58:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4] iommu/arm-smmu: add actlr settings for mdss on
 Qualcomm platforms
To: Bjorn Andersson <andersson@kernel.org>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, will@kernel.org,
        robin.murphy@arm.com, joro@8bytes.org, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20251202125447.2102658-1-charan.kalla@oss.qualcomm.com>
 <gsjyj3arwoqcjln6nlmyhohlowyvkwqmxppdq5y7c3m4khoyq3@npzixjpibh5g>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <gsjyj3arwoqcjln6nlmyhohlowyvkwqmxppdq5y7c3m4khoyq3@npzixjpibh5g>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDE2NSBTYWx0ZWRfXwQX6h08Vmx/S
 L7OvWAbpuFc9827zlNqgVYwSo5nTVoNkzFaOzckacz5BJhPEs31cmbNKeOqqpA0prlb6l9PRzEE
 LzOKQFu0eSfCt6AnAxm/9HUOyvB/ft4syDO9dw8y/+Sr1AN4NdbT3E/vVvqP6rp3RAsB3wr8Fvi
 DpViU8j7eh0d/vkpTXcggil1uixDNcCZuQzESacX+il7UzcTNiovHB22yw7plcck2AKAdUPcrF7
 4Ry8+CKMHyCZ7YXF6DDagWoT/jVr+3aUjuWBqg1ZL2ZfQSXv5c2DFiCzSltjpGrT6zcVMHS9am8
 fZt6EUCkV21S3HA/uIM8ySBewIc+WG1f/wOxIK6SnMdDg5PY6Vu6zQ61sK+b3Hd01YbfuIieruN
 9FQadDS/LoptkACumzfipLKvjoehUw==
X-Proofpoint-ORIG-GUID: PpzFSd086M7CCPhgJzJy8dD1KZ44JP0H
X-Proofpoint-GUID: PpzFSd086M7CCPhgJzJy8dD1KZ44JP0H
X-Authority-Analysis: v=2.4 cv=fsXRpV4f c=1 sm=1 tr=0 ts=693726f3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=21F0Ij6J+em9RIwR2lrOkw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=SVaDBRFF2uN27j_ulVgA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_112854_970264_08127A82 
X-CRM114-Status: GOOD (  21.72  )
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



On 12/6/2025 2:36 AM, Bjorn Andersson wrote:
> On Tue, Dec 02, 2025 at 06:24:47PM +0530, Charan Teja Kalla wrote:
> 
> Based on the other changes to this file, the subject prefix should be
> "iommu/arm-smmu-qcom:"
> 

Sure Bjorn, I will address this in v4 RESEND and collect all reviewed-by
tags.
Let me know if you feel this change needs a revision update to v5
instead of v4-RESEND.

Thanks & regards,
Bibek

> Regards,
> Bjorn
> 
>> Add ACTLR settings for missing MDSS devices on Qualcomm platforms.
>>
>> These are QoS settings and are specific to per SoC thus different
>> settings, eg: some have shallow prefetch while others have no
>> prefetch.
>>
>> Aswell, this prefetch feature is not implemented for all the
>> platforms, capturing to those are implemented to the best of my
>> knowledge.
>>
>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>> ---
>> Changes from V3:
>>   1) Add actlr setting for missing sc8180x & sm6115.
>>   2) Improved commit message.
>> https://lore.kernel.org/all/20251124171030.323989-1-charan.kalla@oss.qualcomm.com/
>>
>> Changes from V2:
>>   1) Add actlr settings for all the mdss devices on Qualcomm platforms.
>>   2) Improved the commit message that explain why different ACTLR
>>      settings
>> https://lore.kernel.org/lkml/20251118171822.3539062-1-charan.kalla@oss.qualcomm.com/#t
>>
>> Changes from V1:
>>    1) Added actlr setting only for MDSS and dropped for fastrpc. --
>> konrad
>>    2) ACTLR table is updated per alphanumeric order -- konrad
>>    https://lore.kernel.org/all/20251105075307.1658329-1-charan.kalla@oss.qualcomm.com/
>>
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 26 ++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index c21a401c71eb..149da53091de 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -41,12 +41,38 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
>>   			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>>   	{ .compatible = "qcom,fastrpc",
>>   			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>> +	{ .compatible = "qcom,qcm2290-mdss",
>> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>>   	{ .compatible = "qcom,sc7280-mdss",
>>   			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>>   	{ .compatible = "qcom,sc7280-venus",
>>   			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>> +	{ .compatible = "qcom,sc8180x-mdss",
>> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>> +	{ .compatible = "qcom,sc8280xp-mdss",
>> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>> +	{ .compatible = "qcom,sm6115-mdss",
>> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>> +	{ .compatible = "qcom,sm6125-mdss",
>> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>> +	{ .compatible = "qcom,sm6350-mdss",
>> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>> +	{ .compatible = "qcom,sm8150-mdss",
>> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>> +	{ .compatible = "qcom,sm8250-mdss",
>> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>> +	{ .compatible = "qcom,sm8350-mdss",
>> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>> +	{ .compatible = "qcom,sm8450-mdss",
>> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>>   	{ .compatible = "qcom,sm8550-mdss",
>>   			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>> +	{ .compatible = "qcom,sm8650-mdss",
>> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>> +	{ .compatible = "qcom,sm8750-mdss",
>> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>> +	{ .compatible = "qcom,x1e80100-mdss",
>> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>>   	{ }
>>   };
>>   
>> -- 
>> 2.34.1
>>
>>


