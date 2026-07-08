Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227C1C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 15:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMJCbXSgt5kAQ4lY2HA7hGLs+5rsBULHk8Vjj77tBIU=; b=CtidR/hUQxlUUeaboUM+UkdBp5
	s9mRvEGafSMGdtvXmSO0YaAK6Nt8MKHTF1w7azLrWmaLDdXV3Ufdg9L54sxN4jdi8ZbJSl619DB7R
	WciIwSJ3bwiMI3cxe9zLM5VhNdufcHR9Sz2m3AlNw4IZ1KYwZTSI0mRW9AfhRXmlcr6Ec3GEda7Xt
	AKxYPmJoQA/RDCBzX5V1xLZbDSaC2lo/gqkwcohPMcyCKQzEBoJW23rBPkTsUF49xkoiPE2+6lSuj
	g0VV/Sue5hOu7wK2qzB6YPfmrPbL2eDE3JGLfRCMsD27d2Rhfse2P94mJc9MAHlSBSvYsOIt8n4OK
	6tv3QAjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whU8L-0000000HSiv-2AeX;
	Wed, 08 Jul 2026 15:24:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whU8I-0000000HShx-1wv1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 15:24:19 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3TXK2617315
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Jul 2026 15:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zMJCbXSgt5kAQ4lY2HA7hGLs+5rsBULHk8Vjj77tBIU=; b=KNCMzsevlh2tuc5/
	1WnIHZZhAhaywF9mfturWOYGVfOtDmek/uPAQGzO8pf5SVlIUqrprfq9VMbsxYYJ
	In4RT4IQuLvwHdCHl2uDDy4uroXw2M6EurBD8eSU3xR6PTtrM8Dmh59iWn6ws4dC
	92CbytmCMmFTb6lNx5rnJolDTaY4yGqklGGr7xsWt1VlIFJER6Uybv8uaGV5g0Ps
	rr0TV2ROBhLa1I2l3JKNmDMytA1jSAa1NTLNCifcU+9Wn7GCxMZBY2vQc0S+n/f/
	EYdNB5Cdm1Zocr9tW97T0cxeQ0WEWUd8uVX4VjqI0hpNRSjBJRCtoKTB03j6Z/Ki
	naEIwg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9gqwa8qk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 15:24:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8eac2620cb0so13204226d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 08:24:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783524256; cv=none;
        d=google.com; s=arc-20260327;
        b=L3BXH70+7d9q2lLE6mEkzoERuU4tMm4UOQpxOezs2MEsoyH2zSJJVn6zHCbdB1NQM8
         d1kw1lPos928EmeDQZmiKHdrAjaFO5u5wCTcy9Br4Z/hqYElCQ95Z4AuKCt12GA7t6w5
         VQcbomRxd6mtlHQbQx4LtVO6HC9RUtNOkO9NyV9VBpBazaWRlRDKpVHKzeZLni68kAgz
         Y4CVPSMoxNHWxJkeLw7nQfGitJr4Vb4MLPet+ghQq4m7NYofCutxSQTiaTf86TqqlNF9
         fUz+v54E8Xq3HckBA+r1k4ctZNS82mnv2USjKysIS89MeS1GwXMBOx4GtfTt95Ch+xP3
         4Png==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zMJCbXSgt5kAQ4lY2HA7hGLs+5rsBULHk8Vjj77tBIU=;
        fh=NQI23y0eCSJcvLr7yImFbYYGF7jb6CbFukHHP8jQkJg=;
        b=SjdGtAZyGPqjHcLKHgq1+rMj0dK84PLYoMSn6ygn+yMVnMBcCtvCtAfCk49qcCQJJS
         Wlg807l8MiSA37bXW6YdNwlNUjx88zQ6DZ9lveaA6XeYSJEnnCe3u9kqOD3sZgPGEuLN
         JvOE+5i3NED5gHIQuZtiSPiccFcjW/oMZZ2ct26TUOo/X9ZAtSqyEK/k8gqIGCer5MXA
         Nf5SUdA48MuIWiCP5J/MwJ2zBOyV7qn3/1MYKq/r82KJfBdATG58dXmRSrEbsfR3cAJH
         kU4joe7IoKZ2yz//sg10DzoVkGXLQGos9kexdMJxXN2GErgfXx+Q3eMG0B17dHa9SMgJ
         Wdwg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783524256; x=1784129056; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zMJCbXSgt5kAQ4lY2HA7hGLs+5rsBULHk8Vjj77tBIU=;
        b=JpJgZSNdT/bjSmCSYtXFb67GddfdzXTZN06DIg/mp5dS/lnqGMMK8Wp6X+BMnMLd+G
         aMWLFmfi0MdtRYr9xO4z5k0fRvm+EbmlDDteCLeIni3G+v8vBkpS0qYqbIe6L85HcUPr
         D4lCLvEj2KNe0Gt5e+PZXk7RNQAoSnpu0klDNUW6wkzzgZQyeBczZ/4abKinR2oojX/5
         ctA8wI4shQ+HSaO33ZywObtgqZZLYfDTtdMb6mrEYqwNAAPaLsWTyyqL1OvbspgGyw2q
         Tfju+YZdy4VB0PmMrbeSKv2SypQ+cDjzVvgJLdyDhwirfJyemQnNnWIPi7uVcGbPSG4l
         uNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783524256; x=1784129056;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zMJCbXSgt5kAQ4lY2HA7hGLs+5rsBULHk8Vjj77tBIU=;
        b=Ll6e1Jfb87LsQt1Io9veCxz4wh01nhjl4fM4qZFgYqAt/U8DamY7DbAeRNRcl5Ujei
         vtRAM236pravYyBDDRMsZtw1AhCqwduKECZBABcCWwJvfI7bkn5gwmIRrDHlYy02AOgY
         AzozgVykJmbLkLWynBEN13ddwJ2Yec4CQCMiXuGJ/XeQliqEMH8wxLANkmYjQo+sU5OE
         WhVUqH7r3Adoh84vJ+cBjK9gfDZcZH/eHeD5QBPmwycC7+Db8ApCeIBZogic/c3dd8x/
         blFEC5Mr9F5ljiWn004y6n3GmDN2l1XPiYm6H74tmKhMyxKbQC/FdgqQkveynd0ZmVda
         RAPA==
