Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233B6CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 10:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5uoXQRR+x1Y1NzAuMH2inF+ukyI5BxIekcDkuuPxWo=; b=F2EBOK32PkClti94GBjfGW8ins
	Cs2CgUVEp9FnlsicaqQb3d0ljLVYJ9YeB1TKGXHdzZRNyKjfwIm7ht13oXSaGb6xim4bfAiHSH/Ua
	Qa5zIbLbStaA4hrbEUxA2ktJMfGZzOcdPnH2HddGLEtrvJGEJmzOaP56ZF6mmjM7b7eRab7uOxgHu
	5Jm46gblr6VWoWfK1T+DguXcn8guus8Xwevrj8A/gYflmjUHz2MFPpDTbfyhRJMvqP6POFh8gUxfl
	KSissNwxx4zNSANp34Zo2xZ91/FPxcDbgaFHwAuNtYEOeh9y/qC5r1PR4mF6qnqc/Ku/AmsLifj4w
	g6i0Hlgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUicp-0000000EmmJ-0DRo;
	Wed, 03 Jun 2026 10:15:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUicm-0000000EmlA-1LxF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 10:15:02 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6539vRLE2368054
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Jun 2026 10:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G5uoXQRR+x1Y1NzAuMH2inF+ukyI5BxIekcDkuuPxWo=; b=SmAGzEcNzMg6EFVj
	AJxaoFZzHAlq3ByG7/Al8YvqP1vWkmRutw/OAjR4YxtfS3B2Ymh2GWsxwnq71NBa
	h2UXk7QxDOu7UtdUSzPwrvUkENvND2wgWHL9TbcIhr1yC/aGridG4+njldF6JQ6j
	ZQzMai1HHyZ1iw3tXnZUJl31CyDDfvcGHRk1vZ4Wx2UJb9KnsV6x5w4JzbiozVd+
	xVhpVP5oyBtADnKRqkrWDNyojEGs6HOx1/DnzpPJfz46un779MUCu6D9n8IH9l0I
	1ub8sAGJhafr6IV+vflXwme6o8VXQxYrq0jnup6Tw/4K3FRxiK9NAxGW1PvOZg63
	yTCo3w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3gg2a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 10:14:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51760f997fdso12980911cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 03:14:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780481698; cv=none;
        d=google.com; s=arc-20240605;
        b=BEvVoKO/Rc0e3XlqZpWiN9w5YPqX3eFBP9X5itRt6XiIJTRBNsqVC8JBYjeUvRq1tg
         jzCkx1ZIi8JOCmByBq7pMw6YmNVxyKGWmvrYTG+ElY1xS3Y1mTiyJGuRu91hseBXaejo
         uDdcwzXLshVTD8LQdoR4Sg5Ff6lKO3ni1RQYGP5A4O5T1jpW+IdpJJDVP86g+CQ3zcjo
         P2dEMJMmsiJ/4ICwvZRMrjZp31gZQJqttwuuXd1igbanQAxuFPeCV1acABoaUfwNioz2
         pyaDmfjxllTX/OOileegAqJfP2hOTKWSV407ZdhycaMBg0AsJSDwR3HcAu3B8Qt8ki7X
         IohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G5uoXQRR+x1Y1NzAuMH2inF+ukyI5BxIekcDkuuPxWo=;
        fh=kbRBsiXEq3JSpcUHt3gx0zPkK01MYACjAIOLrhB17Ik=;
        b=avkEmP+mxJ8fD/NuOYlT3nEIR3VAcuADWb+3dxnzz110ViNhvUIJKPJZ4sMrSBx3xo
         Qdl231IckiGT9IuQ+fN7A1IOiBk6hdLK97dhGQUP7Qc7q5ggZVg38d2Kauo7llEgFlAN
         VH9dCFZhHYfOrZw8TPJmQYae690CeCkLHD1bbUfNAUIYRT938WQkttOHZdohzxvAyRP7
         9G1Y1eB7w88g6RXShMT1pDWdOTNqNh1nUmjDwgdcgXU9L+LTNm7rTuxtxEfFw1497uXI
         Xus29xFCXOoqZaySpbqYQSQWTVrTncLtv7/rH/a/93UsFRQsFfAOEmMgcY58s0CEYTCX
         ZuiA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481698; x=1781086498; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5uoXQRR+x1Y1NzAuMH2inF+ukyI5BxIekcDkuuPxWo=;
        b=aKyxlPvxR8E0HOjq+W+5wgk8a3FlphHMtxsLfrDJncpqK7eDUQTs0ODJoCYowqaZmP
         qgRYtizj+FeLwuQNyDOR/gzOZMoR8gXZZJPb4+oF1tAPjQsUtO+rsSAWyxI+VJiILaBC
         rORO88yTOshfTZdCNlOJBjnUbR5bYON1A/v0ZjrrJR5PiygvD4/GFq3jexqu9mu+m+V2
         D5ihBlX40NquWmBgJkVFaSTmJBhjYdJNb4JMN+4LGfTWK4AMLEt4TG9W2mZCxQBNEhn6
         ml/kdEV8ofgqV2lej7jw85y2laXd3BS9l1H+7d7PrKoiVPTCAZDqC5BPhGB4/JonjfUU
         3VVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481698; x=1781086498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G5uoXQRR+x1Y1NzAuMH2inF+ukyI5BxIekcDkuuPxWo=;
        b=hmAH0V998hTUQCtszvjeNHhH+13wzvewDjVsr70V6z2h6Jj5k8LXfYMeUg6pS73JkN
         PfpLV5CqI95QyZhRtXXHb6RsVWr2RyAeyP8v9ofCqOfnDEnWiJWwdpCFeZS7KnvF+oMR
         iBfbeMFF9hjktzOgSOJvoURZpKE4NshZL+2j0xh9dAEZGBUFQSPnp7ZKsXfcnINlLbh4
         1f8AtDeyC+wzN3YXXvowEbkt/B3JZP4Rzy/wHWMKdx5q0dmQl4e0dPTQsX2hTvgawubd
         lp9uliEPjj2y/+IDpkFxG+1wskJlpmD/Z7twn4ys9Dwrc+LsfC49cUyIoVENbiihPo3f
         5X9g==
