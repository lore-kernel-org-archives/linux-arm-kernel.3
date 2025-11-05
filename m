Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C202CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 08:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDe6kRSygVEphf3RSRGt9HkF/eyEhvziT45X27VBXsM=; b=ZUmICiCEDOEZ5SxFS/4bDOmwTT
	kZ8SBI40KzfH4Na0WICnWjIFgQfejew98QYVoZxIKBPXhTPMQzBEEhaG1054oaIFky2yMzjh9efXW
	CAyCant1fPEQ8C6t1Aj0GVlrrDWYwxbdJ6IIA4LdjTMs/3CStsjvlCVyprl9UGs7ZCpJ6H0aC8JJu
	/0dH5dBMRfgA0YLlyPt5aiLThNemiNWJRRVRMnPwN7LTwhtDsD1s6K29Kl5boJ+Jj4dC5EYYbK/0i
	b6SncCeRxf8FPJvLlSCzZ6EJLc8WQ1ND3ZP/HFAMS9lUvxhS2fKvHQMGjnV5AjiBmGCsCHkvqiH5G
	HVVe+t6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYVU-0000000DFi9-1Tde;
	Wed, 05 Nov 2025 08:04:40 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYVR-0000000DFhg-3TAk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 08:04:38 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-341b2e98486so192244a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 00:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762329877; x=1762934677; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDe6kRSygVEphf3RSRGt9HkF/eyEhvziT45X27VBXsM=;
        b=bB0AxSc3guVr/z11LRk41bxE7+4xsLs/FvdWF6ZjhsqTEHaycY1diYuG4lE/pLSAiR
         K5rx2SLRzMIwWF1dWUUYKUOQEv9p/wrmjrctp0kLbvb0GrfL2NwU2gcfIrVpzz5j6Ss9
         iseu4LZZWagJkgA/9sKRMEH2UC0z0iyflnruahnypa8bTnQG/itudy/MXnYNOajQW+Sz
         dRUuazVMXplph89+FY3CMtpNPy/ATs3qYX6ytXR2IxALJ1qfNT94KTOzMb1KqqnthDB8
         yHeHrrXBIa/U/595oIhqI+iBr7zf7blY7YGeTCCHfkr4IL8uB6MwJmie4Lq6xrFBX/tK
         GkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762329877; x=1762934677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDe6kRSygVEphf3RSRGt9HkF/eyEhvziT45X27VBXsM=;
        b=FO4MMxHoYFOftgNzSzsdjbIVu7R+AmVYtLHvAmrhZVuoagEDlozZRzFc3TtQT4gASZ
         x8hyGyKFte3BGwAUYC6BRq2dvaA9ifPr8pVFF5brp2JPG082pC+PYyrsAp/n4tBwFGy1
         eiCto4gf3EYNLeLSz7tx0anBOkYDq8wpMudJrvblKQd+R1Vai0ZzSsXbwwkfaOfMuwLT
         r1xtGj/VLoYl32Wx0xU9sqfq5KHNsb/Wh9aoEUpsbTFijKsL9Rb71zhwnBYfX2X7Jlql
         ngYYcdOPobYwekKXTAla5XIyHgASK3rj/LLol0HOpDyGKE/gF3tHoqg/XaLQNqcoDX6i
         XZ/A==
X-Forwarded-Encrypted: i=1; AJvYcCWilHuRFJE4mEECbHjEkM3GKg/iOj/NLaQtHbDqLcrpoATuHSXCrMxmjsCnlyZuxWsix5FCbSjQ4jDQdGpKDv0F@lists.infradead.org
X-Gm-Message-State: AOJu0YwlwuPbmVtzXvf6FDd9Wtuatpl5F+9BdP5cIbajkMsWIDsaWlCN
	8VqNflSn9TGGQYfy85xJuxlk4mT59kmpORTAvdK4s+kyiOokgIuAqUwRAFJ+HnbHi+vaWVf/6aX
	2T2cNvEKeWFM5gMrFRyO9UOjBHOx5TKiTfPDs
X-Gm-Gg: ASbGncuJaX/49+zHopd7rkT3tC3LoUbZd6L5mYhHYIQcfboNitHtCC3PxtVEslJy4/E
	nHIm8CLt1ep+/P4v2PQsNW3oq/20RB269B4OcVn+9SJYRXFKmakbikxH2uvaCDiKA6j+OQ9imHo
	6XLr4GmjFcfjwDzrqoE0RO1ROhMiTr9owYa9+91/4hS11uOOdRjL5+ZUNxXHcMawbVELw6b+0eC
	dCrfEpAOoQlPwN7if86yByMZhA1fnT3JcMhgh79IDZCeGrOEC4s5NUIFZEs/NP94cow0iI=
X-Google-Smtp-Source: AGHT+IE3kiYdO6A81tH3ocwujCNPCljvOzypJY9CyERGKSeoHzPi5nZ+xfnpKr+voNC9lIaFIPYuRWd+eHWQF6ZoNDQ=
X-Received: by 2002:a17:90b:582e:b0:32e:6fae:ba52 with SMTP id
 98e67ed59e1d1-341a6c1e406mr2591161a91.6.1762329876771; Wed, 05 Nov 2025
 00:04:36 -0800 (PST)
MIME-Version: 1.0
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
In-Reply-To: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 5 Nov 2025 16:04:23 +0800
X-Gm-Features: AWmQ_bka9Xr4B-LvpKHRbIbtt5BkAdNQKoTwEnWv8Ppu3FZE5Ou4N-m9M6c5JNE
Message-ID: <CAA+D8AMgXCcQuH3SWh2UU5ib0h3EqdJOdXTkwyFx4duv7qL2Ug@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251105_000437_865032_1BB0CBD8 
X-CRM114-Status: GOOD (  15.44  )
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

On Fri, Oct 31, 2025 at 5:14=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
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

Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Best regards
Shengjiu wang
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
>
>  drivers/remoteproc/imx_dsp_rproc.c | 344 ++++++++++++++++++++-----------=
------
>  drivers/remoteproc/imx_rproc.h     |  14 --
>  2 files changed, 184 insertions(+), 174 deletions(-)
> ---
> base-commit: 131f3d9446a6075192cdd91f197989d98302faa6
> change-id: 20251031-imx-dsp-2025-10-31-260b2b979258
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>
>