X-Forwarded-Encrypted: i=1; AHgh+RoDX+nUdrD/PNcWmhsi0KNc6wLiOLS93D+wN+b1Wm4RZHXWcTAX/2PLnozKfQQppeneJvmeQOQmllOO5IDgrdAf@lists.infradead.org
X-Gm-Message-State: AOJu0YzTw5Phik8qBS1LMav0bFHxVpvVJDrJuclQR6rsPkhphb+KV2+p
	M9ZZeDyrReR2fn8rjMMFLW451BCVzp7jKD5ub6+u7dJvJ0d8q/NBBzbTxmr9gFdByneLtmNqdJh
	duKGOzPT4q6rXRBhFoylBURM+BPUgqljZP/RjXf2ospb4chkwlnwl2tYaOX8IHNTGG2VUsQS6sl
	tgNHivirE8nx45lqFJzHTF6aXhvY7uCpaMEC+HUZ4GAQI3heAKuk0e
X-Gm-Gg: AfdE7cm7yITPTyc+OgrQ6khgbMTIIuM5InkGmKkgpvDJclLRxkAaiX22fWd7D80ULR0
	LJkQBvyMVhtjTx+JNaymetNYyeVO2i356dXEwsbpAOaEqr1tQ0eB9Is5qt7qriOKqqrErjXxadx
	t4AL5Dtu9ifpvUpZRQd6/EXu6ez5vnZzyPwwBZhgN9wuaft8KFZ5lMhcGhYqM/ulvWtYsn
X-Received: by 2002:a05:6214:5504:b0:8fd:6df3:b377 with SMTP id 6a1803df08f44-8fec323e5b7mr31147496d6.59.1783524255418;
        Wed, 08 Jul 2026 08:24:15 -0700 (PDT)
X-Received: by 2002:a05:6214:5504:b0:8fd:6df3:b377 with SMTP id
 6a1803df08f44-8fec323e5b7mr31146966d6.59.1783524254959; Wed, 08 Jul 2026
 08:24:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260613070116.438906-1-midgy971@gmail.com> <20260613070116.438906-10-midgy971@gmail.com>
