Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79475C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4NWzhzA7OYXJTSRs9Gx7Qnhw4JJuKAPdTa9sXEPjrQ=; b=43TL7x2hBFgPGXS62MSOq3mo6L
	QZG/+GTkUZRx68QD/uY7V5JNntbAu28CaS6PDOi/y33Q00AKPjmgGHz2UMDkGRiP0WkFft3dzOe/6
	8wLqIDjSuk0InX0IBtedXc6kUPQNIv/fG2HlXvSXCx4psr8xn3lkAYLnjia/w0g8Y19CYE4UWgzbQ
	kZz38RoHnKXbZsF4Td98XOoKMKeN/oZZDnfFS8MCaFjWxjtl8h/EoLMGIyRy7Mrrol6es0p+Rr+CC
	j7sKhiNyDFSOFjbikvX9/i6r19e2Yxin1HQvaNFT5CaBA16Wq0sFVq4WsbqCrHTcsGD6Qi/uk+FeE
	qmACSx0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sVj-00000008gXg-1Yxe;
	Tue, 08 Sep 2026 09:53:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sVi-00000008gXK-1PcJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:53:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C390560A93;
	Tue,  8 Sep 2026 09:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81E3B1F00A3D;
	Tue,  8 Sep 2026 09:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788861181;
	bh=I4NWzhzA7OYXJTSRs9Gx7Qnhw4JJuKAPdTa9sXEPjrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E4/PTSKnkR9pRHQxo3AaT4hnDfG2Z292EkA/WD2oLwSltUZkq5w7RfEjQehXuhRtA
	 yM1rYs0U4qmUuOufB8w9yW9tEX6IYZP2JBr/7/4D26/A+vuRhLwlznRj+QpdT/ZsST
	 ej9NMM90L/cfx4RfVLRTikG49quK/Ejg2PluFRRPPjyqiEHPOcAQMFrndji+YArKHO
	 yZz6AF2gbRXOZJRncDIoi75RkBw85agB2li3Ez16dhT3hV8BmKbXsJYf5/YqPhF+zS
	 Gu67nDIdj+Dr1+8JqcErycsql+YWHd1Fll9gS88ZFioJ8f2oZMHe4bXkME/oXRXIRX
	 gSqR4HWTjjlsQ==
Date: Tue, 8 Sep 2026 11:52:57 +0200
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
Subject: Re: [PATCH v6 02/13] dt-bindings: mfd: syscon: add Ambarella CV75
 secure scratchpad
Message-ID: <20260908-magic-ecstatic-lemming-b1db9e@quoll>
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
 <20260904-cv75-v5-v6-2-e918514cb3b1@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260904-cv75-v5-v6-2-e918514cb3b1@ambarella.com>
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

On Fri, Sep 04, 2026 at 02:38:09PM +0800, Long Zhao wrote:
> Allow ambarella,cv75-sec-scratchpad as a syscon for the shared secure
> scratchpad registers on CV75.
> 
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


