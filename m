Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FA9C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 16:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/uIU5X5vebpwZqZqXeVNPWhTKkvilxlk1lz9DCq44h4=; b=vPzSeVXOmI38Z9CM25/aHYo/jy
	Z4agbsOYKcweICqUwyXuIBWCSgPed/+Hj/Oxcd3sM1YFF9+n7lc1nE0D/BaT5exoRSGNvspO2kByn
	WAvV7BcmJGsUqgr+xZLG2KuB5CkRISuK0pjqRBGJntOK3MQcbSjN+d556sxo+k0h9efHaBqT9nx1Y
	AH6w1UVwu035On/lfRoyf2T4vqJllwX5JoUiXFmcLWrimB8dv5GBein9x4jti36As0lLTzQZ9If+l
	U042cVl/KpSx18D7KNkAia2eALfvqT+F3AQATgQQuUh0WwWMSY5kS0z9bTmBycyuMd/R8VLOuvZGA
	/blnN9Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Q6u-00000008utQ-1Qrj;
	Wed, 23 Sep 2026 16:46:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Q6o-00000008urF-0rWg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 16:46:16 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTYof595296
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 16:46:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/uIU5X5vebpwZqZqXeVNPWhTKkvilxlk1lz9DCq44h4=; b=pBqauWLZhNX9pcqJ
	u6FaFnfvmXoaSvWfRganR8/ZV1tNVAtcPh8buWqRioJ41K59h4EaDQiyGeIEAZSA
	0JT1yNPz5pfFX2HWbf0RPS/4R+B6j5mmEtnsfekrOfK3ookqABVwdheOYNCWFjst
	Epxky5BtOQfqaMmIzrCspzrC5nu/B406pZdKihqQwUdZlYayFromT9oCnf8LAL6g
	meXebbpT/HiyfmmRtni27KYcDOTyGo9eApQYAM7+Nc9tJz3L7HNkchoyZQXPz8Nm
	+AvtctUgw1T+kmGHI3cCJhZeVuBztxJeVxPkFumjJ7ZBDZKuI75hETNMPp47vFY+
	Crt2FA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxry3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 16:46:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so2169910a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 09:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790181973; x=1790786773; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/uIU5X5vebpwZqZqXeVNPWhTKkvilxlk1lz9DCq44h4=;
        b=aFTAstYG+EURX4tlyYk+RitO/GWm8UfKeVTx2Qri0bZ3Rrz5YJ9F4szoD4CykTDWlX
         eIxGkML+sLI4Jg2RLjLzZU/GwXnnpL7Z5COSL34D/5SKzqSf89OWSUcFjpSUw54V/nM0
         F4jh614bOZlcVwnfcrOej6jhxT0YI8FJniopoBE1OEuthRkEul8b+k1QjSb3rtEKTa4c
         ykVJGjrYFTCqqL4JOYYfiCZAIiN7nSStvUYVa8jnC3nqPKRuWL/hh8+R5CcZ60MUzvkR
         a6HGtKwGewnyA4wtTJ3llhWKchPpPyPJ6PGFR/HkSWvcfYkxxoTqR4UNwOnZA2gwXpF+
         ohwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181973; x=1790786773;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/uIU5X5vebpwZqZqXeVNPWhTKkvilxlk1lz9DCq44h4=;
        b=Drqm26sQ8sQ7eBQ9+IruepMSmHCOLmS0C4hVdKNkmxmS0mPC3uvx1X39fPaUWseE4H
         44MbWNITWqsh09k/aduiiLJhbA71UH91TQLJdv4m6PMuOFHeH1aeDORnXDPqnlRqwden
         3d0FU23XmALFbyXYkI72GMV3T3aRcWtFvSrks6SyPSVH9roXeUkDosHZZfmYdhrpEB0u
         12qP1zG2bNvG8Dkk4mdzAvvcrmbOOJ7yH9nHYlwU+FeCwDL0Gbk2UxXErmhsxvCTVslB
         tHsYhX1mmFJKnhAPQOqVWNqRyGgPhGNe79/HZBjgkFmQqYG0OiDN5d9/tC9nAM0d78tE
         z1fQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdl1L1WCHDwNOjmW359b6WRZpL4PGmc5fjKjVpkdYBZnoB92aXZ5HOtyg0h/Z7OQIA5ECiAizjsO/McKoPwGiH@lists.infradead.org
X-Gm-Message-State: AFuF++krHYJp2MbdT2u5fRKiC7/zv19DlDLDFZubKV/OAija4HY1wW8J
	Oa2AavaMCgw8oiVYypxKzIArGm54QeoqhdGqmVAkCN61A7TYcJBsat5QFS49O62FnmIC2zEc7k8
	BT1nyJLzcPCf0iDmwaDK8FnykRbgG28+06Y0jSHIvjwc4qbIYHW+IzJ6ndfT3WPxZqVCOyc+lJW
	jaAw==
