Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D087C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 21:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4FuUHpGIZcp5Oatw0o6fh2s3f4mtV+T4R77+69YOVc=; b=MZGxG3S0GUcIYkPRB1IJvfLbjh
	72ThOnRH1g+jxxfj32dM919TpXF170Vb39sIIG75T2LN5YUFnDTtnfEDNU3Lm5kAUFmWgRrQFE/iP
	Ek2ieaZ0Gyl+OpU6a+sk67X7ENkHLUYFYQcF85NomEV6y5Cx7hGgn97ZcazRDlEHrRTRa+Q9uWPc9
	Dw3Jmfx8jmcbaW1fpmzhpIZsxXo1UX1Ji5KqgtvhXRTCdyW2ovDPRHBF5dti/q+wz5hDrUJbBsLTg
	JG2tr3VrjJQzpGAr4zD1cMfOHNLeOIbpppbwE8ZLtUYpEP6JW6qaT8AAOYpACvo5wOZCtp5MGq04x
	Fp8EGjxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8m2C-00000003WFy-2pkk;
	Mon, 21 Sep 2026 21:58:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8m2A-00000003WFN-1epk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 21:58:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LKf9QT2166811
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 21:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G4FuUHpGIZcp5Oatw0o6fh2s3f4mtV+T4R77+69YOVc=; b=ZLmyTnAZCsDJbxf9
	oqVbVpjtTsP7rUB66vDktHclSGqyjK9Pz/QB59+mKZ354Rn0zo5yxCjo+UawpXMo
	UUimFTofLn+raC8bHrpZunkJOyFlF8d9QTRy7ypZ6i25gigEbbhtMk6vtw/2nCRe
	VXc4f7d/2cbHyzchfeEn6IsybHVLAHIHZH4mF565ma6n5M7aQoRQAn/Gm8plOfN2
	cdCW0+pgNkqJyqt1EuDSixZud/wGP3TrUS8La5r+Qa/+Ar/dL17IwSZIO3hO41ww
	R1YD7d5+xjxwi2iyd3E5/WD2EeAr0ukcw7ds6+eqVan7S2Da9cdW5vN+8OZi2vaK
	gO2b0w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gub328dmw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 21:58:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc73f47bdcso56899015ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 14:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790027924; x=1790632724; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G4FuUHpGIZcp5Oatw0o6fh2s3f4mtV+T4R77+69YOVc=;
        b=T3XGQkk8KEQLcg/1TVg/QWm7mbucGzNJFM7+o7BwQKGpDImVaI2JaaNkOOrv3qPvhL
         dNnYfYFPwPXZs0pY5JoFUGhmkQSn4iyKl9BhVDpBrmMlamDVmjKe5CWrEcPbW3UMPWnb
         ZUVT/TgffflVphLJxtvb8EuYF69cBrEO0NNBrsBUkXq+B+VypvNyaBVVdzEG2z4b0zzX
         s9CbRqo+ctY0EjR1Ht6l4aW98bqZha2I7yK1bgW4+3ygZI75msT68YfLtXhhGnA3Fv38
         gVG/4MFYcSw/3wFcDgA8Z4GaQyvuLYzn9F/+23cSEYcprbI73sDdzPdA4Ex3k4tqzJ9t
         wWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790027924; x=1790632724;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G4FuUHpGIZcp5Oatw0o6fh2s3f4mtV+T4R77+69YOVc=;
        b=gtneBx9n/3w2kGkMEgWOpxRkMJnjyje2FjTjuollawS2OLDYhsib9GzFZ7Dp6f9giZ
         ZjD02Xsu6Cr3s8eiciTTJOhs11yz3P6ukjC5A8FchsCA8SpWvHuR02GsrBEogD9z/8og
         angIvbjnRGIKsyJA3KBpwLx3wxDj9jM9vjQ/xXfldSCR/FVu1Hd29OqCvn3NuYrn7wH7
         u1H3eqvIswrWjlNhGHIsU0R/cDY2uS3wltHxoborI3WBqL/6tEUEiTIJ4gKOlOeLYP0L
         iuk78RUNraZtVtNXErAtlIxkfHlmirf5oOiI6C79UqaeUQLVtAi8Ikvj7Z3h8eJ3uhyi
         1Bnw==
