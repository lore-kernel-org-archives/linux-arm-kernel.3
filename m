Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC270C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 16:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAPmwpOVMYBIF2IijOmIRShxJK4mqn3MwoKwfXdUyaE=; b=bBLQzsB6DaSRigEcZnnqoL7+R1
	EyAHmkzAuol0SCkRb/PK2KRTFp+flcAflwEpYwJd5NC1CRNJ22xG1tTSNRbd5iVra2FrpFwwcwI5W
	1kWNwwErNcYf3GDHdDwB7sVIGihXZZz5cp8+5P6TFdYJqvwfoqm8No53XcqiAJON24w995sEVzYHk
	Zi8KNuxSHb4fEQNWcULVVu9Xb2UNJwaXg+ePHyhJibFj8C6TLJhfflmZVNJNeE11FZK2DaAhaMAzf
	6dXoJpYKHtfpVJ3K+3P4jpHjaHDQIcvAuVa/jpYEJoDIyQLuW2zF0g8JIfdkM1HFRHRKUVD6jdszG
	ZPTmSz0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1nVE-0000000FAK6-0xrD;
	Wed, 02 Sep 2026 16:07:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1nVA-0000000FAIP-2MEK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 16:07:55 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FtBJS1948128
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 16:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DAPmwpOVMYBIF2IijOmIRShxJK4mqn3MwoKwfXdUyaE=; b=YsipzOKZ4KL8slmv
	7lfUIOmUegtvaHe9Q6n5DfrEnbHMetttDM8JsiMptpyFqCWJV5piU+VqF0TpWPGB
	5aJOWc+CF+houMN3k8AD3259qR5ufX2Sj22hlEhnK5029+0Fipr2pbVM5CDfc+JT
	nqa/5zGIjLRLEKYM70juFAX9H2/WHygWQNXie65vVEINziPvR602/ktfEG3b1MIH
	zgniwmAEpQZG7TnGNlJLJ7eQTX7NHKXC26cFpbLMGl3v0NDPsk5OpsZHYrRIueBF
	+vpUf2iu7tNG9aPCRMduPxXedUwuHUcDu0bHXJmlJj6MCxMOjt134Hp50/yoH7qd
	TkF4bg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5r1nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 16:07:42 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso1664006a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 09:07:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788365262; cv=none;
        d=google.com; s=arc-20260327;
        b=hBBGHXEB1TuQb+XmWCNwJX1ifx5g3EzvYczP9rkTe0x1uPUCCrKAKzJpz8FYSQe0WN
         ffsmkhn1gL2n2xyPkHJVkkK8lwo1bRccF9Vsf9dwfAZlubnHkhCYUGLB4ICYu84nPp8G
         677C7PIbnk4OkEMb1531k9F0TiBuFnVL30NFNpzdH+sk7higqiq6TIFAMrladVQtHh8j
         F9MEs5qXmsyGqQQHNhQ192pu7hMHM4wUYe9uh4oHvJypxMfbcgOqmfb9cxkjAK37gLgQ
         xreHk4ZELcKPARRJLY6FHYJQEo/XVpqtexpbU7i1FTJ+czv4y/4ITZMCwbv3jXWgzsjA
         JOqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DAPmwpOVMYBIF2IijOmIRShxJK4mqn3MwoKwfXdUyaE=;
        fh=0Byp2qTAe0vFypLSXCKisWmZzNcbRMD3Sk/4/Lvqwq4=;
        b=hqYNp3aQ6K4jmC/8sD8azfPB53Dcg/4FY8lwGhcBNWSEIhwSE1ipse7a4gp72STYB1
         +B0AQG9ml+dkeQAmvbKeUbK8AikGzXDl3+k64clmP0Gyys+BE/Mfz8CSEoTC3QEw3wj+
         JNYHJoGpmfR9GIC+G0cBcVtxB56wxdVOJbbxqjKubw5luGiwtp/hvZNoHy/pScLwaDuv
         /uciCKRNQM3VcnMObCFQqar3eHQPcddec05akypDJsD3Lu0sE3KUQNmB3q+4OlViqNbe
         ZEPVC9065jLdFRBIBA7HVwJZIphNYofQgLUIGMGHQuy36TB8rvAxp2lLymGvXuyNoWw1
         b/LQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788365262; x=1788970062; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DAPmwpOVMYBIF2IijOmIRShxJK4mqn3MwoKwfXdUyaE=;
        b=Ll2zp2TP44l6XBCrG6WhaCqfrR59BoxxwjErvtyl2MuXtuFZxy9wevRRDIdzVsezjz
         psOcgjxsq6VDDX8+L7b9yxRFPnFot9ap5p4mH4th2on+BTRCuFRllF+5MDR4QIX0cl91
         ETQpQumKQbdoU9WAkMZg1FpoLO9dS78AZVswKVYR/7+g3XHD+e09+OhaHVPiKlNJDEO4
         ALNaDDh9tcPh5rVgu6bIbJov/XySI7vs9n84Ep1CtiHtIdA3aGsFR4AJ7125cEKfzrGU
         KlNiO6gMbuM+G5GuZwHIZq5B7/Z1AQswCt6K1su7goTQgP0KDZwzy4fvIfSfLfD9PvHs
         9TWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788365262; x=1788970062;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DAPmwpOVMYBIF2IijOmIRShxJK4mqn3MwoKwfXdUyaE=;
        b=mYcQj7OIReHOenOHKMOmS2emvF7gDG0y8sFS6aD+GQ4xyUTmdl9Xlls/a3rgbB1x/B
         pBJ5RzfqNsJ/jNBQgQXhFtP5bFBJC7QHBs6rCZb0ddB6hr9UR7P/yf5uGTqtJH16Cotd
         92rZz2uLJS/IV5D6XXvQr3Q6RaoMgb2uKYJxaP89MQC4AI9Hw9248wujizsh7EDJZF1N
         hFVH+KHVbMcx3e05Od3F2bNhTLhyD4r6ZMM7IlDhoCsr5XEbazDXJg6hweDAYESocNtn
         ajcbs50mevQCr3KlAqwwwmtj4osabaSWo145uJD3x+uTtPu4oADq6uz+cXibi76gH9D4
         oH2w==
