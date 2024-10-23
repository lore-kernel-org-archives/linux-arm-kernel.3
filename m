Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEC0D2E02B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 09:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZl4s9/BZmeATuDzrC9c3oZL49XXrowUu0gydA1hIDs=; b=rOZTeizc0ne/b3FiuDzHLoslPJ
	ER6tGNcDVfbOqRkquEUPW9HJVqdBDEls3Uoitkw+RattIijSM9aYp/CyrSmrqFPXvum2KpVTIl+NZ
	toNzEcndqijxw/u3AdOacjsaeEm23wXh1OFhwx9k1KaCfsuqtVorqvsF/7Gnk7k9YUSyN8FdG39qu
	z8CQXJ4bJhA1h4vQ8jy7yDMF7b1jZvb29XSkynj+gZ+c2a3MAJaMgCSKv9ZEMQF8IJNs0A11nmEV9
	V7OYN19uPqJnbtP0livsr4dfLV1eCeGDJsizx/dGlAtjaWOsUzly/6pJxHn7F7pEHh8VtC8/CYY3r
	zbe7qgJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XK1-0000000Dhyd-1gmP;
	Wed, 23 Oct 2024 09:06:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3X6J-0000000Ddxp-0lr2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 08:52:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA6505C5EE9;
	Wed, 23 Oct 2024 08:52:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FEAAC4CEC6;
	Wed, 23 Oct 2024 08:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729673538;
	bh=QgZQZAHGGjtLGHw0LYRXygNDG1h6h/5BqjGMqhJ4MY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ul/d/0kA8oYv0b0iR4ZobZJUIPwE8UkhlbBGQJZgtI5x/3Y2GVY4TOTDqhLRqoXP5
	 VQMkLXSrvdG5GJAOOa2ODisyt02vLuAXBd4Cl4zsQuqQQlqBXkYJMj+3Gp3U3uACYf
	 lNpmbTDdHATEgy6R1SffQh9ltcr2S4A+OwNO0yqfWLTJCap4xFBiZTCCMsUvBbrJ+j
	 NbZ6qB6LcfkXgR4fiJJX1sF5HUQdAE7F1E88ErsFaJjFkpOUqFJlpkIohHx/vuMt8Z
	 to0pYq6PjN9A1ROSrb4g3ZicCaISb7kBvzNm9J6GJmKuIMOg6aXkdZLhj+fHyh6mT+
	 8DY/roqSm7nLg==
Date: Wed, 23 Oct 2024 10:52:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>, Stephane Danieau <stephane.danieau@foss.st.com>, 
	Amelie Delaunay <amelie.delaunay@foss.st.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>, 
	Valentin Caron <valentin.caron@foss.st.com>, Gatien Chevallier <gatien.chevallier@foss.st.com>, 
	Cheick Traore <cheick.traore@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 13/14] dt-bindings: pinctrl: stm32: add support for
 stm32mp235
Message-ID: <p7lms5ouffudkszvzrf5pioqmt6ngvf2k4vrzu4hncfxf2oo4p@kbksruiaiqis>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
 <20241022155658.1647350-14-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022155658.1647350-14-antonio.borneo@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_015219_309682_C2315DE8 
X-CRM114-Status: UNSURE (   9.65  )
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

On Tue, Oct 22, 2024 at 05:56:57PM +0200, Antonio Borneo wrote:
> Add the compatibles st,stm32mp235-pinctrl and st,stm32mp235-z-pinctrl.
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


