Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241D0C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 15:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S4QrZn7G9AyQWEUh1I8MyKnl0p8w7wxzIcJeaCxPRA0=; b=TE7bZkHEvr5+ascuzKXDwtt8yq
	9YRYVQOK0CVT5R3gs+IJN9tUXKtqJxu0Hxk1EGyDRyMSifNv8nsSqoMqsbZSPNqTh2RL+46+ia1un
	x2bAXIlkccRyktumh7ed9BlNlfCO1yWbPH+s1FatJzuL1OQtAnyPE1QDGaDlpwPluUyYxkoAAJ5ge
	XUKOfPj9GPMQDBkVfGrDIZaNQYUE07vKI4KNf4skCyCv6dEkc0bFuT9kCF/c5aINJXKHlDmLkCmR8
	tkCg/b3H1BiXzqJqBWcvT54uVNyPaMi+OBgAri4Py9l24E+TvDxxnZRgi7vpLybN5LYaeHkvBepL7
	JawkoYyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAsQO-00000002Lwt-3aSG;
	Fri, 02 May 2025 15:35:40 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAs4Q-00000002Isk-2z2M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 15:12:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=S4QrZn7G9AyQWEUh1I8MyKnl0p8w7wxzIcJeaCxPRA0=; b=bzjEV31Scwknwcg6kWhaXCChj2
	ERZ2nGENpucdIwMgEq/RJNndyElFrYGL5PHnn/L6r1LofmILNRhbvKVbbtPIrrGfsYsro5lSGYbtf
	gUoDQJWgybSKOOP1WvJsA8m3OSk81ovtdhHkalK67EaeK6C+8BDp5hOGUZI+2oiQMLqM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uAs4F-00BQj3-VJ; Fri, 02 May 2025 17:12:47 +0200
Date: Fri, 2 May 2025 17:12:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH net-next v2 1/4] net: phylink: add ability to block
 carrier up
Message-ID: <bd95b105-4cae-460e-a5ee-5a30e9558d3f@lunn.ch>
References: <aBTKOBKnhoz3rrlQ@shell.armlinux.org.uk>
 <E1uAqY7-002D3e-R3@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uAqY7-002D3e-R3@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_081258_745504_BE2C0D18 
X-CRM114-Status: UNSURE (   6.43  )
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

> +/**
> + * phylink_carrier_block() - unblock carrier state

It seems like a cut/paste error, unlock should be block ?

    Andrew

---
pw-bot: cr

