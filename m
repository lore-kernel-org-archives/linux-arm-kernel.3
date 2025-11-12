Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24BCCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 12:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZ36zlva0z3t/T1DpexmynfMc9ZzYYfvKx3PdyGSfS4=; b=AfHaTWHC/t9xfRVRptSeP0OFh2
	z4cqNJbgBxaxtbAIbsbWrln+iwbV5apvsBT6Eu3kYOt/ofBSuIXqlAkY32UYLwXqavJ+lzzfqSCDv
	/AyVR9e1MemTiYNtpfqc4525pNuntzoITSz4If942zHHyU2mGmb3CKZ4ScdCZZH5tZFfU5FBrIyfa
	D7hbGLO0TPMbfphjnztJBtiHGYwFu0+CHkeASOVLlWDioe/BlmXk5NN95m/aDGjeqdeAM/uS3RgQn
	YZe7+J0pw52uY73R4S9mUN4+oyy4BcUHW4y8gk9a0Pw2BvnTGa/7qoxeQmH6UcfGFdo8i/x34MxvF
	UCRREniQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAPx-00000008oI2-2PKM;
	Wed, 12 Nov 2025 12:57:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAPv-00000008oHi-1bhk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 12:57:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 06CA143592;
	Wed, 12 Nov 2025 12:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73B7C4CEF5;
	Wed, 12 Nov 2025 12:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762952262;
	bh=Y/Te0HzAS1xw4J1YENHr8HkxRQWKOBx9e2X1tTKC/14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tt7BT9fqYmX2s6rGY/Y5Pn+fl3hnelplJ/8G0XdVownkJMcqeUveEY+c+6sqke1CN
	 TIaaRP3aqhelwpqNdbgb5keCkIHsI7reg9X4Vfa67Q17ngwXdm54TKsaD+rMJ5IGSG
	 CgUWWJDMwPlWnsNuanNbkA13zr0DimaRrwd3hZcFirPMrznvZmKK4ActGNGP+6ZIVl
	 jtc0m9iRz+ebyDSEj2Snmz04lyNxP1yv0R8iiCM4YkObOP7FBFWy3iPwltL4OtBisp
	 WZ2VcEC7SlBQhTcV7rw4Uv8eYCdnMtBs7sSn75QwBdVMi0ExoeDEoiW1NpGvZ2rI9p
	 zBApvYzKSz4Mw==
Date: Wed, 12 Nov 2025 06:57:41 -0600
From: Rob Herring <robh@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-imx@nxp.com
Subject: Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
Message-ID: <20251112125741.GB1319094-robh@kernel.org>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-4-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104203315.85706-4-shenwei.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_045743_469643_A14FA85A 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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

On Tue, Nov 04, 2025 at 02:33:13PM -0600, Shenwei Wang wrote:
> Describes the gpio rpmsg transport protocol over the rpmsg bus between
> the cores.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  Documentation/staging/gpio-rpmsg.rst | 202 +++++++++++++++++++++++++++
>  Documentation/staging/index.rst      |   1 +

Why is this in staging when none of the drivers are?

Rob

