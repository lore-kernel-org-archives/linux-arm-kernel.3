Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5C6C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 15:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6Ezqa2dO/9Dmog89bWC65voOH1LK7nETEJo4JkXH5I=; b=e9sa372mj2ibnUoa6nMqQ1B3d3
	ukS1L/E/VEXebbeX4/JrldufrDS4ixfJnR2aHqkNY2cwCx2hYCrlw4AIBIlGgwYB8kSrBm97UP5g2
	MMLi8tISf+sFjeA3bG62JUkogg7apXMU1nmUBtwLHQG4CB6ObHts7g9krpSu8I8Bc8bsy/CEjFwaU
	qULWomFkTRlkZsSi0clGIyhitJ94HPzgasWeKEBz3o+i1i17bQ5WvZs2FdQhBPcZ1kCEJSybLHhqx
	tuMFJqJk+FE/kNK5nokcnWoiGLVvHJa+f97hNp1QA+0Jpd7iIM+I2Hl29QVcrMIJqDHv9bBNBmtPf
	c1UGgc9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzTs-00000006RIN-3X2l;
	Mon, 17 Aug 2026 15:42:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzTr-00000006RHo-1lBY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 15:42:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D2786600AE;
	Mon, 17 Aug 2026 15:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3801F000E9;
	Mon, 17 Aug 2026 15:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786981350;
	bh=g6Ezqa2dO/9Dmog89bWC65voOH1LK7nETEJo4JkXH5I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=NLOPrDNwAKy7N7zNCpj6yObRFmmM3rz0rjWFoasL4DTAnV5u3J43xmVBZ3AYoN6Cf
	 IJc8XciHN2zsdxVgaWvWpkNqmKtveIy5I4WbN6pl76un0tl/NanWSta6ofN1yjUJGD
	 iblDnWEdPaXs5dx4nhcFjQCFpGHMXFSZMOW0grxJDlStA8zZosIdqogV3yugPnyRrr
	 2QgYnM+hxWSj9D9Z5fEwjy5Yt4EePlABLothAheGRotdJTchS2wJDMli4Rq/jUHJcF
	 Dl9DFp6N1e26RzfsmCo45pNojSqEz6mt+V7CxKPLzF7yO02m+e1TNWB5Sp+/sIX1c9
	 bp5d56b8s2NDA==
Date: Mon, 17 Aug 2026 08:42:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: dinguyen@kernel.org, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, krzk+dt@kernel.org, conor+dt@kernel.org,
 robh@kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 4/4] net: stmmac: dwmac-socfpga: Add support
 for Agilex5 TSN GMAC with FPGA converter
Message-ID: <20260817084229.56655607@kernel.org>
In-Reply-To: <20260817030213.6769-5-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260817030213.6769-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
	<20260817030213.6769-5-muhammad.nazim.amirul.nazle.asmade@altera.com>
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

On Sun, 16 Aug 2026 20:02:13 -0700
muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> Subject: [PATCH net-next v5 4/4] net: stmmac: dwmac-socfpga: Add support for Agilex5 TSN GMAC with FPGA converter

## Form letter - net-next-closed

The merge window for v7.3 has started, and therefore net-next is closed
for new drivers, features, code refactoring and optimizations.
We will only consider applying net-next patches which were posted
before the announcement:

https://lore.kernel.org/20260816155953.072d73da@kernel.org

Fixes are obviously welcome at any time. net-next patches may be sent
for review and discussion only with an RFC tag.

Please repost when net-next reopens.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer
pv-bot: closed


