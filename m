Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35FFCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZl7fl9vC43HoFXuRfxhax8c0echx+kxviVprOtNlhs=; b=vQVEAm5Ti3QPUctRruqNMecMQj
	35D+P/sRCzoDqmVoRR0asxvPkWux1KbbA36JBtxiy+K+GmBJObod7vs8PRI7vxRmlEkhreaB40jIg
	VDqPi2IkNKNsiLuKBbYTLfnlbrQdb/zakmy2MJpilQLMQ9ClfAcDa8t/H5Di3fAQEhC1yKjcZOSgq
	S4hLxxOX8SyYJH0aDzvCZgU4z5llqzuenwcbGqXdZTXmxHc/KeJKlr03f+zvXWLto8V0RvIHTKaZ5
	D/fM4UG+JWQwz2tAFkcTBv/POvDeBeu1ubA05FKs2lN8yh7J8alrVkdDLafMz9Z7cHnovLTq1DzSo
	SjFlJy1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDyv-00000000yxs-0hba;
	Mon, 28 Sep 2026 16:13:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDys-00000000ywE-1QyE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 16:13:32 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEdwpX2143002
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 16:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IZl7fl9vC43HoFXuRfxhax8c0echx+kxviVprOtNlhs=; b=keXaKdigOgfFZf+M
	GHW1mJShGW56EgQN5rLWHIkx+OGqQWKrHhf7wPBvOSmrGhME618Q+805FNgwbWvp
	iVAti+d4NJO340odNGieKmnT+hu3eM2w+dfSr7N75HsbwJly+zjzVkUP17sav3oC
	tQHaqamaPiZtPy+stjVqLxokIEOIUOrY0mdXnm9K6+arQPHqHCiVBvNRM/141XsB
	q7Z1/X4TbcdlgCVTf8paPcUhPu4N7gWDHdvzsxAzFJ4PWQRU06roWVaB4IWmRlz0
	8j/9FmE30bQhRJ4LApIFmq8ZSOJRMDtH9+NynoEj08Qiqf2VPEkzszeBUqwGMDgZ
	MVJ37A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynfksm1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 16:13:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cee1ec30f2so31012825ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 09:13:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790612008; cv=none;
        d=google.com; s=arc-20260327;
        b=KrmCxml6oKzZnr5QI/vkIDBIwqv/kyfNthuTwf/Ob6U4xf1jKbLxrK6iFF62pWKrbC
         YxSei9Mdmn/RQOGjDweuEqlzopS5Lr8ek4gnL4dE5zmF+sVBpfiMGfPpFtMGl20Q8x6f
         MLodo39j0cpPktoP6e/CfhlXlBXLy2sSr0REwIRu2bR52/cUD1WKEcnpCagsXOI2ooRl
         Ihf7Y50/MEnVzYqSRrBfX6dowmastMn4veWdj5D36XDn/SwU8Cmq8M6zNJ8lFeTdkTAR
         1AacRxeUI+/8MRvMZknyISZsQdit3/zAPTOG0jBvQU7mc3f93K95k4jas69XWBlEoMjV
         7vWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IZl7fl9vC43HoFXuRfxhax8c0echx+kxviVprOtNlhs=;
        fh=F+DO9ghomtvIeTIzqWTHqa3hYBjGVfVX+aVJTVL4F1s=;
        b=AePX8IS62CcCkrRDnxr5f6q9+e45eTB3OMWjH8yckBYZ/WCdEZA04g8Z2y00d3Xg6c
         WFNtBYWjMDujA4Z/hrlVsc4KQNzqgyapmhqB7I7ykE24VdoXzWHYgBxOf8ACwa5US0ox
         FWVBZd01gdApd1aAuQHxXIfOlMctsx5PknW0DYIRhFoLpG/9B3G1BCzrAOW/DogwJ0Xa
         zD6a4jL5g8wAdxE6G8AtRR3VAmBCmJN2K2mkY8sGyWrtUdwZQLoYjMFh4l4duBNoosJq
         kivAeDXDKCfRQocl1+XLi5LIL/Svdm9HAC0TAmOaDYtzEFNg0aI4n5R7h2kNsuNt6wTJ
         GeJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790612008; x=1791216808; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IZl7fl9vC43HoFXuRfxhax8c0echx+kxviVprOtNlhs=;
        b=Blzh6bMQUf7DKgH1XIj2nr+GuxYBmsCbR1EA1j5/FfDAuBIvJxzAR1+6Hwi/yhplTq
         KtUzBbGbqBC6/V/FZ08VC7UavAMgrzdRuNnadQzgMDYeYUjXljfE0Av2vwD1WUn3C3KN
         +fO6PB/p9gFLQ2MZQMyBu3AIMDjkZ7DuPNtqHV8BkoQ1q4gunn93qMgu/6naC8PeqsqJ
         6IZg5BRMGBoty8RGTa187hfVyl4j6cJRte5+I/aicpqRf4XodOOPIt7/Ej/8UwwRWeVV
         PgqIchmPq3JFO6Ltx4WLZWCSaXMOjWEe9nsebpO7gsDuwkT2kvBcNE0RDVGMrbvkJpSJ
         ElQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612008; x=1791216808;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZl7fl9vC43HoFXuRfxhax8c0echx+kxviVprOtNlhs=;
        b=trjQUe2tjtz359z6eG6qRhwgcI+Nd2qZ2nVilcdFYaPV5E7rAHnokikyl9lhOqTPJc
         fzx+zEIx9rUUJI16pQbjpPh+F8o27H6tpxQGnQ/CSKwtrgk3nWBk/0WtdvSbQEncuc/t
         dD66eanZhDlxGWoQ5q8qWXdHd3gdmQpy5XwP1v53vp5J7/1X3w/lUWZLIkqLX6TBuXJu
         9LAVXJhcJD9AgUSlG7HsAIu+Px1Ak4royWQoHp3R+y17XyJD2Qn+9sQ6ftGOyX2dnAZT
         CQuBUA80Z3rDx5lecCHt8HgaX3zzW0Ycdgt9wcMzv1jv4+mwh2LfiRFw2Y4xOSldbVHP
         yfPA==
