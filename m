Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9494FC98304
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 03:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yOJh0eCTzfxNXI+TRaeMXyYRrETomL0HV5x6uXBq+2Q=; b=n8PavRSC2ABEd675gmZDjWi35P
	htSUhSIgkueYY3qEiyf3kaYKmppcEe/aP+AjuTO/sA1OLNfbURecHUwjRTnuH9uwVNMWCnpEtoeIy
	swwrLAt0SeP0/MKwRuMFbEwUsriLptS0FAD/6ujgJPgXWKMZ+U22SjRTE27xKa4NFHR6NTUZB6ASA
	ZmO8EbKPiXNIwKO5pK1P9XjCE3+tQ8H1OuWw0tDpCViWMP/v+pMIh/J3T2Fr5kq630dcEy8Opu3B1
	hYTLhW86XKJBuxCPNI+STDbMVzQZ3jHS3rOW+ZludYD3lcCVV3uEttHg+C7uxN7Ri/+fpNKkJ+aMd
	rqqy4GhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ZsP-00000009v15-2ZDd;
	Thu, 24 Sep 2026 03:12:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ZsO-00000009v0c-20CE;
	Thu, 24 Sep 2026 03:12:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E056141994;
	Thu, 24 Sep 2026 03:11:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64EC1F000FF;
	Thu, 24 Sep 2026 03:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790219519;
	bh=yOJh0eCTzfxNXI+TRaeMXyYRrETomL0HV5x6uXBq+2Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Us9LZqfCtcMwM9yQLKsLJCqfOiy1JcstDdI6c8Hw3ut6FEMnOgUfYWARod9EI0fIS
	 JI7x62ld/o20JdRnWb22g644RThdwsuqVYbcIlQxxRzFst6qTtJFi8j4h9LPIh09dO
	 ixHBrbNRHjn7cr1XAoinktF0r0IC53cleUDkpNp5OnuR1UmPUb35z6ep9OsfTQaOLK
	 KPZa9EYl/7gdmrO7vICqjG+aFx/+48JV2cMcjuBGtdSr9aWpRA2uhIMjHzOJNCT6wo
	 1Ce3MqhA/qjE+e0QAFLn1zWIUjmK/SF2Me7LX/iyDYJuYj/fpUtSj+R4jrsIZTrN2G
	 Hnu5cSx5dfqHw==
Date: Wed, 23 Sep 2026 20:11:58 -0700
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
Message-ID: <20260923201158.3552915a@kernel.org>
In-Reply-To: <CA+_ehUyFKZzd0uP4akgZxaLLJTwcvGGKz5ppCYsB++fn92Dn9w@mail.gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
	<20260921135933.7e8857ba@kernel.org>
	<CA+_ehUwy9RUKCCHDnqoED3AMVnErgGr9RCrCR4ceg5QONq1wOQ@mail.gmail.com>
	<20260922172514.7feb6e7c@kernel.org>
	<CA+_ehUyFKZzd0uP4akgZxaLLJTwcvGGKz5ppCYsB++fn92Dn9w@mail.gmail.com>
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

On Wed, 23 Sep 2026 10:31:49 +0200 Christian Marangi (Ansuel) wrote:
> Il giorno mer 23 set 2026 alle ore 02:25 Jakub Kicinski
> > On Tue, 22 Sep 2026 12:12:56 +0200 Christian Marangi (Ansuel) wrote:  
> > > The remark on the fwnode patch are invalid. The driver is expected
> > > to return those error as probe defer is not supported.
> > > (a notifier and late attach/detach is used to align to phylink logic)
> > >
> > > For the specific Airoha PCS driver it's really speculation from the AI
> > > but HW doesn't work as described by AI.
> > >
> > > The only real comment that is valid is about the alternative way
> > > to give supported interface with the .get_capabilites OP.
> > >
> > > This is currently not supported as there isn't any user and it will
> > > be implemented as soon as there will be one. It's really to limit
> > > the patch delta of this change and to progress further.
> > >
> > > Maybe FIXME might be suitable?  
> >
> > FWIW no preference here, I defer to the human reviewer.
> > We can treat the AI review as a hint if human reviewer thinks the code
> > is fine as is.  
> 
> Soo should I send v17 to fix AI that failed review?
> I think I didn't got this detail.

Sounded like Maxime was planning to take v16 for a spin.

