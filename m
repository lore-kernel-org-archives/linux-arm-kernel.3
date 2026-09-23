Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7FBC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fktn/LhG8dTvstUPUwN7AN5xYcPEg9UCV2BzUJUfCOM=; b=lQKm+CGnpJYoNFZnk8mncCZ2Lp
	wa2puQ40RAFXbtFW30rFxokh3y5b88SBREFWNTZCWVM/Pm6WjAoh/4DJn7+FVGo9uhPqPQBtaDZ/u
	kJJu2XEPBC8ybnq037t8eHoqMNUYeAsuQKfydW6ejM5AN5x5RRGXhaYn6IEfezjG7YM8aQW2ObFzh
	FmF2mXWwaBDLlhdCKZPmY9vfMcBJS0fl76HrDw3u0ltzGR/6uFp8yOJktdC+dYoQedspxw5Arz5/X
	ea0iCIrccTeLzeDLnaAob211EvX/9AFviKkSfqszkbcJU6CaDjc/i3gy7ng/Z9/c+PLuK21OuKWYf
	NMwxL9jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lse-00000008DXV-032U;
	Wed, 23 Sep 2026 12:15:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lsc-00000008DWk-191m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 12:15:19 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbrnT2638870
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 12:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fktn/LhG8dTvstUPUwN7AN5xYcPEg9UCV2BzUJUfCOM=; b=I3u/C6KaUblZKqAR
	F3O2Vg+wFPJbGyQWEilq04IXNQnOmF9aTZdjWIsNXr4/ZQc2/YsVmT3sQTn4k4ZF
	tiz3peVkcm/yU4hlixEV+qip7Yk5L3AKW1sERvl0ATc05g1HKcAarfymTZW9N6PV
	756n0XbUkiS1ZR4Dyb4d14BYpl4byE1NHePbTzPS/Njz+IfuhvVvyKZzYO/GOoYu
	HGj3N9oMQ0xv5Ag/YGCPnmsIm6hjmQRl0SGMCXugsTO0WrOmOcUR9hE+DwhxgwYj
	Iaf+yGPztP9iwBJ7BUxbUJbuRG8vklr3I0CGej0kCsLenFaDIOVYb1mnQoTsSK/W
	HjqjLA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqhft9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 12:15:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e3c10ac70so1428516a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 05:15:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790165717; cv=none;
        d=google.com; s=arc-20260327;
        b=W5zMbsJX0Pd/i91f2tPEYwjsxiytVlPHDEhwIgxdg8HNJdBwNpDiJus+JKVD551A0W
         89uWdlER8LjXyY2w39nwJ2nVolqpEu3dfps1O9+ccXnZ+oi1fWFuY5YzCh260KL/rcBP
         0GEkLFQX185sEGl4cGrNsOzIzcWKMnWBt6n9j7HbPaFM+HYQ/oOkDCrhkkZzeeMjJfwM
         vFMVMrjFHcF/4ppZfkJ7YosJ9Xh/JshgIChdQSv6JGB9CveTM3XVmNrDZ3+g6aL0Mz3A
         3SvlO3CDAgdhSRz5hyFI7VWrFE4+pTuoXMh54ip4Pxa3gnE53PwoIhJ8M/v+zZkxfDt6
         bKlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fktn/LhG8dTvstUPUwN7AN5xYcPEg9UCV2BzUJUfCOM=;
        fh=upKuQYc3krpvV9V3SUiiv5i2Yc9DdSoYXrfsUxpSJgA=;
        b=T0g9N0UDkVgHJLsuvLlNm+MBISmXJwBaEctmCYhsKwRzJOxYD1MByGyb1+tIpD7K2n
         tCV++xUH5C/BE9kcUxv3OiZdNHBL9Ly0bhlU3IG+A1T+zXGi7eHEAZI4O0LiIOUs7TDy
         mSv4ua/7j8Li7jnCredoq9h77k2cZ526J3Hlb4jW6KXncfIzOIto/MEvEB43xsP27VGy
         331ofsUzFuUHFgX4Cn3vrpiAhAH8khOginVrBTMsudnMessfD1pn2xZ1VwsKXxR+Oh3e
         Rgct88sPFVG8HYRmQnKCYtrnbm1Yd+n7OqvNF0/eQUHIPwOWBKO6AJLAM3gT7h+ygeTB
         CgQQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790165717; x=1790770517; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fktn/LhG8dTvstUPUwN7AN5xYcPEg9UCV2BzUJUfCOM=;
        b=Rmll0NOopw3R9CjoBk9QCX3l9f5xhAfv8IFbabS/4DVKhCI16AN+rUVkvzu9fyMBVx
         gO6OFqNj6cKysE2k/m8rLc44iOBxkpjR7opUJnrjf3RWxVNLtUh1rKwcMv1ZMtn7/nL8
         wyKmTPUKx5OJkaNV2JLEj6MmdmLPf4H4MEv9PFjA5h8/GkO1WXXtYByX68fazbD6fIij
         Y5V+XuDFln7TvRw+jJTPl+WKW/xMJtt9mDAh0lB0jJqgnvmx4Il3T0WOWciACau9ZwAu
         oM+oGdzCjoeXWqVopl12nDQWTzKeCoDimsGJH2BPmIezg8BSPxuRp1eDSBedLXmrEgEW
         dHJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165717; x=1790770517;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fktn/LhG8dTvstUPUwN7AN5xYcPEg9UCV2BzUJUfCOM=;
        b=aRnkMqeiBTdzmHEvWJIIRuYcd6LVhkDJeF5DJdJB9i8Cv3oGU+yWR6OUysK/uyWqov
         3+iLJYalU0pfYhq8d+O5tU7BZ7sXRckmZ5pDd2TH4630yKI4SPKP3t0B2UZI8xXLVYlg
         U/rHszQxeNPTUE6hc6EEvR/xOosQpW6z4w+V7YisnJn0UuOvtRCpqWD8/ipjl8pnk5Ub
         Mjp44FAdkMrh9RnOGaUXiRRBy5JuuCDeM3CqfGZHitJsKWtZv1zPSakZUffOygV09JLD
         Ck9WLkulIik+qK6bS8NGqMpdqNyYx/ABOVRy7sLH60lHyEAEahl1KpqJUFJ3Jwxt+DhA
         lehg==
