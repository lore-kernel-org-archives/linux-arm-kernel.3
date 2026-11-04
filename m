Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8F2606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 07:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GjpLueAx;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F6BNiPhn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IO3cVza1i0usdKIWVNIEoSXPxMhdh5D5NOd2pz4wcxc=; b=GjpLueAxUIqHaODu1wgA7dahJ3
	kc077aDOBhUPSVQCNUqLjeHGhZ6HPNzp1+oFdFFnYpLS1Kc2J5gUcwciThwynYsy4L27lxQuB4s0h
	KW6LJXCfmgKnjSzzEX03ebCGIsxp5CjyGznpl2O6zSWA9c/awERzJ7CwHgZSVcLwuE3JKkFNQJWxN
	ciflJnem4Fxzc/i4nIjPkBW0YCJYi20aFrJDJn3b7+W42FrNyE4sk2To5CvJBXqaEUPN6lDEQR8z5
	xF57knSacuMLjq2jpvLyO5DqkNPIZN3yCrKmJsLYTO4vh3XEbCTaNRDH8ZzmayNuQp3oYvauMlJtd
	x/f1+7DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOV8e-00000004Szq-1qKs;
	Wed, 04 Nov 2026 07:10:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOV8d-00000004SzO-2VDD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 07:10:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D95260AAB;
	Wed,  4 Nov 2026 07:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 610C41F00A02;
	Wed,  4 Nov 2026 07:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776225;
	bh=IO3cVza1i0usdKIWVNIEoSXPxMhdh5D5NOd2pz4wcxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F6BNiPhnDZaAWJc3GgPxz70yZ2odm/RL4dduN5hLGpw9uVmzzsKFcdkZWxtDUAbmd
	 SJoNsAtp0gdytwx7RIcQY9RQgUm96PYsxNNwcsDPFWvv2SSI4MLKtqAoiJ6Au8tArw
	 Mf7VJS5f3x7sRRux55bs1nPumZc97bCagnTjgooa+qApazH/+Sxx2VBN0+jovzEjDa
	 JGT6YtQgxxEX9ZyRJQKYQqmR4c4iRswJRfRt3CcjqSnTeF68Kcinca9M0aQ1AiA9Ow
	 //Ru5tJfbYQ0mdMryjjSM2HsQjB0AhNhP/a8Id2lUc+QI2xLvGmUDI03zJMZyFhgY/
	 hpI2CcIFlNpWw==
Date: Wed, 4 Nov 2026 08:10:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] rtc: ma35d1: release the clock reference on probe failure
Message-ID: <20261104-hissing-succinct-cicada-8dca1b@quoll>
References: <20261104025339.1527356-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104025339.1527356-1-vulab@iscas.ac.cn>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 04 Nov 2026 02:53:39 +0000, Wentao Liang wrote:
> ma35d1_rtc_probe() gets the RTC clock with of_clk_get() and enables it
> with clk_prepare_enable(). The clock reference is never dropped and the
> clock is never disabled, not on the many later error returns and not on
> success either, since the driver has no remove callback. The reference
> and the enabled clock are leaked for every probe attempt.
> 
> Use devm_clk_get_enabled(), which ties both the reference and the
> enabled state to the device lifetime.
> 
> Fixes: dc0684adf3b6 ("rtc: Add driver for Nuvoton ma35d1 rtc controller")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/rtc/rtc-ma35d1.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 

Multiple things here:
1. Your team ignored completely previous feedback. Multiple times.

2. You use multiple identities with this email address, thus I doubt that we
   speak with an actual person.

3. Your bot does not even bother running checkpatch, right?

4. Nothing of this was reproduced nor tested.

5. Finally, the same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document the issue discovery method and what was
or was not tested.

Best regards,
Krzysztof





