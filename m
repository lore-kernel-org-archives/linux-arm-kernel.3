Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E459AC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 17:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LOX59rWqByosVSw0xaHgEnKypfzIaPx5HQ8Gnd0xkM4=; b=helJKjHm+TxkFd
	TRVcdViLaG/ycn2nELSvNEkAQz5Ti+gnWayGJUvUDyZD6K04M4nwf99FiaSn3FcqipIKljXWtWe4r
	p3XbLfj3cqPXDdNASXSQXj3Vsrqhsh2SmSftbPy3DmsYvCIzjtwGRYFLpumI5zqisE7YVqkjHNux2
	JmqOymTXpyEVbPaysVa7mzB3i6XUGypKAIStTMnf15bfhLh34c3KcQ7jwdE3CVxd6ystXcZtRzGZ2
	07NpLpcvME4A8ljcnHmstwiA+If/rEe38QnEBp0lDn1lM73d5eMLLCXZEaYAHCqv4xAj+bSo9qEQo
	OkHConlfaFBjagKJmAyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYT6x-00000000Zeg-0Nzg;
	Sun, 06 Jul 2025 17:25:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYT4d-00000000ZWA-0lDP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 17:22:44 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566GtTcK017217
	for <linux-arm-kernel@lists.infradead.org>; Sun, 6 Jul 2025 17:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=LOX59rWqByosVSw0xaHgEnKypfzIaPx5HQ8Gnd0xkM4=; b=li
	kQLbt6c6JFl9/yDeu0PLNWkpj1eyrRI2PX8dpIt6o13ESNG6kDR5n/TrGkBAq0aa
	oWox/26OrYG0SMncLOX5FVSAYf9rFICArt+ure93zCgQMAy9NHZjkdLmsGTES30f
	nwpQkGZqtDCY6UtkfeWZ7lqg8Lc75TLgeu6EJBqUIgI2O/5KVfUz+Nmc/trADOP9
	uRFxxqvZVDyYsjDz3P4vfvkytM6qRuJy6YSxEEl8wpPMVwl5njIRrHBPP0DN3G74
	Yn5DMZyszkq9PGJXtKWCdG/wiqWMcEFpcV9TAJy62tJzH2UP8q6lSp5sSnhyeUJE
	04OCfiitXFztY1nOanYg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdqdrcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Jul 2025 17:22:41 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-40b99df0c1dso653029b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Jul 2025 10:22:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751822561; x=1752427361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LOX59rWqByosVSw0xaHgEnKypfzIaPx5HQ8Gnd0xkM4=;
        b=rDtI4J2TDS46voCSO+ZjNjYHXmIvh9aoztaFZihng+tIYWiB4Or6hfbKYcf/tR6IQs
         1XP1X3YZwaCAGUD6WnbkR13gmsSPjkBpQXYNcT6+9CxotRq8rJG7Sj66LpfZ/Ac1ujiu
         r+YYEvjK6PPuNsMLYY1YDF5jj+1ybQqID5m+eaeRz0otV6NTqP7hmGkH0LQm97BR219b
         W8VD3s6gRwzMRwX6s6qJbeO9Ecbgq0s0MpqcRjod9DYIKw/UM8COSooWGh0spo3nExl6
         dpMbPMcMsru5xqg7mJwModJedGdCWOITkYECFLnFbLPTTFJbTCI6qy1DoybHYaKKlvnb
         oRzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAeMKtjEPTCER+rNtHxvga/aRdaKMPyovbYplsu2U5gebTFjE4cXTgHqBjw4uzEaAjDZxb2mlRXpUyaxStjPef@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd7BABjWxVmaVugqhiGJvws8vIJxUxbgBwnNvCalMUy733Fdsb
	a0SSfN3IA9gZYfLLaAX6mHVi8Jl3V2I2LFBalCQnTWMDzeBi2qdpGmY3ISInB565UrpA1pISPca
	PKGhUwbLjTLKMXiWO2lZaE5AKd+Q7EStQQpMEJbhzRwZqM9AAMMPF6sBNTSvFuR4YktX4Faq/Qs
	DAt0xa4m7Os83YAbBQ7JhF4LVJ2DKHoCT0SLZ/MwKS3pI/W4RbN3ej
X-Gm-Gg: ASbGnctDiOy2MNz6T4ZzWkxkWjYraOb7wJ/hLXE7l4AhaKqOcrQ8y2cVQxVFxyDuDUK
	uY4I2VaK2U8sgeawQw/YJxUaQWiphdI4YyNMk+Zzt9fX3gzizBO7YqZ53fTQrZLFy/V0OzuqkJ6
	u0kGKd3MQumjIJ5uiPuAqcmPF5MjeUIItGaHI=
