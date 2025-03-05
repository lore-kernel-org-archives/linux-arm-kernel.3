Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB61BC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 13:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QO9qKoULzoYWBABgf51NjYdGSNxXU0EMfpVjVSk9Mzc=; b=c2XHM9+sjP9tomQ/vHLgYbwFr6
	ud7y1dO0vlNeonOnnuvdFgwrlPaBKpFUBqEaUTi9+O/QQFuWQtgxATtJfF+uGHvK0DrcyMbSpISSz
	B8hGG6+0Fn83JYVVaQy+72CIqPtsaBSNa7cBwPo537H4fQjNvXSIbSddglFqy2Qc5qDqjnPwX/yZE
	jVwbD7P2aDLE8wAQIghK4GGKPDvoJqJ1Qj5NM/hLxCRk1pzBbq4jgGB53yivw60wHlSc2+0n4XK5q
	PanDYlxtWTU6T18z1Xw6NOfiXVRrSDP4bmkZ/tuQlOj/wRNsy/5rSLQvVybEJgsuGWmksS7OwYS8s
	1aM8djgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tppAX-00000008FZI-1Cbk;
	Wed, 05 Mar 2025 13:52:17 +0000
Received: from out-186.mta1.migadu.com ([95.215.58.186])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpp2W-00000008EAX-0dys
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 13:44:01 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1741182235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QO9qKoULzoYWBABgf51NjYdGSNxXU0EMfpVjVSk9Mzc=;
	b=mQFr02Xf/PCIkBtVH8ROPNcA1j26gf1sXqPL3epIxfHi3UC8BpWHrc0qm5fGbxC8Lt0gG8
	GI4jfqo5mTnEFtPDiKPxgu8apCWZdIjwKidneo36lLjI6HV6/BTGBTK7fzMjA3E7yISf6T
	NPpeqG3Fruhu2vc2vx1977bIZA863Mptjma1YcjBPPyZbAWm+EL2FoEu8nYdn0D5IYDcRw
	i0Ijl0xPRfwQcG68W0K3b8j477UEcxEtQr8X9hzUfeWrLToGPkjY15Ii0OZtNaH6VM7Qjw
	OotUMUUDicGWrvuiygnZd/pmxp64+g3AI36H0egvb1zWG0a9Ze3Ee/MOX/q68Q==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>, Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alyssa Ross <hi@alyssa.is>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250224-adpdrm-v8-0-cccf96710f0f@gmail.com>
References: <20250224-adpdrm-v8-0-cccf96710f0f@gmail.com>
Subject: Re: [PATCH v8 0/5] Driver for pre-DCP apple display controller.
Message-Id: <174118223158.156873.6982508045942987984.b4-ty@rosenzweig.io>
Date: Wed, 05 Mar 2025 08:43:51 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_054400_339357_B08C1094 
X-CRM114-Status: UNSURE (   9.50  )
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


On Mon, 24 Feb 2025 12:02:15 +0100, Sasha Finkelstein wrote:
> This patch series adds support for a secondary display controller
> present on Apple M1/M2 chips and used to drive the display of the
> "touchbar" touch panel present on those.
> 
> 

Applied, thanks!

[1/5] dt-bindings: display: Add Apple pre-DCP display controller
      commit: 7a108b930a84e71be71c3370eef6dd96fbb8f618
[2/5] drm: adp: Add Apple Display Pipe driver
      commit: 332122eba628d537a1b7b96b976079753fd03039
[3/5] drm: panel: Add a panel driver for the Summit display
      (no commit info)
[4/5] arm64: dts: apple: Add touchbar screen nodes
      (no commit info)
[5/5] MAINTAINERS: Add entries for touchbar display driver
      commit: 4d2a877cc0efefa815648f1ed5f5b2b796f55bab

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>


