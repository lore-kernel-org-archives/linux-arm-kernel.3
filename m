Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9C7C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 11:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CucQxAMz4q00rKoqMFkXW/rTlFZs/81VWM2dWuS9iPE=; b=KTnREkGbJ8wJzOvhDYbgrFvlU0
	5QTeCutnah6grvpkgMIQiwcEDc43oKysbmtME1KK0Og9ZGTJxLWOXzD4mvfwSMPwISMMZy1R4KBnH
	IfiiRB9DUd9cuboxCD5yMGFE4LaTvJkPl44JWLUNg59yKBF4TYU9kEAwOtL3KCC9EXcaoAk/PoPv9
	2rPgk7w/AnCMJHnNyOpl2h4atVvuNxGhyN8hSUTCAEFEuGDN6leHXvJyGZsWdHuaXbUzp3aHao/c3
	IKOgFWTjs3WsaSuDTyOQ8m0Fh9DrxDlzDs3sGTO8qSvnECsz94qCiiSZ+wqXwr4FmPUeslTmKQ4Yb
	0sIirsqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu8Pz-00000002LyC-2JTr;
	Mon, 17 Mar 2025 11:14:03 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu8Lx-00000002L7m-0W2l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 11:09:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CucQxAMz4q00rKoqMFkXW/rTlFZs/81VWM2dWuS9iPE=; b=L3ANOjmC4JYjNEDTGSFlYSj+EY
	lDMUKIAPuul1T4GUZ6puKUkV8BzHq5WJJG6+uQGshRelm43SbzWOXlnmp3+t9vl5U/CCIqrkoFocf
	0CLTtY4lXl6Aov3FiPFUso512czcMF1HO/Kfq/XAlzRMnW/HXJL2jAIjFrAL1OAvRukC77bqdyIAv
	vnzXTJERSI/rnvJZYtJBQUhNFNs9z9CSA7BH9VOZ2jnPlNjMcvT0nKfMAOf3fOK49uAvKalEejjFu
	SziT/8P/6JFZWVLYKFbO8dKi4HTjASat0y9ujjRXOzcAOdpA22UH87wRqpGq1Z7yFEyP30SG71LHf
	YJq6KtAQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59148)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tu8LT-0003PO-0x;
	Mon, 17 Mar 2025 11:09:23 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tu8LL-0003W9-0k;
	Mon, 17 Mar 2025 11:09:15 +0000
Date: Mon, 17 Mar 2025 11:09:14 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Jacky Chou <jacky_chou@aspeedtech.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	ratbert@faraday-tech.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	BMC-SW@aspeedtech.com
Subject: Re: [net-next 4/4] net: ftgmac100: add RGMII delay for AST2600
Message-ID: <Z9gC2vz2w5dfZsum@shell.armlinux.org.uk>
References: <20250317025922.1526937-1-jacky_chou@aspeedtech.com>
 <20250317025922.1526937-5-jacky_chou@aspeedtech.com>
 <20250317095229.6f8754dd@fedora.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317095229.6f8754dd@fedora.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_040953_159690_32412529 
X-CRM114-Status: GOOD (  12.35  )
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

On Mon, Mar 17, 2025 at 09:53:33AM +0100, Maxime Chevallier wrote:
> So this goes completely against the naming of the property. It has the
> -ps suffix, so you would expect to have picoseconds values passed, and
> not an arbiraty index.
> 
> Take a look at other drivers, you should accept picseconds values from
> these properties, then compute the relevant index in the driver. That
> index should be something internal to your driver.
> 
> An example here :
> 
> https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_rgmii.c#L51

Another example would be drivers/net/phy/adin.c::adin_get_reg_value()
and associated functions - these lookup a DT property and then look
that up in a table to convert it to a register value.

I suspect that's something which could become generic, as I suspect
most hardware isn't going to accept a picosecond value, but be a
choice of N different options.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

