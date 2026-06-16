Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657FBCD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 00:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXLr0N/URsCJyix68R2sWZbi19vCcQkgs1ZPrv1rgMQ=; b=P0qgh9c4jxJh0RjAQO/Gm5uipS
	cQgm5PqJnU2vXsZlq+t8+nh7dH7RdooYQub/xEVFyb4GhJqW5fd+ZStMe8S8bOGLzgcWmo13t23Pv
	fFniOMAQGEt4TR4olUQXfVaQ+x4ZYv2akIJBsIc3AlhsFnnHX4gzkON61EV/MbxRiU5iMmn71Jyrq
	txrZNl9nm2jc5GTrLAzzlOtWKDagy+q5G/BxO+fzrimDRolZSON5HGYGJM6/mL7KufIMw+Au/fbu1
	dyTtW2x3/OWqa2asuF+BWHk4B5RPTZoiOFy29jVak+MmyQoO32Q758so7ra8jW6yd+TMdEUbqoY4s
	GWd4k4qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHYh-0000000F0kd-3yNE;
	Tue, 16 Jun 2026 00:21:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHYe-0000000F0kJ-1mhm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 00:21:38 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJ1Ekv1219935
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 00:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GXLr0N/URsCJyix68R2sWZbi
	19vCcQkgs1ZPrv1rgMQ=; b=kMsLiSYEp9iBn67MtLPyXoWPNsPEFlHZO+BdwhrA
	qy+3q7g9tD/1zMOwwgtudHOJVMJkhR5tZIfgbgiaOZ2inkDi5e+91fKKoSH8fm60
	C9O2pBzWonVoZ2EaMlFmlgUhjXFrR8lvryhGycQOR1eebJYd6utn+4PniDxeaT7z
	obzFMwPOVKnqg0PMtfWy6EB6XguX7z0TYz0BI5meFyjlRI/v6/IwoubpMzOkd5Un
	HKEIx8VE5uflNsoOqYj9IXFAyvzSMfmuPCbVwmoSW8xA8O4pabO1qIQTrqv/1ij+
	jjGIgq00g2rQo1Ig1y0EAZBlQjnkIdQYhGB++9bM1c6d6Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etevx3r9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 00:21:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915d3261c5cso816792885a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 17:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781569295; x=1782174095; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GXLr0N/URsCJyix68R2sWZbi19vCcQkgs1ZPrv1rgMQ=;
        b=DDn3jcgzY4jguU6T8/cxK6AMgCXQ/HtgOdSl3xT+LEwsWPKhZr7ZwZprRnvYacoGTJ
         9sxO1MBCQ5/SC5tAcLC3SPpftA5+Zu46dCGQd889q3kRizGeoTwKAoq+D0oysrQR+2E0
         XoRJHW6giII2yFugjNXLqB7n3jNP+2CCuWw3uoYeJ/ayk0PwyWjduCZLurCuDCltp2ZN
         6/YYenZZ29t7s7iZps9cBFNVpsP9yBqN3LHSI0qPola9Ekmq1KpnUNIdOT5MtxZzwPad
         UKf6dEV5d8YdSHTCMxYIvJhnDz2gPXyK4uYJK/jAiHMVQUzsoL3eKXz7Itirx6DLl3Jq
         G96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781569295; x=1782174095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GXLr0N/URsCJyix68R2sWZbi19vCcQkgs1ZPrv1rgMQ=;
        b=RE1RPM0XXFkKe/Uh1+ZFVi4cpo18x9cS9MS8E3/7uXN0S5uVm41EVSFrdxfUvVTFc4
         4c55BpeFYiC495ieqRAd6bT4vaNMEqR9y5m8EILTEi8fh1nM3OSgo71fq0Uq7GKfcNhN
         1RhHzNKiu9+aOhTxyMxlDULg4eU/d/fC0SnGOd0CHgupitnH5Rej0qTfjm+tMbfGAynm
         b07dQbsJeLVe5/0lwtnfZNyf47ML5oAUvA47SQ/gV6YnT6oNE8181mbk76pG7PzYwyb1
         PLa+SF7MAa+U9t4IqgI5lrNzEy7AyZLGE24KJQix15lpDD0L1Z8C/sd84G3kBCixNfPZ
         Xr3g==
