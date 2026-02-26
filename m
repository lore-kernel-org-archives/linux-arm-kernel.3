Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E85DFD45F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 00:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0Cz9qwswd8bjzM2uRwrcve3LtnPsNVvVlq8IsSqPOY=; b=by70oKpoI8han7j/hitQ9OcuUA
	HAP1GOORqQa2aXFr5rrPp7cp/+UoeS7CBlQkjYK9B4lkebNb8YFgjcUgwNWEv9ualMoTiK4gO6cNV
	QmA3vdBY7/iVnDSprjmLSFKTFJF47bqUnu/eyrLwQg5zVEiOd99yqZvtcGe/T2sTrOVmPlKX6ALJX
	56O4HYdpr5bbYkTf9yPvBpxmDiATiMg/kHh/G0jxIwanWS3etqcd5WYvW/QNdfrVmxENnqFkPu2Sh
	hstZkSsqOxCYzStfLQEuGRqqB0ZpYcxssMgUp4bph4TzN4f6HtgeQuqS5Ef5/yjracT0ZprXYUeGV
	rvnqr9Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvPE4-000000058yg-1bG6;
	Thu, 26 Feb 2026 00:27:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvPDz-000000058yI-3rfr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 00:27:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AF177442A1;
	Thu, 26 Feb 2026 00:27:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0BBC116D0;
	Thu, 26 Feb 2026 00:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772065646;
	bh=sVg/+8oGP0q8Fd7sGobugvZnXJY3Faobh5SDoOTT5pc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qkLrxnBwhGmX69GWS6y21avfaLIRwuPd8EMIfy2gXabRVN5uak2OsiH4tnY341aI0
	 4yPPsh+d6mLPfLD2+TF9Eq1dexgmyW5tBMmCjciEnRmlroH0fwmABAeCUkZ8vKjX/E
	 R7J3iPhu16dR0d+wLGWgeLzLsMmxcuolgjADgoE9NuMgdwC5txd9YrPzG2r1EejRRN
	 ob8TkHgGJL8hzLWczems5gbnygrMFHL7eMjhd6yChp+U3t0oZmhNyBRiJRfN03LKGR
	 iNpW4EQBoRQ3vlVLIrc+LmTH6uEcKlwlPyShQj3M+lpBoKcq/hq8D4n5SdZsssk/hf
	 JR73d4mw4w7Pg==
Date: Wed, 25 Feb 2026 16:27:25 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org, Paolo
 Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: fix .ndo_fix_features()
Message-ID: <20260225162725.551bc03c@kernel.org>
In-Reply-To: <aZ7Ofd7O0xUDh7YG@shell.armlinux.org.uk>
References: <E1vuU3X-0000000Ae9G-1Er8@rmk-PC.armlinux.org.uk>
	<20260224173037.7871e5ac@kernel.org>
	<aZ6xqig4zh_Un8R7@shell.armlinux.org.uk>
	<aZ7Ofd7O0xUDh7YG@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_162727_988356_0CC53DDC 
X-CRM114-Status: GOOD (  11.79  )
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

On Wed, 25 Feb 2026 10:27:09 +0000 Russell King (Oracle) wrote:
> The options as I see it are:
> 1. scan the transmit queue configuration, if any have TBS enabled,
>    disable TSO support for the entire interface.
> 
> or
> 
> 2. rip out TSO support, making the code simpler, and thereby removing
>    the need to try and fix the problems here, and making this patch
>    unnecessary.

normally corner cases like this TSO + TBS thing are handled in
.ndo_features_check. The driver can selectively clear the TSO
feature for a single packet it sees heading down the stack
towards its TBS queue. The stack will then run GSO and feed 
it segments one by one.

FWIW Andrew's suggestion to do the GSO in the driver is very much
legit, but I agree that its orthogonal if you're trying to simply
fix brokenness.

