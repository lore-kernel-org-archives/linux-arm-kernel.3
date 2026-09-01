Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65A7C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 00:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOCnMiWwuAqeY7230RPEeGlPmrcMUY6HdWpI0w4hMDA=; b=Lf9d7RVevvHzNPEuQZDG1BtkFi
	r8bHWbFaDJAz33vZyJZzrwpTI66NH5ydg+kvn9RYDcSreJdCb/KPDtbCsDMheUYhX1gfcqfoMSqnL
	hM7375AZU/868FtzoofMTWerqJSIB68Ou8bbMPTPHblieFjruEvz3z87Zf+MExILZK7ArekQAJluL
	1we6/tul/h4s0dZeItt1rRPPYnAYpcMVL49+1jORQhj1kKnUcAAyRtFfqV7pbDrDpVFRxE/f6d+xR
	5ybI1ftxLQmAq3FYE9szxKT8mwHuvtMRyhLH0gSus6etqGZQf2WVGh41fDFHiC1KHF1u2SANvNHUP
	JyPXAMXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1C3k-0000000AhTV-1wFg;
	Tue, 01 Sep 2026 00:09:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1C3i-0000000AhTO-2pjc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 00:09:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE8DA406EF;
	Tue,  1 Sep 2026 00:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4AA1F000E9;
	Tue,  1 Sep 2026 00:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788221341;
	bh=MOCnMiWwuAqeY7230RPEeGlPmrcMUY6HdWpI0w4hMDA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=TX3AkNbqanYf/UIUjrymI1W/9kEbYODsuEKCcVac0QFQGRRXvMVN2a6k4ib+zl02L
	 4dp09cP7ahoQGjNCsqXtcXaFrithQUTh04xQeBPXot8wQCv9TS8AwMYLKarPmDo4wf
	 JQpgQ3Qy5IbFW8obwGz+bkp8TYO8cE7Mlakf4hRnFAy62uK+fa+Zje7SPRSWjqiDGy
	 ikBThDDtZowX62erg0MYRdiH0H7OXM3w4c78GKFzWXvBeB/0sFmAq4TaEK3ZhfTL9e
	 moJ7m4a/a9eh0cWXOfpftQRl6gOiefrDNjJt0fpGwooDyr+QDzn0IJ9l06O+6lpFsg
	 laXtW67OdYyeg==
Date: Mon, 31 Aug 2026 17:08:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Linus Walleij <linusw@kernel.org>, Imre Kaloz
 <kaloz@openwrt.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org (moderated
 list:ARM/INTEL IXP4XX ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open
 list)
Subject: Re: [PATCH net] net: ixp4xx_eth: handle probe deferral from
 of_get_mac_address()
Message-ID: <20260831170858.7e23643e@kernel.org>
In-Reply-To: <20260827013634.167932-1-rosenp@gmail.com>
References: <20260827013634.167932-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 26 Aug 2026 18:36:34 -0700 Rosen Penev wrote:
> ixp4xx_of_get_platdata() returns NULL on failure, which the probe converts
> to -ENODEV, discarding the real cause of the failure. Return ERR_PTR()
> with the appropriate error so callers can distinguish cases such as
> missing DT properties (-EINVAL) and, importantly, handle -EPROBE_DEFER
> from of_get_mac_address().

Doesn't seem like this should be treated as a fix, AI says:

Can a device tree that actually reaches this new code path pass
dtbs_check? -EPROBE_DEFER out of of_get_mac_address() only comes from
the nvmem lookup:

net/core/of_net.c:of_get_mac_address() {
	...
	return of_get_mac_address_nvmem(np, addr);
}

which needs nvmem-cells and nvmem-cell-names = "mac-address" in the node.
Documentation/devicetree/bindings/net/intel,ixp4xx-ethernet.yaml ends with
additionalProperties: false and pulls in ethernet-controller.yaml only via
allOf/$ref, re-listing just phy-mode, phy-handle and fixed-link. It never
lists nvmem-cells, nvmem-cell-names, mac-address or local-mac-address.

Should the binding gain those properties (or switch to
unevaluatedProperties: false) so the configuration this patch handles
can be described?


And if this goes to net-next there's a bunch of pre-existing
bugs in the area which will conflict, so frankly let's just leave 
this be.

