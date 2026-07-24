Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBDAC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 06:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFt6up+caZWFJ0oLSrURO3q5OjP8+JoeVblpcy/X/9s=; b=CFDgSpQxA9L4sxV9ATDIJ/HmkQ
	asNg8sb3usVlm0TYrh6Ob30g/4Gw9ih97hnTfzcBlK1ZTUUAmpqJ6rFiKoAO2bAY9GnCQKj1ir31N
	6Cg4Oyn3P8OEpPyht+uTSXHUXOKgIEu8NJN8phMWwiAogTuZ8qijnhOgJr5XgI/HyzbNNShY8d8v3
	TfMfFp6RfsH+tzO88A6ouU3TQX/6q54VGPGP719WThLSYZ3hiP9reCVLrMd+BUX8OHnvjRSu87bF4
	XcdYDk7KHWnaWXOdKk1lN57V36Q5GLI8HSYnHflbplICuZupTZxi7hnroxDjEfn7kHKhqy+HD402x
	8yS9X9pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9cS-0000000Fd0j-0w8d;
	Fri, 24 Jul 2026 06:42:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9cR-0000000Fd0M-0ZfX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 06:42:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C7A22435E7;
	Fri, 24 Jul 2026 06:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69D71F000E9;
	Fri, 24 Jul 2026 06:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784875370;
	bh=fFt6up+caZWFJ0oLSrURO3q5OjP8+JoeVblpcy/X/9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ptvpp3F2ELMeiE8KIDalhiQLpKaaYaqtRlUXic453BmD8AtHcUWRcJkONCnFOTLoz
	 WhTIWoYUmJfMFviPqEscyGs0Ive5Yd36D018sOch4Ydxpo0pI5t+33iuqHr2jfAn4F
	 Zs9YhD/RjrfxMPfMfsa4iZVS3yIuRiMmK7tAxvsyExztENkfqljh7OoQlHuBq5FeQc
	 S+ElRYag6dDLf9mH3IQ5djrWJ8/XV6IPSB041Dd97Oor6XUvCe2k9qjVLqjN05cuKx
	 EGQquEM5mKzq2tQg/Xk8Xxwd4UUCkNE7CcEpNFfHWm0tilJFahkvqq+vXs9DYfEwxB
	 OmRjjcMIPhMJg==
Date: Fri, 24 Jul 2026 08:42:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Douglas Anderson <dianders@chromium.org>, 
	Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Subject: Re: [PATCH v2 1/5] dt-bindings: arm: google: Add dt bindings for
 frankel/blazer/mustang
Message-ID: <20260724-abiding-resilient-elk-1fc92e@quoll>
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-1-3abae9717feb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260722-contrib-pg-pixel10-initial-dts-v2-1-3abae9717feb@linaro.org>
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

On Wed, Jul 22, 2026 at 10:55:52AM +0100, Peter Griffin wrote:
> Add binding documentation for Tensor G5 SoC (Laguna) which is referred
> to in code as "lga" and three of the boards that use the Laguna SoC
> Frankel (Pixel 10), Blazer (Pixel 10 Pro) and Mustang (Pixel 10 Pro XL).
> 
> Additionally update to use a more efficient and scalable way to express
> the various names a SoC is known by.
> 
> Co-developed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


