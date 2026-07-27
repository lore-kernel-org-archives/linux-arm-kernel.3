Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B219C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8UmwPFdZqcBS6XeoAjDE7OzL4Jwi9egEhXg4C5h1XHw=; b=aAyS83NeZQ20ziqTB2lLFQRMFp
	RFHy+ZnDhoBKK56UKIbGB0m62Wne6s0KbDPfD4bgDZUKoLcxYqnDf6shBLQs6fg/QRFOH1on9nq4+
	bbnFWi/FfcE365JKUGvdCMqoxtfZcY+6EQvNkE/iq0EIt0gvc53T3ub4etd9Da0BJmPW8R4IZyEIS
	lY0la7UhXv3dOhhBNhHksy3gA2pBeuUrg6u69xfgfqa8n92MnXh0bzRYbtCwaounzPfGAcPldspwC
	rH4LK9R38UgiubS5d3CXRWjDDL5Tqhr/vM1eKA7w6VYeKkzfvsmB9XeecA33l47Ub7X22ZRJK8b3a
	Nocd2LZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woO8h-00000003JHs-2VeV;
	Mon, 27 Jul 2026 16:25:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woO8f-00000003JGj-22Z8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:25:14 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDmApJ3823666
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 16:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8UmwPFdZqcBS6XeoAjDE7OzL4Jwi9egEhXg4C5h1XHw=; b=dA3/8qQbFZLPYKV4
	upzFD2CZL4QFwUTRDk5NnQdoSIXJ0GRZNNwBZXfu+SV6AhH4jQlDU6LDAzopRZXg
	lWSCNGpe2bjfcddxCHD5ktK+UA8KEy1B140DRTj0ousdcYSnhnAN0JjwtQ/kPo9L
	CLr0xZ8+3vKM6/5athIjm96UQ7rye7M0EqxkiXhQqayAidtElubN7SatsMklwlRK
	oZl4n5O1dVr5z0ZnbyLx+LJLOZ40MuCibFiGzAQTY2hGtZnN2Y/KMa4aYqto8Yxr
	G2SilhxAOf/Y8Ijh2ggksqgz977uHruA6lQkLAhRQg8oEhIIRFk5Gb2b9uNsFbn4
	XffEGQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4nbssbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 16:25:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ef31cd429so294634285a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 09:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785169512; cv=none;
        d=google.com; s=arc-20260327;
        b=ZDdc09a/fAnc1yOl3GwdIMzD0F1vtcSoXUOJN7L5g18+9wvlN2Erbw/EX+Kkcddsot
         /m67PxKUWTl+4fOqEkauX+JSRDGXhHZCtOMUeJ++f6ltTGoKrMjOSmpmdhfoHQ9zKb9A
         Vbbsupzro77yaRuoYpS1J7IMqXpYeINGwIfy0bU3qiD2lqQvcGUolAWwh2b/X0IE6646
         Oov+xta+bBEAQ1D8KtxLaCvJUydLu8zSU320q1hn7VweXzD/Vr+0vMd581CYLQc29wYi
         EKBE5GQpTp6la89/I74Kyaypxcz7k42NCnELMgTe61iWJwaCUeOTdK1xpyv/bMGYxspH
         rOWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8UmwPFdZqcBS6XeoAjDE7OzL4Jwi9egEhXg4C5h1XHw=;
        fh=4EWsh2ocTcfSZ9GouIebDLfhpTueJV4mLw7YA7Z8PSc=;
        b=nuPS/IfTqebs8fE6NOuZJ70/w6K+tdQFme9Y0+ncmnHkuiAwoMsm8w/iVns2ZmKEkb
         KvB669j1QPuHW0pDtwOS8TDcz0cq9+1VwRP7d720XiLpVJRMgKxojdx5Yf6u6yqeZuEl
         pJjLcTDvyEwD9nTFWj5lIFxMKrm9tlU5zElUB5HEOMgX8dGLRcD7+ffPpBuo/MeMd6iW
         EmwsboJeHu0jBqym4lGgfjVlJrG7Sh4lCoZej/TLQRDG6MclxC95Uw+ebaZkDNdQOPtj
         Xq/gQblbw2pSUCq5rqfVVuq9v4T+gFECJm686tkODO75Yp831f646hLmnPrp56zX0cdc
         VAHQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785169512; x=1785774312; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8UmwPFdZqcBS6XeoAjDE7OzL4Jwi9egEhXg4C5h1XHw=;
        b=Ne1GQW98hMnfkB0WvuT6pwjptSd4Nu03Vz60i4ysnyLWfmdiqXuSnpJ9L9H0nRFvJ+
         grVqBsoXZda4PkfP0Od64X8YTA5oizCW76G7gJ5x7Fr7noFDXtuZ5eCZ2CtT/Ven5sZD
         F0PERnqG1+nLVEm56WpMWZPQrJjzNDmelHGCwtWO6kjilO6/Wy4ZxiEg4FGc0iJl7J2U
         mN8rmanQVIOFovqbkmL8XQaPdkKomMQ5o/IiiBgl1cyjoR0k8oWrYWJ4qm3iRWpTsqi3
         sTc1oTEzDaerAa5WoLnlsypwLOOQTJG5FTI7DxQgJvQNI5tmulS5zEhEReoB37jk34q9
         6E/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785169512; x=1785774312;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8UmwPFdZqcBS6XeoAjDE7OzL4Jwi9egEhXg4C5h1XHw=;
        b=khAftIpxFkzrXuhOygIgDbVpgaaB28940yPQFxrJVvQtZt1I2UxlX9ahuoX53C+2QN
         2/QNVQ/s9BbdhmuKINNmzsvCLzu8QbaYLrNCrIHi5+/tn8AXTw1S9v1GrJ3kGp08Ym+y
         57cW59R1tr+HhrgvnXLox+VwvtVRY5JnuLJJn2lDd+zkG1CjFlFzBZtbpmgmvjIzJZfS
         LmNi8M7GlVvg4NRy7pinJst5JpqpqSDz99ubD3DiIAwSFEp5oEIZmT0s9m+AXV2E3OHy
         Da+S9EV8Jz8ogI0IStNXTYev+xKkcQLk4u+zaRNoT8b9D9jrv6/Q94qzgjyv0re1HRzK
         /nmA==
