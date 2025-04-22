Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1486C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 09:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0w6pamxCxDKHzVZmfTHs/uYuK6PeXKb0434M6fEc3M=; b=Q2eoVnBa0JyjKITrGIKWfxiNmM
	wq+ezAeqVIx9AzXfRlSvPpeO6jNjCHUbgUBFh2cGqxF34YAQDyIpvju4RexUiXaVcTILKEcUTnZis
	RbfdxKMi9VyeTrPetzHE4152jfIeyeisyBzk+u7rq6uzeEhLe6zmRMd9O0aw8d5lEgQkUvCmJt5A3
	YyYXwf1+9OMEE01DTjZDRanzDkhqUz5HBu3bpn2YMe3IauoEHe9DrG1+7IRnDS0AL1LgQ4cftsxUI
	kxbUHElVzZojSh+gmzM1/BcWEeQBQNBT2PM2fd9m9XpNw8IpyLL4ictuIgkayhaY+06+59/FkcKK6
	URxX0BtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AAc-00000006bRQ-0U8V;
	Tue, 22 Apr 2025 09:44:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79B8-00000006Nvh-2G2J
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Apr 2025 08:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=o0w6pamxCxDKHzVZmfTHs/uYuK6PeXKb0434M6fEc3M=; b=MNW2c/CFmCQFIDomGQ/FfTceNr
	6eL4BAczzCtyyzWaMjyQEWdLp9/9EJXRTfO6lMe5muMjpZzU+Qh91vQrt7S+yljSh7HSYSTQPoTAo
	sV9bxOGLm6XDVkj1kNt23/USsJl7avZAuYgMEtwI4Sf9X23nJrW4p+TUFbFPsysaL9xS48Sg8vnCq
	QUYu/OoCIZGyQzCgf6cZVmmT8lx0lh2DO2agrisqYrwhkihIbCam2uq0IbvDjaN2YUMw6/p2W/gJT
	5yydGs8Lcw/KPwSJyXtMsm6zrczB4iDa4nMLNuyYRyoIxGHreqrt5pjyCFgaIfXr6Y9vstQGEFzNF
	QdmlnSxw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u79B4-0000000BA3B-29dw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 08:40:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=o0w6pamxCxDKHzVZmfTHs/uYuK6PeXKb0434M6fEc3M=; b=pY1FOnwL/S8J3yGEKh1QZZ5tZL
	Vp5eQoQWU2/fdqKvavzm9zcqh0HuU5etRNXQGprVs9hiAsBfNYdPqrgId2x5g/Xe0bKHniIm2xhvE
	8qg3NSfGSBE/rkWYZks9XUrVuCuPYpQP1SMdO3Ip+CZZ50Utq3eo9em0yld9lfynz3LfK+NJMuc+A
	ZqdNlAzkl5OT2o8YyCKMhreS5amF8eK3LuM7nR4+SHjRhbC9YRoQ1WMob9krsSoaaSnHEVBf1u6/r
	YxqplweIaUZVt50eYcclgDhxG7A5F7pkPpGykSHp04WnpNU8QIqCrDU0sf7ITae99C+JYPuZxBI4C
	vfDNrPJw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42670)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u798f-00042g-1a;
	Tue, 22 Apr 2025 09:37:57 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u798X-0007KW-2n;
	Tue, 22 Apr 2025 09:37:49 +0100
Date: Tue, 22 Apr 2025 09:37:49 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>, Tero Kristo <kristo@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: ethernet-controller:
 update descriptions of RGMII modes
Message-ID: <aAdVXQhR7-mYl783@shell.armlinux.org.uk>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <218a27ae2b2ef2db53fdb3573b58229659db65f9.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <6be3bdbe-e87e-4e83-9847-54e52984c645@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6be3bdbe-e87e-4e83-9847-54e52984c645@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_094026_711289_90704F14 
X-CRM114-Status: GOOD (  17.74  )
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

On Tue, Apr 15, 2025 at 04:06:31PM +0530, Siddharth Vadapalli wrote:
> On Tue, Apr 15, 2025 at 12:18:01PM +0200, Matthias Schiffer wrote:
> > As discussed [1], the comments for the different rgmii(-*id) modes do not
> > accurately describe what these values mean.
> > 
> > As the Device Tree is primarily supposed to describe the hardware and not
> > its configuration, the different modes need to distinguish board designs
> 
> If the Ethernet-Controller (MAC) is integrated in an SoC (as is the case
> with CPSW Ethernet Switch), and, given that "phy-mode" is a property
> added within the device-tree node of the MAC, I fail to understand how
> the device-tree can continue "describing" hardware for different board
> designs using the same SoC (unchanged MAC HW).
> 
> How do we handle situations where a given MAC supports various
> "phy-modes" in HW? Shouldn't "phy-modes" then be a "list" to technically
> descibe the HW? Even if we set aside the "rgmii" variants that this
> series is attempting to address, the CPSW MAC supports "sgmii", "qsgmii"
> and "usxgmii/xfi" as well.

phy-mode is quite simply the operating mode for the link between the PHY
and the MAC, and depends how the PHY is wired to the MAC.

The list of modes that a MAC supports is dependent on its hardware
design and is generally known by the MAC driver without need to specify
it firmware.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

