Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CF4D0C606
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 12:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kqleHlib7lvZdeaK0vG+ttZGLYW63ynkNgZzmLrBig=; b=Zbed3LWDhq0LoH9+tG4oQKRP4h
	+mSNpUngOR5lxHHawkud91QxcbAg6hIN5/eHZM69Z4zlpJCETGo6GUEUTO9FJqS+TysLV32aOmVau
	aByQgx1oG7THVXL4HbgZELHBbof4X0irbauok0sEb5JikFNG2I/3BxajkiWrKlhuwGUf6n5VvCcS7
	+CEvQZkGcJqxMdljwX1BJErpkPwaW7HOdxWdR61eR5IReJ0HF766X2SCvVeIzIKJfGk4NBiaGqcZW
	buMn+viARJjr+mSSXP5MrIXI0Ao0RYFwLe6ozIv5ynYg0HExO424Rt+1P9PnA+FHvOxghtQcx4J2y
	okCsZFXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Jog-00000003jUm-1NOn;
	Fri, 25 Oct 2024 12:53:22 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Jgb-00000003hpb-03AO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 12:45:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2kqleHlib7lvZdeaK0vG+ttZGLYW63ynkNgZzmLrBig=; b=1ypYJ/kzQcWgZULES4gJQy5gZ9
	Wbrz0pbaOLPpZYImgB2sE+GA5ewpMqveaydnVMvVNqMK5BuQ9K/P22wx0rFJgjkQDVMGYWDBraSID
	dwFviV7YSxgH31pVRI/QG71cGAzQ/6/Ed9X1CpyT/BKiTwzYOv1SSr5m2iyXV4dXHfOM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t4JgI-00BFBc-8z; Fri, 25 Oct 2024 14:44:42 +0200
Date: Fri, 25 Oct 2024 14:44:42 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Abhishek Chauhan (ABC)" <quic_abchauha@quicinc.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Serge Semin <fancer.lancer@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Andrew Halaney <ahalaney@redhat.com>,
	Simon Horman <horms@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
	kernel@quicinc.com
Subject: Re: [PATCH net v1] net: stmmac: Disable PCS Link and AN interrupt
 when PCS AN is disabled
Message-ID: <bc891f4e-4a3a-4664-b52c-871d173b7607@lunn.ch>
References: <20241018222407.1139697-1-quic_abchauha@quicinc.com>
 <60119fa1-e7b1-4074-94ee-7e6100390444@lunn.ch>
 <ZxYc2I9vgVL8i4Dz@shell.armlinux.org.uk>
 <ZxYfmtPYd0yL51C5@shell.armlinux.org.uk>
 <89f188d2-2d4e-43bf-98f3-aae7e9d68cab@quicinc.com>
 <5e5783f0-6949-4d04-a887-e6b873ae42ff@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e5783f0-6949-4d04-a887-e6b873ae42ff@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_054501_071355_7DD80F38 
X-CRM114-Status: UNSURE (   5.24  )
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

> Serge can you please respond on the PCS support in stmmac ?

Unfortunately, Serge has been removed as Maintainer of stmmac as part
of the Russian  sanctions.

stmmac currently has no active Maintainer.

	Andrew

