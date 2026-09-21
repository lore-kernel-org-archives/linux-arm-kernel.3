Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3ABC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JWFmv2D8/n3cqAMWWL5EdMJGzYRCNgACARfCCr83z2U=; b=4T/R7Aom6PlRwwREqxp9r4LOz4
	bK/0oAq4SgkMzKqRWOpV8fwlh2/xteSax0nRsabLS7mjyaZyRjTYSa/wD1DmncLoxLpt/EFm/BdVg
	ESk2/ZcHgT1NIMurBsS3gGeAR5x8sUtTESmnaVClipewFeUZQl0AO4ltU8YmmRF54w08GWTmTDIu7
	0SvWWXz/l3F0lzDNNE3/yUWZUr2UQNVkn+RoMDisSzk55eTSVf5f2kp9OwDYTqpVVFJpSIYoppPcx
	1feVFPqoDqr5YIX3BbEIsf52FCPCSfWpaj0N7b8aAilnSW02oQt+Iu7GbYC4rDaht0xqnhPu0WMXn
	r0ypJo8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8f57-00000002PNp-40KO;
	Mon, 21 Sep 2026 14:33:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8f53-00000002PMR-00J5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 14:33:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LEGbuK763701
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 14:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JWFmv2D8/n3cqAMWWL5EdMJGzYRCNgACARfCCr83z2U=; b=H+QKy3UhNAihHc5Y
	1pf07KnUI2Kp20ZvSqQ4OhyXB06gEN9hy1AUzLFUli1/snEjvDvCcJKL6PLz44AT
	IjqSdg32U77FHY3S+FGW8l29866cCIdfYINWiJWPq3G2sAC0fnyMUCvb1OjTjxpz
	ebiEIT7vtkUgfyJH0cacmxXDsK39H7QZgOfjfziBN2b1eZRrNucJjTXR+LNzsv42
	p5geUTyOnTTXZkT+P0j2NWSn5SJmkEPcGKm2AXzVkLrO0xPxTUKiRQqoowi3AAmh
	UAocMShAMwK/m+X6M4/rxko1Gu1WCdreYQkJQUxhcME9cIuXIWA79NFxAoq1YXcc
	9q3yrQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj1jv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 14:33:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd188e16a2so34339475ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 07:33:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790001195; cv=none;
        d=google.com; s=arc-20260327;
        b=qc+OOdEi7+5WcIBtlLOtSeVMNuRrVLCuy6X5zZOkix+v3842qCkys7+n9phRQ9rqVc
         BD5FnF0wRu7kPvDs7Jn3YMv3ccEIlLu9A0E074XC9mVZx1jiY8Q9EYZWRBrPXbTsd27m
         5PbZySDrq+A1nJl0KnO/BJMORt5lcNkVJjf94kdWumsckms4expWqdmcJ21SA9AkeRWS
         MtWZ3cmLJgBJ/xPNNf90PNNzbwFYQa3qcgR/qlbMsZV67wmlA897oKnm3hnI+uYryWHV
         4Q5bg2J8m3Z10HCZbZ8ngaOYRdnTroDwWwXQrfMD/laAETnch2bV/FD/Aqc3C+avmHCl
         gKtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JWFmv2D8/n3cqAMWWL5EdMJGzYRCNgACARfCCr83z2U=;
        fh=7ka1i5dAjjg6L0cOQHZx4atk+c0wu25SzI4CFZRb4vU=;
        b=lhP7SSV62sPchIUAVKC2pAkFwxeFDqdihbJjk8+2kJpIJVp8AO9Bqs0SovSM0IkQCX
         CZDFp4cm0BJRYzREUS5hRcSrfJoTabtEVxPAXVA8m3XFlzpZeGDkI/lXEfvo9+9llR6H
         no/W38MXF96P1gCywI6WND3mcHd/wC1BZMOKfF8mC8gIBAZCp1nDbst2RMNRavfMBx+1
         bps5NSaDOH8oYYRD3yDvxWYqyqmd9Nuh40lSaKBXyqfNIKk9O00JUpTznCPMfRnR1Ov+
         UJdL0TqKIHXM1vbKEPQE6RpWm1NgMpL1AjAHu608p69FXvhb6COj9tPmF+gXvYF6zh3C
         y+Lg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790001195; x=1790605995; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JWFmv2D8/n3cqAMWWL5EdMJGzYRCNgACARfCCr83z2U=;
        b=FUC3HeXDvNvRaFB9NhNWTIGohX/nG9HL1J452aA4dSHWOQ0OYJcaRutp6cu25x5qYg
         gCLQUN6mmjmG/MiZtDMg3hpEKovHUnQpOZfjSjxLDuLgoVCnlMObskoxbka7QLhBKGMT
         o6oQk8wtnAnGYQSDEAoem8Q1WP6B2ChIc6JuzJKCbS8eJyg1gr/pVEKIF5y4mMnmNW7w
         8qrRHzFFkZrKypH1nqwIjIXGtWGPReuYfkrPUddR03sfE/Ul7kYJRlxm5/ZjMsPH15Ee
         irJ2iZOLacdevIJAyyKq06FWsUbzK4NctPpAh6WIlsnARGR03w0C5e4SfTOVUqSYgRg9
         i3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790001195; x=1790605995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JWFmv2D8/n3cqAMWWL5EdMJGzYRCNgACARfCCr83z2U=;
        b=U1WIoohktUyoUrCc4s9I+rMqIdcr9qy7TYZ/Y6aOrNcRy/o6c1Ram8EMi7pPMNqkKI
         GmK4ZbxdF1GtWcxtaxDzUzpJ5OWiy4t4Dq5amjsc/LmIJEQwuUe0cfb6qY/mdwQtsAZ1
         LsrvgyEAlDVL26yQbgR2cc4+lP1rCCMWU+xQYeORkvWoy6pD1a1GPPHoyn/h7yRPnHjt
         txq1d4Gy87uxv/zYt6kEfNumH/hc5dJ6L1KP38CVBf+4xouAlLGG+cALTqhP5JU6+mfc
         W2ZrzynOCgMdsAkM5NH+npMDheESy/ibDXl0nobROWl5Z3kI5cAZnG+FhcFJk7DBJ8oJ
         XJ2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwIAX8eJwFUel9VAibUHOMvS7higuO01u3DoNr2Bfkja91HMVy9MRPsLlP7/w+QdcGHjA+GxfKguiuf85qPgio6@lists.infradead.org
