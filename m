Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EF9C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 18:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V6PpfAkChLbMwzHqqroOnb6IX10ZpWIFhKKMDJenfD8=; b=rGXp0rGnk7WCPP
	bLjZYf/ZpL8sTuO0eWPnkmAib8D30+J3hkrh+JX1kpLcHGH3Edrs4QUK9MOz4N4OAJXPA5WTd3bDR
	eU3R0+42F/YhiNbbQIQWevBKbKf9PDZrg5eWMVyX/8wl3SujpJMp5uxtCy2O6ahHIuHReMAbLvjFW
	+6Qd8QbnCg9Psjw2opzxePeaMEv4xDKqWzixQjNHxxoqxBtVYk/vU4AbK8quDiIkqTjhdSGDgVER5
	0rbImNsIVIOB9ZYv/VgvDYZbK8uxu7NmqHKzdNG3xqrShDhdGituWIxGax+RJJSlXKvr6WuEl/ach
	DLNZwfW95O4xRg/vkgIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY7IV-0000000GqCK-1Hov;
	Sat, 05 Jul 2025 18:07:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY7GA-0000000Gq2O-358d
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 18:05:12 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5654mZjD017343
	for <linux-arm-kernel@lists.infradead.org>; Sat, 5 Jul 2025 18:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=V6PpfAkChLbMwzHqqroOnb6IX10ZpWIFhKKMDJenfD8=; b=Uj
	FY4ojF2Ye/5mhZp9iOid/+tD+pwhZVz6wxJ7h0gdl7rcImRU3ka3jIiSOea2/0OK
	2vz6zuVkPLaSN3TogUTjNqD9E+2kD/chZvWsvmAv9jEAInCf6OjqX8g5w9e2tt5T
	qvSxpfXp1KcIizeWrBoIpUY2rd4BWUBpwv90EOehUa2b35t+3eIHiE7XZJ7vCWo0
	FL7dowoggiAgwZe9JFCyOTBr+c6xa8gVoV8Cj1SEYEj9T2DcjHRB/+t2bJWsYQ2T
	Xiqr9cTS+ZNeNDsSWwzOROMcsyTp2fxUDKOpOCExl8soAvJH0xlV7OvLtO4cZ2kE
	b94PUM0kviELH2Dt0C/Q==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pwbd1j2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 18:05:08 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-40b0a248ce8so1492214b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 11:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751738708; x=1752343508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V6PpfAkChLbMwzHqqroOnb6IX10ZpWIFhKKMDJenfD8=;
        b=XFxLj0mU4w+7AicZTjUOCuSzBxBydAIY+i1X9W14feHiSP11gVd4/MTgaRD5nDjWUw
         WPaK0O47qO7Yyh/wrUoolqdxZWSy8tOjHWENIwa3rLtbM9hUHcNUyFLtcwoXv2/UfMkb
         D+e1pAkeyGlrJKrHUIYVX889uAUjGAoIbT4jrH8gnhQLp2DLK6uI5KN0idbUEUlHQL+Y
         oS1Ka6Ob6JYmb5+NdDs4xe5kD6jyJS6YmGDSpn6Rj1tOFeztmsbtEYze+EM+XUUcm8eA
         HXJtGEPlZUBnTlgwB5U35XO480iTimERVy58dtGtI9Yd+OTmyb/aOAO3HWKWRhgqEZWa
         ER2A==
X-Forwarded-Encrypted: i=1; AJvYcCXK3xwolichxy8WM9AXUMMK2cuJ+a2M4+UaZLuEGQ6TmrL79nPCNVNjzY/aK8wT0KyuHRwRGdh5r/+T4PCxM5w8@lists.infradead.org
X-Gm-Message-State: AOJu0YwP4jx2q3yp+ZHBs8RArE3lNbmCWyjRjwAH3V961vhwZKSW5vTb
	tOolb/paobd1bNaPxVPzPWHw96FxFxlq8UgenbuOofZOGyZ3CQhLV/pDuo9JP/tOA5wuwojwpQM
	k/fZkXKLyp5Hewe4A2As0Rh1fI6tGKXaFZatiBkg/EHMC5AdQT4eaalmDhSk4Lieflv1el1eksT
	1MATGTPe670JOv9AK5RG0kpqeWTuQ9m4AHv/Pqk4HV8s0e8iRD7zh8
X-Gm-Gg: ASbGncv9YTffwa7+vmqwkZGzfZVhD35H5pibbnHyYK6OiivuCiXHPMJ16+iP2p5ienQ
	de92nfyq5Gs9jN8fv+CW0WPpAzT8LQPtPPTddrC2RAm+pbfGxywET+gDWvg/H9F2UJfHyM4sHPb
	VTiPffDrzWddvpAAFKtzkDdK4SRe5W+tnIkQs=
