Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E00E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 15:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZoD+gvKfB/ed9HjsLTaCjOZ9SwK5xZrjHcan7418rw=; b=ozFNQyZNaSrENJi3/B/c1bOyCL
	sK5B2PtY868/QPD/l/1FcZXrJUGPlltD6o6mHG1DWCnu7aqecajdLy+BDaDE5ufTV73wu9lOUw2h7
	FFaF4+rJ/SZweiSpBzopLccmfSe2BxDzjsJr97aML0bpehMNY8CHe30MNhJVVfoESycNObD9kqB7H
	509HKeX1GUcWch99cg6GU15sTvb0Am1Y2Ls8F2PGMYOYgLTH86FbDaYuyipFAL0055z7i1tyySetr
	e01J6rK+uaYl1Q142irPmh9DZTP33nUrMnKIs7uUvKILcrM3l/qmAgAQCPUWd3t058SnZpatmjA51
	DKppgIlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVB7K-00000005LjP-0tL6;
	Tue, 07 Jan 2025 15:03:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVB3S-00000005KuL-2jUw;
	Tue, 07 Jan 2025 14:59:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4ZoD+gvKfB/ed9HjsLTaCjOZ9SwK5xZrjHcan7418rw=; b=kALKCcA3IFaOOLmMdjti7LK+bD
	RcS7EGoLurmty1XbnbAoumDhcat2e6Xkd5KfAYFAnroHw/sNowJQJKckvkepCZqMCwBtWDyNyNQ+2
	DOAfVtc1YqsdZq3jHxs/3e4lXv3UpHFsTzgSTQmyd1EFuAf1+D0+MYI0gkKWOSWEdoPUTdJs+qzlk
	jqC82QEDE6jYDOSQR0AspwlRUwRAbU9GBlynBp9V+CL7/6U+2sRXRk1SfyUlKfalpHN82Udk4FisO
	ZNxX2Ak6PrBeh7xEXQUfbTYTm3mA7d4Hm5aBUfhxzfqEU3Bld+KRinkR7pYoBO8Pud7AV6v7YQzlJ
	lwznVA3Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58096)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tVB3B-0007ct-0c;
	Tue, 07 Jan 2025 14:59:21 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tVB36-0005Mv-25;
	Tue, 07 Jan 2025 14:59:16 +0000
Date: Tue, 7 Jan 2025 14:59:16 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Eric Woudstra <ericwouds@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, bridge@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC net-next] net: phylink: always config mac for
 (delayed) phy
Message-ID: <Z31BRMay2QgcjX2R@shell.armlinux.org.uk>
References: <20250107123615.161095-1-ericwouds@gmail.com>
 <Z30iUj6DE9-fRp0n@shell.armlinux.org.uk>
 <Z30pMSxDn-R3Cy5S@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z30pMSxDn-R3Cy5S@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_065938_689520_322AE285 
X-CRM114-Status: GOOD (  15.34  )
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

On Tue, Jan 07, 2025 at 01:16:33PM +0000, Daniel Golle wrote:
> On Tue, Jan 07, 2025 at 12:47:14PM +0000, Russell King (Oracle) wrote:
> > ... but we don't see link-up reported by the PCS after the PHY comes
> > up. Why is that - I think that needs investigation before we proceed
> > to patch the issue, because that suggests the PCS isn't seeing
> > valid 2500base-X from the PHY.
> 
> The PCS doesn't support in-band status in 2500Base-X mode, or at least
> the implementation isn't compatible with those RealTek PHYs.

There is in-band for base-X, which involves 16-bit control words to
report the capabilities of either end (basically half/full duplex,
pause modes). Unlike SGMII, it doesn't contain any status bits for
link up, because that is irrelevant.

Link-up state in base-X modes comes from the PCS itself, whether the
PCS is in sync with the media, and whether it has valid format. This
has *nothing* to do with in-band.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

