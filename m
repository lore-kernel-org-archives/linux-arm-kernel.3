Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F1FCA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 11:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bIwlnh3o3VzDgRWofa7XQnvql/25Gc5+ERgT+jvkbA=; b=kKfzy3qlt9KKHUDoxIkgZ/espJ
	l3ACdZ8sOmdr5ProrSBXHgFAhUs6MMPatahcreG0YB1rujZmht4HQdg2mqIoyggao3XDS6ItUfSVU
	/htt6FzdJWTE2vW3ary/mHpGSycvoHYjntCCMgn0NcO9I0cgP218adcHxCNEpgeQ9hR8OcmhxC7f4
	JoAnpQSPfVF1UXcRbH5F3lidOwkQZ3GD6e+lrJgknaoGNvAnFKXwPbMPwuxShinn3j5G3GL+TAPsA
	CVeZ5WsToINVfO4FiK47G+HOV4ht9jfO7Lpmee/8Sc4bo0qGinC0FZl93RCUC8k8gYdpVYgLTWll1
	2bMEUIYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvDuP-0000000AvUl-3ZsD;
	Sun, 07 Sep 2025 11:50:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvDp5-0000000Atq8-2LRx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 11:44:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D1638601F6;
	Sun,  7 Sep 2025 11:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A260C4CEF0;
	Sun,  7 Sep 2025 11:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757245481;
	bh=McQxKcQ3IgA09DQIhZhbUBr9hl4vWs7RU541oD5jjDY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=D+96NWKbhuU0P1mzI9gATdG0diAEJ2UX2AESQDRxNBft4tKXn1MtAIJYmXU+w1Roy
	 A1fGsYgsvancq1wpB7z9YJVTK0GwZR+mWoqh/GUMzVhRDUUGPMc69Vwiv2+QeEtZ0a
	 AHw/kIw1qeQBfK3Mb9SuFm1fFPz6ZEsBtOwRHFaORMpoxBJc71V4WbO5s1wUZi9lsT
	 yqlwd8RALYwf+Md02si0js2n+GgeOMbHKhms+UNsSHdWsBHYyGRrN0EI4xdhDTo2G+
	 d+FU6DFShwptnOL2/IgdZIKFEPxkFDYBes1F7vw1DSbJZ8Pgzx/ZIsNwXhWc8rzRvK
	 IYZ9007bVbbIg==
Date: Sun, 7 Sep 2025 12:44:29 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Primoz Fiser <primoz.fiser@norik.com>, Peter Rosin <peda@axentia.se>,
 David Lechner <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 upstream@lists.phytec.de
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: afe: current-sense-amplifier:
 Add io-channel-cells
Message-ID: <20250907124429.573edbc8@jic23-huawei>
In-Reply-To: <20250905-dainty-liberal-monkey-ec28bb@kuoka>
References: <20250905065503.3022107-1-primoz.fiser@norik.com>
	<20250905-dainty-liberal-monkey-ec28bb@kuoka>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 5 Sep 2025 10:20:37 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Fri, Sep 05, 2025 at 08:55:02AM +0200, Primoz Fiser wrote:
> > The current-sense-amplifier is an IIO provider thus can be referenced by
> > IIO consumers (via "io-channels" property in consumer device node). Such
> > provider is required to describe number of cells used in phandle lookup
> > with "io-channel-cells" property.
> > 
> > Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> > ---
> > Changes in v2:
> > - refactor commit msg drop warnings introduced by commit #2
> > - drop Fixes: tag  
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Applied this patch to the togreg branch of iio.git.
I'll push that out as testing now because some other stuff on there
will benefit from 0-day taking a first look at it.

Thanks,

Jonathan

> 
> Best regards,
> Krzysztof
> 


