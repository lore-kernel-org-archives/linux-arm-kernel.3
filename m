Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD5A6072C92
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IeTyt/xC;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cm4ZB0H6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RcMnyr+QZreXmLDunbGYb1afaYzZsEF958MXJawqWo4=; b=IeTyt/xCLUm/uZX3rKWrXEMWWL
	Pu4XQJ++Lg4/3GuuDzM+Ck3+zbQHNkofMz3WfqEYS4FCgVHv8Od2vrzk5wx593C72qSJ4OgK/+3+X
	xNQpf6BZbzloUqk5n3Zc40PtWLs9sJT2G5VigR2/C5tQKkoht7rdCRzumS5UaoAy9jFoaCcOZiJxW
	rtzyOcPC6xu8Qf5NHsgjoseU+LAGyj2gQh6xz7bzQ69bYJY2vZJFyQ/syjUyLgt5mnx1OR+VvfSpy
	zQ8i1t2zWc9ujQVnAYUtDw8az44STbTZt5S3gAeeN7WnTYTItj+7CemmISPO9T5PzqAn7t1lQ3H8q
	D2Axgyog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBjJ-00000001yuH-24vK;
	Tue, 03 Nov 2026 10:27:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBjI-00000001ytX-0pTp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:27:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CA73F41F9D;
	Tue,  3 Nov 2026 10:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24A3F1F00A02;
	Tue,  3 Nov 2026 10:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793701619;
	bh=RcMnyr+QZreXmLDunbGYb1afaYzZsEF958MXJawqWo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cm4ZB0H6xvIjRkLwWHZrUWyyBc0FJ+PTttq5RDfq4yuewGn7EE9KyGRoxJ328hYYc
	 Gsad/KkeMKRTb5dAEUjv9LCFoMi/OZpjQELOYLvTywguTspaAM/oWotQ/LPFYIHfYQ
	 u32u705QUwmxzD6pNADK2gs3V7lclzEJtmvwHn2IgikCJMBNVnHEBnd4vbiN1G5p+2
	 V+Q4H36KfhsLUyVnfN3S8PcaN8cjd0VO+D8NpQuXdr1tj5rlPtU7V76UYWBhjSolkL
	 GAQSI7BiUnh0GlMVVFs5HBevmkHmNnVfuc0QAMeI0RH7YBQYKtsWz0WejFlgDekFDY
	 whZj99QsP/3vg==
Date: Tue, 3 Nov 2026 11:26:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] media: exynos4-is: Free control handler if ISP subdev
 init fails
Message-ID: <20261103-sandy-giraffe-of-coffee-b4ab6f@quoll>
References: <20261103094616.1289357-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103094616.1289357-1-vulab@iscas.ac.cn>
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


On Tue, 03 Nov 2026 09:46:16 +0000, Wentao Liang wrote:
> fimc_isp_subdev_create() initializes isp->ctrls.handler and creates a
> number of standard controls. If any of them cannot be created,
> handler->error is set and the function returns after cleaning up the
> media entity only. The control handler still owns the memory allocated
> for its buckets and for the controls created before the failure, and
> neither fimc_isp_subdev_destroy() nor the caller's cleanup runs on this
> error path, so that memory is leaked.
> 
> Free the control handler before returning the error.
> 
> Fixes: 9a761e436843 ("[media] exynos4-is: Add Exynos4x12 FIMC-IS driver")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/media/platform/samsung/exynos4-is/fimc-isp.c | 1 +
>  1 file changed, 1 insertion(+)
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





