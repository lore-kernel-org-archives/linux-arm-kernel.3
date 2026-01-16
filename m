Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3803D4A604
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 06:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=571F6lMjkVoO1c608L9nLhKKPVlPXL7EwfrpN3qqPW4=; b=zL3L6mgFRwBOINUxP01T25ZYPI
	iN00YiJZ4mYOcrnfF2L6Au+P7LuacsYOioKSOtwNkGM7KwtMY1j0hgyJjsUtYACYMOkqte7WI7zzy
	4TSCLteLK3dDrFlZVUk2bfDniVIcVT7Mo5BhXgisJ/ianfXbgoeceKeIR9HRtB1rw7s2Mzi+8/0Yn
	klGUfcZ9N/Zju4jFmuFT53iqD1VL3+wgtU66BmxH/BCWTN+ISc7ZGRsIyjVsyxF7KGrm34awpn1GO
	l20ooOyS9GlQqlqNjBU1p/EH2hEBWfEQrR0w+wdAmaGZ9tPk4MI5BUAIawxOXVNS5zHcQQXpEpIPp
	CXeh1X2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgdNp-0000000DfPv-4BYy;
	Fri, 16 Jan 2026 06:32:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgdNn-0000000DfPa-1WNA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 06:32:32 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMd2Wo4101603
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 06:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	571F6lMjkVoO1c608L9nLhKKPVlPXL7EwfrpN3qqPW4=; b=mAcXNIM4TYrQU45C
	OLpMWgIAf3OjjcC3eqWuyAFpjace0Qm3u69I/YKSPBn1485Af88S7xqY4VUn4+ot
	drghon3/sMW0zvgNiGoPPDPeEh7Yoh+tuE2hzxUXJwcbL916ilxGS57mdPhgmBk2
	fijzSmeoL2EA9L1oqcEUl3uiGMRAoTCn5oEiXoi78rn9/z0Bsc3myUOSA7uLIVSO
	/+K62mgF2DZs6RpAnoQEO35n/oxVrZiTxsJS2htMQsICcglYiM+zZqVlu5IytL5i
	PP7hP7xsu00kVom/GmPvDhudCiCo3LIVxH+jCYfkGi5gy6hwXf1fK323UqKv895x
	47cRdQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq97512ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 06:32:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0dabc192eso17846465ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 22:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768545150; x=1769149950; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=571F6lMjkVoO1c608L9nLhKKPVlPXL7EwfrpN3qqPW4=;
        b=EEXCzgY/ifnE8zn3phfE7LVG34RZTsjKnD69XSh+BrWn2WC4Wk7ULFChfn54hbL9K1
         EMzMLzICgJ6KCAshqT6axOtcS7W2kj/I0Gh+hD1C+Rpxsaqahlghmjis2a0TQVruHPQn
         RKV7dptnlZAiD+IpI/1rjZsW47zDKOw+DjPYs5+pEzCJgjcG4iiUTWMTDjg93letCDay
         P84JwjCyA6223iC5nlkvM+Vtc4oQuG4aYWZ8WyUXHiEq4odOmsjMYR1oY80SySNrNl+R
         CGJl+6hfaXwX1irf0WSbUAUJHteQaNSdcZPCPriRIbpCIyR83Qhx05I87PM2zZdls8kq
         DuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768545150; x=1769149950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=571F6lMjkVoO1c608L9nLhKKPVlPXL7EwfrpN3qqPW4=;
        b=dEupQ5EikxJ12ClKPu8mvuRl7uduhCFgud/BOeqBHCerbgpw4oj7AWIe5N138RCMoJ
         eXVpma0K0sXLbF7ACtcSa/RwPCl4xrPoEi4IKubKkzory2iGtMD5ptoBOkh7jO9yf39g
         8BGvgMxGQFxzTPhBHK2Ia5bJlm3+ctEvDRrrruRhGClKr3Vc+W3iRXngPKfcvEKZYoWc
         r8UiPYtobx9hdNUSDJ+Xhz+IR4bUOV91n79Tk4ULwFrfcCu9TmbOmQWusyMxd5NYNvsa
         paDH7p5iCN6YBtqLF4QsmBdKmd9qpIeD8ASLDBXGyJRWMjJkjdMuvAPSGxt5bRx9cL35
         JDqA==
X-Forwarded-Encrypted: i=1; AJvYcCUlzl76beBodJk/gkRLVRRyUgUdJ3ioP3Rx1Gap1bhSU6n7r9fEM9ll4aTeb3RFI8KOOueBIwYVrEHU18pFdP65@lists.infradead.org
X-Gm-Message-State: AOJu0YyCZ8xvo5yqs8en74ga+q+GlOKhJU6Ri13+Bo0Xwx7Ok2c/RVqx
	farV/9LOVBptcZc3KaPkB+a1E8XD1Jcf/tbZ0kF1eWDwjTuwllbprEhQhgMYVGD10/6mykeoBQB
	SUKDf5+hk8Elk2ZukPwMU2oVTwlBrYPBcgdOTXeSHpTnRQKRELPuqyYxXYSyEfWRGtzI3suxCLt
	ck3g==
