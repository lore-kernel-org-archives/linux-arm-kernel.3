Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D780F606A337
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 11:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=13w1YiNd;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DVE81PL1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=13w1YiNdfYdopPfSD/8gJ43UpP
	c41TQsdO8B4ocIE1dQygUBgXNRUsM7vcGrjxBrLXi5j2xoXMeeAZmD5rcCXUQDfEvUZkeTUSVdDrM
	cE33eAHNKHm0GSBVf+zpidrhv7zuDh2cD44agypiQQ6QgmpbMHjq81vWQQ6JUe8WmP9QuKKH3AkQw
	SQY7suehyCAm2n+yeZ7z+QM92iK6tvSwyXjEyx/uwZg75Cps/meZMCC6Kadq7x/5HsTNct29MaNmE
	lcRY2jYbkJ8UXEHI5YJ3FKo0CDA0zWoc57FhcAfuMV0m07AJrkqlrvSpU8UVH7wDV/lJwStBhbM/c
	w5C59YVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqY1-0000000GOOO-382a;
	Mon, 02 Nov 2026 11:49:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqY0-0000000GONS-0bKB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 11:49:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3EC7E60F1F;
	Mon,  2 Nov 2026 11:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 149C01F00A16;
	Mon,  2 Nov 2026 11:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793620195;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DVE81PL1ATw+J0OiuNGT5mE5qhBBIYma1qfdt7eQ9xpWGP2doo74uPoAaqxYY8j5u
	 Lz/nQe/YfRA0awxr8L9eQE2AXVesp/+4BqB3M44OEhTEqCuFuwQdw0B+6+0mz0uytM
	 OeCKjRj1VM6LRiwA39LunC0fQp+cHFiLMw1rC9EWlgy9/j3eZs0nCE8K5Fe5xTb5+h
	 iKfKUqhnrLDHDBfLEboNRlG20SjtwnUPf9Vw8FlyF/Cvud/WLCpmPeVOjYKv7Fj9qb
	 UgnphdUOW5Jwx5efO5oE2yAuH0I14PYCskFHNVZkId8Yx/bXtEFSdUHbyPIvf8yNqL
	 9kJVfgS17cL6Q==
From: netdev-bot+sinfo@kernel.org
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Song Yoong Siang <yoong.siang.song@intel.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: set XDP metadata length on the page_pool RX path
Date: Mon, 02 Nov 2026 11:49:53 +0000
Message-ID: <179362019361.3286.8732260602904932373@kernel.org>
In-Reply-To: <20261102-stmmac_meatada_pp_path-v1-1-d93cc4f9a864@oss.qualcomm.com>
References: <20261102-stmmac_meatada_pp_path-v1-1-d93cc4f9a864@oss.qualcomm.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

