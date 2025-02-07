Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58219C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 13:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7B6nKxsZ/sgpbYSbmczXl/HDAlWGMnjUjIEUqDEu3fE=; b=gCOXQ/xhMPsu0Wr11v/2qmzAXo
	wD0v4xtuOL7UCaEWCGh6Ntjj85FhGIKC3gzMBJvLJTSeYmcBCOHH0WWlLNZGorvIbyJj9j9oRiHMM
	pXqYngsJosy0TyRA0/XLRZumSGDz4oJGuiL8oUS0GH4/00TZpsSvgejpGiGv+s2IZfc8QoqmC4UWN
	X7FLOfivVdHIM+I0FDonBJU7k3T1EWH1CjY8wxUBpsjlCCjAuOsbMlzqF7wsK/NWQdPUtJBnm57V5
	CAj3Wauz1VSbwpo05TG6v/0ce+wPvIyrKPZh5WmdCuLgniMl9f1ly96Q0bU/UrK/r2LJNJ5S16On4
	QWDd0GaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgOV2-00000009fj0-43y7;
	Fri, 07 Feb 2025 13:34:28 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgOTf-00000009fL4-0fQv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 13:33:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7B6nKxsZ/sgpbYSbmczXl/HDAlWGMnjUjIEUqDEu3fE=; b=ikZHdtybyl/A4VFw2VkwQGYUTI
	I5VXMO2Dsq9C6j9NPVSnVHI8byHRtV/uaWU/t71xO8V9YWONlWrw4NkA31Qgj7jaXKhYUM+5sSJwd
	EGZH7ss/mH8O6TO7DqY00Yy1HTQRU6CUGICBH3CUAKUQ5s0GbwiSc7s9zIREc3Phv1Fs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tgOT6-00Br1x-S2; Fri, 07 Feb 2025 14:32:28 +0100
Date: Fri, 7 Feb 2025 14:32:28 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	David E Box <david.e.box@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	David E Box <david.e.box@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Serge Semin <fancer.lancer@gmail.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v7 2/7] net: pcs: xpcs: re-initiate clause 37
 Auto-negotiation
Message-ID: <12e86fbe-9515-4b81-951c-8bf86e2939d6@lunn.ch>
References: <20250206131859.2960543-1-yong.liang.choong@linux.intel.com>
 <20250206131859.2960543-3-yong.liang.choong@linux.intel.com>
 <Z6TVmdCZeWerAZKP@shell.armlinux.org.uk>
 <564ede5d-9f53-40be-9305-63f63b384e15@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <564ede5d-9f53-40be-9305-63f63b384e15@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_053303_189562_D05DE7DB 
X-CRM114-Status: GOOD (  11.78  )
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

> Good point. I cannot find this scenario in the datasheet. Please allow me
> some time to test this scenario. I will update you with the results.

By data sheet, do you mean documentation from Synopsis, or is this an
internal document? Assuming the hardware engineers have not hacked up
the Synopsis IP too much, the Synopsis documentation is probably the
most accurate you have.

> > What about 1000BASE-X when AN is enabled or disabled and then switching
> > to SGMII?
> > 
> According to the datasheet, a soft reset is required.

Do you know if this is specific to Intels integration of the Synopsis
IP, or this is part of the core licensed IP?

We need to understand when we need a quirk because intel did something
odd, or it is part of the licensed IP and should happen for all
devices using the IP.

	Andrew