X-Forwarded-Encrypted: i=1; AFNElJ+vtnQiklyX7hq44NY6yETqNgpB6BICiL4ueJroW0YZL231sClkLu2DwPr5mpotqL8Kz3HlV/2xB9XGKORKyHcd@lists.infradead.org
X-Gm-Message-State: AOJu0YxLAi3VIChQGzTjNH38l+w31SACjWIef5OSA9tk8TZczqOvO4hk
	XRqC0RruFbchlOpp0QXXSiwYIwMrc+LHyjkZXHK+TXSBmc6EgbwNTnChe2ZPMC7+tf9PyqQXSe3
	ZY7Vr8CoXkbWU7i29TbF2Y1Owi6ongZG0J8j6hYFrORN8xN3KE6ol8/lAGawgTji2UuStPKn/VQ
	SiJGyBrX29ZUEgf8wCgYHNxoQMJJBtxjlSojUwhmUMg3lwJHDzWIXY
X-Gm-Gg: Acq92OEFkt6nwjkXH4oJeOVRAzULOoXGpW7GwEx58jeekhLYKYPOkQ68v7rrtnkA7Wk
	Nmkg7dBb8CUSnm9WFx9jbJ8HghRSp3ipY44VGWrmBQod/EeHSST+TRsnCqfkZf2HLAcL27qzJB9
	m+j9jokCuCduSd0ceta2AMsQW0NeAb4tC6CCDn2IZ2feUJCAiSkHbzcuFAemi7OMhAZ+npZ3mKw
	OW9sRUnbpCLBIwR
X-Received: by 2002:ac8:7dd6:0:b0:517:6afc:b644 with SMTP id d75a77b69052e-51778770b85mr39837241cf.47.1780481698264;
        Wed, 03 Jun 2026 03:14:58 -0700 (PDT)
X-Received: by 2002:ac8:7dd6:0:b0:517:6afc:b644 with SMTP id
 d75a77b69052e-51778770b85mr39836981cf.47.1780481697866; Wed, 03 Jun 2026
 03:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com> <20260505-clk-determine-rate-noop-v3-14-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-14-f3f829fbacdf@redhat.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 12:14:46 +0200
