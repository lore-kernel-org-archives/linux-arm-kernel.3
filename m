Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB00C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 12:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJy6TORXI+Tw/OQDF2VWjzLvO4cMyByk1QsxHxvCKl8=; b=d2i1n5/wQHERBNLtDVVhEEhEgI
	xo3um/LDREQ+wzTZfRM6K9aY8c+6NHTLMeKc0UFTjtfmnavsdgb3bGn2iY0LUK0S8qBOhFPT8zs1N
	fdy048f2/xQfLlrdFLiOrBROEY5v+ZQ9JYBiIIfhqjVnoBb78FxwYzF8A8zZhIrLF5Qj/cF/L3tnm
	vWBntgT6f3NVkGHJw3BsW/piW5RV9MEKcjG67hYIG+5kbMZaeLHkqvpcthgl3phyYvm3PhRp2v9wi
	FYxGMdh3uGKUGrrjn6Fx7NmmCuFV+I64+pntp+GeycHzUHNyVOB+FnKyRpebrqbXHqnv6lj2BgUQW
	ugx2SM1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVUJr-0000000GlQJ-0xrW;
	Sat, 28 Jun 2025 12:06:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVUHY-0000000GlDS-0LaS;
	Sat, 28 Jun 2025 12:03:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1145960052;
	Sat, 28 Jun 2025 12:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1EFCC4CEEA;
	Sat, 28 Jun 2025 12:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751112220;
	bh=adw4vx0RKecc9InMMlHCSaFcrV1lp2SGd+hRdGVjNEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pOY5riDHCyJcLDukUB55YL5gK3oqVWjFCbmkYdYK7e54zPYE57O2LiQnCJEHUyIZ6
	 jYAJdWIGUutBqp5pd7yGYpxj/9Nr0qs4AKHQJhtlt1bSI7n6YciivHChzylsHbb4xT
	 y23B3KC2VvnIPUO3h91ylFVjg5G0i35vp7pYNw8303y2PULTBXv8ImwxbDKkotixCa
	 KmEA27B9ehtFzsNmsLt0IRL9Xib+dN4s4DO9jZ4UGHjAa9YvRDr60wZokJGx2EtSAR
	 tzqLfa+7OpEK3cEMdWqo/WIjO836yZrXXExZezeiG1FmxDWZ1EwP3U+xfaRmtT323Y
	 Jw4IolTZijbFQ==
Date: Sat, 28 Jun 2025 14:03:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
	Jiande Lu <jiande.lu@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>, 
	Chris Lu <chris.lu@mediatek.com>, Hao Qin <Hao.qin@mediatek.com>, 
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-mediatek <linux-mediatek@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>
Subject: Re: [PATCH v5 0/2] Bluetooth: mediatek: add gpio pin to reset bt
Message-ID: <rthuekbpdfszo2mw4b4zgjlv2nd45zbzzpxdjjxf6gpkrc5g5l@m7kfo7s4ltqv>
References: <20250627055924.7716-1-ot_zhangchao.zhang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627055924.7716-1-ot_zhangchao.zhang@mediatek.com>
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

On Fri, Jun 27, 2025 at 01:59:22PM +0800, Zhangchao Zhang wrote:
> The enhanced BT reset feature builds upon the previous software-based
> BT reset by adding support for hardware pin resets.
> To maintain compatibility with existing projects that
> still use the software BT reset, both methods are supported.
> 
> When performing a BT reset, the system first checks whether the
> Device Tree Source (DTS) is configured with the appropriate settings.
> If the specified compatible and BT reset GPIO are defined in the DTS,
> the system will pull the designated GPIO pin low for at least 200ms,
> then pull it high to trigger the BT reset. If these settings are not
> configured, the system will fall back to the original software
> BT reset methods.
> 
> Compared with the previously submitted version, the following
> information are some specific revision histories
> 
> V4-->V5 modifications:
> -Modify the comments mentioned in v1.

What? This is so vague, means nothing.

> -Modify dt_binding files and 
>    make dt binding a separate patch.

This means nothing. Everything is "modify". Your changelog is terribly
uninforming. This must be detailed.

Best regards,
Krzysztof


