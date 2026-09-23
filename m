Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAC0C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 00:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KbqWqmQzqJ0KcYvjL3DybqekU4MQKHRA2UF8b+yGbE=; b=AhDvndUWyyEQKb85AHchy+fUMD
	sOIuc987ilpit6HJ9mwjBHgVY72cXKzQMslSGUdoBOgQGWyk7llhMgVMxcQquogd5dPqap3amxR0I
	p7NdjpY2qzbTMG3Q28mNJJNKb0inubj9JXuAPsYuaYS9OqccCh6HwQ8aABj383tXHvcu1n+of4PaC
	vb2sJn63gqCBrmnHEPefOjzxccbFZGv+PfGqcQoGdeb7j5oeUH3BWRRUuGuqnma3Mei+j1PREBQv3
	uiReULHbtHMSWVep74xuk0bxki6u2CcffDKFLKZJv437pkLYf0j8se8d5qdOXppOIbYpRrp6wpwXv
	QCFj9KSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9AnU-00000006n5n-3IPd;
	Wed, 23 Sep 2026 00:25:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9AnU-00000006n5X-149v;
	Wed, 23 Sep 2026 00:25:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A49FE42A40;
	Wed, 23 Sep 2026 00:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A091F000FF;
	Wed, 23 Sep 2026 00:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790123115;
	bh=7KbqWqmQzqJ0KcYvjL3DybqekU4MQKHRA2UF8b+yGbE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Xd28X2XeSPP+Rn/cZCMrm77oAKf+Sdr+oWN4XQjNJetJjdSXcrVLA2EMQNHNzF/vC
	 YEN1rZ4QkAWRRFVbUzxSj5mES14BeichIdqMAIHeASVf12HVOf+ImWO7/+n9Q13T2c
	 lGZyHUI7DH4L2oQVKcKIifsSxcFYnDa6a2dvGpfCQLIjX9neqF1bI12IZ9vWCbBVKQ
	 T9/Mqb2aXlIvFIAh+I7SjIzEkc/gSU6Tz1LoXi7NqiwdleXHtEJxToHizU/keS1g7M
	 t43TDDSymi6bkLvRmnJnZNc1WZPix156+fOJQ5r/8i0Er6RQyUvrrJRjlXpqHT4cOP
	 nVy46neei02PQ==
Date: Tue, 22 Sep 2026 17:25:14 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Heiner
 Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Philipp Zabel <p.zabel@pengutronix.de>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH net-next v16 00/12] net: pcs: Introduce support for
 fwnode PCS
Message-ID: <20260922172514.7feb6e7c@kernel.org>
In-Reply-To: <CA+_ehUwy9RUKCCHDnqoED3AMVnErgGr9RCrCR4ceg5QONq1wOQ@mail.gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
	<20260921135933.7e8857ba@kernel.org>
	<CA+_ehUwy9RUKCCHDnqoED3AMVnErgGr9RCrCR4ceg5QONq1wOQ@mail.gmail.com>
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

On Tue, 22 Sep 2026 12:12:56 +0200 Christian Marangi (Ansuel) wrote:
> The remark on the fwnode patch are invalid. The driver is expected
> to return those error as probe defer is not supported.
> (a notifier and late attach/detach is used to align to phylink logic)
> 
> For the specific Airoha PCS driver it's really speculation from the AI
> but HW doesn't work as described by AI.
> 
> The only real comment that is valid is about the alternative way
> to give supported interface with the .get_capabilites OP.
> 
> This is currently not supported as there isn't any user and it will
> be implemented as soon as there will be one. It's really to limit
> the patch delta of this change and to progress further.
> 
> Maybe FIXME might be suitable?

FWIW no preference here, I defer to the human reviewer.
We can treat the AI review as a hint if human reviewer thinks the code
is fine as is.

