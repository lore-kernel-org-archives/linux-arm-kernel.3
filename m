Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B801B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 10:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cN8WQ94O;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bDpw8+ys
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Wf0uPaRwggOutnw7/pw6//TwuSgBGQaNrdvQ/zHEx5w=; b=cN8WQ94OsxvXG5
	73laAiqXuvFpCIlPwRHdRXl0vpoZ6be4QhvKWJDhBiV//5X8ywoaqi/4EGPOZXYuLTiPICdRhXJJJ
	QBiXaRF40urkQNbuipVu7R+TNvK52cEJstkH1tNbiClpd671UqSlA+8d5tcwcROSCG3F3pESu4ooh
	dImiX5HI9xlOBcHi9S1MDET+AEDAqpnh9xTXvGZzaes45CyxpeF500uRa0KCVZt9R8HHnj0RfDqWx
	o8i51e8zU0jIsNHxD4rUlaIQNTK3B4cS2AEOKnW1yC88khGBzUlf/2NUweDV3Vdb5gjB1ZdGLV2hI
	3duXx3+R7FyvrjbOKF4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLIBM-00000002HRa-1j35;
	Mon, 26 Oct 2026 10:44:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLIBK-00000002HRP-2b28
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 10:43:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1909E41579;
	Mon, 26 Oct 2026 10:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B3E1F01825;
	Mon, 26 Oct 2026 10:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793011438;
	bh=Wf0uPaRwggOutnw7/pw6//TwuSgBGQaNrdvQ/zHEx5w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bDpw8+yswp51VW2WiUh1P9jbp4Ygh2PYzvQLx8Ul1/aD1+J3+PSCr3CU/lTqC3lSX
	 aNOOMWQwFUPiNQRBm2bO/QxIqDB+Zchx9SClqQfjhCMjqon9mG3eqAMw/tebqlKEvN
	 +1pVhkCSu7nB41rjOpFAavh0oJkWXtkWxTchDdZN+nHn0aoFjxUtGN5hjxdYs14zpA
	 +OmMJK1tpwkhM5A3Bv7IjI2t98IhQNzO4mYqFVGXlnIi/7EJUP7WX8f3fuMEG6AYkI
	 XA/xzsYKyQ1iyL3nZXNWd/lgT9/3XIkeMWfDdND0dVNwBBmABGAEvE9naRIsc+Zmll
	 Vcykj16VfAnmA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: David Cemin <dcemin@nvidia.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_ffa: Compare notify_id when looking up notifier callbacks
Date: Mon, 26 Oct 2026 10:43:51 +0000
Message-ID: <179301133069.1771203.5657844869255921300.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020220902.611138-1-dcemin@nvidia.com>
References: <20261020220902.611138-1-dcemin@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 20 Oct 2026 15:09:01 -0700, David Cemin wrote:
> The notifier callbacks are kept in a hash table keyed by notification ID,
> but struct notifier_cb_info does not store the ID and none of the lookup
> helpers compare it. hash_for_each_possible() walks the whole bucket, so
> any two IDs that hash to the same bucket are treated as the same
> registration.
> 
> With the 64-bucket table, hash_32() maps IDs 2 and 36 to the same
> bucket. A driver that requests notifications sequentially therefore
> fails at the 37th request:
> 
> [...]

Applied to sudeep.holla/linux (for-next/ffa/fixes), thanks!

[1/1] firmware: arm_ffa: Compare notify_id when looking up notifier callbacks
      https://git.kernel.org/sudeep.holla/c/8ab2e426762d
-- 
Regards,
Sudeep


