Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEAF606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 15:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BkY+b0rf;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LPzPh+nf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QfTxBqIY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=G1Nk/k41lamrFq3GiW5/pY8VVOCflUacaIYb3As4YkQ=; b=BkY+b0rf5UFsX0ne5y2gvK9ucc
	OWzMMkDQnimBtrgWZ6MNnZApyqAOfCQGgZLoKt05C2Gxg5l2stXtLebZyNGzvrfHudFf+Cf/rKu1n
	RHLhWVoM1dZ7Hf0AlRO/FUYpcFWg/GLHAktTwymqQCBqZpw0TxhVeMGTSTNaPjH5HYxaghCDXb8om
	EdnypIoYC0gf1cxhyKwPE7h7OjKg/vMs3lnnln54wzx7xKfJ0mH3k9ZDjAaLjgrayiqeKeEJrZA6a
	wzxixXEI3wHy3jgfj/oIc2uTnNSOZ3AFcC/Y3dgVVCqIiY/Y9sLL1+bTqCRvoCp9A7+hHorguoc24
	Dk4yt4Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNB14-0000000DRDI-2Hsn;
	Sat, 31 Oct 2026 15:29:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNB11-0000000DRCa-1gzG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 15:29:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD02gX2765873
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 15:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=G1Nk/k41lamrFq3GiW5/pY8VVOCflUacaIYb3As4YkQ=; b=LP
	zPh+nfIzFd9fvW+meizE5UlI/0/gV0oPrlbstmsUtnFxGsxSoN27y+3U/Rat0TUq
	2RDrhPMbxk5+kF/bb1GWKDQo9eJ7EslmLQSFOYlBId/QwEchdAwYlIfybEOnEDvR
	1hRu8c6RXGz6QtnG+rFkhj0cbrrfRM68Ewfn9/SBKkt5jEGjsjmDnQSfIP9rL4By
	RGPafwQ4PMyiYUhc21eNPBFMuirKVTbDznmuTyNVubAt1YCSlZjsfVlrkbjyltrp
	NhO++ptbdQLQmy+3zpBKRZ2KYw+rBfIAndeAqgDTGB0YRVxuM4+9Dbk9TVpokYbR
	CQTOzgD8I62VCMLVHh3w==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6hh2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 15:29:06 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-8452af97d8aso2168551a34.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 08:29:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793460546; cv=none;
        d=google.com; s=arc-20260327;
        b=YUfwBBw7Otblz6T3m573lkeJJDLTJKsmUnOQkGK4tQA1XJ9Q26RqL7qaV1K13JJH70
         l32kJSsD8uuCZyZ55c//C7Ds9V/Sac1EkFtTq1NprNetNHcnEJVXW414Rx9NL1uyLlhT
         xPWM1ASxWcHcp+BvpBSuktyZY2DGBC+x/YbX8cog6ItOqAScjm92f/adHPGfMMYplMox
         wHfL0G6zDRLYcJL9VA2fimM7xtp+9w305z4RYZUn1vypBaEgp2LIrvKZ37rQv/sxBAvf
         pMR/OwKEZ2BDr2Ul2aFNUVgPe1Yb8QQIH5TMIrp/jiH3uIfXHjxKn3ISEpC6pILDALLz
         Gv/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=G1Nk/k41lamrFq3GiW5/pY8VVOCflUacaIYb3As4YkQ=;
        fh=Vh+9+QCUaRhDyk2huIe6cHvwNHKkEXehr7g3Pf+A+3c=;
        b=eAtkP4k36+NucjYu6cnyBgRavbWiif6sZzH71UrZ9nROqkR6OKhltOuUPcvegDTsRt
         VJlEfjBu6eMy1RrkZSF2jgkzD86HNBDoPw+YFayGQDfKUxx2mv7NoY6a/1/VrO6071GC
         vNvAl3faLjXFNw+PL6PMsOU32ECsWU6ahWz4Pok2BfFjXt4Ui+SNYb2L6nx29EXfMSUu
         sOW6pRxK0920RzDH182OKf7eaPticGlA/XVX7QyAy02KpYa/+HUK7NATMLNBhvmLEHhU
         v9ktW8ug6VCn1CTFhviJKnnTcEMVRDgnmoMne/G2JAJyTgn3wNudpLkh3C1XJSyjxFmf
         ag0A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793460546; x=1794065346; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G1Nk/k41lamrFq3GiW5/pY8VVOCflUacaIYb3As4YkQ=;
        b=QfTxBqIYfX44XtMfCdeOxxVmm22BiPgmcis7f/1BE94KQJubemroLNBp2i6gJ1IR6E
         KAmse96S68BnR97WE93zjHDeaQcDEU/Rqd56SDT04SEi+wpxgDKuYy+X8dBKKdk/lluW
         DQ+1NNlkncXLdhUoVM9iz4TybIeHUSIVvnk8KsTrquOHZTYO/rc8aCi/V7DUyBBtwapq
         Xy6P9dHnPsue2feBk7hliRvO8cmN85t2FZvb1UV4pFOWeFdY/Sxl8gcf2k5fHpiVVZeH
         9tdY+JFT/j1FDPrMFpoMNcfiH0CF22uyOEsymTn6CHXUMqL7HTGcqU9Y59MOeJDJUCq9
         YvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793460546; x=1794065346;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1Nk/k41lamrFq3GiW5/pY8VVOCflUacaIYb3As4YkQ=;
        b=DbtOuV1ML2h1cSfSG7bHYZTvzAvl/6AaJX2kqjPGw+pMH4Zc2Ep+1XExee1SwhcE3S
         dVDBrxzeWdil1SbtA1e1uDutzPjKX6+7qaF7SC18WbGSJlVHlKqNL7HiKOtEkesFSxpw
         B3r5j0gWbtlcqFleIQheJv73H+xWqmbm6PEyjte2YxVoTddr3sa0c4LNeK2jLuiMbXGF
         DhALYgHDuOk4phj1UBfo/yVYjZENRoSUbhH2/KssVADp5GRs9F2m+tatTX6R5nk3tUKz
         +xYnZclVwXN007IuL6hvvM23v9MjjlyaFueHtE/Yzb8AdKZl8uLzeOsxf6u1ROzRzwAu
         kxbg==
