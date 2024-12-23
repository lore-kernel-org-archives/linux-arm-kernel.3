Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF36E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 18:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q5bZB9tN6Ej5m8fd1ZE4u2Ym/mpu03gi79bnPoBZCto=; b=rHru6eh2mJgXd/t9n1qJgLPLPa
	Cow+MZJ5g4xYYLc3lz926dtOYROi70k9rLeoqNwNb8djh1B6GB5H15n4jNn6KXMFFTaB183Z2+pON
	MfKRbB1lpa9orOXmwphPskx3lzEjlYProanC7r+xpaW5VY6t7Za6WMIU6DBBhhegja2s7RmHfL4mD
	tG5Tvpi8EoD1uFRhTUvGGAZj8I+M5iNsCLY6pCtLGCEQCuitJa8z40UzQg7r6OcyfQhoOOoZ0Kxff
	R5EzKxeG7oDv7SICjLIc5Cwi9zdXI3AKDexkXEng/uEG079x53dLZ65pqgViUsDy2B2se77AQw807
	aCXpT/Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPnL8-0000000AYzx-3BL2;
	Mon, 23 Dec 2024 18:39:38 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPnJw-0000000AYtj-48RW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 18:38:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1EDC2E0002;
	Mon, 23 Dec 2024 18:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734979102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q5bZB9tN6Ej5m8fd1ZE4u2Ym/mpu03gi79bnPoBZCto=;
	b=AEPx8jWEsJxPYdnDQzfB8/CNI5cobqCAzbcuBIKwuH7AiTDdkAkZqNcIIIxmP58+epXv8L
	kEJJ8N3BI9y8tQyvVcwWb/Bd39aLZrP7JZvOoOycQlxobAzMhq3iLCPdj7yzhI71TQtzOq
	GY10Ulp4TwgoaFPbnLcGQCezegpVUm37z+kK5BBhJibptU7vUDgy6BNEwirZx4RCVf8I3h
	pAKQv84nw1J5JySH2a1viZeZy0g6aiBtT8pT6oxm3/WsxJlA0pkRRUIb2AU+bQzjoPiH7v
	mjdLpmzyYbPRkpSwCvqtbzprLhUMOxoL+DXaE4NdBJ1Va5H9u5jxReDFjPl0Rg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,  Fabio Estevam <festevam@gmail.com>,
  Marek Vasut <marex@denx.de>,  Michael Turquette
 <mturquette@baylibre.com>,  Peng Fan <peng.fan@nxp.com>,  Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Shawn Guo <shawnguo@kernel.org>,  Ying Liu
 <victor.liu@nxp.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  dri-devel@lists.freedesktop.org,  Abel
 Vesa <abel.vesa@linaro.org>,  Herve Codina <herve.codina@bootlin.com>,
  Luca Ceresoli <luca.ceresoli@bootlin.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Ian Ray <ian.ray@ge.com>
Subject: Re: [PATCH 4/5] clk: Add flag to prevent frequency changes when
 walking subtrees
In-Reply-To: <fd2b473bc7c3c70ae0e85b2a6315d9e8.sboyd@kernel.org> (Stephen
	Boyd's message of "Tue, 10 Dec 2024 14:44:19 -0800")
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
	<20241121-ge-ian-debug-imx8-clk-tree-v1-4-0f1b722588fe@bootlin.com>
	<fd2b473bc7c3c70ae0e85b2a6315d9e8.sboyd@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 23 Dec 2024 19:38:20 +0100
Message-ID: <87jzbqtfc3.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_103825_177967_74EF22CC 
X-CRM114-Status: UNSURE (   6.28  )
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

Hi Stephen,

>> +/* do not passively change this clock rate during subtree rate propagat=
ion */
>> +#define CLK_NO_RATE_CHANGE_DURING_PROPAGATION BIT(14)
>
> Why doesn't rate locking work?

Can you be more specific? What function from the API is supposed to do
what I need? AFAIU, none of them is properly locking the rate during a
subtree walk, but if I misread one of them, I'd be glad to drop all this.

Thanks,
Miqu=C3=A8l