X-Forwarded-Encrypted: i=1; AFNElJ+V8X3C+RzOjaowa9DK4sOEhiAD1JwIdf+CZqCVMhTCgdpwrP06S5HO+Sl2VtKbDeLIVmmY+08T9V/JXftHbNKh@lists.infradead.org
X-Gm-Message-State: AOJu0YzNciHJU4tqusXcEdURJ33PBJze/WXLmkrXNAxNgqYn7Jud9eIv
	Jvhzm9IzNBE5FUUDCOdjXV/eLxMkM+GWlAHN1QJ2pudXfnKdB6xWEZS3nhZsWAhzH/Kh7gxsPAI
	RoGV9soMHiMZDifZMENjPGol7MQD8YfG5BMekOkLB5Aj6F4NncidG5uNZHz8ibloPG6nNqO10at
	00vQ==
X-Gm-Gg: Acq92OGvi/XUYttzP8P5lM+xVRy/OlHaGq4MP51nm4n5tgTSGL7a5u6X78Ju4YahSwX
	LusuA/9PgFrddmAr7cd+yndMdVn/c3rEsJS3b6i9fQ46P43ceFQbh053vLqU9/Bykhd9YwjMQGi
	3IXSS1m5cDCD4UDWRZ3ARY7/YEL60WX+dW8xbvRPX1wqXcTRcasiliWivD6kZ4Mr49YXYuVCvb8
	zNAweW4cQJvduSF6uG+647ZPufd4ZXem6QqtG71Iwd4mOP11ecKzvgD5AawYcm2PW0kA60RiQ1F
	dz0WMrJEX57NADCU80hoouck17rMdz8BteNC/YANPe4dgpCtivgYgosUdljxx6cQLvEFv9kwqnF
	L5knveLjPDAsevvmIzgcqN+tnKcqIySEZZ5JfF/ANr0+MvSYGTng3oYMaD23KTCimsp/gqb+rLt
	zjDRC9tUstJ9ALoby3v4125yO/S+RhX2HYG0U=
X-Received: by 2002:a05:620a:2728:b0:915:a457:bf94 with SMTP id af79cd13be357-91c48262296mr197856185a.48.1781569294765;
        Mon, 15 Jun 2026 17:21:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2728:b0:915:a457:bf94 with SMTP id af79cd13be357-91c48262296mr197853385a.48.1781569294305;
        Mon, 15 Jun 2026 17:21:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c05abc0sm2661311fa.14.2026.06.15.17.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:21:32 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:21:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
Message-ID: <sdm7sqiokmsgczeat2mxch42ois5rwabav6c5fm7abct2xoepf@j3kraqrjvpoc>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
 <7xfxlxfqjcqdzl6gckaoyy2ioefglc7bgi66yv5khrbl6fi2zc@ivtiukdaj4jv>
 <d25f24ca-5bb3-4276-ac8f-8340e8fb4ce8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d25f24ca-5bb3-4276-ac8f-8340e8fb4ce8@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: a-SqjyjG0K_ODock5lw6Ae5T9uEst-z3
