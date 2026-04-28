Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8ED2FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 15:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OfbUgiQnGWlnScYJSuysWPKlVFUYfQRRK1nJfSaqXew=; b=nrYtbbeWq8E8bu7NifG/xlCuDq
	qbDLqA/dn/0cwQN1UZHSK4WrzE1SL0GMHT8h4CNX0EHQ6GWWfBIFse1A5yBL0ReQg8nyxgAQ3kIyr
	vBTPf+/dI9CKPkL+iTgILWeChTS4xyivRmrBlgvGVju2kzun3G3VUtDFVjRM6DQINnjK+6gTGH4Cj
	DOPj7+3G6txebCVd9O8bXBaMkPztyNWFfXezkSH1ARyqnlugKoPxCz3UUxmsPaAttdnQqzRJYtOb4
	UenZhkBlNUpmxTNttGD7RG8aCx5bZr0Zi4UkkPzp50Vt8eCSfbt3p0NTv7erVdbXgekUgxX4eWHt0
	MItg50PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHk0k-00000001hqN-2QWP;
	Tue, 28 Apr 2026 15:06:06 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHk0h-00000001hq1-10N8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 15:06:05 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-35d965648a2so10349894a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 08:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777388762; x=1777993562; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OfbUgiQnGWlnScYJSuysWPKlVFUYfQRRK1nJfSaqXew=;
        b=GEybo8MW63zL4jdmGHEnge7UCwgtaFYtIZxGOkwR6HiR6hFkUoSyZEQriikqtJeh4G
         MQSzjFzGQGoWwhmGbR3yevwgONmTV+PWL8xW989BeulDaWbemicnQl75AOoX0ZIc9387
         xlzXK6AOEYy9adMRhhHdBTQYi8e6F0HHpvB2qWo4y4Td8IhgVZKw/95IGvfoAiJYZTnm
         s/40OGe5sqwbGuDJvC0X+IGQwFVZYJQTWn9s1EOELAQXERUbilkLcu27g6HpRFxu6Pqi
         VJIk97XHgx4AcSPGtUPMY0WWkxYZKHlYN/gBbpLwCfYBz1gxRj1IJObmCX2nhnlhKV0Z
         Q7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777388762; x=1777993562;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OfbUgiQnGWlnScYJSuysWPKlVFUYfQRRK1nJfSaqXew=;
        b=cZZIYjcd6V0wpmVRUGAe/8W/mtJDrk4N90uQ+aSY2RR7W/0naP5CAtDAnt11W+1ODb
         v5ChPmvw3MSUuHhfBA93F7bzJ60Ou3Pl3I0QQUK4xEcvR9+Lx/s4WzBCmR7WbZkOo/kI
         j81pVFTDqiOKynv3Dhdr99WY+eZgXiAjKr/ho2EaJgX/K4lGNvusmzcxdGNnpMu0kXti
         Pa5E4g/wHS/qFV63C8r/GtXaGy8EQJ+MS62fjpAK9Yb0OkG6y9loSbj9l0Gorlkp9LRX
         gOLX+do2ihelZvbaN2d4q1D9BYLef2CTZsGoHDRkYNBHGxh35ZTNySGSIDlEjEOcAlpO
         MtaA==
X-Forwarded-Encrypted: i=1; AFNElJ/Ch7ymVAvEZ2gA9Bk4z3U2L6AcXZC2zr9kZjaPGBGseRzZ4jvFc7QAPYonf/avB+pr8mkNIzaUcqPopfttNs19@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0vk0qFZPiV43/4mQHreZHPcvd+BEnDGZpUeKvwqfXL0bZsJ5D
	356py4JxwwTYfwmGxnAtny4R5XXC9P71VSRazl+ArkX8EqeJZ+t6WHGGXb+Lk7LHJRM=
X-Gm-Gg: AeBDievNeomppmpSbxFABbSsrYzjQdgicHZeOsezMkPEUsbxWxFQoRcdtbd6mifhBGE
	LRup6GmZtx70JMo14PNyPvO+bZvB4KZ8Sm0VXT1i1C45hgeW+eghM0iXec0ZlwPVg3Snht0BzXg
	fXBWLSaFztR07+u1PlYTj40WIq6eCjDdehEmoSKJvVPeax/JSuo05kCocmKxDpVSVxqrZSyhh88
	473+/N3KLNSubj4PXrL/CQsgzy8f8OWziYZs79jsvLf0PAhzhTvWuiMzbRM2H9mu+7ZGBkrktB0
	qIKNaEjH54cL4fYNX+APtPa9QU4MLpC90VW8HpoClczT+FOlePtDS6zgxSPxDAp6WTntMfuRl5t
	gFw1t38A4hvlJQ62YyeNAFjA2KEnvUQZUbJAsUAubcy9C3stnD2kEHN06MOlg4BmalaJQeyb9GH
	OXMyGHrddkgkm1jAoF2EFpj9vwn7oUz9ulJDJFRw==