X-Gm-Gg: AYBFou3tRH8Mwu8b7SVPfyjm1uxt7lLPk4rvO3mbTIaFl11onOXQfEW3J9EQGPiBI6E
	oSpraMZXmEA6WHVMmkFv/QXS9RTZjwKM5JSlnI/LJTI73wImRZ25H5sNtrWbkCxdr4EA2FqndwX
	rcrPKfYO0C87ZfY/zjZGVEgDl3JgBtV9oqQpfgbx5tnjvIYmDnSqvcZcs5/0gAxRNU3jtoCCqeW
	g6QT00apSAC2R+TQGUtPr/8r/Fo+oI6lkSw2x/F4xyI5FEwOhrwUsi0AY8yPCyaH0hFqIhk378o
	JwzQSYQJMvTZuvBiH4JdkHOEeyAD/s2ZGEA/GgKSvwQD6iwLkH/rz9MSX4Ji+MNyFBnWiOmFYxU
	5nYdIx9FZraXEpxqo1tr5Y2Vo2FhonCsMaJLkkeDAtHLe2ogSaGitAg==
X-Received: by 2002:a17:90b:5747:b0:3a0:2ac2:6ca2 with SMTP id 98e67ed59e1d1-3a07e5ea208mr2939174a91.31.1790181972772;
        Wed, 23 Sep 2026 09:46:12 -0700 (PDT)
X-Received: by 2002:a17:90b:5747:b0:3a0:2ac2:6ca2 with SMTP id 98e67ed59e1d1-3a07e5ea208mr2939132a91.31.1790181972102;
        Wed, 23 Sep 2026 09:46:12 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddf23desm5867334a91.10.2026.09.23.09.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:46:11 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:46:06 -0700
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
Message-ID: <20260923094606.00003c6b@oss.qualcomm.com>
In-Reply-To: <2164b046-bbbb-4cfb-b797-5df27fbe313f@arm.com>
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
	<20260912083611.2513845-7-suzuki.poulose@arm.com>
	<178978126543.2352296.12214136703168879825.b4-review@b4>
	<65b0c03b-36b9-4e60-aa55-c3b4b85e21ee@arm.com>
	<93aea89c-0a05-4b5a-905d-2e8c14a9e894@arm.com>
	<20260921145838.00003b04@oss.qualcomm.com>
	<2164b046-bbbb-4cfb-b797-5df27fbe313f@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 4YrawE0x9tTR59tJDnlsDSHzzFMJxvDF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NiBTYWx0ZWRfX2a6ll0ePhcr4
 5S16l7x63FtieZKKoCDDxBFUIxmqce5i7i4jBaMnT33pPpXtoT0D2zC0yrbm1hxQsy8zfbSWvmi
 pnSs+PT+hUAPVoWfpJAhvdPA1ft5SEBBjTVntQ/J/nCcusG9gEWDJXTDivSQJ4pJq5Z5lDo77Dn
 OWUEUFDoOf4wMVeZDy9IJv62PtsmigWotsYI4v83Z4AvBzbrhDqGrdYPp0JbvYWT5JO+6M6V+e5
 4MuNTFu0izi+ZBj88wW6qwP7al9VkULa1lCubGT+pfbCJnxbTGmlUT535mMyzis+EfYXdYWEqgH
 /g6V80xReGEhFayxY4rUBGSqL8S6Tep1jZVOrSNJLmJkjM67Jfr2gB2yZBwJkI8p2bqdpW0YFTf
 XWX04sxCYcgms2nJ8A4pZjgbu6xdApPvv0CUG0+rlDwiI7Q27c5Lq7OwBG4ALjDDrktI+XspL+t
 aazq2NmWiyiqTKEk7Nw==
X-Proofpoint-GUID: 4YrawE0x9tTR59tJDnlsDSHzzFMJxvDF
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab40255 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=8nJEP1OIZ-IA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=0e8ahwmGRF4KwER_06MA:9 a=wPNLvfGTeEIA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NiBTYWx0ZWRfX4gMGPOW5D229
 PU8nOVFp7Hak7Q+tCCOyjD3GgFOnVOy0giNED94aoBQG7pNSrZeuJRMT/A/DyVglF+38LNNsSX0
 T3cduNkd184c5hhoSFs0pl9HJv0epO4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_094615_294023_970D1C97 
X-CRM114-Status: GOOD (  38.30  )
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

