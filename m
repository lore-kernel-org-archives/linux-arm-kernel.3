Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DF8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CU1Kg597;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kfegx7uj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zMyLVpl5SGn9LRVq3YemmUnIHNGskaGDXWx+m9anSm4=; b=CU1Kg597lUEfvukbWu7PmCSJdH
	HITwLDkGB0G27iaFcS9CK4h6SiI/bEhmWaXHrX0eBOrCMA0XnYAjGMZxgvvNN+MOjvuPOKko2FlVk
	dBRumII9Sz3uxAlPRsOq8pt/HS2ABAxSCb6B+Yrc8wZiB03PBdITNYQcSnkQso3n60ZG2hqwe8jpX
	IeK90sZGAak90dzHgO9YB/4NqrizU3Bvtkm9Bw2r5fxWvfb5fnm6nuSDcoilInbSpeIXH3818MOPM
	WqSLPtngb0fcsupAr8HzNaIQ71WfRBpUdeXZgJnas1whpUBI7Rr5NMY+Pa13Zm2wHYICPH4ziEn3U
	huYQG0yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3dx-0000000730n-3a4t;
	Wed, 28 Oct 2026 13:24:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3dw-0000000730N-1JNQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:24:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BF8D4432E2;
	Wed, 28 Oct 2026 13:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C641F01828;
	Wed, 28 Oct 2026 13:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793193879;
	bh=zMyLVpl5SGn9LRVq3YemmUnIHNGskaGDXWx+m9anSm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kfegx7ujlGk/2hjxiHA1Z+E7EMek3gRDyf0P7d57n0ymidZffq4rr3n644D7L2ioV
	 YCEclgT7D3hsJZMPAZAFLCqXa2LMGV/1UN9Q6wKApeFeTTdOnvoHNLxwa8/TH0GDbW
	 yy6vqqVxJGOX029sckv9QqIGbT2fkh08T3GleGZVgL1Nh5MJe9Dt2e0An1bDjJDHA8
	 4YY9xCP1jqrqcGml7YgPpSIrV4kr/7x5br8YkOmFc7DvRm6IIpu2MgkCD598kY75Fl
	 NDKZm50ZzVFa8oftaYRfgBEWvigM5Nn5Xa/iF1OR2l5I3uI8pabN4y+7U+32RbRvMA
	 Akd5Ea5WMoDRA==
Date: Wed, 28 Oct 2026 14:24:35 +0100
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
Subject: Re: [PATCH 0/9] google: Add support for Laguna CPM
Message-ID: <20261028-armored-glistening-cheetah-6f3070@quoll>
References: <20261026214359.3122870-1-briannorris@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261026214359.3122870-1-briannorris@chromium.org>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 02:43:38PM -0700, Brian Norris wrote:
> The Central Power Manager (CPM) is a co-processor on the Google Tensor
> SoCs, as used on Pixel phones. CPM supports power-management and a
> number of other features.
> 
> The Application Processor communicates with CPM over a pair of mailbox
> channels. CPM provides clock, power-domain, reset, and interrupt
> services.
> 
> This series adds device tree bindings, DTS, and drivers to support CPM,
> and several of the basic services provided by CPM. These services are a
> minimal set needed to bootstrap many other components on the SoC --
> e.g., I have a working proof-of-concept PCIe driver running on top of
> this series + pinctrl (not included here). CPM provides some other
> components not yet included in this series (e.g., PMIC, RTC).
> 
> This series depends on the bindings and mailbox-payload-definitions from
> this series:
> 
>   https://lore.kernel.org/all/20261023235408.3063350-1-dianders@chromium.org/
>   [PATCH v2 0/4] mailbox: Improve the mbox core then introduce the goog-mba driver
> 
> So this series cannot be applied as-is yet. However, v1 of that series
> was under review for about 3 months, so I'd like to at least:
> 
>   1) demonstrate its clients (this came up at
>      https://lore.kernel.org/all/CAD=FV=VW2h1zWDYWQ6LknX3O+3=EY665jde35Ly+UQzuscXy=Q@mail.gmail.com/,
>      for one); and
> 
>   2) start review for anything that isn't significantly impacted by
>      potential changes in the above mailbox series.
> 
> With luck, the general design and DT bindings don't need to change, but
> even if so, I expect any changes should not significantly affect:
> 
>  (a) the CPM DT binding or DTS (apart from #mbox-cells)
> 
>  (b) the CPM interface (cpm_request_client(), cpm_send_message())
> 
>  (c) any of the CPM clients (irqchip, reset, clk, pmdomain)
> 
> Thus, I think this falls somewhere between "PATCH" and "RFC".

Either you expect review or not. RFC means no. If that's patch, then at
the top level of cover letter, as the most important thing, you explain
the dependency and merging proposal of this. You combined here like 5
different subsystens...

Best regards,
Krzysztof


