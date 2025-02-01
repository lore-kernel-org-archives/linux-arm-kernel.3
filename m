Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C97C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 18:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5ZT/h+p89qeEa5RIXxfCBGj1xjBO6R4oKcKC+7A56I=; b=rvBaii5ppL/Ijq2g/jj3E0e0kq
	8qG1n3b4XFVxn8EufxRU/ESLkWpkgmLp3tTY1xrdx8oidOSFivNXIJEcrm075d4E4RRXv8zkE48cZ
	zCq1tTctjXSzPSk1thMzvTm4vPDJxbiHlL2giXAI8+GRUzdobsgrn2fTxxlqKgMrDyXTNMxYKHhPX
	/NyVulWVsxWXCkIVAQjXPjXyH5gEG+/UgXq5dW1YmhVlUCSndz3CqHObW0Jw7n4bU5wd24pNj3I0b
	IzGA8b+iC2fPR7Yt44h99wSe550wVKQid7bLat3S4WxPuPLTDDnP75ieQWXnHb6Q15jLIdhn+zpvG
	7cnzvxUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teIfK-0000000D1wS-2mh9;
	Sat, 01 Feb 2025 18:56:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teIe1-0000000D1q7-0xAh;
	Sat, 01 Feb 2025 18:55:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=X5ZT/h+p89qeEa5RIXxfCBGj1xjBO6R4oKcKC+7A56I=; b=OpVjJuugpl1+0AnhDi9Ooogtcw
	XOFTC9tsx5XeS2h9+DwnDU/FJCC1as2V9YZ8Jpjnx6+79jd3sGrTAMMhnafxsL6upLGxhrnXC928/
	a9j/QIK5423Usqeej45tYqFrQkbDh5kP3FWKoV1G6JmLdW/Rtvi3wseRaF/fptNprNZU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1teIdp-00A2ZF-Uq; Sat, 01 Feb 2025 19:54:53 +0100
Date: Sat, 1 Feb 2025 19:54:53 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v2] net: ethernet: actions: Use
 of_get_available_child_by_name()
Message-ID: <278e8d0c-e4bd-4126-8617-be2b7134b307@lunn.ch>
References: <20250201172745.56627-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201172745.56627-1-biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_105505_262752_C5F027FA 
X-CRM114-Status: UNSURE (   8.09  )
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

On Sat, Feb 01, 2025 at 05:27:40PM +0000, Biju Das wrote:
> Use the helper of_get_available_child_by_name() to simplify
> owl_emac_mdio_init().
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v3:
>  * Dropped duplicate mdio_node declaration.

And version 2?

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

Also

1.6.7. Resending after review

Allow at least 24 hours to pass between postings. This will ensure
reviewers from all geographical locations have a chance to chime in.

and section

1.6.6. Clean-up patches

Netdev discourages patches which perform simple clean-ups, which are
not in the context of other work. For example:

o Addressing checkpatch.pl warnings
o Addressing Local variable ordering issues
o Conversions to device-managed APIs (devm_ helpers)

This is because it is felt that the churn that such changes produce
comes at a greater cost than the value of such clean-ups.

    Andrew

---
pw-bot: cr

