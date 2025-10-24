Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F9CCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 11:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDpctzUzikXL5mr7jsd57bMJaOx9W5e5E6CpNx8Gahs=; b=s4XuqHoiv+aZYgNlX3O3XZymR5
	+EaXvGgU9Y7RL81ho3pJxJm3VpCJ1Pi5kG5E5X+cCQBVt5MwBrhz6duUirCGUaIHbQFXkXGSMy7Sr
	viLAAkz42TGrYnhNRNNzelJArW0fSM9feOBv+WbpBAinooX/nKa949WXJ4JR5ZmYP5B8VjfZ+KCVd
	hoQZNdXYacR3arLS34Dq52XmkGX6lczUQZ9aBN+82P+GLxaS7YUvuIFWyu7U3/u8pRwLEy5ESFqxC
	UjNcWneiycCk1XAtHWzDUIPrF9daQJnKAJewbXDRjoj8mvHOGoDx52mZzJRDpHJs1ZWafj1DP6uIu
	uqVteYEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFgx-000000098bc-1UFZ;
	Fri, 24 Oct 2025 11:10:43 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFgv-000000098aN-1EAq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 11:10:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GDpctzUzikXL5mr7jsd57bMJaOx9W5e5E6CpNx8Gahs=; b=Th81nqULbGbjjKR79CdwmOIGcr
	y8WpnOEojfstJp+/4umsKlu5NcCELKDaYKbYzNk4ur+8ttLlqOQqXlwwP1E93EyieKwk20UgdI5/B
	UjJXbqUrVKZBjQCM+cyrUrNOk1APRGuUUHPo+fQENFGS7VGEcHeBefQuQpks7paGWWrsXGqCUpnPC
	ffUFQroNmlxwD97xCyLh9LvXNxn1ZoqAb0AeWRDyLm4WJoLOEStLdzlyE+Hx3Sqk+GcytzkR1e9x+
	1kax5UAp049Jhkl9cfjWrC5fAbzMBNvQ1kyqBdsWPQoq/03JCVMua3CSCPMihnLxg1RsyJZIMqKL7
	HDE89+1g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39360)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vCFgp-000000007Sj-1qqU;
	Fri, 24 Oct 2025 12:10:35 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vCFgn-000000002eS-0hGl;
	Fri, 24 Oct 2025 12:10:33 +0100
Date: Fri, 24 Oct 2025 12:10:33 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next 2/8] net: stmmac: simplify stmmac_get_version()
Message-ID: <aPteqZ57fWULRfNy@shell.armlinux.org.uk>
References: <aPn3MSQvjUWBb92P@shell.armlinux.org.uk>
 <E1vBrlB-0000000BMPs-1eS9@rmk-PC.armlinux.org.uk>
 <81d5c1f2-e912-40de-a870-290b0cf054b3@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81d5c1f2-e912-40de-a870-290b0cf054b3@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_041041_493059_E0E39460 
X-CRM114-Status: UNSURE (   9.94  )
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

On Thu, Oct 23, 2025 at 08:46:00PM +0200, Andrew Lunn wrote:
> On Thu, Oct 23, 2025 at 10:37:29AM +0100, Russell King (Oracle) wrote:
> > We can simplify stmmac_get_version() by pre-initialising the version
> > members to zero, detecting the MAC100 core and returning, otherwise
> > determining the version register offset separately from calling
> > stmmac_get_id() and stmmac_get_dev_id(). Do this.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>


Hi Andrew,

It seems I had a typo "verison" which should've been "version" in this
patch, which carried through patches 3 and 4. Are you happy for me to
retain your r-b with this typo fixed please?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

