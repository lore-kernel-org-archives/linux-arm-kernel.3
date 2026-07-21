Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F2BC44515
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 00:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDok9KVHR618PzvdBQVhmMe2pb6jbgGSXxiy31reXto=; b=3D2Kv2otPR2oxW93JCZzz3Hlv1
	WuiSBju1OwgBAc89ucQR5SbiKBgWfZwhvKr91XkDkO4pG85s9gJknmAOf495ogs+uVXWTQYYF4oO/
	77LZ9aM4GcTcV33XsCQ0muF0HsDie9xJN/lHX20NGqP11ja383ZK6oJDErz35VmM1MNqo6MQyA/n0
	FlKjaddVoIzbATgV6z2fLGYGZReCNRO89UZ0mItB9hM0NQ21aIVkUFbo3ymVHakkz+wvZHzwFhkkZ
	GL3qYw9eFf3HYinq9El+uO87+Dhwp5X2RXy0/dYTa6AwsLRF8VxawxF2W9cCYqMrToxJWYQcXPoue
	wF+QoVgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlySn-000000088mN-1p2P;
	Tue, 21 Jul 2026 00:36:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlySm-000000088mC-0SJ1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 00:36:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A1C7641459;
	Tue, 21 Jul 2026 00:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286641F000E9;
	Tue, 21 Jul 2026 00:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784594159;
	bh=MDok9KVHR618PzvdBQVhmMe2pb6jbgGSXxiy31reXto=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=nQb/sXULONrq2MhnnT3rxKO1eVgBqWrmAdNUa+6bbxrA+JzIeUWW6s9FaN8aecH6X
	 EhBKWQf/7oJb5dqEMcC8UucfCNql494zhvwRrhDfTdgwhTqaZkSCzfFLN94Lp2Q7fh
	 hX8wxg35rbOLNIHsQYlssOBRXVTK0R+ZAzyOpRXPHz4ymRwnTrr7cdNksj4E0qNawY
	 hiK4yX6xzf3i5NO1l5wniO7Wo7k54PRByBsMYic9zrvNBsJalA26tek0ETjcmTbbFa
	 L162G62ZfGJgK9clRw1ESppty99fndoezVtAVvwF3es6tkcEquLqG2Ccf0mSFgyvSo
	 rmlJ6qxsGXr/A==
Date: Mon, 20 Jul 2026 17:35:57 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Johan Alvarado <contact@c127.dev>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 Jose.Abreu@synopsys.com, pavel@ucw.cz, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: raise TX completion interrupt at the
 end of an xmit burst
Message-ID: <20260720173557.09e322d7@kernel.org>
In-Reply-To: <0100019f35ea26e0-42ad009c-01ab-4a8f-b126-fa65fbacae5c-000000@email.amazonses.com>
References: <0100019f35ea26e0-42ad009c-01ab-4a8f-b126-fa65fbacae5c-000000@email.amazonses.com>
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

On Mon, 6 Jul 2026 05:32:45 +0000 Johan Alvarado wrote:
> The TX mitigation logic only sets the Interrupt on Completion bit once
> every tx_coal_frames descriptors (STMMAC_TX_FRAMES = 25), with the
> tx_coal_timer hrtimer (STMMAC_COAL_TX_TIMER = 5000 us) as the only
> fallback. TX skbs are freed exclusively from the TX completion path,
> so any flow that keeps fewer than 25 frames in flight has all of its
> skbs held for up to 5 ms after transmission.

The netdev patch queue has overflown.
If these patches are still relevant you'll have to repost them.

