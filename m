Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0ADEF584C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 16:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdQmimkreI2fOku3XSzkbPRZvQQzrArN0v3aCPxtx3k=; b=Va58aWhvgKtohRw2dqI6Pm7reP
	ZBOJ56/LIdBDmdOn2+EW4PKnG1Y2Y38p7olTNoWRfN9ivhxkkY6lW7Qm8QBbaEmAYID0Emp6S+bBQ
	GTjWhgyRrXv6Wa8kqaT2/gT0g66Av78RJZhBZESxOgFxDGL+PuAz6ldw2Jx3iPLauiCL2hijNPHvL
	1l+C9iAP7WAAEDCoSFDrV5xwkB3s+pxiarGVR7nOJZIfibO4BSmbKND7NoBFa54oTDxdoljvGK+93
	caXHV32wrLlTyj52gR6A7nrGVBfl6+JRRCy3fULycLZUBJIIUOgsJ2+uAvJ74HmW+Dizik2E8pG0w
	iRGRnKTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrIqp-00000004lvA-0VF9;
	Sat, 14 Feb 2026 16:50:35 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrIqm-00000004luh-0sRb;
	Sat, 14 Feb 2026 16:50:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=AdQmimkreI2fOku3XSzkbPRZvQQzrArN0v3aCPxtx3k=; b=iR84meSNht+TkYCVlwqmXETciF
	ZFMuyeIByHHqtkmTgQuXDIUDCfabwRldeeDIlos1o0bFb5xHQKkGSsP78FyFrq9KogtXUqg5oqcz3
	iO/aEaz3AANPgMBy90jxVWed+POpL2XrDJqNWTQI16fK32M5plQ2c5Mtcuzpg8c9m4cg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vrIqV-007KBa-3v; Sat, 14 Feb 2026 17:50:15 +0100
Date: Sat, 14 Feb 2026 17:50:15 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Yao Zi <me@ziyao.cc>, Heiko Stuebner <heiko@sntech.de>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: Problematic understanding of phy-mode in Rockchip DWMAC driver
Message-ID: <f1e047e1-3f1c-4562-ab43-af2fe358fe04@lunn.ch>
References: <aY9s5PXP4zZ7R6fa@pie>
 <aY9xsslT56D9LGLe@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY9xsslT56D9LGLe@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_085032_250551_8F745948 
X-CRM114-Status: GOOD (  16.09  )
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

On Fri, Feb 13, 2026 at 06:47:14PM +0000, Russell King (Oracle) wrote:
> On Fri, Feb 13, 2026 at 06:26:44PM +0000, Yao Zi wrote:
> > Hi folks,
> > 
> > I was looking through the RGMII delay setup logic found in
> > rk_gmac_powerup() of dwmac-rk.c, and found its behavior is strange,
> 
> dwmac-rk is very broken and is unfixable thanks to Rockchip not
> understanding the RGMII interface modes used by the kernel.
> 
> It is what it is, we can't change it without causing regressions.
> Please do not try to fix it.

Rockchip have recently started adding support for a new version, and
appear to of listened to what we have been saying. So it could be the
next generation of chips get this correct.

Aspeed are in a similar position, and might also get their next
generation correct.

But as Russell pointed out, we have to be very careful with any
potential changes to this code. Despite it being wrong, boards
work. We cannot fix it and cause regressions.

     Andrew

