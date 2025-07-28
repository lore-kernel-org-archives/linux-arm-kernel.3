Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BEEC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 17:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NKVSbJ3EylcastEnGb+9vHs9axW6SpWMaxjBfENn0c=; b=YHRVc4CL/azCcShYyznouFq0i+
	t1EpeXOp6SXiyYcSs0WnttseGZPGvWEjFB8M+JlfRnyx3MVGER7IT/Aby37cYN3FnwJFrrFp6KVpz
	/mnDAHyHXMeZ7UuBhnIuFauoDKJmurlrkR1mtFW0nH9itNHGYQHt+xSioys8BhthApmR+pDJF1ys3
	mGyGk2IYAFu9WSMXLjdBeuoNuOyJd7aFP0VVhgHPBlbozMl6rgYEui5wbBe9tlfZafsKlPMd27zf1
	UfMlsusDxadCG4iCPeFu1WGTl4lVe14FoN7wlI+wj1HIUbRBREboHEv0VK/lejIf2i6JIDpYsDsyo
	TXitNHbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRiG-0000000F6zz-1Z7r;
	Mon, 28 Jul 2025 17:32:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRJS-0000000F45C-1FN6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:06:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9NKVSbJ3EylcastEnGb+9vHs9axW6SpWMaxjBfENn0c=; b=NYW911v0akys02RoniGWSqq53V
	d3/uE7aOCooTAypvLjOr2Sw128ojLzoRUEVF6hmqkwlv1dg12Z5YwnrdGaNELrz+ZXBLC9SlD4RiK
	UFyBXEk3HxVIsX3LcY1FKhRhrONwE7YUpD0Bfm1T65OA20yuw+fN5aLjuNtHkT4Z9cKU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ugRJN-0037IP-Ga; Mon, 28 Jul 2025 19:06:53 +0200
Date: Mon, 28 Jul 2025 19:06:53 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH RFC net-next 4/7] net: stmmac: remove unnecessary
 "stmmac: wakeup enable" print
Message-ID: <0822be86-f344-4b38-9cef-732145b78ce6@lunn.ch>
References: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
 <E1ugQ2t-006KDF-H8@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1ugQ2t-006KDF-H8@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_100658_332727_9435436E 
X-CRM114-Status: UNSURE (   8.54  )
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

On Mon, Jul 28, 2025 at 04:45:47PM +0100, Russell King (Oracle) wrote:
> Printing "stmmac: wakeup enable" to the kernel log isn't useful - it
> doesn't identify the adapter, and is effectively nothing more than a
> debugging print. This information can be discovered by looking at
> /sys/device.../power/wakeup as the device_set_wakeup_enable() call
> updates this sysfs file.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

