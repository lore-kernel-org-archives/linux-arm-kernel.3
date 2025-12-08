Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC08D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 22:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QKgt0p9I3O54Kz1mH4zj4pykAx2/kdfGcwbFjdAZiZ0=; b=NdxMACU7dmrJgoOpFAAdIdvBbP
	yNqlK7kykyff952RZHXH35qX/OHiYr6Jvq68O4CA9/LufAEG+9DSqAiFJcBnhTafKY7wDQdzlPnLj
	+7WDfcZ7tEkykX81EXBFa2+MTSwWCBLO+UoWjv+poANQx753ij6KXWgghMZ+qwo8RTTulVTLEmVMj
	WbWXWJKGYqQY2WdsKqBs18fqvNkIGZ/GJIN8TPR42cEdkeNSY4sUvHBIHOKOeeHUkTMJ0cNAkQTjk
	SX54Z4SfkGG2d1fyLi1LCGGapmMjGyaAUIPbT8OrKK5VlwPG94wkW4/El3LGn6y5BhDTfIcG3eV6D
	oc8Rr/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSkC6-0000000Dbif-3pK8;
	Mon, 08 Dec 2025 22:59:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSkC4-0000000DbiI-0lnH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 22:59:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8IceLg459746
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Dec 2025 22:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QKgt0p9I3O54Kz1mH4zj4pyk
	Ax2/kdfGcwbFjdAZiZ0=; b=pW0VgkT19csft4GkapYGtQPH1xVoQ/5SnK1kKGOd
	psj/XuYI5TUSHIcY9lbdfjplkj7z21pBmpU4fz6umAL3GifURF/BCQzQCtDSDTlr
	fAguo4UdZ4/cqDSajFbUMd/KizyRPoXt55G+rTe+u2dznqWjALL4x8us0tlo1ecX
	ZqY24vI9cizWyEt/E42iVlf02WA1NDTpvdxEIMsWNqkcPzF7FoZbwhK6x4gYdyZS
	Crp0qks0w9XxRDEGso0raop4sKfrDQ2DRSAUekUe+GCSUW+0yBeXO01aa314cdSJ
	r+cw2K8y6rmAz+U5TmwgiVMuIwZ6mPQ95l7fmuBrMyNW6Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awwgmhyft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 22:58:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-343daf0f488so4897871a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 14:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765234738; x=1765839538; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QKgt0p9I3O54Kz1mH4zj4pykAx2/kdfGcwbFjdAZiZ0=;
        b=EB9c/Ait5pESVMqaRCIQAh3w04r1MVsdou2QXDT0f6eOkfqNkGKG9IkVsgXkOFvjdS
         Ks+5DHy59T3B9meO2oyWxOR0RdkwdPD3wQMKw9mJRt/BmLTfaXHBqCm+N3p7/BcV/jms
         Zg2Ze8rZ64T/nqtbZu+fyx53RNrGFX3xWaz82OAyEKfSapB9aqXLFYgO06XnjGCZeSGv
         yxK8Wf6M0tFyPekNBxM9787mlmlWIQ+O1LYSa31P0L19BJg3wAnoJ1g9HnhFwNui18wD
         w7eJbnwZZJ5ZaGISBXuKDlS4IU+UpkglY3MFopNqrmMiajbCWSdCCBKPgv+irFdwpalX
         x72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765234738; x=1765839538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKgt0p9I3O54Kz1mH4zj4pykAx2/kdfGcwbFjdAZiZ0=;
        b=vV9bB8l5ptcffOgviK+DKfz9/4FmGo2nGsjRdQCg1ZS4/aPcZNNGMi/4mZ9HNjtRPx
         qJuf6yJ/MdtdMgAvKZ/Cy2WVFm7iY4aBSkL6QLbTPUjVyvXjA3pxQu+OGpoD8pNZsthN
         RgUuPsEzcXvxW3VhJP2Ias2pFUL0bxL9KnRUVworIbeOChquK2DODkP8hCtQJIkBEC+v
         idzpw7JECWxLRfRs06qj2yRGcdGasCSnyYUoKNGelkr5m7gCKMK7zR4SR/VjQJUV1+8W
         xa8OJWrTiomI/4tmDoKeOqoTeqz0xg+sbE3VItjS2ai/HJxTK/d3GmpLODabwSFbbB9w
         SKoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOoAlyE3A74vaE8Qk9wFK44yDaDVfAXjyiVqOIOZ0uoE9+C9PrkpAiFQj0M350jT5IKs2XnYOVA3CaBYZS/2lu@lists.infradead.org
