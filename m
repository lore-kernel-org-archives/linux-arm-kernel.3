Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9DB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 20:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jcHuWmXr;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pMkKdZes
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LTRlnK1nXG1mmQO++Uq1vusm9ibIA0GFtmdvXpx6u5o=; b=jcHuWmXr14QcWVt94s9IBy/8Ir
	H7W2Xm3bUH3+xt6U3cwSBDUZM2R7VNx5joz/op0TyVBAyiS4FUXA9tvA8CYT+PpDjBEyRc5vKAk6U
	+wCuD9n0vn88fByNPmd6yp4lAzykPYzJRp8JZfiq28VJCHK7echx97DJPLkWFbXORfodbYKgmxHZ9
	YRqAnIOBCHVsV1B5Rf6q3SOju4GUUB+v4U3nOCn3c780H8+CJ/BJlEao8YGmpCzKqmCuiMXdn+foz
	zjrnntZnUCCimGJfJpIjGAeMNPMKX6lA0M06ejtuvjvu/MpKsUVvavX69qWptJNKp7HsKReoRwd8B
	uER1TV0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xItim-00000008IAc-3NPd;
	Mon, 19 Oct 2026 20:12:36 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xItij-00000008IA3-2wRk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 20:12:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 67D391A124D;
	Mon, 19 Oct 2026 20:12:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A33D60582;
	Mon, 19 Oct 2026 20:12:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1DE9B10328C22;
	Mon, 19 Oct 2026 22:12:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792440747; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=LTRlnK1nXG1mmQO++Uq1vusm9ibIA0GFtmdvXpx6u5o=;
	b=pMkKdZesfYONkSLVd9w2zfn0x1bHOEpUnypkBOSqlSy0pjCpzKYspdAir5JIiYpA40Tyfr
	EjcgZ0DJVHZHo05EHCXI/BO1+GZvL/FP5Dqyjdhi6X2XJxY/4ZTOjmVU5TMe8AS2ZLgQw7
	uQ2gOhWb/KlcpBNkqlaTZlqGKb43xH4c2jA1eNPntVW1/alFEj4xd6w8iPGXsoUYJZ3/Ca
	iNkR4NZonej30f4Ulf7DfznKNCnGACq64TIyDyKomVVDWuTq8KNvGO4Tb2y4X4BWVo/pPF
	UblefzjSbKKriP8AWBpFPn1TeEjVoYrr+i5HxyGlyEOuOuEegW9c7eboWvvqHg==
Date: Mon, 19 Oct 2026 22:12:24 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH] rtc: sun6i: fix error handling in sun6i_rtc_clk_init()
Message-ID: <179244056613.104236.10835769446499654446.b4-ty@b4>
References: <20261014193220.38055-1-pmazzini@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014193220.38055-1-pmazzini@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_131233_902022_14747926 
X-CRM114-Status: UNSURE (   6.41  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 14 Oct 2026 20:32:20 +0100, Pablo Mazzini wrote:
> Set sun6i_rtc only once all clocks are registered, and unwind fully on
> error.

Applied, thanks!

[1/1] rtc: sun6i: fix error handling in sun6i_rtc_clk_init()
      https://git.kernel.org/abelloni/c/2d6f97296143

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

