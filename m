Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA51BF513EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 01:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVu8enQJ9US+W6TOMUmMoGmFRaxBflhKUpLN5jmIpF8=; b=kMCWIWBZ4ubrEyDLlanuG3L9bz
	4NgHBLm6sM5Bfn2/qRq8hlsL/rrk79qmnzxhvoiojoab8g0LoE9Q/h+E42R2AeAQCw3cxelcvP3xI
	2cGr9z5sWS1tyFDgmP4VYTu00PJvvMi9GRymqFlRQLWP+UKQH98g9TyYzhwzNsA8Lbfio+el2LAiF
	ngFGhcqqxy+ZfgmiDA6xHa0DIxZB+94FT4QNQpBdwDhGl5Q+lZ/C6YSNz8aNh5RAZQk0vVynjgbWA
	NzPHb047947D5ZGkObotXeoKVSxM2ALdjCWf3kxNEuyV8AH4IyqBcImPetrJicTr3iUgwjAQXIP3w
	1cu1qLjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJfm-00000002otD-2kbr;
	Fri, 06 Mar 2026 01:08:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJfi-00000002ork-2Fuj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 01:08:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E52B443E2E;
	Fri,  6 Mar 2026 01:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9165FC116C6;
	Fri,  6 Mar 2026 01:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772759285;
	bh=B8tOVBmY+EUIN1uBk+9h1I345IZ9kWKRDBkL7ai3E+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eBGE/NEMtv8RnAK1NsRCzKwTehVMKfN4lo71QN8VB1giD9Ll3K2eVqM9ROWSJhL62
	 Kyozcnue96JT2usj8dX9rD40ZU9rFsltFdpJpbFCWXoRl1fgMEqp0IlqphDtNEYoJ1
	 dxjIy2goVblgNGVkPJeyBUF8Jkxlvnr2IVxaPTw0nLeJ6CTVOJ2hodI5VOg0OzFAX6
	 BmCBFaRCyLGJH/Irrzsff46QxEpobLEsrLGbOEadB2vPLZYoies7HS8O9G8eOZZg5T
	 bSfZlxp4UU3+vFPUWE4B/x7Z+uTqnlFBkjh+KcAGpTG8lvX6oek7WGETrdoZ+oJRiJ
	 SdXY9//8DGzhQ==
Date: Thu, 5 Mar 2026 19:08:04 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, imx@lists.linux.dev,
	Jaroslav Kysela <perex@perex.cz>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>, Baojun Xu <baojun.xu@ti.com>,
	Frank Li <Frank.Li@nxp.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	asahi@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org, Kevin Lu <kevin-lu@ti.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v3 3/7] ASoC: dt-bindings: add TDM slot idle mode
 properties
Message-ID: <177275928407.908052.10390059527937221650.robh@kernel.org>
References: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
 <20260301-tdm-idle-slots-v3-3-c6ac5351489a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-tdm-idle-slots-v3-3-c6ac5351489a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_170806_603129_1102A757 
X-CRM114-Status: GOOD (  12.73  )
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


On Sun, 01 Mar 2026 18:05:22 +1000, James Calligeros wrote:
> Add properties to describe TDM slot idle behaviour. These properties can
> be used to describe how a DAI is supposed to behave when not active.
> 
> For example, Apple Silicon laptops split a single I2S bus between two
> physical lines which are combined at an OR gate in front of the
> receiving port. One codec on each line is expected to transmit zeroes
> during the active TDM slots of the opposite line, or we will have corrupted
> data at the receiver.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/sound/tdm-slot.yaml         | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


