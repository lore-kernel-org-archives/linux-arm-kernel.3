Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1AE606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 07:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S++A/fhr;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nlqUiWBk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wVOjCbDkHa55vyrbh4K26MwsVy0NA5AwsYenc5G9h4c=; b=S++A/fhreQE39IviPE5fhJ7ab1
	/VS/Zxzr0QwkX4a8kZY3FVL4AP02ZJsDwvPXjaEst5pTcl4NYaZO2pzuaC85iSrAhGMJIlh4mrC+T
	szAOC8yqzY/aKQbiKqniMfQTX+YfbB/lyZVWgz61e9yRMNxnrj+ic7RJ5mIKNw5fjFByr6xg0S3gq
	WtSTJwH5eam2w/5wRu85OxnRMFH9lP7j5LyLJ+OhYNXs3zMdwhIjAQnux9fQlbdMYODzWK84keTdT
	uj6u36AxAgrRLUeHOJ3TDcq25HBkQ/yEW8iBUc9+6wsAy/YJab6agaQXE0t5wEpk9HHwjWrntm+QB
	g+coqTdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVBF-00000004Tf2-1THV;
	Wed, 04 Nov 2026 07:13:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVBC-00000004TeD-1IIi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 07:13:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C0B4D602C3;
	Wed,  4 Nov 2026 07:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F741F00A02;
	Wed,  4 Nov 2026 07:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776385;
	bh=wVOjCbDkHa55vyrbh4K26MwsVy0NA5AwsYenc5G9h4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nlqUiWBkFry4UsU5M6rCgLxE95eJUXttNhoi67bi+5zLheTG4VjCecDWkCDTiN7xy
	 TPznKOHYE8WN6Dl70s5197mImH/Qpp2/zl8qlh91mJwJeI7eeWW6GEkYSRkAO8f8gb
	 7E3tlHz+yLVVLn3lexZ7foqJsWxmJUqAElenPv8PzUb0UdN74Wze/1CF8jSa5dJHoN
	 vNJQgbttbbqXmBD3Kl7XoRE4wdk47wXYoDQCKhInSYA9pGbRVOc+LJ8WBt6wXH6LcS
	 z0YRgL42fuvf0O02r7aaZCCTPWM7cF+IOTrsxBOMsCB8gmIw2FY2c1ReWCLfNZl0qQ
	 wzQI/DV/Hd1gA==
Date: Wed, 4 Nov 2026 08:13:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] soc: imx8m: unregister the soc and cpufreq devices if
 action setup fails
Message-ID: <20261104-logical-neat-penguin-b6c302@quoll>
References: <20261104021432.1468280-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104021432.1468280-1-vulab@iscas.ac.cn>
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


On Wed, 04 Nov 2026 02:14:32 +0000, Wentao Liang wrote:
> imx8m_soc_probe() registers the soc device and the imx-cpufreq-dt
> platform device and then installs a devm action to unregister each of
> them.  With plain devm_add_action() a failure to install the action
> returns the error without unregistering the device that was just
> registered, so the device is leaked and its sysfs name stays occupied.
> 
> Use devm_add_action_or_reset(), which runs the unregister callback when
> the action cannot be added.
> 
> Fixes: cf7139aac463 ("soc: imx8m: Unregister cpufreq and soc dev in cleanup path")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/soc/imx/soc-imx8m.c | 4 ++--
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





