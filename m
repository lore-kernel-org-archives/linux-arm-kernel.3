Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412FA606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 07:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iWl2hQa2;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SCVmfEoe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xILj8Tm3aDhTOPQBwxeTO5Ypeao7lilHCRjQVnQke2s=; b=iWl2hQa2u5egheeKadJDLZDT5J
	nOB+OP3VV2c55Kw97ovjg4FQx4qukPyA/43+To8y1sMLD5Hn5eJAOgqcgY4AA48IksG2Ejq9RQzg1
	mCBudHFh1cvOwXJ5DhJ8/a6/a/9J1+cX8Ao/RVbo8K3QPmcefVJgYVDcdHSKhYpVKyVSfJOM1NDsh
	77AQBCdQSvYcnrh3zybKZ7pPzs2Q778T1M5EPF7AIVAQSZYRBiIgkFJoRk77viipvd61aChgExLVX
	x7s5/HCfT1YK90ZeVGAnf09dfIm8JGinOLIHRRJD6NLU+/KhOSejRZpnUz1Oq8jBVetYSznn7vAMD
	0yFYnPvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVBA-00000004TdP-0Nr8;
	Wed, 04 Nov 2026 07:13:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVB5-00000004Tcx-3tqS;
	Wed, 04 Nov 2026 07:12:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9413A41708;
	Wed,  4 Nov 2026 07:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C4D1F000C1;
	Wed,  4 Nov 2026 07:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776379;
	bh=xILj8Tm3aDhTOPQBwxeTO5Ypeao7lilHCRjQVnQke2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SCVmfEoezYd/adZnLKMKPoHWwwmr4odwUh07FyO1G1Wk/de9L9xMtfN4szihEVfh5
	 AgcZkgjn/5Bxe9y5lXQP12nCjJAYF0jy2mS3oZ5Vfyfu13PwM1VzNrdBb718GCuSGs
	 DpR8NR4c2k+iZZDVQ+ga1SKf34rA0zots8/UHYXUE+p5V1zmaWIj327sESerhOMVgD
	 o+QO3hI2+vAlWNCyVI/txhWnI1+6VJ6RC1UNVeClXymRuscbqsSe81TjTrhMqXmWr/
	 9+77OP+7oOvGweP4XIW94RzsbWTkDQRn869yWCApa0aRTCbVxQf0ShEWpqT/mfbW98
	 joCnwrfOR3+kg==
Date: Wed, 4 Nov 2026 08:12:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] soc: mediatek: svs: drop the subsystem device reference
 on failure
Message-ID: <20261104-blond-tanuki-of-calibration-db8c5f@quoll>
References: <20261104021445.1468378-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104021445.1468378-1-vulab@iscas.ac.cn>
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 04 Nov 2026 02:14:45 +0000, Wentao Liang wrote:
> svs_get_subsys_device() returns a device from of_find_device_by_node(),
> which takes a reference the caller owns. svs_add_device_link() hands that
> reference to its caller on success, but both error paths - a failed
> device_link_add() and a supplier that is not bound yet - return an error
> pointer without giving it back, so the supplier device can never be
> released when probing fails or defers.
> 
> Put the reference before returning on both paths. The device link created
> on the deferred path is kept on purpose: it is what makes the driver core
> retry the consumer once the supplier has probed.
> 
> Fixes: 681a02e95000 ("soc: mediatek: SVS: introduce MTK SVS engine")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/soc/mediatek/mtk-svs.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
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





