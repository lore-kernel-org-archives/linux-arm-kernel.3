Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F267606C567
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2q9G7ozI;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=chPTcyEu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/W2mjbTmgpq1pqBSl49B/N5yASScZpRogYzJGRRzFXs=; b=2q9G7ozI2AmOCieN3q4KxmNEcp
	fEOAvgMACwrhMAmrckjQ8rdIuRtZgEuyYPjPhRNDgu5DUopK2WumKP1pmUqCY5evEUE+RTVwq+VaO
	rm3PN9WSDofKktbcD3wBR4LANhu5v9elg/qsnYZtcE2m8GpAyiLmIp+WFKG18HdlGA+A1iOzs+5Bu
	6T5slfsbDWk7eEwRd2CbUJPsxV74oFl6KmSREIzQh0FVEvr1NSnm47+DBmm5XUvNGV1/XJHC6oOtn
	gJWhYlfB3Up2doiY2TuWyZ2A6bmcQj+LjpyyFMeABp/uKMci51mphXhpF3Qt/EQ9hC3w5R2tdEtD8
	8xTcxzJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCPK-000000029Bu-1Mho;
	Tue, 03 Nov 2026 11:10:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCPJ-000000029An-0PHA;
	Tue, 03 Nov 2026 11:10:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D6A7440659;
	Tue,  3 Nov 2026 11:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 344011F000C1;
	Tue,  3 Nov 2026 11:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793704224;
	bh=/W2mjbTmgpq1pqBSl49B/N5yASScZpRogYzJGRRzFXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=chPTcyEu3+6/DSswsWsAKE3hFccxSLecUPqONvn2808hJLH2u9pAFZDufqnPJqcRm
	 2hTmwuqSPEHqO9LT5G6bbCKKJVixQIQd+2rephmmTvsZXJokl1bIy6nSFv75ODy1Mp
	 gMrs9tbcm2WRe2e5tI7F0ped9GCj1PxSEaGbJN+PU9/UI9UrcKPDhGt+928fONZuLf
	 A+bX2wFpEf7Dm1bTv01iVW685qctvFwn00OIrHe6nPpLQeV8HMbc4ovZlNNgg/3b6R
	 zUJpUi2FU66L8L5rDQSpVLkqqPTLrG+wUU5FF+xGQl+7mCJ8m3yQPCuEksYTALFdZL
	 P3Hxm0F8QdNCA==
Date: Tue, 3 Nov 2026 12:10:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Vinod Koul <vkoul@kernel.org>, Shan-Chun Hung <schung@nuvoton.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	linux-phy@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jacky Huang <ychuang3@nuvoton.com>, Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH] phy: nuvoton: fix USB PHY clock reference leak
Message-ID: <20261103-tall-elite-otter-d99ba5@quoll>
References: <20261103104242.1373863-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103104242.1373863-1-vulab@iscas.ac.cn>
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
> ma35_usb_phy_probe() acquires the PHY clock with of_clk_get(), which
> takes a reference that must be released with clk_put().  The probe
> error paths after that call return without releasing the reference,
> and the driver has neither a .remove callback nor a devres-managed
> clock, so the reference is also leaked when the device is unbound.
> 
> Acquire the clock with devm_clk_get() so that it is released
> automatically on probe failure and on device removal.
> 
> Fixes: b48baf69db97 ("phy: nuvoton: add new driver for the Nuvoton MA35 SoC USB 2.0 PHY")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/phy/nuvoton/phy-ma35d1-usb2.c | 2 +-
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





