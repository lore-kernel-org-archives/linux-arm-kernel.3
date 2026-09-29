Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B944CA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 20:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfgtS/3YR6scpKjdET977cAtpN9Rc4jD/Yqb7My/5vA=; b=X4nhaFuFUQ8pH8klR1ecQfEDar
	HixVubgUgB0Yl4jvMFYq6dQqr2GUt3jtCy/ggf0yq0hvL+lQgEx/k49xbXjFgXJ47T2yE9/KTONeO
	6+DYL+T2oMrxH5umUv9Y0JvBQq79XmrvnPOZFQegBo2PSlKw/seDVqBTbtIbWzLsUKtk+4d3rwPja
	7gYk5zRRlsq+nQarUzz6onCCLLYik5uhwPgYgCf5N5fc+Qf/uIeNu11oAya9XQThN/j00r6VMR3Vc
	GhTgDRAwyg5VMUkmJZo1nW3R2zIjQIS0njOxEh6MfEFBxruYwaY7caDAq5wstMWeKp+vEiJidivHN
	RJQfsa/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBeSB-00000004Udv-4AFB;
	Tue, 29 Sep 2026 20:29:31 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBeS9-00000004UdI-3vlr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 20:29:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qfgtS/3YR6scpKjdET977cAtpN9Rc4jD/Yqb7My/5vA=; b=yPfdCekBA5Kcq5J/6HSwIFdFQo
	SDnUZT/d8eApuGgo7Btq1y0HrEsVFqW2lss1toVaq8bAjnYxdQ+2qCwjwwKmdXjo99aUqBSeeR2v2
	NgPXtEgdl9KHgRFc9n2Q5L4s0uj/JBNCtRyg6wHCdWIZUOzGsgtXk9nwaYyCCztFdHYo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xBeRu-0081vz-AK; Tue, 29 Sep 2026 22:29:14 +0200
Date: Tue, 29 Sep 2026 22:29:14 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: Disable checksum insertion for XDP frame TX
Message-ID: <f0d8c25f-96e1-4da8-af6c-3286610338ba@lunn.ch>
References: <20260929121025.20821-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929121025.20821-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_132929_976671_BF5617FA 
X-CRM114-Status: GOOD (  10.43  )
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

On Tue, Sep 29, 2026 at 08:10:25PM +0800, Jisheng Zhang wrote:
> stmmac enables TX checksum insertion for XDP frames whenever the queue
> supports it. XDP frames carry no TX checksum offload request, so this
> can overwrite a checksum already present in the packet.
> 
> Pass false to stmmac_prepare_tx_desc() when transmitting an XDP frame
> so that the packet is sent with its checksum fields unchanged.

This seems odd to me.

If the frame contains a checksum, it is either correct, and the
hardware calculated one will come out the same, not an issue.  Or the
checksum in the frame is actually wrong, because the frame has got
mangled by eBPF before sending it out, and you want the hardware to
calculate the correct value.

What an i missing?

	Andrew

