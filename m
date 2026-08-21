Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58055C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 20:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmCkvVLaR+rDdpiswuyBWNbJIzNwVmoEfscdzHsxPY4=; b=aftAbLTxopf9eUVT7kWQ5cwvZy
	HcJiAzez7xCUVk7ehEq1XZo9lED2r4tf9Wgufs4S7HaLPhM3ly/yxjLno4jZ6wOREcfoIShvWsa/H
	F48HkEIxMVRBIQ8vVkJ05CVb9viOWbF5v1q5K/hcNm0IvVJ2OW8zj+oW+JsY78ETw0Un4mWe6px7p
	fuDM9Gyf/Cl0hKPJ85lgguLS5G4L/zIiGOF9sbzyn5sJ/xOEhM8qpphOrXAck/StZ6tjr6Z+BmnWz
	Jmeo17N0I8ZUe8ux5uk/UG/nTT1GjDHy+Nqkp3jJC1G+kItmL2ujQJyjL9VXajanxqTJs+9DDMnnC
	s+igek9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxVoR-0000000E2lR-0j2w;
	Fri, 21 Aug 2026 20:26:03 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxVoP-0000000E2kv-02aB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 20:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wmCkvVLaR+rDdpiswuyBWNbJIzNwVmoEfscdzHsxPY4=; b=a7QG3wHIEqBeNup0aOP/3SXNCK
	b/fgiENDUdqt+qKEejNuut+mH5qWjF2CL2uJ6na0VbQ8wRYS7cePRgEg1o0e9cjIj9ef3zN8kkKzh
	iYQu6H38mK8vhU3EZxbXH06yBS6N7LYIISBgvOsB8V2CbLLtp5ttvduJVWmcNBQ5W010=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wxVo3-000yLH-Ea; Fri, 21 Aug 2026 22:25:39 +0200
Date: Fri, 21 Aug 2026 22:25:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Kurt Kanzenbach <kurt@linutronix.de>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Bianconi <lorenzo@kernel.org>
Subject: Re: [PATCH net-next] net: stmmac: stm32: Set TSO/TBS Tx queues
 default settings
Message-ID: <5d48515a-862d-4990-b4b4-12d86fb6f3b0@lunn.ch>
References: <20260812-stm32mp2_txtime-v1-1-f9e2462cc85d@linutronix.de>
 <20260817103337.74c30adc@kernel.org>
 <87mrujzzjv.fsf@jax.kurt.home>
 <20260818075335.48936b08@kernel.org>
 <87h5kq1s1f.fsf@jax.kurt.home>
 <20260820144528.7107ba90@kernel.org>
 <87y0e0x7ic.fsf@jax.kurt.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y0e0x7ic.fsf@jax.kurt.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_132601_049371_B1C1BA88 
X-CRM114-Status: UNSURE (   9.24  )
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

> No objections here. I've briefly looked at the TBS thingy. I think we
> just need to reconfigure one Tx queue instead of doing a full
> release/open cycle. The XDP/ZC code does something similar. So the
> infrastructure seems to be in place.

I suggest you look back in the list. There have been a few emails
about people working in this area. You should try to do some
coordination.

There are some symmetry issues which would be nice to solve.

	Andrew

