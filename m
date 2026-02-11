Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5987DE9E311
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 15:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8tEaQ6SYPSExfheur4wSJ9KP74RCbKGRXJfEtk6eHc=; b=v1BI5iBEweNvlrjPcILmgyuKHD
	O5Yr7D188HWmGrIOR/rrBGKTX75jMj4BnaA/yxoTjiNAKLOgOgY6xUhLLtl/Ct8SKOilpPmawiuDH
	0tgyBqLDwd7tdTtKNyqJ1upJSsz8aWIMGu9s0HmO6l8TDD1Je7IaaxIVJUBd4pHS3G1Ux/xw+R2QV
	KjHVGVC0Elvr0+ja/DspCXWpzetCwklx9Liyoei3FTocNbi2wgYc5TWnZI7W7DElVoze+MxvWsl1H
	/eXRjk4WzgMF+ZHwQtv7Xlp8N312Mc16LS05c3iolZC6nMDU6Hg/jdw1TfMKztiIy4slXHPp3C7pV
	c3QalrdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqC2W-00000000mM0-0e1E;
	Wed, 11 Feb 2026 15:22:04 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqC2T-00000000mLM-0EHr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 15:22:02 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-59e5c540b9cso1213102e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 07:21:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770823318; cv=none;
        d=google.com; s=arc-20240605;
        b=NNiR8Z84VpVPAGCeNQ84cAUeS+Wc8aV31+Kza9JpKF/XxrevaC6WdNwJyFSD4BmXjR
         XDKke3ZpMvrVCJ5HjY+W3ZKiMIMfIrRt+CNcO1Ntx2XQAheQRmVNaTvNotNxYjtpcFzk
         AdoQL7vPN61wxoCszPmtmB81udbDFntKwFetSadq8cxCMn7NyMGGzUNLu6e7FVJJDP3G
         U+LWzKfh/JG75RGKtHIxPKqB8+9Sak8iZCE6R7aVXewCDMj4Pza+YNmsQVxJK4rqYAfP
         gFLgAg9o1HThtUYvV6f9rSJECLqYaTO+GKZMovYceELaVXWszuzLywFSBPD4TGmpj1/r
         c05w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D8tEaQ6SYPSExfheur4wSJ9KP74RCbKGRXJfEtk6eHc=;
        fh=rvIrm1FubvvpEq0PAsRpUq9vS8nJ4UQVRiBxHe+InuA=;
        b=JFEEfBDmArAlORfQIJ0mdbbAFLoSPNhGs7xGHGkxMIlgODwlSCZXLjLFKFY8YmKuYC
         woiE6LiipWuQ3i6QrpBYIowMgWit8f54GXo07aVnuhWk4pnGFUDYQQRjTHACbeNodslS
         s8esXNZ/VMeqrH5kgXRm7znhDjnW3NT5cmNjr1ZiRQPPNN07o9/Nz6iVf51IouQgCb3Q
         YRW1rYx+hoYV5XekqF9bLEQgWqe5/2I/1dPra9EHvGLge7XwawHMwsolao1emZVqMQjp
         z88QIKJn9w6oMAy4JgYuJ1dqIBEKdN01urexB5amqDEPEXRHJiEEZFXn+A5a/lOv5WSQ
         21Cw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770823318; x=1771428118; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8tEaQ6SYPSExfheur4wSJ9KP74RCbKGRXJfEtk6eHc=;
        b=dxibToFxRifjYej723hIiS+77UyZsUqgi5LLuKgi539SzQ5wiFnh690V59OOKTUEKa
         SbD8m+41VCZD5reeo91Viay/u0eQ6DvB4Z7Gp1jKntgKfJ0mvVFVn421st9Wd+CUzsAg
         iMiqCVOk4AiFKL8W7KU6a2QDL/jDZyycy1drBtMDoJ2eR4CqhqtxsxGaIAIyJtnMP0GX
         PSAD4bfcRpqG0Bfqe/QJ6c1peqQPMYKGD8+QI2Gd3wxfmrocFEWVNYoE6U/dtt/MjTxK
         WnR0eKqIe8xXPGu/AezmE7F4ROtj/UUhj2rexfn3rjSEBcB8NkxVAkqtBsUm4GZ1cYSQ
         sisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770823318; x=1771428118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D8tEaQ6SYPSExfheur4wSJ9KP74RCbKGRXJfEtk6eHc=;
        b=BgkIWTudyfiED0gt/A6Vv4pmWnESCl/EIFT3UXbQbde7+KKyvzPNqAYrxn6TxjtA7N
         usfajZ6OOTRQZZsNcDQWeDyt9NKFFV+loriQlaO4LckpZ4L7voeWqx+BJr56Y5AMwdX5
         c+or9ImSXgnm/u/7C8t+s82KPg2A9E2DETb82/0fJX/GIKEAsKt9fGBzutH/qRWvbTuQ
         A+pMsHZg2gVG4a5b/blL1RBXyyEDuNSP1iNCeeC119C1o3I2IepS3vl7xZy4RBdwlVAg
         tJVO2wfCEItuxB6duYPJfkH23GM7F0pP26TcvapsicIXFczSTQI1UFzcV10LPMRWqWhh
         rQ7w==