On Tue, 22 Sep 2026 23:55:52 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> On 21/09/2026 22:58, Jonathan Cameron wrote:
> >  =20
> >>>>>  =A0 static int __init arm64_init_rmi(void)
> >>>>>  =A0 {
> >>>>>  =A0=A0=A0=A0=A0 int ret;
> >>>>> @@ -786,8 +970,24 @@ static int __init arm64_init_rmi(void)
> >>>>>  =A0=A0=A0=A0=A0 if (ret) {
> >>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0 pr_err("RMM activate failed\n");
> >>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D ret < 0 ? ret : -ENXIO;
> >>>>> +=A0=A0=A0=A0=A0=A0=A0 return ret; =20
> >>>>
> >>>> Why did this change? =20
> >>>
> >>> Rebase messed up. I will restore it. =20
> >>
> >> Actually this is not. We dont have to check the metadata if
> >> we couldn't activate the RMM. Also, the failure path at the
> >> bottom has "deactivate", which again is not needed. So
> >> it is the right thing to do. =20
> >=20
> > Only after this patch? Not from the previous patch?
> >  =20
> >> =20
> >>>     =20
> >>>>    =20
> >>>>>  =A0=A0=A0=A0=A0 }
> >>>>> +=A0=A0=A0 ret =3D rmi_init_metadata();
> >>>>> +=A0=A0=A0 if (ret) =20
> >>>>
> >>>> And this is hitting another bit of guidance in cleanup.h.
> >>>> Functions shouldn't be mixing __free and friends with
> >>>> gotos.=A0 Again, not a bug here but there are large ugly
> >>>> monsters around this stuff, hence the blanket guidance.
> >>>> I haven't thought that hard on how you avoid it here, but
> >>>> usually it's a combination of suitable helpers and wrappers
> >>>> and resulting code is often more readable as a result. =20
> >>
> >> I could change the hunk to something like, but that looks ugly.
> >>
> >> @@ -1010,20 +1010,12 @@ static int __init arm64_init_rmi(void)
> >>                   return ret;
> >>           }
> >>
> >> -       ret =3D rmi_init_metadata();
> >> -       if (ret)
> >> -               goto out_deactivate;
> >> +       if (!rmi_init_metadata() &&
> >> !register_memory_notifier(&rmi_memory_nb)) {
> >> +               arm64_rmi_is_available =3D true;
> >> +               pr_info("RMI configured\n");
> >> +               return 0;
> >> +       }
> >>
> >> -       ret =3D register_memory_notifier(&rmi_memory_nb);
> >> -       if (ret)
> >> -               goto out_deactivate;
> >> -
> >> -       arm64_rmi_is_available =3D true;
> >> -       pr_info("RMI configured\n");
> >> -
> >> -       return 0;
> >> -
> >> -out_deactivate:
> >>           WARN_ON(rmi_sro_memxfer_cmd(sro, GFP_KERNEL,
> >> SMC_RMI_RMM_DEACTIVATE));
> >>           return ret;
> >>    }
> >>
> >>
> >> Either ways, we have to cleanup the object on return, no matter
> >> the route we take. So the original form is much more readable
> >> for me. =20
> >=20
> > Agree to more readable, but that fragility of mixing __free() and
> > goto is a real problem that has tripped many folk up - hence
> > the perhaps overly strict guidance.  Rather than avoiding the goto, I'd=
 just
> > not use __free()  - go old school and have two labels for errors
> > and an extra manual free in the good path.
> >=20
> > 	pr_info("RMI configured\n:);
> > 	kfree(sro);
> >=20
> > 	return 0;
> >=20
> > out_deactivate:
> > 	WARN_ON(rmi_sro_memxfer_cmd(sro, GFP_KERNEL, SMC_RMI_RMM_DEACTIVATE));
> > out_free_sro:
> > 	kfree(sro);
> > 	return ret;
> > }
> >=20
> > Sometime the new toys aren't the right answer. =20
>=20
> I have the following hunk on top of this patch, that could do the trick.
>=20
> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rm=
i.c
> index bcdbed26cf08d..4385f49068965 100644
> --- a/drivers/firmware/arm_rmm/rmi.c
> +++ b/drivers/firmware/arm_rmm/rmi.c
> @@ -1033,20 +1033,19 @@ static int __init arm64_init_rmi(void)
>                  return ret;
>          }
>=20
> -       ret =3D rmi_init_metadata();
> -       if (ret)
> -               goto out_deactivate;
> -
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
> +       do {
> +               ret =3D rmi_init_metadata();
> +               if (ret)
> +                       break;
> +               ret =3D register_memory_notifier(&rmi_memory_nb);
> +               if (ret)
> +                       break;
> +               arm64_rmi_is_available =3D true;
> +               pr_info("RMI configured\n");
> +               return 0;
> +       } while (0);
> +
> +       /* De-activate the RMM and reclaim any donated memory */
>          WARN_ON(rmi_sro_memxfer_cmd(sro, GFP_KERNEL,=20
> SMC_RMI_RMM_DEACTIVATE));
>          return ret;

I'd just use gotos or an actual help function.  But your code to=20
look after long term - so up to you :)

>=20
> Cheers
> Suzuki
>=20
> >=20
> > Jonathan
> >=20
> >=20
> >=20
> >  =20
> >>
> >> Cheers
> >> Suzuki
> >> =20
> >>>>    =20
> >>>
> >>> I will see if I can improve it.
> >>>
> >>> Cheers
> >>> Suzuki
> >>>     =20
> >> =20
> >  =20
>=20


