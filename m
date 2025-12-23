Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACE7E6F071
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 08:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wuJHDWjaGLzXiqjbQ5KAqwu4/yLolE49hadsWsYnko=; b=S4eQ/lHA+G4EvQuKJizy4TAJ5E
	+BqTpRnNebznYYswpItbnTL8hWmTKTBSanqb+Zh8Vxz9MMthmqKb4IoxLOUpffUGfrmdtNYTvKhOl
	nAGy/FDhDgNQ8xQOBc9Mxsgu+PhXCvmq4GpgmZdD71zc8A+WMALV/N9gn/PQEEyZPmCFwf6okONb9
	kYgwuK5qIE1nX9h0vCEUWvzgkq5oBNt/PCXxLnWWGfNDtfCGPodsNoMNyxx53FKIjJkIDey1gZ+pX
	zswc+hfOgeXUkiPktjdoAVwCOqfGlpvBGBx9zXONjbK/AgOcFfpXP9VTvGGKXs1jL08Whv14roWpw
	GMBZTWTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXxtn-0000000EgiG-0vuZ;
	Tue, 23 Dec 2025 08:37:43 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXxti-0000000Egh3-2XgF;
	Tue, 23 Dec 2025 08:37:41 +0000
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 75CBB1FA65;
	Tue, 23 Dec 2025 09:37:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1766479051;
	bh=8wuJHDWjaGLzXiqjbQ5KAqwu4/yLolE49hadsWsYnko=; h=From:To:Subject;
	b=LsYd986y7/LfVxODKxkxdM5aXB2gjX4iwNaf0oAmaFBcA197ohCba+C/DTd+oNO3d
	 RX5hKR5by9NkKfnrqcl+PO9rReCmhnjQjE4m0y33VaeGEnOnq7z9BRs5sSACVuirwr
	 YDT03Mt88p5bq+wC414JpVEPkhTfc4I79FhXWol013I/HDFqn4+9w2e/Edd+Iv6a7l
	 kVOhu6KtDki1QAow1qszh9uwE8ML5JWW0F81RQ0XwyV0HFc9bh9a6L6bHBJYCQkc6s
	 Felrmzyst9VlG97uAQTOzRuDAauh8hWzE/KInMbppa+9EYZPDiHQ4AlbHlQjVR44U2
	 c7TrSQpvl7Rig==
Date: Tue, 23 Dec 2025 09:37:26 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Vinod Koul <vkoul@kernel.org>, Franz Schnyder <fra.schnyder@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Franz Schnyder <franz.schnyder@toradex.com>,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, stable@vger.kernel.org,
	Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v2] phy: fsl-imx8mq-usb: fix typec orientation switch
 when built as module
Message-ID: <20251223083726.GA24283@francesco-nb>
References: <20251126140136.1202241-1-fra.schnyder@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126140136.1202241-1-fra.schnyder@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_003739_746080_A443208C 
X-CRM114-Status: GOOD (  10.38  )
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

Hello Vinod,

On Wed, Nov 26, 2025 at 03:01:33PM +0100, Franz Schnyder wrote:
> From: Franz Schnyder <franz.schnyder@toradex.com>
> 
> Currently, the PHY only registers the typec orientation switch when it
> is built in. If the typec driver is built as a module, the switch
> registration is skipped due to the preprocessor condition, causing
> orientation detection to fail.
> 
> With commit
> 45fe729be9a6 ("usb: typec: Stub out typec_switch APIs when CONFIG_TYPEC=n")
> the preprocessor condition is not needed anymore and the orientation
> switch is correctly registered for both built-in and module builds.
> 
> Fixes: b58f0f86fd61 ("phy: fsl-imx8mq-usb: add tca function driver for imx95")
> Cc: stable@vger.kernel.org
> Suggested-by: Xu Yang <xu.yang_2@nxp.com>
> Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>

Just a gentle ping on this.

Thanks,
Francesco


