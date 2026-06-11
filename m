Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C021CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 15:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+j2YhohFB/HwnCxh8xFFgMkWvDaXNClb8/BZwsoLoFw=; b=pMiaTmVF/RCnu6eA9Uj4HE25pI
	Nagl//12xFHqWxAVsswTKTKX2VxNQRcKk82UbU9ke7KyIpZQJF59w2+3PovZs17bfHXCya6/xTa6m
	VqcyGRES6gil4DTpUL9DO5l3nGq2ulZezlGf4qEPYBAa6EJODyr1K2AvQRGCEpsQ8zrVuGYAEXuZg
	YegObxwfIqa9VJT2oTBZR4Ree39OgA6Pz0DwvEFdlq4ll0BiTtZPEnmIN5xiz2kYBJLCmoEdDiDBx
	DJoaGEZUbSzgos+ySzIlKytjEZY7EcNtxXkn5djcwbUJSzpasqbVDs1f6qs+QRCqHmpfAkV5ziKQs
	8OjMlV2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhRe-00000009gsL-2InO;
	Thu, 11 Jun 2026 15:35:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhRd-00000009grw-4A4j;
	Thu, 11 Jun 2026 15:35:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BBBC600AF;
	Thu, 11 Jun 2026 15:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD5131F00898;
	Thu, 11 Jun 2026 15:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781192148;
	bh=+j2YhohFB/HwnCxh8xFFgMkWvDaXNClb8/BZwsoLoFw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=A1D/tmBEy2STYW/pTS7lVBHE4ek0/WqtChV8XxlYJnveGcN86bflYpc073arEhag4
	 +43OyKgMcqyz+QTmYk8gJccn89PpvEBhvSu3ztyuQqeSDyY1R/0stDaWQTgKlQTw0X
	 mSs6PgWmrF/n6VwvqAdYhdoBe9D4/8w76ZmS7tm5z574Am2aK7x+ANNNDRfHu3yLmg
	 OgluB0zx5a9SaCZo3/Jh2MYcf+EyrMOIQ4kyBL9d4ewdXZINwn8DmiKRFQ2DZrGsEk
	 dOOyLfaFWlZVQnHo/V/gNACW2HhMinP8E8Cqj2RwhRIF/GtgNTgnjoazYJk21svf23
	 och8PzEttTf6A==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Felix Gu <ustc.gu@gmail.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260605-lvds-v2-1-3ce7539d1104@gmail.com>
References: <20260605-lvds-v2-1-3ce7539d1104@gmail.com>
Subject: Re: [PATCH v2] phy: freescale: phy-fsl-imx8qm-lvds-phy: Fix
 missing pm_runtime_disable() on probe error path
Message-Id: <178119214553.568088.1035620775294899553.b4-ty@kernel.org>
Date: Thu, 11 Jun 2026 21:05:45 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Fri, 05 Jun 2026 19:57:20 +0800, Felix Gu wrote:
> If mixel_lvds_phy_reset() fails in probe after pm_runtime_enable(),
> the function returns directly without calling pm_runtime_disable(),
> leaving runtime PM permanently enabled for the device.
> 
> Fix this by using devm_pm_runtime_enable() so that cleanup is
> automatic on any probe failure or driver unbind. This also allows
> removing the manual err label and the .remove callback.
> 
> [...]

Applied, thanks!

[1/1] phy: freescale: phy-fsl-imx8qm-lvds-phy: Fix missing pm_runtime_disable() on probe error path
      commit: 799e7cf2f0b50b34660b5ffce0f7d8dec376a0d5

Best regards,
-- 
~Vinod