X-Forwarded-Encrypted: i=1; AKwUvBwIR+26PZINmi3d2FWBFfnijV0AoXM7uGQ25xh8nf3q7GIm71eGaajP3SdSXBr3fpFTG86n6+6jZE0a4rybl2Zm@lists.infradead.org
X-Gm-Message-State: AFuF++kd/D5aVnIBdxv05x+k/fk63smd51EkOJ/lrc68USJI6tVssUI0
	PypYyuit4mlKOPWy7OsxdBSSpusPOrdRGNIFb1Fi85mHXNCRf6s0QF97SPfapQtiMPtB5F5WlaL
	N/JzXQdaZoOY/dIEKVXDSu2hPZNQ2lVTpBBuFY/+ifXIEcpH6Sk/8FFk0KNZvzdXiNpOHnmw03F
	g4kCykyO3XtRE4ZgV6Sc5voCydRxpO0PQeyFZJFEw9LQbD5sl4LK4G
X-Gm-Gg: AYBFou3AqDYKDN7qGmkeqT5CrzNYjwYDKVzUSyhTCWazNUARpn425EDBG9DLfxG/dIa
	HhPeUbv9mTnci8uL3RUmdk8D2s6StaM7PT1X2ulm2YGPdSfrT0ILolelfRqVrC81B7pViVT5TUr
	p6QOpAuaazWrSi+NjTyADiWBFaIpjqYYnneHZPfXp/jLonJUIKNAwYeeEq2w==
X-Received: by 2002:a17:90b:2e50:b0:398:b426:ca4b with SMTP id 98e67ed59e1d1-39aee1a9994mr9844116a91.22.1788365261681;
        Wed, 02 Sep 2026 09:07:41 -0700 (PDT)
X-Received: by 2002:a17:90b:2e50:b0:398:b426:ca4b with SMTP id
 98e67ed59e1d1-39aee1a9994mr9842890a91.22.1788365256476; Wed, 02 Sep 2026
 09:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260625003525.22594-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260625003525.22594-1-pengpeng@iscas.ac.cn>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 18:07:23 +0200
X-Gm-Features: AcwNN1Um-bxia3REdAXf8m-38tcHtMIEpV7_v--sQ-7-GTkWwOc4grrEf97NRUI
Message-ID: <CAPx+jO_6jWt2YAjzHnD56_LX5mAFkxwOiUy4Ka+BRG9WX2M0PQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: mtk-sd: report DMA stop timeouts as data errors
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulfh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a9849ce cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=CBFGLoz9tPvRy0Ij70wA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: ZVozEV_HgEYmq3uiI1OkrEoUumr37aCd
X-Proofpoint-ORIG-GUID: ZVozEV_HgEYmq3uiI1OkrEoUumr37aCd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0MiBTYWx0ZWRfX5tgn6lcKbKke
 SzStIJDNqlwOnjq1chQSLmIZRoXl5mRrU+3BjMP+PRRlk83EgYyp5UeG2kQJfSEsQwXhKlkvRoT
 eufQTQACfHHywY/9UfG9S9qDPMjmPR8p3Wv5NUuQCm0HV9ozVlxtA0xbYg85TTB19NGBHL0Yhnm
 3XIWRe13k+wKt8rXzgsNwAPQ4f2Doy9hsxhh+TwbeRpD6Mqq4nOKPydqleDyaACawogH1+/p3rb
 sfhGsk6K9f5RmPX/RRVvIxAA+c7UKmrqkv5rEj63yjKdjp5gPk2zQorYIlTDi/IiPdEvvr/IXe9
 89F2OaXcpdqEwjdmAz2e3yutYGgilpWjYJ9re07pz3SwDig253B67+lhccxYqpFW4uTTqPCpbry
 hyxNa1rM3Y/3orgWbKhG9W/15meOaIKiE5fx1MKvLMY7ukyeHJaHYqEyssIEjJOGcHebl6S/3c5
 ZMo0BihOhDBhY1pgUhg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0MiBTYWx0ZWRfX+lGhWcXTo2SP
 mHXRMKBj3xArNY9+YdqE6X0F6p+F1nTQyaKRXICErx8J3CE6WS1OJYzvZFPIWZbaVgvfc2gcH53
 TTeRqcjWcSgZIIrm3/oSNPJfqAf+STo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_090752_711768_68118F98 
