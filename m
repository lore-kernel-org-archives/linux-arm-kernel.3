Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C5CC02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 09:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=db8wy+NAvFX7oWbNNZfkOxUsDhaAAm9ZkDqWuFl4MaM=; b=pRaqGq1Xi7p7OPnim27NDm59hq
	saLqcfe2ReLtIiqMsOgy//YeM1kWKAwqHHf56b89tnl7M+T4DQMsfHTc9U95sd94xunLJxsIXTOuH
	7CXGZslVZeu8nAmgLZLaDujRfOCN1i+hQXTF8DYQk71NRJKcdkmvh0i11Ln2k3svzEpwdpfzxT2OI
	H//w+QtTP7zBkf57pfs7hJvRADTVn5CLbJXJzYOCnOkKjTmabVmY0AOa9gleUFPUGLuDfynupCcDd
	+d7LdQ1b2HReAVIcmzvecSRkZ1tvIoANhPH8JRGVTKuA1PkKdWvKjS9uCkzayfUJijFVbMbz3Y0ex
	Z+B+MoGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ5VU-000000028Ka-18AW;
	Sat, 18 Jan 2025 09:52:44 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ5UD-000000028AQ-0rCB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 09:51:26 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5d0ac27b412so3873983a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 01:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737193883; x=1737798683; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=db8wy+NAvFX7oWbNNZfkOxUsDhaAAm9ZkDqWuFl4MaM=;
        b=SRRwew6o1QAVKSq/DCpL4H98wA2xuGXz70OWJbwWzh9ETlHM3QgD7r3epMWlbcs1yi
         J5cKDYDpNKnEVd97V6BkFjFPVhnhfBDVZqHWDOkZBYU7AZAKj1TD2Dw7cfW8mCxuhEro
         l36uHaWOK3TSQXDWfWJJuLE45UBjcGsLBtTuUMuCvDxMmPy5fJ4iTHv/sfS5sO3k3VEm
         oexZ8L2BKW4KIFQW43Hsd28MYctVK61Yg+bpTcdBfas2F9Vmda7H84bDtArLjr43i+uD
         dZNxCaIJoprfcI4Hn9FHKazHSr05GKF7PX3X4EvSfT91f2fqfVMJsKSjzhk30eCY/1Q+
         Agiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737193883; x=1737798683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=db8wy+NAvFX7oWbNNZfkOxUsDhaAAm9ZkDqWuFl4MaM=;
        b=fJPE9jyAoTovyJ1gUJQtXoeUudZx8I1Gs/2CiWfVd7rJDDtP/RPtXwznef4hhZqt47
         wTbSfYF5FbMzpCGwe5gtpX2oT+OQkGGwgLJ8WzcXwyE9FWyBT2zISeJux5n6wlWSyzxe
         K7TX/d7MQK8A5CqomlhZ0x2VxHuRqwtHvNeIfMW8acp42GBddJzjW6/Kndcd820VmyiD
         gk4zXNtVLTvKX7Qtf8zUT7DXPRkmTaIdaCJWFgKwANQ6k5i29NihvurHah1dbk6U0kHf
         9TJrm+4AP4vsUJ5PqLTgKZgZ7GmX/zkHmvYLDD6AX1ZVB1Kb9uRYhoDCos94K7t3LMOM
         Cdng==
X-Forwarded-Encrypted: i=1; AJvYcCXQAIF0ZL+LIiCd3IkAxyRWHb22urmIfOdpd8+EDaB74QQqSfCKFot4fYgsMSOB/3C2UckkAqgB6xJBzytMbOWz@lists.infradead.org
X-Gm-Message-State: AOJu0YwpkJM4Xdjg2/E+cbpzs+47ngs6Hu0z+R6tQKnPhPsjO5Gxf+Zr
	ASyjUwlSmHozV8YrazWMWp8Mbx52SgCbaMipPXkVyjZgKUphmAkd
X-Gm-Gg: ASbGnct8l2gOSGYp09E7zC5CUr0f89qDVuDuuOvnifS1qS9OQnIOG07DJN4RyLuXDrE
	AqeFxD6xqaSoB+vOVcxKIUJCX7c7jd4NSwm/bZZelb1nGMdj/i/KD8hYsP572ewb+PAHOL19T8i
	K+bTftXPylXLm30vIzYR+jCsNHd5eWfRaP80HPwOMIw1j7Or0ZIgDkvvWcWQ+4s4e+cV0r3jkQ9
	k/fH9dl2FP2S8ao4BU6yzmq23wcueNNCHl/Y3qI9/vY2jKUAQtW26eahS7KlScs5Ck8MxxsEdZj
	YzcR2Jca/ypJ8oRTwknNlB90QA==
X-Google-Smtp-Source: AGHT+IGSL4U5Xl+C2sAjU6wiHAWjkKHC+CgAd09MaHyOr2GDuAn9GsU+UuWVUF99+lnXmPsQs58C8g==
X-Received: by 2002:a17:907:930b:b0:aa6:a9fe:46e5 with SMTP id a640c23a62f3a-ab38b3dae38mr578880566b.53.1737193883243;
        Sat, 18 Jan 2025 01:51:23 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f86244sm307104766b.152.2025.01.18.01.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 01:51:22 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Michal Simek <michal.simek@amd.com>, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/2] dmaengine: Use str_enable_disable-like helpers
Date: Sat, 18 Jan 2025 10:51:21 +0100
Message-ID: <3794610.MHq7AAxBmi@jernej-laptop>
In-Reply-To: <20250114191021.854080-1-krzysztof.kozlowski@linaro.org>
References: <20250114191021.854080-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_015125_241007_8D9A9E7A 
X-CRM114-Status: GOOD (  12.36  )
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

Dne torek, 14. januar 2025 ob 20:10:20 Srednjeevropski standardni =C4=8Das =
je Krzysztof Kozlowski napisal(a):
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---
>=20
> Changes in v2:
> 1. Also drivers/dma/dw-edma/dw-edma-core.c and drivers/dma/sun6i-dma.c
> ---
>  drivers/dma/dw-edma/dw-edma-core.c | 6 ++++--
>  drivers/dma/imx-dma.c              | 3 ++-
>  drivers/dma/pxa_dma.c              | 4 ++--
>  drivers/dma/sun6i-dma.c            | 3 ++-

=46or sun6i-dma:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/dma/ti/edma.c              | 3 ++-
>  drivers/dma/xilinx/xilinx_dma.c    | 3 ++-
>  6 files changed, 14 insertions(+), 8 deletions(-)




