Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E550E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 09:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DAiMnKz1;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ee2XFck9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=DAiMnKz1KnJ5jSTp8aGZOETm6l
	5DLNs4nG6lDGBd4w8Qgx9X/mIApg3l9y5kC3oTrDxnBGFFUHvdPB5EULe4GfMx0xnwdX+AWCS6yq3
	4kfia0d3x35tkvbWR9XqqUbynnUOfSdoJeSjsQBMg0TMS8os+jT+CPogNg5mcADzS+SK7yyjPhCmo
	8E0T8GDUaIkFX6De5l0T5zTjbFWeSOnO/ytPcvBCByNv6/Lmk/2HknwU6jxV3un0khstUPwSpeL6T
	nG/mDUbtqmnjmr/TwerBMKr/DCqRhfehFIWQVLdty3mu/vdU9Q7qN8+zjj4R5peXFs8YJNoQ+BR9o
	ilsRg02Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiSr-0000000BBdp-3lK1;
	Fri, 30 Oct 2026 08:59:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMiSp-0000000BBdb-3zh1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 08:59:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AC05F6062F;
	Fri, 30 Oct 2026 08:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D35C21F0093A;
	Fri, 30 Oct 2026 08:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793350794;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ee2XFck92ghLQJ/xoxzjJpa+wZ7UI2slLwzMGCMndaEypPc/80q94MugQiGJSS1a7
	 Rv/lJDlB1Y8i5i+huCKmAORAqyMGZNK4dpUadtmbLLBe0EkrG17ihRk0yaSwIuFiJO
	 hKBFK7bN2bHzOP+aQPLqgWcPYW0W2474VM0p82M7LT7m0CF9K9zFZriIDUBvXO9Bw/
	 QSEh0tpoADP1qZHXMFrkXp9+nQLrNbfYUOSoNjYHIYJY2D8k3ADKDeZn8Eb4c9EQoe
	 cIXjI2UIuxh5LFMWWruNPEf7+r6FgMJFjHoU1oiM3KH0xY2vz9f4dK5lzH2zUQYSAm
	 9AHHq1tQW/rew==
From: netdev-bot+sinfo@kernel.org
To: laixiangwu <laixiangwu@cmss.chinamobile.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: ti: icssg-prueth: Fix device_node refcount leak in
 prueth_probe()
Date: Fri, 30 Oct 2026 08:59:53 +0000
Message-ID: <179335079339.3327.14537748743173383861@kernel.org>
In-Reply-To: <20261030085651.1944-1-laixiangwu@cmss.chinamobile.com>
References: <20261030085651.1944-1-laixiangwu@cmss.chinamobile.com>
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

