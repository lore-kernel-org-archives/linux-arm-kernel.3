Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CA7C71157
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 07:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6oppky/HuD45K/qSvDG5L56EwYU89EoqMPm448d4Ck=; b=gcGsBIdFjcSeZcCAFiEFEe35EW
	Gu83CsXvssDomzVZjYhwMYkEBaR6hXKFgiQrj7lIHBqUAehaSOG22rx0WkU/LxnwXa1stUcTs1ZEP
	P0RD7ogWncUhbYMEVnYVa/4JdLfA3dgQ3hwbrJ39T1pAAoc/aQf/SURuGuXeov03iU7W/TRahreG8
	HnACMUYdMet0QhlNK8LSPApTGkVwnrjmdiqMt+p/VbfUNCD7GwluH2SGvh17JfO6UsF/oaxQ0Agrp
	PMj1H9f4I7EeDUVWh3auLGnlfW2h84pz9evMw5fCQWU1pMQ2z8d7T1ACF+PBwBBW/aRXWt5bEvP0P
	vejDwUOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSslL-0000000HClb-257U;
	Sat, 21 Jun 2025 07:35:43 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSsj6-0000000HCdF-3u5B
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 07:33:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=P6oppky/HuD45K/qSvDG5L56EwYU89EoqMPm448d4Ck=; b=zZr2EyrtjfAoEXFVpYOe75oQ7C
	h7TTzyrajv6hQX9CQRFer7tonijLaBrMATW2Af3XwfGWeRRSSnYo4QAsOnMN617iU76K89P+BTqKD
	dvyxUfF6yMdcRPzJ0FGgkLwtXlaTAZ2uEO/Stp7DvKShIXT1kDz50KFkVIhJIh7fBY3Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uSsin-00GZCR-UD; Sat, 21 Jun 2025 09:33:05 +0200
Date: Sat, 21 Jun 2025 09:33:05 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	Saravana Kannan <saravanak@google.com>,
	Leon Romanovsky <leon@kernel.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net 4/4] net: axienet: Split into MAC and MDIO drivers
Message-ID: <16ebbe27-8256-4bbf-ad0a-96d25a3110b2@lunn.ch>
References: <20250619200537.260017-1-sean.anderson@linux.dev>
 <20250619200537.260017-5-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619200537.260017-5-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_003324_968292_EB424027 
X-CRM114-Status: UNSURE (   7.50  )
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

On Thu, Jun 19, 2025 at 04:05:37PM -0400, Sean Anderson wrote:
> Returning EPROBE_DEFER after probing a bus may result in an infinite
> probe loop if the EPROBE_DEFER error is never resolved.

That sounds like a core problem. I also thought there was a time
limit, how long the system will repeat probes for drivers which defer.

This seems like the wrong fix to me.

	Andrew

