Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CCDCCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 18:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fck8LKgCheBTtzhirGZSgVYji9+4kt2G7PypWCpeZQ8=; b=JsxCRi0kQQrnP6c+Gjaz0aXd3x
	q9oSkwP7py7jh6EduMWC3n4S/bLKYHkgHvAuzUbS6uEIq4wrGx0LP8rZedEFsi7ku0WdwsdoXsLYE
	fIl3ZXxqLsoD3d+yYbFwibbhcLbYWO8jzKENlTBs5Lmb16JBuzLnuVd6av8ixoUqt6M9m703ndojv
	tXF9BSZksPRAvr1u3ongiGiNNCaccLKQcnqG3vn2zUOcTwy8ILJkxIvn33X+2PKHvqSZ+p4gytup2
	f6enEUkGQXCu+SBLXVAuSwrV4QWjrnQoAqiKnZyl8Rjl9MNE6uX6BsSM8cByl09abOD7PJsqi9oLp
	8SR4vtxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0PP-00000007I1C-1IHU;
	Thu, 23 Oct 2025 18:51:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0PO-00000007I0X-04QM
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 18:51:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Fck8LKgCheBTtzhirGZSgVYji9+4kt2G7PypWCpeZQ8=; b=WtukfKEp/4rbKdrwzX8WlKE25K
	vTHf/BkXlMkL6x0paVVCHLF7zFJkafaEjVXOitL6nGn4mE+iDwKOrqTAUHlnyQmPtA1eex4s/uARG
	hDv2r9mqbOH8B7yDR8QZkYQ34U4ggxxIihksOm+OsEIh2DjmUti55drxJLasi7Hs+YjtanxpnLRPk
	4rAumwrZ2LRnymSLE5QHI/19HxcSH5OG+fZa+r9/fya59iwbZaVN2vcSU7U/jsBqUHPLOgx9oBCDY
	wHG7zMGxNqEyZmmoxbNgfaZDSkVpAslL8YSnAG+gNXFWypz2AvLLCrKwqBhg48k3f4XVAHvANTXTD
	XyF+9DeQ==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzXg-00000001d3l-1L2t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 17:56:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Fck8LKgCheBTtzhirGZSgVYji9+4kt2G7PypWCpeZQ8=; b=o6QP+zM11VgjiUYwb3dDbDDxhB
	itSVZWwvgs9DXykbevr1fDvhfNdpr7f4ev7J8vRWhAq35HLERa05sbIcrY2V8AgDHp7xzt3uQHxw8
	03eN04bzBr4VbJkBKHOmVBLLLq0HOJc98EPj1sEQmJiMVQuv1Hemka56vt1skkpQcRyk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vC0PH-00Budg-KO; Thu, 23 Oct 2025 20:51:27 +0200
Date: Thu, 23 Oct 2025 20:51:27 +0200
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
Subject: Re: [PATCH net-next 7/8] net: stmmac: use != rather than ^ for
 comparing dev_id
Message-ID: <4dbb99c6-77da-49f3-bce3-5bfc297f2c21@lunn.ch>
References: <aPn3MSQvjUWBb92P@shell.armlinux.org.uk>
 <E1vBrla-0000000BMQM-462M@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vBrla-0000000BMQM-462M@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_185604_451653_2F267972 
X-CRM114-Status: UNSURE (   6.28  )
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

On Thu, Oct 23, 2025 at 10:37:54AM +0100, Russell King (Oracle) wrote:
> Use the more usual not-equals rather than exclusive-or operator when
> comparing the dev_id in stmmac_hwif_find().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

