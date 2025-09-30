Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5490ECAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 07:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NJKkBSbx/8tqEG8xyEV6jB7VZnVlHiCHJaTcMaV3vdw=; b=juwYkE8sFBj/Eh
	x76qk7TSah/+9UWuawNgM7FW0xzRBrBV7RByctDcm5skc6PiTNSdCvGi37nSRju4ylyxSTGHbPKY7
	eHRSrKjcgLD1nCyQ6iOVeOpCv466NU+AY24aI08mfotFW47ufzEKmRoADrWhgpnEGQ58DczXPF4Wc
	LE5jSoR/pwYE0wiqLDMgYMLihmt4keLjNUrN0N/M3dvZbMUKo/NeQ6iWqPzihXbJx61DqthSZTaoX
	igBwbHmadqCAHL/wQ7J/rVZ0awL1hpiUUwmrUV1luyF60eC441sharoYb+1orEX1p17TDS4dkxbVL
	xxTioHyNDA0CGLXZmx+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3UkX-00000004UQt-3uXg;
	Tue, 30 Sep 2025 07:26:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3UkV-00000004UOy-0C6K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 07:26:12 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HRCN016878
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 07:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=NJKkBSbx/8tqEG8xyEV6jB7VZnVlHiCHJaTcMaV3vdw=; b=Ak
	/DaJwBmKTwW3xCru1IZ19Bx3qchaFKy4WY9jpPbNbKcGYQGlfHSvI1ZU9YSbT3wT
	jKnXCp3NLSNDeM+BZ8pwNUCAspsTnZ013ZmAumkXntu9a9E4uP/YeCo3GMkMoVcX
	3ujKXRjRN145HCmZjr//WUOyVhVhw3zS9iUCVt12OgRpA0KdnL2zzYuu1X/YMzUU
	OZ8SNVNBNZA/Zu2+fPQC+v8XVuoDRRKh1//bL4vbEP+ZI/rNXFJt59TRICLQ3l+c
	j63z0V475fTu89lVoQYzJnJp1gwlC7MlRVNpsTk+PlYXsH2rvYb3FVgadwqeDuS+
	vyKEUcBKULsUZ5PPUA+w==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hft65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 07:26:10 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-33450d89acaso9456597fac.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 00:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759217169; x=1759821969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NJKkBSbx/8tqEG8xyEV6jB7VZnVlHiCHJaTcMaV3vdw=;
        b=Yrxne4qQt3D71cSjdbhraLQd7jeOXKTpHrnbDpKsudAaJW9F5ld0XQc9mfH29QIxIF
         eHI7iRjolTQe3gCG/t92IczVMr1TOxQjTbmyKL3H3+9+1NAXR/r58m5vaDJJI4QkyaCj
         B3ACjyCituIumLEGqedyZq0L8fig/SiZGLGd0IpBvsUYulW6WCGCUtkg2ZZCaWnn/Pqq
         y5TkW1Jo4odwIgY7qbV1fGG+eb8NJ3JCPjG2wUG6Y+u8fIRbqGPPBHZAmBWfkJSHMI5p
         zKqVbi4LeNHMtHyoYXj44+bqht3QCrCl/MZ674+iYhGfDo7w9VRjOP5GZmFvnjfKFznl
         1/Kg==
X-Forwarded-Encrypted: i=1; AJvYcCU+EL9EHayu0DAdzTWcoeMJpJtvAmUFFu5EfOtdUVyey4JXUYeqZZFvLwrRUrnBAjdlrwUq+BwuuV22WRcJAvEe@lists.infradead.org
X-Gm-Message-State: AOJu0YyBUYCLLABD7jN7R6pEsCP+9zZN47m69GN8wH+hkdU6CMQV5ocM
	awbHFEg/GHquLqcvscU4aL40GH34PYghWmyAOYgxHVLyqcw9Y0je705bMtlIG3VtgAXUiNZ5ulu
	jqxizmEBWf0U2VCLqZJVSbEApQg2WyZlMSbpBMt258DePTDJvcM9l9qBCfTVA7tTyIppf3Ky4fk
	lmhjOJAkFgFNGFJ4o+plg7h69iCl7ew40PBv7yXxvTxOmMARtWUH8a
