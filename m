Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6093CCFC521
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 09:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YRSOS2NxDQAYTiEAU0zjlgUm3wM7hnF5mim7e8XY6+k=; b=L3gQhrOpKu0De8N5MNFH1eXv7m
	7II78rAqSaP6mkHNuDhaIewV2ie7G4lrY2Zr9tUNLr7Qj5JcR1O6AR3HbvthRzPCwz+lsHfL4qV0Y
	1JaNRaoNsN367h6yeyzhZguXuTPIflsK/LWY/JAISTeTYX6tkx/xj8yEZLQkSS5FoYlyWgGH8Plan
	ZC7x+Nzlvxn+DYcYmpEQqTvRXceS/V5J8JjMHKuK2/APTbn/zDD7XeiOOZ9VXoTU1BITeTgXBpkPa
	wucXzHVgqnpzdJkNxTuAjQfBze/bfZTMoVHOXHAzn2cGxaSnVguIf6wQ3RApGIb9pKMrTFbj+7pmk
	gocciShw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMjwx-00000009Pvh-2Qkr;
	Sat, 22 Nov 2025 09:30:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMjwv-00000009Pv1-2xpM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 09:30:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6279343B06;
	Sat, 22 Nov 2025 09:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB7FDC4CEF5;
	Sat, 22 Nov 2025 09:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763803833;
	bh=Mna69aGIWTG040yDqYFP32iKOKMkmBLp/YLju5u8/i4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=XQsqXTRvU2jmY+FoyVriMGIM2lCY/KGpCbk0y3rLair5sClbL38j7jpbS/9Xa6By6
	 9urj36wQOJ22rrvsgTiARRudTJOScq5kxreMKqhssWrpmgGkE2RVZcHIWM4Poy4rM3
	 QdLKmLm2cJZ+SpVnztqc2EICsb3CjB3WI3xiZQFx4YiiJk5H6+PZbKDGajbH9yIMAP
	 Qja9x7pBlaOo4Q5geVfJX/UKekIgfOD3D4wKYlQOZbLbajzYrFAdLb7TK0Drx6vuzL
	 hMY2356p7MuHpSBNd0NQN3YQK/NdYia/2mVTfcnbYfX1DFlpZrHj8MHLZiU+VJG8AY
	 rL2dgSGlSiC1g==
From: Vinod Koul <vkoul@kernel.org>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Harini Katakam <harini.katakam@amd.com>, 
 Shyam Pandey <radhey.shyam.pandey@amd.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mmc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20251115122120.35315-4-krzk@kernel.org>
References: <20251115122120.35315-4-krzk@kernel.org>
Subject: Re: (subset) [PATCH 1/3] dt-bindings: display/ti: Simplify
 dma-coherent property
Message-Id: <176380382732.330370.6897973722386830708.b4-ty@kernel.org>
Date: Sat, 22 Nov 2025 15:00:27 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_013033_769949_33C02039 
X-CRM114-Status: UNSURE (   5.84  )
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


On Sat, 15 Nov 2025 13:21:21 +0100, Krzysztof Kozlowski wrote:
> Common boolean properties need to be only allowed in the binding
> (":true"), because their type is already defined by core DT schema.
> Simplify dma-coherent property to match common syntax.
> 
> 

Applied, thanks!

[2/3] dt-bindings: dma: xilinx: Simplify dma-coherent property
      commit: 2b11e7403a8ed816fce38b57cb88e04d997aa7af

Best regards,
-- 
~Vinod



