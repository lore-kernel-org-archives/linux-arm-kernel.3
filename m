Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157E4CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 02:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mrA+bQiXpYaBTGHL7k3MZUvo6xYXvYgLgakzL63cPQ=; b=COsNMnQCXaIYcVaeGvVblaKkzi
	RpdrQ7CAjGzTiBwBarneleM9o43gRKxns5XpFd5MoEfeIdcJ16bxZX0Nsj2dqOX9GlJg1knIY51pf
	WhBh5pnqdH2+IwOjLdUlIx8Yba+28QEjdVypDqzXYityeSHygzKZHwIcEGmz1MOejTOk5fOIYTle1
	qtFmjpWcBjxwt9B9TJj1nH8MZc5eYtzb8/uGnwBgBf3qGpfTjInZtWjaBFjDHoGhQ0bYlItJ/ke8D
	E6FmSU+OsNDxChdyabMMGgzQp1jovjitAfmddzaHFjn/YdElDzNuFpNwioZGh/t2QLRdyAxz9jYQ4
	6A8UyL3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWm0P-00000004cdM-0VOP;
	Tue, 09 Jun 2026 02:15:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWm0N-00000004cdD-3TLc;
	Tue, 09 Jun 2026 02:15:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EDB95601E1;
	Tue,  9 Jun 2026 02:15:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB2E1F00893;
	Tue,  9 Jun 2026 02:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780971348;
	bh=8mrA+bQiXpYaBTGHL7k3MZUvo6xYXvYgLgakzL63cPQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BtkpyO97lepeavCkG0m5/cyRh/NK4XSjOLsdE4uUNHHlkEYX76G86KdyhQ7h4Y044
	 wBQPJyzmKNYVotOphdGUkbhjE+GKQGmWI8GNsZEXMy+ocQePv/BefMEqrXnouioHAT
	 UIOaBBn72GtkIbK7ET5KbW3VsztTUuJV4K2Htp50VQbZWRfxOxoUD8u18EsHE80HVn
	 Tb4ih5OZ6fHznywGMULRNNOXbtjC1oma/+KDii7KA7rSVJhZXkd4uMVHVM47DbRPUR
	 tdvJFC3k1fmQkffDNzLc9FcE5V+Ie8/dkFIu4whjHTQRmCgBH6HUqpX/nqSz3TzIz5
	 JJnHh84fQMz2A==
Date: Mon, 8 Jun 2026 19:15:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Alexander Lobakin <aleksander.lobakin@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, Madhur Agrawal <madhur.agrawal@airoha.com>
Subject: Re: [PATCH net-next] net: airoha: Add TCP LRO support
Message-ID: <20260608191547.21a29bb8@kernel.org>
In-Reply-To: <20260606-airoha-eth-lro-v1-1-0ebceb0eafc3@kernel.org>
References: <20260606-airoha-eth-lro-v1-1-0ebceb0eafc3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Sat, 06 Jun 2026 16:45:28 +0200 Lorenzo Bianconi wrote:
> Add hardware TCP Large Receive Offload (LRO) support to the airoha_eth
> driver, leveraging the EN7581/AN7583 SoC's 8 dedicated LRO hardware queues
> mapped to RX queues 24=E2=80=9331. LRO hw offloading does not support
> Scatter-Gather (SG) so it is required to increase the page_pool allocation
> order to 2 for RX queues 24=E2=80=9331 (LRO queues).

NIPA says this doesn't apply
--=20
pw-bot: cr

