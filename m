Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A46C369A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExvwBUHTzULfJk+/cnQ44m4BlH736pb7CuHkDdg6Pus=; b=YRAj6IdXiXX/XaqoVNvdPRalZ8
	s8j/E2BzoIPVbALnCnOuk4aDsuf0g7BHwqTgcZ+yg1q27xccON0LbzNUeaFtuBbsEL0I0y9+OFgMY
	y+V1rS+hGhvXvNSFlglQ5H6KbxSh7zDPdIxnj5qnrQ16OFFqZzc+zeHBaQs0R6tMGljc/tvmL16RV
	0loJMjJ4gaiKrSor21iICA+U9qy/X+en+u+tKitcFqjvon8lU7FwRiWaPZKNyk2jwcjJV0y/AUG2w
	N4ugQ76DlsTH/Sm2FCv9vIir9E4VxBF2JQmypEFdCw9IRzt2ozB6sadYBatSC9JZSmgitfrH2yqe+
	n8o/4LVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rZn-00000001fUm-0OxH;
	Mon, 07 Apr 2025 18:52:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1qWf-00000001Pfq-369V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 17:44:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A5E5444A4;
	Mon,  7 Apr 2025 17:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C23C4CEDD;
	Mon,  7 Apr 2025 17:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744047889;
	bh=xxHjDP+NyHgWQ2jb/v9uMp+G1hNt7hQcpSlTqvAxzE4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rU9Zo7xuCU1GBu8ICWZkzwDdIy9JRjkUCAis5IdHL5kK6hev+J2xF9tbUUYJfMJzb
	 EezmqeGNreOqRpIz+xYQ6Ah4ZhPosPCbLjcb5F0zDUWVrY2kR+nz8l8pEemNiDZc+8
	 V9I7LLlItTJfExgcXSmsuI1zV+QRxtU6EZfGYOM3+8OEsL7tzsTwvJXyqQiYG8jMKk
	 I2vTcXm5in4biyuNSWi01hMrjmxQXGcVboly/Ryl2y2I6l4CCacxKAwN31+FuX+8mi
	 J8nqdG7l4ohdEmGdQg5fiWLIJcHpXqYfchMmeCmhzxo7RGfZSmPjNDw26rzep1J/UQ
	 Bs9i3oQ1J8LMA==
Date: Mon, 7 Apr 2025 10:44:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, "Russell
 King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v5 0/3] Add GBETH glue layer driver for Renesas
 RZ/V2H(P) SoC
Message-ID: <20250407104447.072449cd@kernel.org>
In-Reply-To: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_104449_801975_8755951E 
X-CRM114-Status: GOOD (  11.72  )
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

On Mon,  7 Apr 2025 13:03:14 +0100 Prabhakar wrote:
> This patch series adds support for the GBETH (Gigabit Ethernet) glue layer
> driver for the Renesas RZ/V2H(P) SoC. The GBETH IP is integrated with
> the Synopsys DesignWare MAC (version 5.20). The changes include updating
> the device tree bindings, documenting the GBETH bindings, and adding the
> DWMAC glue layer for the Renesas GBETH.

This was posted prior to the "net-next is OPEN" announcement:
https://lore.kernel.org/all/20250407055403.7a8f40df@kernel.org/

In the interest of fairness towards those who correctly wait 
for the tree to be open I will ask you to repost this again,
in a couple of days.

Thanks!
-- 
pw-bot: defer

