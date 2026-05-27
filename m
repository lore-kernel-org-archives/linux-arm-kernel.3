Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60296CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 08:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQICb37b6tJT8rYSfInWzIjWd8QW9Ba0rxbOLrI9sgo=; b=TyQB83haxXyJmg8uBO1W68Ntb4
	ejcZaaxbjycQz4T6kUEnIuXQu0Mjl5awGk9p+MDLSrhJPOCJY0MK94GDo2idd9MfQKkIrIvYmo83s
	GAdGOARwy7pr5BDjGs7/xYcvylgMy9dmVxQArAtUclqdqbLA9QSSz8ncbqTAA/XvoyA39hZxo58Vd
	zrzGL4807JjXoBF5eWQtEg9pQB4vHOWBiCmknoBUwCjUmcjf+Rx89+4Ng4L6D/AuHuM8tTnivSsGz
	vfrGsXi1R6jIE0q2FWNcWkC1PR0iZ4ib8I5X/LECpxBVoLXs/ErMupPatwaa9gB/EPwJyBHNSaysh
	TRlstn0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9ke-00000003YPQ-2E5u;
	Wed, 27 May 2026 08:36:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9kc-00000003YP0-2Kt4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 08:36:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BC149433A6;
	Wed, 27 May 2026 08:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3DF1F000E9;
	Wed, 27 May 2026 08:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779870989;
	bh=DQICb37b6tJT8rYSfInWzIjWd8QW9Ba0rxbOLrI9sgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YE1Ll8aizXG+NDFKOUhO70NmB09uLw22F/DTRGfs1YBqLtO3htyRGs4huui151bIv
	 onOTDIrY9EroYIJwik7pYf7ug4r0m3NOd3hxjSINAKASrSLn9uv482tM3YdwPuiNho
	 AdqUU+mQtZ/GbYpbCf5sh9i6jm3FVUaPPuMeyuqy53XMwAIqL8xd5kOmAf8YN89l4O
	 KcU0tYcFLFZ7KuG3Bo69XA+RzdG2KpFNdJuIMkaft2Mfwfl/csPMTCQCKAEDl8qmFf
	 PVuHSVR1ralI0ovVAIvtOK80ALsZzDqQMAvggc2nlHqG4KmxcEQcn2jzdJmwQ9wVpe
	 9TQUhJIEaJkDw==
Date: Wed, 27 May 2026 10:36:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/3] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Message-ID: <20260527-cheerful-academic-oyster-cebb2d@quoll>
References: <20260526-csi_formatter-v9-0-ca3d8c334c39@oss.nxp.com>
 <20260526-csi_formatter-v9-2-ca3d8c334c39@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260526-csi_formatter-v9-2-ca3d8c334c39@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_013630_614371_A6DFCBF7 
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

On Tue, May 26, 2026 at 04:57:21PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The i.MX95 CSI pixel formatting module uses packet info, pixel and
> non-pixel data from the CSI-2 host controller and reformat them to
> match Pixel Link(PL) definition.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

NAK

Implement previous feedback.

Best regards,
Krzysztof