X-Forwarded-Encrypted: i=1; AJvYcCVzV0aPfFEDmyfy92O1Zhk9ZvychBlqOtXO+rmpHO5SEp9OkvZRUVLelZH5QDEVtZuLCM5dVvvpIMWrxCo19HQu@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfk+bRHAXt6XLD40vykH3KfGq0unuBXlSZQgb7OI7iClPb+8x/
	X1FDigzLA67SJujDR+MVpOoSa9Ufr6R+IJ96WFyBxDglFnQxlS8t0KuVoS5tZ9jqCcy9VH8j7Id
	mnIKlR9qpZ8WgL5QL85KhZE6AfSIibYe3tbHll0av4A==
X-Gm-Gg: AZuq6aIYd+fs7SXdGY3jow+4D1+UA/HFBMb0aONfDfzXrj5nu4SMIGYMHrmT1Px6J7w
	e/DNcuDqy5F5dg50DUql8USUxuqwJFs4DfQA7u0i4LK43ZG4bizYikBf3e+yKCtBNcPtJr1Yerr
	+gpnlEutfNgEW8aq0mUKZiHegt/508UMLfYW5qgpv95j0Fwr6qsT1FpFHOcYAxHKPrbxmE5DOGT
	8kA9CxFbRsVFZ05yx4DXW7V6SiEYXan5ODaC9FBOugu/NJEzRq259gJsFSGbols9pQij+pi0TN5
	q//3M9T1
X-Received: by 2002:a05:6512:15a9:b0:59d:e5dd:2bf8 with SMTP id
 2adb3069b0e04-59e45043c8bmr6830204e87.4.1770823318175; Wed, 11 Feb 2026
 07:21:58 -0800 (PST)
MIME-Version: 1.0
References: <20260206-imx8mm_gpu_power_domain-v4-1-52fb603da502@nxp.com>
In-Reply-To: <20260206-imx8mm_gpu_power_domain-v4-1-52fb603da502@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 11 Feb 2026 16:21:21 +0100
X-Gm-Features: AZwV_Qh6uuJ5R6yExA5NxdnwgpEPG3g1Bp9Nwj2TBDZ8Mr0Gl4mQPg_5pQZVBWI
Message-ID: <CAPDyKFqkXBa=9qW0rd4=Cf2gjVAVDw3No5DbnSQ4OFuze00Yfg@mail.gmail.com>
Subject: Re: [PATCH v4] pmdomain: imx: gpcv2: Fix the imx8mm gpu hang due to
 wrong adb400 reset
To: Jacky Bai <ping.bai@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Lucas Stach <l.stach@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, stable@vger.kernel.org, 
	Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_072201_124106_D5BF955B 
X-CRM114-Status: GOOD (  23.72  )
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

