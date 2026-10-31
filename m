Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81106606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 15:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2YJVmry4;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XZLNe5kD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bqBuS+M2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tOU7wcttXT/neIukANAweAXjE4RpchSIStpTuwhO4/I=; b=2YJVmry4x3ElCi2cyqvyhIkKbs
	NzL91XfbdXK5RwIaDepVwFRwBwj1EPpmjwP8RwhI6DliT+aNvgnmJ7aQADSJJ0T6rfatf8Nwb3EKw
	fxlNkmNtsu3ifjfloJskssU3xhFWifM35IAXBBpX9ACHjWjE739wgz/yqezyhHsF5Ve5bYB7mJ653
	dk1iQRMQ7uZ6ZkdklVbPSAQwLYp2Loua1X+9eJpKzGZ52wgH8/nij8Yno3I05teEAff3I9HID03+t
	AA41HKbLqWvhJRAeiLUzEBwkFG/1FRa6AKBaBIoiKcl2sWlImpu3K1mvI3ws6Em55Vi7upL7iI8ql
	4ezA9NNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNB0V-0000000DR5B-0yrG;
	Sat, 31 Oct 2026 15:28:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNB0T-0000000DR4n-1AXt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 15:28:34 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD02xi3174201
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 15:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=tOU7wcttXT/neIukANAweAXjE4RpchSIStpTuwhO4/I=; b=XZ
	LNe5kDRdCTsgzIsQk5zfpO5sEiFbxO2CNTuFoTP5VJyXH+UhBnzsk/MNA39YdJ1W
	QWDX8I5aZ8fw3NeZvo5gYtySWiHmi/mp7rqFFMtfL0WC5IIzT21BwzompCqdxGzW
	bPk6UZtW5PCoFs4ThsuKIrPwSOxyZesizOuxU49DEVM4M/mEtXR0t2jlUnH4s8BW
	5ZfJowD+Tbo4WHJyxAZG2cFJH5ZsIjgRRKK5w94RL2VF0yaX8Q2C8YpbGWgeT1WR
	uVGY65/XjDF9At0kG9kt54DU2kBU90fSzqf2X4iBFy9YF/A3VbG1BIk1NtNcdio3
	abjjvJbQ/pqbgXP0F7xA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn61fsqmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 15:28:32 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-7035f069837so1736804eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 08:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793460512; cv=none;
        d=google.com; s=arc-20260327;
        b=difmavSG1iZ4gweCh3gb9GuRggO1Othh5VtWcJeKT5cAzh6hnly6JNIOWfYVLkOOjY
         gShjxKZ6rU1dDkqjdrkWg0lYE9jeleO/eR6LV9YBMWOLBm4szPgnAa7EEsBK/GhhNNt1
         Alu3SkjAuXp3zj4VxW8VLLMo6zPc9ykqirnsMPgKuv7SDrP/TtGpJLZXMMlWfnB5bbwC
         XIQn+7y78zcuGqCH6RstyvjC5lHiDLptemv4i8fYQk9/Wkp8jnC7bQzFAPCofENi3OEM
         tj68RlrIABji33qroQh8YQYWW4OUj8lkpQEc3cCaRJINMGhcoNUbUmPRqQ0zmiOfZ6lG
         aMFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=tOU7wcttXT/neIukANAweAXjE4RpchSIStpTuwhO4/I=;
        fh=ISaOEKYRtrOro8CCiLydRVIwBQnUrFLLEO84rJPWTa8=;
        b=fMXdycmvFi0sRwgASZcPdsdIOTp1DHGZFG8O+dL65KyfTQy19e6NEcNbKQyn2cRufC
         iJJdxtTHKq3vskPpvqvzLp/uS3430tiC3/9FAg1hSNSBxpPRCcSLe8Q2Rq0qAsKUNiyy
         EnC3kubkfSdbPLDulMLYWArkk92olfK7zIbN+aNYKrWlVlHupO16ppC+7R5L0gXLgakA
         xFuRoAE4M3gMRE21b1ed9P/OIAfx0U1StnQkc8hODt6i8VVBAQfivdqV1ewC4N22oqO0
         Y/OVETtHsqwqE0o6fLiVZPJydP5YI+Tq3iTEtTmh3o0hAKwW0fOmExp+boWO8TUKTrMU
         Wt1g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793460512; x=1794065312; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tOU7wcttXT/neIukANAweAXjE4RpchSIStpTuwhO4/I=;
        b=bqBuS+M2QU5DC2JFU77XlLd/90Ga3YXVAEWQq25rQMmRYg5ByfYJFu8ZecLGDG8IC6
         n2ZbtauhRSd9KPrG2tizy6nT69ZhVYvfvo5Hxwit7Ev0izuqdS47wgI+JDJp19JgweL1
         B4OpBcrLSIbphtYSNAq1cRRzyj3nQsjx5stinp76huxEbEhL4Hkel26gbYxESRgeYJWC
         HkJPDrmMq9wj29oYcuuGFoV/gbAWfSmj3CQXU0+0E/rdmC9YV2lZNo++3TnsOpbIhEM2
         Dm6FXy56VqT/lN03CZqbEN2jtYgs9R528S0BZS2jf35QiHrLtDqAkO7adJTtze2ZAh9n
         H3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793460512; x=1794065312;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tOU7wcttXT/neIukANAweAXjE4RpchSIStpTuwhO4/I=;
        b=HXjuVdNI26d6Q4g3igLA75Ds+JKtiaxWrOhQuRurP3f4C/FHOU1NtHExaxe2rluwTK
         0C/a49mmE1VnbzBOfMZfgmqGH/3KdicT2fY68DZDMXC6foKTQwDDYRWFMBPyeAvrwrKn
         5XQSzpr+0Ka0BmUQ/OAOntK9ZY/vCEy7jY3IR2LdFbc7rabuEgfl8MHLpqvJDuYloJzm
         N3MzDxY1EXGM5aRaWBJx1oumyJRBgmHDarxMtsP/S0xQ4H7Szdm+dpWrnRoP1lo2qQvu
         ySzdje0+E+2uYZPifYD3BKDuDOE3HUW+Z87d45D6QJLkWrH+KjwPLS3HahL4mT+Q9wQF
         oaEA==
