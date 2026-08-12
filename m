Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE83C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 08:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nFA0x3tEHcygP6g65ynR4Scuteb+g36sIUIIXpRnoqc=; b=wICWxYpZ8Xv6cybncrCO37a7fR
	Lhps5XAtk7njW1OaM/gCUpDl2Ty45BrJyzmyOUAH+PKcoxWOpEItuy5aZFeWmD0aGpKY9IEgCUg5g
	AXt3v5uSpNkv73KAy9lHAO7pLiEmJ4u4lOBPqN0jnB29QuqyIHeZLcrkoYo7NAistPhdU8O0emeqk
	bQQxF9PQkvVvv5gLaCyIfm9cZf3ta1U5Mvo6zG7cfer63g2zzFY6Xr9/qJp2HMPg+8AIyjzXLRQ6i
	RxBO8e8/vQWp0bf+2SoMWV/CtzWP4XjU2D8+CXC38cjQOvXGH3k/oieIedelpuQ3IvDQrNIqYf54u
	GcMh/JCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4mt-0000000Fgdh-2hwR;
	Wed, 12 Aug 2026 08:58:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4mq-0000000FgdE-39Dl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 08:58:14 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C8YqjT3847945
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 08:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nFA0x3tEHcygP6g65ynR4Scuteb+g36sIUIIXpRnoqc=; b=GLN4Thzw5ppeE/wd
	AoM/dI436IbDimGs9DiOG5iPm7qlx7v6S7ZCsWR5VkX6AqY1pmkxpxFieue1OfwE
	uP6toMsp9mFWD4H8oo74JxFN9Uy2fTTcpLx3+PPSNqpAoRyV8on7fVC/V9hGkHEU
	jNl3i7/7rzkLABjCcbrgPjKcje0Byp9mHuIMQ21dnkMxYoMpUj6/sCSoshoJ0mGv
	sEebEGKjtdgAeNtkyZD6m5oYasD9OiE0K57Zn4jMExI5k71q7lRgP8Sfv0tp4RZA
	GkKGzEYPkJUm+7KevEH3JBqjtx7o6eEWMvOhpmg7vQWgQw50tIJngXLdC7yGIGsn
	jqnT/g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g08j5k11b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 08:58:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84c4cd31b51so2049135b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 01:58:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786525091; cv=none;
        d=google.com; s=arc-20260327;
        b=bJ2Ti1BcFuSXQWK3ik4GoFBOsTcHs8fE2ZtOJMc8aqVIIYOEjTdq5CdUGVswUUh5oG
         KRD/8cATNXgvER2WPQD/mhD1K7hJ/m+GYIYRKSuUyk/sPSTVz4jxTMiztsLI+hf1R4VC
         JBh2JNrrEqT6rEC4KjNmDS5CK0UPoP802TfRyySnlDFsYl01dQzPb7QKAKytLR1T3Mma
         gFM+wt9xodbQCRZNzKt+JF26hj+E5fcH4+jixp+jt8ee9tWHlgJIl67B5L2Mx4gs3plN
         wpFEjl/956+FcN43domvHayimqXbyULHUyiXj0igseGxUcim+eagyyJM5Wfl1lgEMfDh
         1uKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nFA0x3tEHcygP6g65ynR4Scuteb+g36sIUIIXpRnoqc=;
        fh=C6Sm7/Cejp2JziTFKTOezoKBpkkvn7UFsapsr+ZRhF4=;
        b=Yo93vQJERLNuJHYZUFX4glHPR9C9x/eecffDKkA/AboUnVPlp3sRsJiAFwkHCuyh5f
         LhJHxR5B3hcxYAj9m1jKgKC4z7ebJR5VAArUpyDLZvRdKFzr+Ts3yp0ArxJmTRC49T4/
         qSiEJ5g/AafbUs+E8c3GqlIS7mEH0mw2HbYWRMEm5ObHhShaGKxtrpZIOfOWXAdQ7BiU
         WMbd+iaPK6PNLjUr6epHWqaoMrG+h3vIZbwVNEiKCg4GOIOl0FM+gu658MnmS26Cg0eo
         7yngX/zffoN+MI5i9lM/PrPvLlO+CW2kmkW6dcGnUkJg9/+eNLWDOdVWyBorpv+SuiWB
         /pwA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786525091; x=1787129891; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nFA0x3tEHcygP6g65ynR4Scuteb+g36sIUIIXpRnoqc=;
        b=AqP+e/enl5f+CdmHMjXaSAI1v/nzKJqt8cUl4qE0AMtNQEQEDrRMBMcR2KVrkL639p
         pxrURjQtRxNR+CP3riD2S+7G5/psrCTPxzzJ6nUiyy7RKLKMPc9yfMEBCCYPWczRg1UU
         u03zhx1n5e/QIQcncmoWDMS2bmy/A9puIFC88tj0jDTZFA9ifMZP6Kw/iZO8uFWTVHGi
         bA52S44eGluwQ1gFhPWyLd/VHd4uJrkrz5KUr5R8SmtG+jkSqRaW6aVkuEx+9i613j/4
         TMFOCoeeY7zFkfI8DNxZpCQhx0w19m9SXeklyOnxZthOeqUBLIl1wi5sUrpig8aHmcva
         d/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786525091; x=1787129891;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nFA0x3tEHcygP6g65ynR4Scuteb+g36sIUIIXpRnoqc=;
        b=Z3I5ABaqN4zVgBPZpgnXHhwzudAbljTY0TE6pk8Ch1y3WCoko3K/4GXhn5QvUSibn5
         Xn71PX36Say6jsEE3GBF+p1H11bUtvKZC/g7dT6ybsFLvp49Hx+VmErdg6jPdOgzEM/f
         +RHxeuQWhO5t0l+hM3YPPIrDztoFE4NfeRvfp8tELQvU1Rjocdw022hE2WhbTNSmIG0f
         /vJmdB7BdurK5tvNoLGVmjxzR3QrTWQ4zQ/1n4TsI8ez1+ipsqaJgXbAfpJnmtE3CV9p
         D7b1/cttcLhbDMS6XyJPIVtnUwm7+1ChByJFRZjSoj6nI7vmBAFKJJBl2ZnFA6eiS3Ew
         o4SQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro/gKpbXkk5OtGK7mAJIBxHeL7HfaNLMHujquoiu51RfSYxXSk1+tS8SBRms7wEwe7BzM8eY5G2zLAEY4E2NZ1o@lists.infradead.org