X-CRM114-Status: GOOD (  25.87  )
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

On Thu, Jun 25, 2026 at 2:35=E2=80=AFAM Pengpeng Hou <pengpeng@iscas.ac.cn>=
 wrote:
>
> msdc_data_xfer_done() stops the DMA engine before completing a data
> request, but it only logs failures from the DMA stop and DMA-inactive
> polls.
>
> When the interrupt status also carries MSDC_INT_XFER_COMPL, the function
> can still report the full data length as transferred even though the DMA
> engine did not confirm that it stopped or became inactive.
>
> Treat DMA stop/inactive timeouts as data errors.  This reuses the existin=
g
> reset/error path and prevents a timed out DMA stop from being reported as=
 a
> successful full-length transfer.
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Hi Pengpeng,

Did you verify this on HW? If not, I am leaving this to the mediatek
folkz to confirm before applying.

Kind regards
Uffe


> ---
>  drivers/mmc/host/mtk-sd.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index b2680cc05..e3caa9c32 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1583,7 +1583,7 @@ static void msdc_data_xfer_done(struct msdc_host *h=
ost, u32 events,
>              | MSDC_INT_DMA_BDCSERR | MSDC_INT_DMA_GPDCSERR
>              | MSDC_INT_DMA_PROTECT);
>         u32 val;
> -       int ret;
> +       int dma_err =3D 0, ret;
>
>         spin_lock_irqsave(&host->lock, flags);
>         done =3D !host->data;
> @@ -1603,18 +1603,23 @@ static void msdc_data_xfer_done(struct msdc_host =
*host, u32 events,
>
>                 ret =3D readl_poll_timeout_atomic(host->base + MSDC_DMA_C=
TRL, val,
>                                                 !(val & MSDC_DMA_CTRL_STO=
P), 1, 20000);
> -               if (ret)
> +               if (ret) {
>                         dev_dbg(host->dev, "DMA stop timed out\n");
> +                       dma_err =3D ret;
> +               }
>
>                 ret =3D readl_poll_timeout_atomic(host->base + MSDC_DMA_C=
FG, val,
>                                                 !(val & MSDC_DMA_CFG_STS)=
, 1, 20000);
> -               if (ret)
> +               if (ret) {
>                         dev_dbg(host->dev, "DMA inactive timed out\n");
> +                       dma_err =3D ret;
> +               }
>
>                 sdr_clr_bits(host->base + MSDC_INTEN, data_ints_mask);
>                 dev_dbg(host->dev, "DMA stop\n");
>
> -               if ((events & MSDC_INT_XFER_COMPL) && (!stop || !stop->er=
ror)) {
> +               if (!dma_err && (events & MSDC_INT_XFER_COMPL) &&
> +                   (!stop || !stop->error)) {
>                         data->bytes_xfered =3D data->blocks * data->blksz=
;
>                 } else {
>                         dev_dbg(host->dev, "interrupt events: %x\n", even=
ts);
> @@ -1622,7 +1627,9 @@ static void msdc_data_xfer_done(struct msdc_host *h=
ost, u32 events,
>                         host->error |=3D REQ_DAT_ERR;
>                         data->bytes_xfered =3D 0;
>
> -                       if (events & MSDC_INT_DATTMO)
> +                       if (dma_err)
> +                               data->error =3D -ETIMEDOUT;
> +                       else if (events & MSDC_INT_DATTMO)
>                                 data->error =3D -ETIMEDOUT;
>                         else if (events & MSDC_INT_DATCRCERR)
>                                 data->error =3D -EILSEQ;
> --
> 2.50.1 (Apple Git-155)
>

