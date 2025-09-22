Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65D8CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 17:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0uUvXXuQlrZDLFgrY3/XK+3MnN3igPrTAHfLI+2zVQ=; b=btgVtselzN+09u0uWkbyKVogF4
	UVN0ku40p0AQ2Ou/Zgz9Fc5tpPURWPdhTsHD6QCxX+KrXwfcvHfmujduK4FIDJwkt9ppoq0wJFZPM
	6o8zcMtxHCwNJtTxWaf+s9rUGlssz8bdE1Z9xD4skoe3fp9YOHLSJXqwO81MY3XSu6BE6iQANO4CO
	fMHSckJ4OT19O9bQAuglgHDYnKUlOY/w0UEonKGFyWC63y4YaR9fwZZy6IchyhLR9txuG+PqpVST0
	UFbq7eHTQwGxOOkh3z5a6BCjFSoHRdls4d22I/xHEvuD8VVqYQ5U3IBnwr/TG4Tv9l2TgzWvIDcGn
	hxvxF56Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0jyt-0000000B3Uq-0KKa;
	Mon, 22 Sep 2025 17:05:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0jyr-0000000B3UE-0Hwv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 17:05:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F5AC40BEA;
	Mon, 22 Sep 2025 17:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5240C4CEF5;
	Mon, 22 Sep 2025 17:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758560736;
	bh=aB41Del3g0nOA+kFSYQYpkWIe9LOgh+neGwq9E8TZ/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oyLdi0ayT0aqVNMp+NAnnqmKMZU8LE/Z8pI+DgUCXRagaJXUQE8nzBE0zVj7a6/Ek
	 iz0b4gKpWMOKM/DmDDzJF1X9fIe6fGbg44ZJ7sereMMo8kRRqSJK7b3Klbe9bwVi1C
	 BvyQ7oZqfv4R/tv4F6BZHQHvKzTDjvthu9lAs6gSajdWyw0QRSwB5+jFF7VCbfpJT7
	 Y+FACemuaEeWt8jogzH1Be44PxCngu+YUCJI9SFzobW25FgBcY9qhU2rMOpuhw15yg
	 blZPN2eSj7PH5CptcE7u9r74WWbvb+isvaWIi+rpHXNLtebtSmzG/qpG2N5IQwwZE7
	 Jjz28vUQjzF6Q==
Date: Mon, 22 Sep 2025 12:05:34 -0500
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Tristram Ha <Tristram.Ha@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/4] dt-bindings: net: document st,phy-wol
 property
Message-ID: <20250922170534.GA468503-robh@kernel.org>
References: <20250917-wol-smsc-phy-v2-0-105f5eb89b7f@foss.st.com>
 <20250917-wol-smsc-phy-v2-1-105f5eb89b7f@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-wol-smsc-phy-v2-1-105f5eb89b7f@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_100537_126357_D605B44D 
X-CRM114-Status: GOOD (  12.09  )
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

On Wed, Sep 17, 2025 at 05:36:36PM +0200, Gatien Chevallier wrote:
> Add the  "st,phy-wol" to indicate the MAC to use the wakeup capability
> of the PHY instead of the MAC.

Why is this ST specific? PHYs being wakeup capable or not is independent 
of ST. If you want to or can use wakeup from the PHY, shouldn't that be 
a property in the PHY?

Seems to me you would want to define what all components are wakeup 
capable and then let the kernel decide which component to use. I'd think 
the kernel would prefer the PHY as that's closest to the wire and 
probably lowest power.

That's my 2 cents spending all of 5 minutes thinking about it. I'll 
defer to Russell and Andrew...

Rob

