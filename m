Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D437CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 18:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXMWS8elffTVXMlbgTNjkC6/Aglod5o8DOa2MMAXrA4=; b=aVwi6xKhtVK6d/LR8iaKmcGiro
	lFPGsT8IRb+nmfHk63TtE6rmKhQEWmssybAgraILXyrjs61ocJ6fU6bXmtVLu+M3e/tZhAajqPrtU
	faucmGkbX+wcEtFBW0aECSqjkAAD6nfqEXN7oKHDLjWC2nZByiitPxdIeoWkKJxlFnuPayB/LKyl/
	rzoTQND1qYyVE4cyHrBk5OyHEvWGxf6egs45sYzmSwYJNYlJOIqsBHojeM+nxI+CfK6Ii+khTdwK9
	FuCiGSZq+F1BuX8hqm/orEhU1Hn1T07oSl2JtEbbo4Z6rvEknZvXmQFi6vId8XtBHHoNETtLS88dv
	ISSN7HIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0KI-00000007H1L-3q9P;
	Thu, 23 Oct 2025 18:46:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0KI-00000007H0o-0lXD
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 18:46:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KXMWS8elffTVXMlbgTNjkC6/Aglod5o8DOa2MMAXrA4=; b=BhxsclmSvUY+r6wSICtXVVCk/O
	JyAEMQpeceP5Jcjy/t4I3FSsQ6uqgQK81XZBOFa/Dz0lOU07PYvKEufXZm/MJiCtKPbK8upIxZwWQ
	w+P8plH0Y+kPrKz3675sXghmM6QR8UJrdF7GLdIWgrKgqXGxkbkgJgq1ec6VCelSpIoGeSClcB2W+
	lHQe8Rca7RZ2sAWJj42lwCDPUJuv3PzWrHQlT/dQJQT6WvSdaHj8GP7Jn6X1RdM3ZTB6eTvzZlich
	V01lxL/GThIsbJsKheEyHH4ZyE6PWWcBDL6LMhXVK1dLHlEILXapgYfGo7cS9hLWau6C2ICfjGBR7
	VxXOZqkQ==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0KC-0000000Am9q-1ptH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 18:46:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KXMWS8elffTVXMlbgTNjkC6/Aglod5o8DOa2MMAXrA4=; b=L62SfJooNCDP7njm3znI64QK1F
	SRJoLxTzb9+BZtYoPrYfcDJp6DqLZTjrizYW10neasQPv0nkANZIMDZ4su0t3rSoD/BMjUkZHcsz6
	IJuLXwUQL56tozuA+ozzA3yI4Rpaw5YXMNV4NtE3CVXyAyXVxk/n1d4WYDeFRDKZ4bks=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vC0K1-00BuXq-0E; Thu, 23 Oct 2025 20:46:01 +0200
Date: Thu, 23 Oct 2025 20:46:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
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
Message-ID: <81d5c1f2-e912-40de-a870-290b0cf054b3@lunn.ch>
References: <aPn3MSQvjUWBb92P@shell.armlinux.org.uk>
 <E1vBrlB-0000000BMPs-1eS9@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vBrlB-0000000BMPs-1eS9@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_194613_722429_819CDE9C 
X-CRM114-Status: UNSURE (   6.81  )
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

On Thu, Oct 23, 2025 at 10:37:29AM +0100, Russell King (Oracle) wrote:
> We can simplify stmmac_get_version() by pre-initialising the version
> members to zero, detecting the MAC100 core and returning, otherwise
> determining the version register offset separately from calling
> stmmac_get_id() and stmmac_get_dev_id(). Do this.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

