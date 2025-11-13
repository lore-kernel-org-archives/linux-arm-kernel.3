Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C9FCD5BC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 10:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jgBPaO5vYeetCNzgFhvdCRkSv11ZkxPO6+3HoWQmMsc=; b=OZYewfrspB6ok55Pty61OZ91ax
	ZRlhPt49qPXL0ZFawVFJTGR5i0zlIwHnxH6mEQYpvuD+g+5QEiXV/OUvEDUhIkaaMuR8ptTjW/zL4
	0V5pU7jWroqj8YVTceOU6yZ4m/Z7+XncMyOaM9A7KZ5tgYiDxGoKXRmZAgxc9/GzJIaVtPUITHpv5
	veuhdeqP5/eLmqqgsKI74jw/ERkoWP+1KxPlIGEJQdKtUzFrCZGZMp5ljvJyDdAMBOPoFzK6ntosE
	iwePsGRIvbkYH/ZNfp9/71DAmseAluvC6vAgc/AwdbqLnSThgFbvIK8Ip8G8+fnyXAJg1CGNPz5K6
	A4nR6auQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJV2T-0000000ALbt-28gH;
	Thu, 13 Nov 2025 10:58:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJV2Q-0000000ALb5-2LQb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 10:58:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD661XU3564153
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 10:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jgBPaO5vYeetCNzgFhvdCRkSv11ZkxPO6+3HoWQmMsc=; b=OX9cuSGue2w3yOTX
	RFu0kR0LgWyxuJjvGc9Ya8ZqJu/ZqNoTzEstbau0fpspsTIz7A2U4jGS61BnCtCN
	mEYsktpis3zl9MYBs77wYRrjIyaC6W/8QJD/51E2bNPgb9Iv+K1g1izUJi8I1Lpg
	HzZQaqYNNmysuiKoJAVqbDA8E7jho/Fi4LdG4c89xIA1kf0v7crDJl6pP0iO629q
	pCVL8VYZ0TBBAGpqHTB7GkTLgRmc0Cw1zBzr09i2kVJT8wlPD8Di08D6tanVIyft
	ejsV1xCAzPbKU9jkEpynvoDWKlIQTmNxWfm7ecuemCUk1P0cYWFz2BAx8zsxDbbs
	Ce82oA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9rvgvrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 10:58:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edaeb11630so1572321cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 02:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763031529; x=1763636329; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jgBPaO5vYeetCNzgFhvdCRkSv11ZkxPO6+3HoWQmMsc=;
        b=bNP/kFxxxsJI5oYP7zttHPnnKnYgm0j5kNrqMcpfEYTZ2+AhoK5m/mCRkNQZl9H09q
         5dVlkeOCgG+rybydsq5UG0PPA0q3M0w3nRao8yiSqmYKsHLycMIbthNJgmMDH+TjZxg7
         zKdkpRrDjmkrzXT93Rd7OdUzuq6CHNxl7OMCwvMqszm4iGzRBI+qodhDWFZBVAonUefG
         O1X9nf7+7Ecvlk6tO3EYoE8pI57sOw4XecO+bz3xNJDLgdAr3dzwQ64dnmcZtcx4ye58
         Fm+3lwaYQTg9kily+6MK5LOm4oZ0IxGvP8quHq+b7wrGq04Jk/UbtkzzU/3VpWNRHGyb
         II6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763031529; x=1763636329;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgBPaO5vYeetCNzgFhvdCRkSv11ZkxPO6+3HoWQmMsc=;
        b=wBFt3lTJ550zlpodYrUxHwXB7SQhR2TQBQlh2NkcWeWfm8vTdfbkb949btJvjFAXs+
         OQKffNWU5x9n0Fresy7BhkxeZIQQeLri0cRSv8oID1kEhjYqktf1LqFVdGEjspSuBGWd
         oBRohoFqbobJpCWPhwoX27xHqFMc+oDjI2OtXACtcGYrEVW9Xl1zHZV+4ESCP+HyMVkQ
         UA2vQhyivCXY1bJba7G4fJmxIOEzsRYdDuPPREg8LePlfx84rhIaKK7JhO2F5FlU0evn
         TWjhGKjjjPUMOVKHXKT9YQVUeMOByHxEjlK6oOnARqz6x/oK4HRs/3dM1s3phjMx6YBa
         /q7w==
