Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337C9C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QlSkWvEH4s2aPafAZOQMVUAmuixXCZYC19yQjm2B/E=; b=X9AfuX5uljtdX1RNt1AbyupIdA
	3vsyjnftkkaZGFiD5FU9EEdepRncx9v/Dsb0uOhYGRIm8kATdZeGsKylx7vQD2+p1gUzSGe8saKNm
	m3SflP2amh7x6GSQh4FtxUBjlvcszqdm/Rr8+9xcQv44x9ttaqLSszKsC5y8neIUtj6sECPOMVdtQ
	cwVcFIC9RjMTA8E0t2aUhDOtdKQAJnCeGeXdg94xqOPRW6sSfFyeI2ixyD1xTqF73fx4RA5sS0txH
	+PEwEHdMgHs8vzdbOA8QJddwg71XJ1/dZv6VpZCTfeQOnWBmAysXKaBppqwpEinujR4RXXx6y9vDh
	Wx29OcGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sV2-00000008gOX-0LvV;
	Tue, 08 Sep 2026 09:52:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sV0-00000008gOM-29B6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:52:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ECD53601DB;
	Tue,  8 Sep 2026 09:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B03081F00A3A;
	Tue,  8 Sep 2026 09:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788861137;
	bh=+QlSkWvEH4s2aPafAZOQMVUAmuixXCZYC19yQjm2B/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ibhnAOJYbyef/eHNh1zFQt/ZezvBye8M7n4ePOS91pVGVqhwjVHosdajB/CgXQMmi
	 FqL3eV3XrWYXUhW4s7noJyH/V398p5YqCRBex130Rt+36KYGMLbCPxyCg/B/9vEc0M
	 BLz3VJLpTlAw1jO1QjfbUo0hxIEXvDFk2Q6aazNtL2/TUrcbq2OrTSHyzqtAjPQKje
	 Qc/N6nGMsl9EwEvUdRIsFnpba5MGbcxm0s4yBjAO2cFcv4javn19iUhLh8f/bQiu/z
	 8GVU+pDj8PY2HVA+ZIlZwmQ5PQsCedVuKJG8z6C1/VYEpY6Ks+DF9JddIEu8FI0LMy
	 47HBPrhhpkmVg==
Date: Tue, 8 Sep 2026 11:52:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Long Zhao <longzhao@ambarella.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, Lee Jones <lee@kernel.org>, 
	mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 03/13] dt-bindings: clock: add Ambarella CV75 RCT
Message-ID: <20260908-snobbish-honest-ladybug-3bdaea@quoll>
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
 <20260904-cv75-v5-v6-3-e918514cb3b1@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260904-cv75-v5-v6-3-e918514cb3b1@ambarella.com>
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

On Fri, Sep 04, 2026 at 02:38:10PM +0800, Long Zhao wrote:
> Document the CV75 RCT clock controller and the clock ID header used by
> DT consumers.
> 
> Document #reset-cells for the RCT reset-provider role. Soft-reset line
> IDs and the reset provider driver are deferred; this series has no
> resets= consumers.
> 
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---
>  .../bindings/clock/ambarella,cv75-rct.yaml         | 64 ++++++++++++++++++++++
>  include/dt-bindings/clock/ambarella,cv75-rct.h     | 15 +++++
>  2 files changed, 79 insertions(+)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


