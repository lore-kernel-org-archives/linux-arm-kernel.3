Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA8FC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 10:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bEfqdcgr5TL7agY2SeC7Rt9BtUOPUzbfT1nrDl5zw9s=; b=AzWFFxQBWSkkNoLK3UgiTb2vK7
	Y0miuSY3SvQJb7S4Or09TET4wqQUEXaqYmthqMK8W6LhwYHEJEkND8Yk9LniuWATSN/hz9JI177QJ
	L5UHWz8IFGkM3bBMujsqQ5eY2g5ZaQxKtISSWmY8J37oG2b2sDvML5Cap0eQWYDQYvUc32JzudUZG
	vP3jPyeOVmBq0d6Wwz6Jehl2sdpGiyWupe50O9mQd9p5sgUFdG4fNfP1P9RPcYkiwcDtvlrbL4ZmV
	wO5c7EPuhE9CcXmP0ENUT8Y1OeGF1p02FqsELVlhaX0FYQCLENy8mn20LUX2nHTI6w+p9UV3x3U1b
	Tsd/PZAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJxG-0000000CInM-19oN;
	Tue, 20 May 2025 10:12:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJW2-0000000CEcd-3B1O;
	Tue, 20 May 2025 09:44:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747734244;
	bh=WaDOA0nhLVn0g1cG6OcvRA1CfBIZaKfZuXaM3IJmSSg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RcxKMs/DjTuhcwv/Qud8AMpfWEmOOzGLo49z2+n6mJc88iW3vTfZ+KlmoTtlUBNcs
	 43h5nuWQQLmqIhpXxFqipz+NA0PZJyrNR3jL+m80XnC3/4AZ2KBG8MBgDbdbPljq3v
	 NyCEzRaIXHGzZdNyGaxc/l47F5btNls6+WFL91w22LKDT8oeznNK4OCO/0jbp2WLqc
	 kyj7/DpBnYBu7l2sDaZVEhFMjmTDxsnJ0d6KqdEmMADBCmUnU9gipUxKD7mb83Ukfb
	 uc3O0tyJWrwCMs1RYGG1qsZlRyIjTG1HBCDHbDPhkKxuWf3uEjKtemXBvaE94/b686
	 4A7IWsWhC/b4g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 52E7F17E0FD3;
	Tue, 20 May 2025 11:44:03 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org, 
 Vignesh Raman <vignesh.raman@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 nfraprado@collabora.com, krzk@kernel.org, daniels@collabora.com, 
 airlied@gmail.com, simona.vetter@ffwll.ch, arnd@kernel.org, 
 ck.hu@mediatek.com, laura.nao@collabora.com, matthias.bgg@gmail.com, 
 tzimmermann@suse.de, mripard@kernel.org, lumag@kernel.org, 
 ville.syrjala@linux.intel.com, jani.nikula@intel.com, arnd@arndb.de, 
 geert+renesas@glider.be, wenst@chromium.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250512131933.1247830-1-vignesh.raman@collabora.com>
References: <20250512131933.1247830-1-vignesh.raman@collabora.com>
Subject: Re: [PATCH v4] arm64: defconfig: mediatek: enable PHY drivers
Message-Id: <174773424323.2901578.2896521674718860573.b4-ty@collabora.com>
Date: Tue, 20 May 2025 11:44:03 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_024406_948474_3999369E 
X-CRM114-Status: UNSURE (   5.62  )
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

On Mon, 12 May 2025 18:49:24 +0530, Vignesh Raman wrote:
> The mediatek display driver fails to probe on mt8173-elm-hana and
> mt8183-kukui-jacuzzi-juniper-sku16 in v6.14-rc4 due to missing PHY
> configurations.
> 
> Commit 924d66011f24 ("drm/mediatek: stop selecting foreign drivers")
> stopped selecting the MediaTek PHY drivers, requiring them to be
> explicitly enabled in defconfig.
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: defconfig: mediatek: enable PHY drivers
      (no commit info)

Cheers,
Angelo



