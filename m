Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F38C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 16:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Q0+TxYLzL7dd9PwATR9DjrXtp87mW2+VdkbJE0raBA=; b=drC5gcCPCfDk8I0p/O2sxHZat+
	karM+oAhHwQrfNgVX+FTxJ0EEStwpkIUX9DxQpCU1cPQwKd+ADawfvh17+kSsr6Y4tySalk6JHTAs
	/tT2L+MLsCeMyVyp/MJZ4lyNQ6WlDsjQ7o9DeCVzNwjZFtFyyuXGkuBt8canmLz6jTSeVBmk/zwJP
	vEzsvxqVxwMqI6DiL7RMr4ylFCOctAb8qggRDc4YuPTlqAmFIqkiD65f1bSm16OPPWgVZOBkSlKHI
	SE+LkAf3o6JAUP/ILFoQbirYFJrco6YDTfKFpQNxZU0a2TvwQKr0u5IQ40osuDzvd3nur4f7HX8lU
	NK1L5b1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6tM-00000008WA0-1BuA;
	Wed, 29 Jul 2026 16:12:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6tK-00000008W9q-49zn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 16:12:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F3C56001D;
	Wed, 29 Jul 2026 16:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF681F00A3A;
	Wed, 29 Jul 2026 16:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785341541;
	bh=6Q0+TxYLzL7dd9PwATR9DjrXtp87mW2+VdkbJE0raBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=K3h+KFhlzmumrgO0Q2SLoOxovx5oiZ8DEksZY7j8MLIXIejmkbXO2jCLClOJ3rjgM
	 vWAEZ4YzIyrRjqB/K7nlTlgbutNF5w/1VB/NP9lE2eJYVuQBPbHStW+nuxca782jjR
	 Q2btb1ilWqQ4oxMQnRD57lRzJMWlEjfyJJDXum+cMmtNsuY/9y5q7EBxZoAHKyOpb2
	 nK6+nWevoixQ4ftUergg6XXg4xqH84qVNKI/T/zTk8g0H/bIEHl25B1CZPFKxQv6k3
	 YCqEhmtiWPf0TBQRMsEB1CC0yptLsiKr417sCnRp6PQX/K0+DdKHMjtEvMcn+gv2/P
	 ze6FDSvwqfJEg==
From: William Breathitt Gray <wbg@kernel.org>
To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: William Breathitt Gray <wbg@kernel.org>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] counter: microchip-tcb-capture: Fix DT channel validation
Date: Thu, 30 Jul 2026 01:12:10 +0900
Message-ID: <20260729161212.1296687-1-wbg@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729054102.7-1-bbnpreetsingh@gmail.com>
References: <20260729054102.7-1-bbnpreetsingh@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=674; i=wbg@kernel.org; h=from:subject; bh=ntyZ1m2LlvrSpP2vZZLM+07t8QOVl2iUUB6O7kMIuZU=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDFlZaq49C9ZMLtkcrH2n5fnPRUKrd/2bH90VKpenNbuou fHqVZ+PHaUsDGJcDLJiiiy95mfvPrikqvHjxfxtMHNYmUCGMHBxCsBEvrkzMvzM23y8XfHz/IMG 3hP6GN6s9N+/yfna8iMzz/7mOst76LsCI8Mh3121Z5/rB194L/3T+Sa3xjpPsbiEso9nKm/8DP8 7PYcJAA==
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit
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

On Wed, Jul 29, 2026 at 05:41:02AM +0000, Babanpreet Singh wrote:
> Hi William,
> 
> A gentle ping on this one - it has been a couple of weeks without any
> comments, and I could not find a competing fix on the list or in
> linux-next.
> 
> No urgency from my side; I mainly want to check the patch has not simply
> been missed. Happy to respin if you would prefer a different shape, or to
> drop it if you would rather leave the validation as it is.
> 
> For convenience:
> https://lore.kernel.org/all/20260714042910.7-1-bbnpreetsingh@gmail.com/
> 
> Thanks,
> Baban

This patch looks sensible. Do you have any objections Kamel?

William Breathitt Gray