X-Forwarded-Encrypted: i=1; AKwUvBwHxvB/HCqFezefTc6mhfMWjDDt9PYdgfCvQLTe0o0q33d+afo03Dog4BTBdZMY+rIz82XSOBIuaHqslV3ru3v4@lists.infradead.org
X-Gm-Message-State: AFuF++kjNdKnz8z2Fq33Rtx4YOs2QaUUmxBcJ4wfQWj1mGBFFOzFvdTy
	aXv6C3QWyc6ZkTdFtTq9mn/Jv5kkhLLTG8WDaWmyEh5UTjj/sL84x2fVE0aND/lJ/QioSzQAEgQ
	tCzlokFYIaCzkdqvxR8uvG1oQvBnhTua3bhGrDIY5PZ8DB1x89r3D6kDLpljH20x1caLg4cDnl9
	29jw==
X-Gm-Gg: AYBFou2gjKsdUMatMRlBleB3ErKKuEncTf6OBSL7CwRK+KdLhplnkHSVZmqpu6uFH4F
	r/3ZN/VxUYiHwW6MvpYe7DH1x71HrSxIYbxlSeSsGTjbES/kn8ImpKtTXb2J3MHzoWv94CADq76
	wqQiBWqpbnZkpkDAPWlbncEDfFBCgWi+cRNwkChaopp+Xl+aVMCHfi6Bq7ydhmP46ZEHww6C6cl
	f9WySQwY+9ANUfQ59uFjogV8O+iSVa/f68nz9Mlaq+qnjtqyxDt1FTgWy+vBGV3JZbPradd5FNY
	NFnHS+2fRWvWm3YQziq34HxNWhFlFkCQj6AZGuyqN9OffmL7mB1LWGWmMyjlCnhRIz4XGEsGH3C
	YlvVmypKltAGPP82nTCyAMereoQ==
X-Received: by 2002:a17:903:1a0b:b0:2dd:7549:39d0 with SMTP id d9443c01a7336-2ddb1b86d77mr166867105ad.18.1790027923998;
        Mon, 21 Sep 2026 14:58:43 -0700 (PDT)
X-Received: by 2002:a17:903:1a0b:b0:2dd:7549:39d0 with SMTP id d9443c01a7336-2ddb1b86d77mr166866905ad.18.1790027923453;
        Mon, 21 Sep 2026 14:58:43 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ebc658esm835412eec.12.2026.09.21.14.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:58:43 -0700 (PDT)
Date: Mon, 21 Sep 2026 14:58:38 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v18 6/7] firmware: arm_rmm: Ensure the RMM has GPT
 entries for memory
Message-ID: <20260921145838.00003b04@oss.qualcomm.com>
In-Reply-To: <93aea89c-0a05-4b5a-905d-2e8c14a9e894@arm.com>
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
	<20260912083611.2513845-7-suzuki.poulose@arm.com>
	<178978126543.2352296.12214136703168879825.b4-review@b4>
	<65b0c03b-36b9-4e60-aa55-c3b4b85e21ee@arm.com>
	<93aea89c-0a05-4b5a-905d-2e8c14a9e894@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=B8ssQ+tM c=1 sm=1 tr=0 ts=6ab1a895 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=8nJEP1OIZ-IA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=L8e4LJ7mbMe5yfr_-rMA:9 a=wPNLvfGTeEIA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: hSmBCvGOLKL3GQshhDUPv8IRPxWcAQzU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMyMCBTYWx0ZWRfX/SFfKjLw8CRG
 sC7Jzlzkwem58YAKKzDH7U8agLt1gWUt0jb0mxdJtQCRWRHTrR7ynEV0oteAqaqvQICUr1P56YJ
 vgnl8ZOIvr8BrvPldnlM7I2koKoHvIdLIaHiFxlCrTpWpIH4nmTL7wswD3BgpetBQVEK7dYRogO
 A+RXOUGZIKLLr/Hz/Shzo6K1nCwyan2R8IZeduqsGfFD3cBGVBtv+Hdsw5yi1K9OsKDkiI3qRyZ
 h2GittIFBIFHfrkXaWXGhyTe+8jtThgouX/728r1Pe9o/x4vA4TplpaZdIscs4voxt2d9oYpmrj
 Du6vgS1bJnDk+kgtvL0WVzR7gPdz5n65yWeuRmzPQ8OaHfsxIVlTT6ywfbiteglTpu31gaOjeMw
 HtFxKMgt+SeL23a+Yk2X3PiFVqOb1FKn8aKz2/pVr3ArufrRgosBKOR+3ASNtzxfhhhSJFxhuRf
 fUFihJAHilG3nP0lLGA==
