Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701E7C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DIIOezRQ1iEeyh6wP7pxRulzkeF5lSrui5rZPEB2VUc=; b=SQY3l50idrFxH2XtBWEc3u3OC8
	ku5MC8Dbgghq2WWdxkVfcYmuKjG4YJjTFsP1SggnMOLRovfzQxugyoBVBfTI/29nvQzVADsYgiqmH
	wPcRlvZ0LfmCBofoXzBDvXjCUd6Fyy4W2ELlQP65hAwwzkFLq76YxAQfZeJnXopOfSTNoiyd6wP7S
	VoaPg3xPz0UxvzNF1+1nVBrIivtRO8PQ0B2Ptdb332Zk3RY7UYbF5XH5uajjoPXfjTNEIxjmCm1TX
	ro5BUxGO8Y7fu90eJ7kOdAqdqN0tHDLgXFQG7ALgYlT+ZWcXo+CImz7TQAAhNs3LnWM1iHxe0hCea
	Vpm/Y+VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z6D-0000000Eeau-45ho;
	Thu, 24 Apr 2025 16:06:53 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xLW-0000000EKuQ-2Cvf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:14:36 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-30bf5d7d107so9276131fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504072; x=1746108872; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DIIOezRQ1iEeyh6wP7pxRulzkeF5lSrui5rZPEB2VUc=;
        b=uWi2i+kfyscfSmWB49HM3OL47/1BR4EOicqkOaqGl5BDXuYGYPmBFryOlVtThTOTn5
         xsG7rm8qi8RODQHgL9woM2a9MLQ+m0s40JX61zphfdOjOerZWri1cmOpfa1yUzv9rhTl
         EpXAAf88Uwcw5DzpqeZcU9LzRxUvj2gyHSqZgz55DB88Av70M4PwGtP8XmwlSGrWulPD
         jil9Xyv09RbiRKbydnOIGdikD0Ui+wBElhagKmgZhyyLUrd4r8a0qIxQUADorbsAwtFA
         vHIbqmlLLiVjNcmrBs6bCDre0Cv5cTqSYcgmBY+cNBsAZ2dTKE81uz8JdjtvMM7AAbKF
         OaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504072; x=1746108872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DIIOezRQ1iEeyh6wP7pxRulzkeF5lSrui5rZPEB2VUc=;
        b=hEk06vuuSf2zTN/YdluS5lrnNWQg5N+QMdS4nmUXI4qrsAfUc9LYNqkoI/gQsctVON
         AlfBfL2L6fH3W3ZUHA22rY7rWzn22DDtIZ/RnZ6nmo4ofYzeLJANoNaXYAkcCPE5I282
         SLke0k5k7HIdDKgQ6ZEubXaLgtQaX+gXEuA6VycpzrMWdHGaK+JQQPy8kmFyDXvHwZ+1
         2a/o6Y/DF4D3OMAWTACFv7WeObMs69aaNiciw5FLUhcvliwJdcLt3SKA5/cBOECTwBSO
         KXm6PY53rw+msGGwcLttkeNVZxcx2UNme4jJ8GOK5hGcWsJxRamzI/r86uVaWHvnE8H5
         cWLw==
X-Forwarded-Encrypted: i=1; AJvYcCU2J5xZV1cVDguN1HrdCGRnfRoYfqLuM0ifK7dhR52XL6svbDp7xTIxY4Lau78/T1A0THjd9T+CevsQL4wJ5tkL@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5qVeLXf7l1WWgyEN/OSSBqMXLZUJ3M6ov40fX8xdGcL6EEpdT
	taIQXsPG3n8BSfNsrs6E9EKZebj3VegN+4IpaDjg0fWINBVMjqEh62fIm9cTDX04+mLy766oUxL
	y95FxhvnRPVI1jqopUg6XfX6zwFwZA9IDh9CT+A==
X-Gm-Gg: ASbGnctI0HVDQJYYb0LKFlbKdOzhH6aH9Pn0sQrwb7qb84OaMWqdVQVeP5kFtUFs2Qj
	i2l0dRCIqkqiiVGoenTDVZiR3m8SUxI1+oz8cWliAEuyMDgfKj+Upa22wuwYIBauW1zkrfVfsbe
	rqScTWVcJjHL+BmeXJO2KerolIfhHprfmdFncpQFSpvvoch+kft+SoI4CS
