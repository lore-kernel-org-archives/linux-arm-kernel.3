Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE958C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 03:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5sXNENN0HCvQl/q8XCRMfovXIba4uIDzB7gZ/fD00M=; b=F0cKz1xTYY/sVz1jEYlkb2fnB4
	Zu4BDIGayDNPsaQWqpvBJwOxGBebHGknWJj2BUFBUvR2CDFxVVq1QfDJ+vZ9XoOz+R/fZcrYGtknO
	o++ER0P9YhM10LIaYmRC1JEujq6YImr+/Yp1G5F38Yd3BXPEfp+y33dDdz2sdAJ0Q7lRIsyf270gw
	9HXw/fxLR3Tp4sv0BF0AJspNOxOMa8TvcGMWc/ssDXnrjDBTiqFDKp9/XU6PAtGBM4W6b61YoOV93
	ZmOHdwoj+M7X/bfon+SGvM2rKA/r1tHytU4HcsBz+/ekFvSgRpDG8waaqAiSBy34VjniVEb4u52US
	rqZAD17A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkE3R-00000006au8-3VKo;
	Tue, 18 Feb 2025 03:13:49 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkE1x-00000006alO-01tx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 03:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=I5sXNENN0HCvQl/q8XCRMfovXIba4uIDzB7gZ/fD00M=;
	b=qWlCq4FOF1aeWHSc1agaVeuZ90eACl8USQx0ppHIlNKGbHQom/nahJfLuArRyx
	VgqWYYAFnE1WsZqydOzVM0XJQREqs7MBkCy4wPXuFrHeHwKJ/vqUMp/zxeP6ooJt
	daAtaVv42FBAtYBNdGA4uka5aUenVyJ2QkWya+rEOaKCI=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDHalpZ+rNnj3Q0CQ--.18186S3;
	Tue, 18 Feb 2025 11:11:23 +0800 (CST)
Date: Tue, 18 Feb 2025 11:11:20 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frieder Schrempf <frieder@fris.de>
Cc: linux-arm-kernel@lists.infradead.org, Marek Vasut <marex@denx.de>,
	Conor Dooley <conor@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Robin Gong <yibin.gong@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Bo Liu <liubo03@inspur.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Joy Zou <joy.zou@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 0/9] Use correct LDO5 control registers for PCA9450
Message-ID: <Z7P6WBMxes7X5glY@dragon>
References: <20241218152842.97483-1-frieder@fris.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218152842.97483-1-frieder@fris.de>
X-CM-TRANSID: Mc8vCgDHalpZ+rNnj3Q0CQ--.18186S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVf-BDUUUU
X-Originating-IP: [114.218.218.231]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgz3ZWez6b5ivgAAsD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_191217_387978_73240A33 
X-CRM114-Status: UNSURE (   7.08  )
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

On Wed, Dec 18, 2024 at 04:27:23PM +0100, Frieder Schrempf wrote:
> Frieder Schrempf (9):
>   arm64: dts: imx8mp-skov-reva: Use hardware signal for SD card VSELECT
...
>   arm64: dts: imx8mm-kontron: Add support for reading SD_VSEL signal
>   arm64: dts: imx93-kontron: Fix SD card IO voltage control
>   arm64: dts: imx8mp-kontron: Add support for reading SD_VSEL signal

Applied all 4 DTS patches, thanks!


