Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FDBD2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 07:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3FdCWbpHGnOa9d474ekESwths/fgerczsQGnYoqyesM=; b=Nkq3GWzzQ0QTrGf7REga+6fdYL
	5ZLcNRjPTZg6rdnbBXIw+GbWOd9d6Mdy+AdqXb3QbUTKo6yRU+OkFIJGiQIt3Qi82yxLqn0Nh1VM/
	FeRXa9wLwNhgmaySDpRkYFFnCEPVk3zuQ+cbX2VRGEjH8QHuDlbikMQLW4PwMNtVeA+NuyDeFm3Qr
	adflFz8BMp8vyeXN5K1HaxcCMPVA0Fyb4xE2Q3L1VRFXihIGjtBpOVHSg8RzQp1pyXwBRPx9pr9Ut
	N93fsikKWtopgvZHqWG04kcQUMo8/TIii6euTfFNk0Rj56uau4OtrqfrT4P6jC+4Hu6s4cNMGcz7O
	kyQc1/tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6PM-00000003MqC-2yZt;
	Tue, 20 Jan 2026 07:44:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6PK-00000003Mpq-0b8M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 07:44:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F91D41E54;
	Tue, 20 Jan 2026 07:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2DEC16AAE;
	Tue, 20 Jan 2026 07:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768895048;
	bh=3FdCWbpHGnOa9d474ekESwths/fgerczsQGnYoqyesM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SOsmDkXg1+q2jVa149rD1QxMzFPXxJDhlycxyjlDGzlIVg09opT36ZhK1orSZKcWw
	 6BtsROT/oPv/jHQgMVyMB62TCnt2eBjSSnfJpFTABS7gae4NHIoCJar1+IWfiC2B34
	 vq91xwppDmuRJ6wbVrzlhjQ2rhEpWrnppTCEUgttKsE0caI5bEnzboqvK+S7KwIUkG
	 Ry8uMV1zAdLLiBmS79Qro1GMoXe23no/tgRs1orn1Y0oxjcXHwPcJ/cV4FbnXMjJ5O
	 9Cd3iYYWxWRRejl2C2ihDNZLPyx8v40SqCgCtwVKwWL4/vQWwLTIg1XDpv7A1sZHsi
	 kJ4pQbKlJRoGA==
Date: Tue, 20 Jan 2026 08:44:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RESEND v2 1/3] dt-bindings: clock: imx6q[ul]-clock: add
 optional clock enet[1]_ref_pad
Message-ID: <20260120-enlightened-tungsten-orca-d4613a@quoll>
References: <20260119-ccm_dts-v2-0-efcf9155941a@nxp.com>
 <20260119-ccm_dts-v2-1-efcf9155941a@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260119-ccm_dts-v2-1-efcf9155941a@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_234410_215211_735AF1CE 
X-CRM114-Status: UNSURE (   7.04  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Jan 19, 2026 at 02:22:56PM -0500, Frank Li wrote:
> Add optional clock source enet_ref_pad for imx6q, enet1_ref_pad for imx6ul,
> which input from ENET ref pad.

This commit is doing much more - making anaclk2 also optional - without
any reason/explanation.


Best regards,
Krzysztof


