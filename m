Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C02E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 12:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=60+QdJdxKs6rZA+mdAzlD6sjzLBFb35Y3PSnzo24tzk=; b=Fnr+1IQJyCFD4twL53q+Lz57gp
	xoUy5vTob8fOOE2K5V2WAKCAvxVZ5CJqSU12/Xx2SNpf45Pbu+dT5QFXlJq+imTl6eeagSfYuwZQh
	su4G2O9FwP8UhdyLLfQ5sGvPwWTpqL7uhsa7o88wvUo9185fBGaA5v+oI3k7j/eE93aiSDxVi48Gh
	4Kt9CSA+9lzJkiB3luerN3ToRK0wC2GCob9fPFm7VjlN9dzCQF+V0XllMac0sh3k1TDpUszFT+v6W
	O7+SQyFZgHGfajLuGQqLYeQFkdWCPNEC3rzDs3Iufkqc/8SQ2WXVqi629gmY1wCP5uz05OEJGvbWu
	9h9X0fhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXeq-00000001bTn-1kjd;
	Fri, 06 Dec 2024 12:42:08 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXdm-00000001bMj-1H5u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 12:41:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=60+QdJdxKs6rZA+mdAzlD6sjzLBFb35Y3PSnzo24tzk=; b=WK2FExw1uNyzInbCva0clg0JsG
	kZEr9EIkBLryuhClWgKxoTYYDN0lYpa9z8LIJeyGAS6eKvR9OmD3Ij4ifFmT0FKtLWlQbZWgOcGL5
	VUkyvzI/WUWxwBJ/deE4lUIzj8aU9xYELZnqEwkA4LGPCy8QAtE0piWWjs3RBRHOkDauu3hrhmPhr
	e+igfTThsB4ondJhfP7TEB+pyob6h27CKOvgcRz9L9Mmcpz7O5i8JR1UTHgEAaYDI7PVTz2E5Zc9G
	nqI8LvD+CRzGY+WxpZPzOHGHxK42VxIiHebEJCtq91lNvWTw7E15ZU0P/TCGZf+zrX9aC0TmAzzyq
	Zuj3CV+A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54884)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tJXdf-0006Fj-2g;
	Fri, 06 Dec 2024 12:40:56 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tJXdc-0007YT-1B;
	Fri, 06 Dec 2024 12:40:52 +0000
Date: Fri, 6 Dec 2024 12:40:52 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	andrew+netdev@lunn.ch,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH net v1] net: stmmac: TSO: Fix unaligned DMA unmap for
 non-paged SKB data
Message-ID: <Z1Lw1LzgeAyHv2Bl@shell.armlinux.org.uk>
References: <20241205091830.3719609-1-0x1207@gmail.com>
 <Z1HYKh9eCwkYGlrA@shell.armlinux.org.uk>
 <20241205085539.0258e5fb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205085539.0258e5fb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_044102_339861_9D4031AE 
X-CRM114-Status: GOOD (  12.29  )
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

On Thu, Dec 05, 2024 at 08:55:39AM -0800, Jakub Kicinski wrote:
> On Thu, 5 Dec 2024 16:43:22 +0000 Russell King (Oracle) wrote:
> > I'm slightly disappointed to have my patch turned into a commit under
> > someone else's authorship before I've had a chance to do that myself.
> > Next time I won't send a patch out until I've done that.
> 
> Yes, this is definitely not okay. LMK if you dropped this from your
> TODO already, otherwise I'm tossing this patch and expecting the fix
> from the real author.

See https://lore.kernel.org/r/E1tJXcx-006N4Z-PC@rmk-PC.armlinux.org.uk/

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

