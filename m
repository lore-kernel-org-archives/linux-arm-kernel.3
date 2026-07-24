Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCF8C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 13:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JC5m34jALCEFafeMU7h6wca0BxlqZu9tFlZOqOnDQk=; b=srNSPxJbm8q7YhGQaA3EWsnPJA
	0sJLyE0lpYgdet0AWt4dgjqN50/TW/dRV/JbCBoht8+TyxVmkOuxYp+eLqHsgvnGNtbUeNHNAdNG+
	HPjmnl7jrS2UBgK8KZ2LomA/C2J0zLG0t9JDTMt5o+hWKpH6s3yNbdsveBIwy8cjQK61gl+2yY1Oo
	bq7rAChtv0NsQPmoEvcJLabCgZWfSGW5jhYiiv+f/LvRuhmVbfvFhSLSzhsYucjMPoN35Qu759iie
	HJqVre47nzA3EfoXVGAif7N2al5LeRxPJctwmMdSt8Qq51MZKamTIjb5or840pftZRQk4+lCosrqu
	VYz+z+vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFaf-0000000GRp1-2DRU;
	Fri, 24 Jul 2026 13:05:25 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFac-0000000GRoQ-3GFu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 13:05:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9JC5m34jALCEFafeMU7h6wca0BxlqZu9tFlZOqOnDQk=; b=n46vKnAnrJ9jg3V6k/AqX6Nsge
	5d/kiS77xoxJVZ8MQGOFh+SExxGqKvgx29wXVgqkLZFaYPM59LMWORBIk4nhOtMonii4+cOjH764N
	in1JjawAdvOxNuaxGL5Yen2F+b4GtFn6/FGKx3QFcAYFh5gvtKgA0VPfbvn1cIDyKG8Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wnFaQ-00Dza7-TE; Fri, 24 Jul 2026 15:05:10 +0200
Date: Fri, 24 Jul 2026 15:05:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Zxyan Zhu <zxyan0222@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Subject: Re: [PATCH net-next] net: phylink: add phylink_pcs_loopback() method
 for PCS loopback support
Message-ID: <ab95d5f7-dddb-4980-91c6-5be12172534c@lunn.ch>
References: <20260724085224.3321663-1-zxyan0222@gmail.com>
 <42606cde-cdef-420d-adf4-b28c353d564b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42606cde-cdef-420d-adf4-b28c353d564b@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_060522_827083_79114B6F 
X-CRM114-Status: GOOD (  10.24  )
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

> Besides that, I don't see and PCS that supports that loopback, I think
> it would be nice to also have the PCS code for loopback as well...

That is pretty much required for merging. We want to see both sides of
a new API.

There has also been discussion about in which direction should it
loopback. Towards the media or towards the host. For self test you
want host side, but as an exposed feature for user space to enable,
media side could also be interesting. So you should think about what
the internal API looks like to be able to specify the loop direction.

    Andrew

