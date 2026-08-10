Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A97CC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TV2EQ2xg94/gFwpPmqRGt0+RWBXJJXwWFz3sZUe92ds=; b=Xmpwlq2CQZqeEFQvmEfcWIe2Q+
	31djOzi1P0+jvlXWOfLJVJLftuV3AeGrbHKUnf3LTZsqBD860jlLEt1tDK83Sx/JIuRruAroJwpVa
	4mv/rehSTpa7dCKEjgS+jOjFqwsGbij6IOKudn2hbAF5FZDJkqdRWZ+8LZsLjaOTR/Z7KIICcdHXe
	V/yYV+dl9goAxCv9UCnTQTTbzRzEr5VH6OiYiDFpOQSfUejvOABb9+o5Lz5FVxH9MA5mujP+RusEf
	rw0V4znwZK/bCePnj2yl23x02D1J06uojUVbF6jB//P2SEl8G18V/aT6Laz1i+IE/yjaSjU9BVFEq
	oCaOJk5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQqq-0000000BykK-1vL4;
	Mon, 10 Aug 2026 14:19:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQqj-0000000Byjc-0GdT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:19:38 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACjZ6C1596877
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 14:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TV2EQ2xg94/gFwpPmqRGt0+RWBXJJXwWFz3sZUe92ds=; b=Ev1TpKH3ebEU1fy8
	g+4xebhPHPUNEgczi4RSZlAAra5Cj91TiMJid3WIyK5/K42u1qxUcjk7uUCBQHoM
	D8o21YcfVK1/Y97choME6/qa7CdDIhuHrlaVEOIr7xgiuVzpWUQGLsJRHjecc0X8
	5OmdKvdY1UX2SdEE6NQg2yuWzpmvtnJjOYPGFJ+VOPekQ4vxFoORjT1aoxhP7vvV
	YYapTAPpjm+7JFbvSNZqrR5jaeN6QyO+1y8HV8IIM1yy0lsfCMSKDFY5nXQLSOGp
	AE5sKxscyBtkwJygu9QY3Z06kIxGDzYvIbVbErm3jiF7vYdIQvt+b22j8wAU+yxK
	2sR7gA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v6symw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 14:19:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d7886cdso37966251cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:19:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786371571; cv=none;
        d=google.com; s=arc-20260327;
        b=iV0utFkuhG65yt+bxOyNyJPl8igHJEbY15Y6xGUq6uZ4sCyce4cvJHXE1MiHZ6LloH
         UQh8+wyHxvVaJF+fR05V2lHijwCAtbflqc8qYDXZz9dN5oWx80fjZloQROcZH75i8YI1
         WQYrdxWP86R0SwXKPzOe+05cGCN99a/tjTk9q6xkNTEU2nbMJJ1UGF0qRqOj7DQn+c54
         0z0q47k4ucKoDQAKP8+6lshc0GBowOP+TuP2JGofB8gRphEjuz8Rr+M/fiiIeIGhqTkk
         2rcMhgWDWnVI+srlKshCZiqIpD1YxovZpxlIc5/jgVAxZBylBI20pDndf0V0OKJPoG8A
         620A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TV2EQ2xg94/gFwpPmqRGt0+RWBXJJXwWFz3sZUe92ds=;
        fh=dcrgIXAPNVzwtN0ndCpoeNoKmJ0PvCBaWHbBLSLIvuo=;
        b=QesTiDweknBUa/8ybDb+o3LVCsB0hQEDLqIlk1EUxFd3gtmYfUvKaHEdE0tQQtI/dh
         VscQmTCGVpSV9cY+z1FTzEjxgusSRaVUUZZIErf7MKJYXNxpUe4mruMjrvT16gZxY/EP
         xeAv2RCgH0dwU2gAmFPzvz2M3Y0QrJ+dSZDCmqOQ4NlIseSc3xSf2VJMzRzV70RsL+ZC
         i8uC369mO0AgaEG8Ad6uEs+boE9XRXzKsR5HH6a30p8jdib9UQ/seK2Iidg+EOw/gKZj
         hEDJzW2mY6C/ymorQGCPy2QbnM08WPcDlaerQWYNJZowHR8Fzz1XQyo2GkpyeNZVaIYt
         Hmpg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786371571; x=1786976371; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TV2EQ2xg94/gFwpPmqRGt0+RWBXJJXwWFz3sZUe92ds=;
        b=YjijHzB8rTjxFxY93ULSSir43xEWTdRYZRYyVcZ0xVPHmhIBBMEqd9BxMgbdD3zXII
         4J4hbcsVCPfePT+MrXK6Kbveov1YdxuQFuty9BgP6GEbwY2x6rWubQWylEWjOGECubBC
         o+RypLXIuGktQhgd73tNzXJ7yZeWuplEasWqeGNFS41oCiYXrSNfArOMam3lgWxxNm9u
         X2pv+Ya5D1ogyoYFPxPGFY361KYKb90UQLY2zZUB/iTawvyXOQ4Fl661X4jX0PJI6xBN
         awIRSvEjBRH84yGdM3zON6+KuDTS7/xpb/KX3/PYBQZuZvQvP3FbM6jNK/nnBJ1+YZ/H
         lUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371571; x=1786976371;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TV2EQ2xg94/gFwpPmqRGt0+RWBXJJXwWFz3sZUe92ds=;
        b=C0DipGhn4ePOH2t8/kOZ5bvdCAAdSkF3KL6GDbqqIq0T/czep8Hg88fQEsNX1+3Qff
         BeIyV3eMpqlZRUJPPakJtX7GE2FjVuX+rPKSn8y6lcgfwZt2vszBtCrV7mIH40BMlLdV
         mb9ynOvavr4+VUKrxoqQXOClRZhFuKHzTdlhSKXVqA+iIZEV7/g4AsxYagAF7I8arJSG
         0e0IPOLvJOiH1qGD0T/5vaIGjgmE8m/WZ9Ocmv6rb3acEivQRrjS7gbbifyfjEweGbYI
         UJRCSC8S6lTx6od3wPqYhtxxGCPSsljuUPNQcrlJKHorwQ41gOazJaMk44VR2pICYzUM
         vqeg==