X-Google-Smtp-Source: AGHT+IGTSgfmE4C9KUY01cBQCa6U+zujjBr3JQn5JFHu87otSRTtbM+9TibC6Ub/YfaplbG5HQdBpJHJtYPG69/HM40=
X-Received: by 2002:a05:651c:885:b0:30d:e104:cd56 with SMTP id
 38308e7fff4ca-3179ffc1202mr10727731fa.39.1745504072212; Thu, 24 Apr 2025
 07:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
In-Reply-To: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 24 Apr 2025 08:14:20 -0600
X-Gm-Features: ATxdqUEG7UgU0b-fYJDsj-X6YeibPATP71Sc8xsrfndaXkHmANCAN6IFo1WtuOI
Message-ID: <CANLsYkxKHhCHYrbAGzQ48QGpL_DbuLnX3=ppmpyu0vjuuvvODg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] of: Common "memory-region" parsing
To: "Rob Herring (Arm)" <robh@kernel.org>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	"Andrew F. Davis" <afd@ti.com>, "Shah, Tanmay" <tanmay.shah@amd.com>
Cc: Saravana Kannan <saravanak@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071434_563297_37D416C5 
X-CRM114-Status: GOOD (  17.88  )
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

Arnaud, Daniel, Iuliana, Andrew and Tanmay - please test this patchset
on the platforms you are working on.

Thanks,
Mathieu

On Wed, 23 Apr 2025 at 13:42, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> While there's a common function to parse "memory-region" properties for
> DMA pool regions, there's not anything for driver private regions. As a
> result, drivers have resorted to parsing "memory-region" properties
> themselves repeating the same pattern over and over. To fix this, this
> series adds 2 functions to handle those cases:
> of_reserved_mem_region_to_resource() and of_reserved_mem_region_count().
>
> I've converted the whole tree, but just including remoteproc here as
> it has the most cases. I intend to apply the first 3 patches for 6.16
> so the driver conversions can be applied for 6.17.
>
> A git tree with all the drivers converted is here[1].
>
> v2:
> - Fix of_dma_set_restricted_buffer() to maintain behavior on warning msg
> - Export devm_ioremap_resource_wc()
> - Rework handling of resource name to drop unit-address from name as it
>   was before.
> - Link to v1:
>   https://lore.kernel.org/all/20250317232426.952188-1-robh@kernel.org
>
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/memory-region
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Rob Herring (Arm) (4):
>       of: reserved_mem: Add functions to parse "memory-region"
>       of: Simplify of_dma_set_restricted_buffer() to use of_for_each_phandle()
>       devres: Export devm_ioremap_resource_wc()
>       remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
>
>  drivers/of/device.c                       | 31 +++++-------
>  drivers/of/of_reserved_mem.c              | 80 +++++++++++++++++++++++++++++++
>  drivers/remoteproc/imx_dsp_rproc.c        | 45 +++++++----------
>  drivers/remoteproc/imx_rproc.c            | 68 +++++++++++---------------
>  drivers/remoteproc/qcom_q6v5_adsp.c       | 24 ++++------
>  drivers/remoteproc/qcom_q6v5_mss.c        | 60 ++++++++---------------
>  drivers/remoteproc/qcom_q6v5_pas.c        | 69 ++++++++++----------------
>  drivers/remoteproc/qcom_q6v5_wcss.c       | 25 ++++------
>  drivers/remoteproc/qcom_wcnss.c           | 23 ++++-----
>  drivers/remoteproc/rcar_rproc.c           | 36 ++++++--------
>  drivers/remoteproc/st_remoteproc.c        | 41 ++++++++--------
>  drivers/remoteproc/stm32_rproc.c          | 44 ++++++++---------
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 +++++------
>  drivers/remoteproc/ti_k3_m4_remoteproc.c  | 28 +++++------
>  drivers/remoteproc/ti_k3_r5_remoteproc.c  | 28 +++++------
>  drivers/remoteproc/xlnx_r5_remoteproc.c   | 51 ++++++++------------
>  include/linux/of_reserved_mem.h           | 26 ++++++++++
>  lib/devres.c                              |  1 +
>  18 files changed, 339 insertions(+), 369 deletions(-)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250423-dt-memory-region-v2-a2b15caacc63
>
> Best regards,
> --
> Rob Herring (Arm) <robh@kernel.org>
>