X-Gm-Message-State: AOJu0Yz983GytZGNncSd3KmLhvByW1UowhxweTh06ebeDuCACxS48URc
	ycZTJrBYpSS6HLmSyf5J0KJSOIQGqTZh40UqI+csGyLAinfYTMGBTjvEKis7PJkoihXI0m/EnBX
	Zf6t4tEa9aQxrC+++QJR8qg5goChla7BageIm08quQulj2QHd57ZabSLoJBKwGrwiVESJ8LD7xD
	aHrX3atNKoeplvKkAWGsARXcfR1P+PmJZeVcr3vZNhM8ruzPtjIVJM
X-Gm-Gg: ASbGncvGqoj6EVkGph+TS4T7+AoWPtRSqYenUZCs3hf6Y+iHBDGkoHZ8ZKyc+8/6Lmx
	aefheLlxs7JrH5WNeFPlHj3bzPUEykZiMmcxAcSgt9NfPvMwjauUlYKVmFtEqeFDaXUL5eRn0kQ
	GfM2Ws3QdtV655cxpjbkgAMkLwdAkE8XF/OtFoYXmCx5qNF/e/+Ev7PrfMLSd8A6mWXhelJlYw5
	SVdurla
X-Received: by 2002:a17:90b:2691:b0:33b:bf8d:6172 with SMTP id 98e67ed59e1d1-349a26c2cadmr6800347a91.34.1765234737925;
        Mon, 08 Dec 2025 14:58:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+R13fCWlinwEbgpGmZPHyMFonury49ULZGv3kNILl7FaYcIst8UAk1P4CrxofUscq6obPPfCKjTY63VAOxS0=
X-Received: by 2002:a17:90b:2691:b0:33b:bf8d:6172 with SMTP id
 98e67ed59e1d1-349a26c2cadmr6800335a91.34.1765234737428; Mon, 08 Dec 2025
 14:58:57 -0800 (PST)
MIME-Version: 1.0
References: <20251202125447.2102658-1-charan.kalla@oss.qualcomm.com>
 <gsjyj3arwoqcjln6nlmyhohlowyvkwqmxppdq5y7c3m4khoyq3@npzixjpibh5g> <0bcd5a92-5213-4862-9a31-8ea539b1b72c@oss.qualcomm.com>
In-Reply-To: <0bcd5a92-5213-4862-9a31-8ea539b1b72c@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 00:58:51 +0200
X-Gm-Features: AQt7F2qiksWXfb4QJZZD1j7gIWBPQusAazA7cTt2NoYXOiNgNKUjwRXhyxvLVwY
Message-ID: <CAO9ioeW0fafwRnxvDJ7yHGcQYbgfkfRF1BMTpXpG=8tSKRptdw@mail.gmail.com>
Subject: Re: [PATCH V4] iommu/arm-smmu: add actlr settings for mdss on
 Qualcomm platforms
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
        will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=RtnI7SmK c=1 sm=1 tr=0 ts=69375832 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jas2bIbCv71b3E4NwwIA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: hqKD_BPLUKEd1-ncJoUm2RVXK9gZ0LzJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDE5NSBTYWx0ZWRfX/uIVjKZ4LHjx
 7AK9Nxq0Bgoi45am2vQTbt5U5OD0tdHu2aun1o7XtqrB24HnYsdelrMg6Hwx3zVQbzKkY+kh0Ml
 ue6wUlUhcNUdGTsNRnBXPTsVi3jiF1407LBbNWRlgZGK8FREnWSB8FULziezo3wUFH2TmoqYjIM
 2dUAFg386IrWMCIrh7YaBlKKm4LAIx5MB2cLF30dZjG+Ld2hcLJgTNvjpxeok+KE9/SernJf+cG
 wRGUe6SnVu+B5eJwr5ce28B6AMvElUuMynu+34fh0Eq2qyLOSGs0t+qW4ybVYcow0JJ4wNMA7Rl
 6AVRYMxil1eXSat3+5zWrLTcP/wky2XLOosppdjHCNc8FBFny9sjfwp0M0b69wJ9jiJJ4EV3w7h
 v9IvU1H6/NF0iwAHB4FWK4ZmRdQB3g==