X-Forwarded-Encrypted: i=1; AHgh+RovXzESmzLF6WN4i2v2I1557MuB10ikpvrWrzCzl8BaDWXeEXbe48yYUli4nDtx7kJMnoFpcaOzvhYNhyk3JT3r@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf4cAvvegWRmeZFsEMZQuacaB5YkLoj1dOvis7vSgdtKaHvdAR
	H6gJHPMxC9puvH44Ysf7mXMfTmxUNcZ4Y17ZkfhMjwGoD0tlnErXPKa9IY0lghgtWfAYKPyskfm
	pfWIWIh4jGsDOQsluQNx1zQqDmJ3KSMX3Gp6ROoAy7wGfyoA7d94cCRsIV562T7QSAuzVo/xLqu
	ptvQVn9zYYNoUhFvUSdRxUeQrhRA/XN5aqjHgrR+s//U2nL13pgZOaQuLHOFWy
X-Gm-Gg: AR+sD13v1QzNV2xlVCS+Jtogtse6dBMEdryV6XeYO3+FxhmEcjlScnaL14njl8imGBb
	w5vycfmR/ArRaU7+Pt87uR/7nieqL7Qr9byLnQpe5CCCocXCnyJtfB74lLVghuSWrBxvkRqYv7I
	532e6FWmGpWu4QKUwC/7ynFzN6CpWVzwRmAFsId3rLKVqYBZe9qDXZiKQ+nw==
X-Received: by 2002:a05:622a:4c8d:b0:521:8ef0:b4e0 with SMTP id d75a77b69052e-52d4bba4201mr24352831cf.17.1786371571047;
        Mon, 10 Aug 2026 07:19:31 -0700 (PDT)
X-Received: by 2002:a05:622a:4c8d:b0:521:8ef0:b4e0 with SMTP id
 d75a77b69052e-52d4bba4201mr24351481cf.17.1786371570441; Mon, 10 Aug 2026
 07:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-1-61171ab1cdce@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-1-61171ab1cdce@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 16:19:19 +0200
