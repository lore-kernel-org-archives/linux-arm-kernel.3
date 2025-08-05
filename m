Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3479BC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 21:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8qKwlV/hGv5lXljo6J7UpddwhWoZfFMWWWFX7P5heg=; b=3/cA3rcm5cs6QuPo1drrv5zAw6
	FVOUo6h2oy+Q7+Onl5n9aHiqjYDqr5+bs2nH2O4RLbGEyw1588NGRvjN8+ew2wsaY7pd4OTnHj8HT
	bsqrdEMMdK8dkB9t48jzgbZXZ5U2y1czXp3FDlSISzRfMwECyusyeG/BTNJ7QXQDwrdjYydQ32Das
	BqLA4VnpfD9pQsjvvGges3Oo+SatvkGvHE/2+NBth1G35v9r3UIjmxgl6HOAqmIHF3ZQRRY7cCMW1
	bZ3emfBETxnpPaPk6cRyON34NVFXp7GalzKt3PYNrXsBaL10OERyyiYtu7qdV5YKYQ8h7dnV8FtGE
	todFolIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujOsF-0000000DnSt-1yqB;
	Tue, 05 Aug 2025 21:07:07 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujOpd-0000000DnGX-3st1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 21:04:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=H8qKwlV/hGv5lXljo6J7UpddwhWoZfFMWWWFX7P5heg=; b=cuTvHbccrdF6uQOVkpI9+6yMTm
	c2jJLLpXWFVZ4/z3K6/6omlILczdzxF/Gh1fFX9GmKtoxu2P57NfoX7PutyO8kwQuJ0DMwlh9WD73
	ErW8ZeQUOlW9PgY6X8YS+4YG+8p2XkbqBAdbF3JFEXbAD1TGOQhRog5WPyQa9H8smwOs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ujOpa-003pIO-6B; Tue, 05 Aug 2025 23:04:22 +0200
Date: Tue, 5 Aug 2025 23:04:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH net-next v4 2/7] net: axienet: Use ioread32/iowrite32
 directly
Message-ID: <972847fe-53a2-49a6-9e87-31c5ac845289@lunn.ch>
References: <20250805153456.1313661-1-sean.anderson@linux.dev>
 <20250805153456.1313661-3-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805153456.1313661-3-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_140425_970372_212171DB 
X-CRM114-Status: UNSURE (   7.14  )
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

> -	return readx_poll_timeout(axinet_ior_read_mcr, lp,
> +	return readx_poll_timeout(ioread32, lp->regs + XAE_MDIO_MCR_OFFSET,
>  				  val, val & XAE_MDIO_MCR_READY_MASK,
>  				  1, 20000);

I think this change makes axinet_ior_read_mcr() redundant? So it would
be good to remove it.

   Andrew