X-Forwarded-Encrypted: i=1; AKwUvByyENkFugHMJUfPbNsog9aW3QAQfu/slJTM4lB9BuYkS/DrZUoVONYY3z6GaJDoOHwSbQInHb+19V3FS5waKbKh@lists.infradead.org
X-Gm-Message-State: AFq9FYKbDpFA5vOhamXTTwRKnh9VmIDixEPKpyKCfgowImBsfFoGktnE
	z6QQKk8pSBeZTqipdWlGq0Ony7PkoNauuOk0MM1ma0XIy6TeE1UQueXjGy3Nq8emoGIRHmXL57y
	eRDY6kQalElAyNyM/Pc5K24Nmj0/QeLEJBE7+PRybZNa4KZIGkjvmz0yBa2J9T7WSYGGad8s+l+
	D1gckpmONsZdf5bZxtF7UqpZb3NA8c8wepe1GBW7Ze2sBsXZ8uhwAs
X-Gm-Gg: AYBFou01+xXu2J+bMTnknsHG/Ite2RDmOf8cZFNBlFRO8R8m/8/2fpH1dLlCDalNg5Y
	ZmbgSdb1xC6h0NOHL0brIh/0tQMnND373qVSNkLsO9vuikf2Kd0Gk8vcYVqW0iQAtGw4sDq8ndx
	7iRN76m/79Lqmmbfx2mQcLg//EvbOqtW8USZ2KmR5aw3xYFIGkzpvCy++H2A==
X-Received: by 2002:a17:903:2f50:b0:2dd:c053:ec75 with SMTP id d9443c01a7336-2df7e11acf9mr102165545ad.40.1790612007977;
        Mon, 28 Sep 2026 09:13:27 -0700 (PDT)
X-Received: by 2002:a17:903:2f50:b0:2dd:c053:ec75 with SMTP id
 d9443c01a7336-2df7e11acf9mr102165345ad.40.1790612007511; Mon, 28 Sep 2026
 09:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260915144457.3463325-1-lhfff@tju.edu.cn>
