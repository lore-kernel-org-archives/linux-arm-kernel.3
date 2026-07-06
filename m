Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD842C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tj0gObdWkFCTVs4u237wDEw/Qb+xCQFXIKqWze4lcIg=; b=zk6hp564bZAr1/XJ8rlgiM641J
	XBVKwzaec3nQ2jms4QKn7h5PiLk68tI9CfWo4dQr2VOq+Dns9mevgnMWyEtVxLKHWIj0969HMs1eE
	KqFhWp8pv4l9xIK7rwDtkFk2O6fmBUzcaYSRV+xda05Ygi2GkC53VwJ//S/XA2cD90bVyTQn/HfaG
	gcI6H6dkl9s4t/dNUUORrl/7g+orzN+rNLG4ljxMzXZNrOWJbkqsu4eOE/pK3PpSuaOAGtJdZnFRl
	XrcGnF15c+a4EoAguhrV1qCiXIYlqMtB7+rjNcGR3lusrjahS3bg2qjcxAtAie+CoSJKApfX6/i3L
	S2r6jpYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglY1-0000000Cwfp-28Ce;
	Mon, 06 Jul 2026 15:47:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglXt-0000000CwbR-2qOS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:47:47 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF46a981479
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 15:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tj0gObdWkFCTVs4u237wDEw/Qb+xCQFXIKqWze4lcIg=; b=fnLcbYMnU36V8e0k
	q+N47oSggJwy2YnhvCHMQZ7Ve2+2waHDgIcu+6xrOvRGqj8dbhEXcDZFWNsIy/De
	wG+zxy2xxs4b+PHA6mq4/ng1zF1gnkXRv9jYRKLscvQl9kV/tZMTPfm0hz1QX1Vj
	mJUE3AuVwI94RkG2WtQETRCaL4RqEu+PO2EuudeK1K6XnND6aKuMIieAlE0qgBl0
	sd97+fH60kvyNnuD7gDpYtBfsZ4ZOr83czrJf3MUahxPBUWkbDNc8QpR8wqzGXxs
	pFrAbFsz/DgUtTONEcvRhj3js4K3IyE3mMYIZFyfY5ec5y8Yisot/ozPSVj8NlZU
	ZgxxIg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgsr79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 15:47:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8efad04d884so68068756d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 08:47:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783352864; cv=none;
        d=google.com; s=arc-20260327;
        b=gos5h9d9nEWK+G0vVCBXoxJNRONObTm9bkIyOGJQ82A9DfgMG4L0P0A50MdUXzfW1j
         OJuXQXjGc00rYz7ukPmPGkQ7Qx9hsfTRrMq5V0GdY+X5XUAnfoJdQuTQrLrlW6jPGhKo
         sydUGoNfRCb+99mGODve+VPwg34Kp7rvSyL9SyOypbnAUOw5r3TwXHsHFPX8+HAlGYTR
         rpLwj+vgWmKyFgPIPa72owFVWQ1jCH7aUMpAUPpocOdkprsD3jLWaCxamaluG+hg2LgO
         iBbAJ9uKlmXuzql7hUVCOHo4V4NijaB/IkIWjTf2DNgYlB1j/KjKjKZIhbtfkscG0pxN
         AaiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tj0gObdWkFCTVs4u237wDEw/Qb+xCQFXIKqWze4lcIg=;
        fh=4Zs/Qm3c8PJK9+Aihkf/hwCCw8RTwTwCcUtlHJL7+5M=;
        b=EpSn76G8OpYfU+RlPXttFed/IbNPvRF8L8O+WsRkSDu1jU/CaeHPighitcl+jkYWPp
         zwjpGTimQp9d2fjK0Z0aOrR8/W4tAdktNhenGY73T4jlQewpNJxPRosVjmcuuBwM1reP
         Nnnk5P6CxxC4rh7a3q+qQo0687Nh8DgcjFLh++fd5mekFI9f0sBFPFHW12inquXS6+/l
         BHJoS381/0wzIueWXv7B0Vteq6PQFTiwIuYZyEVbR1WWEOF88cUMDcXJHGxqw6Fmhrdb
         Z4DHhre4z2EcOT3EVPSChj1gTn29L5VtEjFtVKBGHEmON1/BAt9+9OWlW7J+n6kH2obc
         JsRQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783352864; x=1783957664; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tj0gObdWkFCTVs4u237wDEw/Qb+xCQFXIKqWze4lcIg=;
        b=VvhXEkc8IMYBHgrqH0qjZxc18Cn2fJwUfRxitgOYUqSMcDXtGhpdhPQQfyT8pIiLm6
         IJk5fgcElSi9qZf8iv/zCG3LEO1j2rk46xbmAIyjo+Zw4gXvmtVDGdqJ8IIIGrEBxmnO
         vH5WHinqBQcU6ePNscz4cUbrqu8Lic1vtBW3YCOvAyaV6cYSTCMJOOi98plwUdW8cxGc
         NlYaURyqaZChBXhK0wEPWQM5jccLkJIwT0ktLmDQ20GN8gYN+U79/PTSH+WMHiTAbO2f
         zS+021/3UZmFXssd8xFEGzOoLrWxxa4Yauzk21eW+wvpHQH5JWL6lyW4HznN8OhKIuci
         cBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352864; x=1783957664;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tj0gObdWkFCTVs4u237wDEw/Qb+xCQFXIKqWze4lcIg=;
        b=Alno2y8o5zItm4ORCln89xLB/PCHDRGgVUWvhNRnwm77QfE0ZVpqOn5l6TTzJ9vXVi
         pvElfeIvPipKq3jlEzDRp8XjImn8JXPyttb/dvTgED4dZyCm5HL8jnh1pFqYp88LKo7/
         8raxuzyFLfoUq4kLRcaIkD3/a7Gzza5mnWzuAm0I3vmP/WIUnF/gQUyvCK3pCYykA+9+
         2rOIYQDSNyeIYhUYb4s9xINNfz61SkkR1TOInUj6ofz+Png30Ap3KuIcZm5y3x4I45yn
         pm5+O6bHJbXrn/37OKsT12i5WVbN79VP+tEHhqeRwi/1n6SMl27DGK/JcOIdp2RCACYU
         HhgA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+wTshlHBKyYW9sY4C9LAixcNPRRVfxC09NXjT+Nn4lOjGSkBkGXoHzSsuSHiSlZHH3u2htgvX2Q0cuBi/smHW@lists.infradead.org