X-Forwarded-Encrypted: i=1; AKwUvByKTCrerVsS1QAU71jQ0VUsiLALoOBZ5E+sT35pREPGFBPvwIVwRs3eVHPWXE/JWBcLzk8U5Byoy3kO6qfNuop3@lists.infradead.org
X-Gm-Message-State: AFuF++k2NLEmK/Ii7DMMtbzMsU4xCz/2vXGEZ+App60uv6imH3qXLs9I
	N5vImupR5yKiEMTSM2Wfu2h00yaTWoP17fEfIiHy/9bLLIIMvWA4EozbonfHyPyye/sxpoWV/aP
	pq/0dqj6xsvMkOCAUvXv9AgP7PxclQtl284HSgJ55xIVKCOnBUFXUn3SirgilQUjb1FHM0ohjxe
	y47eE4nOBvfBxOQ67xRXnpP0zzegfRoPB4jYz1nJHQa9pW/g8w7tjA
X-Gm-Gg: AYBFou1iQeNy7cbaNLIAMfo7AMHBSh8YE7k+Vb0dfH3TJ9bO359DNbAYW/bhoyNtLeH
	PBSIvgr7hisY7Pc+sM7KTH9Eej+vma3p+Vokl/QGl0eUAJZU2ahb5A+RlbputNnzFLkuNv1CvOb
	JWAeQz+pGzCSlOBbZ4cCuna28tqbh4wMsLHlJV3jXMkhcnzcex3sJLmK+slA==
X-Received: by 2002:a17:90b:5150:b0:39e:4c81:6c99 with SMTP id 98e67ed59e1d1-3a07e6427d3mr2204312a91.31.1790165712183;
        Wed, 23 Sep 2026 05:15:12 -0700 (PDT)
X-Received: by 2002:a17:90b:5150:b0:39e:4c81:6c99 with SMTP id
 98e67ed59e1d1-3a07e6427d3mr2204025a91.31.1790165706997; Wed, 23 Sep 2026
 05:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260920175928.42566-1-s.shtylyov@auroraos.dev>
