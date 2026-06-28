Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC714C43327
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 22:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DBiYvBC1dJo0dJZFGs5nOgphH0zzbBFmjSIO8xEAr8w=; b=ggFsXjzYeAr1U1MSUw6gFwfEdr
	MBeoxQz5GhwBbU8ov9ts/Y87ij+0Wg9aZSWY1kOZBI5ZOsXG7XexxL2a4fK8VSLDml65h/mTP/T+L
	U69m0GnRV20NBSvMi4su0f1IOEopfnPZ8e2kQwjiTtDSMmYhtNYHETGfxe8LRBn+Cpb7wa7+uIbh/
	LpACHZqtIpIcHiIr4xlh9MJkOqZIT9fptoooag4vhaUIm6dQOi5T3wT4HsGNaI7TQHerOob+fozuM
	uvYCSqimS09pCnG7Iv/H7vWSumRn1jgjVGr22nzSEmheWzc8byI/Meyd3BiS4R5tVUuAVCuerwjCY
	LnlCgwbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyNv-0000000DSwc-3aCM;
	Sun, 28 Jun 2026 22:53:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdyNt-0000000DSvw-2w8t
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 22:53:54 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SM94oS986175
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 22:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DBiYvBC1dJo0dJZFGs5nOgph
	H0zzbBFmjSIO8xEAr8w=; b=OgyRgftVx1LaUcLi7CbJ7X+EZmlttu6Nb5pxO3lb
	bJxsyhC9uxJQ04+QS2kRlpajNDb9m4gH0QjapQJdq2qE6nVwiOB6X0zNtRXWlzma
	vWBJ0+4UJsdlNq9A0a3q/R4DnN9sdF9OTspNoY+YILH/qzGxJ00Asq+jHUwNg0wU
	A8h1FMaS4ZLgpg46LK8NIe5XrA5WME7QOg+ojudFi67tCYWtxW4LeLc4714YbGq0
	mnm4n6UGdIim4r7n11O2Pp4ewPyScXWYY7zA0BUMHc8egGF2VeNj5W48pJ6K0C1N
	QcsyKoyri5JcB30vf4R2Ar6b3SbXVXuDOOV+lwQfu2Cu5A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8kskn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 22:53:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92229624a71so507805685a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 15:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782687232; x=1783292032; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DBiYvBC1dJo0dJZFGs5nOgphH0zzbBFmjSIO8xEAr8w=;
        b=OdixcVFpJPnzDCrR3srJ5uBw4Ujv2COtX9HNU06lcqaux41zQ33Phpkq181q8jdXlz
         3KIZTdp/uP3eA3y8yxPagvsWzZr2AFYY7SW9wSibmAluMO+0UcrAmzk/SAZBTGS9xdW0
         FJ734SNfH2gV5UPuQoHbvrkqUOkl4fL4nllO6uJ+VJ5ldeM5XK/KPKUnmpd02+Ah9fRH
         ywzgqb7F9Lw01jl3ulyWQO2UiNJqhzsHr4CbKJrmltlVx68Pq39IqoqLN5T0+OVJWU1s
         qlCFbsREjUeAYUj3Rwacx3OXQE0VsZ1WVGwhfY1wmGGff/SMlbdcFtsFi8AewEHTnhMD
         EbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782687232; x=1783292032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DBiYvBC1dJo0dJZFGs5nOgphH0zzbBFmjSIO8xEAr8w=;
        b=XjMkkJLX3Jb/ZTQY+eH/0+PaYAmiNgXyRDMtGs6C7pw6C4nlZNnIrlzG96ZP9t9TBq
         XYqBU+qjZAyGm971S6s+JUBssj9HJSSZRFUS0lcV3Fj/w46Thbsk3SxV4vGT2/KpGiIy
         siPfqxTLzpPaYLW9Y6px1IinvnXhDNVtcbZ9FTyTOVnXROr1hPKuECtA+eMvGzZV1Con
         GWWKw3PoazWeVNFdWr2TuKmSttaHpD5jbhMDGyk26MqtsbSWMIi4je28avG6luwL9/l3
         CRX4M83/AJfdeCoRCEt/YCBgAD10nRQGsAoedbCVeIq3djyPcbKn2VH/OA+o15jqWGES
         m0zw==
