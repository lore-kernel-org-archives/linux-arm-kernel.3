Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25B6FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 10:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8AKTk28XPgJmHgqTSTU5AnTp0W1XYNRTdTpAHvwrNYg=; b=AzIqJAT8330B0zSssNYF74xoNe
	zO0INofQSU4ZaOq02VabArznrSDao9a3oyvpwVbHMRU/1ud1Dczophl6qItC7jj1mSBVFjI0PejEI
	knYhAjt8TYmItkCTSW1nZa5t2w0kHPySnRJVazu1OrYOWYyQj7EMrJ9VKySZR4r7qxABdpxrg7glY
	h0xfNezK3ZE6YTu0fOJCx9QeIHsIuDSgJGHIS5KjKerYj+LMd+E5mt6UKZby8SlbMhDExIZvmdtNr
	U2g4Y1clV+ZK1n+Ibgl80yMYi83X4TEBm7fWJbXzUG2oN7rzIDPucpR5E2wSHGnOYQf8MIk8f6kON
	WuGfR6Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfeM-00000001AQx-3HQq;
	Tue, 28 Apr 2026 10:26:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfeJ-00000001AQS-457G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 10:26:41 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S4nGWd2006215
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 10:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8AKTk28XPgJmHgqTSTU5AnTp
	0W1XYNRTdTpAHvwrNYg=; b=YMMegQ668LEBrBOIEPSpxiHMdZHKjnAZZ01kAiDK
	gxa2BK0fXSjtCdulMe4phiAww/17ADVuCjN9ZR5zUdwsg19tcMCL2Lalj3fWPhWG
	QB5nnQm640JyEYHlouiXUncixpvPgufeoDa52cWw1mRKjcnV1qaCHN6C2OFm/vyW
	glS1dTWoHRFSlktcG0s2GQYFQtbkQyX2ppSqtGoYRZxzGR5OfLud0k4YFaBxiE6T
	0XvWktlI4l6EbRRJuzQC6kVAeeyOnB3bMzhcgwjKgZL3Uft188IrFbIaNGzqtp54
	BsSpt6FnDiIEtgK38rPaFoPTFXh2mr5eauicSAlGB/HOOQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7gkmmnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 10:26:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e5a336b44so149413271cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 03:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777371998; x=1777976798; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8AKTk28XPgJmHgqTSTU5AnTp0W1XYNRTdTpAHvwrNYg=;
        b=Ti3MUijR/ZuWsZr7CctKz+Bbz6mhpb6j4u4Regv8y6hlKsT35OxFYSSJMENfxOjQfc
         Q7kY2c9QnSh+0QSOZQUyffWl+yGTsaWBBVD5BzjQvN6nwlrbjLTlygqDB7o1hSmcQIjL
         JJkwsGbweno1QR6mFPrx57T0FM8kTh4jJAOiH0qitlf0sSOMPzoAe9og0p7eoiiCOZg2
         eXqTSkZV6zC4OiBNTNWrB1pkTep1ciFwA65fWQGou21Yi+aK1/i4SxdKkalIBMhR4NXg
         Da6k+dqL07KCuQ378JpCNbOLLdxomirpwjeidaCVyZ13M0q63pvwZlqseDvx7CegXWj2
         Uv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777371998; x=1777976798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8AKTk28XPgJmHgqTSTU5AnTp0W1XYNRTdTpAHvwrNYg=;
        b=P9SZVL3uWf24mswGgi7skWNr3LuSh4Q7s8I0DgmlDez7XCz4iHQeoA9I0cZgnuWC3g
         xkknojMeFpf10WkmFjV75TQYgRa/d+2GhgwhXF4raq7hmEAL9Xnm1tpVoUwbyEnBeHfD
         cqZr2NVvYsCYSJM0QWNfqH2gNDFKttPIXlp0lqOXd2pJoufpL1DsxYbOIudkw2H0lP0L
         wdqju0hNkoUXGj7b/gXDFl7IpwzVo5IfYxA2606rBXTm/3O3y53sccvshBYezcTnP5dF
         Y65GXdFZlYdVvX8lLXF4bxZXaeMKIvxuSE6dNRrl2dr7uVn8ts71ZZOTTZvw4d9Wee+t
         YNRA==
X-Forwarded-Encrypted: i=1; AFNElJ9CefbrFRXL38EtjKUpmb+p8tVDgf5EQ/iPpL64SYBkLsqr7Lr5NnnXxSe6VvWU4jmIBaOhEcI3WEit1xrjVBK7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/bkAPgx869boox+o3Kx7Ftm/gTl7FcCL9e5VW+cOimGHhKGSY
	25WSGSWNB/IChWK6ezEsYdipclg5deFByhApOS1lOqYS3109txw02SSdazJDIICG1WEg6xCuVWY
	awRQFJto8/5NIdjEYId+s63yU6G9amxF2CAFpAgM9kEeMIf+ox+f2P9pU6JvKYFF9sO1MJx8UZJ
	Z1eQ==
