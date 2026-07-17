Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E4CC44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 10:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anIBn74AomYL3LvVUUMgs2E/qq+99IUZOlzTnnvEbFM=; b=xtnFA2P9d1P25XtlT1MOEE5/Xz
	DmyQTKtd++yNNg7amM40s33cPaFps6SUVDc1Majrr+Fb8vjQSvKpgsgNzbg4zuSdpVnE20Rv2BBO4
	1L7Cf4wLIDBMo0mfsKxE0IO/xZgteWdm+qMR/5q1TVXdSvUjZgrPB1zSoU58udblQhTbYeZUrbq5C
	VLjhqMv8mCzwVEwdSUitjb7G++Hl6y+m0G5Xc9PLZTRFiXDzGAUUrJcSSoPXwFttbBpEYqscmEsdc
	z8x9BhMmgdngnzwOwtUDuLg+j1or/7RoDSaKFkOZ8Q+8TdnszcSFcbM9N7kQ0xkUb0h0HaU+g1bhp
	uHYsCDkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfQa-00000001uZG-15Vg;
	Fri, 17 Jul 2026 10:04:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfQX-00000001uYr-3IMX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 10:04:18 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H9vCTs1121113
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 10:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	anIBn74AomYL3LvVUUMgs2E/qq+99IUZOlzTnnvEbFM=; b=MRg1oEUb4Ni+i2BO
	85OR+1wFl0TJaLyWh6kTHFHLaUjOj02Cx1mtmUilXdPxNcb0DnnWBJ4skh/mCkA1
	b9KmpzUt8yVzFY74+PuBChac/gqyBCLx4yJSJuUtjQRhswQiicgCzK7dF0qiqqfQ
	ZTDxKD4gxoGhuD7/cErPwg0+vk0CNPQrRZwg0/gWe3f1970scNms3dAHTOvc7KTv
	ufs39S7hoqiVvu9aqfM5PZtTG2D/LXlUwgVqL+nYmT/VPOdL9aSNkMxEspzoN5H6
	I7VeS0QMmRCoU3UZxipET5FLKH06WNTwwJX4p8qPvCkSqGNLywbVhAM++An3KYPh
	qeuKDw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffj78r0uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 10:04:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c9e97b626so15640851cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 03:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784282656; x=1784887456; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=anIBn74AomYL3LvVUUMgs2E/qq+99IUZOlzTnnvEbFM=;
        b=FCX7Ft2JQaWOYnqDgXrnJlVdYjo7V+NKOZ3WtIJZRsm/Sdvb9yhly7FPznmN03WFVJ
         KvaP/zQZjpF2cdySA+LATsI87l+M/JinXDFcEqBZsxdGvAr6BrtxnANlkpYDrKEvTgnv
         xPbdjjTf+O2bj7UtEIzo6tz+JT9g7kmT5xb8XIObhJEn59YP1VgfMAq7Iqtw6xgJg7ia
         qLKWFPYnL3TFJUQTHqwYn+FqtJkjGpNp8U0dZi1hFQxDqeZNRiGAUN5mPNv4jz1VHyXc
         mPIl9PmGI1Py6JqMqSs3ZbQK2H+asH4h5Wjx5uRPeDMOggfk7ioTGmN7XUwOhmYrx5Ac
         jI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784282656; x=1784887456;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=anIBn74AomYL3LvVUUMgs2E/qq+99IUZOlzTnnvEbFM=;
        b=VpzWk+hZoyOAxeWgNT12UbIAoStco8L+vdhoBX1TPNDKPjRk6Gh3qA+rWgtvhxYGaj
         QHvi0roLemBC+bDPCHF+PjQMUC9SOC1vw5yEx/GP3qhWFg6mU95cvxSBxjSHbB3skVrN
         GSSPp0IuwRS8jajZi5OLIrt9AAL0hkQXUalnU+cUq7mtFnDga+7wY4CsP3ODAJvC0BrQ
         v1lohX0aJFlFTgz1Hfo5LnfLAJ75e8uJ1xoPwM4+OqC5ysyPm9+7Im6mW82yJL8LcbKe
         ICqK+k+pDjwbvxtGgcIT3DAbWPo1KAytBWWQKVaQIEsRd7d1r7gdfC2SctnQa2FS4FNv
         NPAQ==
X-Forwarded-Encrypted: i=1; AHgh+RpzRRchrCiQyi4tQYxms/SERP71kkUcW77ZBpMnVFm/Zl5+Ra1GqcvbO+OA8MjdWyseKFkS7ksp1waYSykUrDPA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6/HUtyopm2nDYjaHOMB5/Q6qdiUFh2vDxBaaY4NlXLgbU9w+m
	TNUl739Eg5jntVaTeJp6eMG+d0TMg2iNa4rsrjaowJ5LdLUnunBeddxthjOn2JNcpm+Msu4N9JW
	PEKz3VoaBNC7qIBNbVWHVnqGp89RqcNLDQEdISg/ccYQMQgZ8nI7lUCQJ5ZZu2WyL0Z8Wxqe+cx
	PFKg==
