Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D65606F782
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hZqHSD3+;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M4fhaES8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RFD4NEWIqRqGtu5uO5m/Wa4jwby/2BfEOciBe8jqLAw=; b=hZqHSD3+au77wLBZI2FdU1WGh9
	DPlhMyxxhm1rKsCMW9TCi3SbU52Nl1jhH39qYX/h+64RyNnqvdu7jtttFhM+9gNpC94FsROYOV1Ez
	urjRmVgBqmy84D4zVIU7ei5HPLPsznlVBZAYYR8MFdIJTKq3TV2xGf81kOUXloovNxSPrZmBvFDZz
	8G3ryVey21cgs6J42fGtSUZ/DvSXKW7yCMLsh3Y+0WwovDLVqs3YiEixa2SZvxMM0yX60jhTFEIJu
	LH3yrAe6lHFp3pVTFcloudWh559YWdaQ8cYYvc9+lXF35fVLVeLZytEfp8wBOU+4k/6VwCXZWyjxv
	XmjAnwaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBim-00000001ygm-0kmk;
	Tue, 03 Nov 2026 10:26:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBik-00000001yg1-3wB5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:26:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 43059601FF;
	Tue,  3 Nov 2026 10:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 526511F000C1;
	Tue,  3 Nov 2026 10:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793701586;
	bh=RFD4NEWIqRqGtu5uO5m/Wa4jwby/2BfEOciBe8jqLAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M4fhaES8LjvD+Qqat35pRoUeiet2HgTCzz73C33r8PB5J5ueRvhW4tY5loH+9glUE
	 FsmA7bcXNQn1EZ+gzf/xgC7/4MD3RYl7qpCzV4W4mP1F9TaklZ/3lyVQ0a6jCT4bIA
	 nTTXX3GbPdUbRb8OLpNpeaMoWwWlHgxVE3lxWG7D3GcIt2RgBXVpjyoGzj2VH3wEx3
	 TzW6hKCuDJJpETAQUU8tUqcnx7Mycp0xM8BBMfSJkffFsKS4oN+va06sqcTV7LEiP2
	 it4nYvyJMxcROoG9nEY8gfsTT54KwKf4M9LDnzh87AHyqXuzyHOwhkqCL4zW+tWTpK
	 RrxbtPHY9uItA==
Date: Tue, 3 Nov 2026 11:26:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, 
	Ulf Hansson <ulfh@kernel.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] mmc: sdhci-of-arasan: Unregister all clock providers
Message-ID: <20261103-prophetic-elfish-sawfish-c9e22d@quoll>
References: <20261103100521.1309763-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103100521.1309763-1-vulab@iscas.ac.cn>
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


On Tue, 03 Nov 2026 10:05:21 +0000, Wentao Liang wrote:
> When #clock-cells is non-zero, sdhci_arasan_register_sdclk() registers
> two clock providers for the same device node: one for the card clock and
> one for the sample clock.  of_clk_add_provider() takes a reference to
> the device node for each registration, but the unregister helper only
> calls of_clk_del_provider() once.  The second device node reference is
> therefore leaked and the sample clock provider remains registered after
> the driver has been unbound.
> 
> Drop one provider for every clock that was registered.
> 
> Fixes: 07a14d1df454 ("mmc: sdhci-of-arasan: Add sampling clock for a phy to use")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/mmc/host/sdhci-of-arasan.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
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