X-Gm-Gg: AeBDievKzOSTcq215fObr/HfvQoKMj3U8KG1yIQCZe2pC0vufVB1imT8zvjK1a/KJxn
	XVLxxeTmC9wVxzSEtbPZC5vAq2yaCwiyqckpu3RzUdzCuucuXgBdQSRgZng+Ulird97PK78NK2Q
	8+LqGEpMXPW86rQ8Ox/IGgInruf5QW4WBksbBTJX/kjnFSw71r1ZJp+7b9CKUXzGJfX+oDsEzhp
	l7DFQxLPK8Ku6RejguvO76KxAE7yfFIDaRH3yFWVAFYY8MYNd2Hs+5U5WFuH4OIRDtWmN0AJwz+
	ehL8tRvoTGJ6REftL0nfkuBIE5Uom6li+cOeOfdokkZRJ1TCkE6/wBncjzl/5HhkD7t1Brlx9KO
	wrdeVtiq/HKrGKdzCJ9y7kwcvAxQ65kDwh0N490Qu5szhFczwrbg8UK6U9YiUOtdAuSkD0xs/7n
	gxUH0cYq6aBuVDbQE0yaSVeAUF1MCO6EX2C71h/viaVoZ4Vg==
X-Received: by 2002:a05:622a:d06:b0:50b:8b8c:f68b with SMTP id d75a77b69052e-5100da87a60mr25743831cf.39.1777371998218;
        Tue, 28 Apr 2026 03:26:38 -0700 (PDT)
X-Received: by 2002:a05:622a:d06:b0:50b:8b8c:f68b with SMTP id d75a77b69052e-5100da87a60mr25743581cf.39.1777371997776;
        Tue, 28 Apr 2026 03:26:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7463f5e38sm510022e87.52.2026.04.28.03.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 03:26:36 -0700 (PDT)
Date: Tue, 28 Apr 2026 13:26:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Lokanadha M R <lokanadha.r@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Add glymur MDSS to ACTLR client
 table
Message-ID: <rlm5shkccrpbijkuhrkp6evmfwxfsvlifhpmw4utnjryqtgm7s@tv6wyksenaji>
References: <20260428-add_glymur_mdss_compatible-v1-1-8416df5a26f4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-add_glymur_mdss_compatible-v1-1-8416df5a26f4@oss.qualcomm.com>
X-Proofpoint-GUID: QGP_cWot4m6q451dxWyzLzvjbig2JBhk
X-Proofpoint-ORIG-GUID: QGP_cWot4m6q451dxWyzLzvjbig2JBhk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA5MyBTYWx0ZWRfXyDgZcAtj+ASD
 +QJFiV6OBhw1x0vQBFsCOp4m/2r9nHJpTx+FJIgU6MGPWzEyXPAGHusxQLLmWf3Y0mrkgqzqSQR
 SGUoAUb9syYc8Jm1x9BP/o4lkSDyVB7jUP8FMXg5oKyFWmLRXMWfwBGw8ZLTey94fI3GW1U989k
 qGatDhXtxmU9+X1JCxVUaPUg9RtHNL004nccvgG5vIVyLdvwQg0omw/78oVIhNULp14PAn4XDrd
 Z7taViXDNA8Qf8z78igU27k8D6yKqd3reGnz1PUpXVSjp0VV4HPFm1K1VjIzexBMjrlfQDSfDbh
 hnHN62m3rTWMQT/LCcNfNNzrMmvClGAv+cdP7lD+IwzctOYRG7HxRgkZapIDr4RRJX4z8Xu7r3q
 Szm3oo8Opmj21d9Wih3diuDtBYhzMM+/BpgK5HTYyp3OJ+/ejyCuHuBlgSZjrgI9aVEGoSaR35F
 XWFb/uMY2yUYmyX41SQ==
X-Authority-Analysis: v=2.4 cv=bJsm5v+Z c=1 sm=1 tr=0 ts=69f08b5e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=WvJH3o8hvjs2AAOsRaEA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_032640_149939_2BC845A6 
X-CRM114-Status: GOOD (  16.69  )
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

On Tue, Apr 28, 2026 at 03:13:50PM +0530, Lokanadha M R wrote:
> Add qcom,glymur-mdss to the qcom_smmu_actlr_client_of_match[]
> table to configure the SMMU-500 context bank for the display
> subsystem (MDSS) on the Glymur platform.
> 
> The settings disable the next-page prefetcher while keeping
> macro TLB caching enabled. Without this entry,
> qcom_smmu_set_actlr_dev() finds no match for the glymur MDSS
> device and leaves the context bank ACTLR at its reset value.
> 
> Signed-off-by: Lokanadha M R <lokanadha.r@oss.qualcomm.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