X-Forwarded-Encrypted: i=1; AFNElJ8Sc8C2c4iUA3+PRla5WLrsM5kHTdp/jRPf6vGLJWhtGZ4QxSLK3Rrjafom4l96BERqxDXEQKTtbtx2QrFYmSF4@lists.infradead.org
X-Gm-Message-State: AOJu0YwTHb7ia/i5MbWvZnsNJzm4VsICdkVFY1qTxyMWuTClcu3yGloC
	OGyivfre5MchH7mmlj2Gcy30kfdWMXSkD/2vxexsh/vOHQdsGx8pv+ps66RvkLMKU5LaPat/eLj
	VpMRjslIIXgofO8WMd/rr/4GhPqeWIi88oCnbloPVX2/s7yjLYkC3iexp6XDo4cpMExyI20s4hz
	ll5w==
X-Gm-Gg: AfdE7cn1cUKRT2VM+qrsSVe4s3yLNt25cjEIsPwEU0BMFDlGVt3CMZfgIsoy+X6ktgL
	qI5NeEd4XdDM3PP0+vTZ7NDUv27THQlhdyM1JCQTJJutJqonCPzLdSqvcRcpSvrB8yzqEM+mPiC
	tDHSfZqN3nsHPzsjJBjOiyy38sVtnwNXrnmirVYa/THIPuxsJhgeNdg7OHHM2pqKvpGRzaOEIeY
	lakTdHy3pMFwxDoyq/yKs6kL8HDTuuEgqJdb+bqQqsRp7YpBTQO6CaPSOzhOPgJHP1hrED6XYtr
	pFQmRitZSe9eFJOdLzO3otI+ki1bg1z1cJrTE76/VPfjTB1vQSZo3frexXY0kxl+PkcuQm5MlOF
	lvu+Z6PHNnXEK2t14Vga/zpeeNLLHb2Gs6SOJcqSAgtRpPp1DPyDyVhVKtHVdqOpVagq+vyhdg/
	Iy6PlJ/OTdqFqS7LxcLH8ag1WL
X-Received: by 2002:a05:620a:4405:b0:92c:3086:6d50 with SMTP id af79cd13be357-92c308679b7mr1003117185a.2.1782687232134;
        Sun, 28 Jun 2026 15:53:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4405:b0:92c:3086:6d50 with SMTP id af79cd13be357-92c308679b7mr1003112185a.2.1782687231656;
        Sun, 28 Jun 2026 15:53:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b134fb1f7sm360941fa.5.2026.06.28.15.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 15:53:49 -0700 (PDT)
Date: Mon, 29 Jun 2026 01:53:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aditya Sherawat <asherawa@qti.qualcomm.com>
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: shikra-cqs-evk: Enable A704 GPU
Message-ID: <2e7wfaejgbapxhmlxqne4rtxzcuyhijxns5su2kcr6k2do4c7l@3zdmkrtik4iy>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
 <20260628-shikra-gpu-v3-7-9b28a3b167e1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-shikra-gpu-v3-7-9b28a3b167e1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDIwNyBTYWx0ZWRfX2zGj+cymrz+U
 D2O5yRhui4F1knLC4HyzcprsyT/TSg+meLbiOQ9M+quybf5RS7kiqckbCTAsnOVsCnequVWskL0
 yzEOdZJzPm6B5xT2LyKvePo6+J/x9R4=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a41a600 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: B2czEifNlmjqMC6necRG-89snyhC7dJe
X-Proofpoint-ORIG-GUID: B2czEifNlmjqMC6necRG-89snyhC7dJe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDIwNyBTYWx0ZWRfX8zOSQMjT66VP
 o8TyyntsJsk5o1zP1hFtcZWCQkiClob1Jy58QkT5eD1fdUuA8js6s3tP4+WqoFtEGf6/U4oT9eL
 +N5ZnKGRo1pRgoDbbjHlArsTiIiF7YcpqiRFqxtHUMqob0pVYtV92yv4NisgqrqBGGEBZaXrZfU
 b9Su3CtPDAQ0nWCLzvBytTvACLTkfuCxneknIQndiNMjFecaUl6BfCr6OqpYKUfzsxm4KNyV+Hs
 WRyJUR/TniZoSS/s9dKJS+Xee7HdjkYP853C1MrVDqiQjcnsBY0O8YmXKeUaDyzY73+aMdmnKYn
 5hPopuvJrFtp9e1wiYQqX0xN8iAplRgSnwB6cVM/shkxc+u/VBgvGSbYKYHei6zhbqIwReLXCnD
 2p+VgcRWfc1Wgq5qhqFgbsY+P7+sNkTOizIBTVXSEctE042GuidCRvpYX5I0UuV3VlqG+IrnKv7
 bsDbpMmHB6QeRYaOZ+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_155353_851909_F23582DF 
X-CRM114-Status: GOOD (  14.40  )
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

On Sun, Jun 28, 2026 at 11:54:00PM +0530, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Enable the A704 GPU and configure its zap-shader firmware on the
> Shikra CQS EVK board.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