X-Gm-Gg: AY/fxX603OoLCUxqkyJyZx819c27/WXL1DyNPluF4dL+8o8WtuOzmo89ixIY0Yhm2dX
	CMrpSrSJ4aCDUfeTG4m1IctlTPExnoPFA3UEXN7BS4FDjZzl1Wp7iq0nxG4qYjd1W387Cec6/0D
	N7BvhQFXoA8j01aWlUfK5MHYAMEHeqbXBa4K1K3A5G8E4+rAmCAAYFev9miODW0Wj4x8ksvM/gS
	djSNvNsvxGPSZlZhaChqNFbfT/cxOiiKgkMMRpcVrRm68jyzVvRoaojV3yOT2nRsCmh38uUeYW3
	VW4n/RvC/fedSxpQOZ0H3IJATMf5dKwRnLdfKsyXbypJUdy9ONfYVDaN1XibSV+uU1+h8c+QzJx
	sLfE1+b3t2oKfvYtdoIl+LGbIvoS5G9N+Aspo
X-Received: by 2002:a17:902:d48c:b0:2a0:e223:f6e6 with SMTP id d9443c01a7336-2a718949652mr14797045ad.46.1768545149679;
        Thu, 15 Jan 2026 22:32:29 -0800 (PST)
X-Received: by 2002:a17:902:d48c:b0:2a0:e223:f6e6 with SMTP id d9443c01a7336-2a718949652mr14796875ad.46.1768545149243;
        Thu, 15 Jan 2026 22:32:29 -0800 (PST)
Received: from [10.219.57.14] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ab959sm10752865ad.20.2026.01.15.22.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 22:32:28 -0800 (PST)
Message-ID: <70e88549-5448-4a06-a20f-ad4395eb7350@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 12:02:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Restore ACTLR settings for MDSS on
 sa8775p
To: will@kernel.org
Cc: catalin.marinas@arm.com, charan.kalla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, iommu@lists.linux.dev,
        joro@8bytes.org, kernel-team@android.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robin.clark@oss.qualcomm.com, robin.murphy@arm.com
References: <aWDsFoEe7PHQaL9F@willie-the-truck>
 <20260109204551.845959-1-bibek.patro@oss.qualcomm.com>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <20260109204551.845959-1-bibek.patro@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1MSBTYWx0ZWRfXyS25GbK4MmW9
 Ow1KVH+iT2vlUh+Yntio+72IYhWaQFmsxhdHgHDIomw/U2UL4ulzvtbQjvf3zCalRimmNS7LFlU
 a/986Ha4htsVR8vATyaCc9ai5nVg8uQ2xAnLq3134kF6o9jq3yczxarIS59vYHzRtx+oYF3Zosp
 512Rapaot8HgCzrzp7/24wyrSa8xzluxd7P7ZYsYM39NvCtjZYCfa9ZLVk1Xo5S2AX8O3znm1Vv
 Nf1DqtL/0TUzMriF0oFikYfqyQjBZfXcxRRDS66hW7OeOJxeK3K58GxuCsyXlIZKaa0nFfFu7B/
 R2JOhElkhBMjRr3Zpax2yJ0/1LUC/QSdL8Hf+ccUdM0lUAX0sg+/3n+I5ep3v+uodgeBtTXZPYD
 gtQpJmjCKAMyP5G/reny5Jl6+aPCvLTkCPX1EwV0UJrGg6bypCzQsX+uzR6jE+LS/zfYVCKfhg8
 yztonKI2l05G53eyiiQ==
X-Authority-Analysis: v=2.4 cv=Sv6dKfO0 c=1 sm=1 tr=0 ts=6969db7e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=x8gyvrLTtEN-rIJzB5wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 8NwKEF3bo9N8Uiy7UIchjW7WjATy4QKk
X-Proofpoint-ORIG-GUID: 8NwKEF3bo9N8Uiy7UIchjW7WjATy4QKk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_223231_407029_E95EBA72 
X-CRM114-Status: GOOD (  19.62  )
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

Hi Will,

Thanks for the clarification in [1].
I’ve sent the follow‑up patch on top, including the explanation in the 
commit message as suggested.
Please lmk if any further adjustment is needed.

https://lore.kernel.org/all/aWDsFoEe7PHQaL9F@willie-the-truck/

Thanks & Regards,
Bibek

On 1/10/2026 2:15 AM, bibek.patro@oss.qualcomm.com wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> The ACTLR configuration for the sa8775p MDSS client was inadvertently
> dropped while reworking the commit f91879fdf70b ("iommu/arm-smmu-qcom:
> Add actlr settings for mdss on Qualcomm platforms"). Without this
> entry, the sa8775p MDSS block does not receive the intended default
> ACTLR configuration.
> 
> Restore the missing compatible entry so that the platform receives the
> expected behavior.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 456d5146831e..718d102356d9 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -43,6 +43,8 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
>   			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>   	{ .compatible = "qcom,qcm2290-mdss",
>   			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> +	{ .compatible = "qcom,sa8775p-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>   	{ .compatible = "qcom,sc7280-mdss",
>   			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>   	{ .compatible = "qcom,sc7280-venus",
> --
> 2.34.1
> 


