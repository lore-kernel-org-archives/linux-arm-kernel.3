Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4BFCA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 09:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhkrzxBeBYCcN/a6bu9qI5WPt3nhoyyqP4Q8ZG32Cyk=; b=T7NGVc8wXjkaE48dIv5kJyc+yb
	JCgkb0VigeGJ5wxMqzguB6zrMLaztUb7EHtuRVIFzyYEyhHybUodXpD9HAScOvyZ37FIG2MvGglQ6
	NBzgVLiq1s4UW4uHePWaDY4D+YKsmKsql5OKxhVh2XvYv1XvWYPczzGq5FrDSoHt+y/fHBsgPl/J/
	u1Du/9jQQSXUikFmv9kKMEWCZZUZl9CQz7jJnCGDAkVdLRB0sEY/yU0a4eOcHxhcz+orvfb7eAD6M
	BFhpMpvuH+RpBqwCymvOj3HE/BrbiItyPa/J0ZAsqwTfBLuRDy1YmQoI7coFRf+K3Di7XFAn7eH9d
	3DEuw5qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqjp-00000005alq-2CdF;
	Wed, 30 Sep 2026 09:36:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqjo-00000005alW-30mt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 09:36:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2AAB0438F5;
	Wed, 30 Sep 2026 09:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6911F00893;
	Wed, 30 Sep 2026 09:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790760992;
	bh=hhkrzxBeBYCcN/a6bu9qI5WPt3nhoyyqP4Q8ZG32Cyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kQAply3sMV24+vQnwjMXOxtfkB5lHnc7g+9iAaV5SBojX578vU5NV0Zse4Igoz3JZ
	 EPeUINmUuydUhQ1/l5qgxOUc0+F8EijQSWEEXTFQJA455+nETf7M1PG4V5ja+f9IFA
	 is791/Ffrjnz+bLUOqzEl3Wlzmd6BHJd04C2dD8DKl5CPDOOr+bAJQMZ0VmM9GVkFr
	 BhvwAYX9DIfW7f+ZYwYo9NizW7IfY7aLucQ7jdChbQssTgm8NQfseCL7VQaO8bj1f6
	 GmgmdwPvqHLaUzLkPpFfo1UBgaGGSYOhsgPO0NvQeeBSzXDJ2mghVFKYXq+mFeZOg+
	 A5OcCIhME5hAw==
Date: Wed, 30 Sep 2026 11:36:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guido =?utf-8?Q?G=C3=BAnther?= <agx@sigxcpu.org>, Robert Chiras <robert.chiras@nxp.com>, 
	Tim Harvey <tharvey@gateworks.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/8] dt-bindings: display: remove #address-cells and
 #size-cells off requires
Message-ID: <20260930-lean-benign-swan-3c04f0@quoll>
References: <20260925-cleanup_dtb_warning-v1-0-f999fafbca60@nxp.com>
 <20260925-cleanup_dtb_warning-v1-1-f999fafbca60@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925-cleanup_dtb_warning-v1-1-f999fafbca60@nxp.com>
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

On Fri, Sep 25, 2026 at 12:37:50PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> The display panel node is not necessary located in dsi node. So remove
> these from requires list.

Would be nice if you paste here trimmed dtbs_check warning or reference
actual board showing this.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


