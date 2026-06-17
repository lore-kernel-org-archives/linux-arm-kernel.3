Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9ECCD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 22:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CqN76L0GmoGTlUxyqmYpYwkQVk5OIJLansyMs93EdPk=; b=CMUC+kygprvVPcZt88jpnwYZ+M
	tF4Wb2eP4qQjrYhof97VC7+f43vxw6QjoV/W1Ks0QUMiiQZtDTBwVKVBJHlopERU4Gdk6l3oEW4gk
	eWPbMxGxOagGrlEyydIEdun/yMeFqLLuwHYFzQVbO6hn0Rq0ml0wB7mBd6nV39JjdzfOBO2hoJHte
	Rwl28sDLsZ32dEruvIu/fLlHb/u8BHuk1yK4V/eRY3xht/V8QoqaxeEGL8O6AdHv9OmZH/TQ1euXf
	tA7JRnpN5OZHsJCq3qb/Dtv2Le1RugzthvV+AoAJv7GJddJlBhOBIY76o10wYxQuTNO4BES3gkYdL
	jgZuRnrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZyQF-00000000OHm-0klU;
	Wed, 17 Jun 2026 22:07:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZyQE-00000000OHL-2uvW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 22:07:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F38242A40;
	Wed, 17 Jun 2026 22:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE301F000E9;
	Wed, 17 Jun 2026 22:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781734066;
	bh=CqN76L0GmoGTlUxyqmYpYwkQVk5OIJLansyMs93EdPk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=XNxowSn0OJP7I2CIW2JV0Oo+0Rb+Kin3QNSOcQuHP6QKaSXwJYNG4kFgHdWzc6Kdf
	 2pVYVBMVbEft9I+hqRuLM45mXxtDKkIrE16UXxKkNjSPtiG0cNyVdWldzciE/3B/Lg
	 dxmDRcDjInvW5G/O+L5ZZ2G8zkczw4R31UbnwJ/UclDCiyAl0ng5d7bpd777pgunfq
	 wEI2dW2j+0XDGEpTVhUup+ZP8N7/EzprERi1gqb9r29KVHngQmWAiFWLOLK0y/EQo+
	 sQc92qNEXX27qZIhquXOuI/QZ49TFfmsRnXHvh5qclJjht0ry/VefZz5qfZQLLtCR2
	 qWca2TTAx2Y6A==
Date: Wed, 17 Jun 2026 15:07:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: <keguang.zhang@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 "Paolo Abeni" <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-mips@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] net: stmmac: loongson1: Use dev_err_probe()
Message-ID: <20260617150744.05756f0b@kernel.org>
In-Reply-To: <6b8db599-5bb2-47f9-ab53-a0b5141af2e5@intel.com>
References: <20260615-dwmac-loongson1-v1-1-cbcf5bc01d9b@gmail.com>
	<31630db0-85cb-421b-8ebe-bbae07521533@intel.com>
	<20260617135407.6ff54e27@kernel.org>
	<6b8db599-5bb2-47f9-ab53-a0b5141af2e5@intel.com>
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

On Wed, 17 Jun 2026 14:26:25 -0700 Jacob Keller wrote:
> It does claim that it has benefit since you get the error code emitted
> symbolically. But we have %pe for that. I wonder if dev_err_probe
> predates %pe?

I'd argue

  No of match data provided: -EINVAL

is more confusing than just:

  No of match data provided

the EINVAL is meaningless and hardcoded in this case?

