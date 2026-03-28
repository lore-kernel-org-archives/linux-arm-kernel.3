Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E206810F3DEE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 19:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Rb4wCk6H2roWyP+DozeL7nTaj472Y54VMKypVEtfEo=; b=vYv6te/gVTGoVVXxufNBHGzDUz
	NcJpmHUAftm6k4xn/hmc3TdRBW8fUzQp8rJGK6f/96u3zLJeIU5zBGJDagiuWoSKUy/kFqqgkvNMm
	CtzUjVKZrTd9OF5TPp/EbElB7gtlqnuO/PvgJx9fHd7vzKYJyq/Ia+KH6vWjSEEfi4lazo0pmixeY
	3dNoynRq7xds9TXlxcvKQl62HGvNDMOcUWnMJoCVzG3l5KeHhjzmHKPFT8YXAMI+HB8GIyD/TjXIi
	5obi5AnzRzsL+Y8tIAPMdnjydXEkyRUdhcLYBnlCYzTaGFJJFtqSErMqzkajfowJbZECwV2fvxSTu
	2TfdaiJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Yv8-00000009Du3-0Jzw;
	Sat, 28 Mar 2026 19:02:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Yv5-00000009Dtg-3gAG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 19:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1Rb4wCk6H2roWyP+DozeL7nTaj472Y54VMKypVEtfEo=; b=i1r9zpcSc0bLMgchIaP5miZ1r2
	omE0TXDqFJ69rF329SCnyIJ3EPRZlONfYsBFdjpTjcx/mGD80+sfXLo11Lxn1kJuKgXVtjyr/LA9C
	f/3zTkQUzWbahnhEJ4ni7KqEWQdj7UE/3rlc9xntvpLztNddGCAwmUT4sE9AFcv2N0G0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w6Yut-00DoRR-J9; Sat, 28 Mar 2026 20:01:51 +0100
Date: Sat, 28 Mar 2026 20:01:51 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Ong Boon Leong <boon.leong.ong@intel.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: simplify GSO/TSO test in
 stmmac_xmit()
Message-ID: <695294f1-8548-4a0a-8e21-ec99c9c0e903@lunn.ch>
References: <acZQaDeCoib5S5UA@shell.armlinux.org.uk>
 <E1w63fl-0000000E3Vb-3JkY@rmk-PC.armlinux.org.uk>
 <aceQRSc5o4D-HHmq@shell.armlinux.org.uk>
 <acegAqUb-Dzy87d8@shell.armlinux.org.uk>
 <acgPJgW9r0l952qu@shell.armlinux.org.uk>
 <acgkM2FGS2h-fPVN@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acgkM2FGS2h-fPVN@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_120203_933154_D2E068C3 
X-CRM114-Status: UNSURE (   4.38  )
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

> I'm surprised we haven't had reports of brokenness in this area.

Could a self test be written for this case?

      Andrew

