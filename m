Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5487EC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 12:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZotZ3xHhfhh4lvvQ7TJQUuGKxRSsnI9jOw2Piwhfm9Y=; b=ccnTlE78OvFRT0GsgXsrlGViot
	t2tR5u5nYSnZW4if+8+I1c10FuWVhwq5RhGlIm9Al/vdvkx7mSqh1EC8ZacXZ5nwIGEvnlkkyoU+J
	SJDt9rTQ5NzQ9TG43yTWCTqCE31XMeo+VpJzROKo2Nc+Hma6KE6atgbBtdNBRSgMg4pZB7o3Qly11
	o3IcM1FFR2Q9FdfV9QKLMyTtxnBc5Xrbl+yEHMAItFOWcFESCc+oYU0I9avHqSRc+rQJZrn1MokmZ
	RJ2o4+AkQf3GPLxqrLslcMb0jja97or+QG/GM77BRaPFjiqcnywYS1D255d/HduS9u80TxADMQi2s
	ZXf6TUVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlpE-0000000E2fr-2odB;
	Tue, 11 Aug 2026 12:43:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlpB-0000000E2er-2QyR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 12:43:23 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BCRF3E939633
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 12:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZotZ3xHhfhh4lvvQ7TJQUuGK
	xRSsnI9jOw2Piwhfm9Y=; b=N5hVmZtW+cloo3ZaTcxV54OSrmISf1IYQocQFzT6
	doIAgBsnFOKnAsrJRfoBbiBSVDP6erJQzK6Ja1zHkLNyYfBCwDNiUPAoT4HCX751
	m9qGH8bgibeXa6bceVFmtR48ODuhZ2m/0OeQbd4gQdNMqlUf6qSQYce1ga6a7OQQ
	wL+2ZLDgcCAtcrHNBEKXe7Xw6EPhCkqoGao0emQ5MWKMxztcyrsLGV3heWV4pgUx
	4Fxm5OAW8R0na9SUXxdI36UQQwwulQImZuPS5kU3lA1vbpIudMH4/xKlE8LvPKTV
	ydXlUVrVjumegq0G6IUDfbtotacgRpjGfjQYajXaaZ1OCQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjyfv0r4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 12:43:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0199faafso35389431cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 05:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786452199; x=1787056999; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZotZ3xHhfhh4lvvQ7TJQUuGKxRSsnI9jOw2Piwhfm9Y=;
        b=QD4pptQPLp7ThIeNQFg66BCJLDd6lrXTgTVe8jgLZdtrYSsMbV7ZGNwQaJYWJp4cLo
         ttdXzbrAt7VfT7xg3bfcjWPTpxplVZu4Ss+/lJXVYpD6T2p6U9LXquMH0MhhKaGud+BW
         7boZoThg6NSjkfKp4dH5xyoWZ1WE+h2BjFG3UxIDCE6O4AJ8FYlFqgO91qemv0Wmfj9N
         cD+bOVQCLV7KEffx0FkjmTI7GDhGZT+AvMzMq2rDavYbkorSCiwVZyfA8+Dz4a0486k0
         WLJQPWI2V6QDi6lwrf0bNNbSQPvKtjeoD26T/X0X3Iqrj5GcWW6CqeKs7Vs6eV3azJw/
         s1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786452199; x=1787056999;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZotZ3xHhfhh4lvvQ7TJQUuGKxRSsnI9jOw2Piwhfm9Y=;
        b=fzB6zmlgQiWa7I1daihtuAdNGaV5c0j7D1TelOp2z0Zg8pZeyWr8FBsb2G2f44AyVF
         ZLml3SkjVSROaJ1mDh4s1q0lBxyLsymNKpnOlmQdoOe9zNeZ90S0O0ozOgIdA+AaPLfK
         YdOohnJTcaJrwrhlZE35AGeJoxGYxl65It+0fYzfjj7Ct/ULnWhbXZUKD2+UmDnIET4E
         GIF0F0me9AjQDuZHvWmo5TEVq63To0UVydYHzQW6vlal3gy+qEsjw84x/YmbFLV4HE2R
         7TQ/kT7FWqYOkgVXcM7el103sjB9KEL4eDoWxprWzbWzmIrvAr5B6r17eSrqH+RRVg9k
         GLOA==
