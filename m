Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13019C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 12:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DoXTw3y1WZb6kUZwfppvYhZWgShbh4hkC/pckhm4nPo=; b=VTuAZcLUT+cZqlnU9lxAEw740x
	cTNhyoZHn1U+2UT8N27YKlvCm90sKNXVPaaSklynQElUlqXFEuAP2oVP0ljtecvbDAPFnj7ae5LL7
	dTF4G+wUJfGpTvSjy+wHEh3OzQRvr1d7pWcELPIDB8zCo72KCACOdJH1yJZERgdyhIzudBNXqh2iw
	4rIdOzKkXB8mm4h/uPaElKDHysGsVmRHhAyX6MzFkq0JXitPTgwkG/plSpBcBJp9dGnG9kEv8vGe1
	4f5HVpTuMMkJtM6gvBazPgrndf8O4ouYCpGnhhuRb2C0zDc6mdehQkUcfwgRzDrPxXW+aiuTZa8ew
	EmQ3u/Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM4NE-00000007NG8-1vxC;
	Mon, 02 Jun 2025 12:34:40 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM4Fm-00000007Mam-2uBh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 12:26:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=DoXTw3y1WZb6kUZwfppvYhZWgShbh4hkC/pckhm4nPo=; b=SRKJ7gEkMMCxuG9Oqpzr9Bzdj2
	zDXbd5hxeym30p6fcPMATstXSAGFqKZ3jhJm6zi0FYlu8lTqMloZTZnb0vEwJFvX+DxMD/V8aQnZp
	s7liJX3gjUlGarj8UK7Pdi1CRVgFowN4A13msDkYIzCwkX/Yv7aEsxdXdL7PF2R2ItQw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uM4Fc-00EV7z-UN; Mon, 02 Jun 2025 14:26:48 +0200
Date: Mon, 2 Jun 2025 14:26:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christoph Stoidner <C.Stoidner@phytec.de>
Cc: Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"upstream@lists.phytec.de" <upstream@lists.phytec.de>
Subject: Re: [PATCH v3] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
Message-ID: <739f93d0-4cb4-4f1a-8792-84502d4beefe@lunn.ch>
References: <b2ea6b7f-3623-4486-82a0-cab97053a53e@gmx.net>
 <34a4441d4b4ed8db7cac585ce93ec2357738cc11.camel@phytec.de>
 <7f6d7199-0a20-4370-a8b0-1d05326af052@gmx.net>
 <bf0eb48fc72f4b0abbf62077c2f1fe4438579746.camel@phytec.de>
 <967484d9-4165-4b75-bbb7-a203c36e8beb@gmx.net>
 <517be266ebc3b55da53372a76a139245f8945cd8.camel@phytec.de>
 <5afa6d62-4a3f-4c28-8165-363075ac36d8@lunn.ch>
 <a948b903766a82897e5fc17a840ab40e29f5eda4.camel@phytec.de>
 <8e448625-b4ad-4bf1-8930-6fecdedb1d8d@lunn.ch>
 <78ec24d09d129d52d3442f6319cf1ef5b6ce7f3d.camel@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78ec24d09d129d52d3442f6319cf1ef5b6ce7f3d.camel@phytec.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_052658_734047_854780AB 
X-CRM114-Status: GOOD (  16.91  )
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

> > I agree it is long enough, but i'm also surprised how slow the kernel
> > was. Are you using a fixed IP address, or dhcp?
> 
> I use a fixed IP address.
> 
> But isn't the bringup of ethernet+phy interface one of the last things
> that happens during the kernel boot-up?

Mounting the rootfs is somewhat towards the end of the core
kernel. But if you have an initramfs, there can be modules loaded both
before and afterwards, and once the rootfs has been mounted, yet more
modules can be loaded.

> However, what timing would you expect?

I've seen interfaces configured up from deep within
register_netdev(). I don't remember the exact configuration, but i
thought it was NFS root. It might be in combination with initramfs. If
you have the Ethernet driver as a module in the initramfs, and are
using the "rootwait" option, it could be that you are already past the
point it would first mount the rootfs, and with every new device
popping into existence it is trying to see if the just created device
allows it to do the mount. At that point, register_netdev() is going
to trigger actions.

	Andrew

