Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EEBEB28D4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 07:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1No5ZvlsgoJE+yC1Nqoigxav4jf77WH/f2pLm5U7tZI=; b=c0ZY9vwojyv20xYrjZ858UNjjZ
	uid/YgORE46d8obVIE+E1XuLJUUgyzxKSeVEcqEVV2p5QRBOKtgP4bJFP1Qr22in0Y8AytSlrF6bL
	xa04KFcpH1OzR/DPf6k7yZiiwvF7rU0waxaPNAWp0b5jNhsksItkAgXGeJal5qah5iEBtZbdzOs56
	vohBnt8pOBf+9W2nUjm2nKZhCrAZXQKd6TUV693OhNuBKGUAH196SlMUi4XpOvEkOJ1+3+jPPwW+V
	5+CsNenLEmHQcBKCwRzKkzWnF1alzO0ZwNsQj1PvqYRKYx/Fxrn1KRlXD4DB46G35oAQe/8WZFkWB
	rBtYJ0gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voGD4-0000000AzIO-3LXO;
	Fri, 06 Feb 2026 07:24:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voGD3-0000000AzHt-2Nps
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 07:24:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A1468600AD;
	Fri,  6 Feb 2026 07:24:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9EE4C116C6;
	Fri,  6 Feb 2026 07:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770362696;
	bh=P0NhoGMuk6PH5jP7ZeN3aTohFrPPtEmPqpM83aqZXaA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sbREU9FbWU9quRswUeOLIUKRE/bDm8Dd898bYIyaKd6lRBhYQJrYLNlmiR48w5HJ4
	 jX2mqq8d3PeteEFqF774P+9ph6+X/ttO5jVW3/leuQnp2Jkb0k+apFaCiR1vmuBbHv
	 wdSXX/rzHb3FF+wJzpgK9mwJBFG0hcpwtPoS32pMdOAuAJBAgg8vP5Y36F4MhMdjS4
	 GK/WQ6rbmR5Nhf/5eHsddDblCy+bEzTIDoiQWnWkGcB7Ji873P2pFFlVovIO9gQxAH
	 8Y1UacvCmVaf0inBJTc5/wMA3qGIO6P7gYyKMPCVvA2vsQmNsrxMw0uAUTbiZoYT4Z
	 3z9sYGgzA7RNg==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: CHAMPSEIX Thomas <thomas.champseix@alstomgroup.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	Roy Pledge <roy.pledge@nxp.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Scott Wood <oss@buserror.net>,
	Richard Genoud <richard.genoud@bootlin.com>
Cc: Christophe Leroy <chleroy@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: fsl: qbman: fix race condition in qman_destroy_fq
Date: Fri,  6 Feb 2026 08:24:38 +0100
Message-ID: <177036249397.3323736.12618812589949729211.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251223072549.397625-1-richard.genoud@bootlin.com>
References: <20251223072549.397625-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1195; i=chleroy@kernel.org; h=from:subject:message-id; bh=s/9qncZXkiRO4FXncL0CjHqdtLNJ8JipcvT2jBzGz1A=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWS2Tre68l9pplRo+duDR+4UMDO8TeRLrLGK//YjganWS DFS53JRRykLgxgXg6yYIsvx/9y7ZnR9Sc2fuksfZg4rE8gQBi5OAZjIbz5GhuNlWybsF21xr89T cmaMu/Z3Y0n5hGaNlvP13jG8coZ8pQx/ZS5NcztynVX7xYaddo7idenxPOsU3yycyzuvWt4kNSe REwA=
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
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


On Tue, 23 Dec 2025 08:25:49 +0100, Richard Genoud wrote:
> When QMAN_FQ_FLAG_DYNAMIC_FQID is set, there's a race condition between
> fq_table[fq->idx] state and freeing/allocating from the pool and
> WARN_ON(fq_table[fq->idx]) in qman_create_fq() gets triggered.
> 
> Indeed, we can have:
>          Thread A                             Thread B
>     qman_destroy_fq()                    qman_create_fq()
>       qman_release_fqid()
>         qman_shutdown_fq()
>         gen_pool_free()
>            -- At this point, the fqid is available again --
>                                            qman_alloc_fqid()
>            -- so, we can get the just-freed fqid in thread B --
>                                            fq->fqid = fqid;
>                                            fq->idx = fqid * 2;
>                                            WARN_ON(fq_table[fq->idx]);
>                                            fq_table[fq->idx] = fq;
>      fq_table[fq->idx] = NULL;
> 
> [...]

Applied, thanks!

[1/1] soc: fsl: qbman: fix race condition in qman_destroy_fq
      (no commit info)

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

