Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C86560736F8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kO0JYihr;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LnGkaKwm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wGJCpB30C0eoXg6rT049KGsaSsKMI6A0wimQvcJwM14=; b=kO0JYihrQ2u8Bv3K8AulESa5bi
	Ber68rAMHkfOTrctCE21WFAHqT0lCRaPqEcqYa9i42J8WI3lW0c9/9XR1jKxuqwm/SUezfR67VBwd
	gMgE0u3r1FXwH1+AgdWVo3tHMpXN2LJG8zvnCEBEhe0XDTGurke3QaGQENAoECISINnUor6ub8Yc6
	h4gigGAWYkgDyWjjhKyuxgEKrzyq+FVA1hxFgDh1LQ9erPHKK8iwCP/Sfx+6wYp48O58rI/bOHAwf
	TjVX/MxSEksOF+cIMjXXtWH8kL1/TigloCKTMqrzogSqaMqKQDH6RJrsjqmNSH57BFJbMFN1WvzQv
	XKmE+hcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBjS-00000001yzE-2aAz;
	Tue, 03 Nov 2026 10:27:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBjO-00000001ywk-15qe;
	Tue, 03 Nov 2026 10:27:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B19B560098;
	Tue,  3 Nov 2026 10:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F80E1F00A02;
	Tue,  3 Nov 2026 10:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793701625;
	bh=wGJCpB30C0eoXg6rT049KGsaSsKMI6A0wimQvcJwM14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LnGkaKwmU2Pgj6dYUxKTioOxMCmTkev14EfBkt2mMQyiPJYAGSkiXfFFx+20EIQP3
	 3cC46g/CkFt9dMpAh16Tm7+DVu7UOoY6SyopUw9YN9GFbcojCfIjRr5GeBUD5NueGK
	 t5tVzvYLFrSYO6DAKEchif8wL+kkauU/IPbFGSm37EWjhJNHDzqo4d0qGlxfXwFhmj
	 jFwoplUEgxFnsJmzt0tVHo9QVN4J6BqGSt2ELcQXQ32//TD/8WH2gxPlEnDqK7nz9f
	 eZwvmjZKKiIj7H2klj8Oj4B3y/wTZjOEZOffDIgSDjdsSQ+MIdgEV3k2QGTPBuSY9l
	 hMWrPOP+TV9gg==
Date: Tue, 3 Nov 2026 11:27:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bin Liu <bin.liu@mediatek.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: mtk-jpeg: Release the decoder device on job
 completion
Message-ID: <20261103-refined-lorikeet-from-ganymede-ede5ad@quoll>
References: <20261103094612.1289250-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103094612.1289250-1-vulab@iscas.ac.cn>
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


On Tue, 03 Nov 2026 09:46:12 +0000, Wentao Liang wrote:
> mtk_jpegdec_worker() resumes the component device represented by
> comp_jpeg[hw_id]->dev.  When the job completes,
> mtk_jpegdec_hw_irq_handler() drops a reference to the master device
> ctx->jpeg->dev instead of the component device.  The component's usage
> counter is never decremented, so the component and its power domain stay
> powered, while the master's usage counter is decremented without a
> matching reference.
> 
> Release jpeg->dev, the component device that was resumed, and disable
> the clock before dropping the reference as the timeout work already
> does.
> 
> Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
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





