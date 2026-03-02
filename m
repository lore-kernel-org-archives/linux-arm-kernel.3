Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F9DEB3622
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 17:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7BMzIGTcR03oDr/GwRJGVOgBesWNokBNrI/PUfzkFw=; b=TxjekyyeT075WJYC3+VDEFd4YK
	eHMk489Z7Fs0Lv97Nie6QPNmI723sc0KreMeKJpagU3e5A9sOIc+rQ3hFBiUhmyFEmqzYnMNYH2xS
	yzBhf/oOkOJz/ZTY/UeqfSUlJoIYRtLFRvNjBRGp0gcpnpQ9b4xz+MUd7wd5IHSrVG8gGysmaNa3Z
	mIr4L4I9esf3XZ/mV4j1Y5T34hBIPu0Nms7FtNMlz154HlhX5cDvzY0cD9tatX0L2Awaw/zcuchJN
	hidHfLBRprkpmh1RzueWQ9/sCEcky70yvEhxkyjcXysCdbefNNnHKfaXMbZndBREybqX1VWSNldY4
	LgDIJnRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6nQ-0000000DYwg-1Urb;
	Mon, 02 Mar 2026 17:11:04 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6nO-0000000DYwD-3jfO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 17:11:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=B7BMzIGTcR03oDr/GwRJGVOgBesWNokBNrI/PUfzkFw=; b=qYXzYyqmfH30IMThpWbOFzFsB0
	c2MAyOfzzHy64IeZo01QOyCLkjF+1lRimCjRjsSM/4bn3uvbSicYBa1CTRxS6toklyQWKpTlKGkeM
	pSsUEVbakjiBsGxEDgqwKdE0+2hZcCHWq77tiPBR8gJ9VUXVGqw5FDcWX3Dqi79VNpsOQIXYpyhUw
	CD/lfnnmsUWwQtaFTdi1u6krFjhlbKjcLL7YTog8FTSXb9OoEk1xez39GyC52E17R2IS9T7tjpVBa
	yNaTiIfCzR0lWzoa/tiHFg7wPvkDVcWJ0ml7ByeQ6A631VC8kIos5E0/oodtFvN8mwKxfcKUy1mqi
	o9qxxQMA==;
Date: Mon, 2 Mar 2026 18:10:54 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] ARM: omap2: Replace scnprintf with strscpy in
 omap3_cpuinfo
Message-ID: <20260302181054.06aed925@kemnade.info>
In-Reply-To: <20260224144552.585272-1-thorsten.blum@linux.dev>
References: <20260224144552.585272-1-thorsten.blum@linux.dev>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_091102_934723_ED4F08B0 
X-CRM114-Status: UNSURE (   6.54  )
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

On Tue, 24 Feb 2026 15:45:51 +0100
Thorsten Blum <thorsten.blum@linux.dev> wrote:

> Replace scnprintf("%s", ...) with the faster and more direct strscpy().
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

