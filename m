Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1691C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 19:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=56E6zMR9Kxad1OxhFdqdZ0daXsEZJrIxt3x1kspyDio=; b=cjKAw8VxmtzCS/BcGGXJiLzxZK
	G2CWHzjGxxiwerSDAEOk9bRmAIzutonu9mDhqKEblwO//A8bVoAOXmc80r2pK+EU3R+vaIDO0B4Ww
	ntp2iZ//miDOmJOC5+b87gnOSwHYAjAwYKaZ+emLKW8z89StklT6Zh6vuynoqKzq7fjSuhYNJXOWY
	5IveReEXhmwEX351RW6wxufvPk+ZbwY/X/L6x1B+lZtWFeljq5Of6aGgrLc/el5LP9wK8IjeoxuhY
	FpWwJ8mBAoAptu+CJ2F7qItzQ9T/2OACIBK4Ph776U0tHR5ZaJqyKLgxYZU7+lRa3uabXS/aWJ6HE
	lDhlPI0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyfJ-0000000BEcu-1TtD;
	Wed, 18 Jun 2025 19:41:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRxm9-0000000B6FF-1Fgc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 18:44:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB0F74AAF6;
	Wed, 18 Jun 2025 18:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C14C3C4CEE7;
	Wed, 18 Jun 2025 18:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750272284;
	bh=FlkPWKCF+vrWk0zCgUpHWTZNjZJiKx1wM3zXfGDaXsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bg30LeSSE32MgC797Sw+q+dZZ+xVcEMIkll39N7Di6bIuOWcH/OEsrGIEPkWohOVE
	 eJ6ZnbdFdUmq3qlYI/4ZN24ym1SJTUOwr+qlvlstkyFErb8ljRHqmcqFGGb+MxAIk1
	 Wf1XvjEY2MdbpC8TQD5dCvisfYk00Ar8EwU3dEn6KwrkheyvOLf+9fyfPEfykRs4U7
	 SAi5V7OQkA+c7TuhaDViLEu199e05SWJzcqKruIfs1R7s55HuVzR/0UFkYH5ghKYrX
	 UQ18Biekpca6VwEXWP/nGleW/7yKzowRnrmgJ9+ZfeHewU58FV71DQ0Alx6278u06b
	 X/OHw5Il3vtTQ==
Date: Wed, 18 Jun 2025 19:44:39 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next] net: stmmac: replace ioaddr with stmmac_priv
 for pcs_set_ane() method
Message-ID: <20250618184439.GY1699@horms.kernel.org>
References: <E1uRqbQ-004djP-1l@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uRqbQ-004djP-1l@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_114445_360690_7CE6DF3B 
X-CRM114-Status: UNSURE (   7.71  )
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

On Wed, Jun 18, 2025 at 12:05:12PM +0100, Russell King (Oracle) wrote:
> Pass the stmmac_priv structure into the pcs_set_ane() MAC method rather
> than having callers dereferencing this structure for the IO address.
> 
> Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org> # sa8775p-ride-r3
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Simon Horman <horms@kernel.org>


