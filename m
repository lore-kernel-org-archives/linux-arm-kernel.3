Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AE7CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 08:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGaGxMpVNgSqeQ9n2WyrmVjFRKdNFeYqvaUsm2e9gZw=; b=nZgd++URcEgMi/u6fbJwl0wpnN
	lHR0LNmJHhK1e8qQHjZ1Pc3MQaTuQq/NSqvt9iztpIpDJKMpj7k6IdGxuoZ1qcCqSfM1tGE1nttdn
	WU3jw724k0nH/d6kd+KC4+3hkRj+qt7N/VfsB25oAFSFvw5DgWI+eQ+Dc+FE0Aiy84VPDtr+M02jG
	vH9b82MNIsPLwRu/FtSQ7q4DedbenrKHV1aLCoSzCGeMFTgxSICfoceHNJ/BnhuUOIuGnNGfpQR+u
	22MMB5JimJzNu+JC04r89Q3KGNuDLSHwhfFIJ//zSSMSDJgHvALKSJU2CdzXo6kbL/ViCSg0rF0Fb
	79YUyBJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Jjr-000000043e1-2gyh;
	Thu, 16 Oct 2025 08:53:35 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Jjp-000000043cr-1wWY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 08:53:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yGaGxMpVNgSqeQ9n2WyrmVjFRKdNFeYqvaUsm2e9gZw=; b=OL5a+pi/A12eJjtMu+Zl+xG+6b
	uwur0eUa7WIZGxalvgkrU+0CYfHE0zFYEV6HEsuUYO1qD48/NEPqCt29fRRdXbmjXnZQNHzn3/zcm
	VWfZtq/EEO+YOxhfIZZEQbR4/MtO1yMmVSDLfiveFUIlq+PrwACRDgA91/Y6zoF4wQJG2PbxGsFq9
	8R9HUQGN1i7joMrJXfzirY1Apw5O2q/iRtOHFGdTYjqYza0vrccSNiNq3dnlCYLWvz+D5iAMlcrbP
	7DeQuDkhZCvxu7TCdO5Q6lZFcndkcwuomyJmWnemd21nFunshOu92PgemoDsQwRlDIbSaCpR+qhB3
	hJSYpmag==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56192)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v9JjZ-0000000061L-2CVx;
	Thu, 16 Oct 2025 09:53:17 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v9JjU-0000000038g-252V;
	Thu, 16 Oct 2025 09:53:12 +0100
Date: Thu, 16 Oct 2025 09:53:12 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 3/3] net: ethtool: tsconfig: Re-configure
 hwtstamp upon provider change
Message-ID: <aPCyeCOMX7FHnZkY@shell.armlinux.org.uk>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
 <20251015102725.1297985-4-maxime.chevallier@bootlin.com>
 <20251015144526.23e55ee0@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015144526.23e55ee0@kmaincent-XPS-13-7390>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_015333_521340_CED6EA76 
X-CRM114-Status: GOOD (  17.97  )
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

On Wed, Oct 15, 2025 at 02:45:26PM +0200, Kory Maincent wrote:
> On Wed, 15 Oct 2025 12:27:23 +0200
> Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:
> 
> > When a hwprov timestamping source is changed, but without updating the
> > timestamping parameters, we may want to reconfigure the timestamping
> > source to enable the new provider.
> > 
> > This is especially important if the same HW unit implements 2 providers,
> > a precise and an approx one. In this case, we need to make sure we call
> > the hwtstamp_set operation for the newly selected provider.
> 
> This is a design choice.
> Do we want to preserve the hwtstamp config if only the hwtstamp source is
> changed from ethtool?

This depends what is meant by "preserve". If the hwtstamp capabilities
of the two sources being switched between are the same in terms of how
userspace configures them, then it's fine.

However, it's my understanding that the hwtstamp configuration is a
negotiation between kernel and userspace - drivers are required to
return back to userspace what they're actually doing when userspace
requests a certain configuration. If the hwtstamp capabilities are
different, it breaks this model because what the previous instance
reports back to userspace for a certain configuration could be
different to that which the new instance would report back.

This could get worse when a configuration is set on the previous
instance that isn't supported by the new instance.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

