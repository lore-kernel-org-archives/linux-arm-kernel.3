Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84E1E81A31
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 15:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZ0BCqVUH5xPPVxomeaJKF0H4wRC7cRMGuNTgfAR7WI=; b=rp7NZHD4/CCsNTfESil8O0Nzy1
	o9Jw0Ck8v50F0Vl4RRnxlyfPVF+FRUk8EGNoLW0oahqvAiPKTjjQrIHM9xyMqu3Akj4uxaGb+7grc
	JeH9gPLRd55LWyheyp579mgXkMCMDi7PfNMp40cyWN8fnTPm7XHUD2Q+cHy798pGV3BnqRXspW0to
	8QWloyIUkIEyIzY2oWn1q41KD4iB+9CggEswxQd681p9n0T3dwIxcezssWVZyp73KU0boSS9syrQ0
	I3jDYmYvOu0cwmly3rfyquBEtWuS4Wics0wu9LhfXtbdAXvST7+wxNaPLc2jwtCOKnhS8eY1z8W8w
	GLynpAXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs06O-00000006q7y-3q9e;
	Mon, 16 Feb 2026 15:01:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs06K-00000006q6Q-3Zti;
	Mon, 16 Feb 2026 15:01:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fZ0BCqVUH5xPPVxomeaJKF0H4wRC7cRMGuNTgfAR7WI=; b=w6PjxASXJb/jnKoq7U4mc7F09F
	M+xmz3gOYR7Ca1HJInWEsV5zH2bW7wTOmUURs8Iqd/CedefWZsl40Eml0ThMfyZS96rueKMgBG4zv
	Z3GYZTxYKJKEl1eD6d/vndPPB7BzF8znThFBD5KMyrGoWDlc50i6brFtlE32V91VSFrC/qEaiauFh
	LgDo4370TZ7ofHrDPYb31I8cSwTfqRp4vVCbBly/4F8zr87B0JN3GmwCfaL9Df0ReNWQYLYuZZ/ZA
	/dJjNkCQ+lPvU0WaSAfDlkFOELE+aN5C3/GsLc2AgZRHIp306ODXzaPchHtcOCqIKglF+c+m5/O7W
	GOxrcLrQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47910)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vs05t-0000000073K-1oiw;
	Mon, 16 Feb 2026 15:01:01 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vs05p-000000000K6-2pxV;
	Mon, 16 Feb 2026 15:00:57 +0000
Date: Mon, 16 Feb 2026 15:00:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
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
Message-ID: <aZMxKdkl2Qa7e1WU@shell.armlinux.org.uk>
References: <aY9s5PXP4zZ7R6fa@pie>
 <aY9xsslT56D9LGLe@shell.armlinux.org.uk>
 <f1e047e1-3f1c-4562-ab43-af2fe358fe04@lunn.ch>
 <aZDGsJNLZIty0242@shell.armlinux.org.uk>
 <a4aebacc-c273-4e42-97ff-0cdd88d771dd@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4aebacc-c273-4e42-97ff-0cdd88d771dd@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_070129_185928_C75FA0B4 
X-CRM114-Status: GOOD (  15.86  )
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

On Mon, Feb 16, 2026 at 02:57:48AM +0100, Andrew Lunn wrote:
> On Sat, Feb 14, 2026 at 07:02:08PM +0000, Russell King (Oracle) wrote:
> > On Sat, Feb 14, 2026 at 05:50:15PM +0100, Andrew Lunn wrote:
> > > Rockchip have recently started adding support for a new version, and
> > > appear to of listened to what we have been saying. So it could be the
> > > next generation of chips get this correct.
> > 
> > Have you seen any proposed code from Rockchip for their new scheme?
> 
> There was a patch, including a rather odd formulae to convert register
> value to delay. I gave some feedback, but it has been silence
> afterwards.

Searching lore's netdev archive doesn't seem to bring anything up.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

