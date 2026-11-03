Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2540760A2609
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wbo8XPS1;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kW/9Nqnl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5JCgmnnBV7ODGkM1qXDPR9WPLQTgtUl6RjPyn6nE4gg=; b=wbo8XPS1g0wz0DHtRgz6okkGTT
	FVCx3ymFIqwFR88v4q5GzfryxNHg1Mno6Iyiy/B/RZ2bgvbX+ZCR5l1uDziXZmXNYL5uKj2tr1T/B
	qHjWbedqQm6/P850ubLTtXT8MfibzGLz+VTsLU9QIIDp4X+mNVHdLIZt7HtHjT7g4sRWedEHWSCqX
	yw70Ytw6A0PSHufMDN+WqnT671EYgmFJn/OU/6ELaXpeLDPbAJS33BuSWFZq0ITS6+UoRFxXf5K3V
	2xw02EhDcQXVPZuLz/T1Z1Q11Za1NNsrZtRS1F7ypDSjoqcZlfk3MSbpMAhHgkqT8eVahm5qDtuhX
	pocWn+3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBjT-00000001z0L-3TyD;
	Tue, 03 Nov 2026 10:27:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBjR-00000001ywq-2hLM;
	Tue, 03 Nov 2026 10:27:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F0B960611;
	Tue,  3 Nov 2026 10:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 125B91F00919;
	Tue,  3 Nov 2026 10:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793701628;
	bh=5JCgmnnBV7ODGkM1qXDPR9WPLQTgtUl6RjPyn6nE4gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kW/9NqnlCo3bKlu6H7GShjdIrl2ZuQjd0jl/USYagMnaMCukaur5fPw1Zt0dTzIFF
	 8N9o/UYYQcuDD5fFf/4Za154D4g/vCE88R7+sUYXSD3oLBcB+1wp2fAfrntRnfwBvK
	 L3JCWGVm7Ala9fj73wbM46izIadxvYRukOEejFBDlZHQn/831Bl0ZO/yzkzR9rDghh
	 PY0i6acxuXXa18jod7zvUIyzzq4uqfyG8OKIrn53ucoVhJhFvCMjnWMI+FSiVQVpzn
	 FCZPq6UgnZdnJPXNCprsweuFmzSZdwghMPJ+HA+eJjaGs+gbwebCsrFKDNIEOAn276
	 rFyHyzjp20XLA==
Date: Tue, 3 Nov 2026 11:27:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, stable@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, Bin Liu <bin.liu@mediatek.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: mtk-jpeg: Release the encoder device on job
 completion
Message-ID: <20261103-accurate-aboriginal-jackrabbit-dc2ddb@quoll>
References: <20261103094613.1289270-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103094613.1289270-1-vulab@iscas.ac.cn>
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


On Tue, 03 Nov 2026 09:46:13 +0000, Wentao Liang wrote:
> mtk_jpegenc_worker() resumes the component device represented by
> comp_jpeg[hw_id]->dev.  When the job completes,
> mtk_jpegenc_hw_irq_handler() drops a reference to the master device
> ctx->jpeg->dev instead of the component device.  The component's usage
> counter is never decremented, so the component and its power domain stay
> powered, while the master's usage counter is decremented without a
> matching reference.
> 
> Release jpeg->dev, the component device that was resumed, and disable
> the clock before dropping the reference as the timeout work already
> does.
> 
> Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
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