X-Gm-Message-State: AOJu0Yzeh6PQgvoPNVQUQu9jH3mGbAzvICOYZVE86BSNJvrx5Vu0HPCN
	UKWo1AeFBBzaDruxpj/xJCRNt6iJDja2f/Y5MmGdwOSRN4td9qSOvEexpuTDuiwlrh3XJkpUX4N
	ncbyhJSByeFcoRnGH93EL0J0nqRDrh7k/sfmtQLvJgc4p3Vk9uE7Nu4BUSCCThC1TeWaGrfWkhv
	majQNd1bH2pWWdjbzvsWdHifTfAVllv2OgwQchv3PidNTg52iob+yt
X-Gm-Gg: AR+sD10dOObBhLKBALO9ynmgKAuLmOCnzF+lp6Fvg4jtGa4lID9E3mwc+m1T1Vv0uEO
	IjrgpN8aVGlKjnxvO7S2xD+2iSoc0JB8MC/20W5x7W8r6p5313KnrCmN+bz0u1Esxfn0R0fV+QF
	5dUWOMqQn2xNgLzHE68DA5ymyTCAMXpNFKlcWIW50XR6+605/NSjmArMAzacwnDRZty+JuXYYTy
	X8W9BFtYUaD4dkXrA==
X-Received: by 2002:a05:6a20:3d1c:b0:3c4:1916:9d44 with SMTP id adf61e73a8af0-3cc3f913cbfmr3419275637.16.1786525091127;
        Wed, 12 Aug 2026 01:58:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d1c:b0:3c4:1916:9d44 with SMTP id
 adf61e73a8af0-3cc3f913cbfmr3419211637.16.1786525090708; Wed, 12 Aug 2026
 01:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-1-61171ab1cdce@oss.qualcomm.com>
 <d5d64ea3-9c6f-41f5-adc4-9923381d732b@oss.qualcomm.com>
