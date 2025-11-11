Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6311BCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 14:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VLUjnRdYKOuu5qj1KoQzXxsr2RycgjfhzOqnzAirtEk=; b=qsmciIHqLcfD0YUWufLK2WNoG2
	O4XZF0IEGYDSzsZeOdcoV/dBQsbAR/wVd5yJiLbjEEKc++Bux1b8bGKQ8Vjj1218YA5+mZntHjmP3
	LoQ4uUadN5/4gfMQ3V+P+RbjvEaqFcoAiq5TRrhhsBY6nE7mqnNMWvuOb/PgNIjDQ9H9HAgAWzh1M
	debEsH3mH7AnGMJMrwH+RS7E6/IbrSE5yE/zvI2HwIq16irHW/U8OSnRLAC8DADgstDqs7irOph0W
	695kkpX7bfYAPQyNyuzBAk+Mgw0QQppqP9eJ1VIlaCV3Q94al3IjTQ5U/kLPZFf+HP5vNomii3fXW
	9/Kr7RTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIpL2-00000007Jr9-0wbc;
	Tue, 11 Nov 2025 14:27:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIpL0-00000007Jqo-31ht
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 14:27:15 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGIxj2117330
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 14:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VLUjnRdYKOuu5qj1KoQzXxsr2RycgjfhzOqnzAirtEk=; b=ELmNGRaYr3Ek/O6D
	IZP2qD4dyHqpwVTbQTB5Yw3o7cHSgiJmwqmKEAZZuu/Enh+gW8oEjFXL/nEAT3Kr
	BF3WhBOaHZgcNJEUMFuq6hqLxo8WqaeE1epEsVy6qbmYVSYc9PWsbkAIXUpnh+Gn
	FjjokjwRWSwj07XNlHaB94Sun9WFZfj5zsYISJ7hHCGfQunpODwWgXSfrhtoR0g2
	DDJvIWFa4vjpKY04ixCA4UYNl5IsESmhuJhQJbJuUqxwr5P5XR5DfoOHWvKn5tCo
	CfxfwSfKOxzJdYrZs6Z7LeJ3AevlDHLGPuwe0BXz/SyUqlIgLS7uxuvJ1vt6H3fD
	OGAqFg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abpy8jp1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 14:27:13 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7aac981b333so4051171b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 06:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762871233; x=1763476033; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VLUjnRdYKOuu5qj1KoQzXxsr2RycgjfhzOqnzAirtEk=;
        b=G8w4RUBTQ53QfYltXNXu9dkXkD45LZb6elgIAkb8W/3/yJSzTqv6urpZ4tdkTvrvfx
         35L/vsOmtpVnAABgFVKb9yTls7v0WprpPTLU0tDsUqhsXEYEKPKTOau0nAUZ+EIz6V2n
         0Op+JScEt0skFFdq3znU1uHeulg64y8yFh+UeBZbWC3xtrz6QKxUywNmNEoJmRcr7xFu
         LIhIuMxSX9/Xegybc84Sng+PvqDD1I47n1pXuuaAhtevLQBgFQJqvW/K6dZJ6iSUUw/X
         bgV7okv8Lya25Y+6Um3XGD+N4orLCei/z2UhNY8xxqE8BVgMMEKSWG/0dGd/OjjX2oL4
         /IrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762871233; x=1763476033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VLUjnRdYKOuu5qj1KoQzXxsr2RycgjfhzOqnzAirtEk=;
        b=Nrje3vUjHU52ZSf0lmSy9zARladTtmWWEfhsWJPIi7NYC++exC6CP86brPOx3v3yo2
         aMGmwl1l+0DbFLSoPJFLXlkPGhktXFVUTvhH0kGSwDUh6/nOBjpYcYT6hi7Qy49R4n0/
         bRoaAVFtwFaobVNej6gtmZY+lqinefekk2N3vpMDdgHiiEUc5KLU5KxWJCJUsjBbRaJW
         80sd8/+6ZZv7XH6mF2VA9QhaSGysnBFj3HW5qgjoU87P7Gk58M5oxSHSquN/hIHP+784
         7OdaFKyKhoTqeESu0dgWpNkD6uweO1vZGwDtzpmU01eH+nVNho4/yQZbMbW9s3u1gXgW
         ZzaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpo3u/d4Vkoho0QVridwuWxQ/4CJZHDFbmDp+G1EwD8hrrbqHuG9YsFxvYBHP/jNLUSjouWl7fMBXthyJ5b481@lists.infradead.org