X-Proofpoint-GUID: a-SqjyjG0K_ODock5lw6Ae5T9uEst-z3
X-Authority-Analysis: v=2.4 cv=f8t4wuyM c=1 sm=1 tr=0 ts=6a30970f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ak52lZM5eA1PxQ1fx0cA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMSBTYWx0ZWRfXzkkRzTOGJVWY
 CCHGcXbsM8WGDyzIinaI3oTw5wFoKM9K+BwY0bxoXlk0IigYKR2nuzsBCyDz4WPXUDSHV0JHkWr
 Pok90JmAQoguOE94xmmYZLrcCUzu6JY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMSBTYWx0ZWRfX8uyy97EeW4XM
 Dv1R0ooufNzr0S6snufBnZdtbqZAmyuuUx5ULF4ngiUoBUmG7U4q7YCyeeeV16HaXece9IcL2fs
 e5u7EZOy29YVq1HwCTYN5Ary+x8tBwj5Gtdfgq6V7vpP2ezc1nOXxH/RklPgTBIYMSIpdr2aC0R
 tSAfqdCjAOhDr4SMgfRsx6WaqRQTDveG196UMouvmF2TFAx6QVY4YviqqlRVHzcTZsbo/q4b5Sb
 F9PU6KHM44Y+vDkC8Fbt6QM0u9KsV48JUbroD/uKyefxRPkPuLxFupUiobxlNEVHCbSEO1fRiku
 K9+bxXiCvetzHZUeozYG/gzIpT98Us+h+C3OaeJDu2zcPXJrGQpIB9IIUJXO7z0uXa69yma5vUy
 +9YjiuOqWnesYwy1jbA1ij6Vcz9fyfyNbZNwQwG+P+6d5/DRt4KJtgp1uMtsKUJfW49Y5VMpoci
 JU9YHo1MkIfjxOQNIKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_172136_580492_3F99D10E 
X-CRM114-Status: GOOD (  38.50  )
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

On Mon, Jun 15, 2026 at 06:36:51PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 6/8/2026 7:25 PM, Dmitry Baryshkov wrote:
> > On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
> > > On some SoCs the SMMU registers require an active interconnect
> > > bandwidth vote to be accessible. While other clients typically
> > > satisfy this requirement implicitly, certain corner cases (e.g.
> > > during sleep/wakeup transitions) can leave the SMMU without a
> > > vote, causing intermittent register access failures.
> > > 
> > > Add support for an optional interconnect path to the arm-smmu
> > > driver and vote for bandwidth while the SMMU is active. The path
> > > is acquired from DT if present and ignored otherwise.
> > > 
> > > The bandwidth vote is enabled before accessing SMMU registers
> > > during probe and runtime resume, and released during runtime
> > > suspend and on error paths.
> > > 
> > > Generally, from an architectural perspective, GEM_NOC and DDR are
> > > expected to have an active vote whenever the adreno_smmu block is
> > > powered on. In most common use cases, this requirement is implicitly
> > > satisfied because other GPU-related clients (for example, the GMU
> > > device) already hold a GEM_NOC vote when adreno_smmu is enabled.
> > > 
> > > However, there are certain corner cases, such as during sleep/wakeup
> > > transitions, where the GEM_NOC vote can be removed before adreno_smmu
> > > is powered down. If adreno_smmu is then accessed while the interconnect
> > > vote is missing, it can lead to the observed failures. Because of the
> > > precise ordering involved, this scenario is difficult to reproduce
> > > consistently.
> > > (also GDSC is involved in adreno usecases can have an independent vote)
> > > 
> > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > ---
> > >   drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
> > >   drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
> > >   2 files changed, 57 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > @@ -53,6 +53,11 @@
> > >   #define MSI_IOVA_BASE			0x8000000
> > >   #define MSI_IOVA_LENGTH			0x100000
> > > +/* Interconnect bandwidth vote values for the SMMU register access path */
> > > +#define ARM_SMMU_ICC_AVG_BW		0
> > > +#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
> > 
> > totally random numbers, which might be different for non-Qualcomm platform.
> > 
> 
> Ideally, any non-zero value would be enough to keep the path active.

This is true for Qualcomm devices. However, you are adding this to a
generic code.

> Here 1 Would be enough to keep the path active, but might be too small to
> reliably keep the bus active.
> Other is UINT_MAX, which will reliably keep the bus active but might cause a
> power penalty.
> 
> #define ARM_SMMU_ICC_PEAK_BW_HIGH	UINT_MAX
> 
> seems to be suitable here to reliably keep the bus active by BCM
> for both Qualcomm and non-Qualcomm platforms (with some power penalty).
> 
> LMK, if you feel otherwise.

Shift it to the qcom instance or provide platform-specific values? (My
preference would be towards the first solution).

> 
> 
> > > +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
> > > +
> > >   static int force_stage;
> > >   module_param(force_stage, int, S_IRUGO);
> > >   MODULE_PARM_DESC(force_stage,

-- 
With best wishes
Dmitry