On Fri, 6 Feb 2026 at 15:42, Jacky Bai <ping.bai@nxp.com> wrote:
>
> On i.MX8MM, the GPUMIX, GPU2D, and GPU3D blocks share a common reset
> domain. Due to this hardware limitation, powering off/on GPU2D or GPU3D
> also triggers a reset of the GPUMIX domain, including its ADB400 port.
> However, the ADB400 interface must always be placed into power=E2=80=91do=
wn mode
> before being reset.
>
> Currently the GPUMIX and GPU2D/3D power domains rely on runtime PM to
> handle dependency ordering. In some corner cases, the GPUMIX power off
> sequence is skipped, leaving the ADB400 port active when GPU2D/3D reset.
> This causes the GPUMIX ADB400 port to be reset while still active,
> leading to unpredictable bus behavior and GPU hangs.
>
> To avoid this, refine the power=E2=80=91domain control logic so that the =
GPUMIX
> ADB400 port is explicitly powered down and powered up as part of the GPU
> power domain on/off sequence. This ensures proper ordering and prevents
> incorrect ADB400 reset.
>
> Fixes: 055467378bf1 ("driver core: Enable fw_devlink=3Drpm by default")
> Cc: stable@vger.kernel.org
> Suggested-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

This doesn't apply cleanly on my next branch, can you please rebase
and re-submit a new version?

Kind regards
Uffe

> ---
> Changes in v4:
> - Add the Fixes tag
> - Link to v3: https://lore.kernel.org/r/20260123-imx8mm_gpu_power_domain-=
v3-1-3752618050c9@nxp.com
>
> Changes in v3:
> - Fix the Suggested-by tag typo
> - Link to v2: https://lore.kernel.org/r/20260120-imx8mm_gpu_power_domain-=
v2-1-be10fd018108@nxp.com
>
> Changes in v2:
> - add prefix to patch subject as suggested by Krzysztof
> - refine the patch to move the GPUMIX ADB400 into GPU power domain
> - Link to v1: https://lore.kernel.org/r/20260119-imx8mm_gpu_power_domain-=
v1-0-34d81c766916@nxp.com
> ---
>  drivers/pmdomain/imx/gpcv2.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
> index b7cea89140ee8923f32486eab953c0e1a36bf06d..a829f8da5be70d0392276bd13=
5fb7fc1bbf10496 100644
> --- a/drivers/pmdomain/imx/gpcv2.c
> +++ b/drivers/pmdomain/imx/gpcv2.c
> @@ -165,13 +165,11 @@
>  #define IMX8M_VPU_HSK_PWRDNREQN                        BIT(5)
>  #define IMX8M_DISP_HSK_PWRDNREQN               BIT(4)
>
> -#define IMX8MM_GPUMIX_HSK_PWRDNACKN            BIT(29)
> -#define IMX8MM_GPU_HSK_PWRDNACKN               (BIT(27) | BIT(28))
> +#define IMX8MM_GPU_HSK_PWRDNACKN               GENMASK(29, 27)
>  #define IMX8MM_VPUMIX_HSK_PWRDNACKN            BIT(26)
>  #define IMX8MM_DISPMIX_HSK_PWRDNACKN           BIT(25)
>  #define IMX8MM_HSIO_HSK_PWRDNACKN              (BIT(23) | BIT(24))
> -#define IMX8MM_GPUMIX_HSK_PWRDNREQN            BIT(11)
> -#define IMX8MM_GPU_HSK_PWRDNREQN               (BIT(9) | BIT(10))
> +#define IMX8MM_GPU_HSK_PWRDNREQN               GENMASK(11, 9)
>  #define IMX8MM_VPUMIX_HSK_PWRDNREQN            BIT(8)
>  #define IMX8MM_DISPMIX_HSK_PWRDNREQN           BIT(7)
>  #define IMX8MM_HSIO_HSK_PWRDNREQN              (BIT(5) | BIT(6))
> @@ -794,8 +792,6 @@ static const struct imx_pgc_domain imx8mm_pgc_domains=
[] =3D {
>                 .bits  =3D {
>                         .pxx =3D IMX8MM_GPUMIX_SW_Pxx_REQ,
>                         .map =3D IMX8MM_GPUMIX_A53_DOMAIN,
> -                       .hskreq =3D IMX8MM_GPUMIX_HSK_PWRDNREQN,
> -                       .hskack =3D IMX8MM_GPUMIX_HSK_PWRDNACKN,
>                 },
>                 .pgc   =3D BIT(IMX8MM_PGC_GPUMIX),
>                 .keep_clocks =3D true,
>
> ---
> base-commit: 0f853ca2a798ead9d24d39cad99b0966815c582a
> change-id: 20260113-imx8mm_gpu_power_domain-56c22ce012a1
>
> Best regards,
> --
> Jacky Bai <ping.bai@nxp.com>
>

