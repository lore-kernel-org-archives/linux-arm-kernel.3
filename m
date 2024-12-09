Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85566E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 16:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8U5tytWB8jdTsBEP80ajIb2iAzJeX3cQD0jCPv4mRhY=; b=z1SkFTjD5aPz/Aqc1OsXM7jbF1
	1qRsVe0nU7POnuY51yhnfEx2OHTrr1+o2xVQbClh1SrlIk3RxuC+0Bg5YC2sozJyLrLMk+pXKxnSq
	Ytihk6GihINim0eNIf+j1f40AzsfB+ANlhfmCD9FzvnSE/JL+iDVcn10AtbtngC8C1ulNydIatBVU
	pIo4kIdvygDZkoZBqW1kJi0W1Glqa9X6bttlAdwtlKKHWhyJLSifAo3OJ5/s+b3UASaPhIRZ4Cjd+
	0vsWEzgbkmnDHS0QN5IPLdupsSMf+zFqNhPlTrk94xkP0eiqOJ6GtjuvErUaUr1kJS9PCcs5VpcW+
	2vHwU3ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgkz-00000008a1z-0m5w;
	Mon, 09 Dec 2024 16:37:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgjs-00000008Zmn-1vfu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 16:36:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8U5tytWB8jdTsBEP80ajIb2iAzJeX3cQD0jCPv4mRhY=; b=pR1U65lXh+gULXxoVbxUmjRMTg
	IaO8ybI+roY8bQmY7Kvi6CfXfzHAR4U8rod0j/KCAhNs2QDSgiGDMrQuyBfNmVKZTktWAPzYThk79
	nCqeF4Oh768TW3ErNVa4LLSjrePI+TavuFE0bgUS7lCacke6tf7FHBlbeakub7tK8dIEftPKYeVJn
	8DAQFQc7nMN3ZhkoNb23G/mOKlTcMcJVjWkjlrPVxt+4ur4sju0Scf1ydRZ+gz9Mf/7NyQDnNCOea
	yyRpPJ7Wj/kEs6SrdHPhc0TFp9Yp0THsH9Ub0pLvc1B7ONfVFmHSz+IivnuBBcxm4EezyCR8U5s8y
	ENmtf4BA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45626)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tKgjY-00017C-0l;
	Mon, 09 Dec 2024 16:35:44 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tKgjU-00026q-0x;
	Mon, 09 Dec 2024 16:35:40 +0000
Date: Mon, 9 Dec 2024 16:35:40 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-hardening@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>,
	Hari Nagalla <hnagalla@ti.com>, linux@ew.tq-group.com
Subject: Re: [PATCH v2 5/5] arm64: dts: ti: Add TQ-Systems TQMa62xx SoM and
 MBa62xx carrier board Device Trees
Message-ID: <Z1ccXClgTg5Guq6R@shell.armlinux.org.uk>
References: <cover.1733737487.git.matthias.schiffer@ew.tq-group.com>
 <95ff66ca2c89f69d893c2ce9eed9a0c677633c7b.1733737487.git.matthias.schiffer@ew.tq-group.com>
 <a9c5cfda-e3e3-436a-8d05-b2f096157cfe@lunn.ch>
 <c902a56cf34838f60cee67624bb923e91d74e9e0.camel@ew.tq-group.com>
 <d25b1447-c28b-4998-b238-92672434dc28@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d25b1447-c28b-4998-b238-92672434dc28@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_083604_493667_7744FCAA 
X-CRM114-Status: UNSURE (   9.41  )
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

On Mon, Dec 09, 2024 at 03:42:52PM +0100, Andrew Lunn wrote:
> I also find a lot of developers don't really understand what phy-mode
> and PHY_INTERFACE_MODE_RGMII_* actually mean.

... which is why we documented it in Documentation/networking/phy.rst,
but it seems folk who run into RGMII stuff don't read that document.

I'm wondering if we can come up with some kernel-doc compatible way to
document them in linux/phy.h instead, which may stand an improved
chance of being read?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

