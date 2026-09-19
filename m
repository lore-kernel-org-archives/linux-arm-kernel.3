Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CF6C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 00:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W6XpYlqSAUDYu2tTQpZ6AxUTQ7zY6Z7lXw2iw401dcc=; b=spPNd0ShPBqar4X+JYs+noJNnk
	TQoBO63txUhRV80GdIYJA2GOWNYG5BFDsOCpYY9WI+DW4SubKxIi0NBP8nmrPjdnpvx251kTz5MNK
	xpr5FVqrvc1aRYTi/oH4OBNmdOE9fMwmrGy0wVGHXbnPiWdUcqIqEcHarBMguBYQTBQGqDEiFx0uQ
	leY4RG1AOMBP/Yz3Sm5BkydngB3dCZ1web8WXhqJY1JyQ+rAOnPjdo0dHO5xbR0PNhskuh2+rrCTK
	EMwgCRXPpSgHq7tRdVf9pCPt7VcacJtkxacHNaC9ANTNTjv8Lfw/VXHj6Q0lEMo44uEocEVmlUX0k
	V+6l9xhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x84tC-0000000GgSm-0JMP;
	Sat, 19 Sep 2026 23:54:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x84tA-0000000GgSd-2nJX;
	Sat, 19 Sep 2026 23:54:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EB0A943CB2;
	Sat, 19 Sep 2026 23:54:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2236B1F000FF;
	Sat, 19 Sep 2026 23:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789862075;
	bh=W6XpYlqSAUDYu2tTQpZ6AxUTQ7zY6Z7lXw2iw401dcc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=KxhccjP0SC+YfGESK9r7B0FuJgV1ssSOv0COhgDFitbx5+kSAHQCGivmtCi241izf
	 2gPqGwkJFD3iis9udq3WWFNG4k4P0EzXVFAvFzZSs+JeXCQbbMipg1zPPQAc8C8Xy9
	 Ni4Sr4ogrjCESZmJOd/kSjiSvrO2frcHSZHKgF7iOrAXfOuxtDMR4qQJ7JuSazEL/l
	 YqaZ1wpr/Pwj62Ehq95XIH6W2xmmH7rrIUYt64I3+Nep2zkVbOadjl3OQXXWuW3zNY
	 w+8oN2kW7Zuvpng0pF4wyP+0siJSgM5EWsmQctmDLCTSeI26THuE8shxcQG3GbAarS
	 vKdpB9Ct8ePMg==
Date: Sat, 19 Sep 2026 16:54:34 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jack Wu via B4 Relay <devnull+jackbb_wu.compal.com@kernel.org>
Cc: jackbb_wu@compal.com, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>, Johannes Berg
 <johannes@sipsolutions.net>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Wen-Zhi Huang <wen-zhi.huang@mediatek.com>,
 Shi-Wei Yeh <shi-wei.yeh@mediatek.com>, Minano Tseng
 <Minano.tseng@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Simon
 Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Robert Yu <robert_yu@compal.com>, Jeff Chang
 <Jeff_Chang@compal.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v8 1/6] net: wwan: t9xx: Add PCIe core
Message-ID: <20260919165434.08d026a8@kernel.org>
In-Reply-To: <20260914-t9xx_driver_v1-v8-1-5206c2e6bea0@compal.com>
References: <20260914-t9xx_driver_v1-v8-0-5206c2e6bea0@compal.com>
	<20260914-t9xx_driver_v1-v8-1-5206c2e6bea0@compal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 14 Sep 2026 18:31:52 +0800 Jack Wu via B4 Relay wrote:
> +struct mtk_dev_ops {
> +	u32 (*get_dev_state)(struct mtk_md_dev *mdev);
> +	void (*ack_dev_state)(struct mtk_md_dev *mdev, u32 state);
> +	u32 (*get_dev_cfg)(struct mtk_md_dev *mdev);
> +	int (*register_dev_evt)(struct mtk_md_dev *mdev, u32 dev_evt,
> +				int (*evt_cb)(u32 status, void *data), void *data);
> +	void (*unregister_dev_evt)(struct mtk_md_dev *mdev, u32 dev_evt);
> +	void (*mask_dev_evt)(struct mtk_md_dev *mdev, u32 dev_evt);
> +	void (*unmask_dev_evt)(struct mtk_md_dev *mdev, u32 dev_evt);
> +	void (*clear_dev_evt)(struct mtk_md_dev *mdev, u32 dev_evt);
> +	int (*send_dev_evt)(struct mtk_md_dev *mdev, u32 dev_evt);
> +};

Please remove the abstractions which are not necessary in the initial
version of the driver. If you have access to a good LLM these prompts
will probably do a better job preparing the patches than you:

https://github.com/kuba-moo/ai-prompts/blob/main/driver-upstreaming-prompts.md

