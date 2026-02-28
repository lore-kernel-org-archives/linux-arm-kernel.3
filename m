Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F60DFEE4F4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 19:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6e8Kk9sDuVzXge9VGsB6VDrYnR3IfoFrD7bW1dGxh9k=; b=1g47ufpdhyQPUaXuTDtIeD9Z+Z
	w4U80+7tz2TuWvaA0yOalTRSCH+ShkW+w/KGm9UDogPz33cPDM5VVxyFPaohin6/Sfkzp2UBpx6n8
	c609D0I6lUBfrliRkH6s0+DxOjQXuVaNjN/A5udUF/SV8aDkY3iubI/QsrT2ppR7UU/eY8+VUHSU7
	YPF4Py9Q368s7T+veVaPrDTEQsr4eKMVZdqqu2isrtN4iH2m5NwK4rkqG55xqi8nfwZf7Ns1iSr0j
	GjGBmcmyv4aDEGwHGQv9S30KvnwPMmpSokAsWgej+WS9Kklp2TmvScpT01Z9Bq9X7HiT6iK4r+nyg
	WMMTVtfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwPbo-0000000AB0A-04kE;
	Sat, 28 Feb 2026 19:04:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwPbm-0000000AB02-3DQM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 19:04:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 38530600AD;
	Sat, 28 Feb 2026 19:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C86EC116D0;
	Sat, 28 Feb 2026 19:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772305449;
	bh=zDXo0tm/VXl4ZESFurteuRBanIADwE9LLD324tu0poo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QIlPZS2fZrYutqz2v8HmVp4lM1V49xxMFqLSeyiZJ+6lS/r44DXU89p/gTisqL7GI
	 ePvEPNAyVoGMdl3+/HFpO49Q6QT3HAaxK9EaUP3xOr8VW5OLXTsn1+Gb+Zi8DLA+QA
	 yoMEyyD/tYvXTCkZDoEtfY+Yr7lO8+0CfomJWEFZa5uOlFHrWZFGBltQcTo52fwGdP
	 25dQma90g2q296jWpA3ALn0pQMNX5FzNmUxoWHcF6eBDnp9+vM5Noufl6v1XCPELlL
	 NJ+Zc4tSHp08Yd0appIYwZSG0bMs6OF+xZ7225kekwjVVWvB3YSvdWXgyhXS+Zr92y
	 7/Vsm/rnHadzQ==
Date: Sat, 28 Feb 2026 11:04:08 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, rmk+kernel@armlinux.org.uk,
 maxime.chevallier@bootlin.com, boon.khai.ng@altera.com,
 rohan.g.thomas@altera.com, vladimir.oltean@nxp.com,
 hayashi.kunihiko@socionext.com, boon.leong.ong@intel.com,
 kim.tatt.chuah@intel.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 4/5] net: stmmac: Add write_hw parameter to
 VLAN filter operations
Message-ID: <20260228110408.384420e1@kernel.org>
In-Reply-To: <20260225142414.130144-5-ovidiu.panait.rb@renesas.com>
References: <20260225142414.130144-1-ovidiu.panait.rb@renesas.com>
	<20260225142414.130144-5-ovidiu.panait.rb@renesas.com>
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

On Wed, 25 Feb 2026 14:24:13 +0000 Ovidiu Panait wrote:
> Add a write_hw parameter to the VLAN add/delete HW filter functions and
> to stmmac_vlan_update(). This flag controls whether the actual hardware
> register accesses are performed. When set to false, only the software
> state is updated.
> 
> The next commit will use this to defer hardware writes when the
> interface is down.

I wonder if instead of passing attributes like this around the driver
shouldn't simply maintain a flag (or have other way to test) whether
the clock to block X is currently enabled? It feels more like a global
state / property than trickiness directly related to VLAN config.

Also any strong reason to post this for net-next? We take fixes via 
the net tree, so when you repost please use "PATCH net". And an
appropriate Fixes tag on the last patch would be great to have
(presumably just ed64639bc1e0 again?)
-- 
pw-bot: cr

