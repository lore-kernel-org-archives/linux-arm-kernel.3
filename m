Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED64E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 09:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNImoRLvw3XC0TF1vYDpCr86oKMWPfGwq3h9IC3F5t0=; b=AMMyHsWN6PmMc6GHxl4VCgFO1p
	gJ6pgYaC2S0F5Ps5IqkzLvacCph53EO/8bISCW4Qwl4mFF4kaX2zjWwZwZK+rmZcaqU7ebNDheNmn
	g+hCsGon2+nNCxBtXk3hw9fUsoZPKZ0Mir54UAxgOGJmGqVCDTjxTkC/JGSy0zrYNmB76ryoVfEpy
	KFasLImDByejz54yfopnUQ4MgdfXOI2yfYxh4sY9PhTMKFOje8rfh6t5bODW29cjVHia1qeyiuIPy
	D2QpKnF0N8Udom3TaB6kbvfiX8zFf/MPneWBJ/LALqzQ6MODfBU1mxwlzr77ZTaJaYWzM0FFJy2P7
	86QKFNsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1ux-00000003FVJ-1rJF;
	Fri, 13 Dec 2024 09:25:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1sJ-00000003EjF-2hul
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 09:22:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AEA68A4286A;
	Fri, 13 Dec 2024 09:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C933BC4CED0;
	Fri, 13 Dec 2024 09:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734081738;
	bh=b52vfwJl4uqGickd+6KGXREsb2dmjrVhmMOCLp8FrCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E7L2e/2mavqt654a1ofIbOwMfZcqfVlNka9m4KCBbzEZmt4MS2+HikUz5jnpv+n86
	 j6kkmMv9ACjoLdiwezM5VqwhizhGptVmsEV7bTJuxczO/I1xqSi210FkfYxQnmQrCF
	 +YDqbnwOQjExnC5wSDvIO3zc/5xOjpj/RyngbiLjB68zKIE4sUZ78aH4DpG9vavkAm
	 ritUX5VulVKYIUeBsWUCG+9zA+Vsdu/+M3+RvSS+HWoV6X4tlxqjT6SzbRKqmNangi
	 V2+j7oQ5YP/BpdwWh4HmFU0f4qSxnlyZt+aaRW7Zrg1lBFRTclSuH8Y7ERXBmlfFCF
	 BaeZ9JcpYdL6w==
Date: Fri, 13 Dec 2024 10:22:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Pengfei Li <pengfei.li_1@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: thermal: fsl,imx91-tmu: add bindings
 for NXP i.MX91 thermal module
Message-ID: <kb2mekvslpkj23a3ymdfwcpugvlscn736kjfwst24xqdgyqrfn@jozxo7o7enbi>
References: <20241212-imx91tmu-v3-0-85e756b29437@nxp.com>
 <20241212-imx91tmu-v3-1-85e756b29437@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212-imx91tmu-v3-1-85e756b29437@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_012219_743176_5880F55D 
X-CRM114-Status: UNSURE (   7.49  )
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

On Thu, Dec 12, 2024 at 03:59:59PM -0500, Frank Li wrote:
> From: Pengfei Li <pengfei.li_1@nxp.com>
> 
> Add bindings documentation for i.MX91 thermal modules.
> 
> Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