X-Received: by 2002:a05:6808:bc9:b0:40b:3816:6637 with SMTP id 5614622812f47-40d04430f90mr7183409b6e.24.1751822561173;
        Sun, 06 Jul 2025 10:22:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRx8YlZAXZI87WKI5wrFWMyyqOATVu6msOEMWXwTOG7myzreBVkUpyGxA8QIeqknVC/HOkS5l0RcGzJOGUVA8=
X-Received: by 2002:a05:6808:bc9:b0:40b:3816:6637 with SMTP id
 5614622812f47-40d04430f90mr7183385b6e.24.1751822560811; Sun, 06 Jul 2025
 10:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
 <c20a9713-6f8d-4c20-a031-dc448404d073@oss.qualcomm.com> <CACSVV02ioJfDyYLj6ASeQwH91n5CGcz+GW0wsupWJaUkJyFmqQ@mail.gmail.com>
 <CAO9ioeX0ffO8-v-mZaefFbyjOcCqGyu++gFjaMkpHPMyVOwE_Q@mail.gmail.com>
In-Reply-To: <CAO9ioeX0ffO8-v-mZaefFbyjOcCqGyu++gFjaMkpHPMyVOwE_Q@mail.gmail.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 6 Jul 2025 10:22:30 -0700
X-Gm-Features: Ac12FXw9ekp3dldeCvMfuxN3qhkGwT6jmeHSunKw3NKlYFi5TZD1Bc0FmrK_Dgs
Message-ID: <CACSVV03JP-jRAJfB0NYNty=VZFVgrYPDkzkg27YYrgJBu1ymxA@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu: disable PRR on SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=686ab0e2 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=N1quPeXg1Wl-6W9anc4A:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: eAlPTA1ZcbEgrS3GxxZjNO3XsKPb65j7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDExMSBTYWx0ZWRfX0ZPK1AMS1AWB
 YLXp5tUpKwEBbk9pDIoVJy3aawuJbr1Toubcc+tRZCx1Q21SPZYV29JgaZsUbJaSI9siG0mP5sX
 gq3rB1FR+m0G6NRfZrBj5vFoARixzyKS6u//+efW8h0p9nnce8fqv9G52rSYZt1zln+IyRguui1
 M1LVVByoiPpvtY5GHULwffCINStSaJADj+lA5V5bCRwkHyAt7nmSapeik22R24iDKsSGGboqzsL
 CikTo/tFVf5fpjgPoOHPztRghRb9+8olEwsiXwG++j4xqHgEJxUIC/RlG2D1a79ygMK+wE/rzmp
 SQyaWr4ZlTpJSMCiPJLF+KtFKy6kGSZ51AccTezOEJtxmR339McjeWP1VXO0wZFIsftCeBSo6G8
 +hj2JJL70CQOYscK8sQGPhanP3PsoZdVxMdApd1XBIOvDLYIFhTLgE0ci6TDAy0//bNlyRdT
X-Proofpoint-GUID: eAlPTA1ZcbEgrS3GxxZjNO3XsKPb65j7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=678 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_102243_338583_59B4E393 
X-CRM114-Status: GOOD (  23.09  )
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

On Sun, Jul 6, 2025 at 9:38=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, 6 Jul 2025 at 18:20, Rob Clark <rob.clark@oss.qualcomm.com> wrote=
:
> >
> > On Sun, Jul 6, 2025 at 7:22=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qual=
comm.com> wrote:
> > >
> > > On 7/5/2025 9:38 PM, Dmitry Baryshkov wrote:
> > > > On SM8250 / QRB5165-RB5 using PRR bits resets the device, most like=
ly
> > > > because of the hyp limitations. Disable PRR support on that platfor=
m.
> > > >
> > > > Fixes: 7f2ef1bfc758 ("iommu/arm-smmu: Add support for PRR bit setup=
")
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > >
> > > Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > >
> > > Unfortunately, there is no way to detect firmware support for PRR saf=
ely
> > > from KMD.
> >
> > I still am a bit curious about whether it is the ACLTR write that
> > trips the fw out (doubtful, since we write other bits in that reg
> > AFAICT) or the PRR_CFG_LADDR/UADDR write that does it.
>
> Indeed, write to ACTLR seems to go through, writes (or reads) to
> PRR_CFG_[LU]ADDR cause a reset.

ok, that is what I suspected.. I think if we can somehow figure out
what the inaccessible LADDR/UADDR values are, we can come up with a
reserved-region workaround

BR,
-R

> > In the latter
> > case we could potentially use a reserved-region for the PRR page,
> > instead of dynamically allocating it (if we knew what values are in
> > LADDR/UADDR.. I guess 0x0?) to avoid reduced vk functionality on these
> > devices.  AFAIU the vk extensions that depend on PRR are required for
> > vkd3d.
>
>
> --
> With best wishes
> Dmitry

