Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24650C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 13:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFF5TUdVYQg+FyRVGEqx+EYIgUUw4Qjx7J3R/oaD48k=; b=mvklgSZBBjjOZ4sC7YP1ltn/9S
	e0bi8XNfnniDBg1AA7c8y32wPsIuw2JOj9G3ObsergyQqv9Pwv4aSs1yFmdYlgMC754adDEJW73Kw
	wzQFRvJudH1zwum2aCcIasgypwhCHyfhUl/Ex1GGKY7G4YCQXida1hRV/CrVDtBXv1uwnDU9gN/X2
	Dxcj5AKe85+mvi6Ld7SRdc3LpEqtNVY3NYTKFxLIe8FpK94x7sBX1PzPH4kyKSBDa5pCErKfjWV4X
	5a9YcIDrXdEOfL1k6f1wht/E0u05pz+6qbN4bN4iMEDrhkuj3W+vdfHuijgtdPvZZx4jFvLCxjyfa
	/4kyuo3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcP4j-00000002MEP-2w6Z;
	Mon, 27 Jan 2025 13:22:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcP3N-00000002M6B-2bqj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 13:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tFF5TUdVYQg+FyRVGEqx+EYIgUUw4Qjx7J3R/oaD48k=; b=zIxTF7EqDiEmlJyBGaLIoi6ORg
	eOnj91A+VQvp9/SwEsouCXvmGkrlNYeD/4eaixxGqUm8KtFTXi8cssq/ufhSOtirMSGabPAc0uwDD
	a4Mz6sEPCR5mVbabOTFGWhFljGTkIUkiqeriRV9n07rh1kPkE+wBWBV2BBSXDVNzObr0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tcP32-008Ydy-1N; Mon, 27 Jan 2025 14:21:04 +0100
Date: Mon, 27 Jan 2025 14:21:04 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 0/3] net: stmmac: Fix usage of maximum queue number
 macros
Message-ID: <f1912a83-0840-4e82-9a60-9a59f1657694@lunn.ch>
References: <20250127092450.2945611-1-hayashi.kunihiko@socionext.com>
 <Z5dXJ1EIUx8DAh6J@shell.armlinux.org.uk>
 <CAAhV-H78fbK+jAsootOaZW=eQ3RPna3VQTxHd33vDSueYkyYtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H78fbK+jAsootOaZW=eQ3RPna3VQTxHd33vDSueYkyYtA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_052125_658163_897AD4A4 
X-CRM114-Status: GOOD (  11.46  )
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

> I'm not very familiar with the difference between net and net-next,
> but I think this series should be backported to stable branches.

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html


  It must either fix a real bug that bothers people or just add a
  device ID.

Does this really bother people? Have we seen bug reports?

There is another aspect to this. We are adding warnings saying that
the device tree blob is broken. That should encourage users to upgrade
their device tree blob. But most won't find any newer version. If this
goes into net-next, the roll out will be a lot slower, developers on
the leading edge will find the DT issue and submit a DT patch. By the
time this is in a distro kernel, maybe most of the DT issues will
already be fixed?

	Andrew

