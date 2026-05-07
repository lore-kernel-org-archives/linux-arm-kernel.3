Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693C0CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 14:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ITASyWtze482haPnIkil8QJ16Tn75RV5cHgG/8SP38Y=; b=gi89JVUrPYSIN5
	RKkWYf6EU2+HgHIsA6q6MXUR6WqKVkFw1jLw6WhzpIT5O2JwUljNLmwaOCd4e/Vv6yXXRflic1p2V
	103Irh5BFaetw4FU8GDEsZuDbSSj8FWqRpbqIBf6fBX6NEnRex18+xvFG1GxSyzMA2tfwCmSshgmc
	x4E5uTVcqn1fbzEDrik1wrsd7yJ/a32IUgurbZIh3sJ1SP5AItm3ojEINT97wb57U6ySvCmKS3Rh7
	NUNC+YSTea1u2PDzRSxwqohJjEep79gEL/iS5DttnE+tKScrREk237ZNxkcjK/tTI+ta7HnuNpRHf
	N+xSlwQtSDt8UfBmwxOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzSc-000000041Qb-2J6r;
	Thu, 07 May 2026 14:12:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzSZ-000000041Q5-3Fe9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 14:12:17 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64799a3Z3464696
	for <linux-arm-kernel@lists.infradead.org>; Thu, 7 May 2026 14:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=ITASyWtze482haPnIkil8QJ16Tn75RV5cHgG/8SP38Y=; b=mw
	hIjCFlAADRB4EQu1PsxvhkWXj++PDxFddKi6BpOGlPqm+c5q/K8g11sZFroe0kbA
	aLrzZ2+uMMMUBqCf2r+2WTpPqU6zZAbASifDUhuwoX/BTXLMlIJ1aHwNxR4xCLJx
	qOAB+OUj3nnAoftesJdhTkB9eWwrjqRoaXGwmQBTh/4CUlZbXNn114DxPvzlgcJe
	uBKuanjqJrU+boda+TdeP+K72lHPUzAXCKW1cmPUc7O/OjbGLc7HzsaQaPAD7YoD
	4oh0n4Epu3NHDkaQwggX4BRSGC1yOQIC7iVdCfDta3ZxXZPjPY1RULUznlqLGIqj
	eDD3tWAKscsCJ74DQXwA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn2emk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 14:12:14 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-696266291d6so886111eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 07:12:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778163134; cv=none;
        d=google.com; s=arc-20240605;
        b=UGRCd6FFSWl1X37+xBi1UDCqyd9LH6Qps/T9QOLxuMayy9qaCxpmSHb4AfNmKoGLyX
         sUc39ErsLtYTGHO6Cl5VF5C8DQRWWd2zktNhkgu++TGsiMJhxdaHyaV1zgnPmrF7UVKO
         UEzR/VbYVlqMX1fDoQWEQzros7h1PoVOfh6XohOEhEMgY1FdfS5OkV9OHfnzsD3x5MBv
         NNb7JqnG92lXVA1iHtNv1twYm9EkH39ANqnkzR1Q6C6a8h56OPUvecHRB9Ke+dpB6H1a
         5zz7tHj8U/LbNEo+qNJfMqMbwuWPuz40qWAjxp5N0kTM+mUjLd9h6KV5cOdlcAnFVsji
         /8KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=ITASyWtze482haPnIkil8QJ16Tn75RV5cHgG/8SP38Y=;
        fh=A00BXjZ73BccUcjuV3M0pxWAIwYWumekl937cPLX7G8=;
        b=lX1N8+uy+ZAkwBC1Wsz4nWNsEqCqSSVNFOC2PC/WWwM4R+/mYCObaUDDRLgSpIqDRA
         Ta8rOwQKlH+ombEIjDMeoFxmvNNgcypHj4uKJDYG28o4JeNPhK3QOfWzdLqqxaU0550G
         irXfsh312V6A9XHMMcozpoZwpL8DAwCpt3TJPYFZ0PUdO7nhqtcYdDJ0gDlXTQdTq95A
         jZX64I1/azyk38wEqlim+RiE+nDe8aANqAiS/PDys2cU/HJzArU5lFU9DYPCWcU0V9Zw
         TS+566angv8ckPTwlB/9SrZ85Jg5hr8IqCR9qRPwUUjsVKLoFKJEdY2f1N4m+LgVzCgV
         TfHA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778163134; x=1778767934; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ITASyWtze482haPnIkil8QJ16Tn75RV5cHgG/8SP38Y=;
        b=TFD9/FhXofCoGFgHaDi4/N6Y546qu2yPFD3SDc1vMjqo6UC83mA0Q8vE9juOFQQvOG
         roeIK8cmblRcvOt9m08eMuC5AEC6WYeoL1NRIXptpdcpNe+TxgqbXrORggYaB3RD7PQI
         vucVmGNKA99O9W9EGym2S1gFIHFo+SAKHZPJEGohLIXG30swh1BHXpJDq0pxcqUssjG5
         t+Qxwg/Wv7I/i3THOAMuh7ZSJPRT+pDMdC2P8JR2k3zSuUa2lL7t1xr38y3b5t0iWkg7
         RaE442myGpqbcRBCTHiqSgdLT6xdoLyY1AEEAhZ+Qj4lpblaO5a9go6My29o/iHf39KN
         L0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778163134; x=1778767934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ITASyWtze482haPnIkil8QJ16Tn75RV5cHgG/8SP38Y=;
        b=R00nP4wi6Gr2rwT1nobfGIXPhCNHGZTqCpwkZXAaIqKtjBO7z+X6s7jDRyxpFsljTh
         rSW+54gogGhCWZucnlTbBS+vHieiTR6dr22mGhdXhNnjLVDhZDYesG1VqrcvAmPz5WpW
         Be4EvfkpEYXglGz0u77iXw8ccWn7oFqKEt820H9eJ9C0jRvtqCTcXgo1/nSRCu+no13g
         +FIML+i/ZGwojEvksakTHC676EuUE7tFGxMkvz1W4aRHX+ZYc3N/trjSEKC9jSY1FOVk
         Q3s6TSLF8lDs9gtH1vbXlOq2iqwIYGvCAACzCGyMhlALCY3Aj+SgeNWbLatx6bY5DC6c
         gRVg==