X-Forwarded-Encrypted: i=1; AKwUvBzlIrJ0Cl5U4gvR3tY1FhciEaKP5Zd2JQguoVwDWR/s8oefF1q3ZLKUFIGg02zKNcG51tlzFcKRLbCUPY+QhV52@lists.infradead.org
X-Gm-Message-State: AFq9FYIGoLsrNALU7H1T6hag29BWv4jZIpwYeqYozMFxfJxVHVSqEXoK
	f5wPpL5gVLf+ModdgiqKlbaWMWrcOvDaoxoTq+v1cBbub8g3pnzlOlPKy+PtTasus0woqtonQAy
	12qtdVntzP4agpcC9fIKl+2ZUma6wi2zQTD+8Pq3HJaCPCZeT69wGnUsfMtJroVwsTPEm9Bg+FY
	Tvdu59F65rWPx7lGLTB/Yi//GbfxKOyDAcWuBTYBvQdfpQBafwAOSE
X-Gm-Gg: AYBFou1al2T3SioykUIChCcK9biiSmTXSBI0YPeaG+Sk2ApbVUZog6MeXQt+LrNC7B9
	kwYROUgr/plcWAJzNUJ1dLZm5yu+4mRMDvqyxfTkmg+R4EZf4fHIzJ2W12fyTcy2ES73kBNcsJr
	1gxT041u69+2fAoIea3pU19mI5uR+AMOR+czGzhjSZn99MMwW2eJPru22OeA==
X-Received: by 2002:a05:6820:5616:b0:702:a3b3:810a with SMTP id 006d021491bc7-714f241202cmr2221786eaf.22.1793460511675;
        Sat, 31 Oct 2026 08:28:31 -0700 (PDT)
X-Received: by 2002:a05:6820:5616:b0:702:a3b3:810a with SMTP id
 006d021491bc7-714f241202cmr2221784eaf.22.1793460511233; Sat, 31 Oct 2026
 08:28:31 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com> <20261031-msm-smmu-identity-v1-2-a2a70580eebd@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-2-a2a70580eebd@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 08:28:20 -0700
