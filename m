Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E7C606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 07:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zKS1Sw3i;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fkmIsroz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y1twZ2GXIDrX1DyCELXWktIRabO9Q3G/1/nbruvB7Oo=; b=zKS1Sw3ixSs419FG0eBMQBf0pN
	+uvaxsPFLLSdvhXhi1x4Nu7+3GFetkVMOdUEWKL621PbU0wN1Dx/8ObljlL5fu6rTfwFwtEXorBWP
	T7nS/to4VIfJBuRedM15RPeuSQOVsQ54/ZyYNO6mS8uQFqMB+ktaYE0dLzz17I5ktPUxEpv3v8lQg
	tBKfEdR5dcxN6DgDO+5Ll2WS6C41nkZMHL+tTTqqvo2niYdQiv9S4vtAvIpEDN6ZzjPP64WIV6KRD
	7Asu3xjfGnIoYJhqy+nyMqvbPCv1nYnetZxg6s3q9oiJDdp8WGaor6lDWOHRWOeT7vPn1+ErhKxCO
	TLi9lXKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVBH-00000004TgI-04Ig;
	Wed, 04 Nov 2026 07:13:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVBF-00000004Tf1-0Wzx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 07:13:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 92248601F6;
	Wed,  4 Nov 2026 07:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B41921F000C1;
	Wed,  4 Nov 2026 07:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776388;
	bh=Y1twZ2GXIDrX1DyCELXWktIRabO9Q3G/1/nbruvB7Oo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fkmIsroz8SPVEqCrxugLC3r71DIbzmk0gqEpl07FpSOxGll0iqJDArIh7Po5IJTGR
	 lxcefe1IsOE8kEZ+lC3Poc/qvrZ6MtNZwnLrmJZ9q1AfqPB5P7rK18IykLGk3V2syR
	 hre9sJtKw53unli23pLe+5W87DV4deQNED36phDNuwUW2EnSp9LVew+jdp3cCyoRh7
	 BPuko4p6n7PKvPCj+wCs+91GqeCUMu5nufF73ixcxYgQOJnWkJlQABPaog35LJKTxm
	 X27peuFFDAg4sB/vX0un4fCIOJ29QwzD/v9xMT1JU2PXXLzT0ktfmAigXOzTUJ6C0V
	 uPifXJP6vPiVg==
Date: Wed, 4 Nov 2026 08:13:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-arm-kernel@lists.infradead.org, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH] soc: imx8m: drop the clock reference if enabling it fails
Message-ID: <20261104-small-pompous-basilisk-ac9df8@quoll>
References: <20261104021429.1468237-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104021429.1468237-1-vulab@iscas.ac.cn>
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


On Wed, 04 Nov 2026 02:14:29 +0000, Wentao Liang wrote:
> imx8m_soc_prepare() gets the OCOTP clock with of_clk_get_by_name() and
> releases the register mapping when clk_prepare_enable() fails, but the
> clock reference itself is left behind.  imx8m_soc_unprepare() only runs
> on the success path of imx8m_soc_probe(), so the reference is never
> dropped when the clock cannot be enabled.
> 
> Put the clock before jumping to the error label.
> 
> Fixes: f6ef3d9ff812 ("soc: imx8m: Fix error handling for clk_prepare_enable()")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/soc/imx/soc-imx8m.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
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





