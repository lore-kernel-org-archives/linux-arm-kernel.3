Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6093BCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=keM8FZ6KRUpmCdaqfX/W6LPu+GVLL1SCkuysb5xQQ5g=; b=IDTlsqDbuGI3cdGS4Eomfwu4W9
	j1suBdLJkDVsLed6oexiMzgb8agVxXNUjkS+/FCTM2dZKgxgNVWwLjvcB2AHMFspC05wMngVOE8UZ
	QBbANvS4mkv3nOz7AudNynCgFD7h7D3AwJZyqFKIWj9kwLjGSDEF9bRSx8YdgZLjZdPOubI10r8iD
	fFWnpYaQlB/BBh5lSMKQ5uzL08z6Y75xtU0u22v6YSNuGCXbsbk7e4HZ+BLCCtggNpB/cDR6imh4g
	1xdNmfaCTD8gr2M2xIc9zBA3o29UcOKLRZ7Yo57SwH2EzvjhfI2rS/Cjss2jKJKxmsBfk9dIFVd9e
	wjIJho+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphuB-00000004AUQ-0J5z;
	Sat, 23 Aug 2025 06:39:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upU2P-000000036jk-0dmF;
	Fri, 22 Aug 2025 15:50:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 686615C70B4;
	Fri, 22 Aug 2025 15:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13BF9C4CEED;
	Fri, 22 Aug 2025 15:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755877844;
	bh=PRjr1oyN1prDBOKUZ34iupM5Ee2Kn6LvfPBZpedTizo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NLkvEcDi7va6d8wofQYB7lrrIzy/EqQpNAQJUXQsL0j3e4syTR+r96SoHaJ3jAtJR
	 7ZckKnr3dczWN36y3PWZAxXyGK69AGZvU7vIBerBELyyjgoLDbNNAcCkA8nodPxDjG
	 o1EdFfnjI81c9N6hD5URN/3efElktMnJn31DHEJ4tSXKO/4iuxY9Zquzh9Lsue3hJv
	 Q28Oexi2b1PJzAUXESiyT7HeH2V0N8GEeoQZVSqffF15OnUhUTMiLeyN1JcqQQOYJK
	 1CcJOJM3mQhb74Hc88k0wxqQw9O3jxOtLRx8iGcXvDWmSZ17ssaR/zBJ0ECkedrAtH
	 kWisP7d7d+0oQ==
Date: Fri, 22 Aug 2025 10:50:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, mripard@kernel.org, mchehab@kernel.org,
	airlied@gmail.com, amergnat@baylibre.com,
	linux-sound@vger.kernel.org, p.zabel@pengutronix.de,
	linux-gpio@vger.kernel.org, matthias.bgg@gmail.com,
	kyrie.wu@mediatek.corp-partner.google.com,
	linux-input@vger.kernel.org, kuba@kernel.org, conor+dt@kernel.org,
	linux-mediatek@lists.infradead.org, yunfei.dong@mediatek.com,
	kernel@collabora.com, lgirdwood@gmail.com,
	minghsiu.tsai@mediatek.com, edumazet@google.com,
	jmassot@collabora.com, simona@ffwll.ch,
	louisalexis.eyraud@collabora.com, support.opensource@diasemi.com,
	chunkuang.hu@kernel.org, andrew-ct.chen@mediatek.com,
	dmitry.torokhov@gmail.com, andrew+netdev@lunn.ch,
	tzimmermann@suse.de, maarten.lankhorst@linux.intel.com,
	jeesw@melfas.com, broonie@kernel.org, davem@davemloft.net,
	houlong.wei@mediatek.com, flora.fu@mediatek.com, pabeni@redhat.com,
	linux-clk@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	angelogioacchino.delregno@collabora.com, sean.wang@kernel.org,
	tiffany.lin@mediatek.com, ck.hu@mediatek.com, krzk+dt@kernel.org,
	linus.walleij@linaro.org
Subject: Re: [PATCH v1 12/14] dt-bindings: soc: mediatek: pwrap: Add
 power-domains property
Message-ID: <175587784167.3865517.1055280782148729337.robh@kernel.org>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-13-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820171302.324142-13-ariel.dalessandro@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_085045_229062_D41395FD 
X-CRM114-Status: UNSURE (   9.01  )
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


On Wed, 20 Aug 2025 14:13:00 -0300, Ariel D'Alessandro wrote:
> Currently, the DT bindings for Mediatek PMIC Wrapper is missing the
> power-domains property, which is used in the MT8173 E1 evaluation board
> as it needs USB power domain.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../bindings/soc/mediatek/mediatek,pwrap.yaml     | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


