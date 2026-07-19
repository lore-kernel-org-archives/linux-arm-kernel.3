Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788DCC44521
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 12:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3fVS+ECH09jWUFwptOLb/MWTOvFAf/GdBg0UMf3cmE=; b=Cy0skgJyc1zrg4FVSL0pRZucoj
	kwwu6j9Y9SL2+ZhwcziTOvDVtgwUznpcwzYdx9d42QdMW6gyflLbobOPXLElTKfoc4QcX/cgE3+PO
	9H2XtyFIkQg5v6I/Tl388H0OORS9vy0AHAAWu6aa1LHzh/jqzK2LFu2Qn4gCTwp9Pc0eIyLZcEwBH
	bX+T+nwA1AInwN7aTV5XqGShGEU9Z46UscJGwzLaaz97+twMnTd7Xu3ywNKPWdX6IlKnB3JL5MVLB
	76Zci4qkXry+p+TP+GdXeYpaIkjQjjwKobdwbitT4NlMN71bkvsMZPEizUWIoZ0iM5rWlmjG8KN0y
	xfN/kJ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlR3D-000000050NH-1Rls;
	Sun, 19 Jul 2026 12:55:23 +0000
Received: from aposti.net ([185.119.170.32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlR3A-000000050Mm-0c3j;
	Sun, 19 Jul 2026 12:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crapouillou.net;
	s=mail; t=1784465709;
	bh=gEhWSVkmaiCRRHw/wZCbCrw1IuLU51WzeuYRKtzSQY4=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=z63wrtdRW4T1uLwNAZv5/g3vU404MEwJYWT09pHMfbx2DJaEOlmj7VspONMYXCsqI
	 R8REf49NPFrMSzR/OvMiDVruqKaWbGSUB1ottcguFk+1m56L3Y6lDofIiE791ilBX1
	 XVQPwBGP8UXIEgxTyAcFXsbd0BrMi37v97Pc/sgU=
Message-ID: <0cb39a3e2f2fc0efeed2b1bd5847655f7c8edbcf.camel@crapouillou.net>
Subject: Re: [PATCH] remoteproc: Remove redundant dev_err()/dev_err_probe()
From: Paul Cercueil <paul@crapouillou.net>
To: Pan Chuang <panchuang@vivo.com>, Bjorn Andersson <andersson@kernel.org>,
  Mathieu Poirier <mathieu.poirier@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>, "open list:REMOTE PROCESSOR (REMOTEPROC)
 SUBSYSTEM"	 <linux-remoteproc@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>,  "open list:INGENIC JZ47xx SoCs"	
 <linux-mips@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"	
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "open list:ARM/QUALCOMM
 MAILING LIST"	 <linux-arm-msm@vger.kernel.org>, "moderated list:ARM/STM32
 ARCHITECTURE"	 <linux-stm32@st-md-mailman.stormreply.com>
Date: Sun, 19 Jul 2026 14:55:05 +0200
In-Reply-To: <20260717065224.600593-1-panchuang@vivo.com>
References: <20260717065224.600593-1-panchuang@vivo.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_055520_583783_0405AEC7 
X-CRM114-Status: GOOD (  15.37  )
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

Hi,

Le vendredi 17 juillet 2026 =C3=A0 14:52 +0800, Pan Chuang a =C3=A9crit=C2=
=A0:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() and
> devm_request_threaded_irq()
> automatically log detailed error messages on failure. Remove the
> now-redundant driver-specific dev_err() and dev_err_probe() calls.
>=20
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

For Ingenic:
Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0drivers/remoteproc/da8xx_remoteproc.c=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +=
-
> =C2=A0drivers/remoteproc/ingenic_rproc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 4 +---
> =C2=A0drivers/remoteproc/keystone_remoteproc.c |=C2=A0 4 ++--
> =C2=A0drivers/remoteproc/mtk_scp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +---
> =C2=A0drivers/remoteproc/qcom_q6v5.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 20 +++++---------------
> =C2=A0drivers/remoteproc/qcom_sysmon.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 --
> =C2=A0drivers/remoteproc/qcom_wcnss.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +---
> =C2=A0drivers/remoteproc/stm32_rproc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 3 +--
> =C2=A08 files changed, 12 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/remoteproc/da8xx_remoteproc.c
> b/drivers/remoteproc/da8xx_remoteproc.c
> index 23fca7176539..006fa7b56727 100644
> --- a/drivers/remoteproc/da8xx_remoteproc.c
> +++ b/drivers/remoteproc/da8xx_remoteproc.c
> @@ -298,7 +298,7 @@ static int da8xx_rproc_probe(struct
> platform_device *pdev)
> =C2=A0					handle_event, 0, "da8xx-
> remoteproc",
> =C2=A0					rproc);
> =C2=A0	if (ret)
> -		return dev_err_probe(dev, ret,
> "devm_request_threaded_irq error\n");
> +		return ret;
> =C2=A0
> =C2=A0	/*
> =C2=A0	 * rproc_add() can end up enabling the DSP's clk with the
> DSP
> diff --git a/drivers/remoteproc/ingenic_rproc.c
> b/drivers/remoteproc/ingenic_rproc.c
> index 1b78d8ddeacf..252519f48964 100644
> --- a/drivers/remoteproc/ingenic_rproc.c
> +++ b/drivers/remoteproc/ingenic_rproc.c
> @@ -219,10 +219,8 @@ static int ingenic_rproc_probe(struct
> platform_device *pdev)
> =C2=A0
> =C2=A0	ret =3D devm_request_irq(dev, vpu->irq, vpu_interrupt,
> IRQF_NO_AUTOEN,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "VPU", rproc);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to request IRQ\n");
> +	if (ret < 0)
> =C2=A0		return ret;
> -	}
> =C2=A0
> =C2=A0	ret =3D devm_rproc_add(dev, rproc);
> =C2=A0	if (ret) {
> diff --git a/drivers/remoteproc/keystone_remoteproc.c
> b/drivers/remoteproc/keystone_remoteproc.c
> index 83763d640c4e..407d6034f748 100644
> --- a/drivers/remoteproc/keystone_remoteproc.c
> +++ b/drivers/remoteproc/keystone_remoteproc.c
> @@ -411,7 +411,7 @@ static int keystone_rproc_probe(struct
> platform_device *pdev)
> =C2=A0	ret =3D devm_request_irq(dev, ksproc->irq_ring,
> keystone_rproc_vring_interrupt,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IRQF_NO_AUTOEN, dev_name(de=
v),
> ksproc);
> =C2=A0	if (ret)
> -		return dev_err_probe(dev, ret, "failed to request
> vring interrupt\n");
> +		return ret;
> =C2=A0
> =C2=A0	ksproc->irq_fault =3D platform_get_irq_byname(pdev,
> "exception");
> =C2=A0	if (ksproc->irq_fault < 0)
> @@ -419,7 +419,7 @@ static int keystone_rproc_probe(struct
> platform_device *pdev)
> =C2=A0	ret =3D devm_request_irq(dev, ksproc->irq_fault,
> keystone_rproc_exception_interrupt,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IRQF_NO_AUTOEN, dev_name(de=
v),
> ksproc);
> =C2=A0	if (ret)
> -		return dev_err_probe(dev, ret, "failed to enable
> exception interrupt\n");
> +		return ret;
> =C2=A0
> =C2=A0	ksproc->kick_gpio =3D devm_gpiod_get(dev, "kick", GPIOD_ASIS);
> =C2=A0	ret =3D PTR_ERR_OR_ZERO(ksproc->kick_gpio);
> diff --git a/drivers/remoteproc/mtk_scp.c
> b/drivers/remoteproc/mtk_scp.c
> index 436656bdfa8b..9751acc2bf83 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1246,10 +1246,8 @@ static struct mtk_scp *scp_rproc_init(struct
> platform_device *pdev,
> =C2=A0					scp_irq_handler,
> IRQF_ONESHOT,
> =C2=A0					pdev->name, scp);
> =C2=A0
> -	if (ret) {
> -		dev_err(dev, "failed to request irq\n");
> +	if (ret)
> =C2=A0		goto remove_subdev;
> -	}
> =C2=A0
> =C2=A0	return scp;
> =C2=A0
> diff --git a/drivers/remoteproc/qcom_q6v5.c
> b/drivers/remoteproc/qcom_q6v5.c
> index 0206a4a19254..1075ef4027b7 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -302,10 +302,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5,
> struct platform_device *pdev,
> =C2=A0					NULL, q6v5_wdog_interrupt,
> =C2=A0					IRQF_TRIGGER_RISING |
> IRQF_ONESHOT,
> =C2=A0					"q6v5 wdog", q6v5);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to acquire wdog IRQ\n");
> +	if (ret)
> =C2=A0		return ret;
> -	}
> =C2=A0
> =C2=A0	q6v5->fatal_irq =3D platform_get_irq_byname(pdev, "fatal");
> =C2=A0	if (q6v5->fatal_irq < 0)
> @@ -315,10 +313,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5,
> struct platform_device *pdev,
> =C2=A0					NULL, q6v5_fatal_interrupt,
> =C2=A0					IRQF_TRIGGER_RISING |
> IRQF_ONESHOT,
> =C2=A0					"q6v5 fatal", q6v5);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to acquire fatal
> IRQ\n");
> +	if (ret)
> =C2=A0		return ret;
> -	}
> =C2=A0
> =C2=A0	q6v5->ready_irq =3D platform_get_irq_byname(pdev, "ready");
> =C2=A0	if (q6v5->ready_irq < 0)
> @@ -328,10 +324,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5,
> struct platform_device *pdev,
> =C2=A0					NULL, q6v5_ready_interrupt,
> =C2=A0					IRQF_TRIGGER_RISING |
> IRQF_ONESHOT,
> =C2=A0					"q6v5 ready", q6v5);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to acquire ready
> IRQ\n");
> +	if (ret)
> =C2=A0		return ret;
> -	}
> =C2=A0
> =C2=A0	q6v5->handover_irq =3D platform_get_irq_byname(pdev,
> "handover");
> =C2=A0	if (q6v5->handover_irq < 0)
> @@ -342,10 +336,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5,
> struct platform_device *pdev,
> =C2=A0					IRQF_TRIGGER_RISING |
> IRQF_ONESHOT |
> =C2=A0					IRQF_NO_AUTOEN,
> =C2=A0					"q6v5 handover", q6v5);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to acquire handover
> IRQ\n");
> +	if (ret)
> =C2=A0		return ret;
> -	}
> =C2=A0
> =C2=A0	q6v5->stop_irq =3D platform_get_irq_byname(pdev, "stop-ack");
> =C2=A0	if (q6v5->stop_irq < 0)
> @@ -355,10 +347,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5,
> struct platform_device *pdev,
> =C2=A0					NULL, q6v5_stop_interrupt,
> =C2=A0					IRQF_TRIGGER_RISING |
> IRQF_ONESHOT,
> =C2=A0					"q6v5 stop", q6v5);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to acquire stop-ack
> IRQ\n");
> +	if (ret)
> =C2=A0		return ret;
> -	}
> =C2=A0
> =C2=A0	q6v5->state =3D devm_qcom_smem_state_get(&pdev->dev, "stop",
> &q6v5->stop_bit);
> =C2=A0	if (IS_ERR(q6v5->state)) {
> diff --git a/drivers/remoteproc/qcom_sysmon.c
> b/drivers/remoteproc/qcom_sysmon.c
> index a0830a48b1f4..61e1038328e8 100644
> --- a/drivers/remoteproc/qcom_sysmon.c
> +++ b/drivers/remoteproc/qcom_sysmon.c
> @@ -662,8 +662,6 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct
> rproc *rproc,
> =C2=A0						IRQF_TRIGGER_RISING
> | IRQF_ONESHOT,
> =C2=A0						"q6v5 shutdown-ack",
> sysmon);
> =C2=A0		if (ret) {
> -			dev_err(sysmon->dev,
> -				"failed to acquire shutdown-ack
> IRQ\n");
> =C2=A0			kfree(sysmon);
> =C2=A0			return ERR_PTR(ret);
> =C2=A0		}
> diff --git a/drivers/remoteproc/qcom_wcnss.c
> b/drivers/remoteproc/qcom_wcnss.c
> index 3392c9380202..e9a00efe97f6 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -521,10 +521,8 @@ static int wcnss_request_irq(struct qcom_wcnss
> *wcnss,
> =C2=A0					NULL, thread_fn,
> =C2=A0					IRQF_TRIGGER_RISING |
> IRQF_ONESHOT,
> =C2=A0					"wcnss", wcnss);
> -	if (ret) {
> -		dev_err(&pdev->dev, "request %s IRQ failed\n",
> name);
> +	if (ret)
> =C2=A0		return ret;
> -	}
> =C2=A0
> =C2=A0	/* Return the IRQ number if the IRQ was successfully
> acquired */
> =C2=A0	return irq_number;
> diff --git a/drivers/remoteproc/stm32_rproc.c
> b/drivers/remoteproc/stm32_rproc.c
> index 0e5d64fbe52c..1fe4cdc0a13a 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -682,8 +682,7 @@ static int stm32_rproc_parse_dt(struct
> platform_device *pdev,
> =C2=A0		err =3D devm_request_irq(dev, irq, stm32_rproc_wdg, 0,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_name(dev), pdev);
> =C2=A0		if (err)
> -			return dev_err_probe(dev, err,
> -					=C2=A0=C2=A0=C2=A0=C2=A0 "failed to request wdg
> irq\n");
> +			return err;
> =C2=A0
> =C2=A0		ddata->wdg_irq =3D irq;
> =C2=A0