X-Gm-Features: AclHuK9eauWalhgtTBC2J8Fwe5Mi3Jn1yWHBYz9zSLaNIZfyReKOdimAawUMQ1k
Message-ID: <CACSVV033K2=PUfZPHfZnUq7ACmU0wz8iw7Mev6YOWJ7s+h7iPQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] iommu/qcom: Use identity default domains for the MSM
 GPU and display
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2MSBTYWx0ZWRfX9hdGMBGSldZE
 Rk5c9jNDFoCeLDLzkxZakBjB21ySnerOhFUG8B8Diw9e4577vJG4LtK1/Fxt83VFUxaRGqzoDbV
 vbhMPVNztbpyvPuBG09w4qIrLnMmevc=
X-Authority-Analysis: v=2.4 cv=V/LoQuni c=1 sm=1 tr=0 ts=6ae60920 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=Yhi7VFIheabn5aZjDpkA:9
 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: V0wopP3MQRqzB6kbqSVN6LbO-fN83Stl
X-Proofpoint-ORIG-GUID: V0wopP3MQRqzB6kbqSVN6LbO-fN83Stl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2MSBTYWx0ZWRfX8lnr/jqEQ94i
 x31kBHJj/N4u36vx2JIrPNAZQcc+Pg5lXC8WPDjcp+pLg/G/oQG29MEBio5crx5HILDMbW33NUO
 AXwdJcY3F73Bb18AEm5MoUfHH6EFfUoHymcm7Bu4FU0ZqNFE3r6tJjmBGtKx0cw7UfBF8ONGmq+
 cD/0zo/n4DAwmVQ8oC5NZ+j6ufcg5qc9l0SPiI+gRH7MIaCrYEJqWiD9G55L3vFxl8x9qtLINqa
 bmt8sNlcX7LUBZ4+TFPXTl1N+bWet+KhndfOlAlaiR859q8rGGBNcYMrkPWTbKc4OjFwsLj/Rqu
 8mELJuRb1FQkmp6HM9ABRJSrxO7SRjAO5QoUhd26h7TBwRJRLnfrrWZOB8xrd8y9x4yVWVQqHVk
 mR6Nwc/KD6ggj/YNV5bNVBXR9d2yqBLcNJXmfcxB8Ti9sA87drZUpP8U/AMnxNPraAQp7ntX6Zb
 H6MImjjJJr9hHTpX5fA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_082833_324234_EEAB8401 
X-CRM114-Status: GOOD (  21.54  )
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
> i.e. the device must not use iommu-dma. qcom_iommu has no
> def_domain_type, so the MDP5 and Adreno devices do get iommu-dma, the
> buffers end up mapped at IOVAs of the unused default domain and the
> db410c GPU fails to start.
>
> Use identity default domains for these devices, as arm-smmu-qcom does.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/=
arm-smmu/qcom_iommu.c
> index 54130c32056a..4a9c4cf63724 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -22,6 +22,7 @@
>  #include <linux/init.h>
>  #include <linux/mutex.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
> @@ -531,6 +532,18 @@ static bool qcom_iommu_capable(struct device *dev, e=
num iommu_cap cap)
>         }
>  }
>
> +static const struct of_device_id qcom_iommu_client_of_match[] =3D {
> +       { .compatible =3D "qcom,adreno" },
> +       { .compatible =3D "qcom,mdp5" },
> +       { }
> +};
> +
> +static int qcom_iommu_def_domain_type(struct device *dev)
> +{
> +       return of_match_device(qcom_iommu_client_of_match, dev) ?
> +               IOMMU_DOMAIN_IDENTITY : 0;
> +}
> +
>  static struct iommu_device *qcom_iommu_probe_device(struct device *dev)
>  {
>         struct qcom_iommu_dev *qcom_iommu =3D dev_iommu_priv_get(dev);
> @@ -602,6 +615,7 @@ static const struct iommu_ops qcom_iommu_ops =3D {
>         .capable        =3D qcom_iommu_capable,
>         .domain_alloc_paging =3D qcom_iommu_domain_alloc_paging,
>         .probe_device   =3D qcom_iommu_probe_device,
> +       .def_domain_type =3D qcom_iommu_def_domain_type,
>         .device_group   =3D generic_device_group,
>         .of_xlate       =3D qcom_iommu_of_xlate,
>         .default_domain_ops =3D &(const struct iommu_domain_ops) {
>
> --
> 2.47.3
>

