Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90B1CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 22:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mTQHrDxKx7IV8KOA3AyIUBpcpmWdEWskPrlRI2H7uIo=; b=1ChMIi6uDeNEFbxNqBIHvXclkC
	sn3ES+QzXAgG1AGnUbKqL3eVPLXyOP4Tw6VOSxfj9kH51Wv8K26SfvfRGp4A9Ed4FFiCcitmbgWLn
	1PzhsaYIH/yrFNc4CDLZsMqOHVXYwI5DMHeEQ/QtySkjr2ZH0lpnCsfOJUvvdYaNnt5XPhuxPeFlG
	sIJsv+TF2J+6f6/oJKxSJPZgr021/h5+th2nvDuNgcT4y8OVMH2RLR6FzmM1RN6aiVv8Hp06ONbPO
	tiRKdmXPjc8xFpVlNEZNbS4eI8IWxZ21/NyngDuqGckiERyyViJ9JXA4FJWFSDjXTsA248pafRwFN
	DaL6CfEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEF0A-00000003ArY-404J;
	Wed, 29 Oct 2025 22:50:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEF09-00000003Ar6-1V0C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 22:50:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 33FD160273;
	Wed, 29 Oct 2025 22:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D6B3C4CEF7;
	Wed, 29 Oct 2025 22:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761778243;
	bh=mTQHrDxKx7IV8KOA3AyIUBpcpmWdEWskPrlRI2H7uIo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BWxyrc1rNIVq3ghKKjMEPb+CHpbOQR4VH/HpURcGL3WkMqxVbgR5EA97L8sMLsTIo
	 fUcumSh7i0QaKI057eCuOl6khpjKC1dPpmPPaWiBvHP9fJFVl9TbFCcCsgJMYZ2jzb
	 70Eo7KdNpH+h5MNmGi6RnzTy+U/khF4kKQGf6J/wU847J1HdF5vZBwioqyRRRJYfM5
	 BfigAmwxQ4Y5Ox8N+vasb29xMlsf7fpNqgTNL5uTOBY4WUfY7x/IfsJPcXP8Kl0MHH
	 75dDEw9a0k5u0lPqlFK/y9E1bU05HR1EHGI6iadBlyqv9vHI3U5DL9KiQ5I4fAOorB
	 DsCiy3Qkc042Q==
Date: Wed, 29 Oct 2025 15:50:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Richard
 Cochran <richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Vadim Fedorenko
 <vadim.fedorenko@linux.dev>, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: Add a devlink attribute to
 control timestamping mode
Message-ID: <20251029155042.208ecff4@kernel.org>
In-Reply-To: <71310577-7cea-42ce-8442-49e09e0b958a@bootlin.com>
References: <20251024070720.71174-1-maxime.chevallier@bootlin.com>
	<20251024070720.71174-3-maxime.chevallier@bootlin.com>
	<20251028151925.12784dca@kernel.org>
	<71310577-7cea-42ce-8442-49e09e0b958a@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 29 Oct 2025 07:59:10 +0100 Maxime Chevallier wrote:
> The patch was applied, should we revert or add another patch to rename
> that parameter ?

I think an incremental patch is best here. You're using the register
naming in the driver code so I suppose you won't even have to make many
changes there.

