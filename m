Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578C9C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 21:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lco0nsfOk/y1oLd4zNBhcBNCczg5cJsEqylfHR9vG+8=; b=4uGGlToTbljlN/xqTOS1zn3wDQ
	OAgW0bPZkJwZuOg89stTKVdcA05rHTDtVoq4sL13YgUNzdmLCecFEZIT6+DlIHOggK673uy++aQQy
	7kDqirj0YwYFIU33jNuCzgrx4WhH513LaaOFIZ6b6nOQXpYuic8XJcpbhLN+jZajT5PkRpOOnXWJV
	vK3g6tCruOFa5m1KkKC2vu3ihS6bcSFrs/pKgmjwoXCkN7QjJ1+KUpYlkEiUL/Xy+vIVRZgDa04lb
	qM8gx6DGKE5qyttX4qK7VadBbIPN0R95wLWQWCMTZqlf+4UyPesHux1zTH0gvC0JfMCag8VGjnmDW
	lVtFkJoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gXH-0000000FbEu-40WF;
	Fri, 18 Sep 2026 21:54:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gXG-0000000FbDR-2ZLP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 21:54:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E5C74394F;
	Fri, 18 Sep 2026 21:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8101F000FF;
	Fri, 18 Sep 2026 21:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789768462;
	bh=Lco0nsfOk/y1oLd4zNBhcBNCczg5cJsEqylfHR9vG+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z1PxyPvPAQI8S9FUlJC53CweFvKxnBH/6aUfb/nP/Mj+xboet4C6ZO0QiGEpF0N6o
	 +EniklQnUAiSTgJt9mP7ubukOU27ICP+pC2c/4wpiqaSv608ilBBYQVVUx2iIZsU+f
	 ivQcMh5CsgyVliIIoPx2frq5qKWRjYrhSe8hJ3dcKo515UOjXjKeJwvtap8LdPbboQ
	 9R8Hs2CpNmPCbGnbrd0YGqqgyCquflXVJ5AZIIA1qTuqAdGmGN5lzooz1ehdKJIMvY
	 uzrJ0HzdmksvWFQiif6tuJMmNux74FiryAR+Dd6DSijVZenXkUpdRAyVzxPoD1mjnk
	 qVht87VZt9j4g==
Date: Fri, 18 Sep 2026 16:54:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Frank Li <Frank.Li@kernel.org>, dri-devel@lists.freedesktop.org,
	Lee Jones <lee@kernel.org>, David Airlie <airlied@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Mark Brown <broonie@kernel.org>, linux-pm@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 10/20] dt-bindings: clock: stericsson,u8500-clks:
 Allow power domains
Message-ID: <178976846033.2410726.8701362101092342072.robh@kernel.org>
References: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
 <20260914-ux500-power-domains-v7-1-v2-10-9d0c17e1f816@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-ux500-power-domains-v7-1-v2-10-9d0c17e1f816@kernel.org>
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


On Mon, 14 Sep 2026 13:54:38 +0200, Linus Walleij wrote:
> Allow the DB8500 clock controller node to reference its power domain.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


