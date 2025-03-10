Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64DDC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 13:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9SFC4iWvRUfX2weGG6YMM8awhen5atGW/XI4bj5cz5g=; b=zITux3r+MUQ5+qG7gC0aWzl0pC
	ihJk4WrCUDN9fLaXMad5MgTnSNa9/DCWLC2B9mCP07uiZlbvf2FILn7fh7B7YV7tzwiHD9tKLEdi4
	v0C9Qa1JZ7UCZnR1ax05FcO3TFBwOZwzV/68k1FUvh4rZn1F9fcavzHKU83DOuZ8X44AmzyO4O/D7
	+UUWzbgbRHtgd8LqIbXQ2mK5qir18f/DDWvAEMQIdk0dhNqAtxprKwP48Jo9NvZasNjRvbnXdeWo4
	D6jEFd5sQUTApKC3U/b0vJZ9I+hHEvZvFaHAnZv+txjLSmnWyKm2zaVyK4N6EUh9SzqYNLK1+ZsPY
	aUu/RIFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trdZy-00000002r7e-0DlE;
	Mon, 10 Mar 2025 13:54:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcdq-00000002h8i-2u27;
	Mon, 10 Mar 2025 12:53:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B7225C5BE7;
	Mon, 10 Mar 2025 12:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7079CC4CEE5;
	Mon, 10 Mar 2025 12:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741611237;
	bh=J1e0tuX0R2dKRPJ+pB6GcyRcQHThRSNrXsdiWBni5Qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sINWN16ngmfU2lykcPSvEltv8suz+4O4FzbpqqAf8sN1TkxAateKk8xaWROXzZlg/
	 4lKExBHdAJhTMm/zIyb7EjXGys2rB3rHGsL9TxpkaSK9WzmatdOIuYHViAbazwRVRx
	 IS2iaG3Ocpg2eRRLOJdc+t5PDggdRzoe+fOKYDFI2WjPO1G3fEl3/mZAQZe+Pdnhsd
	 yzfgHJadIf7kxez3j5tOJkx/cPK3eQ2lcqMaIl4R2CIPdG5y32mnhK+XpT5rLaF+BC
	 KkJV7Vt9a4FqNJME2iX0fxvjPhZFHGtPSgfKx91tzXj0w69Q4R8z7/Dw3TJXqDx9JE
	 68olY1HAX1M+g==
Date: Mon, 10 Mar 2025 07:53:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"David S. Miller" <davem@davemloft.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Jakub Kicinski <kuba@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Lunn <andrew@lunn.ch>, linux-riscv@lists.infradead.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>, Conor Dooley <conor@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 6/7] dt-bindings: deprecate
 "snps,en-tx-lpi-clockgating" property
Message-ID: <174161123533.3885448.13844393493565707617.robh@kernel.org>
References: <Z82tWYZulV12Pjir@shell.armlinux.org.uk>
 <E1trIAQ-005nto-3w@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1trIAQ-005nto-3w@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_055358_787000_279A9489 
X-CRM114-Status: GOOD (  11.36  )
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


On Sun, 09 Mar 2025 15:02:14 +0000, Russell King (Oracle) wrote:
> Whether the MII transmit clock can be stopped is primarily a property
> of the PHY (there is a capability bit that should be checked first.)
> Whether the MAC is capable of stopping the transmit clock is a separate
> issue, but this is already handled by the core DesignWare MAC code.
> 
> Therefore, snps,en-tx-lpi-clockgating is technically incorrect, so this
> commit deprecates the property in the binding.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


