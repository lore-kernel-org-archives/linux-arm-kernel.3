Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08968E81BCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 14:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3FEHIqnlVQGDIeCCVkCWIEHhxVvsQXBX8o/GwIQwb+4=; b=xmcvvUEAyc3vwq6twXwAFfonKw
	lIHL3YIotiQNYb6v7XWAClcUkuSf3zSCmE106WgkQU5Sp4EX/66mGqRFlCWROqJOhr/diZwU6Zfba
	72Tb1yN+UP/iPO2F/hg1bY2qNzl/bDkNppkr05U82IoBAlC2iyNSCUzM6VLAwUbgCCuCOoFaV7v0A
	Uk9H+H/COixNfmMKqL9tM/Mp42ZQrLQv2IfgRTzWEA81o8QIJulb9Rks4se57Z6a53bLHB1GwM/Xr
	N5tHWAEzjKJs5Ww8TcqgHED8KquoOvNwiJSWnCzgz3VBVtXzjbeLG6fqgJc4MzaiZY+6Nj61G3Wia
	67bZcUCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSIw-0000000FVom-2syf;
	Mon, 09 Feb 2026 14:31:58 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSIt-0000000FVoO-0dMZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 14:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3FEHIqnlVQGDIeCCVkCWIEHhxVvsQXBX8o/GwIQwb+4=; b=havwzuU+gFRpmOt8zaZ9DARYnV
	qy+xhoaKLehLHlMADlWczRDlSsf7jrhBbO1SPWGhu3+pDdk3741dtNzTThCMY2jcLebZir0mi4QtU
	NF8pVx6ssEXisYtJqflNSrr8x1UO0cER/QR+yIvCQuSLBUQcr8Vc3Fjt9D33zDUHXwL5mqFoC4eE4
	9WtuI3L4g9N0b3yhrlRohc7aURcYMHVz8mdvGN+E0bXxN5U8nOIMuk9V+owKOF7AeUE7dSsitZWiY
	AhGuNdKhSyHUdJUBzR9jLRDN81Vk+HqhMecuWXiDccE5UAY4ZbMlbmZtkskMvQ4MW66qkBzKWY1Wr
	8rN4vv4w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41268)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vpSIX-000000001eG-13e5;
	Mon, 09 Feb 2026 14:31:33 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vpSIS-000000001qf-1VCk;
	Mon, 09 Feb 2026 14:31:28 +0000
Date: Mon, 9 Feb 2026 14:31:28 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: lizhi2@eswincomputing.com, Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com
Subject: Re: [PATCH v2 0/2] net: stmmac: eic7700: fix EIC7700 eth1 RX
 sampling timing
Message-ID: <aYnvwAK3gpxBs-EF@shell.armlinux.org.uk>
References: <20260209094628.886-1-lizhi2@eswincomputing.com>
 <64bf6b40-b947-4ffa-8d48-4d6341931327@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64bf6b40-b947-4ffa-8d48-4d6341931327@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_063155_266311_4583B2E9 
X-CRM114-Status: GOOD (  10.43  )
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

On Mon, Feb 09, 2026 at 02:36:11PM +0100, Andrew Lunn wrote:
> On Mon, Feb 09, 2026 at 05:46:28PM +0800, lizhi2@eswincomputing.com wrote:
> > From: Zhi Li <lizhi2@eswincomputing.com>
> > 
> > v1 -> v2:
> 
> For version 3, please include a patch to the SoC .dtsi file adding the
> Ethernet nodes. We like to see users of code being added.

In addition to Andrew's comments, before posting another series, please
review https://docs.kernel.org/process/maintainer-netdev.html,
particularly sections 1.4 and 1.6.1.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