X-Gm-Features: AVHnY4KYEhjVLt8HCP2S1uMOezJVDgrkFC02GzF0MnbWrCfiBI8GGzmmmTGcP78
Message-ID: <CAPx+jO_E4XLZ8s8iuMXwUg2pXZKCo7V+9PWNyX=NmUnv3QG6bA@mail.gmail.com>
Subject: Re: [PATCH v3 14/15] pmdomain: mediatek: airoha: use clk_determine_rate_noop()
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfXz6wQ3dbV7FI1
 tiohmF1o3Zyil4N9EDD+ia4/NEvP8AvkoZ9+x4ntHvfAhVhC3WHskPEZVC7uOWsW21nSQNQAD01
 lsMz7WiDeZLkQHLG8x7Cy4glNOOrvFEzv9IZguXDjyCDU5N8jCdSWjnV6KbA+84hfqH6Dz0S9Je
 o5xjleiDmopVmlkD5+OOpdgXQh9S2uie2esyiswwG/d7WYtezMqJL4hbktLnx2ojRK6ZSQTg7y6
 Rln+UgunYwX8qGG5sGPUCkMriYSkULZaInRI6E6pHoBt36nwL52fh+uNcN2ir84dStahOxIE8o4
 JCzT+Q4tRI++IA5lKW7IA6zGEiTwV/TPOq6vprH5YRJtN3yuICtVuIwAj/Sxnd8N0io9kWrPlMq
 YS2aBQ+uUF7KJtQU3EHJboWgIPJthkRAY7KytGsEJ99seWCPgQfz+xL0StExWAY9+XTrFrjpyXR
 XuyZX5etfU1YgWC5Pgw==
X-Proofpoint-GUID: VxxqIgX4crirSt_JtrvClb5oNqfeAJiW
X-Proofpoint-ORIG-GUID: VxxqIgX4crirSt_JtrvClb5oNqfeAJiW
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a1ffea2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=QX4gbG5DAAAA:8 a=IpJZQVW2AAAA:8 a=JfrnYn6hAAAA:8 a=qVNBMPF4TgRESbWuf7kA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=IawgGOuG5U0WyFbmm1f5:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_031500_498981_0C3664B0 
X-CRM114-Status: GOOD (  20.60  )
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

On Wed, May 6, 2026 at 2:49=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:
>
> Drop the driver-specific empty determine_rate() function and use the new
> shared clk_determine_rate_noop() helper.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
> To: Ulf Hansson <ulfh@kernel.org>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> To: Brian Masney <bmasney@redhat.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> ---
>  drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c b/drivers/pm=
domain/mediatek/airoha-cpu-pmdomain.c
> index 3b1d202f89dc..5efd7a38f4da 100644
> --- a/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c
> +++ b/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c
> @@ -21,12 +21,6 @@ struct airoha_cpu_pmdomain_priv {
>         struct generic_pm_domain pd;
>  };
>
> -static int airoha_cpu_pmdomain_clk_determine_rate(struct clk_hw *hw,
> -                                                 struct clk_rate_request=
 *req)
> -{
> -       return 0;
> -}
> -
>  static unsigned long airoha_cpu_pmdomain_clk_get(struct clk_hw *hw,
>                                                  unsigned long parent_rat=
e)
>  {
> @@ -48,7 +42,7 @@ static int airoha_cpu_pmdomain_clk_is_enabled(struct cl=
k_hw *hw)
>  static const struct clk_ops airoha_cpu_pmdomain_clk_ops =3D {
>         .recalc_rate =3D airoha_cpu_pmdomain_clk_get,
>         .is_enabled =3D airoha_cpu_pmdomain_clk_is_enabled,
> -       .determine_rate =3D airoha_cpu_pmdomain_clk_determine_rate,
> +       .determine_rate =3D clk_determine_rate_noop,
>  };
>
>  static int airoha_cpu_pmdomain_set_performance_state(struct generic_pm_d=
omain *domain,
>
> --
> 2.54.0