X-Gm-Message-State: AFuF++lsNT15/CKBjjBQjC4cjE5JlpATwsAvWJwLHZ3U3E/7bSkzxcGx
	jw7dNPuv+9bu5JP9DxkbFEFdNWBASL2izTgLYUySOCfI2Q287lzPkxzhbBuL7T4bHwvxAuJQZhS
	IZQaeNcjWJYfUUeMtpQjAgQqerJulgsFzgM4ryDW4SROqFSWQaq5DwDGfvw6c7n+xoy2r2jPJgH
	dZkCoChL2pyZTbXvAYgk0mjplv/0XQLM03V876Fjy986+U3Q7JhE9d
X-Gm-Gg: AYBFou35M1fjtAqHE/cnwqYjP5Khgrp4TAxUf9yc5d1IZMtOGUSCz/jEXVJI0V6WJBb
	0Y3dQHQXN3881URdla/hxTrLIKp0U0pCgXy4Oy2bFsqQMMq5oEVKuogQs4hp96NTSwYKnMb+3jd
	U1+XsLZjElPTe8IyolJJq6pQU9qAD4kypE1VXpifUp9ag5+XQDGtjR9GremQ==
X-Received: by 2002:a17:902:db0f:b0:2d9:6db:9fcb with SMTP id d9443c01a7336-2ddb1ad911bmr168889555ad.11.1790001194748;
        Mon, 21 Sep 2026 07:33:14 -0700 (PDT)
X-Received: by 2002:a17:902:db0f:b0:2d9:6db:9fcb with SMTP id
 d9443c01a7336-2ddb1ad911bmr168889115ad.11.1790001194225; Mon, 21 Sep 2026
 07:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260906033806.84671-1-hppiscas@163.com>
