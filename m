Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211F4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 10:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qocm7lZy1PSubNMeLekwbSHczdGmHwJjp8Gc0zSDJMs=; b=NAOuClMrohVuXrxZy3JSIvhfPv
	Oz4QbBtfIeJtG0q9OBTI6Bjxpyjpl7m6N9Mn1DWy2qYfhBkxtSTtYIHskJelB5JjxeHo2CnlijNBZ
	OlDyBuyEke2AeVTO4vpyKqUf/5WXQQCv47SE34fmk+6Ab7HgEugvxAFiUqJoEdPP/wIIw3y0WMz3e
	9WF+gRPvZP+evOpj/x8MUhqWXHJ1VOD2p469qoW7XKJdnPZ9p9n2+DJlnS6w2F8MmVaU4r4Tn8g92
	rm6+aNb6yPujfwgzJNE5VrGp0IGunL9cgV904/hw6h6ahObVhbhlP55WeIcRTA4yeRkQBZaVuNUGG
	IKvthTHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIsl-0000000AD9G-2O3B;
	Thu, 02 Jan 2025 10:56:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIrc-0000000AD5G-45Ig
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 10:55:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qocm7lZy1PSubNMeLekwbSHczdGmHwJjp8Gc0zSDJMs=; b=j08KvFWTUqnSbOzuXjrus5sVw9
	sYxo8ugivLM/3n0+gpPKK2otzZ44XF5ChvMMfAG1MrBwA3Hf8r42bMqindyS89y8K0J3qsl3ZniPZ
	FSPzDNoRlUXtAcRGHzJvSe5Lj0WNnQBIsDnO5DNIA9sXsL/W5S/AK5ETc3alRkNmQf+oKf3sPX8dj
	yNVnVWML9U5ASqffKqFsWvt5gzZ5LzWALyYnNCFAlpdyS4DT+/+Yb42Fsi2XwbEZzXCIFauVeQEpF
	XaPh0zqsu8nYV4sjIvVey3MyDyo0BF4U2iFecOAG7AM+2iAyHhCPYr0cnIwEcGzGN9RnK/Es2anNs
	9gLH1SmQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51178)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tTIra-0001ul-0L;
	Thu, 02 Jan 2025 10:55:38 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tTIrX-0000DT-2P;
	Thu, 02 Jan 2025 10:55:35 +0000
Date: Thu, 2 Jan 2025 10:55:35 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: orion/gpio: Use str_hi_lo() and str_lo_hi() helpers
Message-ID: <Z3Zwp5r13NowxNwP@shell.armlinux.org.uk>
References: <20241226231052.566363-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226231052.566363-2-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_025541_063204_D46FD881 
X-CRM114-Status: UNSURE (   7.77  )
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

On Fri, Dec 27, 2024 at 12:10:52AM +0100, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_hi_lo() and str_lo_hi()
> helper functions.

This description is missing the reason why its desirable to make this
change.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

