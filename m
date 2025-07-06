Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C91DC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 15:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P7a2bjEwtLaeZv6/yuv6VWE4+I4liPfgiifrZIyyTIU=; b=4xS89KtxSoxinq
	NfRx5c8qK37pWG3+/nS+iYSOr3JaihjXP6A9eEC1QdSCZp/jDA2tpVHE3T/Ggs2gXVmeFjCwDkW5+
	dJ2ntVjhRpiJw9e9J0wGUc9GcgH6hZQbA0PXt+5qGDDIVpE4nwSm9B4hPxu/wbKK3qq5tPqY9DbQ1
	zL+dxVobTmbUHKZ6Ye0HLsVy5AALIHL4jSU0R1GSLU8bS2sfNjEhrSuYqk3zqPI3sp/HF3QdLwMf2
	PL7isjkXtNfTKwOH0u8E1l6W3JoKc369ALtbKlNUSPBeQcVeu5TJGgtZAoAPNt8Yb1qT9DJdMt0F+
	r0P1TYRxHba5drW2lXvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYRF4-00000000Skz-0C3m;
	Sun, 06 Jul 2025 15:25:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYRCA-00000000SYV-3fga
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 15:22:24 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566BUtnU026234
	for <linux-arm-kernel@lists.infradead.org>; Sun, 6 Jul 2025 15:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=P7a2bjEwtLaeZv6/yuv6VWE4+I4liPfgiifrZIyyTIU=; b=iq
	5x2Ava7fg/Abq2+gXbabN1H2M8WGVoy/wY/lgL55PSd40jJVxI/OkDwcKvXDgC48
	uXLuFdJ8smq3AXiB07OBeoBC6vonR01VS+Qrbs2HCONFUUXSUPPCaKDtIoH+17pk
	wt3HuCUTn8nrx4h8s7oEVwpH2oUalcK/K9H15OAQei/DtmqhGtmvhbwz0xMCuSxx
	d2C3PFUh11q8ekBxQgOnwBeb/qHknHNYsrAsamzddZ9MyU7gI2u8+ypNm9MmNMm2
	cH925qy8ijBMO5DGJ0VOCDTBQK5NgKo/DY+0r/6mWvcY5LEGX/bYmau2czI/CKy8
	TsC2Sqxf/adf02cBen1g==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7q4qh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Jul 2025 15:22:21 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4066ff1aab8so2487223b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Jul 2025 08:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751815340; x=1752420140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P7a2bjEwtLaeZv6/yuv6VWE4+I4liPfgiifrZIyyTIU=;
        b=q0fMZ4gvTIwdzsvGwxKrri3/tjWXms5G3mrOzrtj8q8Gnc4PUXreCoAKx4CQXZmRDO
         H2pWUcGNvb3qtGjSt5SDCk2EHetvwCnMf2eshlh3y0mv1S5DQaiNj59Fg5IQViLI2fzo
         zFW+CrDO+1QtzRrCrIygQ+41mqJfYjelXy2nryD7ufwgdDIzjOjqN74aecKdm0EnDbPI
         oMkq8QTBUChhn6r/9DFdyPgWPwzcT7NnROxvQKsnE/+UThCkWPZtfPg4erLoaRWXdFDZ
         X4Agbpeyerpzjrq4hXq74hFKXGZJ4LF1gKsBkgdkuU2FJq6xRewpgpJ4MYrF4O0ugxWu
         1snw==
X-Forwarded-Encrypted: i=1; AJvYcCX05+KtfnW9lFZbRwkDnuXFx5PWlgM5j7TeiY3jegyxwfI3vBRXh4rQzZbjqWzdaXsdXxxe8L86+pIhCqs+SAxW@lists.infradead.org
X-Gm-Message-State: AOJu0Yx42iE7cHUop7z43kLKVlEw5vysODaG/ywHGHdMZ0fy0QiGwbl6
	OD2ww5KpfH3nkwudPAS6mIVd2Hfkl16ii2iSyK11MaA2rhqiJori96Jc3+fwsUfMmoRimjsZw4i
	PaxaN2qQ3u7XUINUtVBoIuoGX5UE67i2pqj75VY5rKeqwafWIbbGj97kqnTUxA3Fa8zf2gwRdsJ
	958aGPfzfo/oPZzap6ErKr+w0yvYR8NDdNIccGuMZRBozMv6FIEBwn
X-Gm-Gg: ASbGncsigbkt9NQc4Vu+cyepCZMOERIWsyZR70ulTczMhZq3pLfuA66RmhQlpd65H9I
	kqp+CnS4HWNgrEtU6xw3KUztsB79jSSEOoOoC1XE0n0FuPPcYhN/YWXwXRbkRDXs5znH/Iyo2ju
	YHnZ9S772Gb8deCCrfdrXZO2gsSM3kAgJPKIg=
X-Received: by 2002:a05:6808:171a:b0:408:fb4c:859e with SMTP id 5614622812f47-40d0408029dmr6005852b6e.6.1751815340290;
        Sun, 06 Jul 2025 08:22:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxN5stcqiqcPo2g1epxKXVWRAu9xnt9wCI/M+/z8cfp/TkVVmdNUI7ChAXSQYRZd9Fm0WeEV9i0r3aCpJJxjA=
X-Received: by 2002:a05:6808:171a:b0:408:fb4c:859e with SMTP id
 5614622812f47-40d0408029dmr6005840b6e.6.1751815339964; Sun, 06 Jul 2025
 08:22:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
 <c20a9713-6f8d-4c20-a031-dc448404d073@oss.qualcomm.com> <CACSVV02ioJfDyYLj6ASeQwH91n5CGcz+GW0wsupWJaUkJyFmqQ@mail.gmail.com>
