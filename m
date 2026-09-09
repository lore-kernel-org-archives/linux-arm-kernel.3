Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DA9C79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 07:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALD2G3jLNVJJ5O+pX/xMU4AjzIvGRp3/WG0X3qz69kw=; b=FwW/v0xeVH7p2QVnfp3Nr+yD6I
	frbXBr6kaFjhq71J1HUakC9S11lXbg7zxEmY9vzCP1QoYJBWkf9FyMKty3cEm+luWQ/FWnIi6uxOX
	rI/fPNqxT2DO6tIwS45QSh9cIAxAdx0vFqY552B4VO5HkP5MSJQKVnJLbybZZdrMr70tm46Da9pkB
	Q3sz9eWrn9gl1A6F5KZrCcR9zwjgDq4WqKZY5hol3s1FrQtRCk+hEpkJSzTITOx9mB4/AH1Hw1zMA
	5I8xa7O8Yx220cTZ9TRYIPyRXdAFT5G4my4r/xCJc5sgkc8fFrqkbVug6H4E0k+r7hKtRL5I2VsGa
	K+iZqHnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4CUJ-0000000Ax1Y-2GOd;
	Wed, 09 Sep 2026 07:12:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4CUI-0000000Ax1S-3OGn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 07:12:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D975D601FD;
	Wed,  9 Sep 2026 07:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9514E1F00A3A;
	Wed,  9 Sep 2026 07:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788937973;
	bh=ALD2G3jLNVJJ5O+pX/xMU4AjzIvGRp3/WG0X3qz69kw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hNfoo70wmZQoE4YWfUsqb7MPecMxoYTzIiGaRpy49sL4YXsjzvGy5U+/LLh3btFAm
	 5iLumNWGlfevlvTpsSZNpVNRnJD2ul2afOaGCbP9Xr60IKjfRMR+SBCKXWQ3yc5EtL
	 eHlx213LUo6gclqX72JlA4g1t9ufkrR05v/9Q5VCVnFjJV3mfT73ycmJagTHRYIGMG
	 SQPxitTeSO7p9HMog77P4LY7TBhA25OZPip8+ck/j5wftgZamKqHiMkR991WXvIvUp
	 hlwhYZwaCoi+o2c1yFHrl9Rw4/FlUk1gfHn5BwAa+pYjhaBd9ZLw8D0VN4ovdi6Yji
	 rUg293B5gJwRw==
Date: Wed, 9 Sep 2026 09:12:50 +0200
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
Subject: Re: [PATCH v6 06/13] dt-bindings: serial: snps-dw-apb-uart: add
 ambarella,cv75-uart
Message-ID: <20260909-objective-zircon-cat-e0ce6f@quoll>
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
 <20260904-cv75-v5-v6-6-e918514cb3b1@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260904-cv75-v5-v6-6-e918514cb3b1@ambarella.com>
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

On Fri, Sep 04, 2026 at 02:38:13PM +0800, Long Zhao wrote:
> Add the Ambarella CV75 compatible string to the Synopsys DW APB UART
> binding. The block is Ambarella IP with a DW-like register map, so it
> is described as a DW APB UART variant.
> 
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---
>  Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


