Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A8CD2F001
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 11:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBLN7ENPe3Q9NBmrjF+3h0cFLO9t/L5okE+X/cur5CI=; b=b77v8dsEl+4tpOx6goUTXx7u0h
	iat+tY6MTE5Bte+c6+IfN3+zZ5zaqm05xJEhBxyaB+vTmLjIsCjwRAzBBSvY7f4gkVU3Y9gqPJnWK
	605/+LX4AQdex2ZZEZ05peYc5JkBtwJiNnXAs/7U8724jAUK5zLpCuOyNG2s1hTSKsGs7ilgm/To9
	9v1UQ5SWq3afhoU1gtLl7/nnetTx3WUgywL8sDn0ndfM+Gyw6j5wyX/FnU1+1K6vq26XFYULdIdmX
	6yGNj7MMhEtFETXxXFsfPQoSLgb3cGs7thb6jMskxK6I7HfTADYTMsvfSJ3phvkewAktU3sVrox7V
	uwcSe1Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhMq-0000000EAMe-1XMo;
	Tue, 27 Jan 2026 11:36:20 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhMl-0000000EALg-2jNO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 11:36:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 79A10C211D0;
	Tue, 27 Jan 2026 11:35:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4AE3E606F5;
	Tue, 27 Jan 2026 11:35:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C7B54119A8686;
	Tue, 27 Jan 2026 12:35:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769513754; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bBLN7ENPe3Q9NBmrjF+3h0cFLO9t/L5okE+X/cur5CI=;
	b=1YGgGIVycHcNeIQP0SC0IRTGBJ+nm3jJhZ3zuBT2cFmsQxZvyd3yxFSsgJXBxgDS6pbqdj
	/j4JLGOCRCFwvfGP0LYt5CdAZ9JCUEVQMr4XVfbEZ3g9iyTNalkXsQPUZDbV7fYaRN1BTo
	cy4k5FG0hcRLzE6cR7RRq5Ih1JZX1/avtOXN5JHIjEEdRdG4zolP2S8Crx5muhuwZ68zbJ
	LmjQrsbdAtPAJ3CO0229JDVuKEfUWYXsHSXKlGMKA6JIxHEoWoykM/dO6WLxnhb/lq57Ns
	2HwT9QSG43Kj/jVUvu5ezQM3XUaSL/FGApUQ9div0BX1BHyuN63gNiqlqFTFKw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
Subject: Re: (subset) [PATCH 0/3] drm/bridge: imx: A few fixes
Message-Id: <176951374753.94588.10653964166300906894.b4-ty@bootlin.com>
Date: Tue, 27 Jan 2026 12:35:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_033616_399097_3912AB7C 
X-CRM114-Status: UNSURE (   7.59  )
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


On Fri, 23 Jan 2026 17:22:14 +0800, Liu Ying wrote:
> This patch series contains 3 bug fixes for i.MX8QXP DRM bridges.
> Each patch fixes a NULL pointer dereference issue and stands alone.
> 
> 

Applied, thanks!

[1/3] drm/bridge: imx8qxp-ldb: Fix NULL pointer dereference in imx8qxp_ldb_bridge_destroy()
      commit: 852c68bf42965ee38b465d2d6f7b965eb0b5dc1d
[2/3] drm/bridge: imx8qxp-pxl2dpi: Fix NULL pointer dereference in imx8qxp_pxl2dpi_bridge_destroy()
      commit: db7e7ea838c916ee4cdf26bee126fd36f58295dc

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


