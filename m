Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C873B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 15:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DGPlllT3;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rx5uTZEZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IaxX1Z//
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+6KHp1DDQ2+j6W05RK3+UyPZGKExyceQhydv1qHVmKA=; b=DGPlllT3R5cx9pjHiMJeV5WwwA
	lK6yu2hBfrfMOKIA8t1JgpvuYGI5VDq3MPxpBcm8g2HjRg/2Mj5i7DqdU5POSHypMZmucK929Hszj
	LXY8PK/UrOznR/HPJLO7gUO2Vx5l5xLL6GaOQ91ySycOxaPWvtaSYUux68uNzm7Z4JbVZP5irhEKh
	BNopwgnPWoThG4+C+EfvDqeAlQcGdmXPmWwhG7d4YBk+bVwNOGbZFMWhUznTtCwA7Hy1qKyVV4A88
	cTtfp87K4QlDMRzwoRE0Jx91LDqKqdSyTj4zEaW6+AqPZy7m6cAo4SpXUfSEhT/xRbLDs4hyvrmq+
	8oSXpNCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNB58-0000000DRgP-4Bkp;
	Sat, 31 Oct 2026 15:33:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNB55-0000000DRfy-3Yyx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 15:33:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0Wg7590987
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 15:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=+6KHp1DDQ2+j6W05RK3+UyPZGKExyceQhydv1qHVmKA=; b=Rx
	5uTZEZScz8k5imepm81GKYaWJzx92n6ZOlW7C1HaNVyfBqSFHxJDe6sIT05ZtUxR
	bQL1gebz5vqWtcHRGuH3/VmY2OxCKvax1EpXf+CZpIaPz2S2ZuSA5kurJeY1z4wi
	vYUOqRqiz7CC0E4uE8pmywnJzmaP8DOuPTbsJOtebPxLCdKWwkZU72HP9WvftqfE
	U9Jyp3JSdSXW4uKjjW7/FhH/vrqCUiSupnInBUETS4KkLQugBk08jLTGYvuKVSWr
	iouZ7hPZGyu/U3/XuYdId8OHlbssWu6r9lFwWrKNdSnmwtwdanYqLXjDx2/34fFi
	KG8z+RxJYNz1fjYDTEtA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9gk17tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 15:33:19 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a45b3f0bdfso2614222b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 08:33:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793460798; cv=none;
        d=google.com; s=arc-20260327;
        b=Gojf1Jz/dMQ97fA47UhAUKkFQKA9uka4+yak8pLzHChxafubGHzbYX47qrfcFSRqrT
         sPde9AF2oLieWKTOBmGzuXMjo508mpxfeP0YCsMjgDmf0zca9yZjvNYMnPqvMIGhm1QP
         NK5xPXy9Of2lkwosr7OQX+2h+CHDGre9Bx3AXvS40M+ufzgNFS0ggjziYa6uNLmCnesr
         +FQLIbr84SM+LgWbuG7k0Ns0r6Ccv6lq4m+VwhVx0X8gn+lcPxpdBJv2q6qqq0NJFWex
         8ytMk25CMHUg7AfXbc5Bn26rcWd95EvNfxheA2lWZv2BDDI9yfrERR0LXJyzNpmHRVfr
         gGiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=+6KHp1DDQ2+j6W05RK3+UyPZGKExyceQhydv1qHVmKA=;
        fh=LSYAGcyiS253DxzSClIgiFd0Yhl6644JpnawbptGVr4=;
        b=b62kX5IX7P5bsfrs/ODvHfB50UbiWyJ3nfBoknkusJCDZBEVBNk+R8IFtzvRv9ud/j
         IZLd3mRhp32JMA51zVo2elrz/PgaJ6Gx2r3PLv3Tsu8rt0qiezxMiblA5rbzKUzpya9N
         WOUn7roNw+FceFscRGjuPuxGuNfjS2qRQ8xuUax9YSuweuEJe0UlAhwdfUsczY/Sq4cR
         7SfayWLqGCz7cuzfi3SHf0HZsravJy7ohAzZgSGdzzZtZAplyP6MUgh8HKmVXbChu2Pl
         GT2mfWCqunQQvYRS1WFxFylKj7M9a7dfjGPJwz9Y3UYD39LucBZpNbMz8vm9vv7d8ioa
         UGtw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793460798; x=1794065598; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+6KHp1DDQ2+j6W05RK3+UyPZGKExyceQhydv1qHVmKA=;
        b=IaxX1Z//vreRXD0BNutAQfmhSkfRAgz4D79520bUEm+O95Oj4B75wKm5QMNvaLR1Iv
         b8hILu8eLmqD1ArogVOWiy6dFRx4sJR3oIQNw5YiNeeecKK0EGJqS5gbMGQsROY90pBh
         ur+axEhMvZb7dSnFB/1hNBIgNxN3imUpXBcGOX6I2/nXl/0RfDM9siBL4Lfm2YFxIkZM
         Kg4184Hi3KKwsIFuTRIi/BwX50i4uHVMjQkniBinxZg9yDWAsyZaMspuTTdj5RNdwiUr
         OyhBRxbBpgwIwUixMExtYrHhye20UmMCF+bthBV0w1h8HsrWSbzPqlR+uFxIVCnw4pGE
         vMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793460798; x=1794065598;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+6KHp1DDQ2+j6W05RK3+UyPZGKExyceQhydv1qHVmKA=;
        b=uhDiDCX1oAa8FoCPdHDWpKAwaYkUMtKYwHWJ7ZZPguzS6BhIR0q1fPjdQ38HHJoBns
         2iQbTVe+JFdMwDPDtHHGkfFNjUbipzpBppZhwQTlrSs7Q/HhgwCMVPt7YO4u7soDYcuM
         MRvVUCxPP8PQ9/bePkFZcrh7ZlTrDnYkk92/yVfYpj7ue4i9yIVBgs4rGMxoQbxnBx44
         r5l+hrFTtd9tGu2lSmO/Rm8CfsuX5NItNjdcwfcYYPKytDwJ/VZaXu6tgPum1nUuPzLJ
         vMR/4ow8KEyMBCbBSOaScl9EBQXeIsMlOprAd3H7t+uMqGR8J1enqDtfWdF/duq0ql7C
         6MPg==
