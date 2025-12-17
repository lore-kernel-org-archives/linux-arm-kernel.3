Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8622D65559
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 13:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+oOef/TXOrRIwhDHwBDJLYPwMvf9m53lk4KQvN4U2m4=; b=PrOyq1F2uiw4egVVRihwaOJQCN
	DDDnNztVXnw/R/RyXtQ6QjJWC7pyP8TR3sdV5Z7g1CsfhI73wynXWtIvFbB1SDWc7x0YJfwPYseYn
	gs4yUwa+Skhui68e9C9epQeA6qRRKjc3B69gFltdzZi7+bxZnNoqhTLy2NwVX5JDfC/F+Bvp5VGB9
	mBSdivsSbvmtHbnezT7OY43DKLJrXSmW9e8TiT2siBi/1HNh5t8O0O76s+qktP6uyrXmzEZZXa9t2
	zl4f8QNk+1wz9gtuHI1LM1k3/NN11soErWFE5VbjDXjxtsykjWzihE8TpZu5Ws5/jdy+/qtVPm6Bk
	NUBjM4vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrW4-00000006qhr-2ulA;
	Wed, 17 Dec 2025 13:24:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVrW3-00000006qhk-27FV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 13:24:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 812F6601A5;
	Wed, 17 Dec 2025 13:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F5AC4CEF5;
	Wed, 17 Dec 2025 13:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765977870;
	bh=S4mO0XF+32E7SFhkQwowz/nXG8YSqhpXqW4U5Y8ZoMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nbny4sEAa3vtjAV51VCdRhWNa3o885gFfxTIyISmrDt3HSxaTS3uTncYjewmC2+SJ
	 FoiodPOp8/dKAZn/a4e5o7la/5iqh4pYt5+7+hl3i2nAPSjysY/eF9WqnI8vOilh4e
	 BKiZFGXmZl4A/J36w6g2xZo2FwivWFSzXC/4Qdoc=
Date: Wed, 17 Dec 2025 14:24:27 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Roy Luo <royluo@google.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Joy Chakraborty <joychakr@google.com>,
	Naveen Kumar <mnkumar@google.com>
Subject: Re: [PATCH v9 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
Message-ID: <2025121728-reliably-crabgrass-2601@gregkh>
References: <20251205-controller-v9-0-9f158b18f979@google.com>
 <20251205-controller-v9-2-9f158b18f979@google.com>
 <2025120553-suffrage-divisive-5890@gregkh>
 <CA+zupgzL7v5MZDpxKDQQCqAZaqTdHbiG9-xTr+8RnigMFZJ_7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+zupgzL7v5MZDpxKDQQCqAZaqTdHbiG9-xTr+8RnigMFZJ_7Q@mail.gmail.com>
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

On Thu, Dec 04, 2025 at 11:14:39PM -0800, Roy Luo wrote:
> On Thu, Dec 4, 2025 at 10:05 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Dec 05, 2025 at 02:26:38AM +0000, Roy Luo wrote:
> > > +config USB_DWC3_GOOGLE
> > > +     tristate "Google Platform"
> > > +     depends on ARCH_GOOGLE || COMPILE_TEST
> >
> > There is no ARCH_GOOGLE in the tree now, so how is this supposed to
> > work?  Shouldn't tools that check for "invalid config options" trigger
> > on this?
> >
> > thanks,
> >
> > greg k-h
> 
> Hi Greg,
> 
> The menuconfig looks like the following and it doesn't complain:
> | Symbol: ARCH_GOOGLE [=ARCH_GOOGLE]
> | Type  : unknown
> |
> | Symbol: PHY_GOOGLE_USB [=y]
> | Type  : tristate
> | Defined at drivers/phy/Kconfig:104
> |     Prompt: Google Tensor SoC USB PHY driver
> |     Depends on: ARCH_GOOGLE || COMPILE_TEST [=y]
> 
> According to Kconfig documentation [1], the unknown symbol
> would simply be evaluated as an "n", which is what we want.
> "Convert the symbol into an expression. Boolean and tristate
> symbols are simply converted into the respective expression
> values. All other symbol types result in ‘n’."
> 
> In a different Kconfig documentation, an environment variable
> "KCONFIG_WARN_UNKNOWN_SYMBOLS" is there to detect
> undefined symbols in the "config input", but I can't find one that
> catches undefined symbols in the Kconfig tree itself.
> 
> That is, the tool seems to allow this.
> However, if this turns out to be a major problem. I think we
> can either:
> - Remove ARCH_GOOGLE and leave COMPILE_TEST as
>   the only dependency. Then add ARCH_GOOGLE back
>   later once it's in the tree.

Please do this.  I do not want to take patches that purposfully add
dependencies on config options that might, or might not, appear in the
future.  Please just remove all of the dependancies for now, as they are
not needed, right?

thanks,

greg k-h

