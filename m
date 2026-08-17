Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7050C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 15:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DmfPql4Th1/vGMYBr32DIZj6vWMe6ET+S2DBK064HU=; b=We8SHpbAy6m1T7WCf5+5oxCELg
	tBXX0uFXwx7vrPG90yMsMYOzcjeDARKa7l6X4QIHSyl7wiJBPnK2B/qdoD0vS+CEHkp6DE7cJLZEC
	F/jz4qKGGKxgnl/ZHrx/QzKlLGDRcSk+VLQiqoQpXeb1mJ2j6wfgv2GC35YkOrJDC1XF6qS8eQlY3
	jLF3aHlQoFmMgnjigZIaYTiO9sKweYXVjoXPoifBLAv14M/xIIogA6b+jAlrPkyRTfAy20NFj5CPj
	kMETqj1yQGEJ5cBEWzT7yj6maRJns6sWLgAxdFAxJ2vpJFHUbH5e0XfAxo+xcgEuSHAav7IP5mtfZ
	qnXCdLXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzQE-00000006QhM-2L2W;
	Mon, 17 Aug 2026 15:38:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzQD-00000006Qh2-0OHE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 15:38:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 870A3601DE;
	Mon, 17 Aug 2026 15:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC3131F000E9;
	Mon, 17 Aug 2026 15:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786981124;
	bh=4DmfPql4Th1/vGMYBr32DIZj6vWMe6ET+S2DBK064HU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Cs1GQ4lhenmtLERGetrlLm8k7B7iCtyZCHfMgAdMXMfkB3Os/bImTxpKNa10jBohw
	 s/OTAwSFCcsRi/tha4PZGLrlAkZ3tx3nsAIGFxwZNMdakiXMk/zns7cPsnZOWgjk9R
	 NMflDRPkx6t+B9zz479DHK60b+uA3jknk8Krl/73Cc1DWRqlrr66Ymo0YZ1ljBGDM/
	 pHl/dOsm12cPJH2rqOLYvujCLys0nwVXYnapK6/c7w6BCB16yP+hBm70by4NsDTODU
	 fppVzzPAosh6D/K0dgCQ2Hyk5IeakDk0LqHo6AuZrnO76N6HsKyXGTikvZiEockVuX
	 a5Pi14xUCxUIQ==
Date: Mon, 17 Aug 2026 08:38:43 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: netdev@vger.kernel.org, dinguyen@kernel.org,
 maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] net: stmmac: dwmac-socfpga: Enable
 multi-IRQ when per-queue IRQs present
Message-ID: <20260817083843.219a0f45@kernel.org>
In-Reply-To: <20260817074221.27459-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260817074221.27459-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
	<20260817074221.27459-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
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

On Mon, 17 Aug 2026 00:42:20 -0700
muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> Subject: [PATCH net-next 1/2] net: stmmac: dwmac-socfpga: Enable multi-IRQ when per-queue IRQs present

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

