Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83414606EE85
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NbIcLpl+;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DtajaLg6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Eg5BCPoUEY1h1ZeGRosbdkm/MueH10ESc7FjY/jtN2g=; b=NbIcLpl+yIRHrpDeoEVOl+00CL
	k6xjHgktYI4IUJe8Q+onZqcl88XdGYGtjOPdlHl2Tht1itShsgScizkMVDzPwMx4AA/o4gYx/fbUr
	YbxXxsFexFvBVr08WjbOJC8i3rYNuzY95JT/yZy9SmXhk86/SSw7pYWGoqKoAlL8H4Fj7PLs5sNPE
	p8/TH44r/v2lHTk7kUS6BP8qAcLiHoBhuHcptRVSbStOryRqXP7pPHyEuEogQyxY8o4fBoEyUY0jy
	D3lT23e6yfsMkG7kvqH1MAyJ5n8g8mlHX6akIP/tPGfuGI6HIrzeiikwvGedPmTpEFpOoootI8N86
	49BRtGNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCPO-000000029FJ-2EoW;
	Tue, 03 Nov 2026 11:10:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCPM-000000029EN-33fU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:10:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 30B9B60616;
	Tue,  3 Nov 2026 11:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830CA1F000C1;
	Tue,  3 Nov 2026 11:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793704227;
	bh=Eg5BCPoUEY1h1ZeGRosbdkm/MueH10ESc7FjY/jtN2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DtajaLg6MxpaExN7h4KTy0DlAmC7uYw3sD7pvl2yfDaYG+/URx62mIjDmKhmtv0lO
	 HHE39gN5w5wF3gBr7UhQMHRnJnsyiRsVh5e1F/+898TQ9bH1FJ3EJY5zY6wnRuHSnz
	 2TXXbvqL7dYDivjByVEY4iyMHpDzLzR3MjvLu+aGiWBSw/+qFGiWULXCYlE5kW4dl7
	 quYlw8d3WExHYdSCUj4a8cEYqjeiKBrzTCYvXsDSItYA6xQA5u84Ld7ZJ5Rhkgm2S7
	 eBzkbXsV0gF44AwJa2CdVMOjcjHWPr4e9M/bJzg1zplgQnKoUpUHr0k33tNaLA8y1V
	 JbeQKobt/h37w==
Date: Tue, 3 Nov 2026 12:10:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ray Jui <rjui@broadcom.com>, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH] pinctrl: bcm: release the NS2 pinmux controller on detach
Message-ID: <20261103-colossal-snail-of-energy-3e55c9@quoll>
References: <20261103104242.1373883-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103104242.1373883-1-vulab@iscas.ac.cn>
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


On Tue, 03 Nov 2026 10:42:42 +0000, Wentao Liang wrote:
> ns2_pinmux_probe() registers the pin controller with pinctrl_register()
> and stores the returned pinctrl_dev in the driver data, but the driver
> has no remove callback and never calls pinctrl_unregister().  The
> controller is therefore never unregistered and its memory is leaked
> when the platform device is unbound.
> 
> Use devm_pinctrl_register() instead so that the controller is released
> automatically when the device is detached.
> 
> Fixes: b5aa1006e4a9 ("pinctrl: ns2: add pinmux driver support for Broadcom NS2 SoC")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/pinctrl/bcm/pinctrl-ns2-mux.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
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