X-Forwarded-Encrypted: i=1; AKwUvBzSukVaehTu2/Vag8oRpNmsSuMR3e9ebUd5xVurJxLiycBaeiIAOKBcfA1D2a7Djcv7M0m3sdjwOxi5z/ygcrFp@lists.infradead.org
X-Gm-Message-State: AFq9FYJGq9EJcEwoKl7XU9jnrAYq60VyWm0hrdbAceCnpbBPtQ959gMH
	CcePtzoI0Qr+i2SxJi8Ok98/D+xPXCG/yhcS1HVRRICl39QFCrIabpzbcGkYzb+PV4Vyg4U99r7
	Pf8SJu5nUNU6zl8O2Xc+5VImPx8AzLX6bi0UJt8Lamcf/q00u0tiitBo/w9q/HbnYnRc9CDSbSn
	JRRxmbfif+oKwcdzA7yt0FGoGjIPq6JJ7d1M47cpL5WW7YdA9zSWsp
X-Gm-Gg: AYBFou2femJRbnVa47bdMKkb54ra1WtKTZ5Z9vAWyiQvKCAhMzjGQLNS3c2H3iUpDW8
	kVj4gFJArJxZCt4GYoGHE59uvax3asGviDx9TMMnMkAJ4ZP6/7R2s14XBP+NXBzoeyalK0bBIoG
	frzZoN0CGB7PGREvre8bS0wKar9/8pDZu5bNo6Fx47na/dMvPE2uOZHm8UlA==
X-Received: by 2002:a05:6870:5d8b:b0:499:6b20:13df with SMTP id 586e51a60fabf-4a9076f83e1mr3424972fac.30.1793460545582;
        Sat, 31 Oct 2026 08:29:05 -0700 (PDT)
X-Received: by 2002:a05:6870:5d8b:b0:499:6b20:13df with SMTP id
 586e51a60fabf-4a9076f83e1mr3424958fac.30.1793460545051; Sat, 31 Oct 2026
 08:29:05 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com> <20261031-msm-smmu-identity-v1-3-a2a70580eebd@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-3-a2a70580eebd@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 08:28:54 -0700