In-Reply-To: <20260906033806.84671-1-hppiscas@163.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:33:02 +0200
X-Gm-Features: AcwNN1URykOcgSM5mzAR_6Hv1HbdZSOKSvNjzwgzfex8XAPfx0E_X-1XkjOVQ2o
Message-ID: <CAPx+jO_-ZD2We5Ap95YZG9rinGj40YXxCbf=fZ-g4MKexbYK8w@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: imx: Propagate SCU provider registration failures
To: Pengpeng Hou <hppiscas@163.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
        "A.s. Dong" <aisheng.dong@nxp.com>, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfX7YXFTrDO63e5
 ofK+YRWNzrTY6U+V41Akn2jCKYN7CyzkBOrbs8mnlxOkNHjFn/y9AYH4BmV2+/Cxf8aRcnsFvO0
 SyGpFVIpx1pgXdVR/nS9qKfW4Z24DyY=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab1402b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=Byx-y9mGAAAA:8 a=YTAltBPf13rpVPKIVk8A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: JOEEHrwg9Gwtvr6cBQaJueov5rVLwbjo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfX7yZ2By+eOUbS
 3q2CPFbDN0MGl9F21MiGWQfS4zYg4HrOU3gHfnP9Ifq7An6KnS9/Etn+3Z1WjjpHw/eucNcusw8
 zTSGKAjUu+ThnYS+UMCBaL4D/JoHYJI6TOTDfllmK1ZUStROIy1cUqL9xwNCbbON3vJmi6GJWFN
 sWCe3eTjzD0qcwkCuJQHmBs15SblbIPzNuUGbNW+jpAPEHomEBnkzIO2WJBSqm/o8XYlQ0836n3
 UA5U9lflGci2D7C36LxP2rmGlUf6V/Jms1ipc2RFKTWhgeS3xP1pTDsh57U4nVIKmy91MsCHeBP
 66bGEuS/IZoYHQ1f3EBHbcyu1aze/yACEDZa6CjM64O14dtr8GI5marYLboUfiLXQfav/4JGkGo
 2I4udSNSk4zySbTv2ouQhLfI5X0avKD3c3MBJoVeNUgXxZfTWsXfFIvq7eq7OXpmoDPZwBNwDG7
 uSgEQ4RJ2kfrKIiKVjA==
X-Proofpoint-ORIG-GUID: JOEEHrwg9Gwtvr6cBQaJueov5rVLwbjo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_073319_647168_556C3484 
X-CRM114-Status: GOOD (  21.00  )
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

On Sun, Sep 6, 2026 at 5:38=E2=80=AFAM Pengpeng Hou <hppiscas@163.com> wrot=
e:
>
> imx_scu_init_pm_domains() ignores of_genpd_add_provider_onecell() and
> returns success even when none of the initialized domains are published t=
o
> DT consumers.
>
> Return the provider error and remove the initialized domains in reverse
> order before devm releases their backing storage on probe failure.
>
> The issue was found by our static-analysis tool and manually reviewed.
>
> Fixes: c800cd7824bd ("firmware: imx: add SCU power domain driver")
> Assisted-by: gpt 5
> Signed-off-by: Pengpeng Hou <hppiscas@163.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/imx/scu-pd.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/scu-pd.c b/drivers/pmdomain/imx/scu-pd.=
c
> index e3f9e741daf7..05d4364f34be 100644
> --- a/drivers/pmdomain/imx/scu-pd.c
> +++ b/drivers/pmdomain/imx/scu-pd.c
> @@ -474,7 +474,7 @@ static int imx_scu_init_pm_domains(struct device *dev=
,
>         struct genpd_onecell_data *pd_data;
>         struct imx_sc_pm_domain *sc_pd;
>         u32 count =3D 0;
> -       int i, j;
> +       int i, j, ret;
>
>         for (i =3D 0; i < pd_soc->num_ranges; i++)
>                 count +=3D pd_ranges[i].num;
> @@ -503,7 +503,13 @@ static int imx_scu_init_pm_domains(struct device *de=
v,
>         pd_data->num_domains =3D count;
>         pd_data->xlate =3D imx_scu_pd_xlate;
>
> -       of_genpd_add_provider_onecell(dev->of_node, pd_data);
> +       ret =3D of_genpd_add_provider_onecell(dev->of_node, pd_data);
> +       if (ret) {
> +               while (count)
> +                       pm_genpd_remove(domains[--count]);
> +
> +               return ret;
> +       }
>
>         return 0;
>  }
> --
> 2.50.1 (Apple Git-155)
>