X-Forwarded-Encrypted: i=1; AHgh+RpY0B/BJi63s94hk3BqyUex5QJBz80fwbjBnPpX6ddAVTJdIcuysPLbr8uXkEjpaVna1dzU3AJVEgLq6t4jddow@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0Iy50l9VNNIigPhhC1vCpOvTIChSxg/7Osm4DPfa55Km7fCp6
	iJ8O7xmXb3BDzgHFS0oJwdaPxeX6CUKq5N8XaiCNdOOgEu4eukXu6M+3Wkwa40jcaAWwP1LZY0W
	4acW3RJ/WQHOIhkufVkFAfkp64aapHQneMtt9Qwq/rQQigdZy00ofEW06rp250s4epgePIfx2bP
	2E6bE+sohMZQ==
X-Gm-Gg: AR+sD12fSEsNV3C8cb0+f+dzyELXtIuYFLcN84CUv9ezSIZtVnU27VOr11FufTDeotP
	y83g3Et0hpmH+2NzRTfjsQ5JEvnrKHWBK1f+hV2zEdHtJL9qIrtdH2mpRHVDojUlIxsySBqi1Yh
	eJHxItcAGf3s4jiVW/GosnF/A38rXrVtFraWZ0kqr72gwNVBQ4aBHPdtPAEyKJHjiJsgBX1Afup
	tYYjjPRcYTkyAm+vjkPeAWq6f3GWkS6s+7Ub/k7mZxxusacP3gOmD2/ofqiG0Hwf50xDKqeBgia
	GiX+lg8PZxo8fWokhI7ZmrfAmVjAy1PSmoH2abMlAF3q+nhMM7uqyujBDMJuqOU5O3khGGzb4ah
	BH0fg7DBqV3AW2ChLC6hWe9YxXTyKFA07efyfavHj9RGFgXjOZqVgMANPt7CkMcX2pMAPseRcAl
	emkS+2w5M6amf6hw==
X-Received: by 2002:a05:622a:544b:b0:51c:73f:e3a7 with SMTP id d75a77b69052e-52d585e2be2mr24810301cf.26.1786452199508;
        Tue, 11 Aug 2026 05:43:19 -0700 (PDT)
X-Received: by 2002:a05:622a:544b:b0:51c:73f:e3a7 with SMTP id d75a77b69052e-52d585e2be2mr24809341cf.26.1786452198937;
        Tue, 11 Aug 2026 05:43:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a0fa3bd115sm2187991fa.9.2026.08.11.05.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:43:17 -0700 (PDT)
Date: Tue, 11 Aug 2026 15:43:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/12] iommu: qcom_iommu: implement support for instances
 on MSM8974
Message-ID: <iv5radfllym2bjvkrdu4ffs25bqixyos7k3ymncpcdtc2uobn2@zlhsybrj3pwz>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <DKL6P7G0WTM7.UJ6KZERQZDFK@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKL6P7G0WTM7.UJ6KZERQZDFK@fairphone.com>
X-Proofpoint-ORIG-GUID: 5rsrRk8N_F0SuBcjqOJ3P0pG15lWDF0L
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEwNiBTYWx0ZWRfX0D74mr81mGm0
 K+4t5osVGJcuJ9cGDfd65dVvNUcoG31w66XCyywFFTo8z1QRIVJ0+kKfh0YtL4Raq3fp+uDdnfy
 sZeeqACvR7V82L8pOAURDaEJR58XSMo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEwNiBTYWx0ZWRfX9whsymcHK1+A
 3cxhwoGwpvDpHrog70fYdJdop5p7HLrdz1esmzoyhqPg3OlCXNouScneECcS3wrMznaA68nOUAO
 bqLixFy1AfNpb0T/LGJUmS89gejCUy9a07upiqk8fWAr1V6Ugqr+pnwVvDESWgC3lCiaaXx5M+w
 yr8/WdE611Wz53+Am2ycxfRercDRfFnMM8r+Zj4ihtXGh7II0tVbmnnxEi36OW4sf7gq2qICJ3P
 ZYxOQRVgUz0MQEmU/RFmTDSM8Rf+9t+jZHsVUwejR8H2JtAAGW/gjeZb3WubeYJjsLjcuDEHvPr
 Y7HTBN3YVfULr9a+9EEb/c9/nMwFj5q3iOiiTSe1lAnC3Ml1EhDVUU1CsNYP/cnmJeHo+J54M7a
 MxGiImWDnIwV69ZWvtFguBX3EIoizuKimg+DXpjWbHks+aonLGmuTO11MbSa92qrfbCDZPUk3eD
 l1m+51xCn2DKENjjtZw==
