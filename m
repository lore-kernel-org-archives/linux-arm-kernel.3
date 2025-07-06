Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DC2C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 15:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLFAbZ9MMfXUGoM7SgNEwHVpWiLq2JEVpU4msHTUWsw=; b=E6MlZ7yeqUihI3
	r46EgmgoH/FcZHz0jPPmPaXgMs+kZdQ0J8YoperZSAykgjk+P5NXnbVRSsXf0Cjhm1Xw7PIkBJ0Sy
	EtnlUi9kbRM99lQ8NWPbUuLoZh1104PBdguhcjNpUgHT4s3jdbAD77XyFV5POBrDHS19s804o7eAw
	9xiStP7cObQcsFXHMCPkFgIxxxrOkY1t3SR2Kju+oEPMc3hFM4Ujy8ufOSLndogCCXFRFxlumQXuh
	YI0zOkGQKxeNERPx4pfgkvtdyPfvPSVpWXgCf1QxpUL15D09bf5VBKHUo1/AwsyQt0TFWWUnIu5aA
	+YC6JStKV0QAKCyeA22Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYRCl-00000000Sd6-1Dkg;
	Sun, 06 Jul 2025 15:22:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYRAQ-00000000SRI-155C
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 15:20:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5668xnxR023164
	for <linux-arm-kernel@lists.infradead.org>; Sun, 6 Jul 2025 15:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=dLFAbZ9MMfXUGoM7SgNEwHVpWiLq2JEVpU4msHTUWsw=; b=OX
	T/UdV3HYwYj0Ws0XuBFaj7YM6bc16bVP4VclQN+0EXkqPsQgFvHeAVoznuZi7pgs
	+B9ur+s0e//caRQ1yp2Nvy9UyjCbmy+32YGVNfitc0L3J6LZSXoXiacu+QQDMfyo
	gLBjZdSoY/xFGbMr+qTAXnKOCOo5JEmLDrJWyWF+MjQ4vvUiC/eeFrHFB4Ua0Lgi
	3vrAJt9wKZiCO05Z2V9r2oazm73Hqt4b/cp3e/z4DZs9wCY5/vKknb4YeC40+VHN
	qKwcuDO40vkYc6q45Iex+iugOznNb+gTWdpsXmwDJPBj0ufeEHvMxSKC3aMSvbMT
	wX9NmNU4mRWnSAmLODKQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtk4qy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Jul 2025 15:20:32 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4066a4d2d31so587260b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Jul 2025 08:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751815231; x=1752420031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dLFAbZ9MMfXUGoM7SgNEwHVpWiLq2JEVpU4msHTUWsw=;
        b=NTxQBEMV9vjuRSHl3TBvx/uzppursGdydD/87nrQEzVIxkbqQvH8YIy7dqJ2ohH78m
         s3+rR8PBDO6FA4beylT5UaebR0k0e+ri3oTwLfBdXnR7FWDvQrU5XvbQn2d5uxBqpwfp
         YNBXsiUKDyqCj8l9Gn3F3Wf55OygluUi1vQJxEMkFx31e/I+bj32JNEpu33KxIZ5aRYk
         V2jvbqxwrbowxHa5RXX80MCdRkbcg2yIUu//2YiRBTkCmqMAoeIlCh/GOcEDq6OUK1U4
         iMnkXr8Pc2Bx/X9UR6cb7yfBq8az2bwaPxI7S1cxNIBESpKWaib4rDd/7wW1THdQYy3M
         TusQ==
X-Forwarded-Encrypted: i=1; AJvYcCWORfEFUV7MG6yF0ObbqMYxZfY0umq/GS2rCIKO4PljT8fYXIcK5H6Ixe/HxltCQ5Y4RZnVDRBqOTwP87uN1s8W@lists.infradead.org
X-Gm-Message-State: AOJu0YzlEBl6JNBOKxkON2d2ZyaEcAC3ZRM35h8hV6AKLRyIUXPH50T7
	xVPTRTwW6fJgW3JSyF7yd76XIwP2wtdxGufM9UFB578lBNZquZecb33gbMJqqky7OTz9Z+HH64q
	cgCrBeOAifyQDVLc3OuHtV7XEg70D7XooTTC9aY8Zf7JtKZk74RIm4M2d1oUsiNnN/brhxFEB9R
	5eL7qR3/UaOptqvjSB63ptSZVa2CQWxAR9u+q37I2Otmf2zMHk5ycx
X-Gm-Gg: ASbGncvBoOiZUwQfdTLWFiWpfT1Z4usWDcxoabu8FVJdo/DGvhuBC/DtGh4Vcj0r6U+
	4N2XZ0Ys3NELC0+dG0H8zeBKFBZIXerFXYSU0necfFI0+wHE5HW5K8OGlBlNlf8n/FkiKJ9eiHK
	ldA9jJ8IDl/0aRzadpLRrU7L6oJMleMtvARX4=
X-Received: by 2002:a05:6808:4701:b0:409:c6:c147 with SMTP id 5614622812f47-40d2b4715f8mr3439871b6e.6.1751815231018;
        Sun, 06 Jul 2025 08:20:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQ19HjfWS2qJ+/2HG/poPWfm2s0tMKpeheNoz9fX/o+Q8VwG+3oADAA9x4xsA7IVI4FHzXquARSSMgABetSuE=
