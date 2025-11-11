Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677E7CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 14:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJWfgwNrtdyvBnMHITe3KIM5EMQeUThouMLka/eC6JE=; b=EVZQpkzkUfi24KOytn0HxGY+XZ
	HYqCURGMpByJz56zyvRGp3W6rIcKOlX3ocVjuyQAPdbCT/+yRCUbH66UNMujaVq0Jve3q3edEUBiN
	VVgSKkrwzAHxAIPoUSBwDu949154+N+21E47SbQ4fH/R4iRO/H5AU1XdCCGBE5rKHtAJFQP+dijNh
	v4Yf5TnDaSBnhqPtGGgbNRxwB7awqscjK5k1xuLbSHasp9cAUoBhmSF9CRcO6nDS1aUnxmKA4W2wY
	o09TyLVYRRAvI9nRH6lTZ3lbCUrefy4bevixn0CF9/1ws6A7wdvF0D0USsGf3+36IsKkgZJKmHZEi
	oGkzrwiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIoxG-00000007HYj-02xr;
	Tue, 11 Nov 2025 14:02:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIoxD-00000007HYK-36GQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 14:02:41 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGVgk2129947
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 14:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AJWfgwNrtdyvBnMHITe3KIM5EMQeUThouMLka/eC6JE=; b=Hf+dU4YRLIcNKlJ2
	gsE2oqcvGqftfY55dYlz2tvEImqUMg+zak1iZQw0gFeTs24slS4jAFe6jb8f8+s3
	G/bJSaTa8zUmXad5g3x02ijwM289tY6YlMfeaalZxvaNKGl5P4BpkkPOZ7VJtzMs
	itGgCaNkaiHDoIrhUakom2LYrr/timiYMyFOOcvpgbt14f+xBXvlTkD6M4Jn4zyL
	a0+7M+Qs5gFTZLTR4x7omxmi6jhI/j6dWkLerdIpheuOA4yMwSZtqUSqEpYJufR0
	ckkMop/c7WlX09PYtktzACIcslNqrIZEk7hrsbIsryTI6WvIxtWBYAt6x099Zx2n
	Se3/0w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abvhthtv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 14:02:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2958c80fcabso114168195ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 06:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762869758; x=1763474558; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AJWfgwNrtdyvBnMHITe3KIM5EMQeUThouMLka/eC6JE=;
        b=ZJwCC8SLjzYxiOHe8nlA8bJAO6dqVh4z3aC6ck6XWXbH+9cfx3cG6GRuCnubd5bVTA
         ap6um8fMs7EDgqp+BRQnElL8SuJLYg+OdPYltCqQUQcUtMIGfTITAxdr8gQ/8IqsAQZ7
         O21kgd/okFv4Svvm1GO2R8tJc1hIoDqbuV1G33ZyWkxuEIZqtsl3RSyrH8cgKiAfPeGN
         oko/hLEG6SvYZgLMzvxuuZebesrMtb5RaklhpdKqqVhZ7M9sXMv/rktnl3oqPEYYcs4y
         +uveGKYn7FzuUQIm5AMs6c0dAOaD76F5xJPliKeqOBsJ689Dv75IUY1OHkvuaJb+jaq3
         80Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762869759; x=1763474559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AJWfgwNrtdyvBnMHITe3KIM5EMQeUThouMLka/eC6JE=;
        b=uNkvZab2JcNByqR3ne5xsJfCVjKoE2UD0cVnOIqpgdWYwN68r3i0rJraFeqEVUhyxd
         EHFzn1gAwErDd+Hc9GswmPsX6qDOfGbbF1qbeBobL+8TwwFYH1xTTQcv0+c3SAeH86Zf
         6hoz/K12SjtT/4OXpAc+bJpMOV6zPmC059wTtDMquHurnqDkZ6rV3hGOfZ407D/GKI5n
         KhaERk0VgZ36K+EIXm1tuHNtcXl15wX7yI7Zdn2eCzAZ24S61zlpPISpGc4JWOwo5k6O
         YvQNQap9Z/KZQ//Y8mYa29kK0i3/E7y+t5qpkSdbJpIZWurZqjTi12+wKvSiRB4kpZha
         /XBg==
X-Forwarded-Encrypted: i=1; AJvYcCU63OyFFgOQWSxC83UxFyqpiS8VefkhxkkxMYjmkjwjBrtXnTdH19OjU9XC9B5VMbs5HgUn9oNsb5GcZ95Z/46J@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8fAsuWJnXv600VYkHo9K2dJV4k4I9H2JOD0AYwzxePczgN+5C
	DT9shNIJ0JsJQKA4GMTiezz7T/xRrav94zC3D08oZs8g/mtPueqS1hBa/UpjYcIE7+39IiiPmjp
	t0wSL/2brWe6xxVnLmXBGmGgaljfvg731hBrBRxFE8ylVdOBZ6+vWiH3b7HoIcyzfqJXR1dWHNK
	fxTA==