X-Gm-Message-State: AOJu0YysnrzgOFyxmBBYOBNn09bos5GWZe7MbB9mXeJ9NEgdiz8Le4gf
	BuK+e30yKrZzEBC5MkUDV3DQCl8/cyvhqfFr++R8uRfckqTB5YyN9NO3X6BWIdWt7Ha6JIFMS9G
	UpAMm1MPq5R4yd79qhFJuEcr0vQnAFxUf42myrxlqqWe/N5TlueGnVcf/efTpQP+JtfnKUfBkFy
	ITneRrLwoIrQtVrLbBl86LqkefBwOKwmVIiijotIPMWbbCS5Xmhg4v
X-Gm-Gg: AfdE7ckeLcefxhKHMniokWfA+bdLh52fSweVEGBY1cbO1hFYOV1Bo8J4c5PTnQ6i1+T
	i992poLWMMVp1+BwEdge29YDf1Ko+LJKytQyYhNMNuPfRum0vIhI3KsrmsgGiVy8DJAe/N0PT8H
	bQOWKXS26drkThqJXc5xwWM9MzTOoUMRL+qile+rweyF11MeymoveMtF2BQ4AjPL6GrNY4
X-Received: by 2002:a05:6214:4506:b0:8ec:cdb2:5e11 with SMTP id 6a1803df08f44-8fcb1ed90b4mr14552966d6.2.1783352864292;
        Mon, 06 Jul 2026 08:47:44 -0700 (PDT)
