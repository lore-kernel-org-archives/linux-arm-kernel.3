Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F9C6070AA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OP/cZRMA;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZlJLy8eM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rIlYC4RGaBYFb8msoJbR+EejQjSODQYfHSJuVWGfL3U=; b=OP/cZRMAYgSLPYGyZ28zVtYgcj
	TnwkR8vr8X/3vEqmk60YVIFXj1CngPNkSpqPVpq3lFGW4B2PJf1tCTTmmkdfWKpQ54ndaQyOCM/gW
	Blg5id1yy5gko/t1k1IBYpuj5zq0+kq9yLgJvrY++aq1EjwKqOcqe9ThTO3xy3+SpSULaL4lwq2OT
	9lBMPLJsUGuNgZu3qpz9XDP5GS2MMTL2Iy9vV/dP3aYAPY/O4gKWawffjOCk+H+IwT+43mv6VSs0a
	Aj97SrGxgU1NH9VsDDpCfH1yToBgJT803L+jn2r1OW+rjVz+mbvIqBjebFNqYIafOaeXG6Ipdu78h
	aHyzXrPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBip-00000001yiu-1AtE;
	Tue, 03 Nov 2026 10:26:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBin-00000001yhu-1PJL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:26:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D4234187A;
	Tue,  3 Nov 2026 10:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2FC1F00919;
	Tue,  3 Nov 2026 10:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793701589;
	bh=rIlYC4RGaBYFb8msoJbR+EejQjSODQYfHSJuVWGfL3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZlJLy8eM6LcgBzKjbZG6s94R+zcLzCqKvHAN+PzsR+gn5D69ZF1XwfBbzG9kmOHly
	 rkx6cHR0QurRoj5qxtYCZDjTPCVdFiKLa01IqHlDkYLlr0U6emnYFh1GkgOwkl29Vf
	 YYcYd9z0J20m/jOXF0V9o1yjzCvDA0fSiC7iGZ/He6apFFFoRwKWRlbyCgBq0abnTp
	 f6y+/FVq6ZnicYtpiyoYDHka1LPwP7926QpyWYlq3w3LKz22OexFpMCWiSEjxxe4w5
	 vIP5CzZfUWwj2Bc8IevU2OltJSpdiTFr9MuhLrcjcioMzEtUmPafbDpcUmwutDArHk
	 GYSgoUkqgNTnA==
Date: Tue, 3 Nov 2026 11:26:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Samuel Holland <samuel@sholland.org>, stable@vger.kernel.org, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, Vincent Mailhol <mailhol@kernel.org>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] can: sun4i_can: Use devm_clk_get() for the CAN clock
Message-ID: <20261103-competent-tactful-condor-50b96c@quoll>
References: <20261103100520.1309743-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103100520.1309743-1-vulab@iscas.ac.cn>
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


On Tue, 03 Nov 2026 10:05:20 +0000, Wentao Liang wrote:
> sun4ican_probe() obtains the CAN clock with of_clk_get(), but neither
> the probe error paths nor sun4ican_remove() ever call clk_put(), so the
> clock reference is leaked both when probing fails and when the driver is
> unbound.
> 
> Use devm_clk_get() so that the reference is released with the device.
> 
> Fixes: 0738eff14d81 ("can: Allwinner A10/A20 CAN Controller support - Kernel module")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/net/can/sun4i_can.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
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





