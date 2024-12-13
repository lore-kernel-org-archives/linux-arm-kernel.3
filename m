Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE235E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 19:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OKWWGal3o7LbTV2TO3uDGVhmx9PqnQujifRZi9s2So=; b=jw4bkUL6InrQ6Sfu/V5HmU4GKn
	BA9AtPp8LyMzjeOGhwnPI2Zdb95qQHxoCONHvrbHbbRnlK2aCFgFQ0n+PNlG5u4XXDMiKYvMD5KYO
	p2uZmmhAPcXCFG0/QrCeFR1gHznuP57W2AChU+vgo/so/iCftnwYjnxNODK0kmL9tV6IggBfWCqDz
	i11snbRpv7Ly7SmiwNa1BOGHG7CY5hnDsoSiKT+d4IloMwqd5B2hzvfbHSrSjX2Hp7/UrKxnKScjg
	qK6xzQT5I2zIkyId6uoYTyFazUMjQ9PoHqe33ZYsa+w1HCwSYxMFp6gOFWHPjw0Kn+VgdeAyvGqQa
	NZ1nycGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBcb-00000004rkr-0Ho7;
	Fri, 13 Dec 2024 19:46:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBbV-00000004rVb-34ud
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 19:45:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2OKWWGal3o7LbTV2TO3uDGVhmx9PqnQujifRZi9s2So=; b=0UV6EKHnRYzDrMqVxlBYCouvTp
	FlYRRMm0syDARUJNEYq7CGX0KQCnszoZMQCtZ93d0oGy7OGL2t/a7f+uCcGXMRSfRGqILVSZRp2yJ
	cWNVXNCKl3yRizT26AuIaDtOmNIuUjKOLkGpJB87Vc0gO+15C9lxkb0sDboR+eAg2sjyfghav+OBi
	9O3VJBM9xERg6lUmPOIBWUvYpf6SgbEowi/FuHczwpBcWEEPUXjY0yHyONW6nCIUqc4K/ivQe9sOJ
	cou9JA3e/M2lKQPihGgaFbz8YFBZrKZvOjP0bvdNRmTl2G/bM/NVXXWWlWqY98O558A8vs+K1u+fx
	RVOYHXiA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34272)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tMBbE-0007Fd-2S;
	Fri, 13 Dec 2024 19:45:20 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tMBbC-0006Yr-0S;
	Fri, 13 Dec 2024 19:45:18 +0000
Date: Fri, 13 Dec 2024 19:45:17 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	jacob.e.keller@intel.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, robert.marko@sartura.hr
Subject: Re: [PATCH net-next v4 5/9] net: sparx5: only return PCS for modes
 that require it
Message-ID: <Z1yOzaL-gwXIE94O@shell.armlinux.org.uk>
References: <20241213-sparx5-lan969x-switch-driver-4-v4-0-d1a72c9c4714@microchip.com>
 <20241213-sparx5-lan969x-switch-driver-4-v4-5-d1a72c9c4714@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213-sparx5-lan969x-switch-driver-4-v4-5-d1a72c9c4714@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_114537_767463_5804BE38 
X-CRM114-Status: UNSURE (   8.69  )
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

On Fri, Dec 13, 2024 at 02:41:04PM +0100, Daniel Machon wrote:
> The RGMII ports have no PCS to configure. Make sure we only return the
> PCS for port modes that require it.
> 
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