X-Forwarded-Encrypted: i=1; AFNElJ8Nuq75M1Z4KhprymKBrK+z+oZgKa1jftynhcmWcVFj1A6GqoNgMl5V5yPAbArGXPukCsxiAKLrqqhMFwh1ysUl@lists.infradead.org
X-Gm-Message-State: AOJu0YwXKjz++EsY9Mum0X1MHSFPFK5mCARpL8mk7kmejSSpDGLnvPpX
	HC9Sy+zaW59UOg0LLnZ9lEF+Q0g92j3Q1Zapz6sSyhSeqh1iKck2IODQX+4C+XeJFyZaD3kmhxp
	Cwgfm5GxeSL4myasuy5uA6jt0vBGDmyQlglW05fKJWl4w6uCDhXImGvc8yDS5+YX4AYOQbH6gwm
	HQJQCga5LXU8bT/WI1PTMtggU0CKbKkwtr4ABgQQvy6hjSW94JAPs4
X-Gm-Gg: AeBDiesZMUWQcNU4tgU2cQ06VurHPomBbL7PUE2C5qIJ8ghK4E31NtNSh7sq9HlJMFD
	1Ujk6g0WCtmT5u6xX84Ll2gZvL1b12LIWgla1fUx7M8ixkFGdtcIRRR+8Vt+hhn2ll2opdBQdsj
	8Bfh28lwTUToZdHfIfDYV1MNWa0uIGDebnrN0evFi2+LRWk7RyNBJ0FYETY3d9WiTnvGBb88PrE
	rXl3Sr5SOFPPo+b43K57g3Yd6u1hXwHf5Fy8kSE1p7VzHd2
X-Received: by 2002:a05:6820:809:b0:694:9f15:f050 with SMTP id 006d021491bc7-69998d14651mr3951926eaf.28.1778163134123;
        Thu, 07 May 2026 07:12:14 -0700 (PDT)
X-Received: by 2002:a05:6820:809:b0:694:9f15:f050 with SMTP id
 006d021491bc7-69998d14651mr3951898eaf.28.1778163133650; Thu, 07 May 2026
 07:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260325-qcom_smmu_pmfix-v2-1-ba769a6ad0be@gmail.com>
