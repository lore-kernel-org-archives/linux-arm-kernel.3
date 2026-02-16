Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E401E63F21
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 01:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uc89jBtcLlFdS6/M6+W3LFai5QtY7x4yNmHjHJ8jUSk=; b=wNYww/jOkk06lg76TwGTTWGDmR
	Hr7b0DiphXIW3VUNUP0Dg+6GBW1/prwUE5EaLuYiZ7ANxQnux9L71d/3ZADF8f24Sf9wcF2n/Dj05
	WgMLaJ+WsWMyEILQM5rHCNkE0v3CMcPiASr4A1NwEh1iHf5CJzASMVTvm5yhJ0Bq259mS6AG+ROnC
	oEGEggjjGa58FZo7TPiWJBYb7be2/nZQLnjOHX3q+FOW3D8StDq+BKPBwkDDAViFxYtPFYkbJasLW
	je/DiUx6ueXX/PlorzqND1QcbkhZ2/xX1KRY7pzRJAt5b/50iMibXaFC98/GsBIjl2PDfX92kKaFi
	e1FdUb/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrnsK-00000005rhe-0scL;
	Mon, 16 Feb 2026 01:58:12 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrnsG-00000005rhC-3R6c;
	Mon, 16 Feb 2026 01:58:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uc89jBtcLlFdS6/M6+W3LFai5QtY7x4yNmHjHJ8jUSk=; b=nfIHjmaeZZaFa/nCmijVPvJMJZ
	X8JLzv0KLKsk05aHsVvLYYg2df7DL5rQViVc1/Uok4zGVJAUikXJaP8iwOjaOfkxHAcOzS62Xr7/a
	4x5rH4LK+GMIH9jxFfA1WU8H8HMTzCpzemZmI3K/lqqzGy1i30trWM8U3InvwBfi0RS0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vrnrw-007RYn-Tn; Mon, 16 Feb 2026 02:57:48 +0100
Date: Mon, 16 Feb 2026 02:57:48 +0100
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
Message-ID: <a4aebacc-c273-4e42-97ff-0cdd88d771dd@lunn.ch>
References: <aY9s5PXP4zZ7R6fa@pie>
 <aY9xsslT56D9LGLe@shell.armlinux.org.uk>
 <f1e047e1-3f1c-4562-ab43-af2fe358fe04@lunn.ch>
 <aZDGsJNLZIty0242@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZDGsJNLZIty0242@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_175808_881448_353043D8 
X-CRM114-Status: GOOD (  11.87  )
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

On Sat, Feb 14, 2026 at 07:02:08PM +0000, Russell King (Oracle) wrote:
> On Sat, Feb 14, 2026 at 05:50:15PM +0100, Andrew Lunn wrote:
> > Rockchip have recently started adding support for a new version, and
> > appear to of listened to what we have been saying. So it could be the
> > next generation of chips get this correct.
> 
> Have you seen any proposed code from Rockchip for their new scheme?

There was a patch, including a rather odd formulae to convert register
value to delay. I gave some feedback, but it has been silence
afterwards.

	Andrew

