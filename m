Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B9ECCA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SkK7nzvmdXccAthjxNIG0aZSr8ABcmG303myl+zYPu4=; b=OG071mMCxlkWcCGUr2iwgUNfPW
	mEb0mlukieQwntwZptIrZER4xPw/ia97vaDkLU0TlVjtEjQnqNOpdIAGAM6JiFdUShZdLkKgUIQtR
	8nwkakxj7hGD+NXLJjPsdmJ24OoZ7JYk+Z8yXuhvCHRmJ90+JIIvh3mE2xMrGU+0xXyTZLfm3R1/v
	v5muBIKjiw8Bv5qNqbzVUeS19/uuOfFHT2pbybDQMzYItqaS5zAALKZRC+av3MUoX9y9carvJXrmn
	8MFfnpwtQvEx19Jg+YEYJalEdbyDiqOBqL6UWIVAIRKT31CbkJap7+bvA8I4yMei9BbcS0UeiUEmE
	W8yK/zcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrmz-00000005mlh-179X;
	Wed, 30 Sep 2026 10:43:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrmy-00000005mlP-0lzu
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 10:43:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SkK7nzvmdXccAthjxNIG0aZSr8ABcmG303myl+zYPu4=; b=lM2Kl4WIVHBZ7A7xkbS6Jy2ARp
	NEIJcGjUV+HxSDvC5PXU+HqjTY9m1rzXuf8JCuk7bkyKW5hhFPlnMsy6Zc/gkqRN/cDP9Dw8p9sHs
	nfFrjmhoopFmyLQ3prAT623mIa4ipccs8ySm2s14bBlgBSumpeNqLcGByRLoW/4p++HWT5QeVjgb9
	aouDY7ypMPmuvFHH9io0hsJBmaFl95taIrLDx21g+huuc6wF5So3Yjs2tIoqMxsMUCZik4n3FiAvF
	bG9gWWOghEs96qBf71ooNvYM1lRTGc/JmWb/0htUYIZBAQqgTEe19iV+GsN/ylM6yUmY6kKa0fGWj
	Vm1CV3nA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBrmu-00000003fbz-2HmI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:43:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C2D294E410CA;
	Wed, 30 Sep 2026 10:43:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 79C9160749;
	Wed, 30 Sep 2026 10:43:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6EB92103282F2;
	Wed, 30 Sep 2026 12:43:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790765014; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SkK7nzvmdXccAthjxNIG0aZSr8ABcmG303myl+zYPu4=;
	b=uwMIm2ZgNp+9UTQoK8f6qN0jFJlsClA7TYMdrOhRR30NVVR+4ZdxQGjNgpKEgLZFZW8nIZ
	SrNoCIqlXzss7mn1ttQ/Qxs9iwIOqGwaiIyHS7f8XJRsoU/PdS3L7SfsaglWWl5EzdiZS2
	fKkGKYH+p5A7avdTSZ+Ksneuesud+ZDK58ji934XC/j2wQoha9yjpQq+D1sCwh7KV9K4cl
	yWQ8zQiO6j8FZv5fMBwbnYrCNdB2ASYJVZK0k16+VvCMtx4suIiKP5ypE9nkNENHEehtFt
	lpEE48vI9N0KOP0Tc4A9tCy5r4AU1j21Swd8J7sOxaEPlmJPQM9Rfk/zt+9VFg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
In-Reply-To: <20260917140042.118181-1-francesco@dolcini.it>
References: <20260917140042.118181-1-francesco@dolcini.it>
Subject: Re: (subset) [PATCH v5 0/4] drm: mxsfb: Support LCDIF interface
 bus width
Message-Id: <179076500400.452568.15346989916115503276.b4-ty@b4>
Date: Wed, 30 Sep 2026 12:43:24 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_114349_126428_426D958E 
X-CRM114-Status: GOOD (  11.85  )
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


On Thu, 17 Sep 2026 16:00:35 +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> The width of the physical LCDIF output bus can differ from the input bus
> format advertised by the downstream panel or bridge.
> 
> Such a distinction is required when the LCDIF bus width does not match the
> width of the downstream display interface. For example, an 18-bit or
> 16-bit LCDIF bus can drive a 24-bit display by wiring the available color
> bits to the appropriate display inputs. Configuring LCDIF solely from the
> display's 24-bit format in this case selects the wrong LCD_DATABUS_WIDTH
> mode, changing the color-bit assignment on the LCD_DATA pins and resulting
> in incorrect colors.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: lcdif: Add endpoint bus-width property
      commit: 54d28d79d91d85090814fadc39ee050920de84e1
[2/4] drm: mxsfb: Add optional DPI output bus-width configuration
      commit: aafd4205a75de54cb46458bbc70f35a0be1d7533

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



