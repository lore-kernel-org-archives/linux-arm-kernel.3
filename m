Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E10C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2l0IvC+7wRYIHM8yNvt5mCgju1bnSM1YrVh4Np4UJRI=; b=tOvloLUtF/S+gfGrZ4s8JGkbc0
	hVWq95mVAnObd0YxPET+Mu0NtVpAAbZc2oFHhin6zWGWPnJfn53VLLOoBesEJiQEIP5c1pIIHHTIm
	kEVOUhiNn3w8/lZ3Z0U1DKfyxtxGt6oWaR/Bb1lKpk66nOdEVijxw9XTjY7CVnEzoeT+kluDetUAv
	DuDUfgbBCXMWF4BUA7fXTOPREDIDY+9Kdj9b15GfbVhhK+hrW+7PPRngUhQYbRYkRcEGGFaf+Y2kq
	NPhLtADnafDigEXCyVQqoOua5wfob4NpA18LkSjveQT4PECImF0I5mrK9Z6ZBdYQRrpzYXuFiyjTv
	v1U4bo0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEUc-00000008y0K-0nqE;
	Mon, 13 Jul 2026 11:06:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEUY-00000008xxL-0uSI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:06:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9ucY51089703
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 11:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2l0IvC+7wRYIHM8yNvt5mCgju1bnSM1YrVh4Np4UJRI=; b=POfeYPT3dzNfdjee
	A84jGjN1sVyE60R9docOEG6CKA+i3aSsV77vJ/HjIvIqPcI3KRtTELpLtLxBya+h
	J9kr0fQEwu7cPqSZuD8Ikr6/hFeIamQbz4JHT7LAGVOMDgsQ31bxIette34iVllm
	zNYnHppxsoibB0HRoUz9cKB2NEAtwiRaIz4S3jXQFDztfHhI3j6rwopYoeV2ZRFw
	8ug7p+nTWUL+XXKtpHLkGlrEWUbXP6/JU2GGjYzONYud58dbEWYT3ckYPxWsC1V9
	q2cSReK66b5Jr3AOjE5ZDfCYhoUYTy+KjFkbFForQVrW3a4miLY+eD6GyUkhO/R7
	jDoGrw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4r7xv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 11:06:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0f0a0760so67189491cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 04:06:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783940788; cv=none;
        d=google.com; s=arc-20260327;
        b=r3HfLr8OCiDjv8JOdRqJN5d6WpBa6k39ssa0YvLaj/8ElacMVNw90ssSYnlWkj6KRh
         A3MA9bVZG9C6o8oGe0bkojZ47XI/nBLJDZ6KpE4AhQObu5W0sdTDjBq6SQz2dcS1Pp84
         OSQCVLsb56llSkP6up2dDtl50pan6vFiFYutEuIjdNzjjMjY1QgzwFrK8wiDEx78QWGF
         J6CTwtpCrWNVLswQzU2NKw553PmoycUyGhG9BwRLeOzXTkJcPshYWWa2GZKNigi7bsR5
         spZ27JSlLqYXZgZOLXrlBEA1Ek5/oI3YkxuXWdMFnui5RQwALle0uzhP9pJNsifJkPrC
         HP/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2l0IvC+7wRYIHM8yNvt5mCgju1bnSM1YrVh4Np4UJRI=;
        fh=qIvguiNYKViYqblJYmqTKODh8eOfrKStOtrf1wMYcYQ=;
        b=VBnI4/n7gPhMn3QWB0YvIm1Cpvq3nU3zy/zqHa7n2IE4EDoRe8g3HxNvvEhN7JkJz1
         ZhfBtPccjR8Qu0Az9N3zfEAjQypr4qHUIl0G2mrANFP7nqQqSj1lJl1sLuUScvpGTCy2
         SR6BH8Ppu36T3uOpqGZ1Gts4WhOrABBx98uPwm4qkU2BQthU9DAKTyEe3F1CS776wqjm
         2RKseb24GGSCw6kDDjVx+mzw8xqYldf9RqwlUsjB7p9KapMvyqe3vQypDfiYp4lSNlsA
         EeSCz4bev3nTET8j+0hUlvaOXJOU+GnhfsZnpJqx4eYJa7JQGXJARILYcEpWbrCaRHhl
         Tp3w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783940788; x=1784545588; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2l0IvC+7wRYIHM8yNvt5mCgju1bnSM1YrVh4Np4UJRI=;
        b=B3aY13NIn8YcNrOp6QJGu3Vdg4HOnCWmeyBnj5SA9W+VBbUtiGVQ6/EAGgf+sySpai
         ZbYXUu9b2+GMQtjScpLo/Bcc1ZbwCYKne6qpn0Ca3v2ifELHDtayJw4RgP0NPFay2RUV
         gG7xzlP5NgLPfX4u958bWIneynYw6fLFvBYTig2fMVyFqIzlAuqAxpyLyHWRATHH2E2B
         P4oCrVGvq/UL1tZfShjK3woxTIGKInmgW3d9AWlQLADft9RJpFRsd4YrrUMr0gkLW0Su
         fHB+D4CcelG4yXR73PiZx06nmcPzp35C/QxY69d8M9kjw6nGaAKpgiQp1yEkDINjsJOj
         pVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940788; x=1784545588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2l0IvC+7wRYIHM8yNvt5mCgju1bnSM1YrVh4Np4UJRI=;
        b=PyzUg6O494b2qsl2rbltxnp9fNbMsDR6tC70oWUUGPtF8kNIBLUVdIzmApsAxSvZ+8
         ZZB/bnf8s2YnDzmHmNuNySCpHt4fkA3+ily0Tmu2fKm1EFhCYEp2HIzeJWtsWBKvHi1P
         MR7yAuFUwnw/+jTw6jN1lEgNRIuMmrbutcWxCLWzZoc89nNeL6hX6D5hXw8hUzIel+IR
         vjU4jDmXCfCJpFp0R5lS+k0zysrX7UVKxFK47Dnha6SpCt1oQszse6qWfZz78LNgDGER
         mNRBaDHCejNAKKKAMmupGpfwaBTktQ/fPY59h6trcR8b4YMWh+nCXvLOmhwNUmYFGzgo
         WJ9w==