X-Gm-Gg: AfdE7ckPAUBJ++pWxOKgZxD08Q5iwC02+hIU7PURs8YSdwzdYmDiNJJr/JD/DUmQMW0
	Yn6eFLWBu7E0VOiZeYVyw+QYzuU77f9YFj6GjgsLLptH/WB8EmQEciZ/cBd8e3faEvLL9VMr9pU
	R2AWXNb4qtNmgzW7qIXPdGioBJ1b7rOumVC4gymH2zAFCUJ6ZWR1ZKLpyQ3FVZbgxto2lmwy6ky
	8lNxCOdKbBYW6FsXIDsDXKl7m1WVuLTkIUTlz8lthGbe1l5LPLiotfmnn2M75chxdXvc0n+BDH/
	TILDcZVA2ehOZBQGPsjbxrB0+sspkyKnWlkGKkc6Iag2ImzX4NvtOM1QWuscz67mDp5wcXy7uPN
	EW3cJiRGxJiBXCHKEAVhwCefV
X-Received: by 2002:a05:622a:1c15:b0:517:5e32:f3ac with SMTP id d75a77b69052e-521382dd29cmr12698031cf.0.1784282655969;
        Fri, 17 Jul 2026 03:04:15 -0700 (PDT)
X-Received: by 2002:a05:622a:1c15:b0:517:5e32:f3ac with SMTP id d75a77b69052e-521382dd29cmr12697701cf.0.1784282655380;
        Fri, 17 Jul 2026 03:04:15 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17127358e1sm51516866b.25.2026.07.17.03.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 03:04:14 -0700 (PDT)
Message-ID: <2c6b3958-696b-46d9-ab70-87081610524d@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 12:04:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: eliza: Add GPU nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-7-c9f1354dbd29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-7-c9f1354dbd29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEwMCBTYWx0ZWRfX8REfEFlwzGTn
 F8ebbKhrp8ScwIB/gfqXlOKhgST4Y14jQDA+J5JDwKLpM2nv+9A8Joo7FyzAjH5xC8kznT63PWU
 614Vsb9U9LsgSjI6ajAfOqT8T8KLXyH4E3rrBqq93QmnwPT4TgRvTygJQCMA6wftrl41W5krt7v
 SIFqPjkNy4gK3usZPheNIVL1xwHXCSQENRCsPzJCEZuHCSkDH3ANj/QhSLGzsBIQxMSne2Na1Vg
 XCOhMgtz1L3mq4tfcy6OR1iAMpjhh18ikn4pjbXx4Gy3du9YaNbDa4C0/zCKn5y+CStm6ZoGWn/
 a6/wSUckTVzij7XnEsyOn7+jTqHMTStT3zBPVH54qIlWa54qJl4Xtljo+cJuVLI7F7tzK9UNkK5
 bUSeMOT2MXCmMOtYtWkiGXbW9I+GdMVh8ij9KxCnJoktifG2mtOCExFsykPoX1arS8Y7KzwpAGS
 SWXIVUEv4TM4hWEsxvQ==
X-Proofpoint-ORIG-GUID: 7FlyK4T5W6iTY-PoAcoOW3qNjIjZQcmc
X-Authority-Analysis: v=2.4 cv=U9Ciy+ru c=1 sm=1 tr=0 ts=6a59fe20 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=LzKdWfoJb4QxxMUDPeAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 7FlyK4T5W6iTY-PoAcoOW3qNjIjZQcmc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEwMCBTYWx0ZWRfX3rG2j1rO0NhT
 RlXNx8cJCivYBWNykfrWYrTYlrfuKJrRdgrofukU1IuoIu+DyZ3zwiES0aX9cO81iv4otecuy3N
 tLqlpu/mhyaHHeF16KWSA8GarQdpxhE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_030417_831649_4FFE5407 
X-CRM114-Status: UNSURE (   9.93  )
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

On 7/5/26 10:14 AM, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> 
> Adreno 722 found in Eliza chipset belongs to the A7x GEN1 family. It is
> derived from A730 and shares the same IP-level configurations: HWCG
> registers, protected registers, GBIF CX registers and gmu_cgc_mode.
> Major differences include lower cache/core counts, 1MB GMEM, no
> Concurrent Binning & LPAC support. Some of the peripheral blocks like
> RSCC are from A740 that resulted in updates to RSC layout.
> 
> Add the necessary devicetree nodes to describe this GPU.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


