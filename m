Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5E0C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 17:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EbO79SBt1fqQKSNB4+jp3tSRgB259JknfPmG5q55o1U=; b=vzNwU8d6scVgQpDReckgRQQXh1
	UNQY8oqMFItbbPnrm2xgNwSzJ1DyJ+7uh839k6jFvke0M6KVzr171kUyKXuuGbcev9kl3hkFyYMnE
	b2u0CoS3iUgnZlpxyUU6P3w6lRSR0r9r1ysHy+d3PB5wx1D4nii6Fo7Uj6wOoxxh0BmjGckpqQJiE
	kQrvgshNWtmn95+oopdJK76DT6FR0xl6YZyWNv1fF10DqJcakaU6yIeCr1SQpr3cPprRQUF8lrhUk
	K2D094QSI4O3+puLXbch4lXh/wHlTeCfCViwaPFTawIZqCJvbRji9zSUN3S3CLh1/l8+2U4dCV6UM
	cCTCD3qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww1DQ-00000006bNA-29kK;
	Mon, 17 Aug 2026 17:33:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww1DO-00000006bMi-3MR6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 17:33:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 42F6F40E47;
	Mon, 17 Aug 2026 17:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2AB41F000E9;
	Mon, 17 Aug 2026 17:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786988018;
	bh=EbO79SBt1fqQKSNB4+jp3tSRgB259JknfPmG5q55o1U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=PerXsyF5f8Z99E1O/MH92EBezeiHuo2++IAFgfYNvD7F3OEzpcIrAlpU86edyelU0
	 Ny9fqUX/GijwKkNUR4Xnb8JwqupgeSdTWB/hUnaA7CJ31qRqFaczjMF7XZLaV+jsuU
	 n5c2BxF71FeWhQiUN9shtog4IQ4r64tJ5kqWg2oB4soBEDTNNqM3QDZKylL7bde5Z4
	 H06KoCiTY4nvN1a7pyNJkFf8H0JkNpBIe89QOUv7RhtgkYMPgoDlGnkt3apxA65rib
	 Sp2Qs4COOr08cu2rYW5AkxULK9FfSzNMjGskmSR0h9BxKh/tBEZHHAwjoqJgW+CIJa
	 akKCkCxlCWexA==
Date: Mon, 17 Aug 2026 10:33:37 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Kurt Kanzenbach <kurt@linutronix.de>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
Subject: Re: [PATCH net-next] net: stmmac: stm32: Set TSO/TBS Tx queues
 default settings
Message-ID: <20260817103337.74c30adc@kernel.org>
In-Reply-To: <20260812-stm32mp2_txtime-v1-1-f9e2462cc85d@linutronix.de>
References: <20260812-stm32mp2_txtime-v1-1-f9e2462cc85d@linutronix.de>
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

On Wed, 12 Aug 2026 08:28:57 +0200 Kurt Kanzenbach wrote:
> TSO and TBS cannot coexist. Use the first queue with TSO and the rest for
> TBS. Tx queues with TBS can support etf qdisc hw offload. This is done
> similar to dwmac-imx and dwmac-intel.

Can you explain your use case? And how many queues the device has 
in total?

You say "TSO and TBS cannot coexist" but can any queue on your
platform be configured to support either feature? If yes why are
we configuring this statically instead of making appropriate
configuration based on qdisc or some other uAPI knob?