X-Gm-Gg: ASbGnctsKUw+pEahNO6OBtICqxTHr5cvmi0Gj4kvWVOiW8S89tIhsZVyWOADqvgSwp2
	vSaMp757+jTj5yofP8zISMUZtMX1QAbIkaqn1CuRHOKh4rL4O74GkxKxLOs+KVZObdefkg8b28Q
	KLtjdEBlZwd+lPJwHLPRLdRIFcI7yOnfVBNETVH4sCZwIOd1edFPQ+OVI=
X-Received: by 2002:a05:6870:e08f:b0:31a:70c0:d498 with SMTP id 586e51a60fabf-38cadf744d7mr1710002fac.2.1759217168977;
        Tue, 30 Sep 2025 00:26:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpcV7QCeOoB82oAsfyshYDoFlRPDZXQ5WvKfJlIGOQR9mFN5O4/G07y/zEQHyHa3AJYBNUcaNtfqPGXVCGfxk=
X-Received: by 2002:a05:6870:e08f:b0:31a:70c0:d498 with SMTP id
 586e51a60fabf-38cadf744d7mr1709930fac.2.1759217166525; Tue, 30 Sep 2025
 00:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-3-73530b0700ed@oss.qualcomm.com> <xsgnpvswvkyuxiviv4uyb6pxbpi646fut6dy54kpyfisqrxycz@tyfox3zdi26e>
In-Reply-To: <xsgnpvswvkyuxiviv4uyb6pxbpi646fut6dy54kpyfisqrxycz@tyfox3zdi26e>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 00:25:55 -0700
X-Gm-Features: AS18NWACYkWNYimh8t14gY4Dmrp_AbVsBXT_pDvjcLAcFBgJJlOrGd5Fr1oHJ8o
Message-ID: <CACSVV011=_szCPbdm6YA8aJjm76r_BZP9QFeOzcAGCvqUUTebg@mail.gmail.com>
Subject: Re: [PATCH 03/17] drm/msm/adreno: Common-ize PIPE definitions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX42twO6Xq0Pwu
 pat124kL/i848jeJG6tXc42PeWJLvfrpIhsYcSKup4obPlhyjfdZTwtoEcqxIEHmS3pa4MgB7uF
 /eB8gc58OBjCz/8aLMQbEF6nPn1O98c9Gg3XKHlXTy5gSQQKwHrktl6nV4bmVxEz5239wC4sX/m
 CdjCF4X4g52QTCgRKWT6ISPK9v28+xIDiyyguTVrv3houKzuGrfQEEab1qKiquKwNHS43JEx/z/
 ElU/p6uuMowc/RJnUPFhs8RJkEbGOKsYS2jT6fS7IWr9acmGMlcS13k4GKkPGo9lGUC8dnqNJ6S
 S5essJVd+G7ls1HkKL4ov/jaGyoXV1Y2OZMYdUXQRzZYgBvF/asBt3ckoV4JrD8fIP58yZUivTO
 TSVeKKTHIV2OHGIwVSvyshs+vgV3tg==
X-Proofpoint-GUID: y9Y8gXEILtMSvMw1WauoqHgy-quRT7OA
X-Proofpoint-ORIG-GUID: y9Y8gXEILtMSvMw1WauoqHgy-quRT7OA
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68db8612 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=2l_kmpBevnkUXydlazsA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1011 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_002611_130300_8459114D 
X-CRM114-Status: GOOD (  18.29  )
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
Reply-To: rob.clark@oss.qualcomm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Sep 30, 2025 at 12:05=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Sep 30, 2025 at 11:18:08AM +0530, Akhil P Oommen wrote:
> > PIPE enum definitions are backward compatible. So move its definition
> > to adreno_common.xml.
>
> What do you mean here by 'backward compatible'. Are they going to be
> used on a6xx? a5xx? If not, then why do we need to move them?

Newer gen's introduce pipe enums which do not exist on older gens, but
the numeric values do not conflict.  Ie. each gen is a superset of the
previous.

BR,
-R

> >
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |  10 +-
> >  .../gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h  | 412 +++++++++----=
-----
> >  .../gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h  | 324 +++++++------=
--
> >  .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  | 462 ++++++++++---=
--------
> >  drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   4 +-
> >  .../gpu/drm/msm/registers/adreno/a7xx_enums.xml    |   7 -
> >  .../gpu/drm/msm/registers/adreno/adreno_common.xml |  11 +
> >  7 files changed, 617 insertions(+), 613 deletions(-)
> >
>
> --
> With best wishes
> Dmitry

