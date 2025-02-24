Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A619C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 09:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTALlKbSKJ0pfCW0bKggFYFpg7EFYynYFxwssKh+C9Q=; b=d5eNJEctJXV4EHGQ9uPHerhs58
	EXMg9+NxqfWD0jWbreBpxhahXNU0U5fhY0y84GjTdNFw0mDJZ40DVJWU+Y4vOrNDDv0P9FkUUdDaf
	70OSEFfPOzGB1PuEtHVBA07DRxM7sbM9iS7J87RNjeGpgA5kO/X6pNiu8V9Jy6ZBZrNzgTRJ4MOvW
	4WTYxj/rkOgOkSujjv/ba58/xmD2RXj9bEjMkEvcvEdet+UA3fjBtEqNLU4Q7YGpukmIdE9/qV8DY
	K80soO08EDfe6HM2moYOcFZpbKI6NexizUOjTUkMZQRBnNWWz/vXnDv20PTPp7PdI9ryDCKkFkxWo
	+AO8ayWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUpo-0000000Cw2j-1Za6;
	Mon, 24 Feb 2025 09:33:08 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUT3-0000000CpZz-2RMX;
	Mon, 24 Feb 2025 09:09:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pTALlKbSKJ0pfCW0bKggFYFpg7EFYynYFxwssKh+C9Q=; b=k2mfxxUsJMg20o414L508A20Sz
	IsMmCXwHj9Pve7EakuteAeW2Mijmx7tgNQvJFjEMhorcIp13CSNZUzKt7Sw/+drbSmQypPhFIjkzH
	zSL/HW3fMprv+bGoQucs7FWZUZLr/RMkNONqdbRoDhV5EI89H9aB0fCgWH5dUQcANxgEmiOVsLKAz
	Tysehk9IQp3OMgJLLqPeUuhrLaLXDkHr36NrY34n0hTZqRyIN8OlWEoVVqktJ84ZrUAnZHGM2puSo
	h+If2Gf1Ilku7oFCtXW2jEi1cWQQod7w61T/fqr2D7bPOCjw2noB8r+UstUy4m8wsDIb5gDNbE7V+
	gJemzfpw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53832)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tmUSs-0005bT-1N;
	Mon, 24 Feb 2025 09:09:26 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tmUSo-0004sM-28;
	Mon, 24 Feb 2025 09:09:22 +0000
Date: Mon, 24 Feb 2025 09:09:22 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Joe Perches <joe@perches.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <drew@pdp7.com>, Eric Dumazet <edumazet@google.com>,
	Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 0/2] net: stmmac: thead: clean up clock rate
 setting
Message-ID: <Z7w3QhcYhrzQk_5K@shell.armlinux.org.uk>
References: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
 <Z7sJHuiqbr4GU05c@shell.armlinux.org.uk>
 <7bf9577f4b6dcb818785be73c175bcd19b3b4f0c.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bf9577f4b6dcb818785be73c175bcd19b3b4f0c.camel@perches.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_010937_631348_01B0EA87 
X-CRM114-Status: GOOD (  21.51  )
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

On Sun, Feb 23, 2025 at 06:33:44AM -0800, Joe Perches wrote:
> On Sun, 2025-02-23 at 11:40 +0000, Russell King (Oracle) wrote:
> > Adding Joe Perches.
> > 
> > On Fri, Feb 21, 2025 at 02:15:17PM +0000, Russell King (Oracle) wrote:
> []
> > I've been investigating why the NIPA bot complains about maintainers
> > not being Cc'd, such as for patch 1 of this series:
> > 
> > https://netdev.bots.linux.dev/static/nipa/936447/13985595/cc_maintainers/stdout
> 
> Additional maintainers added or missing?

Let me be clear - NIPA is not something under my control. It is a bot
run by Jakub on netdev patches that are received by patchwork - so
patches that have been emailed out, and thus contain at least the
To:, Cc: and Subject: header lines, possibly all header lines that
have been added such as Received: etc. I don't know what it actually
does.

Now let me restate the problem, because the answer to your question
is in the problem description. Here's the short version:

	K: entries match email headers.

Here's the long version:

If one runs get_maintainers.pl on a patch produced from git, it
comes out with a list of maintainers. In the case of dwmac-thead.c,
this includes an email address that contains "riscv".

If one adds this list of maintainers to email headers in the patch
prior to sending it out and then re-runs get_maintainers.pl on it,
or if one receives the patch after it having been emailed out, and
then runs get_maintainers.pl to validate that all appropriate
maintainers were sent a copy of the patch, then get_maintainers.pl
comes out with *extra* *additional* maintainers because the "K: riscv"
line matches *email* *headers*.

In this exact case of dwmac-thead.c, the first run prior to sending
out reports an email address containing "riscv". On these subsequent
runs with the maintainers added to email headers, the presence of
"K: riscv" in MAINTAINERS causes get_maintainers.pl to report the
three maintains for the "RISCV ARCHITECTURE" entry.

This is an issue for you as get_maintainers.pl maintainer and Jakub
as NIPA bot author to hash out - either get_maintainers.pl is
acting incorrectly and needs to be fixed, or NIPA is abusing
get_maintainers.pl in a way that it's not designed to be used.

I'm merely an observer of this behaviour and am merely reporting the
problem - that NIPA's cc_maintainers claim that maintainers were not
copied in my patch submission is incorrect and I've done the research
to identify _why_ it's incorrect. It's now up to you two to decide
where the problem lies and what the solution should be.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

