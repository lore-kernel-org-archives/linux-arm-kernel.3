Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A724FF513E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 20:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEpYJNZFtz9B/pHhKHhy3x4ZNPm/kdA6HWB88/fNLBg=; b=FE89p2TSCMi/u8idQPT1v+0WVb
	1HurfOptVytHnhnOx/4b4e8UGZsUdsQokuePVULjZUyGyK107SJcTrL776cMolOZg4sWTBdi7zre0
	Rr4KUQPawtavsoRododEvpXn5iG0vL9FxPzcIs7z2wONmV+cVzYocbyrE3zMhQHaS1kCxqBkS0dwv
	OTUMDPFKGSBoP9ZToepHS5tIjsmr98IfAJtTFkxZ1sosMU269ZHiVL+fGCUVJK9DicnXlDIgbh2ax
	PLN+RUi3bbcXkasgks6AbtrxAhrUeWQ80Qsg8TmwYlyE+3bzfOLTHxz9jILGredl9Ox8BO7a69zoK
	q2ZNaPMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wADHM-00000007mXJ-0l66;
	Tue, 07 Apr 2026 20:44:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wADHK-00000007mW8-2xps
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 20:44:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5B5C600CB;
	Tue,  7 Apr 2026 20:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12689C116C6;
	Tue,  7 Apr 2026 20:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775594645;
	bh=ds5g5d0oS4MQyIT0BsNumaIh8fLF8x9rw6OQMpQU+uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uHhCe4tPmGbkZTpZN9Rrs8D9dJOiIv2+bHWFiMZ05TIVDwiWNoTVOdsISivUCHNdY
	 uCuf/fSBK6RrsOStoyi2Okr5nk4MOznSQj10P3JNd/6irEulWYqNBPnKslaDUQIJ3f
	 Hj+V7I+uJcQFzJAgHHV+lrK9Gb8PQDExW7z4fv93cQW++Ewq9qBpP2QPRoWGq0l6Et
	 /r7HB6hAI23z8VWUxp+IfNQ/IyUTqRyP1I0y1UyTHm5Jv28gWGNiAAO2XFgdEKBAc0
	 y5vUDrgnoN632A0GrlK152WVlrb87NPl6IEJCSqpqS1eBli2miQHa6Za+VbO/ZGA8h
	 fBG0bbMHEtcfQ==
Date: Tue, 7 Apr 2026 15:44:02 -0500
From: Rob Herring <robh@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v28 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and enable-dma properties
Message-ID: <20260407204402.GA3641251-robh@kernel.org>
References: <20260330-upstream_i2c-v28-0-17bdae39c5cb@aspeedtech.com>
 <20260330-upstream_i2c-v28-2-17bdae39c5cb@aspeedtech.com>
 <20260331-fanatic-certain-bustard-fb13bc@quoll>
 <TY2PPF5CB9A1BE6F267C60EEC34B6A75400F253A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <09cbc12bea5707f794e139ea1bfafac82c2d2c12.camel@codeconstruct.com.au>
 <TY2PPF5CB9A1BE6EA5BABE55EB8A7003D22F253A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <72517fcf99a7453841ee75243dc54e735c10238f.camel@codeconstruct.com.au>
 <TY2PPF5CB9A1BE64B7988CD85A7189164E1F253A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY2PPF5CB9A1BE64B7988CD85A7189164E1F253A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
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

On Tue, Mar 31, 2026 at 07:30:58AM +0000, Ryan Chen wrote:
> > Subject: Re: [PATCH v28 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add global-regs
> > and enable-dma properties
> > 
> > Hi Ryan,
> > 
> > > > Sounds reasonable, but before you do so, how are you planning to
> > > > manage the allocation of DMA channels across multiple i2c peripherals?
> > > >
> > > The AST2600 I2C hardware has only one can use DMA at a time.
> > > To avoid the complexity of managing DMA channel contention, I plan to
> > > use buffer mode by default for all controllers, which still provides
> > > better performance than byte mode without requiring DMA channel
> > allocation.
> > 
> > OK, but your wording there ("by default") implies that DMA is still selectable
> > for one controller peripheral. In which case: you still have the problem of
> > managing DMA channel contention, but now it's at runtime instead.
> > 
> > So my question still stands: how are you planning to enforce that DMA is only
> > enabled for one controller?
> > 
> > Or are you planning to disable I2C DMA entirely on AST2600?
> Yes, This is my intent to do.
> Disable I2C DMA entirely on AST2600.
> If I remove DMA, should can I keep byte and buffer for sysfs? 

28 versions and it's still not clear when you need what mode. Sigh. The 
only thing better about sysfs then it's not my problem, but that really 
doesn't sound much better.

DMA is only going to be useful for transfers above a certain size. If 
you are doing the typical SMBus style register accesses, then DMA is 
completely useless. The setup DMA overhead is going to be greater than 
just directly reading/writing the I2C controller FIFOs. What's the size 
that makes DMA useful? 16, 32, 64 bytes? Something greater than the max 
size in buffer mode probably. Really, provide some data that DMA gives 
better performance and/or less CPU usage. If you set some minimum size 
and request DMA only above that size, is there really that much 
contention? If there's some specific device that really needs DMA, then 
make that device's driver request it and reserve it. 

For byte mode, there's not a clear need nor description of why. Someone 
once long ago asked for it... Who cares, if they really want it, then 
the issue needs to be described. If a certain device requires certain 
timing that byte mode provides, then that should be some property the 
driver for the device communicates to the controller. No need for DT 
nor sysfs in that case.

Rob

