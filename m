Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421D4CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 22:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xujcu6su7xsGlY8taylppAEs36Y3vIRtnieSXdVrg20=; b=RkBuV2uAfok9iSR2klf8+4IbSz
	5ZRr1WE6GvSetwdVtJylgLFBED+YZ43gSzDvwWTdVxo7jxQyhFzWzd7BXKwpRgbj0pXYDeYIs6/zB
	TRSQCNCj6z41S94vNDJznVlIwtTlirZgxmO15IIjsjL4JYVAJz7TK2AdLh3Ku5j4dYWSMLFfdAHxZ
	hBe89l1EwZ+yreCAXW6epGpW7ZrC5+XnWOiruBXLZsBzslGPwyImg6TxN0Dnm4SAbRynaivJNFkYM
	lJinIGWy5sbExBUL2MJ8PGooWhSfHNBxehr1QU9w84EbKXGabhuF5O7Cc/73LYlvlomANfTOcnO6c
	g8Nukv/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v44v1-000000096Yd-0yME;
	Wed, 01 Oct 2025 22:03:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v44uy-000000096YD-3z0L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 22:03:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcQRR024114
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Oct 2025 22:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xujcu6su7xsGlY8taylppAEs36Y3vIRtnieSXdVrg20=; b=ZxrmdRFGxgETCxR2
	KDET9JmODW6PupEOkcuQFKC0hHOo2JvLm5agcGHLLk9DJzxXD7EjI+NocnNB8Trv
	y2qTIXBY7hG+59YyTrpGUWIZ97AwGd1ndFdNiuLQc5sBSRB05yBjZlwemER/JW6f
	eKFSogMw5WY2GSPp91KaR2+EI6k/Itmu4+hUHsMPWrHu9GXR77eRwkdwoALRFDg2
	O6CKJBmMaHUX2nwQdo/33wBAE6Bad6XdNG34oiemZSXvzxneXS8kxAR7dAO5ch5h
	lo8R6+6G/NGLPzpge9CdK4ExhZFhnZhJjhI6Reyfyh/UccS2gA8LhXhfOMqR+op1
	AjMrUQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a660n2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 22:03:23 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b5af3efa195so1266850a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 15:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759356202; x=1759961002;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xujcu6su7xsGlY8taylppAEs36Y3vIRtnieSXdVrg20=;
        b=LajlfM1UfeUKf72I7cHutTuI/ckF1Bj1gVq1IUwmYsb651i8UH6iOOYYuUirfzXPHS
         sH9+rQFOu592TRLVefHM1/13YjDjoTEfskt8B2KZdSJv9gvlZzfNX3n0GEvJ3lAHTQOK
         xjc8OUO1Bs6FK3rIpGZlaWf0CCtC4OKvmcZ41s3B7K6n/XnsifVwlbDb8JR2dyYF0qxG
         zK4vm8QsqHlxTmJ/aDPHd5noESLu0zJnn8SEnOqPYOdgAXohEDbrWfHNAp7hJ9F4JRKS
         HFbM1eFavUrfMr8TFyRfSUBIIPRb+0OdIZgCYrEubBHILA/JK19QO9PP54+ospx4JkXf
         N0CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoBoctfcDE3ed87HzgOO4K7PChqSis3jgVmOFXo40l6QJmuE9FgLUf9+gi5Mn1OYQi+dKoBlBkju9Yf0llY+sL@lists.infradead.org
X-Gm-Message-State: AOJu0Yy06T/EoiYDXicDhC5E4+9T42ebXPTz+KsmQnuYyUk+KVeng+as
	rp75vIM/yNtOPX5gtkERtmN28b58VGH/Yb5mYhZg4DQ+3E2zIVswHoRMLN147vGkhit7k931lCW
	KxTtsteUnnUxwEcLr2Ge7ZolpoV6C1hDL/fAO8lnZO/Pehc6DscV2UrJLVDO0TOwH8SyvLs+fVj
	QLKA==