X-Gm-Message-State: AOJu0YwqOxwqj39P2sGpK75EqDAQXwc9GicFz/keMtAUHeNEXpo+vdvN
	bkN85vHI6ILC93nkRZEjqnuL5UEuCyHnlSNdNhfOm66kHh48j8NwrLf9Xu6YOytKAVo/+HmHF34
	QKWS3CO0dig2HzWKhH3Plnil7bsDyIqRHZ2gHMvxZDLFAE2hDCVj0FxI1uOkWutmD6KOTqGupdW
	TdNA==
X-Gm-Gg: ASbGncuE/6YNfdkT+9kGY0AspuHE4L9EzUZOTpmvyXfjvGokOqeX46oROkFdUzJ6Mmf
	UWcjlATZ9v2pPRdwRJEIGhqypSAEpuvOS2NSD9U/lP2RS+63etFtj0kX+hqC6X8DBytlq2LYMDU
	sGbIdV+4Ye45d4J7v9aymzpsiO1rZqAIRiFG1IzNIcIi+OIbbS02LPdsEzgkdFsTh0MP3cbAcjC
	3qSZdmBdkf7v4ebhIABg+dg0lnzBQewwVRWlWj25aMSkC2efixwyl3V8LBFXT6qORZpLNEstBXp
	N8Kp1Nhhqa33ms4wUnLGXHB0usQFYelLA3ivacElmGGlHhif/qFDegwtryc5AaJDg0BhW+fFLFw
	T4nrvbEBTPvQt/XwPxTExyA==
X-Received: by 2002:a05:6a00:b44:b0:781:17fb:d3ca with SMTP id d2e1a72fcca58-7b2266a8d96mr16270331b3a.15.1762871232985;
        Tue, 11 Nov 2025 06:27:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGS/7Y+JCV0WL0rDJJwpThYAOraNVEcFIM32zGMLfnISD9Q77+PeHDE8FGvMX6ZgCVDRIoTA==
X-Received: by 2002:a05:6a00:b44:b0:781:17fb:d3ca with SMTP id d2e1a72fcca58-7b2266a8d96mr16270287b3a.15.1762871232438;
        Tue, 11 Nov 2025 06:27:12 -0800 (PST)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b75bda9f77sm100571b3a.15.2025.11.11.06.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 06:27:12 -0800 (PST)
Message-ID: <08f8de55-52a5-4942-9a39-222fafb093a5@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 19:57:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/21] dt-bindings: arm-smmu: Add Glymur GPU SMMU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
        Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-21-bef18acd5e94@oss.qualcomm.com>
 <20251111-mighty-aromatic-urchin-f80cd9@kuoka>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251111-mighty-aromatic-urchin-f80cd9@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: scpC_VyPKoiVTb-0G1bMA71gUNMlXDMJ
X-Authority-Analysis: v=2.4 cv=AYW83nXG c=1 sm=1 tr=0 ts=691347c2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WzT3ZZK9S2hwGh7ljtQA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDExNiBTYWx0ZWRfX/bwK3ylAKUPc
 w+ZWOoWTx5HReW0rVDDLSaH2qAcvPwD2pDV7SHU/zjG4FUCZyEExHdwDqQXLeh444W6JH6QvH55
 /Thvbc2pz0lpoiOt8a0OsZJ8trJKRGa7wi7CRW7pp43zbXc8Hs6/PwLl6lTcIzItl0tERF4Hfx1
 ZHcJ0xZwFOBeqS6Cq/jBv5q5jEOUIYG/SEULh0LnpPRC9aB3+kS+m9xjM5XjOOLvNK/d/ufWkhu
 S1juX6DDqQVfxaplteHG2gUBtDqFIH+EOb2Qnsy0TI7ShVILfeHADxZmhY2QeYcMQ/gPV+ix3qd
 twk6G02wZ+6ezgvD1g5ecF8WOAA3eRQtIHbk2A3llmBNmKPgBwNhZ/oNtBfkITq6J8264V50pgI
 /4HExogoTkukb4aATj+bIm+SHd1YEA==
X-Proofpoint-GUID: scpC_VyPKoiVTb-0G1bMA71gUNMlXDMJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_062714_771459_56A2853A 
X-CRM114-Status: GOOD (  12.89  )
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

On 11/11/2025 1:20 PM, Krzysztof Kozlowski wrote:
> On Mon, Nov 10, 2025 at 10:07:27PM +0530, Akhil P Oommen wrote:
>> Update the devicetree bindings to support the gpu smmu present in
>> the Glymur chipset.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> So you ignored entire review? I drop the patcshet from DT patchwork.

Same here. This is a new patch. :)

-Akhil

> 
> Best regards,
> Krzysztof
> 


