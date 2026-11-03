Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FBE606C54A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V3c95Lw0;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eO+vDHHY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iVaqWCIvOxlTswj8zlqsLe/sDKMY0KDVW7ynZAQ76QM=; b=V3c95Lw05O8US34uPl0l6zfTvS
	FGhUWThikwjCF23DPgUMrT9478S21hNKzl2pNrcIdXWgEKMTc0SFE5v32bfZTTDDfY7S4jAd7LtnJ
	BkUGDKiOUoaVaVPcFLfliULNvz4h0qc6hekxEpevGghayXo0X7yqKp9HB7nQOLBAnhB/5vvJJrjpO
	Seq8wKb3nwzDdf31LYZekr7pkGl1RhR+HDp8ymygNJUe/KOrNcHbqco0ST5o/X01hF65G/niXwU0z
	dlfjjelllhoTrL29I/IwGDV4piK8+XjdXSbXooqxupM7lPNPT7AC5lNKE1gyqcZJEklN7dPF0JAUs
	kD/+6d/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCP1-0000000295F-3czm;
	Tue, 03 Nov 2026 11:10:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCOz-00000002956-3nea
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:10:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D30160611;
	Tue,  3 Nov 2026 11:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA06F1F00A15;
	Tue,  3 Nov 2026 11:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793704203;
	bh=iVaqWCIvOxlTswj8zlqsLe/sDKMY0KDVW7ynZAQ76QM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eO+vDHHYyHXIXO/jgynse3/Sp94LcLFR/kjfA062WAHHfA2W9w5XssbOHEjQisSJK
	 WuBPAvh78jQFhSIzWK3kP2ef3lbDSbPx8NrjUCvG/cQNbex9ZO6kZXmqI/nCkoepKm
	 edGMnC287tQxfEGtz80j6eCoZVw/eEdn3vmQKToLFV9dtdhJeapIb0a3UZmJzxjh0p
	 jCyyBh/GvcDf7LULllMj2tq7ykbfrMyDIb7rs2klHO51i6MBKGV7SUDIh4S0tQm7MY
	 weWsSRRwDOE5kJgu974OTcVfOqQKpK2iaa1YVTeWF3uRiDMbGt8+bkxEMgPmguP9N9
	 qeU/uBeR1LMFw==
Date: Tue, 3 Nov 2026 12:10:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] rtc: stm32: release the LSCO clock provider on remove
Message-ID: <20261103-cunning-mellow-gaur-ade1c5@quoll>
References: <20261103105546.1394618-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103105546.1394618-1-vulab@iscas.ac.cn>
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


On Tue, 03 Nov 2026 10:55:46 +0000, Wentao Liang wrote:
> The LSCO pinmux action registers the rtc_lsco clock provider with
> of_clk_add_provider(), which takes a reference on the RTC device node.
> stm32_rtc_remove() unregisters the gate clock but never calls
> of_clk_del_provider(), so the node reference is never dropped and the
> provider stays registered with a pointer to a clock that no longer
> exists.
> 
> Delete the provider before unregistering the gate clock.
> 
> Fixes: bb7b0df2be5c ("rtc: stm32: add Low Speed Clock Output (LSCO) support")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/rtc/rtc-stm32.c | 4 +++-
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