X-Received: by 2002:a05:6214:4506:b0:8ec:cdb2:5e11 with SMTP id
 6a1803df08f44-8fcb1ed90b4mr14552456d6.2.1783352863886; Mon, 06 Jul 2026
 08:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260704124115.2874-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260704124115.2874-1-pengpeng@iscas.ac.cn>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:47:31 +0200
X-Gm-Features: AVVi8Cfc23vDy9sML05-jTCqkpjriTSh-qx-MZzbfaJJdsJ4vWmJahgYgtlUlYc
Message-ID: <CAPx+jO8WTpHOU=1qziE8Ez9vqyRu_Hq_-yKLtNA+z=-GviXjaQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-of-ma35d1: add missing MODULE_DEVICE_TABLE()
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: gXMCgOgrQhl5VfjH5_HNmJ-9ph3QMLGb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfX0L2O4Df6EbxD
 WvMNsOXgVt1bKwBW9HoCQ0fxG88Ey9t3Rcc4dYuHxRnhlZA3bVjqBpIHsQvG3D8LxfdBLl7UgiU
 koU+02JlCNd1hJs4GJH5E6BFweLd0Pzucp8vKbHrgQf9VHVdMEJeC+/QBhgD+W9MHfj6uGA8Elq
 AmaRxdH2x7xefmijQAzO/vExKulyqszxgJVQDOZIp6P1bXXSgRLJCt1/DIzsKW//DhNKxc5+JQe
 aPiwpkpdpCDZpD7QSIAocznV+muTP0MpfN5SONNgDzQAhvZSmhzIT1uClIu4gOYLCL5aCEcxU0w
 e0DZHuAWfrfi2f3IEIyyMA9sj7+nLBQOWbMjgxQTyotDxWg7J5F2c3A4Rza3IZabiFhGExU/ucD
 YNO/SkPqQ/0l12K/qJeSQEv/BoGJUPZ/H/N3dbWe3C5estE3lEKMKw/jFvQC/Y2CZHsrat3GOTg
 TmG/aDQP/eRjDoXIjSQ==
X-Proofpoint-ORIG-GUID: gXMCgOgrQhl5VfjH5_HNmJ-9ph3QMLGb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfX/iKrGtwE6Plg
 ZHYlTvjNjjdI8ueJMoG59e/HwIiYwocwYhyC8xVZ2e7ST/hs/RS5VHTmKSIk8ktjzvYXsnqSzMW
 d3Jsn6fIKJZ0p4N9zoZZPnBC8qNEkqI=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4bce21 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=HOKP6D99j0CxLuPf18AA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_084746_200713_CE5FF257 
X-CRM114-Status: GOOD (  22.68  )
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

On Sat, Jul 4, 2026 at 2:41=E2=80=AFPM Pengpeng Hou <pengpeng@iscas.ac.cn> =
wrote:
>
> The driver has an OF match table wired to .of_match_table, but does
> not export the table with MODULE_DEVICE_TABLE().
>
> Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
> information is generated for OF based module autoloading.
>
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the platform driver, and the missing module alias publication.
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Applied for next (by cleanup of the commit message a bit), thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-of-ma35d1.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/sdhci-of-ma35d1.c b/drivers/mmc/host/sdhci-=
of-ma35d1.c
> index a3b676894838..2a826de97779 100644
> --- a/drivers/mmc/host/sdhci-of-ma35d1.c
> +++ b/drivers/mmc/host/sdhci-of-ma35d1.c
> @@ -290,6 +290,7 @@ static const struct of_device_id sdhci_ma35_dt_ids[] =
=3D {
>         { .compatible =3D "nuvoton,ma35d1-sdhci" },
>         {}
>  };
> +MODULE_DEVICE_TABLE(of, sdhci_ma35_dt_ids);
>
>  static struct platform_driver sdhci_ma35_driver =3D {
>         .driver =3D {
>

