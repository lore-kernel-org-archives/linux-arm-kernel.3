Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A025CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 07:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YkcyM04R0DD+Qr3GHQ8OUnacSu7NvjdL0Knj9f30K/M=; b=M6iJfP2t99kjyqIIWb4DU2vMvE
	tw7EaXvsbTNviioajQPy9YkO9Oi3Lc84XlMUlkHExqpvqkBuSeJbgWQMYnb6WrJKq5AVTUv1a/4e2
	2VhJdui5k3iLI34jl6N/e4qmsgRPPXw7zXc+G0XhdVzC8anetyTgM6wyqmy9TLOJ7LeJB29/JpebE
	yOUvf8W4bgzlTELjLaiwTTCV/Q8PTsQiUcxvB02a6gNjxk2hhJilMGr5nZi5MRxJLitzAT7rDVaqV
	NQLgSGlsySxDPhrJ0kHwi+0sV5RClZpsmmH6+n+T3Re3SVo6y5cRVCCY9oZ+x5ad5lJ4RiBhyvr35
	t8G2B5Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3UQp-00000004Qzr-1OXl;
	Tue, 30 Sep 2025 07:05:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3UQn-00000004QzT-1YHK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 07:05:50 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HgHj011523
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 07:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YkcyM04R0DD+Qr3GHQ8OUnac
	Su7NvjdL0Knj9f30K/M=; b=iTnzXzJCCeI4G/IXM3iCA+u1U+kUCgpTbDDW0j9i
	SJOj5h9+3BBYuyoaVL1NretVK72heIAARIz51/FwbeZ/ZuAPpsj7EtkDeSN2FN8K
	ovbqZYPQ1C2V16I6gZ8kPRaiCcSe7qdWBCr2bXXVcT+iMfYP5zbLA2kgKoqzfJdg
	Qg0jmvNIqTjE/pAjEB6xZBHOndn8L0Zv3F9m7dx79YQ6K2mDJGNZTZa+AXRhD9zw
	r0EHNJ8bJvzKGyIi40foXUD4B1EdWSQHU+xSs0DSFqziVw6HE15k+h4DPaoe8x4u
	lVP2BKMTF34+zeRtgF3xcOCeEdvj+uEGgeyUv5DljuYhTg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e5mcr8m0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 07:05:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d6fc3d74a2so162313831cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 00:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759215947; x=1759820747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YkcyM04R0DD+Qr3GHQ8OUnacSu7NvjdL0Knj9f30K/M=;
        b=tLHqFyDZ4k+OqBg5SUrSEYJrIO5yp3Sc+w5m5NIUUdv1gm2XxTajbjZM6S7KDvpiwk
         90VvQnwDGFm1RobFfpE/p/v2dYG7p3MC6AXpFiqvqtW7IV5EuOBu4RMysBRCpwx5MFYN
         HV4Nrz5VUni2rLDMsVgbBnVO0Bsv7Jocr5k5ZILUhit1eiTzLXQIxSktJz7gMu4Nq5QF
         x3SMYE0eYFILDovm364wj9HeTc9BFPubhDAS/JKq+ohBgnpz5HXLEd2hd9d7f6V9T3zW
         OHgDKDUZxz+hvOPLkivA62csaDN/NfvtuyTr2MZsoMUaRE9ogIGKo7hQ14PmTGnFbdAo
         zJQg==
X-Forwarded-Encrypted: i=1; AJvYcCXuMYDhQI3dD9KfoA4f4pUUncqr2SZ2GhKdEY7XwQwNi2rPd8bHnKmZShgcnMfvbD5Xo9/QNd/XFCdXloG05iWN@lists.infradead.org
X-Gm-Message-State: AOJu0YzrQYu/Zc8PkIdjK+qjnNgT101DiIrMj9bl9BpSFs3rtUCvhIrx
	wb+VdclB6KYBJhIFPPWKD7twX2SCcd5AogtkizVkhL1M6GpHEB5CyCCbH1+pbIFPhGZ42Mu1Kr9
	pAZB5PWhtxG7gDXkBTm8EztWQvCoWKd8t4e243Qx1QG8w0QKKw2OPOOOTEfXEH2+s4LR3+6Pi38
	1f5w==