X-Forwarded-Encrypted: i=1; AHgh+Romu7igbK0pUffQwJks2N3gsBd4ZXSKLM8jhT6KuDf47E9fgZTiMfN4IAMk/wZ9aPZPsvr9VgWe8x7mitYhSABd@lists.infradead.org
X-Gm-Message-State: AOJu0YxuXKMIda019muBZokJmzr71hjh7GHABKUVbYUTZEk4M3OwfZLQ
	Xvh1Cx7df06uzUAkh1F2y1ph6GcvmJOy/42YeCS/UJQ12nJ95o5FjCJM1WK+6T6T5K/bgkyiyr3
	lT/5S4EpG5t3pwldB4DyTBNuHZ8rTC0DzPHaD8tulryK/1eUEBSlaqcGPnU6M3eHmi1YhxNe3Ls
	K6iYIuTBJY4xmi/0I7ZWjoUa7Gy47H6sayvgL6pYTxYnX5063y8X7u
X-Gm-Gg: AR+sD126wf3hZVwZ3uOEtJ0TigYhUcGKN+C8NFoTZdWJvZZyIDX/+C+7/j7Ipz3ENs5
	sF2kSlKefuUuH6LxDaxr14LUMGxYE8CdCwq+3HYR9bcVh8Vc/wU6FhPfv3ntr20AJOt1Z/5myXI
	z3dofTWOrpo385vButjVkeXiGpqT+kWDlZ0yytflxrKi1Scuqx8FIcVamByw==
X-Received: by 2002:a05:620a:630f:10b0:92e:70e9:6865 with SMTP id af79cd13be357-932df6f5721mr719209385a.59.1785169511744;
        Mon, 27 Jul 2026 09:25:11 -0700 (PDT)
