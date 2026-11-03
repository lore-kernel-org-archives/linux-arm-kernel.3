Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10038607E63E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FBwx/qlz;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dupApXeh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=FBwx/qlzhC9hYoBItTVqYwO52l
	NWy0IJT+wdIc131MCf1OV04r5Q5hdoEvwiMZRhhp2A0he/BXHHahXxID2qvRrRtv/X9GNjnSOd4yt
	BWrSVuDvI9OUJZ1eAAMngslY6PLVvT4zSoOKF8BjJW10KSaZgmfPTA0SBfX4MnJRmqittfhGluGmN
	ISujUyx/PGkMARlohU0k7UrOLDnD6FCn/ImFwik96EbpRcD91FRlzVKVDiPEF2bhOUhkTFFnJEVdW
	Bhfpj4AfFYlc7yWUNFoKBuNGmJprhhDB8Q1pd3WSYmvlH9HhvSTc6idAZaZhtZN5x5O31/RViUGVb
	fQUk94yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBqk-000000021Vh-3dTT;
	Tue, 03 Nov 2026 10:34:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBqi-000000021Uv-1crg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:34:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7414D6062D;
	Tue,  3 Nov 2026 10:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570DB1F00A15;
	Tue,  3 Nov 2026 10:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793702079;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dupApXehiBaqP3jN10iRqYbpNyFl9jy0PbnPU5w/buR0o0sPwfVXBdIgGLvyQLFfA
	 PyiHdnIukzVYc5kvElp5HX4kL8ey9s+XkeWYM7hDUNCfQzC67EO5rVVt+fp4sPrGnm
	 5hT7wNu3WsIdIclQVR/DRhaXJlK3msjWLAnz1Vxr249FTyBQ67WmnSt7LgvtWYiDFh
	 +pp6JZRBcP4WA6noP6mRJFjKWKRkMS6ZgwnlxST9deWS0hirU9YVeRCvIJE6wz5+Rs
	 xjijji8abSp26Xwf2F9grHrhKA2cjJEFiWN4E0gMP0zH0DLS1dTtdznpu8T4Ag2cZM
	 U3Ou3UPzlGC8w==
From: netdev-bot+sinfo@kernel.org
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: release MDIO node if bus data allocation fails
Date: Tue, 03 Nov 2026 10:34:37 +0000
Message-ID: <179370207786.488859.17799263929240060160@kernel.org>
In-Reply-To: <20261103102856.1340705-1-vulab@iscas.ac.cn>
References: <20261103102856.1340705-1-vulab@iscas.ac.cn>
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