In-Reply-To: <20260325-qcom_smmu_pmfix-v2-1-ba769a6ad0be@gmail.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 7 May 2026 07:12:02 -0700
X-Gm-Features: AVHnY4Is6EZTha6Wq3xD-jFuVZhC7DTDiI_bwm7HnmP4foPGflVn99bdaEXp8Gc
Message-ID: <CACSVV01+yL+fm7oPVp8xQ=XXxvYHq4U18t9Dg0b4g_4H-JeAXw@mail.gmail.com>
Subject: Re: [PATCH v2] iommu: arm-smmu-qcom: Ensure smmu is powered up in set_ttbr0_cfg
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0MiBTYWx0ZWRfX63nuSgGumvrk
 jaM6PV55CCqpRAhH3t14eS2dkkzlk3DxCpk83USRxemlT4fs9gT/ikYq0P/YUkvB+02HBxBl1jT
 borC5CU8O0dXGo7Hk4YDYBpJoQWKiagnj+mLGK82pBPmanugSqSGT/eu7PmVs7zRBMGE+whIaZf
 J0bBe40/LUOZnyvTg8k4OAXSIh+NMOBzbLXXUNERq0RIZifRYGylCbuPGQIPoc1V3Db3lbQs8e1
 bTJbNwUEnlM0YrKPa+KZfGkal9CC4HE/KHLNPwfS5VqCQQfc3tKm51fvxONlHX4R01yiRM4Qis+
 T7cKjE4YVniisNUCQtXSkjtOqB1r6HABzCCDa6O2T5xJ5d3fBGcOz90emuRp38mrdzfoqiuWVOt
 s6jK4znOOT73X06hy1aBwhkZs3WeXoVeJXVsF3VLCP/kE+tFIv2xjx6ZqqwAc997JJLFVQpTsFT
 chQn/nkFFRdNF9y21Mg==
X-Proofpoint-ORIG-GUID: ayRWnkOys-Ae24uoo4_sWPJdEQXzSL0R
X-Proofpoint-GUID: ayRWnkOys-Ae24uoo4_sWPJdEQXzSL0R
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fc9dbf cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=KgnJN8VTlqKxrJ66Oa4A:9 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1011 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_071215_831311_85D77A00 
X-CRM114-Status: GOOD (  22.41  )
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

On Wed, Mar 25, 2026 at 2:11=E2=80=AFPM Anna Maniscalco
<anna.maniscalco2000@gmail.com> wrote:
>
> Previously the device was being accessed while potentially in a
> suspended state.
>
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>

Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

> ---
> Changes in v2:
> - Simplify patch by acquiring device just around the call that needs it
> - Link to v1: https://lore.kernel.org/r/20260210-qcom_smmu_pmfix-v1-1-78b=
7143ac053@gmail.com
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index 573085349df3..cab7d110aaf5 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -231,6 +231,7 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const void =
*cookie,
>         struct io_pgtable *pgtable =3D io_pgtable_ops_to_pgtable(smmu_dom=
ain->pgtbl_ops);
>         struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
>         struct arm_smmu_cb *cb =3D &smmu_domain->smmu->cbs[cfg->cbndx];
> +       int ret;
>
>         /* The domain must have split pagetables already enabled */
>         if (cb->tcr[0] & ARM_SMMU_TCR_EPD1)
> @@ -260,8 +261,16 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const void=
 *cookie,
>                 cb->ttbr[0] |=3D FIELD_PREP(ARM_SMMU_TTBRn_ASID, cb->cfg-=
>asid);
>         }
>
> +       ret =3D pm_runtime_resume_and_get(smmu_domain->smmu->dev);
> +       if (ret < 0) {
> +               dev_err(smmu_domain->smmu->dev, "failed to get runtime PM=
: %d\n", ret);
> +               return -ENODEV;
> +       }
> +
>         arm_smmu_write_context_bank(smmu_domain->smmu, cb->cfg->cbndx);
>
> +       pm_runtime_put_autosuspend(smmu_domain->smmu->dev);
> +
>         return 0;
>  }
>
>
> ---
> base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
> change-id: 20260210-qcom_smmu_pmfix-2aead2ba4e20
>
> Best regards,
> --
> Anna Maniscalco <anna.maniscalco2000@gmail.com>
>