X-Proofpoint-GUID: hSmBCvGOLKL3GQshhDUPv8IRPxWcAQzU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMyMCBTYWx0ZWRfX6ruwTYpiSUPt
 fw4P6bMXRtuNAJByV11mqg5NmNcRpWzFJ9pR7EslRIgu+l1d7dn1BDfn7b0nzUB7vRLSEbnGqvn
 f+XcRi3VYhaZ7ts4wdYUXgv4jv0sFPs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210320
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_145846_569167_31E935BE 
X-CRM114-Status: GOOD (  29.14  )
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


> >>> =A0 static int __init arm64_init_rmi(void)
> >>> =A0 {
> >>> =A0=A0=A0=A0=A0 int ret;
> >>> @@ -786,8 +970,24 @@ static int __init arm64_init_rmi(void)
> >>> =A0=A0=A0=A0=A0 if (ret) {
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 pr_err("RMM activate failed\n");
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D ret < 0 ? ret : -ENXIO;
> >>> +=A0=A0=A0=A0=A0=A0=A0 return ret; =20
> >>
> >> Why did this change? =20
> >=20
> > Rebase messed up. I will restore it. =20
>=20
> Actually this is not. We dont have to check the metadata if
> we couldn't activate the RMM. Also, the failure path at the
> bottom has "deactivate", which again is not needed. So
> it is the right thing to do.

Only after this patch? Not from the previous patch?

>=20
> >  =20
> >> =20
> >>> =A0=A0=A0=A0=A0 }
> >>> +=A0=A0=A0 ret =3D rmi_init_metadata();
> >>> +=A0=A0=A0 if (ret) =20
> >>
> >> And this is hitting another bit of guidance in cleanup.h.
> >> Functions shouldn't be mixing __free and friends with
> >> gotos.=A0 Again, not a bug here but there are large ugly
> >> monsters around this stuff, hence the blanket guidance.
> >> I haven't thought that hard on how you avoid it here, but
> >> usually it's a combination of suitable helpers and wrappers
> >> and resulting code is often more readable as a result. =20
>=20
> I could change the hunk to something like, but that looks ugly.
>=20
> @@ -1010,20 +1010,12 @@ static int __init arm64_init_rmi(void)
>                  return ret;
>          }
>=20
> -       ret =3D rmi_init_metadata();
> -       if (ret)
> -               goto out_deactivate;
> +       if (!rmi_init_metadata() &&=20
> !register_memory_notifier(&rmi_memory_nb)) {
> +               arm64_rmi_is_available =3D true;
> +               pr_info("RMI configured\n");
> +               return 0;
> +       }
>=20
> -       ret =3D register_memory_notifier(&rmi_memory_nb);
> -       if (ret)
> -               goto out_deactivate;
> -
> -       arm64_rmi_is_available =3D true;
> -       pr_info("RMI configured\n");
> -
> -       return 0;
> -
> -out_deactivate:
>          WARN_ON(rmi_sro_memxfer_cmd(sro, GFP_KERNEL,=20
> SMC_RMI_RMM_DEACTIVATE));
>          return ret;
>   }
>=20
>=20
> Either ways, we have to cleanup the object on return, no matter
> the route we take. So the original form is much more readable
> for me.

Agree to more readable, but that fragility of mixing __free() and
goto is a real problem that has tripped many folk up - hence
the perhaps overly strict guidance.  Rather than avoiding the goto, I'd just
not use __free()  - go old school and have two labels for errors
and an extra manual free in the good path.

	pr_info("RMI configured\n:);
	kfree(sro);

	return 0;

out_deactivate:
	WARN_ON(rmi_sro_memxfer_cmd(sro, GFP_KERNEL, SMC_RMI_RMM_DEACTIVATE));
out_free_sro:
	kfree(sro);
	return ret;
}

Sometime the new toys aren't the right answer.

Jonathan




>=20
> Cheers
> Suzuki
>=20
> >> =20
> >=20
> > I will see if I can improve it.
> >=20
> > Cheers
> > Suzuki
> >  =20
>=20