X-Received: by 2002:a05:6808:2227:b0:406:67dc:85e5 with SMTP id 5614622812f47-40d073ed168mr4931759b6e.32.1751738707921;
        Sat, 05 Jul 2025 11:05:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA1V6eDhxgL68PhGByEGdZ2yGlPoePdjpJUerLbX2cT9JRZ/ymGxWYtpk/nq8tCGPhn0PxFjOVFmscNcrUN+8=
X-Received: by 2002:a05:6808:2227:b0:406:67dc:85e5 with SMTP id
 5614622812f47-40d073ed168mr4931737b6e.32.1751738707518; Sat, 05 Jul 2025
 11:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
In-Reply-To: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 5 Jul 2025 11:04:56 -0700
X-Gm-Features: Ac12FXxPGf3OtS1hFIiu8JcWUGDwoozM4YEfH5zfdc7rWndBMdlpthog4m8uuIE
Message-ID: <CACSVV03E5QZWuyiejY0BkecQbnLFYCOD2btW962XRJ+n4-KfWQ@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu: disable PRR on SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: DU0zwdNwr2BOQWku8zR9f9Um2zCkKNUW
X-Proofpoint-ORIG-GUID: DU0zwdNwr2BOQWku8zR9f9Um2zCkKNUW
X-Authority-Analysis: v=2.4 cv=e/kGSbp/ c=1 sm=1 tr=0 ts=68696955 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2B00_WpXKG7Y0WWvpoAA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDExOSBTYWx0ZWRfX4ZdgTaa5A82b
 4XQdI4K8EMCof2YpyK8ybDPUeImN85DtxVgrSswV7o1KYF8ZTBFNi8MpRjhdHEcD3Pzy7o8ZLt1
 rH8nH2Q3hYbUni703nlba0jHRDNlSkcbqEG6kl40J7/TlMvRVxNjPtzy/X/pRMrX6t54zKqmpKC
 90mpYvlFL5I0FbZA5gasQGQEtvvoyGLHECyPS9wAGcS6y4ItQQIJx7CFjCMLbESGtAa3PEkSm1n
 OyV+5NbSUalidwbIGMGQbbVEXdc3MQv2U6ZuzSk7RNptiwZMVVM3K6SnaPP89REMZCk8yUv5iWo
 HQiSJtabjPFAVV2mRwdIhp2f0SE+oZ7lrD2iGt7TT+1fe4tVLgWB8lbHIFZDgEIL5CX1qs0Sgzm
 b04boDP/FrmY4GiyaqcMk9zx4oVA+DjHVK4lZkYcvztc6qfIaxDK5iUQYGLYSDSz6WCixo5x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 phishscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_110510_802912_7CE8F963 
X-CRM114-Status: GOOD (  23.93  )
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

On Sat, Jul 5, 2025 at 9:08=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On SM8250 / QRB5165-RB5 using PRR bits resets the device, most likely
> because of the hyp limitations. Disable PRR support on that platform.
>
> Fixes: 7f2ef1bfc758 ("iommu/arm-smmu: Add support for PRR bit setup")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Rob Clark <robin.clark@oss.qualcomm.com>

> ---
> I currently don't have access to other devices from these generations.
> It might be necessary to apply the same workaround to other platforms.
> ---
> Changes in v2:
> - Simplify the workaround as the issue seems to be limited to SM8250
>   only (Rob)
> - Link to v1: https://lore.kernel.org/r/20250705-iommu-fix-prr-v1-1-ef725=
033651c@oss.qualcomm.com
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index 62874b18f6459ad9a8b0542ab81c24e3e745c53d..53d88646476e9f193a6275d9c=
3ee3d084c215362 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -355,7 +355,8 @@ static int qcom_adreno_smmu_init_context(struct arm_s=
mmu_domain *smmu_domain,
>         priv->set_prr_addr =3D NULL;
>
>         if (of_device_is_compatible(np, "qcom,smmu-500") &&
> -                       of_device_is_compatible(np, "qcom,adreno-smmu")) =
{
> +           !of_device_is_compatible(np, "qcom,sm8250-smmu-500") &&
> +           of_device_is_compatible(np, "qcom,adreno-smmu")) {
>                 priv->set_prr_bit =3D qcom_adreno_smmu_set_prr_bit;
>                 priv->set_prr_addr =3D qcom_adreno_smmu_set_prr_addr;
>         }
>
> ---
> base-commit: 7244e36657076b597ac21d118be9c0b0f15fc622
> change-id: 20250705-iommu-fix-prr-600451b1d304
>
> Best regards,
> --
> With best wishes
> Dmitry
>