In-Reply-To: <20260613070116.438906-10-midgy971@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 17:24:04 +0200
X-Gm-Features: AVVi8Cct2pvQNJ49kCocOmZ_g-M7AfBNrJ0WxbavryIJprjGJGNLahRi4HQp2RE
Message-ID: <CAPx+jO_2=SYo0smYzwd8T+TUtHZtgXU0dSWQgZGZ_haV3aOU_Q@mail.gmail.com>
Subject: Re: [RFC PATCH v4 9/9] pmdomain: rockchip: Add a regulator to the
 RK3568 NPU power domain
To: MidG971 <midgy971@gmail.com>
Cc: tomeu@tomeuvizoso.net, ogabbay@kernel.org, heiko@sntech.de,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        ulf.hansson@linaro.org, dri-devel@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        xxm@rock-chips.com, chaoyi.chen@rock-chips.com,
        finley.xiao@rock-chips.com, diederik@cknow-tech.com, jonas@kwiboo.se
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MSBTYWx0ZWRfX1x/DDmQRO2ds
 YpPZqgaQ115gw8NXZGPG2ERhH5uXBNhLFP5fUoQYxPmaSVINq2apP0v99pwEATUn6EdNmTmkDpQ
 efYnRVZ7gdpHZblJGLnvhx97AIraotlYSjh+pFvdo9pducbqMBnEtijFHScEXbmcZVWHQvJQF2Q
 Knlk9X3Rn1nbPcrl8OscxUa1mraA90nBwcIeiIgmsX1JikFkpC39e4wp8EeXJFKo250FGKzhX9e
 Jz7PTxiqwTfSnZ8/KQpiICqGdgPTs9UiW8oQANUaNpoD8h3arue+HjmkEAfxxshPVNfa8fx2uhF
 pHI7J7/0eJ3nzxtfwiYpAtemlQfECV1xFTccf8B+9gSUcDcQskbWEBkObKm0lDBtRGZ8d/YuZKi
 vNFxf5+we4Bz9RedyqGgiizKe+Da0rIseNJEqtPIpASQZUGQvL1C4jSIlxoNYsNkqHdFz5xp8W9
 2kw085vlQTTpCjpHb4A==
X-Proofpoint-GUID: fFMfi_7CstYoVYq-d5uMMhBTFPtTou_J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MSBTYWx0ZWRfX9p+5BEYPoBdB
 KUlI0/tIZQiRMAmWkFXw3Rq1G1yV4SqaZIkOKY3Je9uBG19lSLyBIjiY4JqMV9TKAX6Q3uPIFFX
 VCZ6cDiaDhnA/1NWFt/mUuzZkb92F2I=
X-Proofpoint-ORIG-GUID: fFMfi_7CstYoVYq-d5uMMhBTFPtTou_J
X-Authority-Analysis: v=2.4 cv=Wf88rUhX c=1 sm=1 tr=0 ts=6a4e6ba0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8 a=s8YR1HE3AAAA:8
 a=bcpWyJPC7eKr9KdVfhAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_082418_503900_D0A3CF86 
X-CRM114-Status: GOOD (  23.68  )
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

On Sat, Jun 13, 2026 at 9:01=E2=80=AFAM MidG971 <midgy971@gmail.com> wrote:
>
> From: Midgy BALON <midgy971@gmail.com>
>
> The RK3568 NPU rail (vdd_npu) needs to be enabled before the domain is
> powered on and disabled after it is powered off. Give DOMAIN_RK3568 a
> regulator parameter (like DOMAIN_RK3588 already has) so the NPU domain
> can set need_regulator, letting genpd manage the rail wired up as the
> domain's domain-supply instead of marking it always-on in DT.
>
> Suggested-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> Signed-off-by: Midgy BALON <midgy971@gmail.com>

This looks good to me. I assume this can be picked up independently of
the other patches, whenever you decide to move forward from the RFC.
If not, please let me know.

Kind regards
Uffe

