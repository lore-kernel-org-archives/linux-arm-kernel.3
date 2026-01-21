Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66E4C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 23:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+eZGwYuNL/9pmtkPhO1CHKv5sEsHAdFAmDE3I8abf10=; b=4ziOOFGw+oSkj8F4GId3sUKF9+
	B2TU7RQPXRrUxVROvj4GoDzl7E6lGVkrxvMVv/Vw4uXOaxSE9yDyAG3qWUNoU+hhGGz96zgL4SabI
	v2BkY+msNxPLYVjPjxJnoJ9OuuW/n60tJkkm1l4YOVl2mOMpA/+JjsNbbrdBf+FuA7js4JD+Tujgh
	oEvv+G2yfUDd4RQJNjb5XRiBrIXZSg3ubbhmwzC6d0SeGVhFKSTDToqG7v37RV0wCUvtzvrZsHaQH
	nE4ZAtfTeFxK5P5tjhIiuir1J7sqLlpM88RFjYszJJY75ZN/UWtabsTNi/NXSFjLcKTOkIGndN5Gx
	i8OU0nng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vihca-00000006AzR-45jr;
	Wed, 21 Jan 2026 23:28:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vihcX-00000006Az5-3I98
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 23:28:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LLOd6u484050
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 23:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+eZGwYuNL/9pmtkPhO1CHKv5sEsHAdFAmDE3I8abf10=; b=lpdbYA781GOrNi3B
	+vtAccJhathnY7Tv8DoTtgLyMDS8oWWIEhOim0DftASW0deFLXViBYAEnRUUz8oB
	wX62B1552q+qpYUK9fjgDRphdHyPxFTgzRQGkIobX9WQ6sKxZdNQLxtPlqmlPKdl
	rsfTvUCIn56R/gb6Os+MvqAXtcGRLh2HZ7hfG/eX4X7372hRT9ggawwZBxqbGWWv
	Lwezhs1mmKWsDXM87vUhFfBPPjOJo77DbcittOzDU/r8xFnk5UrHG0yTmAOgG/7r
	GQuZz4cRfSYTpU4j9gOW3OZMqMwVE6PQdXRzTDXXpvC9KKSrUkXNyFJyTHWqVs/M
	Bxwvfg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6pj0a4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 23:28:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52af6855fso55078585a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 15:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769038093; x=1769642893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+eZGwYuNL/9pmtkPhO1CHKv5sEsHAdFAmDE3I8abf10=;
        b=G1Ap0AH/Y5xEV8yN1LE40JQ5nHDI94+Viuns4Ga0mqdhM1Ov7OzitAuCDBDqqUevun
         bwNk+8h5CDUuROd0DF+u4bfcp84bHO/S+wjI602bvBri4lQhr4Re+efCxSyfhIkN21s9
         Q/138FYtyQ7ahZ0g1Rt57YNWucHeyIHViWHmNOwR31lqheDRvN63MfSudVoj7U2NI0yl
         4bEN7qBrUhfHF8T/ynSPABJjGU0UCz2VTE1lHtL3eoHdKB1KOAfzi+DjO3tcZvwe9yuj
         Ecjb+WDq7nwLB+OatFBkgYNOqI3lByu/4vxhf8N4DOtaeouyylztuGnA0jZhlmYVPj51
         Fudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769038094; x=1769642894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+eZGwYuNL/9pmtkPhO1CHKv5sEsHAdFAmDE3I8abf10=;
        b=iiYtRjlK8RMoISOrubQhsRBFH+8R/MZML+21Mq0BkFTXbLnQQF/lzxU8vEyhB3/95b
         xdZPyFKRR3UrCQCL3VPzN0VdKHUff3O53bFXV/9sq7bt7cX723LXMk8UDcLXpZ4XDIZp
         hD7XnVxBSYMMUQNCGyTRQjZ1/3Qby2dcHqmHMvubA3QEDDb9pQ89rlfqnOCxU85m5bFl
         jUk39Sxy3o4rHMD9c5tnkSPDQG3K8svysWDcbJ1PtGr1nC2zeXw4PqnhCiY6n6OET6cD
         sf/JDkYrcdPD9godDF/jSKjeL8mtEl+4U6f8uT8W3ZEbcd7++y8+UItVRSkUYkRyRvlG
         HSSw==
