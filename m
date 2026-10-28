Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65327606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D+UiSX9y;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kfIqenX2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vMqr/WjxL59z6An2wy+k/P9BR2xahkEslL3Eehl7UL8=; b=D+UiSX9y9wP9SnT/kZN+V9eJAz
	44XSangL9NW175B0mYY8hdZSdcIJFqWz1QBBOQvdlGRjbv1Fonu8xfgsdUm+GmCrcZQE1DSMgogP0
	rtZ5fpz5i9XXWNDkscH00/ryZuFx/kmqfwBPswRpeP6xiVgkJiA80xkKmkH3htcG80EXH63LTdqyW
	MDMd+Dz2hOSk4ZzmmC4e7hIft+LKhOPKD+ww6Mif98AcVSEkLHV9DeZO3GxxAiLmDiCDHz3RSpbSS
	NkNi7eAgrRa/eEeBoKcQ+vk/1ZUihC47GwJ8LPH65ZSF067oZjEcZMH4rgcmFRDgW/1HF3jrehBpz
	tznwCZTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3gN-000000073L8-1h63;
	Wed, 28 Oct 2026 13:27:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3gL-000000073Kv-2EBf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:27:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AEDF360239;
	Wed, 28 Oct 2026 13:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8BF01F01442;
	Wed, 28 Oct 2026 13:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793194028;
	bh=vMqr/WjxL59z6An2wy+k/P9BR2xahkEslL3Eehl7UL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kfIqenX2jebi6Y6d0XS41GtrBbatL7qSLdFVtoC/FGiRJ05BvyTM6EDe6XbdulFRZ
	 Ghg4UjZF9eSFAX/6GBn4L16vH080cVeCyRi/IiNnXzUKKm+vr7iaDC9pG+uI/aY0Vt
	 WHZnd+zZ3V7tpmdJFFwWDstRuCS8r4LTbCQ3o3gKxUyxWgO7E+ZSg4N7X/mA0poib4
	 XlxzLkEZpdG3FOU39lHwTnfgYsU+7w8FC3aXrAdnmggp053X3iVOAgZri4cbEJ3xn4
	 2u9W9R1ft+SswQiSCEw9ZbK8oHXM1kQb8A2dtN+XPWv39YyBFtfoxnC79wqY3wIIej
	 GZr0TE428Y/Lg==
Date: Wed, 28 Oct 2026 14:27:05 +0100
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
Subject: Re: [PATCH 3/9] soc: google: Add CPM over MailBox Array driver
Message-ID: <20261028-literate-pony-of-valor-3209fb@quoll>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.3.I7bc547c83b7bf677a62670099f481a91ac737073@changeid>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261026144346.3.I7bc547c83b7bf677a62670099f481a91ac737073@changeid>
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