X-Received: by 2002:a05:6808:4701:b0:409:c6:c147 with SMTP id
 5614622812f47-40d2b4715f8mr3439853b6e.6.1751815230643; Sun, 06 Jul 2025
 08:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com> <c20a9713-6f8d-4c20-a031-dc448404d073@oss.qualcomm.com>
In-Reply-To: <c20a9713-6f8d-4c20-a031-dc448404d073@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 6 Jul 2025 08:20:19 -0700
X-Gm-Features: Ac12FXyNtpZjdRENeNHXo5Q0MJXp9o0sqLqUTlypqwb-wsX2wlCghESA5aSIn6I
Message-ID: <CACSVV02ioJfDyYLj6ASeQwH91n5CGcz+GW0wsupWJaUkJyFmqQ@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu: disable PRR on SM8250
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA5NyBTYWx0ZWRfX9k0L8QAgAQ/V
 XzRdvOEuKWEAG3mNkua0p/oC6D5ByvcMNmK5tJvIhK3HqPGFQr+Wz3+GCr5bRWEzJ/FkXq0swrK
 bYBmVp2muv7nPWoLJ/oF17p8fw3p6EhmGbEveMIGqBGYarjH13N3YQz3bYYUmCyNeMwIDwrz6Hz
 Dbl0Txu+CbI7DmTPvf8/7uwwYH9HdovgX6aMts1ulaSZqgR9HMh0bxX3qTpjsPvxTCC/vQyB7QC
 ubrZEVoXJdCULHZ/+TWaHhARRi+Ukcdrw6gClmBiidT+QpiF+CoKw/bRqy97Gr6+XekuvjqsSyI
 zmaWG14Cal7aBAVZBMu6PqMWtoyp7X7Q9C7dQns/wAwKoOZV06ahpdvMguLZoVAvx3hmur/Rtw5
 We78t5YSWA+1xbu3SWaKkJoRsuOkc3SrRQrXe3vytFtlw1WJhKyGuJhndJrp+spNnK2vEwVN
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=686a9440 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NKDI3HYFCsqCqSkob8kA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: FUTtyIjl4vnR--BitH3VaFirmwVYHimD
X-Proofpoint-GUID: FUTtyIjl4vnR--BitH3VaFirmwVYHimD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507060097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_082034_301038_5E4F8687 
X-CRM114-Status: GOOD (  28.24  )
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

On Sun, Jul 6, 2025 at 7:22=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcomm=
.com> wrote:
>
> On 7/5/2025 9:38 PM, Dmitry Baryshkov wrote:
> > On SM8250 / QRB5165-RB5 using PRR bits resets the device, most likely
> > because of the hyp limitations. Disable PRR support on that platform.
> >
> > Fixes: 7f2ef1bfc758 ("iommu/arm-smmu: Add support for PRR bit setup")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>
> Unfortunately, there is no way to detect firmware support for PRR safely
> from KMD.

I still am a bit curious about whether it is the ACLTR write that
trips the fw out (doubtful, since we write other bits in that reg
AFAICT) or the PRR_CFG_LADDR/UADDR write that does it.  In the latter
case we could potentially use a reserved-region for the PRR page,
instead of dynamically allocating it (if we knew what values are in
LADDR/UADDR.. I guess 0x0?) to avoid reduced vk functionality on these
devices.  AFAIU the vk extensions that depend on PRR are required for
vkd3d.

BR,
-R

> -Akhil.
>
> > ---
> > I currently don't have access to other devices from these generations.
> > It might be necessary to apply the same workaround to other platforms.
> > ---
> > Changes in v2:
> > - Simplify the workaround as the issue seems to be limited to SM8250
> >   only (Rob)
> > - Link to v1: https://lore.kernel.org/r/20250705-iommu-fix-prr-v1-1-ef7=
25033651c@oss.qualcomm.com
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu=
/arm/arm-smmu/arm-smmu-qcom.c
> > index 62874b18f6459ad9a8b0542ab81c24e3e745c53d..53d88646476e9f193a6275d=
9c3ee3d084c215362 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > @@ -355,7 +355,8 @@ static int qcom_adreno_smmu_init_context(struct arm=
_smmu_domain *smmu_domain,
> >       priv->set_prr_addr =3D NULL;
> >
> >       if (of_device_is_compatible(np, "qcom,smmu-500") &&
> > -                     of_device_is_compatible(np, "qcom,adreno-smmu")) =
{
> > +         !of_device_is_compatible(np, "qcom,sm8250-smmu-500") &&
> > +         of_device_is_compatible(np, "qcom,adreno-smmu")) {
> >               priv->set_prr_bit =3D qcom_adreno_smmu_set_prr_bit;
> >               priv->set_prr_addr =3D qcom_adreno_smmu_set_prr_addr;
> >       }
> >
> > ---
> > base-commit: 7244e36657076b597ac21d118be9c0b0f15fc622
> > change-id: 20250705-iommu-fix-prr-600451b1d304
> >
> > Best regards,
>