> ---
>  drivers/pmdomain/rockchip/pm-domains.c | 36 ++++++++++++++++++--------
>  1 file changed, 25 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index 490bbb1d1d8e8..19db307e3811d 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -138,6 +138,20 @@ struct rockchip_pmu {
>         .active_wakeup =3D wakeup,                        \
>  }
>
> +#define DOMAIN_M_R(_name, pwr, status, req, idle, ack, wakeup, regulator=
)      \
> +{                                                      \
> +       .name =3D _name,                          \
> +       .pwr_w_mask =3D (pwr) << 16,                      \
> +       .pwr_mask =3D (pwr),                              \
> +       .status_mask =3D (status),                        \
> +       .req_w_mask =3D (req) << 16,                      \
> +       .req_mask =3D (req),                              \
> +       .idle_mask =3D (idle),                            \
> +       .ack_mask =3D (ack),                              \
> +       .active_wakeup =3D wakeup,                        \
> +       .need_regulator =3D regulator,                    \
> +}
> +
>  #define DOMAIN_M_G(_name, pwr, status, req, idle, ack, g_mask, wakeup, k=
eepon) \
>  {                                                      \
>         .name =3D _name,                                  \
> @@ -241,8 +255,8 @@ struct rockchip_pmu {
>  #define DOMAIN_RK3562(name, pwr, req, g_mask, mem, wakeup)             \
>         DOMAIN_M_G_SD(name, pwr, pwr, req, req, req, g_mask, mem, wakeup,=
 false)
>
> -#define DOMAIN_RK3568(name, pwr, req, wakeup)          \
> -       DOMAIN_M(name, pwr, pwr, req, req, req, wakeup)
> +#define DOMAIN_RK3568(name, pwr, req, wakeup, regulator)               \
> +       DOMAIN_M_R(name, pwr, pwr, req, req, req, wakeup, regulator)
>
>  #define DOMAIN_RK3576(name, p_offset, pwr, status, r_status, r_offset, r=
eq, idle, g_mask, wakeup)      \
>         DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_status=
, r_offset, req, idle, idle, g_mask, wakeup)
> @@ -1274,15 +1288,15 @@ static const struct rockchip_domain_info rk3562_p=
m_domains[] =3D {
>  };
>
>  static const struct rockchip_domain_info rk3568_pm_domains[] =3D {
> -       [RK3568_PD_NPU]         =3D DOMAIN_RK3568("npu",  BIT(1), BIT(2),=
  false),
> -       [RK3568_PD_GPU]         =3D DOMAIN_RK3568("gpu",  BIT(0), BIT(1),=
  false),
> -       [RK3568_PD_VI]          =3D DOMAIN_RK3568("vi",   BIT(6), BIT(3),=
  false),
> -       [RK3568_PD_VO]          =3D DOMAIN_RK3568("vo",   BIT(7), BIT(4),=
  false),
> -       [RK3568_PD_RGA]         =3D DOMAIN_RK3568("rga",  BIT(5), BIT(5),=
  false),
> -       [RK3568_PD_VPU]         =3D DOMAIN_RK3568("vpu",  BIT(2), BIT(6),=
  false),
> -       [RK3568_PD_RKVDEC]      =3D DOMAIN_RK3568("vdec", BIT(4), BIT(8),=
  false),
> -       [RK3568_PD_RKVENC]      =3D DOMAIN_RK3568("venc", BIT(3), BIT(7),=
  false),
> -       [RK3568_PD_PIPE]        =3D DOMAIN_RK3568("pipe", BIT(8), BIT(11)=
, false),
> +       [RK3568_PD_NPU]         =3D DOMAIN_RK3568("npu",  BIT(1), BIT(2),=
  false, true),
> +       [RK3568_PD_GPU]         =3D DOMAIN_RK3568("gpu",  BIT(0), BIT(1),=
  false, false),
> +       [RK3568_PD_VI]          =3D DOMAIN_RK3568("vi",   BIT(6), BIT(3),=
  false, false),
> +       [RK3568_PD_VO]          =3D DOMAIN_RK3568("vo",   BIT(7), BIT(4),=
  false, false),
> +       [RK3568_PD_RGA]         =3D DOMAIN_RK3568("rga",  BIT(5), BIT(5),=
  false, false),
> +       [RK3568_PD_VPU]         =3D DOMAIN_RK3568("vpu",  BIT(2), BIT(6),=
  false, false),
> +       [RK3568_PD_RKVDEC]      =3D DOMAIN_RK3568("vdec", BIT(4), BIT(8),=
  false, false),
> +       [RK3568_PD_RKVENC]      =3D DOMAIN_RK3568("venc", BIT(3), BIT(7),=
  false, false),
> +       [RK3568_PD_PIPE]        =3D DOMAIN_RK3568("pipe", BIT(8), BIT(11)=
, false, false),
>  };
>
>  static const struct rockchip_domain_info rk3576_pm_domains[] =3D {
> --
> 2.39.5
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