X-Forwarded-Encrypted: i=1; AHgh+Rq1H6o0yI1/OArtxyhux67/pRk9ALZIQHXS3usqhQpNzWd/U/8eeXFfrLtM3t0f4pvCtvTJW1IRfwYrGpeByTHe@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvbosa1U59qB3T1Nsc6jc+RA0RI9edKIgWsmyDUR//CeCl5K7f
	vneuJ6eqOeqkhKXdbjyOQW9vAw2yRP3MfrVySevT4smt/wuMJGGMDnQdyomV0u1xg86LHS4DIks
	h6pLmpFl2P7LxOXrx1GPRTkxvvAc2aPYv7Ep25EKpK4GUzMdKNsJoBJLuPFpCobT5zGd3nymhrg
	vFS9C0SM6TFs6UHGz1FINCO8PA1Rv5AhXyaf0/DyDFkLWMNDc5tHs1
X-Gm-Gg: AfdE7ckJikwvclrDNXgUKBhgXkIZpW+hQyf/2mwkcpGS0z9ON0oGWk6xGT9uLDeI+ds
	+ESJcQrAjaxLpsCtRbIy5zOtZ9nTie1NZSwOJoTPIMok2pz0CDFuXiOiCrhq8GxXq6eYdk/0lh/
	By9ShPruGqy1+/Xw+ayNJ+jPXviXm2mu1gtPEHETMhLy2PqktzNImrsuJHKJfkgjtNTwmU
X-Received: by 2002:a05:622a:a587:b0:51a:8c9a:8fa9 with SMTP id d75a77b69052e-51cbf2ce4bfmr86920031cf.58.1783940788050;
        Mon, 13 Jul 2026 04:06:28 -0700 (PDT)
X-Received: by 2002:a05:622a:a587:b0:51a:8c9a:8fa9 with SMTP id
 d75a77b69052e-51cbf2ce4bfmr86919621cf.58.1783940787515; Mon, 13 Jul 2026
 04:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260709084635.24912-1-angelogioacchino.delregno@collabora.com> <20260709084635.24912-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260709084635.24912-3-angelogioacchino.delregno@collabora.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:06:16 +0200
