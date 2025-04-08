Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9B3C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 19:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6ofuAtc7jkiEuSMNWEw5n9/rP+htmQbYTekNSwGVi8=; b=Cb2p1fUdf81fJtWiaH6R4XZ5i9
	UxAR5EmEBRw0pOL4q3kLX3nyjQUSGrPVTqAA1uuAgFTSc8lGf8Vp1H30/QcbWyTzvg3CYrrBqJAJQ
	lSYk2Q3/Bv6DHmum2ChoUmMp010g4NcXF9LEE5HeERH/ftOVft2A4f1o9R7EGulqH1sF23LH6ouuP
	2tG4yhNnX6VtDXjKkWUaBnGKyuUujpmsFsH++CmjpilC1/OxLTcWHubdWdCKJYiA3doidRfIBYGOG
	1z/jzJSmvNAaKjxxknQ/MYAP+RuTcHnoGMnwc7I83BkjaoKrlGCioarK1M4aKezW6RrQNcpdj+vYr
	agaD5A+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2EIK-00000005CLW-3Zq1;
	Tue, 08 Apr 2025 19:07:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2E9Q-00000005AyZ-1YLL
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Apr 2025 18:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=L6ofuAtc7jkiEuSMNWEw5n9/rP+htmQbYTekNSwGVi8=; b=OxWPQBNvNtX1Eru4pxBENwiVVL
	wArXmBGiVUxvk4D3UECvkkgr/jD3T0q1cBWuCuqof22a8+xJlX9SmETGeS1vIe6Vo6/DZq8ES7ogu
	A1l8ET7FakX5ScJdnKHrtuF+2AzX3BrpW8LYJQmYUDIisho6eNk7DIB/9wN4Rg2tSIMj/RZh9V70c
	W/ZcpaKzomxMpfRQZVOpeRb0VEnupLvV200+lIm48nwsGlIK5kU2dhwYBJbYAx1wRS06xp9ri7wKo
	26YB05yQnN7YIhus6arVpEYSST+HEosZwssnCtmXjlymTVQO2McRtSKECQm4z8+gE2TLffJkibG+m
	1AJ8PBbA==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2E9N-00000008Oyf-251r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 18:58:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=L6ofuAtc7jkiEuSMNWEw5n9/rP+htmQbYTekNSwGVi8=; b=xVK+ncVXKeJCmefB4rPZck/cSm
	CXrBTn3k8K77hBbH4X/Rj+n+ntnZ3htDymrzcsCiuXRQveYSdz6uxi7r8lit/b/atttbS23+SEhGA
	QekG2m4mAOy0GlNlgQzwEnNs4yez634VlXU1GUn7NRYN3pp/KlqwS4bAFEYrVESNQj6A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u2E9J-008RJh-SC; Tue, 08 Apr 2025 20:58:17 +0200
Date: Tue, 8 Apr 2025 20:58:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Richard Cochran <richardcochran@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH net-next 5/5] net: stmmac: remove GMAC_1US_TIC_COUNTER
 definition
Message-ID: <a244ef6b-da5f-4727-8277-9b0f9b800029@lunn.ch>
References: <Z_QgOTC1hOSkIdur@shell.armlinux.org.uk>
 <E1u1rgd-0013h1-Fz@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u1rgd-0013h1-Fz@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_195821_654905_D0A93504 
X-CRM114-Status: UNSURE (   7.95  )
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

On Mon, Apr 07, 2025 at 07:59:11PM +0100, Russell King (Oracle) wrote:
> GMAC_1US_TIC_COUNTER is now no longer used, so remove the definition.
> This was duplicated by GMAC4_MAC_ONEUS_TIC_COUNTER further down in the
> same file.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

