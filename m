Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A121EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 10:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnPKgb/WCzS8MAJjmhG7q2Ydzbm5Ck7jD+MajNGlUOw=; b=Q9Fa2SQzl6ksXn/mBDsNpf32HO
	GnYdAT0qXC8+SVN+NX/m8rmcdFej5KB2ZznsJgQ4sB/ynRGVcPEavbD+snTrM6qOY7EJ3oOgOSTHj
	f5qVP+Ymp6ZjhQ4biO8knEDNz8dXqCasUKahLWxeHgjgHbPhfqk9/pjl3SxAKmVxXaMfAg/mOVjvB
	sFgGpxk6I2Msgd2YO8cnDTMRj4tRtDzyqab+/yUKQ1EQEMMvfHRuBRe+FP1Aqm7duSAz1efw94Njs
	jOPfbG9YRUf1q95F2GjGo3HpiOJNxMnENEZZRa3sUqTS1AiCXvobMWSGe5M2AAB4my8CYobEGuKpx
	ScvyxMFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTBm-00000007xjR-1TW8;
	Wed, 08 Jan 2025 10:21:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVT1h-00000007vXz-4Ajp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 10:11:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D4795C1116;
	Wed,  8 Jan 2025 10:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91504C4CEE1;
	Wed,  8 Jan 2025 10:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736331061;
	bh=ZAOvCmQtAkYPaOMmqXIxilcjMsbJEBo9S7TbBj2iB7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jSYzvAZlwLRamAE26BsRm51HQXveJ4MnFFNKVCnpyhZORRvxcNdfE2EzoYfPX78Fn
	 9eD88AukwzOmZ798c+wW0/YXJTRfwrIoLdvAW9ryKPbHe5tzNaUY8njTdya7Xx9v1C
	 mfq0RrKUVoT4SKPgrJh81bbqGsrl1+9YYIfLQX/IcetSuqWDSY2NbkSEaXXcphgxvg
	 mTHZAuSUfHJHSIaLANiMJDM9dYxS53dHciS87qqmmNe4QklC0uM6OcSxcTue94v929
	 Jw4drEvlia9a0C29yRKywXhMiVn2Qj1qcu25x/Zm5L7LC+1fn8k1rMyju/41hRpJCZ
	 zSfqDbT32fDdA==
Date: Wed, 8 Jan 2025 10:10:56 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v3 04/18] net: stmmac: use unsigned int for
 eee_timer
Message-ID: <20250108101056.GH2772@kernel.org>
References: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
 <E1tVCRj-007Y3H-Hm@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tVCRj-007Y3H-Hm@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_021104_756853_0E3EA1ED 
X-CRM114-Status: GOOD (  12.46  )
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

On Tue, Jan 07, 2025 at 04:28:47PM +0000, Russell King (Oracle) wrote:
> Since eee_timer is used to initialise priv->tx_lpi_timer, this also
> should be unsigned to avoid a negative number being interpreted as a
> very large positive number. Note that this makes the check for negative
> numbers passed in as a module parameter redundant, and passing a
> negative number will now produce a large delay rather than the
> default. Since the default is used without an argument, passing a
> negative number would be quite obscure. However, if users do, then
> this will need to be revisited.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Simon Horman <horms@kernel.org>


