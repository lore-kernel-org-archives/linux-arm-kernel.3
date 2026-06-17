Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3888BCD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 15:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHJXgDZdrQXug3OSJET//w33iY1x+Rusb29X/DZT8Gw=; b=LYfHsiSUtycIkBd7C46xVeXA9a
	/ZXByrKhvZGiYPAU6Qe1xgEityDm4kwiwLW9keQh3bISlgy5gTvZytwHM1lB/Cu/VXBu7QGJzJu/Z
	1pnf56qxkTe8ooCm1sV06eqRs2LMpD0lzeEqgYIUplTh8x0ye7j4lDQMjQByaxZGlVxALEaOKIXLC
	9+TIZQFKtofytGg/zXHAmB4WHMndpuNCQp3UrSJ+tmd/6Iei10H/WDSkesQcc6nVdUaK9L5Z+jBGf
	bDaSwwBjwTUwFtVcfw1GdAfRf3f6g88ZswFD3UBQyxbjvTtac58aHA7P4oaE5sHIPnmRQ/IJ5gwoD
	uOj115+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZsTX-0000000Ha7i-14xb;
	Wed, 17 Jun 2026 15:46:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZsTV-0000000Ha7Y-3PX3;
	Wed, 17 Jun 2026 15:46:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F406060052;
	Wed, 17 Jun 2026 15:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ECF01F000E9;
	Wed, 17 Jun 2026 15:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781711204;
	bh=MHJXgDZdrQXug3OSJET//w33iY1x+Rusb29X/DZT8Gw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=J9ORgys/GhA4HTpeMpHgnGulykS+dtFlH7f0szkpPPkby4tQweo00ZhBanut5hmLg
	 fNX92VTENgJ4Cvw/1D7CROusIoLImwfPeS2X791tVdGt0PBJMmQnHo/UtoFcm5ltjA
	 9D/uzTlaY3VTCW6IRlpfbM5cx7Mugmdjcjq5z5Y433wiyyvG/wkAQVtj+jq/qKWAGo
	 cHeLPXq40QNIZG/IzTns47XdF/Js1hfgdLnWW2r5/7sb5IltfGS8iTpTEF7cEidqRh
	 sPZnB2lmALqkxRnhnVRSjSa1vQ+0Or6ZUgmEph+zDmmQTOAQ6b2yGgMkZCOQ07tpcb
	 P/Xj6GFDm6scA==
From: Lee Jones <lee@kernel.org>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Roman Vivchar <rva333@protonmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ben Grisdale <bengris32@protonmail.ch>
In-Reply-To: <20260617-mt6323-nvmem-v2-3-4f30e36aa0f4@protonmail.com>
References: <20260617-mt6323-nvmem-v2-3-4f30e36aa0f4@protonmail.com>
Subject: Re: (subset) [PATCH v2 3/4] mfd: mt6397-core: add mt6323 EFUSE
 support
Message-Id: <178171120126.1657680.13074561200311670232.b4-ty@b4>
Date: Wed, 17 Jun 2026 16:46:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Wed, 17 Jun 2026 12:48:46 +0300, Roman Vivchar wrote:
> The mt6323 PMIC includes an EFUSE. Register the EFUSE in the mt6323
> devices array to allow the corresponding driver to probe using compatible
> string.

Applied, thanks!

[3/4] mfd: mt6397-core: add mt6323 EFUSE support
      commit: f5ce60535d04ca21799d558cfa13ba91bbe714b5

--
Lee Jones [李琼斯]


