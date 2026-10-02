Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BACCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 04:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWT8IJMJs0ddLNcKHq0aOPNMWYxpA29aEZfuqulkpuY=; b=tXW4f6FU5S2UB6RdJX57XSZ+JE
	lATTnfJ4Uz2AFsoHuMl9tEApqhOBBq+SFq8FvxGOjMNAtSZvQ69Y1c3bvLXHeXM7FnJPYIXDBeGaA
	9RNi3PDxwUlzI5GMLUB52zfjoc8iqI8bp42fCRzrk9GH5J9XmdIYmnn49vSTzK19mHGaAvlRc6ijb
	8Y+X7vDBFNDO568p3EfUYtfcC9TVp4IUPbzgLATM4jewnD3fho1c1E2fqgiECs8f82DJ/bFsvH9pn
	be8zYs5lPPUKSr7JWxfzJdGdicpGGA+ZOMKutyfHpuUX/HW1kIqrum3L7QFdZxerF/gkIsyJzR3uH
	bvl2kR2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCV0l-0000000Abmh-4Brm;
	Fri, 02 Oct 2026 04:36:44 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCV0i-0000000Abm6-19ck;
	Fri, 02 Oct 2026 04:36:41 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790915784; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=BAmM4T8o/G+2/ZAM6FBd5VuaDuH38HqYI8M0IsPiZDm1DWWdoywuxVS5DqSzoW/99bx3wqBmJfd70XshxicNSbkEctrqavJF0H0a1O0qW6HujTarPRZgxcpXWD6is91MCm8lWxbA+cIq2zxUSqzufBCtpQ+I3cCHKSseYKobDJY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1790915784; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aWT8IJMJs0ddLNcKHq0aOPNMWYxpA29aEZfuqulkpuY=; 
	b=IYi0scl2PQxwLD2khWVjKstG7nPn5EpfzgJHeKgNuZ+7K3unRlZtCE6Ut2fVVAyK5NcgxPzJjaUOy7oFaRTSKw+1Ep7we80r6pUbqHRSmVra7OJ3CZNjOeLjSgxMi+fgUqahoP1VwZRjTLr2379ZOdvGRWGGymKGnm60e53pkxY=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790915784;
	s=zoho; d=iav.lv; i=iav@iav.lv;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=aWT8IJMJs0ddLNcKHq0aOPNMWYxpA29aEZfuqulkpuY=;
	b=EWDEobE84Je8hVOmuqvabN3tIeaKK29SUxl6obb2+443Ze9MhTRXLM/VaW6gfa87
	MdmEtHyipLgcWaidFj/fdCWqGtL5ud3ugWX6EzOr3BZ0Zv/omIaDEF2cKdrD5rzEDWE
	nQqd68vaBrdKN/u/fsU6CVpg4EYWkaFriOE5nLRs=
Received: by smtp.zoho.eu with SMTPS id 17909157823821010.4367848092561;
	Fri, 2 Oct 2026 06:36:22 +0200 (CEST)
From: Igor Velkov <iav@iav.lv>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Eric Dumazet <edumazet@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: dwmac-rk: keep the GMAC powered when the PHY wakes the system
Date: Fri,  2 Oct 2026 07:36:20 +0300
Message-ID: <20261002043620.1303136-1-iav@iav.lv>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1795d1c1-7103-4dcb-856f-8881521417e0@lunn.ch>
References: <20260930-dwmac-rk-phy-wol-v1-1-9fdc50bd9ae4@iav.lv> <1799630a-945e-49ca-b9d5-9e068c482cea@lunn.ch> <ab67bccd76b55d7252c5380a37809656.iav@iav.lv> <1795d1c1-7103-4dcb-856f-8881521417e0@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_213640_588719_BCF85701 
X-CRM114-Status: GOOD (  12.03  )
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

On Thu, Oct 01, 2026 at 02:07:41PM +0200, Andrew Lunn wrote:
> Why is the PHY interrupting? What interrupts are left enabled? Should
> the mask be changed to disable everything except wol?

Only the WoL interrupt is left: rtl8211f_suspend() sets INER to PME
alone. The interrupt is the magic-packet wake itself.
resume_device_irqs() re-enables the line and it fires before the MAC
resumes; the handler reads INSR (0x80, PME) over MDIO with the GMAC
clocks off.

So the mask is fine; the problem is that with mac_managed_pm phylib
does not postpone the interrupt until the PHY resumes. Patch: [1].

No new version of this patch: the hang is a phylib issue, fixed by
[1]. With [1] and the GMAC powered down as today: 20/20 suspends (an
instrumented build logged no MDIO access to the powered-down GMAC).
Without it the same setup hung within 1 to 7 cycles in 14 of 16 runs,
some on instrumented builds; one run passed 25 cycles. What remains is that
rk_gmac_powerdown() disables phy-supply while the PHY is the wakeup
source; on Helios64 that regulator is always-on, so I cannot test a
fix for it.

[1] https://lore.kernel.org/r/20261002043548.1302145-1-iav@iav.lv

--
Igor Velkov