X-Forwarded-Encrypted: i=1; AJvYcCWZdCFwKKYAu7Sas0pEeT3V0C8wIdK8fg20blwzmdivDPa4hV4pW2+KSNEMqD092G8guSjbuuL/1VssQJ0skoN7@lists.infradead.org
X-Gm-Message-State: AOJu0Yyny1kTHoiZNle24ItOtRgayBm2PBn8XHeCUge9PFkBixFuiAjO
	aw9q/DBKbkQwtGYo6tUxM96H/6SgxYFOJ62F2RKtB6t9XE9Ub2XyPQfOEe7Zc/hOt6x6dcsxc46
	9PwhvWN6gcVwevUnu3vR1Bv50u/AlIAnNbA21YjBAOYbHMzENSVGBXBmlupcnUjxzKOZlZWsV4Q
	rr/w==
X-Gm-Gg: ASbGncuGZb910hdSaKkcQSRD7ovPRlponOWMuUuoZsjNYYAeeBGxBMj4wdhuCaJsjbi
	zCK072bS9ANW0tDsh2imB8B4qRqPtlf/1xgJr6V087UYTc8kXBlC6kMyv187MP4TTkFKe/y/Bjt
	9AJ35iiczubHduAdSctTcZNLHljiMpSydW8fcPStvgpWQ7AHJ7/iK2ucgxyjJPhRmqqiv7P910L
	5zSYIR0lo+MCHOhSljnllXt1XPMxIdCBa0J1WwxoYrdecfmBy7pK7VetPXvSH9kDqsxTtudNhNj
	KXsJO2nW+e/JsHP50rTrx9BUL4MKW8Ha3bG83yRKXeACFhtZyMmhQtNrKk40wgyDxqFhmnKkifp
	5Z+3DYiF8CzU1MZ/Ow8qVEEqwPSokRYhcipV3ed6UrL3d3nCZQLHDi8BT
X-Received: by 2002:ac8:7f4f:0:b0:4ed:2f2b:aadb with SMTP id d75a77b69052e-4ede794dd10mr20846371cf.12.1763031529009;
        Thu, 13 Nov 2025 02:58:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdQDsxtlP4V4oPmd1PqozO62xfFzJpWU31Y99QHzv5aGDzw9SGa8isg87xEOWg69/ZZScEyA==
X-Received: by 2002:ac8:7f4f:0:b0:4ed:2f2b:aadb with SMTP id d75a77b69052e-4ede794dd10mr20846131cf.12.1763031528471;
        Thu, 13 Nov 2025 02:58:48 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad3edasm140259166b.17.2025.11.13.02.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 02:58:47 -0800 (PST)
Message-ID: <8ebd7250-fa3e-4705-a5e6-f01878389df5@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 11:58:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/21] drm/msm/a8xx: Add support for Adreno 840 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-15-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-15-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XrX3+FF9 c=1 sm=1 tr=0 ts=6915b9ea cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1fD9zpMYXuRVFxAoecEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: yviPfJ8wJjwkbs5_fGicX50TaFIEWju4
X-Proofpoint-GUID: yviPfJ8wJjwkbs5_fGicX50TaFIEWju4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA4MSBTYWx0ZWRfXzkEoJ7duuV3U
 i6JPYycrCeNfSZqid8zXCt/4agL7X2ESReNLRirnp9cTPbdIzTlepr2xPV48zFE4aWqQxZSSkus
 MGlLMVy2TaFl82dAPBWPeDfdpD2OraP4P+W9IUmHt8oJ3/4RAylRkLAShi6MKTLO49kD0zhrNoo
 zraEXqwuB8nGDLmju7pxv5wRlAL1mk6+fy6TKkWxaIEezC+L3zRQSv/2irvtTUNwQ7YDXMNEClC
 68ZYjlFD6YR0lDtFPvRtM6TRNyQh5LwM8mf7vmbozprtKNSBUapb0AoRIBVI8uow6Ox7r3yI8FB
 /Q2zS//+LufveS/UF2E2wZLBHxu8DH+nesBWUimNf2rqvA/HUGmKPssdfMxyz6Tw0yw2kG4IkMS
 gyKQI2sGdUDRrwzS+K3PrVbUbKo/wA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_025850_602214_0D5F8190 
X-CRM114-Status: GOOD (  13.25  )
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

On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> Adreno 840 present in Kaanapali SoC is the second generation GPU in
> A8x family. It comes in 2 variants with either 2 or 3 Slices. This is
> in addition to the SKUs supported based on the GPU FMAX.
> 
> Add the necessary register configurations to the catalog and enable
> support for it.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