X-Proofpoint-GUID: 5rsrRk8N_F0SuBcjqOJ3P0pG15lWDF0L
X-Authority-Analysis: v=2.4 cv=Zd4t8MVA c=1 sm=1 tr=0 ts=6a7b18e8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=X4WPEW2F6xLIBrl7kOIA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_054321_741325_3E45F9A8 
X-CRM114-Status: GOOD (  26.45  )
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

On Mon, Aug 10, 2026 at 12:16:19PM +0200, Luca Weiss wrote:
> Hi Dmitry,
> 
> Many thanks for working on this and sending this patch series!
> 
> On Sun Aug 9, 2026 at 10:15 PM CEST, Dmitry Baryshkov wrote:
> > Qualcomm MSM8974 platform has five SMMU instances, used by display, GPU,
> > Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1
> > spec, however they differ from other Qualcomm platforms in the
> > implementation-specific registers and also in interaction with TZ.
> > Venus, MDP and VFE SMMUs are secured and require programming only of
> > CBs, while GPU and JPEG require full programming.
> >
> > This series skips IOMMUs which can't be tested right now (VFE and JPEG),
> > and adds only MDP, GPU and Venus (although untested, it is required for
> > display to work) SMMU instances.
> 
> I do have a patch series (sent years ago to the mailing lists as well)
> for CAMSS so I can definitely test this in the future.

Ok, let's land these first, unless VFE IOMMU blocks display on your
platform (Venus was blocking display on APQ8074 DragonBoard).

> > Note, to get display to work properly one fix is necessary, [1]
> >
> > [1] https://patch.msgid.link/20260809-msm8974-mmcc-fix-v1-1-50f2dcf18d2e@oss.qualcomm.com
> 
> I've applied this series on v7.2-rc7, with the extra commits between
> that and linux-next for qcom_iommu.c backported so that your series
> applies without conflicts.
> 
> So far I'm stuck with the GPU not being able to probe, adding some
> printk's shows that in msm_iommu_new() the call for
> iommu_attach_device() is failing.
> 
> [    5.971154] msm_mdp fd900100.display-controller: failed to load adreno gpu
> [    5.972991] msm_mdp fd900100.display-controller: failed to bind fdb00000.gpu (ops a3xx_ops [msm]): -16
> [    5.974073] msm_mdp fd900100.display-controller: adev bind failed: -16
> [    5.974152] panel-s6d6fa1 fd922800.dsi.0: error -EBUSY: Failed to attach to DSI host
> [    5.974230] panel-s6d6fa1 fd922800.dsi.0: probe with driver panel-s6d6fa1 failed with error -16

See the patch [1], it's picked up for 7.3


[1] https://lore.kernel.org/r/20260730-fix-qcom-smmu-v2-3-18e0daf2d836@oss.qualcomm.com

> 
> ~ # dmesg | grep iommu
> [    0.127014] iommu: Default domain type: Translated
> [    0.127052] iommu: DMA domain TLB invalidation policy: strict mode
> [    0.739899] platform fdb00000.gpu: Adding to iommu group 0
> [    0.741358] qcom-iommu fdc84000.iommu: iommu sec: pgtable size: 90112
> [    6.006877] platform fd900100.display-controller: Adding to iommu group 1
> 
> Have you seen any issues like this?

-- 
With best wishes
Dmitry