X-Gm-Features: AUfX_mxflP0lESSPqjO-mD1cf2nnww1_fwPNQR52YPdL25avy66WeDOCLfhgEZ4
Message-ID: <CAPx+jO_CAWoNtW88OBroUxTWCXz0SKH3c0uPM2vJYSR65xdMKA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] pmdomain: mediatek: Fix possible nullptr KP in HWV cleanup/on-check
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        matthias.bgg@gmail.com, nfraprado@collabora.com,
        irving-ch.lin@mediatek.com, macpaul.lin@mediatek.com,
        aford173@gmail.com, mbrugger@suse.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, justin.yeh@mediatek.com,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a54c6b4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=QX4gbG5DAAAA:8 a=Z1TsUI5AZlo4e0OQKm0A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExNSBTYWx0ZWRfX+ZkYZj78Ml0d
 kHxGCJEW08izIGb+x1uz6N5JpvK+K51UYtwH6kBXeTG7p0xJoB7Jt0OXr4tL8cQiqSPZjWzAg0i
 0HDkU6hlW0fn1fKZNm5L0GBuC2ia/HA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExNSBTYWx0ZWRfX6e4haPN/k3Jo
 tWtHHOD6k7j6WKGtooNhjsI9Tj9TBzqquM3nz00wajIjYCuO6atra/ucCwwe8uqBH2PIYppI5Lk
 9nNPfzjUVMGxkgGbTy/YnfZvUHi/KsO5tWddIfEiYJORawPJumoiSiQDRS3EDZy0ChV7xF5ZsgQ
 YBDAs435rEgg485mTrJf1K49vPrQ9MUtCJc7aJcjZTRuC/RcCux8jiU857fAFNSMn5bl8U9I444
 MnzvhHMQmPvcwJLIhNXuuJcjve4YhOfGRxOOobrCSzBhzuPrYhE6BGEtVqtrIJ39xc7NZl2w8Uc
 qh8piX5OEZo0XEf1WIT0HhPb8doxMNY1T/+aFZSL1o94vJAvH4B77TOZNbbfTcNxk7CCkC94YBT
 MJbAANO5MFM8GxUS3EyezdCbqdqiPo1evY9Aq9eBHQQww0/IWxmKcp+h1BKfUwR9y7sR9kqPXlt
 JON5CU0tOC933TnDeLA==
X-Proofpoint-ORIG-GUID: cpLIF-D-9xb8tan5ekg4liQTF7PxQ761
X-Proofpoint-GUID: cpLIF-D-9xb8tan5ekg4liQTF7PxQ761
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_040630_367757_DB866357 
X-CRM114-Status: GOOD (  33.06  )
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