X-Gm-Gg: ASbGnctmWMqxGxnBkqZMvVEg35QHb6JS+2SrRUApLEbVcQVT20+I0UwA2cn3EawZpqt
	34y8HYHUpPrEG4w1oArUjUP2eXeUPcOqLINgSVHkewS0qlBHEj5J/eqMStZSa7tUNBjCanesNpd
	DQfjZMbybAyvnfTGvRBW3twOg2CmdsnhtoHQVUxOCz0gE4IwUco6PHB0SEsBlSQyJ5yAJvJ5Mh1
	TvMZ5rAwTBPOPt0EG7Wl20jnXoFyl27OxulJR+ta7HJRnwtUzPn2xupEukHJkLByuCeSYVLPMPo
	YcwLE/Cm0JS58g2D36xSvdrmjsabMaICfN+cAx4rfro15i4Op5un+Q70plR+egexGXHSTM+esH1
	DmQnuIxA1fUinTDQ+4M/yeZETah14JF4k0cCX9CuwsbjY12nLAz9h00RCxg==
X-Received: by 2002:ac8:7602:0:b0:4dc:d94f:d13f with SMTP id d75a77b69052e-4dcd94fd62cmr145860381cf.72.1759215947145;
        Tue, 30 Sep 2025 00:05:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6np5FgFR3yiAoIV4w+0+a5+/kCzcX9eD5vqs8OqsXllqsDXGgjrxwAtZPkSL/3P7NcRUnlQ==
X-Received: by 2002:ac8:7602:0:b0:4dc:d94f:d13f with SMTP id d75a77b69052e-4dcd94fd62cmr145860071cf.72.1759215946624;
        Tue, 30 Sep 2025 00:05:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-587748b15d2sm1648013e87.7.2025.09.30.00.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 00:05:45 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:05:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 03/17] drm/msm/adreno: Common-ize PIPE definitions
Message-ID: <xsgnpvswvkyuxiviv4uyb6pxbpi646fut6dy54kpyfisqrxycz@tyfox3zdi26e>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-3-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-3-73530b0700ed@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=68db814c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ffTnwjXrKXMzwz1Z5d8A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 0ymV1_KOQEt9FjLfuN9vuT2Ri81tjLrY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwNCBTYWx0ZWRfXxVMJC5uDxIuA
 6y1vUzeiFKKTlx8m6axL5QTXQaY198ebjvZFSRQyAcJ6j7CMX34RFCkpziCHBUW4r2v6ZLk5C7c
 ohnhXWy/yDf2Qi6dsB2+E7dPprd0pINC/swB/+j3jAUbjQheE8lboLegfX7pPUX6M1K+gU3MNKT
 JxFop1NOMIRNHSIyOrhHA+Tr3g9qCBiDgjzjem+pF60RyPKc5ZW1qM4T09KPJv5etZuv9NQgcKd
 IMI7KpsU8JhxoEDT13fTXFKMZ6Iwpg+dGF3DcDiwANHsho0vwztzTT4odcl7KZOyv/bdfVuMNyv
 AQm8+5ag7tE7P0nu8QAilorOJSx3YN2qhNCS07vcq6Y11uDHBDwz8UzApEwxeMdxy2nvwYz/vdS
 y5eFB7as+RUZU464ytrSpcVKv5SbBQ==
X-Proofpoint-GUID: 0ymV1_KOQEt9FjLfuN9vuT2Ri81tjLrY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_000549_409064_A22BC310 
X-CRM114-Status: GOOD (  16.22  )
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

On Tue, Sep 30, 2025 at 11:18:08AM +0530, Akhil P Oommen wrote:
> PIPE enum definitions are backward compatible. So move its definition
> to adreno_common.xml.

What do you mean here by 'backward compatible'. Are they going to be
used on a6xx? a5xx? If not, then why do we need to move them?

> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |  10 +-
>  .../gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h  | 412 +++++++++---------
>  .../gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h  | 324 +++++++--------
>  .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  | 462 ++++++++++-----------
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   4 +-
>  .../gpu/drm/msm/registers/adreno/a7xx_enums.xml    |   7 -
>  .../gpu/drm/msm/registers/adreno/adreno_common.xml |  11 +
>  7 files changed, 617 insertions(+), 613 deletions(-)
> 

-- 
With best wishes
Dmitry

