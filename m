Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E920606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ux295sDs;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zp8PMlmm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S+BwsDySfman4KlBED+rbWuh/PEeFG4gD/brcjcRbmA=; b=ux295sDsVGjddBm0GNqVEXgSGy
	FXiLyRW5afFQTvGH3zyKUMEVqJzPjrzER7iAjYgh1k4bZWd6p3QYGnK2dQOMo4vqxzr+k9CGyIvkd
	/l0WYyE1tAIFiDhekei6w38BSLMwZznpEC2KphghoHQy64zxx296YSAXaWmFR96+JG3ovYozKqFkU
	h2DLKDhlqbQRhcvSVqz0ibHuo8wCQzHKa9X0B+DAihSDgLhiamvXIu4r8t7sgEg9ESRsgJSHCc1EY
	wXJCBTG3yTV91qDgjpfBObQxAT7KSNb2UTSMvuNRo+RYbiHBV/+XYraUwgtQSsSWW9UJAW9Qe4n5v
	j7IPASnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3QS-000000071Vr-0pF7;
	Wed, 28 Oct 2026 13:10:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3QR-000000071Vk-0Svk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:10:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BA77E43D1F;
	Wed, 28 Oct 2026 13:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB6B1F01825;
	Wed, 28 Oct 2026 13:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793193042;
	bh=S+BwsDySfman4KlBED+rbWuh/PEeFG4gD/brcjcRbmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zp8PMlmmp+uq2NrV/CIJxtvqhDBj/gd4PK5onF/ExI55zN7hdbIuINn/Y/Bx0SQTG
	 Pz3zRx1vjsGKw+kCvbTFuB9hwLQJ9ea+J5fitXzF5CoTeKky5T/qCnyLx3ZBS0WYBT
	 rrelRx43Xnt15tHSb1x/LvW0ymiAvWdcZyZF4m6PaMwfkkqvcREXo7cvnKSmmzQXZG
	 MvSFAD9MtUrvKq13ppO+VsCPE3zxuIAcco87RmHiuLJZt1lEwAZ5zQeMtyk91bjRyp
	 MbLlVj1eC81yXn8LBED5fX5P5voF+Em9MWxTirvz1wKftBuV1ZUgogLao7zUw8Gcc9
	 oynvvkCNg0qdw==
Date: Wed, 28 Oct 2026 14:10:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	devicetree@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	linux-arm-kernel@lists.infradead.org, Mariano Marciello <mmarciello@google.com>, 
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org, 
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 1/9] arm64: dts: google: Add Laguna CPM mailbox array
Message-ID: <20261028-handsome-beaver-of-gallantry-b1b3bf@quoll>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.1.Iaf8214205f496225013f482f6e0035e89ac624f2@changeid>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261026144346.1.Iaf8214205f496225013f482f6e0035e89ac624f2@changeid>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 02:43:39PM -0700, Brian Norris wrote:
> These are the request and response channels used for communicating with
> the Central Power Manager (CPM) found on the Google Tensor SoC known as
> Laguna.
> 
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> Based on WIP bindings from:
> 
>   https://lore.kernel.org/all/20261023165211.v2.3.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid/
>   [PATCH v2 3/4] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings
> 
> which is part of this series:
> 
>   https://lore.kernel.org/all/20261023235408.3063350-1-dianders@chromium.org/
>   [PATCH v2 0/4] mailbox: Improve the mbox core then introduce the goog-mba driver
> 
> The binding is still under review, but I include this anyway to help
> prove out a working solution. This patch should not be accepted until
> the binding is settled.

Regardless, DTS goes to the end of patchset (see submitting patches in
DT bindings dir).

Best regards,
Krzysztof


