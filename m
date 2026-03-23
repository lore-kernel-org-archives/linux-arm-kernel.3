Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEFBF46127
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 14:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZBfJFwgoEUz2EcnixeOofm+Rp3x7VxxVqxoB2WloHc=; b=T7Biwi/grTP0OvbeK+IHwdZLwK
	iLW6+tSauulpSeNktj6+GXnz1TrbnOZnAc85YEdYQxORY/FadmAbGAxfMqYkk3eFG0XoVkyvsoUIM
	pbbrA1E1cLO6F2oNYLcgANn7elc2Xe1so1oKa2b4v8xQuigRPRAV64xj3lLM5BlMHYPDq/Ows+Uyw
	0tqeWhGzYnBFVCnSAGU2X/JOwG0CRiet+Z/3HHwD8f5zvNAmOxkr49iRO+lXhwfqboXZnj77sN5QP
	gHW7R9VNN9gRi0cxoDDhX+uEc8KsRUUfbziPAPwsiVIxKiuTAYvNqAmj3qh+Rd7Rjdro+BPaey+k2
	SvlDedcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4gL2-0000000GwBR-2tyf;
	Mon, 23 Mar 2026 14:33:04 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4gL0-0000000GwAu-1CBl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 14:33:03 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-35b905e9dc0so154691a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 07:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774276381; x=1774881181; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cZBfJFwgoEUz2EcnixeOofm+Rp3x7VxxVqxoB2WloHc=;
        b=pfwOSnzRcwYkWLk7yksN62VMRf4ry/ZYL/CY8nTpvF+GFHlWmVF+OFUT4DH06zI2vw
         IcRhM/hE+lJDQB4AvIzrZhbIoEj3kvE/muoJEm6DjCaDSJ7rMwqfg0tEh/InpekkjkVZ
         2Kdo1Hhfrv+knmAra9GujYdYK/TX/SxN5mrRN74TAoLVePhATwyI+OYXTFBtJRy0PTzu
         8pvXbWDaCEYh+W1u4eD/rdkwZLMqqaTavcxt9xff4kYxPxbM6Q8hHGcVYgJpKnx9hrv+
         q/8hlp3BTbhao3Jp7OftF9i284k0ySGrvWbHM64TVRffN44Y/vw1hcgRU2Nk1YI3Wsdj
         talQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774276381; x=1774881181;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cZBfJFwgoEUz2EcnixeOofm+Rp3x7VxxVqxoB2WloHc=;
        b=es8p9A19UtwArlGCiL267Dozis4QtaM41MwrD65a3quKlZIpcrIOjIhzV8BevFNkEB
         TD7IiSVooXhU4aZ0yieyKlXJIHEl8s8QDQk2Nlo0RB0G+Sm/8h841kAECHC5Y09sj0je
         nkKMeA2LzCJcAWsEi6Hy1IUy2GLb3ufuX5SkcWsvSIeLzq+c2tNDPxv5y7RvZxYs4oHn
         4mJkNyZbo8VlkddBo7YK+0YVuX1veUBVFtpYFuuYGUw/uaUuxlwaG/iXKZ323foOYUXW
         pU2xB4f4RKpuaVtmSodV9P6YDAgNm+w6jEUGVDdIrKKnVF3qun+T5Oi6l+XvcN3hz6dx
         J01A==
X-Forwarded-Encrypted: i=1; AJvYcCU1LrTFmDmNLHxdC4LhYla7bXmwzPorJ0PpzV94HPoPzUaZp7Y1QihR7zHUYta258RODsvJFJkr94/q9fARHVki@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/DlmBiTxJrRxgfSaicRdwXTGEBy4MLegaM2pOhNfAY/POS7Mv
	6lKrfYjh6lVnAtNXid88PeSyU9E9D5A7+WllWHS69/TJma5FUi7MRJ8UOOAzrt40z/w=
X-Gm-Gg: ATEYQzyy31dyGYRCoIqa0PoQcQpoeLvSqrgQj7t96bdpMcpHRR7nLa04nqMgXtQgMoY
	GoN+rlJ8sjcY2ooYr7/M83PF6ehr/p0sMQeEfliLegvIkNqWUafRtXgH00jAzoUWLIYFKKUZlae
	7XmbWskudcdInXXmFKGO8x0MAVdqHDCZJ+xWKLeOiRVfgC150DlHKMOMfnxB5P55e5YgUvrDp0k
	P+fGLeSldScYFtJB2tGcOYUEJ8PZnwY6IFZmNwRmSqJFSpnUMrugLiy9si7ru6bioTHBn8szu6L
	542Jdk6iHsZy5D3CiRN6T1zohnySlcSOZowCjrpTmTD9H3lMHEgEFq3gW2NNL4ien7pPTpwZiGD
	5pgU5x4s3zgxEwc54FRa6KTcRyQaozpKLcTjlyG3cbVlncNug4xfr9eflKfJ4tHpkVsgGL5d9ug
	it+pclRLt6ZnTVfaUuYF5g/rBNUFJb8n7NrmNA7A==