X-Gm-Gg: ASbGncsfItn6oz2aN4By6qwkowDT+8gTshqv4pYH55suepjND13w6hR8ibs94daGZwo
	DOE0r9Qknbvcl7tTQ+Lab7StYZB9Ns8gBry1PFGQtetPTV2MninpxMZ+7pibBFyHkQhUEuRhms7
	NdLX5VcF0cdsc5BUFg/kn4txaESnWrrP80jK26v6NhqNe5P4l/LPEeE+CUS+p6D/jaCxwWExD9s
	ehrv+Mu9Je1x7n1ZbiVOt/1JRUS4OZU2D5I/ebPfDpfiHGhgImfRxfsZyW38e5QkFTLen90biqb
	9sdmrGzmj/28R94sK9kTptaoSZfF1Y3RcChLq6ERIOrbvJV+sR4PJjk83SJR0BH4MsASq8dxhVC
	tVAEks2XlupjW9mnKDiwuRqViPTg=
X-Received: by 2002:a17:903:2f8e:b0:296:4d61:6cdb with SMTP id d9443c01a7336-297e5655113mr148629075ad.27.1762869758182;
        Tue, 11 Nov 2025 06:02:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiZPxmew9Sypb7WTasJeWopHkpr+MEmcvloHkOX1op3HrOtm8qCTT3mhOislac4qaeDoTYnQ==
X-Received: by 2002:a17:903:2f8e:b0:296:4d61:6cdb with SMTP id d9443c01a7336-297e5655113mr148628355ad.27.1762869757396;
        Tue, 11 Nov 2025 06:02:37 -0800 (PST)
Received: from [10.219.56.14] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9ff848bsm15461660b3a.29.2025.11.11.06.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 06:02:36 -0800 (PST)
Message-ID: <c4b1df46-e4b6-4d95-971c-7aaf33bd35f1@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 19:32:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu: add actlr settings for mdss and fastrpc
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        robin.clark@oss.qualcomm.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, dmitry.baryshkov@oss.qualcomm.com
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        bibek.patro@oss.qualcomm.com
References: <20251105075307.1658329-1-charan.kalla@oss.qualcomm.com>
 <eb596f7a-e13b-4edd-8ee7-05424ea3d9e5@oss.qualcomm.com>
Content-Language: en-US
From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
In-Reply-To: <eb596f7a-e13b-4edd-8ee7-05424ea3d9e5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VuVUiuLseFG8lFr_8cREwQG2TSuZT7gx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDExMyBTYWx0ZWRfXx3AERqkJVjef
 /tE1eBlVpjucZFcwa1mClQIryAyn2/fLkbX8nkb3VQecvvXBRbVs+VeXFOccOWdfAEL2FQXc1uF
 Bf6aH83JX2SeS4UnU+ev3pssEN3dJcqwuZoj3Y+HP6bnInswWP00Y9OV0Mkv2tyrj3jGv9kd9FV
 Sshq3Z0YQPdGD378cBjgoxeZz+LtO1MuUcWpG7cLpnm2cIlYZbdhvhVh1CL0Yjsfcc6hnwu+ECP
 ux9zXAk7P6hoPVV+tWPg0pCUbO/x0Kj+xurQt+rZi3iVslQohQaK3agCb5Cd2B0B1wYsNRIG3/M
 weqUZokMwnQzcnrWWAYFf1obi5759baVYil+eN3v8EeKEJE4grvoT/MgBUWsw3PqVjS1oBtWS9Y
 fL9OAeqWCIU/SJ8Tv+AxJ6H/hTUQgg==
X-Proofpoint-ORIG-GUID: VuVUiuLseFG8lFr_8cREwQG2TSuZT7gx
X-Authority-Analysis: v=2.4 cv=d4b4CBjE c=1 sm=1 tr=0 ts=691341ff cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=K3xFcsKITfcsgejFPk0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_060239_786279_50C0D91B 
X-CRM114-Status: GOOD (  15.19  )
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
>> +	{ .compatible = "qcom,fastrpc-compute-cb",
>> +			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> This will be globally applied to all smmu-v2 targets with fastrpc,
> starting from MSM8996 ending at Kaanapali and everything inbetween
> 
> Are these settings always valid?
Oops, you are correct...this settings are not always applicable it seems.

Example: lpass compute and cdsp compute node uses the
"qcom,fastrpc-compute-cb", but it is for the later that ACTLR settings
are valid.

Then for these cases, should we be extending the actlr match array with
additional compatible string and then add them in all the device nodes
that require actlr setting? example:

@@ -3119,7 +3119,8 @@ fastrpc {
      compute-cb@1 {
-         compatible = "qcom,fastrpc-compute-cb";
+         compatible = "qcom,fastrpc-compute-cb",
+                      "qcom,fastrpc-compute-cb-actlr";


--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -49,7 +49,7 @@ static const struct of_device_id
qcom_smmu_actlr_client_of_match[] = {
+       { .compatible = "qcom,fastrpc-compute-cb-actlr",
                        .data = (const void *) (PREFETCH_DEEP | CPRE |
CMTLB) },
        { }


or any other better way, please lmk.

Thanks,
Charan