In-Reply-To: <CACSVV02ioJfDyYLj6ASeQwH91n5CGcz+GW0wsupWJaUkJyFmqQ@mail.gmail.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 6 Jul 2025 08:22:08 -0700
X-Gm-Features: Ac12FXxI38B9CTHaEggfS4VF8kbtpv5xLzWFy9U-kVeIYoAB-mrVEghY5jOxv98
Message-ID: <CACSVV01acTdzQxu3nKYWPzgJhBkfZa9_jvhSVMHRBDH2=wOHog@mail.gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA5NyBTYWx0ZWRfX4OBC/2XgmnHC
 ZYKfiVyd5YA2CDwm8yH/6ig/+K6/np01Q51IdfGTPZ49AVPjhCT1WIWOwgfVO6WPecEqVS3DmzZ
 5HSRwOBTxT19ZGDCO653KKt+vxub0NwzxxZKZfrtFdjX3klrCxgcCDNPRKuQdEBmyaLmRMwR7Zs
 ECurHOPbmh9u0Do/9GoV/91B/m/wqWxCyUL8LqxBN3DwhKeBmHDgUfkl+OT6yujAyoCllHgfcQ1
 jEFU9uoge2SXA4dYqKyRmka2okGrSFrdE741QoX6IGMiCpz9D1BlZhwG/JC06MFRSVXDu/ScfpK
 PA/A1GEqPLa+x6BEDmjYopXkb0BkLoy/TMmcfH+vyDrLnOhoxl0sWiSNHywXFrfkTRjKFIBSx1U
 j1r+WwB2kh0SO64wz2cLv2m6+q6bW/4j3leA2Kq5FzkQDdlDgwM2lf3mYCAAuA5OLTmZNJhP
X-Proofpoint-GUID: w-kqFBfVY8XLYSXPO3hfYhpNW-ZUgz8V
X-Proofpoint-ORIG-GUID: w-kqFBfVY8XLYSXPO3hfYhpNW-ZUgz8V
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686a94ad cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TsQm3OvnAaa48CA-nDgA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507060097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_082222_929899_719FC521 
X-CRM114-Status: GOOD (  32.14  )
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

On Sun, Jul 6, 2025 at 8:20=E2=80=AFAM Rob Clark <rob.clark@oss.qualcomm.co=
m> wrote:
>
> On Sun, Jul 6, 2025 at 7:22=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualco=
mm.com> wrote:
> >
> > On 7/5/2025 9:38 PM, Dmitry Baryshkov wrote:
> > > On SM8250 / QRB5165-RB5 using PRR bits resets the device, most likely
> > > because of the hyp limitations. Disable PRR support on that platform.
> > >
> > > Fixes: 7f2ef1bfc758 ("iommu/arm-smmu: Add support for PRR bit setup")
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >
> > Unfortunately, there is no way to detect firmware support for PRR safel=
y
> > from KMD.
>
> I still am a bit curious about whether it is the ACLTR write that
> trips the fw out (doubtful, since we write other bits in that reg
> AFAICT) or the PRR_CFG_LADDR/UADDR write that does it.  In the latter
> case we could potentially use a reserved-region for the PRR page,
> instead of dynamically allocating it (if we knew what values are in
> LADDR/UADDR.. I guess 0x0?) to avoid reduced vk functionality on these
> devices.  AFAIU the vk extensions that depend on PRR are required for
> vkd3d.

oh, and if it wasn't clear, that is something we can pursue, if
viable, after this patch is landed.  We kinda need this patch ASAP to
unbreak sm8250.

BR,
-R

> BR,
> -R
>
> > -Akhil.
> >
> > > ---
> > > I currently don't have access to other devices from these generations=
.
> > > It might be necessary to apply the same workaround to other platforms=
.
> > > ---
> > > Changes in v2:
> > > - Simplify the workaround as the issue seems to be limited to SM8250
> > >   only (Rob)
> > > - Link to v1: https://lore.kernel.org/r/20250705-iommu-fix-prr-v1-1-e=
f725033651c@oss.qualcomm.com
> > > ---
> > >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iom=
mu/arm/arm-smmu/arm-smmu-qcom.c
> > > index 62874b18f6459ad9a8b0542ab81c24e3e745c53d..53d88646476e9f193a627=
5d9c3ee3d084c215362 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > @@ -355,7 +355,8 @@ static int qcom_adreno_smmu_init_context(struct a=
rm_smmu_domain *smmu_domain,
> > >       priv->set_prr_addr =3D NULL;
> > >
> > >       if (of_device_is_compatible(np, "qcom,smmu-500") &&
> > > -                     of_device_is_compatible(np, "qcom,adreno-smmu")=
) {
> > > +         !of_device_is_compatible(np, "qcom,sm8250-smmu-500") &&
> > > +         of_device_is_compatible(np, "qcom,adreno-smmu")) {
> > >               priv->set_prr_bit =3D qcom_adreno_smmu_set_prr_bit;
> > >               priv->set_prr_addr =3D qcom_adreno_smmu_set_prr_addr;
> > >       }
> > >
> > > ---
> > > base-commit: 7244e36657076b597ac21d118be9c0b0f15fc622
> > > change-id: 20250705-iommu-fix-prr-600451b1d304
> > >
> > > Best regards,
> >

