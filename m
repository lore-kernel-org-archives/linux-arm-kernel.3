Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECAED78797
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 14:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nVIV8+8i9IBAcMCrmcMQlDivqxxnolWCKEHEXYMOqsE=; b=tfgwjHOlkbTKVj
	2Lj+tmK2pI87cNZBuoudYPabkm0lg96OEMTEIX8GooaoSqCU2SDvKt8p2dRxTH6miwX5A4kdVfWAy
	1LmmgvFZLA7fzyAlV8N/KPdAP7wamvPyPEHBhDQLoLqOvr5Rotnx8gBCOiC50IoeVbnnE5QgS21jC
	5WuBM/J+6ZQSP8JxwdPfJrTw48ctbN+BZiSl2FaSN43T/WcR6C4l+fpvidfINZ6djMk0mbZgwIa5b
	xfPIBW8LH0Lf0XgJulkvAnHfZJqILnC/110QyvthAhjiJaThyCPJ8P0X0Cshdg+Z2q5P8E3ssDSkq
	iYgzQmRxjc7JYMWT9OnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWy3U-0000000Beq9-1wNf;
	Sat, 20 Dec 2025 14:35:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWy3S-0000000BepL-1bGn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 14:35:35 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKEGNlB3984156
	for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Dec 2025 14:35:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=nVIV8+8i9IBAcMCrmcMQlDivqxxnolWCKEHEXYMOqsE=; b=Oi
	S8oV1sQr0SCfWaRhx+ScarzHJ9CFixO6g6R2SCi+IGjAnZyWG0Xt3EpLJL9ChYLe
	MHXLN0kOY/OfWwL9CdQT3iklHSl7AdnXP0SoL0LkkI+C+5fpMmT6d5WY1Mtwz3eq
	OKUYQw46b2umCuwdz4pyKGu8uiYIe2YWUMSo0Iq0/bWb3pB+WUFEwQ4dGg62lK9h
	SAEuknNlBTDm8afn9W3eb/6XJv6ilDUF86pRXUBa1A9h1CbEXyLrvFFpSo+L9cpj
	btK3tlyI2xlpp16rKINQNKhnZDKsMcVddXgGL9C+XfX5RKcVEq8r7yGIc/zlkAQq
	uED7Q7SnezJcho3VooBg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrwrtg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Dec 2025 14:35:32 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7c7599a6f1fso5687024a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Dec 2025 06:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766241332; x=1766846132; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nVIV8+8i9IBAcMCrmcMQlDivqxxnolWCKEHEXYMOqsE=;
        b=OLrmm3QB/Zn6Oyvasc/wJFYmqFtAbaVQByNkPN0tgxGWblVr6G7ft+XQu5dM+hOton
         LYF65den09z6rzKAw3I2CHBcgAawcR044vXq7RliMnZt+Mgp9mT3QXXeJlIoQXs8QSnx
         c03+JYUGz6hpC8c4E2tB8qwRb8r59T7S3USWm1DYJX7za6iKE/GguETJ3Jf98NEkYuhb
         2i39BNSK3eHXAm/8VaHUddi8IBZZd1YQwHAVC3PWjBBZmOcGupfoaYIcGoiGGfBGozeV
         XcMu2SXf8J57/Jlgr7h0JNKrHcq/0oeSOu5uGnLWqcwaZGJBNxzsrqrA3wkU6dRhBSlI
         JXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766241332; x=1766846132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nVIV8+8i9IBAcMCrmcMQlDivqxxnolWCKEHEXYMOqsE=;
        b=FQf42c6B1afKa2PQSMgxbiEeCpWTq/AhSKRrytwM11for4ttH2XEtq1xVgjOuFg1WG
         W3nCr4IEz6atdhMV/dawJ1WAqc6UxdSYiCRJPDBZx+cgMftXH+Eoe0R34IF03yoHRldu
         0YDBscaR2zPImOJS84Pt7MOsLIG1zr0DWfvXSkZf0p4e3PXQPskD9lqJvBES72BmnULh
         SBS33YVeHPsXKofeCFZ9+Zn28K+mc4Down6i8iO/qn61G7oO7LIos3Q13ecA3xma8BbZ
         r3jgzPIMjuG1B1CI4nrl8WB5/DMk/biXhgFium1gwLosNGdC/rR5hkJbccDu6uOqkmzm
         k3Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVBK+a9AcJZEJ8Z/kmbfrIRdcBhZUHk0MKw2QC5k45LRIYjSgrKiyW//QDTFHaVro3ep2W88RWC78F1NhvKiiMl@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgie0txvjob02T4X9iWRC75j4aFf4BmIja+x2aa6pbQAMII74z
	jePPMFA761XVVsmOBHeci8ctsR5TPN6ko5u4mje9hFfcjGfuj91K2FrW41lmIjIWifbhNMIa5BM
	IccFIFMQgJfNJzzxcQSG/NvcWaXHEl/wsPYx18HYM3vn6CZ/oA9oo03SYSiGRDtzLmHSZRTfbIK
	9OZJyMYJGMAFtEqG0nR1a51qcTtk5B8pyBVhisQhWMGV7oaQDZC+LJ
