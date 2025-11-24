Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D83CCFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 15:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPXbuoT8gLmsTcz1LKML8KzSKiAMgBQ+ViKr9I+j9RY=; b=XXtzR0eul/jy5/RIBZr+YcVYb7
	rFTtDiiDMTSuliYxz8h9Fse/2KcdbrN3BM21WJmVY+Ma96+UKjQN3jCtHj01+GF4sUBul9MyWPZUR
	h/+pNo8dtP7YzbD7CRZpZbZjDqCWfy7wRUtM1Z+8b176DBAtp40fUNXzVj8F9eJ8eb97v2qHDJwp+
	/DvrudNzNRTfaRrh5YU5XU4huiDn8GMdMNILEV+S/MVNZk9cc3qU6LUXCDE19Wrvx94bzE5icXUUn
	ZN9Z8Z3fa/880oA0gsvUpspNPIjM8LYUab4qqMXR/3a7Im9TeRYiz0NwK/Hwhy9vJb3lN2RbfOGWG
	sPmGOvIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYTW-0000000Bv7K-2YmA;
	Mon, 24 Nov 2025 15:27:34 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYTT-0000000Bv6l-2rEj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 15:27:33 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-640a0812658so7160031a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 07:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763998049; x=1764602849; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hPXbuoT8gLmsTcz1LKML8KzSKiAMgBQ+ViKr9I+j9RY=;
        b=VxOvoFa/U7GEnBQcNXiKRfP+iz6qEc3/fc4jbEAlxcq8cC8mGrMZcLcbInxX14vIqC
         fHKEqh//q6XTENtuBVwmz0Y7NUhMNvnjry6xA0bX+ECJExuC8+10t4X8I5q4ajulS4M1
         DGBNrUffLGYP1ix7jMmPnsXCwJspH/ITdfda8Ub5O7nyp71xq+u3H4kE3ZA+hdfd23fY
         /32+rIUu7mlwAjhj0Qt8uRJpHMlPkolQFpwhVCeEe+0zwdjqXXpl5oGKw5fY3Ia/jFAd
         DTXrsE/gnRBgcH6SjOjb7dshWjJTYcvUHj+xIXl7WjU2Vw3r5n1fgxaGVptK0q2fcLR2
         uyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763998049; x=1764602849;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPXbuoT8gLmsTcz1LKML8KzSKiAMgBQ+ViKr9I+j9RY=;
        b=nMIPRK2ZN+MKKsmX7b3AiozC2lRK/DQOJb7+eqS1rxBZLyo1q7RUA6Dpac+ndAyV3A
         c7fAXTKpL3gbgbUQWsgAccG+zyPUQTBAT5qL470n/5LMuWfIhdoUQUPJuo68S389LI0S
         c0wJs1EAB/jt9O1NheUJyEXcOecb/IIQiCnIPAM9rGHgj8gjIpJbMlFR0pwOqjlsX/tJ
         zCahFF/Ca4JRcx4zm8oIfOQ4Sj2gUUT5M99ih54czM+/qZ3Wkro/nZmy1QQmdLES7Zxy
         wpR+cyXs3UImqhcapEUG/Rk+UDkMZotvBeBQUMxokwEsUQenUt73Kih59kYs5Yp7UR2Y
         QJ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/hnfEyAtqa9jBM2dRpzFK/B63Z6iX1YNAANR2i68inM8wnCJYp9zymfLR4AMteZ2MFb1HG1UmLrlhnZs5jc0d@lists.infradead.org
X-Gm-Message-State: AOJu0YzU7wP1wqE3OO4pEQ3uF113ZFyWGG9PQJ1hTbw3PIedHtfIqlxA
	SoNq901+UOMVUisYr4jmmHVX3nSz21iiRDjas4HPaVgUssIiCmwNwe+8hehw3j17fHPfU1Jogi5
	gWWDHinGyljShldBzW9uVQCxopW+0S+R1aHhsI7tMzQ==
X-Gm-Gg: ASbGnctQ9IjQW7B6o7jWd1Env6ELSkW0iyk6Aepv2owyRoDqlLcVDHAuKOID3NYedWS
	UBoJ41o59WpGD/l7L9juY58PqEspsGAYAN7LjrFOZes5h+xTfPIfkoB3596fpcIqxD88mT85Ulv
	HlfN24d+b056X4csG+pEcbcN0qj/B5FXARXJK0yWhsw/7mZMtvXVGfzR2aRLs3M90reYL8X2O6Z
	HKs2xcfDWs44Lf+/1cB3Hq3t+xTVGTMbxeUgZFawJLo288ygias8SsEVcsu/H8wFv5JRhRoaQka
	O/IURjC2qmwL6NXLV4BufiTnOuwJ0DbAvh/c2M7t
X-Google-Smtp-Source: AGHT+IF8QEkzWvf4ABwZ5746O2obgVPWntwD+fd5/y1Lc5h5RDwaFcxXgvVKNe3CbF15J7X0KGPpVRchdEIoJn8QTA8=
X-Received: by 2002:a05:6402:2552:b0:63c:3c63:75ed with SMTP id
 4fb4d7f45d1cf-64554685163mr11501766a12.22.1763998049271; Mon, 24 Nov 2025
 07:27:29 -0800 (PST)