X-Forwarded-Encrypted: i=1; AKwUvBzIYA5cAklYhXggk/xM51YL7lAlFX5JFZVndFOMGMrwgRPixbDl6ahchdmeRsYaZZDmD8vYvpjXp1ySQ6oq/sUH@lists.infradead.org
X-Gm-Message-State: AFq9FYLhAZUtvZANT07XJFBiR+iAjq6tOpNmIImOQGGynLP0pEpeNsw3
	Y8s9nCfrpAMqJ8Ein7PRwsjzdOMUuhPxFodAtf2yC3Uu37hw0UG//rnLLMF5YA62R2khL9+iNBx
	2UE86i6x1lbGkLV+KwCmKzzNWxyhpmJIv30MbMw5+Gwn8UaAfndgUl+IVYzuDTsag+QDpUmJTQB
	EU0FkfsbFXQRQYZm1vftpBhvwkkcjGyM7DLd76CcLFM2i7JhOUvw6K
X-Gm-Gg: AYBFou1uDm2x+BtWDzMAA9e/LmWcfbBEb+RzLl/bBNnoIL2UlcoiVbEfLios5exbOnm
	685zY08g2CQd8OZ0iK1oYrsqm9ewV4n89S1bWgPd8zo6Jo4nVe323X+PtGZLYn8yemdDxrv61uW
	LBvzwvSEHlGAKSBenouGxteHeKpNO4nrN+b7yzuSOSVHdm3YOmsmfDi/Takw==
X-Received: by 2002:a05:6808:30a6:b0:55b:f88d:919f with SMTP id 5614622812f47-5640de5c4eamr4534432b6e.53.1793460798010;
        Sat, 31 Oct 2026 08:33:18 -0700 (PDT)
X-Received: by 2002:a05:6808:30a6:b0:55b:f88d:919f with SMTP id
 5614622812f47-5640de5c4eamr4534414b6e.53.1793460797558; Sat, 31 Oct 2026
 08:33:17 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 08:33:06 -0700