In-Reply-To: <20260920175928.42566-1-s.shtylyov@auroraos.dev>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:14:55 +0200
X-Gm-Features: AcwNN1XX2TwqwRb1ZoRjaB9CUImpJjiTV5b_h3ECFgJFj0KO-kS0Qy6oSUUekgQ
Message-ID: <CAPx+jO-Ph038WJQ4gMH93XzoMC09+meht=yT9JQBAnTD6HzGEg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: rockchip: fix domain check in rockchip_pm_add_one_domain()
To: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Cc: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        linux-pm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Caesar Wang <wxt@rock-chips.com>, Kevin Hilman <khilman@linaro.org>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: d-d3e6JCIdZvJZ3mihZEMLGWPP5-VBZL
X-Proofpoint-ORIG-GUID: d-d3e6JCIdZvJZ3mihZEMLGWPP5-VBZL
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab3c2d5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=HH5vDtPzAAAA:8 a=9fon7Y1cHxUUJadseLkA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=QM_-zKB-Ew0MsOlNKMB5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfX+d7T4KwS5zuH
 f/LGBC7n3FKgBJ1oVjf2fs3y0rbG+pV9CAuqg+Z7xxZ2pWQfbHk0t5VHVYgwxA11VehdC0OxqB9
 ltqE1UdhDEy6WAUz6q+IPmU1WaGG/w8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfXzJqIht+S0dOw
 jSDph/FCDZAredGWi6K71ccMnjkXFO82a1vxtnFncJrR7Tk7vRATcjW9CJhD2txrkRlpc+RUJdv
 8yt7ZfWlpc4C5kp2Wd3UGLdmXFxEhN35HXRuVwPygcJdeFLbjJaTuEAdopBScAeTGeodzcOa8tO
 tuAGvAbIi49GZGKznwyAQkyTWVtFR+R8Y3vK7d3QsRbVs0ixi+rOYcsKj9zlSGevFQkUQL+qZ5P
 y2bJ1Oahytzd0jY0/MRXrvoNEGbPJ3DTRef27lBEUuAh46LdzJWBbS9WjAVPEjHb6WBz4HQeczC
 RkU2vAZL6BPX+0myHPvtdRy8+LGVxA2tPAzTHxX6xGhYc5tMNWUrBS3bg8v5Dmslfg3MiFDpEqu
 qG2ZZJgpzMNHi0pBNCyOBEQ3jtVL7oqI83iDzmMMxDBcUGs28xazDnNv6QaEJ+rRr2VmmDIEXE1
 d2efzuWbPy7rt6n1KTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_051518_314866_FE2F31DF 
X-CRM114-Status: GOOD (  26.04  )
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

On Sun, Sep 20, 2026 at 8:00=E2=80=AFPM Sergey Shtylyov <s.shtylyov@aurorao=
s.dev> wrote:
>
> In rockchip_pm_add_one_domain(), there's the check (most probably for
> the case where the "reg" prop has an unexpected value?) which doesn't
> make much sense as the variable pd_info will be NULL iff pmu->info->
> domain_info is NULL and the variable id is 0.  What does make sense
> there is checking pd_info->pwr_mask and pd_info->req_mask which (as
> seems to follow from the code) can't both be 0 for a valid domain...
>
> Found by Linux Verification Center (linuxtesting.org) with the Svace
> static analysis tool.
>
> Fixes: 7c696693a4f5 ("soc: rockchip: power-domain: Add power domain drive=
r")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>

Applied for next, but without the fixes tag, thanks!

Note, that I am dropping the fixes tag because if there was a real
problem, we would require yet another fix on top to get the
corresponding domain declaration to be correct. Yet, the patch is
useful as is!

Kind regards
Uffe


>
> ---
> This patch is against the fixes branch of Ulf Hansson's linux-pm.git repo=
.
>
>  drivers/pmdomain/rockchip/pm-domains.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index ba66ae719428..69792e2b215b 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -809,7 +809,7 @@ static int rockchip_pm_add_one_domain(struct rockchip=
_pmu *pmu,
>                 return 0;
>
>         pd_info =3D &pmu->info->domain_info[id];
> -       if (!pd_info) {
> +       if (!pd_info->pwr_mask && !pd_info->req_mask) {
>                 dev_err(pmu->dev, "%pOFn: undefined domain id %d\n",
>                         node, id);
>                 return -EINVAL;
> --
> 2.55.0