X-Proofpoint-GUID: hqKD_BPLUKEd1-ncJoUm2RVXK9gZ0LzJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080195
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_145900_240900_7DF43FC4 
X-CRM114-Status: GOOD (  29.05  )
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

On Mon, 8 Dec 2025 at 21:28, Bibek Kumar Patro
<bibek.patro@oss.qualcomm.com> wrote:
>
>
>
> On 12/6/2025 2:36 AM, Bjorn Andersson wrote:
> > On Tue, Dec 02, 2025 at 06:24:47PM +0530, Charan Teja Kalla wrote:
> >
> > Based on the other changes to this file, the subject prefix should be
> > "iommu/arm-smmu-qcom:"
> >
>
> Sure Bjorn, I will address this in v4 RESEND and collect all reviewed-by
> tags.
> Let me know if you feel this change needs a revision update to v5
> instead of v4-RESEND.

RESEND means that there were no changes to the patches. If you've
changed anything, it is a next iteration.

>
> Thanks & regards,
> Bibek
>
> > Regards,
> > Bjorn
> >
> >> Add ACTLR settings for missing MDSS devices on Qualcomm platforms.
> >>
> >> These are QoS settings and are specific to per SoC thus different
> >> settings, eg: some have shallow prefetch while others have no
> >> prefetch.
> >>
> >> Aswell, this prefetch feature is not implemented for all the
> >> platforms, capturing to those are implemented to the best of my
> >> knowledge.
> >>
> >> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> >> ---
> >> Changes from V3:
> >>   1) Add actlr setting for missing sc8180x & sm6115.
> >>   2) Improved commit message.
> >> https://lore.kernel.org/all/20251124171030.323989-1-charan.kalla@oss.qualcomm.com/
> >>
> >> Changes from V2:
> >>   1) Add actlr settings for all the mdss devices on Qualcomm platforms.
> >>   2) Improved the commit message that explain why different ACTLR
> >>      settings
> >> https://lore.kernel.org/lkml/20251118171822.3539062-1-charan.kalla@oss.qualcomm.com/#t
> >>
> >> Changes from V1:
> >>    1) Added actlr setting only for MDSS and dropped for fastrpc. --
> >> konrad
> >>    2) ACTLR table is updated per alphanumeric order -- konrad
> >>    https://lore.kernel.org/all/20251105075307.1658329-1-charan.kalla@oss.qualcomm.com/
> >>
> >>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 26 ++++++++++++++++++++++
> >>   1 file changed, 26 insertions(+)
> >>
> >> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >> index c21a401c71eb..149da53091de 100644
> >> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >> @@ -41,12 +41,38 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
> >>                      .data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> >>      { .compatible = "qcom,fastrpc",
> >>                      .data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> >> +    { .compatible = "qcom,qcm2290-mdss",
> >> +                    .data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> >>      { .compatible = "qcom,sc7280-mdss",
> >>                      .data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> >>      { .compatible = "qcom,sc7280-venus",
> >>                      .data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> >> +    { .compatible = "qcom,sc8180x-mdss",
> >> +                    .data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> >> +    { .compatible = "qcom,sc8280xp-mdss",
> >> +                    .data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> >> +    { .compatible = "qcom,sm6115-mdss",
> >> +                    .data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> >> +    { .compatible = "qcom,sm6125-mdss",
> >> +                    .data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> >> +    { .compatible = "qcom,sm6350-mdss",
> >> +                    .data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> >> +    { .compatible = "qcom,sm8150-mdss",
> >> +                    .data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> >> +    { .compatible = "qcom,sm8250-mdss",
> >> +                    .data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> >> +    { .compatible = "qcom,sm8350-mdss",
> >> +                    .data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> >> +    { .compatible = "qcom,sm8450-mdss",
> >> +                    .data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> >>      { .compatible = "qcom,sm8550-mdss",
> >>                      .data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> >> +    { .compatible = "qcom,sm8650-mdss",
> >> +                    .data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> >> +    { .compatible = "qcom,sm8750-mdss",
> >> +                    .data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> >> +    { .compatible = "qcom,x1e80100-mdss",
> >> +                    .data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> >>      { }
> >>   };
> >>
> >> --
> >> 2.34.1
> >>
> >>
>


-- 
With best wishes
Dmitry

