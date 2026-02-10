Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C590AEB2700
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 22:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UliAcKlqQ0Ffn7IelNMZvQRaXYOmOwslWVLsu673AlY=; b=axbnixJzj+K+82IvsqAfMgv1tU
	7Bi1wDjm4oO42qrnx8QrX2TjmfIHxVi2u+5OApL/NseBsSkTT4gUDXv+FLILCPApSgoyOCEt08fF6
	FPyFeYzPukd/bGJFALWyLX8jB0I8EjlHxnvsvNP6W4gk4g3i3bTmOX7S6vxJ7tCus1JgfRfCubCqd
	iHiMdjz1aoRUpKMqqL73mwhlvP+vVeTzEY48sJAo3UKg7CIuVccfmpQtx7O9WCkxmqiutvpA4DAGQ
	3Nl1sBZ0leAQaBzzs1laRjPhCRX6Yd3uXFYULS0mdiRNvu8bjyXHEpFMlDlmChk/hJndj11nQ1wwn
	q28uZHbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpvpW-0000000HXak-06uY;
	Tue, 10 Feb 2026 22:03:34 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpvpT-0000000HXaF-2CDB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 22:03:32 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b87677a8abeso926920166b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 14:03:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770761009; cv=none;
        d=google.com; s=arc-20240605;
        b=LbT6OI2GoKoiwsd0vxBYKAQrrdch43HiC6PA7x2urGXNrUQIUc83VNIMSe8DgT39mv
         ZKzF4P2WoLRbLN8LX967t3D8VGUFkknEvvd+eEZzqqjrBq1Hf+OOFyNRCalasyMdMiAn
         O4xCRD5lhO2cDcTKU2P/UTVxTlZYyK9aO1WdmUL3DjQN4mPpvy5ZfjPjGupCFZYrzZu/
         5NHYBiNfcysP4W+DjPMQavVlqGHH4UtIXZYoT2ifhSu4RSwyLYvZOQaIZemPde8J6lg8
         yThvF16YNzx3XrVX+DXPRa00kEnSTHuCWfZNHnoDsUIinEl9DML6XATFuHpdO247ibcS
         GUGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UliAcKlqQ0Ffn7IelNMZvQRaXYOmOwslWVLsu673AlY=;
        fh=ZjKpTV2s/sKK7xjAa6WXP8VqhFVhqDGYl64ehiPZCBA=;
        b=aPp/Ny6UFySfFVhBTZ9/tIPLxJBQaECJ4dcdP7+sw2u3t5vDyBwyAjaK2RRVNSDWjL
         kBWpA2v+CpfaS4HGd6eP0UGoM4x2JYnNETRYWVnL6FKOnHFhP2zJxv6jckGvVcxQsGxU
         utReg+XM42ajH71Si9CpMAosVrKYjlWQZV7IBHYiaGVXr9PrJh3sigJQ3L+TQ34r7d1C
         pDB1AGyS9H88lMiguVv1Yg8o5GTdCeDy+WxuuCWSmGRXWdpJov1Z8KkpwzucPDY9fR2P
         Si3yO9Xzdt+qePhFUvX5OHIK3OTLSXfUhXUXim4Iuips2ufr1yrGen/3OFrysktHO+eo
         UD+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770761009; x=1771365809; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UliAcKlqQ0Ffn7IelNMZvQRaXYOmOwslWVLsu673AlY=;
        b=rDW9hkWmlOqpYyTnDb7haz9QKPeep70X80pZya0hbSUUBmfbJSSPlB0bhKArbenCeT
         lMmZY5NMFlrmG8Qx88hP9E45xQCMWV66VuhKY8mqGPHyiZs+uDEoVw640jDH0b2n3yz2
         IlHsh7dGJbkQKrK/BWASS9K9n9k+VWxCgw1p8oF+pYKtrRJW1n5CePaZaE5ttY4U0/F0
         2RzvE71YSabcg4bWiQgbzjM8+FI23nzb2ZcSaUYz56b+NGuwTCbnYOhhU1oH9mnJ3tV2
         F1KZgCvfTfmS1+AFm1Somi0kIHxONII187l4D3KukBrzqWxeoMpgpXE2vl2GcEM+h9mV
         nyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770761009; x=1771365809;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UliAcKlqQ0Ffn7IelNMZvQRaXYOmOwslWVLsu673AlY=;
        b=RX5v6gSujSuoIUPxVHv8J+YHqyalmbrlma/ZG5Kt9aFS21INVM+o9OUhMzwUCvowdZ
         mHkJ5iqzEEWwYxvuryC0/meVfirzLWjZD0P5lpWQFn0XHgE3K2bC9p4Mkh8Sr6Ezv7lV
         2agKGsqXUyrHzHhuetzwI2W0vaPwy01pjSKBCV6K33pJd1FvKaAsNmSBf2jACiaENvyR
         4AMvpfeNcIZb9ntY1o9HWllGM1MD9mJ6w/pzEgz5VSKnwCGd8NhX8v6MgGZjS5lI+puW
         qiuneWfuSTr8/xEYajGQkJLc7fLEPcelejYUfThOBHFuSo8t7VPDfhvr17LHbLPoLJLQ
         SHNg==
