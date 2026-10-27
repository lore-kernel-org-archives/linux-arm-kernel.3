Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95D9606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X5DoeOg0;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FvYtp0N5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LPA6Inh2wBCKqBtP/pIYKJnpKzD87TCTJsmoxrtXeEE=; b=X5DoeOg0kQrUc4KemMgLPh4XSF
	SzoWr3r3qr4SFN1pzrpu0iBA8e/DwcCnbg3u6W524kE5erZ02nX1qAD0NHckM6LmUnagfyAd6n0Jk
	PziDxxFNDt5U9QsH9idRffz0RAAUJ0C7vnKA5QK9IaKDIqVDVvEgWsNVQJjeYJxJS+NA+MBvf9NBK
	13PVPoNQRQKXx8SKy/lpPCnWjfEkbBaHqQN5mt66AAqIS1/hK440+Wv0KPmYX6gfHULOArjsAB4q+
	A5Yiny+1qtfN82O4+xvy74UlUKha6FuNyTx/FZJhFJckdo/7HHqdjj2BcXfpxWX9R1yECS9n6rkTY
	qBbESLkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLh85-00000004nJy-1bPO;
	Tue, 27 Oct 2026 13:22:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLh7y-00000004nBF-28uN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 13:22:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B24560136;
	Tue, 27 Oct 2026 13:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69AF71F01825;
	Tue, 27 Oct 2026 13:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793107329;
	bh=LPA6Inh2wBCKqBtP/pIYKJnpKzD87TCTJsmoxrtXeEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FvYtp0N5JHXgaDWI+G+zdVt/oggEZWpBYPUXKXGOhjpQSzp0YUuHTDhDDu5pgDVHe
	 2UB3qU1XthAtPNf6Sh7SYD5Nzgv5tXH0iOPO4nVOj1KjKbuFtyZ29m35/diwzlH2UT
	 6NurtcmD8qVEh+VJfXoLGODJR7y0f9iAgYXRZfKgYYYc2tSQXVCgdUtLWsaE4kzsXd
	 URTCr39/xmvMVAteEcZRJHt+e+tYRqvk/nYkntgINZJrHzFk+Ryf4zaXlukMuT2bum
	 gBsg/cUx7Lp3XqxdxW/h8qQ9Bo7mk1mi2/iixnlg1ziDV0Gf4mbaY0IkXdQV/7lOQ6
	 UUIm/bJU1oQVA==
From: netdev-bot+sinfo@kernel.org
To: Meghana Malladi <m-malladi@ti.com>
Cc: haokexin@gmail.com, jacob.e.keller@intel.com, pabeni@redhat.com,
 kuba@kernel.org, edumazet@kernel.org, davem@davemloft.net,
 andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>, danishanwar@ti.com
Subject: Re: [PATCH net v2 0/2] Fix switch mode for offload and non-offload cases
Date: Tue, 27 Oct 2026 13:22:07 +0000
Message-ID: <179310732792.3327.10198783590651043272@kernel.org>
In-Reply-To: <20261027131732.3411403-1-m-malladi@ti.com>
References: <20261027131732.3411403-1-m-malladi@ti.com>
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