X-Received: by 2002:a05:620a:630f:10b0:92e:70e9:6865 with SMTP id
 af79cd13be357-932df6f5721mr719204585a.59.1785169511268; Mon, 27 Jul 2026
 09:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260717101508.635969-1-panchuang@vivo.com>
In-Reply-To: <20260717101508.635969-1-panchuang@vivo.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 18:25:00 +0200
X-Gm-Features: AUfX_mypfPWM-amzHbSs1D-8MroCYJxvNGLX8PscRYAazVsoNMy_QxZjvylnM7A
Message-ID: <CAPx+jO_fcijCoA0UEPS359EZKgzEtjP3EYKt48r7ryOz6RT12A@mail.gmail.com>
Subject: Re: [PATCH] mmc: host: Remove redundant dev_err()/dev_err_probe()
To: Pan Chuang <panchuang@vivo.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Robert Richter <rric@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Jisheng Zhang <jszhang@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Thomas Fourier <fourier.thomas@gmail.com>,
        Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
        Danilo Krummrich <dakr@kernel.org>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..." <linux-mmc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
        "open list:OMAP HS MMC SUPPORT" <linux-omap@vger.kernel.org>,
        "moderated list:ARM/ACTIONS SEMI ARCHITECTURE" <linux-actions@lists.infradead.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: kwBB1DB60_-y2BOosyWtXfwmn1R9iCoM
X-Authority-Analysis: v=2.4 cv=cJjQdFeN c=1 sm=1 tr=0 ts=6a678668 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=1WtWmnkvAAAA:8 a=TYD399XWoFAa3X5oXMIA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE1MiBTYWx0ZWRfX3XO0xsaT0Aaa
 aABuDajDpFT4yz6/DtP34ohf1XsgJKXaQcXx/L+lBxeEXk7GeQTbVUq3p2vJ79Z+uK72XkYXC1P
 bf+KzCHJZZiUz3fDyE7WN5fxIHF+W8M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE1MiBTYWx0ZWRfXzZjARqIFD/0B
 KiDTgIISXuoAkT5llthlYB5813W4hlABian7LzhA7LRZSDCokFRLXNAQ5F4ijFn0WLDpFbKr9wY
 g35e5S8hRuQTHIcdQaNJBiTVln86wFOjcFf5lameqGQ+CS9bMSpjDxdeSbVJ3auaGCi6RRqZyvi
 o93pivnSRC3L2T2YlQ6gKn0p6ieyAPTYqlK6ssYHrEjtMFAt2f2OslEHdHMFSzhJaw2pWOu2gYw
 U5hj9AcdBM0EDrFGXLfeLxT94okDxa12RKTIfBZbABOMmHj2UHpk7AUaW1DXw6OEu5U0OUKATTK
 Brb8loaSVUv4MggqHQO5AoTZFWq77nh+08fMDSyoZ1cv28sl8CKUZ8wdyFpJpjUXGkykQesKVzc
 wTt8QnrwRj4GmLS0gjmka6fngsEd1F1urd6xB8aulNb15omvyF/cvbZl07YFYGgRs+JEJIB+hcw
 A76xzFJA0w42HCnVzLA==
X-Proofpoint-GUID: kwBB1DB60_-y2BOosyWtXfwmn1R9iCoM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_092513_535438_3AF41574 
X-CRM114-Status: GOOD (  21.93  )
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