X-Received: by 2002:a17:90b:3943:b0:359:f22:8879 with SMTP id 98e67ed59e1d1-35bd2cec783mr10505770a91.22.1774276381189;
        Mon, 23 Mar 2026 07:33:01 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:36f1:e61e:d1a0:422b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd262cb35sm4765516a91.1.2026.03.23.07.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 07:33:00 -0700 (PDT)
Date: Mon, 23 Mar 2026 08:32:57 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/4] Add i.MX94 remoteproc support and reset vector
 handling improvements
Message-ID: <acFPGVNOornxsPG6@p14s>
References: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
 <b5e05fe6-97c4-40cd-b7cc-b417d8717aec@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5e05fe6-97c4-40cd-b7cc-b417d8717aec@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_073302_328967_B0A71655 
X-CRM114-Status: GOOD (  27.68  )
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

On Fri, Mar 20, 2026 at 11:19:06AM +0200, Daniel Baluta wrote:
> On 3/12/26 14:36, Peng Fan (OSS) wrote:
> > This series adds remoteproc support for the i.MX94 family, including the
> > CM70, CM71, and CM33S cores, and introduces a new device‑tree property to
> > correctly derive the hardware reset vector for Cortex‑M processors whose
> > ELF entry point does not directly correspond to the actual reset address.
> >
> > Background:
> > Cortex‑M processors fetch their initial SP and PC from a fixed reset vector
> > table. While ELF images embed the entry point (e_entry), this value is
> > not always aligned to the hardware reset address. On platforms such as
> > i.MX94 CM33S, masking is required to compute the correct reset vector
> > address before programming the SoC reset registers.
> 
> What happens if the reset vector is at 0 and the e_entry point is at 0x800...?
> 
> In this case masking will no longer work! Can we implement a generic approach?
>

I will wait to see an R-B from Daniel before looking at this set.

Thanks,
Mathieu
 
> 
> >
> > Similarly, on i.MX95, the existing implementation always programs a reset
> > vector of 0x0, which only works when executing entirely from TCM. When
> > firmware is loaded into DDR, the driver must pass the correct reset vector
> > to the SM CPU/LMM interfaces.
> >
> > This series addresses these issues and provides the necessary DT bindings
> > and driver support.
> >
> > Summary of patches:
> > [1]dt-bindings: remoteproc: imx-rproc: Introduce fsl,reset-vector-mask
> > Adds a new DT property allowing SoCs to specify a mask for deriving the
> > hardware reset vector from the ELF entry point.
> >
> > [2]dt-bindings: remoteproc: imx-rproc: Support i.MX9[4,52]
> > Adds compatible strings for i.MX94 CM70, CM71, and CM33S processors.
> >
> > [3]remoteproc: imx_rproc: Pass bootaddr to SM CPU/LMM reset vector
> > Ensures the correct reset vector is passed to SM APIs by introducing a
> > driver‑level helper (imx_rproc_get_boot_addr()) that applies the
> > reset‑vector mask.
> >
> > [4]remoteproc: imx_rproc: Add support for i.MX94 remoteproc
> > Adds address translation tables and configuration data for CM70, CM71,
> > and CM33S, enabling full remoteproc operation on i.MX94.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> > Peng Fan (4):
> >       dt-bindings: remoteproc: imx-rproc: Introduce fsl,reset-vector-mask
> >       dt-bindings: remoteproc: imx-rproc: Support i.MX94
> >       remoteproc: imx_rproc: Pass bootaddr to SM CPU/LMM reset vector
> >       remoteproc: imx_rproc: Add support for i.MX94
> >
> >  .../bindings/remoteproc/fsl,imx-rproc.yaml         |  9 +++
> >  drivers/remoteproc/imx_rproc.c                     | 85 +++++++++++++++++++++-
> >  2 files changed, 91 insertions(+), 3 deletions(-)
> > ---
> > base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
> > change-id: 20260311-imx943-rproc-2050e00b65f7
> >
> > Best regards,
> 
> 

