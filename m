Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A07C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 09:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CmoAc7Ed73N6OKeL6XPVO80XTnQQgLuLjmuS6bRxgF8=; b=0pkZvx6YMvukqdnJMlHLqyTAOl
	HuS4YOxqd2Apiu5ywcsmcmuxxJNbdFBzjA0KdOZuWk4pFpiYobczRLIxeYhA1l7Yfu1aAdSMCUl31
	Yw/t1BBjQ5cqnnJqipMd8u12MHlqqqybT7zfAniKswpZsIxfbSDhDuoAQBDy8Uu7TJi90yS/Xf0/p
	gUaCzM+8GI+LZ4dKid5/rKVmTikRN15bt4HIWcq5LmUFWY1xHJBiR1SxO/X0GoYnsMD3CS9UVqA4B
	d/vR7gJsh4T/L0crOFVpIClv9PQmiLRfDzJKedaUxo7yL92YT9ZfpGKkkMR8vAtzfvgeF/tQGZWcV
	DxeQCl6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVc0-0000000AUGl-2BzV;
	Thu, 13 Feb 2025 09:34:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVUa-0000000ASNj-2qhD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 09:26:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4AC06A41F87;
	Thu, 13 Feb 2025 09:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76B42C4CEE8;
	Thu, 13 Feb 2025 09:26:42 +0000 (UTC)
Date: Thu, 13 Feb 2025 10:26:35 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sebastian LaVine <slavine@d3embedded.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>, Abel Vesa <abel.vesa@linaro.org>, 
	Achath Vaishnav <vaishnav.a@ti.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>, Fabio Estevam <festevam@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Javier Carrasco <javier.carrasco@wolfvision.net>, Jianzhong Xu <xuj@ti.com>, 
	Julien Massot <julien.massot@collabora.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Kory Maincent <kory.maincent@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mikhail Rudenko <mike.rudenko@gmail.com>, 
	Nishanth Menon <nm@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Stuart Burtner <sburtner@d3embedded.com>, Tero Kristo <kristo@kernel.org>, 
	Thakkar Devarsh <devarsht@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Will Deacon <will@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>
Subject: Re: [PATCH 1/4] media: dt-bindings: Add Sony IMX728
Message-ID: <20250213-shrewd-tacky-chachalaca-778a50@krzk-bin>
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-2-slavine@d3embedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250212195656.69528-2-slavine@d3embedded.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_012644_779262_F5F9857E 
X-CRM114-Status: UNSURE (   9.02  )
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

On Wed, Feb 12, 2025 at 02:56:53PM -0500, Sebastian LaVine wrote:
> Adds bindings for the Sony IMX728.
> 
> Signed-off-by: Sebastian LaVine <slavine@d3embedded.com>
> Mentored-by: Stuart Burtner <sburtner@d3embedded.com>
> ---

Please run scripts/checkpatch.pl and fix reported warnings. After that,
run also 'scripts/checkpatch.pl --strict' and (probably) fix more
warnings. Some warnings can be ignored, especially from --strict run,
but the code here looks like it needs a fix. Feel free to get in touch
if the warning is not clear.

Best regards,
Krzysztof