X-Gm-Features: AclHuK8hrKHo1tqy_PdKqenLScVW9LO6f-Uam7iC-EUaQnDV6_oiAmGdMYjg4CA
Message-ID: <CACSVV00vH_tpQpDY9WX04FWe0Wf00t6ytKHwYB453Et5RP6AAQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] iommu/arm-smmu-qcom: Use identity default domains for MDP5
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: zfTpzidLFQBA-nq_0DvegYqSor_JvnXR
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae60942 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=sUSyc032qo6c7neFus4A:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: zfTpzidLFQBA-nq_0DvegYqSor_JvnXR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2MSBTYWx0ZWRfX+5stQQJ7mmvh
 /ALglXEFArTA+ZA8JOHsc+jY1fBVhFzmbwjONCTMcHi9MJE/jRJbNc6DU3nlth2CdG8AU6OXfh2
 NyiPAPI6rzaVAP71hNYNYQkci8uk5vs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2MSBTYWx0ZWRfX+x3wpF2aoWow
 KaL9vMz8LurAyiH31hj8AzL7vrcGtheykfhFqlIuvpo3pEokN31Zux4ElIpx4eFZ228ht64vUvp
 OU3BMKC6L0NaMpLj1DNARZg9cevgWbYMLdAxWbqE7R+fm/jY4FRsTWtsu00d+VSfQW9iUJg/r3F
 pGyx3rVIZJmqhGd37box48L34B2rh2qZa7PUmqnc7i+TEIfMpH+yKvrBPMjmB54BC1Otxi3avCz
 f66NwVmxV2SSIUWyciZPiavcWjz8EifC4ivOWwNImAVdPTfLaYnxsUH07GQyJrfWwLTjnX6t39V
 c4HFFfB3HF/sn6WLq0snyhJ3j4TD9fG52ub6aWOf3CYtm3H3gt3bc/vcp9KAwdXr6xKJu1KpZUS
 jJcsWhuRETySIttDSyU3UlY1RxIyO8tjqGm8bxD7o29I01+Xk+HO3ukfHfAF70ULXFtLq5xDXWD
 sS27TRwNXL5nb2kmDIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_082907_563648_82530EC7 
X-CRM114-Status: GOOD (  23.44  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: rob.clark@oss.qualcomm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 3:05=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> drm/msm writes the addresses dma_map_sgtable() returns for the DRM
> device into its own page tables, so they have to be physical addresses,
> i.e. the device must not use iommu-dma. On MDP5 platforms the DRM
> device is the "qcom,mdp5" node, which is missing from the client list,
> and the msm8996 MMSS SMMUs have no qcom impl at all, so the device gets
> iommu-dma. On db820c the SoC then resets as soon as the GPU starts.
>
> Add "qcom,mdp5" to the list, which also covers sdm630/660, and give
> msm8996 an impl with just def_domain_type, keeping the bypass emulation
> out of it.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index 795e8ec7e8fa..addba9074217 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -408,6 +408,7 @@ static const struct of_device_id qcom_smmu_client_of_=
match[] __maybe_unused =3D {
>         { .compatible =3D "qcom,adreno-gmu" },
>         { .compatible =3D "qcom,glymur-mdss" },
>         { .compatible =3D "qcom,mdp4" },
> +       { .compatible =3D "qcom,mdp5" },
>         { .compatible =3D "qcom,mdss" },
>         { .compatible =3D "qcom,qcm2290-mdss" },
>         { .compatible =3D "qcom,sar2130p-mdss" },
> @@ -642,6 +643,10 @@ static const struct arm_smmu_impl sdm845_smmu_500_im=
pl =3D {
>  #endif
>  };
>
> +static const struct arm_smmu_impl msm8996_smmu_impl =3D {
> +       .def_domain_type =3D qcom_smmu_def_domain_type,
> +};
> +
>  static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl =3D {
>         .init_context =3D qcom_adreno_smmu_init_context,
>         .cfg_probe =3D qcom_adreno_smmuv2_cfg_probe,
> @@ -711,7 +716,7 @@ static const struct qcom_smmu_config qcom_smmu_impl0_=
cfg =3D {
>   * there are not enough context banks.
>   */
>  static const struct qcom_smmu_match_data msm8996_smmu_data =3D {
> -       .impl =3D NULL,
> +       .impl =3D &msm8996_smmu_impl,
>         .adreno_impl =3D &qcom_adreno_smmu_v2_impl,
>  };
>
>
> --
> 2.47.3
>

