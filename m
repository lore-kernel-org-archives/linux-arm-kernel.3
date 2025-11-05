Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3285BCCFA07
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 09:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=txxoHQsD9SBr+0uAjaOafgKfJPgFXKi5Q4JCWLCgjxk=; b=igmINbSRrEyDc67wkYykVS9B6R
	9JKt74EO3+P/pcu4OR1W+aVmz/jd+TVbPu9p4opcgLlH/ymhcwkg57dCfYIM/VW8zGz8bTh6yF/Ea
	NynLGPOx4a1zfdBL7r44xsx+V7a6m0vNqtYsBU4UkOgEvGiJXY2zxDAwteiQfJ6UPaNTEaXw8VAaC
	Vofm0Z4ay/aeorqALqCdpShNics26VgHOEWZCL9FUdCASyBCobY0oO+hYj12njyNvd53QeVLd26G9
	b5n2W3OypwBUJ29EJCmtFFJwFqprzJF/2JXMAZVOH/cuGFWtVFnZWfpI/VEMl74HOQPDTTtZgdnU2
	/FZkM3/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZpV-0000000DNhJ-1oFq;
	Wed, 05 Nov 2025 09:29:25 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZpT-0000000DNgy-20ON
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 09:29:24 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b6329b6e3b0so468101a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 01:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762334962; x=1762939762; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txxoHQsD9SBr+0uAjaOafgKfJPgFXKi5Q4JCWLCgjxk=;
        b=DEI6fzg72w5RQMMQM46p7neVt9J7SjrpuBnO92jV0uBZpXiqSghj/L2od0lohG+p8L
         oAiEQbG65qkarOhl+uYBgKoMcN35QfC5e5HTfrhBnPxvQIM5LmG0mn0ijfpxdxt6MrWd
         OmOO1pUrz+JBFCU5TYa0qqpcNCRA9mXdBom9yawh0bynRilJqzIoRdHSIcbpq/1sYvPZ
         fMhYy75l2gUoFqOOgs6t9VukrWKK6+ymYfu8c2WMbLO4qgsKHTHJWe7bdDfo9Z4Le6rs
         EO+rNLzaRRLAttBBX1xP2Wi4Ds09glLAaQWUjZY5Fk6h6QnY0VJOf5Y/eOTgNNBXAQes
         RW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762334962; x=1762939762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txxoHQsD9SBr+0uAjaOafgKfJPgFXKi5Q4JCWLCgjxk=;
        b=D2hOzMPuut/zUz5ZahrD9vxBA/jzpMBfiP3K6SRwddOQTVSzwHMBDn3YK9AwoaRA65
         Qj3LfaQubcHou0PHoRwfxIbvjiD3r/tIzOHijYIMCb+rHqZSfGMD1lfsXnFii/hgW9j/
         qM1K/Gm4tFJTw1nI6Bao5ymYRqFKBKXxeDFy101fd5qrGc9nyaBitOpfkndJkB6ucEpV
         uLDCK1oztfjsVDb/P94jrKvNBFBqaX6rx7yn212sr6NuJci+FtgpsfTEk/EUEBMUOobb
         ZQtwxVrSPPwbA200dXrVJ0WSxZ8pBzUCy3n0zaJEw9Xcap68J9t9grtMsYbXoth/HIMu
         IoOw==
X-Forwarded-Encrypted: i=1; AJvYcCXYN+Ci+qe8svQt1uYKVuYj7MCQdDhzqt1Zppdgvvz+wn2qhE8P+0xJZSbdXy0h5jfs1J0kfN49C/Fq0yfu8cwG@lists.infradead.org
X-Gm-Message-State: AOJu0Yx71Ni809897OJD4roXc2UDEMX/kTkLqjBnE71tK11KZPhXO0K+
	dH7/t8SGwntUo7QozL4oh6kVg93wPvVTUfjEwBnZKxYVbtESTp9AOg8r3M7Tuc+H5mNgQ/sKL0H
	y/mmd6YbEIyz9duLayBuzTaMzSBo7rCarEprV
X-Gm-Gg: ASbGncsNBYRa3mlWLolx7MQ3+wlVhyfYclWjZzE23CjWEx0hn/qrenAqI6zxTwr/HxJ
	+fpBsYcf4HFBIIi4lvP1T0wxH2eynk+8hmnI7i9rBMW8cwbXvxEwrCv+AhBhHU6lvpRJ/iPdmt9
	mrvH5Dbk/WyrjeRynJKaDRrvZKQTDxxSp6jWlTJmwg1Q+dDSfLpActS4DxoC/kPAas478IFmOch
	jwrTElA1E1CB2ZVWKCqMM4ZUXiE8exM39wGpHrwbU2vGsk9puox1qXm7A==
X-Google-Smtp-Source: AGHT+IGkCxRvJh3fC5yidm37chqdIHgljJdYABqu7mHMgdmlemqRQI0lkZmwfrypszqAHRlZ8j+gATWb4FCpIOGaggI=
X-Received: by 2002:a05:6a21:999f:b0:334:7e78:7030 with SMTP id
 adf61e73a8af0-34e278f99b1mr8298964637.8.1762334962544; Wed, 05 Nov 2025
 01:29:22 -0800 (PST)
MIME-Version: 1.0
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
In-Reply-To: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 5 Nov 2025 11:31:49 +0200
X-Gm-Features: AWmQ_bkrt0ospuWqleJ6w_sx1LCaBE7SCRpsPmV7R0cWe73tR0hYLHwUvfH1Zeg
Message-ID: <CAEnQRZAOTFw=sBppHTYQAdfDBuNqkqk6gVO4FyP0EBsva3Oi+Q@mail.gmail.com>
Subject: Re: [PATCH 00/11] remoteproc: imx_dsp_rproc: Refactor to use new ops
 and remove switch-case logic
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Frank Li <frank.li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_012923_520731_233FE2C9 
X-CRM114-Status: GOOD (  13.32  )
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

On Fri, Oct 31, 2025 at 11:20=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> This patchset aligns imx_dsp_rproc with the cleanup and modernization
> previously applied to imx_rproc.c. The goal is to simplify the driver by
> transitioning to the new ops-based method, eliminating the legacy
> switch-case logic for a cleaner and more maintainable design.
>
> Patches 1=E2=80=935: General cleanup, including code simplification and a=
doption
>              of the devres API.
> Patches 6=E2=80=9310: Transition to the new ops-based approach, removing =
the
>               switch-case structure.
> Patch 11: Remove the obsolete enum imx_rproc_method.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Peng Fan (11):
>       remoteproc: imx_dsp_rproc: simplify power domain attach and error h=
andling
>       remoteproc: imx_dsp_rproc: Use devm_rproc_add() helper
>       remoteproc: imx_dsp_rproc: Use devm_pm_runtime_enable() helper
>       remoteproc: imx_dsp_rproc: Use dev_err_probe() for firmware and mod=
e errors
>       remoteproc: imx_dsp_rproc: Drop extra space
>       remoteproc: imx_dsp_rproc: Use start/stop/detect_mode ops from imx_=
rproc_dcfg
>       remoteproc: imx_dsp_rproc: Move imx_dsp_rproc_dcfg closer to imx_ds=
p_rproc_of_match
>       remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_MMIO switch case
>       remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_SCU_API switch case
>       remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_RESET_CONTROLLER swit=
ch case
>       remoteproc: imx_rproc: Remove enum imx_rproc_method

Thanks Peng patchseries looks good to me.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

