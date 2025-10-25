Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F8ACCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 02:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=znXa4MTmgD2GT+6EgOiEt1q1x1IwgN2PdMxLNSJjMV0=; b=aB++CFr8hyA6sKWkOI2AMxZyML
	nV/eKrDrw0p8iwn9Daasce8Qm7K2KoHjl7cmmJ9IJsklVmxLfKhUbIZzynUcLrQ/eLZa9noaYjDmm
	8IBzGShABRjkiSpqeCMpFXlxOcD3nZELkXjjheZHRUaCi+XzOGhh6v4r0bNj1s6+dYn7jqbd/A9SL
	xcYJ5j4Vot5zwFVz8PV/pKm7f+DnhZg25L+F9534B3aFO+SDWaNxwK+kWN8f+cgB2dLLVmnbrkSLi
	iN8FqMuczo7Qk5mxyP7stZKhDUU5ZWXVxEdG40mkEoFF0s7Dth9TPakIvw/lj1Tn99m53EyWzF+0A
	gDJdD8Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCTbY-0000000AoGh-1w9z;
	Sat, 25 Oct 2025 02:02:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCTbV-0000000AoFv-3ASX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 02:02:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 13F69444AD;
	Sat, 25 Oct 2025 02:02:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B4FCC4CEF1;
	Sat, 25 Oct 2025 02:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761357720;
	bh=znXa4MTmgD2GT+6EgOiEt1q1x1IwgN2PdMxLNSJjMV0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=npHZ+2QhpzQZMTObG8byre7FkwKihYjra6KYY/j9g3Ru8obLrxwg2qn8OuY80aWmD
	 sHybgiMWxnOnhvgAOjsSC7C+ovz9IKKgoFDQYOFjseY39UonVqos0RztPHLP6AljYZ
	 S2fyn+qE7NB4qYFK7T7FRyUT4ao1BdHWBL5RqslhI8cCkJUwvSvaWHIkxIvYwzG2Fh
	 r4/1xEc0JUP2HXgf+2NODGI1Gkegf0MJhnqmeEcfziM31bV02vWrhNZS6cOBBM89qD
	 ig4OCLCwRDiZw0KEqlT3sYY65gmIknzdMiDcFeOqbbk9FivzQMqHK4hqcYaMAfeVBO
	 knmLlYvM2XpIA==
Date: Fri, 24 Oct 2025 19:01:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>
Subject: Re: [PATCH net-next 1/2] net: stmmac: add stmmac_mac_irq_modify()
Message-ID: <20251024190159.60f897e5@kernel.org>
In-Reply-To: <E1vBrtk-0000000BMYm-3CV5@rmk-PC.armlinux.org.uk>
References: <aPn5YVeUcWo4CW3c@shell.armlinux.org.uk>
	<E1vBrtk-0000000BMYm-3CV5@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_190201_826708_FC3A7D8D 
X-CRM114-Status: GOOD (  10.06  )
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

On Thu, 23 Oct 2025 10:46:20 +0100 Russell King (Oracle) wrote:
> Add a function to allow interrupts to be enabled and disabled in a
> core independent manner.

Sorry for a general question but I'm curious why stick to the callback
format this driver insists on. Looks like we could get away with
parameterizing the code with the register offset via the priv structure.

Is it for consistency? Do you like this code structure? Is there more
logic coming for .irq_modify variants? Or am I missing something else?

Mostly curious. Personally, I'm always annoyed having to dig thru the
indirections in this driver.