On Thu, Jul 9, 2026 at 10:46=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Should probe fail for HW_VOTER type power domains, this driver was
> unconditionally trying to perform cleanup for DIRECT_CTL domains,
> but only after checking if the target domain is powered on... with
> the DIRECT_CTL scpsys_domain_is_on() code again.
>
> And there's more: the scpsys_domain_is_on() function is also being
> unconditionally used in the probe path, for any power domain that
> has flag MTK_SCPD_KEEP_DEFAULT_OFF!
>
> This bug was never experienced by anyone because the HWV domains
> never failed probe, and because none of those is declared with the
> aforementioned flag - but it's still something critical.
>
> In order to fix this, add a check for MTCMOS Type and, based on
> that, call the correct functions for an "is on" check, and also
> do the same for the cleanup path, calling the correct functions
> for the "power off" action.
>
> For the latter, since there's a call to pm_genpd_remove() right
> before calling power_off, be cautious and add a variation of the
> power off functions (with a _internal suffix) for those to get a
> pointer to scpsys_domain instead of one to generic_pm_domain as,
> even if that's still working, this is way too much fragile and
> would break at some point.
>
> Fixes: 88914db077b6 ("pmdomain: mediatek: Add support for Hardware Voter =
power domains")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 40 ++++++++++++++++++----
>  1 file changed, 33 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomai=
n/mediatek/mtk-pm-domains.c
> index e1cfd4223473..f0a6339affd7 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -393,9 +393,8 @@ static int scpsys_hwv_power_on(struct generic_pm_doma=
in *genpd)
>         return ret;
>  };
>
> -static int scpsys_hwv_power_off(struct generic_pm_domain *genpd)
> +static int scpsys_hwv_power_off_internal(struct scpsys_domain *pd)
>  {
> -       struct scpsys_domain *pd =3D container_of(genpd, struct scpsys_do=
main, genpd);
>         const struct scpsys_hwv_domain_data *hwv =3D pd->hwv_data;
>         struct scpsys *scpsys =3D pd->scpsys;
>         u32 val;
> @@ -464,6 +463,13 @@ static int scpsys_hwv_power_off(struct generic_pm_do=
main *genpd)
>         return ret;
>  };
>
> +static int scpsys_hwv_power_off(struct generic_pm_domain *genpd)
> +{
> +       struct scpsys_domain *pd =3D container_of(genpd, struct scpsys_do=
main, genpd);
> +
> +       return scpsys_hwv_power_off_internal(pd);
> +}
> +
>  static int scpsys_ctl_pwrseq_on(struct scpsys_domain *pd)
>  {
>         struct scpsys *scpsys =3D pd->scpsys;
> @@ -694,9 +700,8 @@ static int scpsys_power_on(struct generic_pm_domain *=
genpd)
>         return ret;
>  }
>
> -static int scpsys_power_off(struct generic_pm_domain *genpd)
> +static int scpsys_power_off_internal(struct scpsys_domain *pd)
>  {
> -       struct scpsys_domain *pd =3D container_of(genpd, struct scpsys_do=
main, genpd);
>         struct scpsys *scpsys =3D pd->scpsys;
>         bool tmp;
>         int ret;
> @@ -737,6 +742,13 @@ static int scpsys_power_off(struct generic_pm_domain=
 *genpd)
>         return 0;
>  }
>
> +static int scpsys_power_off(struct generic_pm_domain *genpd)
> +{
> +       struct scpsys_domain *pd =3D container_of(genpd, struct scpsys_do=
main, genpd);
> +
> +       return scpsys_power_off_internal(pd);
> +}
> +
>  static struct
>  generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct d=
evice_node *node)
>  {
> @@ -884,7 +896,14 @@ generic_pm_domain *scpsys_add_one_domain(struct scps=
ys *scpsys, struct device_no
>          * late_init time.
>          */
>         if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF)) {
> -               if (scpsys_domain_is_on(pd))
> +               bool domain_is_on;
> +
> +               if (scpsys->soc_data->type =3D=3D SCPSYS_MTCMOS_TYPE_HW_V=
OTER)
> +                       domain_is_on =3D scpsys_hwv_domain_is_enable_done=
(pd);
> +               else
> +                       domain_is_on =3D scpsys_domain_is_on(pd);
> +
> +               if (domain_is_on)
>                         dev_warn(scpsys->dev,
>                                  "%pOF: A default off power domain has be=
en ON\n", node);
>         } else {
> @@ -973,6 +992,7 @@ static int scpsys_add_subdomain(struct scpsys *scpsys=
, struct device_node *paren
>
>  static void scpsys_remove_one_domain(struct scpsys_domain *pd)
>  {
> +       struct scpsys *scpsys =3D pd->scpsys;
>         int ret;
>
>         /*
> @@ -984,8 +1004,14 @@ static void scpsys_remove_one_domain(struct scpsys_=
domain *pd)
>                 dev_err(pd->scpsys->dev,
>                         "failed to remove domain '%s' : %d - state may be=
 inconsistent\n",
>                         pd->genpd.name, ret);
> -       if (scpsys_domain_is_on(pd))
> -               scpsys_power_off(&pd->genpd);
> +
> +       if (scpsys->soc_data->type =3D=3D SCPSYS_MTCMOS_TYPE_HW_VOTER) {
> +               if (scpsys_hwv_domain_is_enable_done(pd))
> +                       scpsys_hwv_power_off_internal(pd);
> +       } else {
> +               if (scpsys_domain_is_on(pd))
> +                       scpsys_power_off_internal(pd);
> +       }
>
>         clk_bulk_put(pd->num_clks, pd->clks);
>         clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
> --
> 2.54.0
>

