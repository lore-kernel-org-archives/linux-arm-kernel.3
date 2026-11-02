Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F74606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 11:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aa/otAgT;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N8zSC/tE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uoI5OQkevqDHuqhBB6Hv5D9gBFmBn4hBJoPApEO2DYk=; b=aa/otAgTqq8Md2hr3ou0yGKrn/
	2EGtEnyFcQjhPrVP6VxcKe+mXdMKnZ2vlwSzMjOniKmt46Kld9tDGGD5vbZaNc0Gi1LRgGlpWqwlq
	FEOdYLvm9FNEUV+8R5v1dg06FzbNXtz9h5mhe/4C0cadxhHvOwQF5HtdQXbXRWLyT1iZAMbJBkxyd
	Gb7w26xkHlzu3QOA7JESIn8g3YJJqwoyXrDzrPqufJSOth/z+4G2jEoGP+tihZcPCvO9JrhRaV9sP
	oaeaxdXDdFxEbqaNDFERLpwoCGDS5pTmaKzXL8FiJafeC8rzaXFyKqZt3FxfYPPdV8aafl3jCR5Pz
	hGEKLrhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNprN-0000000GFeP-2Yuc;
	Mon, 02 Nov 2026 11:05:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNprL-0000000GFa3-3kFW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 11:05:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5831660F4C;
	Mon,  2 Nov 2026 11:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8E51F00A18;
	Mon,  2 Nov 2026 11:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793617551;
	bh=uoI5OQkevqDHuqhBB6Hv5D9gBFmBn4hBJoPApEO2DYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N8zSC/tEJ/LwvfSkEnktgwvfOS6uq1mYxPYqo3OfTFit0rNthFvz2lbST5fLJM623
	 /6dsFq1DoFmMnrcYbyUFyNxycmjYflmJChbZh0M2+mJPAdeeok/ppGVbm8BLR2v+Qk
	 opVeMmBhOkYW7+L0mUAAxilBemczZIwSHZZq822FfELbNR95/OF9N2On2WmclaL53Q
	 LLC0kKIYwpXKy5TldBKbTwEs4X6VH5GmgeJDh2JvhMUlllGodwSL5ZQiedOpuSr8dB
	 UGNgs+axYKwOwBAMk/0fgLQDZrBi159E3Va8CIRXhCYDaGLtARO8ZdkK2gBr8itqCV
	 7vO8NdxSJjvVA==
Date: Mon, 2 Nov 2026 12:05:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stefan Agner <stefan@agner.ch>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 01/11] dt-bindings: gpio: vf610: fix clock requirements
 per SoC
Message-ID: <20261102-curious-economic-grouse-ccfd6b@quoll>
References: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com>
 <20261029-gpio-vf610-fixes-v1-1-45b484b4c434@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261029-gpio-vf610-fixes-v1-1-45b484b4c434@nxp.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 09:42:25PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The i.MX7ULP GPIO controller needs both the GPIO and PORT clocks,
> while the i.MX8ULP and its derivatives (i.MX93/94/95/952) only have
> a single "gpio" clock. The vf610 controller has no gateable clocks,

VF610

> so keep clocks optional there.

You mention VF610, but I do not see corresponding change in the binding.

Best regards,
Krzysztof