X-Received: by 2002:a17:90b:5291:b0:35d:a90d:580e with SMTP id 98e67ed59e1d1-36492046369mr3453884a91.23.1777388761787;
        Tue, 28 Apr 2026 08:06:01 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:a4ee:17e1:59a1:f1e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aa7b9d2sm29165775ad.11.2026.04.28.08.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 08:06:01 -0700 (PDT)
Date: Tue, 28 Apr 2026 09:05:57 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 0/3] Add i.MX94 remoteproc support and reset vector
 handling improvements
Message-ID: <afDM1Vhw77l3zpCr@p14s>
References: <20260427-imx943-rproc-v4-0-68d7c7253acd@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260427-imx943-rproc-v4-0-68d7c7253acd@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_080603_300734_0A2DAB81 
X-CRM114-Status: GOOD (  27.57  )
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

On Mon, Apr 27, 2026 at 10:41:23AM +0800, Peng Fan (OSS) wrote:
> This series adds remoteproc support for the i.MX94 family, including the
> CM70, CM71, and CM33S cores, and derive the hardware reset vector for
> Cortex‑M processors whose ELF entry point does not directly correspond to
> the actual reset address.
> 
> Background:
> Cortex‑M processors fetch their initial SP and PC from a fixed reset vector
> table. While ELF images embed the entry point (e_entry), this value is
> not always aligned to the hardware reset address. On platforms such as
> i.MX94 CM33S, masking is required to compute the correct reset vector
> address before programming the SoC reset registers.
> 
> Similarly, on i.MX95, the existing implementation always programs a reset
> vector of 0x0, which only works when executing entirely from TCM. When
> firmware is loaded into DDR, the driver must pass the correct reset vector
> to the SM CPU/LMM interfaces.
> 
> Summary of patches:
> [1]dt-bindings: remoteproc: imx-rproc: Introduce fsl,reset-vector-mask
> Adds a new DT property allowing SoCs to specify a mask for deriving the
> hardware reset vector from the ELF entry point.
> 
> [2]remoteproc: imx_rproc: Program non-zero SM CPU/LMM reset vector
> Ensures the correct reset vector is passed to SM APIs by introducing a
> helper (imx_rproc_sm_get_reset_vector()) that applies the reset‑vector
> mask.
> 
> [3]remoteproc: imx_rproc: Add support for i.MX94 remoteproc
> Adds address translation tables and configuration data for CM70, CM71,
> and CM33S, enabling full remoteproc operation on i.MX94.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v4:
> - Daniel raised the M33S secure region was not included, but since I not
>   have image to test secure region, so drop the Secure alias region for
>   all. Updated DDR region. R-b kept since this is a minor change.
> - Add R-b for patch 2
> - Link to v3: https://lore.kernel.org/r/20260415-imx943-rproc-v3-0-9fa7528db8ca@nxp.com
>

I have applied this set.
 
> Changes in v3:
> - Patch 2: 
>   Drop R-b because of changes in V3
> 
>   Following suggestion from Mathieu that apply reset vector in
>   scmi_imx_[cpu,lmm]_reset_vector_set(), not change the meaning of
>   rproc->bootaddr, add helper imx_rproc_sm_get_reset_vector() to get reset
>   vector and use the hlper in scmi_imx_[cpu,lmm]_reset_vector_set().
> 
>   Add reset-vector-mask for i.MX95 CM7 to avoid breaking i.MX95 CM7
>   boot.
> 
> - Link to v2: https://lore.kernel.org/r/20260327-imx943-rproc-v2-0-a547a3588730@nxp.com
> 
> Changes in v2:
> - Drop fsl,reset-vector-mask by using fixed value in driver for per device
> - Add R-b for i.MX94 dt-binding
> - Update commit log to include dev addr and sys addr
> - Link to v1: https://lore.kernel.org/r/20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com
> 
> ---
> Peng Fan (3):
>       dt-bindings: remoteproc: imx-rproc: Support i.MX94
>       remoteproc: imx_rproc: Program non-zero SM CPU/LMM reset vector
>       remoteproc: imx_rproc: Add support for i.MX94
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         |  3 +
>  drivers/remoteproc/imx_rproc.c                     | 92 +++++++++++++++++++++-
>  drivers/remoteproc/imx_rproc.h                     |  2 +
>  3 files changed, 95 insertions(+), 2 deletions(-)
> ---
> base-commit: 724699d8d0523909da51fda8d1e10c1ff867b280
> change-id: 20260311-imx943-rproc-2050e00b65f7
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 