On Mon, Oct 26, 2026 at 02:43:41PM -0700, Brian Norris wrote:
> The Central Power Manager (CPM) is a co-processor on the Google Tensor
> SoCs, as used on Pixel phones. CPM supports power-management and a
> number of other features.
> 
> The Application Processor communicates with CPM over a pair of mailbox
> channels (the "MailBox Array" (MBA)). CPM provides clock, power-domain,
> reset, interrupt services, and more.
> 
> It's difficult to support all of these services within a single driver,
> in part because it's a lot of code to manage, but also because there can
> be complex relationships between the individual services. For example,
> clocks may have dependencies on power-domains. Instead, the CPM driver
> only handles some basic initialization, and otherwise creates child
> auxiliary_bus devices to handle each service. It also provides an API
> wrapper around the mailbox protocol, so clients don't have to worry
> about some of the details. This API assumes all users are children of
> the CPM device.
> 
> Implementation note about the "session" handling: the mailbox API
> doesn't provide any timeouts or guarantees about a response message, but
> CPM clients would like an (optional) timeout. So there's a little bit of
> complexity around reference-counting a "session" (i.e., outstanding
> request still waiting on a response), as that session may outlive the
> client's timeout.
> 
> Quick note about hardware queueing: this is implemented in our mailbox
> driver by allowing clients to request the "same" channel multiple times.
> A client is expected to keep requesting the channel until it sees
> -EBUSY, meaning we've requested all of them. We then utilize those
> channels in a round-robin fashion.
> 
> Because it may be useful both for reviewers familiar with the downstream
> Linux support for these devices, or for future developers looking at
> adapting/improving/adding further features later on, it's worth noting
> some major deviations from the downstream drivers:
> 
>  * This driver doesn't contain much of the queueing complexity from the
>    downstream driver. The mailbox driver was significantly rewritten
>    beneath us, to support most of the queueing there, and thus exposes a
>    simpler API to us.
> 
>  * No session pool; we just allocate sessions on-demand, enough to
>    handle timeouts while a response is still pending.
> 
>  * Use auxiliary_bus, with CPM services represented as child devices on
>    this bus. Downstream services tended to be a bunch of artificial
>    platform devices, with fake-mailbox phandles to the CPM "interface"
>    node. This is an atypical device tree structure, and most of those
>    platform devices came from device nodes that were less for describing
>    the hardware, and more for describing how we wanted software to look.
>    So far, I haven't found services that don't work as child auxiliary
>    devices. If we later have examples that need some combination of both
>    iomem resources and CPM resources (and so may need to live on the
>    platform bus), I'm sure we can add support for non-child (e.g.,
>    phandle) interface methods.
> 
>  * Add devm_* client helpers, to make it easier for clients to clean up
>    properly. (Hint: most downstream clients did not clean up properly.)
> 
>  * Reduce the surface area of exposed (EXPORTed, or header definitions)
>    protocol details, such as goog_mba_q_*() methods. Many such details
>    aren't used outside the CPM driver, so it's probably best to keep
>    them local until proven otherwise.
> 
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> Based on a WIP mailbox API from:
> 
>   https://lore.kernel.org/all/20261023165211.v2.4.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid/
>   [PATCH v2 4/4] mailbox: goog-mba: Introduce the goog-mba mailbox driver
> 
> which is part of this series:
> 
>   https://lore.kernel.org/all/20261023235408.3063350-1-dianders@chromium.org/
>   [PATCH v2 0/4] mailbox: Improve the mbox core then introduce the goog-mba driver
> 
> That API consists of:
> 
>  1) a header (<linux/mailbox/goog-mba-message.h>), which so far seems
>     typical and uncontroversial and
> 
>  2) a strategy for supporting hardware queueing -- where the current
>     proposal is described in the commit message. I suppose this strategy
>     could still change, although it was discussed at length in v1 of
>     that series.
> 
> Anyway, this patch should not be accepted until the above series is
> settled.
> 
>  drivers/soc/Kconfig                       |   1 +
>  drivers/soc/Makefile                      |   1 +
>  drivers/soc/google/Kconfig                |  13 +
>  drivers/soc/google/Makefile               |   3 +
>  drivers/soc/google/google-cpm-mba-trace.h | 214 +++++
>  drivers/soc/google/google-cpm-mba.c       | 964 ++++++++++++++++++++++
>  drivers/soc/google/google-cpm-mba.h       |  30 +
>  include/soc/google/goog_cpm_service_ids.h |  84 ++

Keep naming consistent. You use everywhere hyphens, so here as well.

>  include/soc/google/google-cpm-mba.h       | 147 ++++


>  9 files changed, 1457 insertions(+)
>  create mode 100644 drivers/soc/google/Kconfig
>  create mode 100644 drivers/soc/google/Makefile
>  create mode 100644 drivers/soc/google/google-cpm-mba-trace.h
>  create mode 100644 drivers/soc/google/google-cpm-mba.c
>  create mode 100644 drivers/soc/google/google-cpm-mba.h
>  create mode 100644 include/soc/google/goog_cpm_service_ids.h
>  create mode 100644 include/soc/google/google-cpm-mba.h
> 
> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> index 483cbdcae153..fbe6460424c7 100644
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@ -10,6 +10,7 @@ source "drivers/soc/canaan/Kconfig"
>  source "drivers/soc/cirrus/Kconfig"
>  source "drivers/soc/fsl/Kconfig"
>  source "drivers/soc/fujitsu/Kconfig"
> +source "drivers/soc/google/Kconfig"
>  source "drivers/soc/hisilicon/Kconfig"
>  source "drivers/soc/imx/Kconfig"
>  source "drivers/soc/ixp4xx/Kconfig"
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index 5a3efd68355c..6241e543dad7 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_MACH_DOVE)		+= dove/
>  obj-y				+= fsl/
>  obj-y				+= fujitsu/
>  obj-$(CONFIG_ARCH_GEMINI)	+= gemini/
> +obj-y				+= google/
>  obj-y				+= hisilicon/
>  obj-y				+= imx/
>  obj-y				+= ixp4xx/
> diff --git a/drivers/soc/google/Kconfig b/drivers/soc/google/Kconfig
> new file mode 100644
> index 000000000000..9cd04be63b23
> --- /dev/null
> +++ b/drivers/soc/google/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config GOOGLE_CPM_MBA
> +	tristate "Google Tensor CPM MailBox Array Interface"
> +	depends on ARCH_GOOGLE || COMPILE_TEST
> +	depends on MAILBOX

Can it be compile tested without mailbox?

Best regards,
Krzysztof


