Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B54CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 01:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8SEbiV6bsY5wk64SP2GhKRTTTiaEXDFSuX28Ph1mjg=; b=f7B//vcokETJf0lW4PIWzluCWG
	olQyIiFPdcLI4/jaOzCw6TaoNjOPCD+OEdEZs2lkGNwiexfDIu7ENf+0soc5cu3pJPiCzW056g9Mq
	pq9BCaBNSru7HAwROcNf0j7OVXXwUA2iiu/QM4ktUO3dw6gOHNkjkjW7kmbR3mKznekqm0Pq5wZ1M
	6wmk4g2IDnUyKRVAgodsjv9dPxM7qqLvDxUkiHttqkyqJlN5INey0DkUL45TzPFpq+d6h2rNy9hGY
	sBMOVIBUEycChd+uZ7vsCa0wLkS+ePm2cSPR1GTjyGQO3fUbhF1w0ELxnzt7C5zC2+fWEa4flT4Jk
	CeSqxiRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1xdT-0000000EnjW-2XaA;
	Fri, 26 Sep 2025 01:52:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1xdR-0000000Enhw-2l8w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 01:52:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A644A4477D;
	Fri, 26 Sep 2025 01:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C302BC4CEF0;
	Fri, 26 Sep 2025 01:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758851552;
	bh=O8SEbiV6bsY5wk64SP2GhKRTTTiaEXDFSuX28Ph1mjg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FMB7Xx9105TLqKoh1eoqR0qRNhgr14jO3tRI1OchdSW2gQCzp3jbBaNCQqBxfDSNg
	 KqqJFu2EKPQMUEOdCOx+tlE0pubYwQ2IqPpHXDmyB1j5P7y0+6Q7grJymYg5sANG6d
	 uH7lsHvSva+WWyHgufaCC9jStvSoFTJhTtUG2umoHBevxEIicsu3OcTgo0uSqOMisS
	 3RS/BzofuflXzDC0oHFqgOPSkD9a8Glc0SpTQS2xoPSLXl3C9wmNkIyBDPGkYYWMpJ
	 NvJnOcYkzd7xM76Ql2RLLL/0oE1jdFecH0EOm0jhiyRDvMWemB1IcNVw2MSSODcbS9
	 MfnadFklajciw==
Date: Thu, 25 Sep 2025 18:52:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Cc: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Rohan
 G Thomas <rohan.g.thomas@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Matthew
 Gerlach <matthew.gerlach@altera.com>, "Ng, Boon Khai"
 <boon.khai.ng@altera.com>
Subject: Re: [PATCH net v2 2/2] net: stmmac: Consider Tx VLAN offload tag
 length for maxSDU
Message-ID: <20250925185230.62b4e2a5@kernel.org>
In-Reply-To: <157d21fc-4745-4fa3-b7b1-b9f33e2e926e@altera.com>
References: <20250915-qbv-fixes-v2-0-ec90673bb7d4@altera.com>
	<20250915-qbv-fixes-v2-2-ec90673bb7d4@altera.com>
	<20250917154920.7925a20d@kernel.org>
	<20250917155412.7b2af4f1@kernel.org>
	<a914f668-95b2-4e6d-bd04-01932fe0fe48@altera.com>
	<20250924160535.12c14ae9@kernel.org>
	<157d21fc-4745-4fa3-b7b1-b9f33e2e926e@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_185233_714318_E74F2351 
X-CRM114-Status: UNSURE (   8.78  )
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

On Thu, 25 Sep 2025 16:33:21 +0530 G Thomas, Rohan wrote:
> While testing 802.1AD with XGMAC hardware using a simple ping test, I
> observed an unexpected behavior: the hardware appears to insert an
> additional 802.1Q CTAG with VLAN ID 0. Despite this, the ping test
> functions correctly.
>=20
> Here=E2=80=99s a snapshot from the pcap captured at the remote end. Outer=
 VLAN
> tag used is 100 and inner VLAN tag used is 200.
>=20
> Frame 1: 110 bytes on wire (880 bits), 110 bytes captured (880 bits)
> Ethernet II, Src: <src> (<src>), Dst: <dst> (<dst>)
> IEEE 802.1ad, ID: 100
> 802.1Q Virtual LAN, PRI: 0, DEI: 0, ID: 0(unexpected)
> 802.1Q Virtual LAN, PRI: 0, DEI: 0, ID: 200
> Internet Protocol Version 4, Src: 192.168.4.10, Dst: 192.168.4.11
> Internet Control Message Protocol

And the packet arrives at the driver with only the .1Q ID 200 pushed?

Indeed, that looks like a problem with the driver+HW interaction.
IDK what the right terminology is but IIRC VLAN 0 is not a real VLAN,
just an ID reserved for frames that don't have a VLAN ID but want to
use the priority field. Which explains why it "works", receiver just
ignores that tag. But it's definitely not correct because switches
on the network will no see the real C-TAG after the S-TAG is stripped.

