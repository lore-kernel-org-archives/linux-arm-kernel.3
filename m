Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C88CC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LARMi1G5vACDqaigY0BsBdggnGiivAk4mChXML/OD+c=; b=jv+q24TpTUi9WPyeT/lhmTCAaO
	bUz+Ip947jtwYEqoQMTtUafhp6LCFs2vSjrBHDAaySrXE7sLfeM48249yefZPGHLwXO5upd43P3jp
	cxZi2WMKfYTKczSkJAUVhH0uV26VgZgb61Q05FNy1054BfAHb+WyLv2DZfrvzD/va4CJP2u2HQm+J
	eopop58Mn6vMOlg3qnwZsBidrTWKMwIKHY2qNPUJMkB4o+WZNv51jVA2rxgiwgbu/7t52oMVwT1S8
	sxgjqGeN5oBcLw4lmZ73xwsNAGbaIO9tae6APNJhcd6KnxtICkyhnEt4xxJhq/oQqgcMhbAMFNvWJ
	LIN1bqWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ijd-0000000Br35-3ebA;
	Wed, 09 Sep 2026 13:53:09 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ijb-0000000Br0p-0AZN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 13:53:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 67FE44E41592;
	Wed,  9 Sep 2026 13:53:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3776960448;
	Wed,  9 Sep 2026 13:53:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0854711C7AF7E;
	Wed,  9 Sep 2026 15:52:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788961977; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LARMi1G5vACDqaigY0BsBdggnGiivAk4mChXML/OD+c=;
	b=E/hdhf1UAf6+awCCGLMt4GqsieDb9sx1GlubU0wQbEP/cGP/9TCKn3ur/zCRNU+xIB6TL9
	O66Exidu2gRdvXmFyZnl4ek4P5RPtsEUrdBaz81RVPJZsRJUKNalpVLjAB+2pSgWuCEwE1
	EtwWTV3ZjMnCoq9EphEll2qS9zAxncWRYyRSGaMNT1Y05pDCKkssAUa1sc48avM4C/P5YP
	Irto4HpWyTkPk7Lm1t9g8SxfYgL+HGMkG+T2wAXEJpxwNimJBkQ4ZOgbZ5V+TFkagG/aRg
	U8klrqF77Otz1nRkZ9/9HQrNyNZ1sgTM41SlsoKU8OKm7oCezyWR4++gTwRqMg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
 Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260828065153.590802-1-damon.ding@rock-chips.com>
References: <20260828065153.590802-1-damon.ding@rock-chips.com>
Subject: Re: [PATCH v8 0/5] Add eDP lane mapping support
Message-Id: <178896196279.1382015.17901090259379845522.b4-ty@b4>
Date: Wed, 09 Sep 2026 15:52:42 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_065307_213609_44A2B684 
X-CRM114-Status: UNSURE (   8.31  )
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


On Fri, 28 Aug 2026 14:51:48 +0800, Damon Ding wrote:
> This series adds configurable eDP physical lane mapping support via
> device tree data-lanes property.
> 
> Lane mapping is mainly used for below scenarios:
> 1. Correct PCB lane swap and differential line routing crossover
>    without hardware changes;
> 2. Adapt mismatched lane pin definitions between SoC and eDP panel;
> 3. Support multiple panel hardware variants on the same board
>    by configuring data-lanes in device tree only.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: display: bridge: analogix-dp: Add data-lanes support for endpoint
      commit: af9b0fc07000db17656580fd38e5ff27c36c2ab9
[2/5] drm/dp: Add helper to validate DP lane counts
      commit: 6eac4c8bb10302abc0ea0bd1d506c46ec789ce2b
[3/5] drm/bridge: analogix_dp: Restore mandatory samsung DP DT properties
      commit: 02f569dd66c94dd67b2586f776235cf4177409ed
[4/5] drm/bridge: analogix_dp: Add validation for samsung,lane-count property
      commit: 4ff2f941b7828042feb2971c7039c8f790a105a4
[5/5] drm/bridge: analogix_dp: Add support for optional data-lanes mapping
      commit: bf63a72ea005d5e1cc12a9ad5e228c4b44246b0f

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



