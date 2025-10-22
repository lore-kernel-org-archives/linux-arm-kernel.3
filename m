Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB02CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 13:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HC2Y7pPYmCWrDxpm1DRy8C0zQyQm5jdrXSGJjFSGdlc=; b=lxyNXgh4gk1QbQDCxadGe2f3Kl
	yocpb++8TS3VnYJVoOP/+AsptQDTkCnlcOQ0Vlx/rZ5Ppf3DzI4u9qUa03Qb5lXcNF1SpF5WdOMP6
	6ynefwFvz+uYKzyKSuloVuSaa/uP6WoRGoK+G61MLPS+yi31mwAuV/lGq8tL9k8AZWe705fb4r35V
	CTX7WsjhvSd/5U5jN7pdcv22p0g9vCiQpUi3WMfWftVpFl57DFdAsUdIxQw/gJeI+hokrWYqp5VpT
	5On3CBIm1nbQk/U+sRTQLkIfSTVqxVYGP6dMShoes3F/Y7aaorkJElbwpRkRm2mYeBj6kXLgAMPIW
	g+3HGo6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZ5Z-0000000335s-3FWP;
	Wed, 22 Oct 2025 13:41:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZ5Z-0000000335N-0cy5;
	Wed, 22 Oct 2025 13:41:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HC2Y7pPYmCWrDxpm1DRy8C0zQyQm5jdrXSGJjFSGdlc=; b=FBJ6aKxg9joPQlJWpZz0Ev1zSf
	OHo82yo9nxXR/xGWCNjJkcZhfbQe0VguoxE3BQQCU9fgTgWsspiLn7fG82axOdUNSN9lc1VIMm35U
	pJ2SLWM712rQwDsaWCXAPO2zfv6CQuVptDrqiHz1zmYsXsXMSPyYmEX2l/iEEpmHbLI1eS8LoGO2z
	MWyCYBW3jHEgUFRvNIuVGbcv/5VUDrkmmPtAM0Oe/hHvk5vkwqNodBWfaskDHkhQkatGG3Dp+fYMz
	sXq7u45xheSvcG2lVIfRrxiXrirKt4jVBmRVVTC1SYWkUeJ3CQm5I64Z1AygLH3PvPAL6rCwASwYr
	rEdlIaQQ==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYDq-00000000axU-0yuw;
	Wed, 22 Oct 2025 12:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HC2Y7pPYmCWrDxpm1DRy8C0zQyQm5jdrXSGJjFSGdlc=; b=dolfmKRhjuHhkjc0YWY/4WjvQQ
	j1GTLIqdp6oS4MlyfqUXqMjroW17HMji5ZIEGzixZcxa40Hjl+PtFtRzJKT5JfuL1MubfupuO40OB
	0JFc2ADxqX6/mBTXxhwaZBIsBvCu2GT32UA3i5thzMnIT0qlirspD7zPqeWjMYGa4TMU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vBZ5L-00BlU8-Gm; Wed, 22 Oct 2025 15:41:03 +0200
Date: Wed, 22 Oct 2025 15:41:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Heiko Stuebner <heiko@sntech.de>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: net: snps,dwmac: move rk3399 line to
 its correct position
Message-ID: <8563e3bb-6249-4129-8fa6-53649e787b71@lunn.ch>
References: <20251021224357.195015-1-heiko@sntech.de>
 <20251021224357.195015-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021224357.195015-2-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_134546_374610_F69D4306 
X-CRM114-Status: UNSURE (   7.05  )
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

On Wed, Oct 22, 2025 at 12:43:54AM +0200, Heiko Stuebner wrote:
> Move the rk3399 compatible to its alphabetically correct position.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

