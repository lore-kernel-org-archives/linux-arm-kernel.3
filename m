Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89381C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 00:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8DSLS94/4rn/IDEYTvnb/3NOSmuiboyBVGoAfDceNw=; b=G/Ohnb5CNw5j3CnNdb5zxKYsvd
	Qd30A0CmTJvfWdYfF2apDLNusuQ8VDEup7Vk9zEXU3LW78G3sZvZOYWQ/mJR97lP0c/9cSCKwT7LS
	GI/9liNlds4sDjew4sBQKi9fzDv48JcCVu6FoFeSmdktL4zpMBHSE+9tuGJhJ2b+3J7Uu/pWm0Zug
	mEvLRpfOJzfe764QoOkG6omIcliSQoz0mc5BIXXJi/qdlJ15Rsbs2i1R8vZ2iQnRaY5s8aMYBRd/Y
	3/VilCezUpwOO3Vg+kXW+bA5i+WIZMDpAtHsbCAttuX01IpjZ7nJGnCe2LExHDp055bkDihz1Y/Xm
	KBqIiz3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6dQ3-000000086TG-0y9k;
	Wed, 16 Sep 2026 00:22:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6dQ2-000000086TA-31XR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 00:22:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E546433E5;
	Wed, 16 Sep 2026 00:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66CBD1F00893;
	Wed, 16 Sep 2026 00:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789518154;
	bh=H8DSLS94/4rn/IDEYTvnb/3NOSmuiboyBVGoAfDceNw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FemkOq0Cn++Rtx1GJ2eUSVXAfe6MyPicArFasJFuqHZgwSVWAp53cdkoCx5f/63cT
	 shPokNu2TsUSWSNW/WCLm9QAB7Ov+0sCMaAtrLUeR2YKNwAlOwhRT2She0oZfQhiwG
	 cGY8qvxYkpAApkOGVj4rUJrSIbghNY7endSgCyJmAbe9V4C9BjKXggM98XB5MWXUzZ
	 GZpFF46WwlYgeqpJtqPhHYy28AXSPOcYQ/vuFGcoMHVqQMjFmGOKkRnWy1vA30KWZx
	 l+ZACWWDaZ3ayDG6Gax8c0mXqPgaTBCkHxscSItqjDXeSvUwmx0qdtEhHtfQh/IcgX
	 lNeeKGvr9Cc/Q==
Date: Tue, 15 Sep 2026 17:22:32 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Srinivas Neeli <srinivas.neeli@amd.com>
Cc: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Michal Simek <michal.simek@amd.com>, "Sebastian Andrzej Siewior"
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-rt-devel@lists.linux.dev>,
 <neelisrinivas18@gmail.com>, <git@amd.com>
Subject: Re: [PATCH net-next v2 0/8] Add Xilinx TSN Endpoint Ethernet MAC
 driver
Message-ID: <20260915172232.04df37b2@kernel.org>
In-Reply-To: <20260909-patches_v2_external-v2-0-3a40babaff4c@amd.com>
References: <20260909-patches_v2_external-v2-0-3a40babaff4c@amd.com>
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

On Wed, 9 Sep 2026 00:49:48 +0530 Srinivas Neeli wrote:
> This series adds the wrapper and endpoint side of the IP. The switch-facing
> part is exposed through the Distributed Switch Architecture (DSA) framework
> in a follow-up series, so that MAC1 and MAC2 show up to Linux as switch
> ports with the endpoint acting as the CPU/conduit port. The endpoint frames
> are already classified by source-port id and tagged with DSA port metadata
> here, so the switch series can consume them without further endpoint
> change.

I'm not sure why you're implementing this as DSA.
This needs to be explained, if a single driver can bind and control 
the whole thing, that's AFAIU preferable. You can keep the
implementation details in the driver without exposing the conduit
to user space

