Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1400AD41C36
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 13:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87k6ZOPMZjikEVuPQMcOElrCO2sbaSMGE+CuXeuUymE=; b=jdO9bmdSpPtyyNDp14vgsVvCe9
	pnxKlvrrpV96vSeydVycqMLGltbNxkK16k0cOVE7jpdd2HNf+5S4pvWJbewu7U2mN1QP5Nbek89F+
	sdNkusvyk/mky60VFLA7an4sJKsxIRHTuunvNdxn7LVlmPrwiyc3m49g/MpFfcOdz90XRolGh9vt7
	DY0jPSOoxqg42lnPcTYwjJzPSDpAuez0OTTPCoJMyAYNJFT6UI5HI+eolXqCEYpZQU2ljS6N9LsWg
	8zokR5MUnXPM+QkAgkpYO/JVV9zA+UKL4dMc8Zt7e39jWsyqWxfZ/nvWPW2Yb3mUffaGwObBr6bQO
	G1wklazQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTgoi-0000000GeEw-2UEB;
	Thu, 11 Dec 2025 13:34:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTgof-0000000GeEU-3soV;
	Thu, 11 Dec 2025 13:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=87k6ZOPMZjikEVuPQMcOElrCO2sbaSMGE+CuXeuUymE=; b=Y+pMqO07thAfXDflKjPCaw9UDH
	cefJt4/vw4yCPrfXRYr0yVTO9QDamI9Q7/ELHXhBojx8USvqA/wAKy4Wj3LWuZsrQr1kg6fVHFia+
	Qx/kGfFBWcY26PbDF4mP6ek5z7u7h7/GSRT+h2gCgOAF5n5q+BItTusLN5f3G4ErqhV4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vTgoQ-00GeC8-MV; Thu, 11 Dec 2025 14:34:30 +0100
Date: Thu, 11 Dec 2025 14:34:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] net: phy: mediatek: fix nvmem cell reference leak in
 mt798x_phy_calibration
Message-ID: <57437939-6983-4db8-9178-dd19f1c7b971@lunn.ch>
References: <20251211081313.2368460-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211081313.2368460-1-linmq006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_053445_963948_C7E1DCBD 
X-CRM114-Status: UNSURE (   8.97  )
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

On Thu, Dec 11, 2025 at 12:13:13PM +0400, Miaoqian Lin wrote:
> When nvmem_cell_read() fails in mt798x_phy_calibration(), the function
> returns without calling nvmem_cell_put(), leaking the cell reference.
> 
> Move nvmem_cell_put() right after nvmem_cell_read() to ensure the cell
> reference is always released regardless of the read result.
> 
> Found via static analysis and code review.
> 
> Fixes: 98c485eaf509 ("net: phy: add driver for MediaTek SoC built-in GE PHYs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

