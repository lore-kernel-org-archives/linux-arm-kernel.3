Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CD8CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 14:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G0N1uC0gRebFM3m/xAV8ULblmBy1UD2QyB1c+fLY+4A=; b=MnJ0o7bcI1ArGtU4OgiRv1PWzc
	CVS8BRv9CxTuNgCA4OKU2cYneDyc/XpK5qwVPwXRyehezW2iDNeAiO/iP27NVCz7JBKRJofTGxepD
	GLMjRW4YbG83YAbEtauJZZQPCc8jpAryfHWL4hlyq0+fTUXII8eKKSrByyNK9RCDwOgUhZgowCWBF
	IRj0AcTUsWYjPucMx1YmarBsC5JD/hM3MdnuGrihcvx+YGBIbc6KSwTto+IHGMlxtcAxzMMMjWFBZ
	oGOaywT+o04JhUxbYH7v/hdj9e7mO9AhH9Dcvcp2Rq2Ks3XRTeXPuI8nnncrVdIOW0+ZBhjdIe8fz
	Uw+1A6pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKzmv-0000000GE0f-2GPW;
	Mon, 17 Nov 2025 14:01:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKzms-0000000GDzv-2NOC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 14:00:59 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHBbUFM2582098
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 14:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G0N1uC0gRebFM3m/xAV8ULblmBy1UD2QyB1c+fLY+4A=; b=CaLNWRlLM2uKAZYN
	zumD9UYmsPf6oUOVgIDz1j75aOapZi2Zk3w6jEeuZ902Te9KZ3QoHgAavMpXGXWz
	mTd02hHbgfZkTTFjDcKhu2o5YASXC4Q/C+toi9qYmVOCK4f9u2wWooLVtukLDy4d
	MGXQxrrRs7k5FW2a1qAjNVQ2JWdphcxhmjwohGDR0Qd3txoliwcX81HHKJ2goDWL
	jtY075H4qCqC/6NBg0qRZiZoywBsPHJ1KVjg9w4kC8d2cLtTvZEv6YFw3DWZAilg
	Aq2rPi+fMQoHDf4THYnwBPW0FDV6GeIaVcHbAZ0atBz6YFIfvxvAbmKM/gXIfuck
	GTkqhA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4afssfa04v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 14:00:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee07f794fcso6464421cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 06:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763388057; x=1763992857; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G0N1uC0gRebFM3m/xAV8ULblmBy1UD2QyB1c+fLY+4A=;
        b=Y2KC2zcmZ2uGCPr8e0f8AwTQObo4KFCfzN8Swi2dWXpNAGTuPU75uX2oVxypzPdIRO
         F7gGMVCH9Gi/3vl0GFhFJYGQXhRE67tY+8S5vJdFCCGRGI1BvY+rFdu+azv/aCXem9hz
         Lw9VjOgdyWS7eUIzuqNgiPMk6hbpn3pXUsmRYw9VbW/6oQ9PrHCbrU23/ZsF806kTOIY
         A1DtpfDDAFLsCkUeNNSedAgsPvVNzzHJjJekOMa4YqocsJVFrcMSTnq2LveEMC8RumML
         /AYDPsz5Db62FlGtPAeyO0uYspVPkFnDkpwpluzI7tF+BahvbB183TdE7wSkPGD7Arnw
         Fibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763388057; x=1763992857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G0N1uC0gRebFM3m/xAV8ULblmBy1UD2QyB1c+fLY+4A=;
        b=vaDNDNczHmyD6JLoR9c7jBCrDiWtzChemFh8xjNAMxIhweN/2optBFa71/XU2IuYrm
         9ENupP9iyTrkUbWTlhAPDhg1hvI8oU6jK6/jlQPEBx9BxJ6NCE+I4aUNCVMau24N4hCb
         60Yp4gyjfzSXzC3yUmE2kBCdk4M2CzNotKo5YjVf5STHkQBNH6NGSRsUaxvkyz/oAzi9
         1EC+sinoHqOx9ADXRSKrm9EqYl7PMeIZfb1Md0dVqKWOl7Dve/nhWxTvRX0aHbs8C1kn
         1ajvZiDTsP+thbukreO2KdMTH/6aBqCHRc+bzvrT/WD3tfsZ46XU0n8fzS16LJo2W3RX
         25xA==