MIME-Version: 1.0
References: <20251122-imx95-rproc-2025-11-20-v3-0-9ae6ee619a78@nxp.com>
In-Reply-To: <20251122-imx95-rproc-2025-11-20-v3-0-9ae6ee619a78@nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 24 Nov 2025 08:27:18 -0700
X-Gm-Features: AWmQ_bmPua71P-c3C9amQu2EA6PcheE8Yz3sJ-xba42mtqxFzXSsE84-oyqxRX8
Message-ID: <CANLsYkynN2xSShAKXAcRsGTeS2YX1qhO=83xCScaaonJN=2hFA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] remoteproc: imx_rproc: Support i.MX95
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_072731_768468_028A627E 
X-CRM114-Status: GOOD (  27.02  )
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

Good morning,

Please note that due to other patchsets that need to be reviewed,
Linux Plumbers and the upcoming 2-week December holidays in the
western hemisphere, I do not foresee being able to look at this
patchset before January.

Thanks,
Mathieu

On Fri, 21 Nov 2025 at 17:58, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
> This patchset is pick up a previous patchset [1] with rebased on
> next-20251030, and some changes applied.
>  - Add runtime ops to separate cpu ops and lmm ops
>  - added more comments
>  - moved some check imx_sm_rproc_detect_mode() from imx_rproc_sm_prepare().
>
> No changes to the dt-binding patch, so R-b/A-b are kept.
> More info could be found in commit message of each patch and below.
>
> [1]https://lore.kernel.org/linux-remoteproc/20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com/
>
> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> one Cortex-M7 core. The System Control Management Interface(SCMI)
> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> Manager(SM) includes vendor extension protocols, Logical Machine
> Management(LMM) protocol and CPU protocol and etc.
>
> There are three cases for M7:
> (1) M7 in a separate Logical Machine(LM) that Linux couldn't control it.
> (2) M7 in a separate Logical Machine that Linux could control it using
>     LMM protocol
> (3) M7 runs in same Logical Machine as A55, so Linux could control it
>     using CPU protocol
>
> In patch 3, Use LMM and CPU protocol to manage M7. More info could be
> found in the patch commit log
>     Current setup relies on pre-Linux software(U-Boot) to do
> M7 TCM ECC initialization. In future, we could add the support in Linux
>
> Patchset was tested with below boot images when the patchset based on next-20251030:
> imx-boot-variant-rpmsg-imx95-19x19-lpddr5-evk-sd.bin-flash_lpboot_sm_a55 (Use LMM protocol)
> imx-boot-variant-alt-imx95-19x19-lpddr5-evk-sd.bin-flash_alt (Use CPU protocol)
> imx-boot-imx95-19x19-lpddr5-evk-sd.bin-flash_all (M7 not under A55 control)
>
> Also tested i.MX8MP/8ULP-EVK.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v3:
> - Add R-b for patch 2,3,5
> - Patch 4:
>   Rename imx_rproc_ops_sm to imx_rproc_ops_sm_lmm.
>   Add more comments in code
>   Simplify if check in imx_rproc_sm_lmm_prepare()
>   Update commit log
>   Use dev_err for failure path
> - Link to v2: https://lore.kernel.org/linux-remoteproc/20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com/T/#t
>
> Changes in v2:
> - Patch 2: Change to const pointer for ops, update commit log and add R-b from Frank
> - Patch 3: New patch, introduce prepare ops
> - Patch 4: Rename imx_rproc_sm_prepare to imx_rproc_sm_lmm_prepare
>            drop IMX_RPROC_FLAGS_SM_CPU_OP and IMX_RPROC_FLAGS_SM_LMM_OP
>            Add a bool for dcfg->lmid and info->lmid check.
>            Provide separate plat ops for lmm and cpu setup.
>            Move LM permission check to a separate function.
> - Patch 5: Drop macro IMX95_M7_CPUID and IMX95_M7_LMID
> - Link to v1: https://lore.kernel.org/r/20251028-imx95-rproc-2025-10-28-v1-0-ce9e7db9edcb@nxp.com
>
> ---
> Peng Fan (5):
>       dt-bindings: remoteproc: fsl,imx-rproc: Add support for i.MX95
>       remoteproc: imx_rproc: Add runtime ops copy to support dynamic behavior
>       remoteproc: imx_rproc: Introduce prepare ops for imx_rproc_dcfg
>       remoteproc: imx_rproc: Add support for System Manager API
>       remoteproc: imx_rproc: Add support for i.MX95
>
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         |   1 +
>  drivers/remoteproc/Kconfig                         |   2 +
>  drivers/remoteproc/imx_rproc.c                     | 245 +++++++++++++++++++--
>  drivers/remoteproc/imx_rproc.h                     |   4 +
>  4 files changed, 238 insertions(+), 14 deletions(-)
> ---
> base-commit: 88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
> change-id: 20251120-imx95-rproc-2025-11-20-3b9369670d6a
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>

