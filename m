Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0A3606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 20:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EtfoSPtT;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C1zoWgSn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=EtfoSPtTfIBHG0LqxvXrMu2QQj
	ip3yAkhgwI4bnX3dNw3KtSLJIGd2izXKnndN5YkqZzro+dQk79s+UHKXbXiHYfSxVaOP4XZxXfNUY
	R7d1k/Q8kTR7ytgZYM+oK0CsXKRU6N0IzJ1aToeAHQ+CIolRDoNDGwpuK/vIsAzHYW1mOEftKg9bk
	JI8tQS+6JDmwQ5POVWtU7lF1G5mmDgXIGGJufdw0RNm0UAHv05PRARnIC1da09BJeMPaFJlKU9qYF
	kYUc0coWWyAaGOD8D6GKOBUkPuadSLuW6maAS0Q9z54OpakH+uvVjKljn33tCTAe89NJpBFql+d4G
	aKJH/KOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL4wU-00000001QLy-41Qq;
	Sun, 25 Oct 2026 20:35:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL4wU-00000001QLs-0Ogd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 20:35:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E92543DA2;
	Sun, 25 Oct 2026 20:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DECE91F01825;
	Sun, 25 Oct 2026 20:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792960544;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C1zoWgSnSaaznUL024oOssl/u3Rc2pfkocTOdOIqwdKOQM1X0pxYCVHee2f7ZyBjy
	 6DQL7Vmken5Qi/dZUeja0doG5MmyyqSVcpNd6F6n6AANyWUzALN3mWnl5Pv+/zIBsp
	 HZzI9w2Ee796v5I9pNtME6GgPInE3Wx4OJ62mZCZRE30Owxz3i1HTkefQmOOmFn6uc
	 oYzwTWlWUFRVA5TlZbJqPN7kLweWjkAlRn2N/iCbHQtvZAZNWIk+BoY5/octB0qK5P
	 9a2uGAjAoNe1UsXCuTeiH19OaZtWgGJcSQVx9ACSpcHDYDVCoIjWkfPlL9fioT9eUO
	 FHcETsWVMCGbA==
From: netdev-bot+sinfo@kernel.org
To: Selby Mashiki <mashikiselby@gmail.com>
Cc: Sunil Goutham <sgoutham@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: thunderx: fix fwnode_handle leak in bgx_init_of_phy()
Date: Sun, 25 Oct 2026 20:35:43 +0000
Message-ID: <179296054345.3327.8934502805880255428@kernel.org>
In-Reply-To: <20261025203159.455100-1-mashikiselby@gmail.com>
References: <20261025203159.455100-1-mashikiselby@gmail.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by code inspection). If it was triggered please include
   the symptoms, like the stack trace or error messages.

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