On Fri, Jul 17, 2026 at 12:17=E2=80=AFPM Pan Chuang <panchuang@vivo.com> wr=
ote:
>
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() and devm_request_threaded_irq(=
)
> automatically log detailed error messages on failure. Remove the
> now-redundant driver-specific dev_err() and dev_err_probe() calls.
>
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/alcor.c         |  3 +--
>  drivers/mmc/host/cavium-octeon.c | 10 ++--------
>  drivers/mmc/host/meson-mx-sdio.c |  5 +----
>  drivers/mmc/host/mvsdio.c        |  4 +---
>  drivers/mmc/host/omap_hsmmc.c    |  4 +---
>  drivers/mmc/host/owl-mmc.c       |  5 +----
>  drivers/mmc/host/sdhci-msm.c     |  4 +---
>  drivers/mmc/host/sh_mmcif.c      |  8 ++------
>  8 files changed, 10 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/mmc/host/alcor.c b/drivers/mmc/host/alcor.c
> index 721db54739c1..45528909a758 100644
> --- a/drivers/mmc/host/alcor.c
> +++ b/drivers/mmc/host/alcor.c
> @@ -1103,8 +1103,7 @@ static int alcor_pci_sdmmc_drv_probe(struct platfor=
m_device *pdev)
>                         alcor_irq, alcor_irq_thread, IRQF_SHARED,
>                         DRV_NAME_ALCOR_PCI_SDMMC, host);
>         if (ret)
> -               return dev_err_probe(&pdev->dev, ret,
> -                                    "Failed to get irq for data line\n")=
;
> +               return ret;
>
>         mutex_init(&host->cmd_mutex);
>         INIT_DELAYED_WORK(&host->timeout_work, alcor_timeout_timer);
> diff --git a/drivers/mmc/host/cavium-octeon.c b/drivers/mmc/host/cavium-o=
cteon.c
> index 8a0daddd9200..1bfc1a4f9fe9 100644
> --- a/drivers/mmc/host/cavium-octeon.c
> +++ b/drivers/mmc/host/cavium-octeon.c
> @@ -240,21 +240,15 @@ static int octeon_mmc_probe(struct platform_device =
*pdev)
>                         ret =3D devm_request_irq(&pdev->dev, mmc_irq[i],
>                                                cvm_mmc_interrupt,
>                                                0, cvm_mmc_irq_names[i], h=
ost);
> -                       if (ret < 0) {
> -                               dev_err(&pdev->dev, "Error: devm_request_=
irq %d\n",
> -                                       mmc_irq[i]);
> +                       if (ret < 0)
>                                 return ret;
> -                       }
>                 }
>         } else {
>                 ret =3D devm_request_irq(&pdev->dev, mmc_irq[0],
>                                        cvm_mmc_interrupt, 0, KBUILD_MODNA=
ME,
>                                        host);
> -               if (ret < 0) {
> -                       dev_err(&pdev->dev, "Error: devm_request_irq %d\n=
",
> -                               mmc_irq[0]);
> +               if (ret < 0)
>                         return ret;
> -               }
>         }
>
>         host->global_pwr_gpiod =3D devm_gpiod_get_optional(&pdev->dev,
> diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx=
-sdio.c
> index 5921e2cb2180..bef5e843f449 100644
> --- a/drivers/mmc/host/meson-mx-sdio.c
> +++ b/drivers/mmc/host/meson-mx-sdio.c
> @@ -683,11 +683,8 @@ static int meson_mx_mmc_probe(struct platform_device=
 *pdev)
>                                         meson_mx_mmc_irq,
>                                         meson_mx_mmc_irq_thread, IRQF_ONE=
SHOT,
>                                         NULL, host);
> -       if (ret) {
> -               dev_err_probe(host->controller_dev, ret,
> -                             "Failed to request IRQ\n");
> +       if (ret)
>                 goto error_unregister_slot_pdev;
> -       }
>
>         core_clk =3D devm_clk_get_enabled(host->controller_dev, "core");
>         if (IS_ERR(core_clk)) {
> diff --git a/drivers/mmc/host/mvsdio.c b/drivers/mmc/host/mvsdio.c
> index 79df2fa89a3f..cf705b265e21 100644
> --- a/drivers/mmc/host/mvsdio.c
> +++ b/drivers/mmc/host/mvsdio.c
> @@ -764,10 +764,8 @@ static int mvsd_probe(struct platform_device *pdev)
>         mvsd_power_down(host);
>
>         ret =3D devm_request_irq(&pdev->dev, irq, mvsd_irq, 0, DRIVER_NAM=
E, host);
> -       if (ret) {
> -               dev_err(&pdev->dev, "cannot assign irq %d\n", irq);
> +       if (ret)
>                 goto out;
> -       }
>
>         timer_setup(&host->timer, mvsd_timeout_timer, 0);
>         platform_set_drvdata(pdev, mmc);
> diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.=
c
> index 58c881f2725b..63a9fb970975 100644
> --- a/drivers/mmc/host/omap_hsmmc.c
> +++ b/drivers/mmc/host/omap_hsmmc.c
> @@ -1915,10 +1915,8 @@ static int omap_hsmmc_probe(struct platform_device=
 *pdev)
>         /* Request IRQ for MMC operations */
>         ret =3D devm_request_irq(&pdev->dev, host->irq, omap_hsmmc_irq, 0=
,
>                         mmc_hostname(mmc), host);
> -       if (ret) {
> -               dev_err(mmc_dev(host->mmc), "Unable to grab HSMMC IRQ\n")=
;
> +       if (ret)
>                 goto err_irq;
> -       }
>
>         ret =3D omap_hsmmc_reg_get(host);
>         if (ret)
> diff --git a/drivers/mmc/host/owl-mmc.c b/drivers/mmc/host/owl-mmc.c
> index 349082d76a99..d5b8a110267b 100644
> --- a/drivers/mmc/host/owl-mmc.c
> +++ b/drivers/mmc/host/owl-mmc.c
> @@ -635,11 +635,8 @@ static int owl_mmc_probe(struct platform_device *pde=
v)
>
>         ret =3D devm_request_irq(&pdev->dev, owl_host->irq, owl_irq_handl=
er,
>                                0, dev_name(&pdev->dev), owl_host);
> -       if (ret) {
> -               dev_err(&pdev->dev, "Failed to request irq %d\n",
> -                       owl_host->irq);
> +       if (ret)
>                 goto err_release_channel;
> -       }
>
>         ret =3D mmc_add_host(mmc);
>         if (ret) {
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index ceed47ccfda8..4aff965f0e2e 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2864,10 +2864,8 @@ static int sdhci_msm_probe(struct platform_device =
*pdev)
>         ret =3D devm_request_threaded_irq(&pdev->dev, msm_host->pwr_irq, =
NULL,
>                                         sdhci_msm_pwr_irq, IRQF_ONESHOT,
>                                         dev_name(&pdev->dev), host);
> -       if (ret) {
> -               dev_err(&pdev->dev, "Request IRQ failed (%d)\n", ret);
> +       if (ret)
>                 goto clk_disable;
> -       }
>
>         msm_host->mmc->caps |=3D MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_R=
SP_BUSY;
>
> diff --git a/drivers/mmc/host/sh_mmcif.c b/drivers/mmc/host/sh_mmcif.c
> index 9831956de1c8..7706d01b149e 100644
> --- a/drivers/mmc/host/sh_mmcif.c
> +++ b/drivers/mmc/host/sh_mmcif.c
> @@ -1505,18 +1505,14 @@ static int sh_mmcif_probe(struct platform_device =
*pdev)
>         name =3D irq[1] < 0 ? dev_name(dev) : "sh_mmc:error";
>         ret =3D devm_request_threaded_irq(dev, irq[0], sh_mmcif_intr,
>                                         sh_mmcif_irqt, 0, name, host);
> -       if (ret) {
> -               dev_err(dev, "request_irq error (%s)\n", name);
> +       if (ret)
>                 goto err_clk;
> -       }
>         if (irq[1] >=3D 0) {
>                 ret =3D devm_request_threaded_irq(dev, irq[1],
>                                                 sh_mmcif_intr, sh_mmcif_i=
rqt,
>                                                 0, "sh_mmc:int", host);
> -               if (ret) {
> -                       dev_err(dev, "request_irq error (sh_mmc:int)\n");
> +               if (ret)
>                         goto err_clk;
> -               }
>         }
>
>         mutex_init(&host->thread_lock);
> --
> 2.34.1
>