X-Gm-Gg: ASbGncthAG0YiDWF99kgjjcHZa37k2gbRb3V9abbktAIm+Jx+eNkd2cAyUtjmtg8nzy
	SSfwhM7nmWbGn400hh5yQrGtl3czVuc8itmgjkA3sHnPpSexS16/M//18zVSrmRuWd3viB7BmHQ
	bcXzLOYqvLEZ/gR+eMCOWZa+5d9468P+YgsZIL2GmnIRaXOA3X7AfVM9wlCaJPmPdHSER33nmaw
	RtW35pmRz23pk4qNsLjgOzRBTMTpejRyh1YhVpQ8kVlZAJLbvRiqziRJjMhpI8Vt+/naIXNkFqe
	m0AvLwNZLM94Oew5PM0IWTkeG+NH7BfATRXGpcia+SfcmBVm3wQ9JSXsdMBd9Ej7QvA=
X-Received: by 2002:a05:6300:614e:b0:243:78a:82cc with SMTP id adf61e73a8af0-32a2529463emr1184486637.25.1759356202563;
        Wed, 01 Oct 2025 15:03:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgxO0FMEt6NCjTbWEVMsMIoIPsAqpPcSGWTogRJlJI3yNWhMaCOEagO+8drQ4c5arKTyjNnA==
X-Received: by 2002:a05:6300:614e:b0:243:78a:82cc with SMTP id adf61e73a8af0-32a2529463emr1184444637.25.1759356201994;
        Wed, 01 Oct 2025 15:03:21 -0700 (PDT)
Received: from [192.168.1.9] ([117.244.71.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9ced7sm659664b3a.15.2025.10.01.15.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 15:03:21 -0700 (PDT)
Message-ID: <79b54a9a-2f05-4a2e-b9f6-6fe46e2c25cf@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 03:33:12 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 15/17] drm/msm/adreno: Do CX GBIF config before GMU start
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-15-73530b0700ed@oss.qualcomm.com>
 <ae2ooybajk6mcjggeztumubht6auw5qlhmsdrblikc5ruoxtmm@oj5kvpxithva>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ae2ooybajk6mcjggeztumubht6auw5qlhmsdrblikc5ruoxtmm@oj5kvpxithva>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68dda52b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=2kejHg7nZSoTgEpwAwsXNQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=AweIZ1vEVvbksj7JdV4A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: doWdyulz8IXaXg54khW3__5d0PpmwEB3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX5MyOutFz7IkM
 gBEH34KvRc+uOpSgWA+JjPaYMXN0Enirv97JhlvDiL45Ykwyfi3WlAx5D64JpH0owaqLsyLdZd0
 dD7oBE7qIhqqmXLsjgZ4+WwRX9fAo8WfKaLVZh3M+CUAg8lbzvD74jgf3ak0RNG8lBhHrNk2JEj
 f8+tjbPSDRKm29jvqgFedG3b7o7lWPbHEZxTLJh2N/O17uO3AoFJ2+t9vsI0r7fyxTuiYLYKRDW
 hMvWELE+Km5omhh1h+i44/ddXglsnlHLBn1X+UVYLn9VhajJWQun8CytqS6vHK1S/CoKdyLYMxt
 HpzveRZ6zOne6/938U/iTnGahJua+dJWDw2HKFxgiYlXNlHHG2ckIsAHV8bLf1y2LM2cpBxCQne
 Qq+1aiAVhcmpgW4Ni4J1rrK5EeAWpQ==
X-Proofpoint-ORIG-GUID: doWdyulz8IXaXg54khW3__5d0PpmwEB3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_150325_114008_1ED0BC54 
X-CRM114-Status: GOOD (  16.56  )
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



On 9/30/2025 1:19 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 30, 2025 at 11:18:20AM +0530, Akhil P Oommen wrote:
>> GMU lies on the CX domain and accesses CX GBIF. So do CX GBIF
>> configurations before GMU wakes up. Also, move these registers to
>> the catalog.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> Fixes tag?

Seems this is not an issue for existing GPUs. So, technically not a 
bugfix. I will update the commit text mentioning this.

-Akhil

> 
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 23 +++++++++++++++++++++++
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 12 ++++++++++++
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 17 ++++++++++-------
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>   drivers/gpu/drm/msm/adreno/a8xx_gpu.c     | 10 +++-------
>>   5 files changed, 49 insertions(+), 14 deletions(-)
>>
> 