X-Forwarded-Encrypted: i=1; AJvYcCWN5BI/K2Atj4BkndNeJZSdn+1W82/3auLxAFyBnE78oFBb1pUz+DFzI087dSsU7TaP5kk7C4VohVm9dxXqpI0o@lists.infradead.org
X-Gm-Message-State: AOJu0YwZiJYFvm8HLDk0UTq7q5BgO+YCuVYD7Srx+cZhxGD+qMifPZjR
	JUWxFhimhDn+7V8Wrp11fgLcvi3PHsIovA/tPyg1aH+s7ThFd2k3W39BSmQLGvGoLJvQd78g+gv
	bbn2haffOT59HaEdwbEra51l+XWxAurkGBfP6q8mBwncDc44SSxrqVWORBAPIleEzGAgoo2w4nB
	NsgA==
X-Gm-Gg: ASbGncuMKGeRYvkIcRcB4YyL0SeMaEdYB0qAxCTRshkxwyWzBT263QHfid9qUf/U4+B
	/SNblrC6DyRGlLHOLnDWOMgzjtfT1xco/ccJYUYjmhSlw+2T5ILfGZcItZVlV6YfP0B/mtafCnA
	pm/qkFoVUXtszuKdP0aj9Gg+XTlGeBVuyRVJ3NxVYvA/inpj+0ZQDsl1Ptj7a/3hgZ1QIDaKPIF
	LquYIFS8wP92A0S9kPna0E0teSPq86jl8AYT92DDeblxnsoB6i80YYHinSYjfvxn8BrQ1hCmsrM
	/9n8uC6EBshJB2K8N2ivcs+xDpGJI4oSpKITCU9mvDiQ+7aacTHK0Dp7crQj5ciRIh0+zZgBKiL
	cFEA52QGcYp9kNwxVjHjk6iHKaRclEl/pByGMBYbtKLqAAH4lfsFgJ5b8
X-Received: by 2002:a05:622a:1a20:b0:4ed:afb4:5e30 with SMTP id d75a77b69052e-4edf211b66bmr120920911cf.11.1763388056371;
        Mon, 17 Nov 2025 06:00:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGj35tYdr0HD47+9f9g95x0CjScjhWZaLoteYTa+aiaYqadjZmKPlu5QoVkMf1uY20EKq8T9Q==
X-Received: by 2002:a05:622a:1a20:b0:4ed:afb4:5e30 with SMTP id d75a77b69052e-4edf211b66bmr120916341cf.11.1763388051601;
        Mon, 17 Nov 2025 06:00:51 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb91bsm1079743966b.70.2025.11.17.06.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 06:00:50 -0800 (PST)
Message-ID: <ff634b09-c28c-47d0-a57f-6203755cedb6@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 15:00:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/20] drm/msm/a6xx: Skip dumping SCRATCH registers
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
        devicetree@vger.kernel.org, Rob Clark <rob.clark@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
 <20251114-kaana-gpu-support-v3-3-92300c7ec8ff@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-3-92300c7ec8ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lWygP4mxw0_s5odZT6xS7XiSn5Tp0CVL
X-Proofpoint-GUID: lWygP4mxw0_s5odZT6xS7XiSn5Tp0CVL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExOSBTYWx0ZWRfX5zR5/XI+0YT1
 3cHQ7xdeWdwNsQyxtNG2uwtWQtk7uR/nj2petXyH5940xZ8ZLyEiGCufhUCzIRXhsFBmcYf8aX9
 8HWVBQ1yRoFOJYEgOtJBHl35KyyRt0dOW3ZyhdOI5OUybo3kHNRikSeOAzkOGvNz/xFiOJkflwK
 bR5D3cvhKKwLlQn2OCMqY9LlExQY3vYjM41IgurMsmNgdpOBBJCmxK3B02u5tQu/tDp2mBhZYSs
 7Rb7dqqzxG+TyNivwn8+ZTJ2kgEwKkVz46WwpTiil5uDl8jzMhXqVHXRqyuBKiY2DUC6CLD+S/F
 Mn6JdTJhRdzUEt2o3nqLugR9YbZpA6RLqX26fq98z+6boYrRtp4vKMrqmEdoU3bNwQNtu6dCLny
 kjA/cYcx2i9gmJMgdpghVs24aMs76Q==
X-Authority-Analysis: v=2.4 cv=IrkTsb/g c=1 sm=1 tr=0 ts=691b2a99 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=RYDHkQwZWS8X-3Noaz4A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_060058_616690_38D58120 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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

On 11/14/25 12:29 AM, Akhil P Oommen wrote:
> Crashdec doesn't require SCRATCH registers anymore for a6xx and newer
> architectures. So skip dumping them during recovery.
> 
> Suggested-by: Rob Clark <rob.clark@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Looks like this changed in:

https://gitlab.freedesktop.org/mesa/mesa/-/commit/95104707f189b2e1b06c855b563c1203b33da354

and needs_seqno is never true now?

Konrad

