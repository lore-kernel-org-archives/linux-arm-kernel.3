Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD13606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 09:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=amPvudPo;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jE8oY2mN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=l7Os9ez/f2nG03fyXsvnvcHKNao5k86xMqMGxwTc8as=; b=amPvudPoK4n1he
	YniUms9BiLlhHVCK068yPa8xxEabqh8aKQ1bhB+axLUrrcT+Lz+hqj1T/NVGUel5IjRnvcEp8doRC
	lqozUvJym4pRhHEdHO9sp8AglF8lZD8AUCPO0EqO8S+6dqhnE4y5myxqLLUnnx1div8d1+9IkbEef
	zDXiw4bkZNzj1a1EjH6qussUFZl5J1rzvc/TxUka+tfDEp8+LeHVytqIe3e8j7+W/2+6cnUorvogb
	sFG9sw5TWMdlyarVTsPDZS6CFmc8LM8S8763yIdwF1ZYC+ShJERfRk8Wz22GHMbcBpJUrQ4xvMDkh
	rbOScDdtpZhUq2cOCFdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOu4Q-00000008MEt-0yWE;
	Thu, 05 Nov 2026 09:47:46 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOu4K-00000008MDT-3LDA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 09:47:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 800111A0830;
	Thu,  5 Nov 2026 09:47:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4EAF55FF85;
	Thu,  5 Nov 2026 09:47:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F01C210329267;
	Thu,  5 Nov 2026 10:47:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793872057; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=l7Os9ez/f2nG03fyXsvnvcHKNao5k86xMqMGxwTc8as=;
	b=jE8oY2mN4nKEq03VZBxogYPKnuGNkPH/G7LfkQJVWaRMDIJxjesNGFQOdQHVg0pE4ypf1+
	u1AD0n00GJIz9nUMGD+FetwWYZyAB6lmvfIsK50lOD46qW+7mgNjLUX6xNQ2xUpMY2af3E
	6T5JyRoqJdOb4E82aF1mkem4MqTYz65XxKRVKDvAsNC2WbPPbmOXunFMQae/3g/XoXCxV+
	Vyj4CG+zzOXYY1o2r2PWrkOTMts1n9NdM2LIyDOXcGpnIiWvYWmfqNOLRzD9pGT4n+U+CG
	w6BeDO4XocWGJBZ3p3d2K/M62PKTod9FEAYDxCTJFg10ejcCTlGVgaCn/Uw3aA==
Message-ID: <b7102713-8bc6-4a5a-bf33-b79a646f4126@bootlin.com>
Date: Thu, 5 Nov 2026 10:47:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: keep est_lock across PTP clock
 adjustment
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261102-stmmac-ptp-est-lock-v1-1-76fbc0cb230d@oss.qualcomm.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261102-stmmac-ptp-est-lock-v1-1-76fbc0cb230d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_014743_091458_5CAF5EF8 
X-CRM114-Status: GOOD (  12.52  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/2/26 18:37, Lorenzo Bianconi wrote:
> stmmac_adjust_time() disables EST, drops est_lock to step the PTP clock,
> and then reacquires the lock to reprogram EST using a base time computed
> from the new clock value.
> 
> That leaves a window where a concurrent tc_taprio_configure() can program
> EST enabled with a base time derived from the pre-step clock.  The gate
> schedule then runs across the PTP step with a stale base time until
> stmmac_adjust_time() reprograms it.
> 
> Keep est_lock held for the whole disable/step/reprogram sequence so no
> other EST user can program the block while the clock is being stepped.
> 
> This does not introduce a new lock ordering: __stmmac_setup_est() already
> takes ptp_lock through gettimex64() while holding est_lock, and
> stmmac_adjust_systime() uses readl_poll_timeout_atomic(), so it does not
> sleep under ptp_lock.
> 
> Fixes: 23d96de472f7 ("net: stmmac: re-apply taprio offload in __stmmac_open() and stmmac_resume()")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

I couldn't really figure out why the lock was released in the first
place, LGTM :)

Do you plan on addressing the sashiko pre-existing stuff ? seems to be
rare conditions but still :( sorry you end up having to deal with these...

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


