Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE7560A260E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oB1bLhP4;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sk/650Fs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IhgesoIix9StZ4qDPjO+BPgeSgYAhuw3j0/JxuasPEI=; b=oB1bLhP4ZXOie+oGtYIb1R+1eX
	OkF2WDRDnD9pxE1tGYpOfSXE/SUzkWETgaDSvTHOPhQLn1Y5clf+1BxgowwczL2K2VFcilwkY8QzC
	5HvsGrwXvoAW8EBAQbbtr75SgfsUzAz3uaJw80fy8ltAYpOaaBrcmR76axxge2gBzJ/86IXssEgix
	4MR672Ua0Qmq+udMPKhNcQ4WRMq55G6h/pwK1Xvx8s8+WIf+UFBHCMY6Ux6Nzg+9in+9Q4eXaZxUU
	fCOQvzByVi/dlE4WLGqCLBYDsLE5vTlh0ja3y/GX8znERSVBBstrHx72YLWVO8X/r62eZmvxuRnbr
	2Ua6PTdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBjW-00000001z61-3YId;
	Tue, 03 Nov 2026 10:27:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBjU-00000001z1E-2wWR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:27:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DC316022B;
	Tue,  3 Nov 2026 10:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33D631F00A17;
	Tue,  3 Nov 2026 10:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793701631;
	bh=IhgesoIix9StZ4qDPjO+BPgeSgYAhuw3j0/JxuasPEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sk/650Fse74yDh9z5CrHo7uJr/wIWlB1rrBHQLkVSLZ6j6T/rnUsGvJG0DQmVFybO
	 uxTaBZ0tqaVnnK0XGuqp5z3/O0IwzNRWvG6J2CON1e79KYbEK6ewVlTyLVhwuWISL0
	 7G0E5772CcRkY6FJYy39W1rYagft78YGkmkyY0/a/PcYHDiUZWblT8tw+1n/kRGNAw
	 qgRjFx0bt62aQrWf3dVwUe0rznNovF/ldIe53gMHrM/Ia3AxuRSu++MuuMwGv41x7W
	 CuiEvL5fMA2on/RzXX7Nq1kt9aeS0UpEPFTgb7BhxP4Qey5HRis05hduAEsgFCer+t
	 nvPR+wsTuf0gA==
Date: Tue, 3 Nov 2026 11:27:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, stable@vger.kernel.org, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-kernel@vger.kernel.org, 
	Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH] media: exynos4-is: Free the control handler if
 fimc_ctrls_create() fails
Message-ID: <20261103-resilient-steady-boa-90aed1@quoll>
References: <20261103094612.1289226-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103094612.1289226-1-vulab@iscas.ac.cn>
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


On Tue, 03 Nov 2026 09:46:12 +0000, Wentao Liang wrote:
> v4l2_ctrl_handler_init() allocates the handler's bucket array, and each
> subsequent v4l2_ctrl_new_std() call allocates a control.  When one of
> those calls fails it only records the error in handler->error.
> fimc_ctrls_create() returns that error with ctrls->ready left false, so
> neither caller calls fimc_ctrls_delete(), and that function would not
> free the handler in that state anyway.  The bucket array and the
> controls created so far are leaked.
> 
> Free the handler before returning the error.
> 
> Fixes: 9448ab7dec30 ("[media] s5p-fimc: Add color effect control")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/media/platform/samsung/exynos4-is/fimc-core.c | 2 ++
>  1 file changed, 2 insertions(+)
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