X-Gm-Features: AclHuK9CSsE5d2RI7IGhCUXsadCiEmg1vr_YsLjfD1ZPNBmwTgEXoOH0UkuFoyw
Message-ID: <CACSVV02xa+emUMd7Dp1rDSwa0e3wpyQBcPeZg-bXPL4U3kzQvg@mail.gmail.com>
Subject: Re: [PATCH 0/3] iommu: qcom: Fix the MSM GPU and display with
 DMA-address based mappings
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: fkXadk7RS7R2nswSRnwHVT_pLiTgOmGO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2MSBTYWx0ZWRfXzu/YKYjj1q8K
 kGKjt3yxmko33FpsrL1NKBHrduG7rBP8yHXOcefIc4Dr6gVofGPqjjFfuFsFjOrnVNnjpAr0ia2
 5hmATew+G813RV1bs5Tu8Vh5pM/6cFlfdx3iTkU4kCyG3IBnQr5oHGcYsdtWEUg5sRmqZKqY0Bb
 U0lYTb5XBluDyx2mazqiO+Nepiyzog9lPD05rz8h+Mq6sMjWm8+TjI33/WVOq6eTUZ7lnXvtxOu
 GCn43qa/8yyqzDt9xVEWEb5qD3FckUVpc4PoKPE3YFaFQASxcJUA8SCcjxWPLHu6ohxuDu4pB4G
 AbBAvIP4HtCho5o/wq/+WeXzpDCLxwivES5+41JU8363esBOw/922SUFah8afgA6IhoFdukdEpq
 IsdRs49PhQT8ajsXGiaU5VUhHxRZ5c2EjwYm9U8v6pqlcPNjMTvJ94x62i3AZGOPnHV6o1gkwcX
 KRKlPxqY13M1ox+ufIA==
X-Authority-Analysis: v=2.4 cv=HNBWhYtv c=1 sm=1 tr=0 ts=6ae60a3f cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=QEYsvGaJyljY994YBNYA:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2MSBTYWx0ZWRfX4mlylIzJqPfm
 KVLYjVQhN3BkcX4zaNmxSf8M+3Mv3QPiObb2JyPRPyWr1H+N5JJtdUCUu4FGjBsZP1CGtM3VxPf
 wYQKl/CO4XFG+Pyk4QbprZoEYRAAAbs=
X-Proofpoint-ORIG-GUID: fkXadk7RS7R2nswSRnwHVT_pLiTgOmGO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_083319_894400_96C02F54 
X-CRM114-Status: GOOD (  23.27  )
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
> Rob's drm/msm series [1] writes the addresses dma_map_sgtable() returns
> for the DRM device into the GPU and display page tables, so they have to
> be physical addresses, i.e. the device must not use iommu-dma. On DPU
> platforms that holds, the DRM device has no iommus of its own. On MDP5
> platforms it is the MDP5 device, which ends up with iommu-dma: the GPU
> then fails to start on db410c and sda660 and resets db820c. The last
> two patches give it an identity default domain in qcom_iommu and
> arm-smmu-qcom.
>
> The first patch fixes qcom_iommu's flush_iotlb_all, which never
> invalidated the TLB. Nothing relies on it today, but the series above
> does, hence no Fixes tag.
>
> The patches are independent of [1] and a no-op for the current drm/msm,
> but have to land before it. Tested on top of [1] on db410c, db820c and
> IFC6560 with and without these patches, and on Open-Q 835 (DPU) as a
> control.

Thanks, this should mostly supersede my untested series[1], but I
think msm_iommu.c still needs the same treatment?  Hopefully just the
def_domain_type() part?

BR,
-R

[1] https://lore.kernel.org/all/20261029212344.346069-1-robin.clark@oss.qua=
lcomm.com/

>
> [1] https://lore.kernel.org/r/20261027230452.130031-1-robin.clark@oss.qua=
lcomm.com
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (3):
>       iommu/qcom: Invalidate the TLB in flush_iotlb_all
>       iommu/qcom: Use identity default domains for the MSM GPU and displa=
y
>       iommu/arm-smmu-qcom: Use identity default domains for MDP5
>
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c |  7 ++++++-
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c    | 26 ++++++++++++++++++++++++=
--
>  2 files changed, 30 insertions(+), 3 deletions(-)
> ---
> base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
> change-id: 20261030-msm-smmu-identity-6fda3323023b
>
> Best regards,
> --
> With best wishes
> Dmitry
>