X-Forwarded-Encrypted: i=1; AJvYcCV6seeR/btMlby/HO8DvMDe1TOvehp5e0mXtMsnh4B4yE4orQI8iYSz2czEaP2h+FSmk+srDwJlAF5XQuONiTIo@lists.infradead.org
X-Gm-Message-State: AOJu0YzRKn49JMQAxN1FTVoLh4b7WCwJfXMIi+Q9JpWKG71gxevSgszc
	2A1Xjn2EzgRIa3wRiOJcJ80eviteRGSuxpcxXaj9fOPSWNdwTe8GheDwaEw/7RNmwYgUg7uqbHS
	X8LrgQk6arF3Rb4+B+4vNigd5jYy6NEg0yCYY8RE7Nrpo3tuyLRZc9aHbAB5zGA9y3cp3R7C+8P
	TYCA==
X-Gm-Gg: AZuq6aJiFrk30treOns13Aq6c80VVSZphSlOIBSpOwUPpf5b8L0HkByNSDaFyCNLyhl
	dRLdrjxW6AEymWBU0tAgyI/q3y28pavVv56a5mD+cl7VRU9H/PXE5w21gcu4t092evb0njg3C1m
	yS2+A+0gLZKiUTF+nGkq4qDqNfCi3PYU4kBOjLdxCqGwN6epzv0t1EFOoidGEk+ytgRz3WpRcRm
	hudmIi5efd2+0pOitfcLs2bmU14mrZdCoYwMfQoSFmK8kkM2OMaHuVeo/zfqqIry+umXft6Dt7r
	Rif0oij/FKTXhBfexQbPxn2uYuFoV/vSgSgdm8txG/1iur2mWTBaiyGjFPeVxb79/ZCWjAOYi5Y
	IIwnSfFanEwoFW9Af4rDAB4aCGMlOmKvLxV0Hh5vmYEtsxXQyaqJ8TuKBkX6bN6fQRLBL9E6wKx
	jjgrJAovY9ocnkW+7CBROQVyE=
X-Received: by 2002:a05:620a:1992:b0:8c5:3143:84ef with SMTP id af79cd13be357-8c6ccf06c21mr849192685a.47.1769038093522;
        Wed, 21 Jan 2026 15:28:13 -0800 (PST)
X-Received: by 2002:a05:620a:1992:b0:8c5:3143:84ef with SMTP id af79cd13be357-8c6ccf06c21mr849190485a.47.1769038093060;
        Wed, 21 Jan 2026 15:28:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3976dbsm5159393e87.66.2026.01.21.15.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 15:28:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5] drm/msm/a8xx: Add UBWC v6 support
Date: Thu, 22 Jan 2026 01:28:09 +0200
Message-ID: <176903808259.3665431.13908205509840299317.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260121-kaana-gpu-support-v5-1-984848af12e4@oss.qualcomm.com>
References: <20260121-kaana-gpu-support-v5-1-984848af12e4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=D8pK6/Rj c=1 sm=1 tr=0 ts=6971610e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=75Vji5L2PsKrzm2Ba-oA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE5NyBTYWx0ZWRfX/kC3uYVx2+/f
 9xWMi+Aa9HWtLW5y8NyDp/E15l7GCCZSeLSqDZ5vKlG9GRCCFVmsMTZycE7HqidUsxMRKihNqp/
 29vW0N4cvzFnCpuE5jVrKxPrL1C649N1pm92dtxSpq4h/GSgWSa2oAXLlZ1gmfZJk1rf/Bat8Th
 HHOAQsR5YtLl/YifLtXAsake08BRWCOzDZylf6IGJcqV7Zkj4tjY5mgo0NNK7w8n5n+fnFyfIiY
 qyQr7kKL1wo15gQf1ogBKfY+rFascwMST3N7Xv7Sm9ChWX3acVzcwSfO5k6Ce79tKSjdtWrFoOE
 1y6ZxYalBLbUkWHpz3IZ2Q7GeRlkhd97AA04Fq7y41Jwnm0I5iF//sHDIc0xrH0gTGLbVX8L9Ab
 GGJ5goUkno3JifmDj7EfEQe1FoHuBZ7k8e9+W7oAMlIVYzG2jXSlrEB6jBORp4fn0MFkHDhEFoH
 4jbgpFmyeq5B9eD3kGA==
X-Proofpoint-ORIG-GUID: GVO7f6KLYavXy4SWnT5yw-Q1kR6xDgSi
X-Proofpoint-GUID: GVO7f6KLYavXy4SWnT5yw-Q1kR6xDgSi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_152817_839702_A358579F 
X-CRM114-Status: GOOD (  11.90  )
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

On Wed, 21 Jan 2026 21:31:57 +0530, Akhil P Oommen wrote:
> Adreno 840 GPU supports UBWC v6. Add support for this.
> 
> 

Applied to msm-next, thanks!

[1/1] drm/msm/a8xx: Add UBWC v6 support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/50c4a49f7292

Best regards,
-- 
With best wishes
Dmitry



