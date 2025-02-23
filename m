Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E202C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 11:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NgBWyniUF/OIJUlHK2K7BrSpGMn7fltVSGcDSX0c/GY=; b=t//wca6q6jhnJitRtiGZ78ZZzc
	2GrEOWf1eXVGnP5nK8klGuYzbWUutLSHh1yURYaHzttyPxF+jyPYvQbSt+pehmSyNW0850b2Sxkok
	IJn0c/vZGYthppmrLmbaKrsDvUSDJohuZpp3a+IjwL8g4X4TLiPr8o3ESv8g6QfBHVcnE9Z3Nr/CN
	JCRRzR8ZwJ/5+fw5T+/6kmrjp6xIdBAPKn3OuwvsRInYpYuz46zAxg7HgTL2tv6fNTmnCNkuy3Im3
	SLoFfD4j4eBR44IePcMrq4sO9Ai7almXWdpnjLgKgGIwj2UsJDbkIRHw9E5R03uM4T6QJpvKROhAy
	KlKPti3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmARO-0000000B0wL-2hoE;
	Sun, 23 Feb 2025 11:46:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmANc-0000000B0EX-1hH7;
	Sun, 23 Feb 2025 11:42:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NgBWyniUF/OIJUlHK2K7BrSpGMn7fltVSGcDSX0c/GY=; b=FIAYQaLjg14eiUynjgEta+jcV6
	ncxKfDn7c5vT5jHvjLpNKBzxSR2LuYPX5WP+/lc2+LAqfFPlpt7Qs4BD2AwPzTyEXn/UpwVRDUZB3
	/MRe/uM63FmDNZdf5bVjldLKiOO1nIkxngExo/E4aGlwssrsJ5oRcJc73KZviwtFnlzarbFIpvB7p
	6AltjBZbgtnoHheNlX2hixabQQ3/c4pvYzicE+QOJ/cthdCVawlAKTjsC0HSNUB8kgr1FexuYxrVE
	tvEw6B+danCezT63cQdu8rdfSQ/T23RYTBcHT9sAi6W1Hp8G/z8cU5awaH0e5pWTXn66r9afrOw1U
	y05zJiOw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54522)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tmALM-0002rw-1T;
	Sun, 23 Feb 2025 11:40:20 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tmALG-0003y2-2N;
	Sun, 23 Feb 2025 11:40:14 +0000
Date: Sun, 23 Feb 2025 11:40:14 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Joe Perches <joe@perches.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
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
Message-ID: <Z7sJHuiqbr4GU05c@shell.armlinux.org.uk>
References: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_034240_453693_E1234916 
X-CRM114-Status: GOOD (  18.48  )
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

Adding Joe Perches.

On Fri, Feb 21, 2025 at 02:15:17PM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> This series cleans up the thead clock rate setting to use the
> rgmii_clock() helper function added to phylib.
> 
> The first patch switches over to using the rgmii_clock() helper,
> and the second patch cleans up the verification that the desired
> clock rate is achievable, allowing the private clock rate
> definitions to be removed.
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c | 28 ++++++++---------------
>  1 file changed, 9 insertions(+), 19 deletions(-)

I've been investigating why the NIPA bot complains about maintainers
not being Cc'd, such as for patch 1 of this series:

https://netdev.bots.linux.dev/static/nipa/936447/13985595/cc_maintainers/stdout

I think this is a bug in either get_maintainers.pl or the NIPA bot.

On the bare patch without any Cc: header added:

$ scripts/get_maintainer.pl 0001-net-stmmac-thead-use-rgmii_clock-for-RGMII-clock-rat.patch
Drew Fustini <drew@pdp7.com> (maintainer:RISC-V THEAD SoC SUPPORT)
Guo Ren <guoren@kernel.org> (maintainer:RISC-V THEAD SoC SUPPORT)
Fu Wei <wefu@redhat.com> (maintainer:RISC-V THEAD SoC SUPPORT)
Andrew Lunn <andrew+netdev@lunn.ch> (maintainer:NETWORKING DRIVERS)
"David S. Miller" <davem@davemloft.net> (maintainer:NETWORKING DRIVERS)
Eric Dumazet <edumazet@google.com> (maintainer:NETWORKING DRIVERS)
Jakub Kicinski <kuba@kernel.org> (maintainer:NETWORKING DRIVERS)
Paolo Abeni <pabeni@redhat.com> (maintainer:NETWORKING DRIVERS)
Maxime Coquelin <mcoquelin.stm32@gmail.com> (maintainer:ARM/STM32 ARCHITECTURE)
Alexandre Torgue <alexandre.torgue@foss.st.com> (maintainer:ARM/STM32 ARCHITECTURE)
linux-riscv@lists.infradead.org (open list:RISC-V THEAD SoC SUPPORT)
netdev@vger.kernel.org (open list:STMMAC ETHERNET DRIVER)
linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE)
linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE)

If I add those maintainers to a Cc header in the patch file (as it would
be if NIPA runs on the unmodified received email), and then re-run
get_maintainer.pl, then:

$ scripts/get_maintainer.pl 0001-net-stmmac-thead-use-rgmii_clock-for-RGMII-clock-rat.patch
Drew Fustini <drew@pdp7.com> (maintainer:RISC-V THEAD SoC SUPPORT)
Guo Ren <guoren@kernel.org> (maintainer:RISC-V THEAD SoC SUPPORT)
Fu Wei <wefu@redhat.com> (maintainer:RISC-V THEAD SoC SUPPORT)
Andrew Lunn <andrew+netdev@lunn.ch> (maintainer:NETWORKING DRIVERS)
"David S. Miller" <davem@davemloft.net> (maintainer:NETWORKING DRIVERS)
Eric Dumazet <edumazet@google.com> (maintainer:NETWORKING DRIVERS)
Jakub Kicinski <kuba@kernel.org> (maintainer:NETWORKING DRIVERS)
Paolo Abeni <pabeni@redhat.com> (maintainer:NETWORKING DRIVERS)
Maxime Coquelin <mcoquelin.stm32@gmail.com> (maintainer:ARM/STM32 ARCHITECTURE)
Alexandre Torgue <alexandre.torgue@foss.st.com> (maintainer:ARM/STM32 ARCHITECTURE)
Paul Walmsley <paul.walmsley@sifive.com> (supporter:RISC-V ARCHITECTURE:Keyword:riscv)
Palmer Dabbelt <palmer@dabbelt.com> (supporter:RISC-V ARCHITECTURE:Keyword:riscv)
Albert Ou <aou@eecs.berkeley.edu> (supporter:RISC-V ARCHITECTURE:Keyword:riscv)
linux-riscv@lists.infradead.org (open list:RISC-V THEAD SoC SUPPORT)
netdev@vger.kernel.org (open list:STMMAC ETHERNET DRIVER)
linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE)
linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE)
linux-kernel@vger.kernel.org (open list)

Note the addition of Paul Walmsley, Palmer Dabbelt and Albert Ou that
was not in the original.

It seems that K: is fed everything in the file, including all headers.
In the second run, the addition of the linux-riscv@lists.infradead.org
mailing list in the headers then causes a subseqent run of
get_maintainer.pl (and nipa's run of get_maintainer.pl) to then match
using K: riscv in the "RISC-V ARCHITECTURE" entry.

So, it seems running get_maintainer.pl on an email received from
mailing lists without first stripping many of the email headers can
lead to false K: matches.

This makes NIPA's cc_maintainers test unreliable.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