In-Reply-To: <d5d64ea3-9c6f-41f5-adc4-9923381d732b@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 10:57:59 +0200
X-Gm-Features: AUfX_myh6JDkLkJD-gnKUbWgAMFmmHbyR3eCYV8kAAVu1iWiCFaF1Y5_s5Z16ro
Message-ID: <CAPx+jO_-1tZfZcjae9shyWcKPsj0fM1SvRzC9_JVOvJr--EeuA@mail.gmail.com>
Subject: Re: [PATCH 1/7] pmdomain: arm: Fix -EINVAL from scmi_pd_set_perf_state()
 on state 0
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA3MSBTYWx0ZWRfX23M3g8aMkGyq
 lfqYUfCTNKy6CyNYtG0/jZM+KNcsdnfi6wb5PyJ2uvHkFdmWOJnghUWPIoCVOq/YiFXgMUZmzEd
 0G9svMTuGYFrX6pBM72YL5e6GEUQ/qU=
X-Authority-Analysis: v=2.4 cv=evHvCIpX c=1 sm=1 tr=0 ts=6a7c35a3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=4tH4gHCIEoDemCCG4kIA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: CaOjnnUrM5g1UN8gvgOZSF2QwJSpR4Cn
X-Proofpoint-ORIG-GUID: CaOjnnUrM5g1UN8gvgOZSF2QwJSpR4Cn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA3MSBTYWx0ZWRfX6kcGXzmyXsNA
 Jy1rmA+CETMNaYwxQ5Wsyaq51cG1kz4yvtQh8unjNW6u1UQ4hyeaOwo3y42wieO2p9WbERYOiC5
 AV9qa8G/S+Oseo9/BT4C9qiBFBYJ/TNvR/G70jTt9XzkKIIMyp01V2uPHSYDWRkskqsI6TT6vjP
 cmHnbCqN5ZIxXIX/eTdiKbsCHEVvrr6VmEtgggCRMl9eODU3eS/JBWrb4SoXBkM49mSsMRIL4ay
 IrE0TBIcC2Z+fRrFrcbO6e+n6k2wpNQ9bK2eWJ+HGxRm74PdmwQYtgnOAXeLpujz/atkDsxSkz9
 gQkNv48Ja7IZFjf2Rg5xreUfvzUmbPLKXs5W2fnmA72Q+uvBrYxmS+GrM5LuC77jv+zOgc0QB6n
 epEDPoS9c+1vxdJoJvPGoDSZGcCAeodjaixI81KdXd94zLGSAu8fZXUt47RmFq6mTxNoasyOr+e
 /tzidUR3AOxQD5IadOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_015812_823837_CCC9912E 
X-CRM114-Status: GOOD (  20.51  )
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

On Wed, Aug 12, 2026 at 9:24=E2=80=AFAM Mukesh Savaliya
<mukesh.savaliya@oss.qualcomm.com> wrote:
>
>
>
> On 8/5/2026 1:27 AM, Praveen Talari wrote:
> [...]
>
> > ---
> >   drivers/pmdomain/arm/scmi_perf_domain.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/pmdomain/arm/scmi_perf_domain.c b/drivers/pmdomain=
/arm/scmi_perf_domain.c
> > index 3693423459c9..e390f902a444 100644
> > --- a/drivers/pmdomain/arm/scmi_perf_domain.c
> > +++ b/drivers/pmdomain/arm/scmi_perf_domain.c
> > @@ -33,7 +33,7 @@ scmi_pd_set_perf_state(struct generic_pm_domain *genp=
d, unsigned int state)
> >               return 0;
> >
> >       if (!state)
> > -             return -EINVAL;
> > +             return 0;
>
> Won't this cause an issue to other drivers ? how are they going to take
> action based on changed return value ?

I think it's rather the opposite. With the current returned value
(-EINVAL) the driver doesn't really know what to do. It tried to drop
its vote, but that failed - so what can it do?

Moreover, from genpd point of view, this fixes a real bug as the
aggregation for the performance state becomes incorrect during runtime
suspend/resume.

>
> Remove Acked-by due to this till i give back.
> >
> >       ret =3D pd->perf_ops->level_set(pd->ph, pd->domain_id, state, fal=
se);
> >       if (ret)
> >
>

Kind regards
Uffe