In-Reply-To: <20260915144457.3463325-1-lhfff@tju.edu.cn>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:13:15 +0200
X-Gm-Features: AclHuK9WzP7c_-qm5LpEcfgT6OqFJRgRH9WwCFERWptgUVAizTg-xTRVM_DTSCI
Message-ID: <CAPx+jO9q0x=mvwZhr=orFO+n==2g3rx97GcCNgGCM-BbJJ-LEA@mail.gmail.com>
Subject: Re: [PATCH v1] mmc: mtk-sd: Cancel request timeout work on remove
To: Yibo Tan <lhfff@tju.edu.cn>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulfh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NCBTYWx0ZWRfXyCU85uEm9F/l
 DgSbpn/RztJM0dvTQTgAfS6Eu5pota9ITSQybPhmYS7hdChLmuawjul6h5qLsvNr+0cf59WMprW
 XBD9l1oE00XRbNOXUO/hEYb+ba2IhslB3zAOi1tGV3rudvW9DIkI308OgwgFI6XYonCazJkEPDs
 BULqiMCQ7DQ+GYD6rhBPwcmVsjkk6vZkrufitr2goOrRz+0b+YBOCXc0alu1Fr2Iuzpv9UlsPED
 Af3VPIXPJLAopDahL5bJ+Y5PZBVLIgIagc5Iy4gZOI4ZgIiR9KstUWAbVW10ylVHDmbPKqG449e
 ywyoBmwURtJHRblgQVvNScgqY2eRxNN3ls0gk/gc3FEfQktFMAikHEg2KEYEvvULRNBa7ghpELy
 NE4CfybiT7tS0y48DTXvbH+J/Sm8KQlHPkFR0ElzNHTIWNsaYVa/A6zz+r3ZlsLs25+QrDgGnPd
 7LDEQPgQI+FoYzE0g7A==
X-Authority-Analysis: v=2.4 cv=e6aT2qp/ c=1 sm=1 tr=0 ts=6aba9229 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=mIaQsNjA2lESkmv-XRIA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Vh1nVBc_5_2hWfJqqVesqNaIEQsPHypT
X-Proofpoint-ORIG-GUID: Vh1nVBc_5_2hWfJqqVesqNaIEQsPHypT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NCBTYWx0ZWRfX7Ez7/EgoQX5J
 E+kA6X0NCQggTTHMMCN4ZT+N0hitNawa85Z2Pq70Ps2HMmvRHTP0VKnUKnilbzgvdjmHIPkLJYV
 ylDAYs3SoW2HLCMr9jx/PdiMoxcddZg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_091330_492966_D0E1F246 
X-CRM114-Status: GOOD (  22.44  )
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

On Tue, Sep 15, 2026 at 4:45=E2=80=AFPM Yibo Tan <lhfff@tju.edu.cn> wrote:
>
> The driver queues req_timeout while a request is active.
> msdc_request_done() uses cancel_delayed_work(), which does not wait for
> a timeout callback that has already started.
>
> The timeout callback calls mmc_request_done(), which wakes the request
> waiter, and then continues to use host->dev_comp and check the SDIO IRQ.
> During unbind, msdc_drv_remove() can return and the managed mmc_host can
> be freed before the callback finishes.
>
> KASAN reported use-after-free accesses in msdc_request_done() and
> msdc_recheck_sdio_irq() in each of three unbind tests.  The same tests
> completed without a kernel diagnostic after this change.
>
> Call cancel_delayed_work_sync() after mmc_remove_host() has stopped new
> requests and before the driver releases the host resources.
>
> Fixes: 208489032bdd ("mmc: mediatek: Add Mediatek MMC driver")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:GPT-5
> Signed-off-by: Yibo Tan <lhfff@tju.edu.cn>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 01ea3adbdf3b..5b160fdad3f0 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -3216,6 +3216,7 @@ static void msdc_drv_remove(struct platform_device =
*pdev)
>
>         platform_set_drvdata(pdev, NULL);
>         mmc_remove_host(mmc);
> +       cancel_delayed_work_sync(&host->req_timeout);
>         msdc_deinit_hw(host);
>         msdc_gate_clock(host);
>
> --
> 2.39.5
>

