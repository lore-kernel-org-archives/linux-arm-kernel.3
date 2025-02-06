Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1953BC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 22:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XOSx2sfWIkI9mBDKykXkoY9x3FYft266g8j9/dZB04w=; b=4xWnxL2XQnRTTCgZwIOOhckSgF
	uUqxdgldBgK3e2K4+K73L2i78UWN17J/+su+AFUT0X0UnOUhGhq/PTKR5z5cd+dAsf+iIc0uMpLU8
	TsQ8Y16Cp1mSpeOdqNQA8p0ZG8e52/U2Sk+buEJIFyiykY3AjI1iwx3G1GSJjgwezQBH+jUKWeQZl
	yrtmnHWsFzDCYb0o3ML3wgYYUoVkrkewalb5lzsd2z36j8mjiPXPNzFCwWcGPjK8gAT9s1RvVWxAL
	Srz3gbs4KpScLDU0U++cDh2neQnENzb3r8XwZsoeNrdHkoeK0SYTYE5eO7aGGWu23Lt9+07EutAxu
	dfWrQYvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgAhh-00000007irg-14L5;
	Thu, 06 Feb 2025 22:50:37 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgAgI-00000007iaS-0qvi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 22:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=XOSx2sfWIkI9mBDKykXkoY9x3FYft266g8j9/dZB04w=; b=juRHjv2n+fKYuD6WHRHIhhjvlh
	Vtjwc9Xzmg7ts41hb/43PvfAfwxPd9MLLH/y29BoqJABpBBgu22W//cuSVwMjd2uxaAP2r23YSybs
	v/04cy12RHHAmaMg3Q9oLy6gSYR1UdA3DKKT5UbSKLYry/46OQfOKlvTLQEujH8VaXTA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tgAfS-00Bemr-0z; Thu, 06 Feb 2025 23:48:18 +0100
Date: Thu, 6 Feb 2025 23:48:18 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Choong Yong Liang <yong.liang.choong@linux.intel.com>,
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
	Russell King <linux@armlinux.org.uk>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Serge Semin <fancer.lancer@gmail.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v7 3/7] arch: x86: add IPC mailbox accessor
 function and add SoC register access
Message-ID: <9f6f009d-a2c0-4a6c-b9df-4045f767f8ab@lunn.ch>
References: <20250206131859.2960543-1-yong.liang.choong@linux.intel.com>
 <20250206131859.2960543-4-yong.liang.choong@linux.intel.com>
 <063bd012-d377-4d3d-9dcc-57e360d8f462@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <063bd012-d377-4d3d-9dcc-57e360d8f462@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_144910_233444_52F7D600 
X-CRM114-Status: GOOD (  12.16  )
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

On Thu, Feb 06, 2025 at 08:46:24AM -0800, Dave Hansen wrote:
> On 2/6/25 05:18, Choong Yong Liang wrote:
> > 
> > - Exports intel_pmc_ipc() for host access to the PMC IPC mailbox
> > - Add support to use IPC command allows host to access SoC registers 
> > through PMC firmware that are otherwise inaccessible to the host due
> > to security policies.
> 
> I'm not quite parsing that second bullet as a complete sentence.
> 
> But that sounds scary! Why is the fact that they are "otherwise
> inaccessible" relevant here?

And i wounder what other interesting things can be accessed in this
indirect manor, which the security policy would not otherwise allow.

Somebody is going to have fun here. Or is already have fun here.

	 Andrew