X-Forwarded-Encrypted: i=1; AJvYcCXBgit+uPBIEgpvg2qoUURqY24GdoVE8PYmHXwDKSZ3pS1KSBz23FsoG5kyxwHq3tA0mIPc1rAo2cE1a/1s44+O@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo5GOW1LBIt2PDHjD5jaAzWG9vKAwXXAMzBbsVlXPAiMBWe9bc
	MKq9nS1JPp6joyG9BwPdeFl8CzPiuBgrpm99Sml6Hsgj4WkRGbvG1fIsdD7pwRKSWXSNczIp7pH
	QBhBgXDnAH2HzoUZ5wm/kBY/v9NHGdXYrKzVKMFBRIQ==
X-Gm-Gg: AZuq6aKEUYCAPlTOi7/gBIIk6L22lKX0hv4MfgBU8GAOTQekSGzNrUBGM27d682d0yq
	CtITcCdMXZJ444v741rxaJrGn+mdsExPyNWtbI3TvGoAPkEpcd+n2VmD3pdPcRKMFKLl0SmNqCt
	epb+SfeAHFgTb1+YMnwaZYeaQ85XzgFIwW1s8R16sgYTKTUPBoUidbYPYZB6xd5jXXkRbEJdl7k
	xJjOw9cwckcvfMqYHavUjQQcsNGx3XxFW4dKhI7NVn9h0LYvAqnAQ2YXMkf2F5cnc1K/QSS56k9
	ENbij6NIvS9gWDBEANRE+FZKG6FbVRAbebHVV84KbA==
X-Received: by 2002:a17:907:9618:b0:b8d:be68:bc21 with SMTP id
 a640c23a62f3a-b8f6eec8fe7mr6747966b.21.1770761008993; Tue, 10 Feb 2026
 14:03:28 -0800 (PST)
MIME-Version: 1.0
References: <20260208-imx-rproc-fix-v1-1-ad74555eb9a4@nxp.com>
In-Reply-To: <20260208-imx-rproc-fix-v1-1-ad74555eb9a4@nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 10 Feb 2026 15:03:17 -0700
X-Gm-Features: AZwV_Qgdm6kPXS9NZM-j5COa-F6f74PqWhNBvMsMK65d02PCcMWV4eo058PVXss
Message-ID: <CANLsYky0HEkzL86XZ5K1NwJ3Gh9DcQKwu=WwiozMmus8UJQDPQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: Fix unreachable platform prepare_ops
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_140331_580120_1F96BFA4 
X-CRM114-Status: GOOD (  23.64  )
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

On Sun, 8 Feb 2026 at 04:29, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Smatch reports unreachable code in imx_rproc_prepare(), where an early
> return inside the reserved-memory parsing loop prevents platform
> prepare_ops from being executed.
>
> When of_reserved_mem_region_to_resource() fails, imx_rproc_prepare()
> returns immediately, so the platform-specific prepare callback is never
> called. As a result, prepare_ops such as imx_rproc_sm_lmm_prepare() on
> i.MX95 have no chance to run.
>
> This is problematic when Linux controls the M7 Logical Machine and is
> responsible for preparing resources such as TCM. Without running the
> platform prepare callback, loading the M7 ELF into TCM may fail if the
> bootloader did not power up and initialize TCM.
>
> Fix this by breaking out of the reserved-memory loop instead of
> returning, allowing the platform prepare_ops to be executed as intended.
>
> Fixes: edd2a9956055 ("remoteproc: imx_rproc: Introduce prepare ops for imx_rproc_dcfg")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-remoteproc/aYYXAa2Fj36XG4yQ@p14s/T/#t
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index f5f916d6790519360f446f063e09d018c5654953..8c8ddbf995a46b01627d15a2eb3da0b72eee6285 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -617,7 +617,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
>
>                 err = of_reserved_mem_region_to_resource(np, i++, &res);
>                 if (err)
> -                       return 0;
> +                       break;
>

I will pick this up for the next cycle.

Thanks,
Mathieu

>                 /*
>                  * Ignore the first memory region which will be used vdev buffer.
>
> ---
> base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
> change-id: 20260208-imx-rproc-fix-843dd1031b5b
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>

