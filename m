Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77242606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gt5XUUS8;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mHORANrj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dguWzmy1fO5cn8/7TwM3KTtc8nZLyA6X3w9/d84TI+Y=; b=gt5XUUS8JvLNYDFqWZ6gJY3E8p
	IincRuXsg5DPPv26ATENnh95Zx3gBQRzIBQTmiwHn9+a/ul50rUVc0ULB1W04nWdSmIEgf3TfaUlD
	lrZGbcCsoWN2Js6glHPhh/660d+cC9WcRFxj9Rq7grygvlu9SwCbcKwGAlpUPu2wMGrMKvQz3Qd+H
	HTbZuEysnaVl5t9TsH31HSoIHbbrOVdHKd65NaL7JJBrdRoi6ttzvn5Y1GYgdRH2T7xdXzt9zJ+Hp
	mUJLeY+kmiAJE1iWg7zAh6JVYBibdQS/q+fW+Swamc2FzvcwbM3DFVcNVXGv4URERuDB0FgBJHjqo
	4qckj8Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3hM-000000073Vf-2LK0;
	Wed, 28 Oct 2026 13:28:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3hL-000000073VM-28h8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:28:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D014C42B8F;
	Wed, 28 Oct 2026 13:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354491F01825;
	Wed, 28 Oct 2026 13:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793194090;
	bh=dguWzmy1fO5cn8/7TwM3KTtc8nZLyA6X3w9/d84TI+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mHORANrjbDbgzpk5akf0G4hAmrJFvXsLUUDs7fAxZlDnxCnDiFHdUNJm82eFJAHo1
	 Nw6Zu2aFCAwkk+0HkvREErBtwfypdH/QixmtcMTnCvgwH8BQrb/ZEdBxTcsa27GyyG
	 V8P7agLj2myIr2RlEeX51t+5a5v83n1ziPMCqYttLLYHUQRDJumAWOxepXcymILN+c
	 sbyU6hl6TGXWAMs5aJ/P5Q3KbaVaEHZF93B4Fr9NFzwlnk0xWOi8Ii16DoDVt02GWj
	 IdrfBsl8pVA6M0Vs08ES3cuoB3PgHPRNUippa/0gSuvXyiRvB9oX5pzhvx+xzFGPSQ
	 RBBUW5dsLKcYA==
Date: Wed, 28 Oct 2026 14:28:08 +0100
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
Subject: Re: [PATCH 8/9] arm64: dts: google: Add Laguna CPM node
Message-ID: <20261028-handsome-chubby-toucanet-0e7cc0@quoll>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.8.I4778aeffbdc796147efa8114431efcb201063b59@changeid>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261026144346.8.I4778aeffbdc796147efa8114431efcb201063b59@changeid>
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

On Mon, Oct 26, 2026 at 02:43:46PM -0700, Brian Norris wrote:
> The Central Power Manager (CPM) is a co-processor on the Google Tensor
> SoCs, as used on Pixel phones. CPM supports power-management and a
> number of other features.
> 
> The Application Processor communicates with CPM over a pair of mailbox
> channels. CPM provides clock, power-domain, reset, and interrupt
> services, so we include the appropriate cell-definitions for those.
> 
> Because this also adds clock, reset, and power-domain support, we add
> them to the UART node at the same time.
> 
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> 
>  arch/arm64/boot/dts/google/lga.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/google/lga.dtsi b/arch/arm64/boot/dts/google/lga.dtsi
> index 6ceb9ea6a100..83b2361c5f00 100644
> --- a/arch/arm64/boot/dts/google/lga.dtsi
> +++ b/arch/arm64/boot/dts/google/lga.dtsi
> @@ -7,8 +7,13 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/clock/google,lga-cpm.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq-cpm-google.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/power/google,lga-cpm.h>
> +#include <dt-bindings/reset/google,lga-cpm-reset.h>
> +#include <dt-bindings/soc/google,lga-lpcm.h>
>  
>  / {
>  	#address-cells = <2>;
> @@ -356,6 +361,16 @@ abl@be000000 {
>  		};
>  	};
>  
> +	cpm: cpm {

Name should be rather: power-controller

Best regards,
Krzysztof