X-Gm-Features: AUfX_mx3R25JFulSxbPIMFamz2pIVHYPn9K-rVq3DlUVa-mxAozC_itBBx8G2xk
Message-ID: <CAPx+jO9MZTsDpofZ0fR7FxJbrfuAV+soqN3x7ttK-F7o6MkYmg@mail.gmail.com>
Subject: Re: [PATCH 1/7] pmdomain: arm: Fix -EINVAL from scmi_pd_set_perf_state()
 on state 0
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, mukesh.savaliya@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyMyBTYWx0ZWRfX7aNH67vy/RPP
 DGCq/+62YVhXkLwvOHdH11QjCJSby6H8m+r2E6N4GidptthVKcx9i1poTQD56r1s1kLN2LOvqbs
 Fb3itDY8EsA1B+Pc96bsBquYp817i7s=
X-Authority-Analysis: v=2.4 cv=PvijqQM3 c=1 sm=1 tr=0 ts=6a79ddf3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=IN2mYG8luz48gvOoqwMA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyMyBTYWx0ZWRfX8hqCtpIXYBCT
 PydQ4yAc6xQWBlD68mtC3MTCcr6Xw2wMz66x28izyxKRBAvQudBdVktPTMo0kFLHmB81sRIckCz
 7S4Wi3fP6MclwjBFbn8GMaBXdnlajNSxZUCiqYDUxDOeDqyg2v/P7kgyB6hM5uPkXeuqWuKA/xv
 /N3tgUOSVLdmsECxE+fTwhvzuQk2LZWlP4Mn1UdLv2L3UrQZxJRkofJd94n0PBaj1SfBZhjEUMa
 dDX9zN2smUH42RrsFU1ASfj1aqevmqwrLT3JXkS5S5PJRshVmwxFEeuyMnyapLXRDClD3RAejxo
 dOjMbJHaPb3t+c+bLX267hwmUng3vgkLP4JOw8Q6Ssd0oGf867F08j1v8SCZzEdYOXPZmT7M39n
 LlemsAOyhi5wKSA0k5Psx5CQ7Qg66zQP7FT9kOCgUeWK5NV4BrKcgRgFfuBFIxAtBjs+4MlNQ/u
 RK52vX6dehfnSFMWMZQ==
X-Proofpoint-GUID: PoM3SBn8mSD3PIgGzKjjNhqWyoR8CTZy
X-Proofpoint-ORIG-GUID: PoM3SBn8mSD3PIgGzKjjNhqWyoR8CTZy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_071933_219969_43A6A414 
X-CRM114-Status: GOOD (  24.54  )
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

On Tue, Aug 4, 2026 at 9:58=E2=80=AFPM Praveen Talari
<praveen.talari@oss.qualcomm.com> wrote:
>
> Currently, scmi_pd_set_perf_state() treats a performance state of 0 as
> invalid and returns -EINVAL. As a result, devices attached to SCMI
> performance domains can report failures when relinquishing their
> performance vote.

Yes, this is indeed a problem. I recall that I hesitated when deciding
what was best here, returning an error code or 0.

The reasoning I had for returning -EINVAL, was that I didn't want
genpd to believe that it actually succeeded in setting the performance
state to 0, when in fact it didn't.

However, except for the problem below with the OPP library, it
actually also screws up the internal performance state aggregation in
genpd, potentially leading us to running at higher state than
necessary.

>
> The OPP framework use performance state 0 to indicate that no performance
> vote is required. For example, dev_pm_opp_set_rate(dev, 0) is commonly
> used (by firmware or linux)  when a device is runtime suspended.
>
> A zero performance state does not require any SCMI performance request
> to be sent. Treat it as a no-op and return success instead of reporting
> an error.
>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>

I added a fixes+stable tag and applied this for fixes, thanks!

Kind regards
Uffe



> ---
>  drivers/pmdomain/arm/scmi_perf_domain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/arm/scmi_perf_domain.c b/drivers/pmdomain/a=
rm/scmi_perf_domain.c
> index 3693423459c9..e390f902a444 100644
> --- a/drivers/pmdomain/arm/scmi_perf_domain.c
> +++ b/drivers/pmdomain/arm/scmi_perf_domain.c
> @@ -33,7 +33,7 @@ scmi_pd_set_perf_state(struct generic_pm_domain *genpd,=
 unsigned int state)
>                 return 0;
>
>         if (!state)
> -               return -EINVAL;
> +               return 0;
>
>         ret =3D pd->perf_ops->level_set(pd->ph, pd->domain_id, state, fal=
se);
>         if (ret)
>
> --
> 2.34.1
>