X-Gm-Gg: AY/fxX71YWQ5H/YGgT/H+HGrwkZqgtegDR1ziUXWd5N/J74CPb4vg0Gzaji7XX6jb+b
	Dpa6shWdB58aAjtMSULk96Vv7uRNkyDgdzzydj+2goCgzHXBI1T7sMFVt2KFwuhfzWCUVKIU3Qy
	beeabp1U5PGpiRHggFHZJqRVxPUEihij4C7YSH6mfG50YrSiX4tPnaO8D8pXQXyYxKZw==
X-Received: by 2002:a05:6820:620:b0:65c:fb86:8a8e with SMTP id 006d021491bc7-65d0e9e3b4fmr2653633eaf.36.1766241331788;
        Sat, 20 Dec 2025 06:35:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5f9Oswb5AGw/YcWqe6E/LjV+cryfZc4ZX8N5wV3lQhYf3LKoa7Qr6096gGo82YxZ5rP71Nglxog0ztbh0gVY=
X-Received: by 2002:a05:6820:620:b0:65c:fb86:8a8e with SMTP id
 006d021491bc7-65d0e9e3b4fmr2653623eaf.36.1766241331466; Sat, 20 Dec 2025
 06:35:31 -0800 (PST)
MIME-Version: 1.0
References: <20251219232858.51902-1-ckulkarnilinux@gmail.com>
In-Reply-To: <20251219232858.51902-1-ckulkarnilinux@gmail.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 20 Dec 2025 06:35:20 -0800
X-Gm-Features: AQt7F2rNuD1rxDfBNPPvFwr8n8VKBhpunLeNDkcBRBSvd4Sz7y3v1Whs1F9jQXo
Message-ID: <CACSVV00zVbcwwZss-e52TS=aAfbWKHPGisXAVPB858CgHoNHcA@mail.gmail.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: fix size_t signedness bug in unmap path
To: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        linux-arm-kernel@lists.infradead.org, kch@nvidia.com,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 4fbcUhOzU5MbkMX3ST6_ZI1PfosHewuf
X-Authority-Analysis: v=2.4 cv=R+UO2NRX c=1 sm=1 tr=0 ts=6946b434 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=io7PTiZowPF0Lk_ivWQA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDEyNSBTYWx0ZWRfX70PemQtQxlbu
 FJtU34t4dhpNA3MUN9uLPKOz1lL2j8yZW+uBDl6xHw1Q/Hbdqjzaf0hMJZiXGdAhL7NlYzvw4m0
 iZ9aiyCV8JQTt33Fmm117a6xlynFdXHqv9EQFnXqR/TrL70CmW2xQ+CFVzefp3uGwg7fjVj72gG
 SfwMMltLMZvsJpkUPuDNZ6DVx0ylHdrewFggaZPRFTLomhDX1mnOMhspQ9F/UxUlslAnbjbqPUv
 UNwsVpc5jfnw4pQLOQ/Vw9AyJ6YgtJK6MI4/xf7VzPYOaZd27UsSfQxXutaHDCpNeX9qs3xlRJ3
 KtS+TfE62hdOU8RwiAz/QocbGmJ9yCFX/cJ8fBIRFYGQv0kqzTOGHfOROt0o4LVvxyGRo+x4hEB
 JZpeXzj0iStjyTSNWpbZODi6HYEw5vGScx/eppcWKyoyK4GMLQMKw5y+wLY9lkCvbexv0322G+J
 qEYiTMaClCZ+8woe1ow==
X-Proofpoint-ORIG-GUID: 4fbcUhOzU5MbkMX3ST6_ZI1PfosHewuf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_063534_426221_F8D5460C 
X-CRM114-Status: GOOD (  22.58  )
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

On Fri, Dec 19, 2025 at 3:29=E2=80=AFPM Chaitanya Kulkarni
<ckulkarnilinux@gmail.com> wrote:
>
> __arm_lpae_unmap() returns size_t but was returning -ENOENT (negative
> error code) when encountering an unmapped PTE. Since size_t is unsigned,
> -ENOENT (typically -2) becomes a huge positive value (0xFFFFFFFFFFFFFFFE
> on 64-bit systems).
>
> This corrupted value propagates through the call chain:
>   __arm_lpae_unmap() returns -ENOENT as size_t
>   -> arm_lpae_unmap_pages() returns it
>   -> __iommu_unmap() adds it to iova address
>   -> iommu_pgsize() triggers BUG_ON due to corrupted iova
>
> This can cause IOVA address overflow in __iommu_unmap() loop and
> trigger BUG_ON in iommu_pgsize() from invalid address alignment.
>
> Fix by returning 0 instead of -ENOENT. The WARN_ON already signals
> the error condition, and returning 0 (meaning "nothing unmapped")
> is the correct semantic for size_t return type. This matches the
> behavior of other io-pgtable implementations (io-pgtable-arm-v7s,
> io-pgtable-dart) which return 0 on error conditions.
>
> Fixes: 3318f7b5cefb ("iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()"=
)
> Cc: stable@vger.kernel.org
> Signed-off-by: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>

Reviewed-by: Rob Clark <robin.clark@oss.qualcomm.com>

> ---
>  drivers/iommu/io-pgtable-arm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-ar=
m.c
> index e6626004b323..05d63fe92e43 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -637,7 +637,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgt=
able *data,
>         pte =3D READ_ONCE(*ptep);
>         if (!pte) {
>                 WARN_ON(!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_NO_WARN=
));
> -               return -ENOENT;
> +               return 0;
>         }
>
>         /* If the size matches this level, we're in the right place */
> --
> 2.40.0
>

