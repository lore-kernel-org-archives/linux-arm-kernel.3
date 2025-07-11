Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0719C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 08:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZN3hcPUL4hWbXo3h+Lxw7iME9a4OEx7USCL3CmDjHM=; b=ny7Gm0KIlzkMUpXinLzXt1LaIG
	CyPHvGMWwnxJnp5fq640LXerBtlXIGoN57Zpx+R6X3l477vU8K31xORXYPym7RZg1rRZTNh51Az3Z
	/FUJkS2VtH6vvskr3LXmucScwkyA8NvRoeTFdwfsFqp13BXq15jvTSTzb28W3+U/eaTuLWHWs82qs
	p19DbvKnNZqRtEU7VNqc8TITRpVkT+chtQbbYS/vE6NtXqRI1hVaFvLdBhFP1IsAQX4DExGl1SVQz
	x6EcrGlKqeRcQobw73TfT2CTDU3lmB6jhzXuQ8vGWAL28LmVIjGq0bRS7LcAzNpM7SC9Jd/5tlHid
	DzF4uWGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8fy-0000000E3WS-2rdH;
	Fri, 11 Jul 2025 08:00:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8KT-0000000E00O-0Tih
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 07:37:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BC7D6115D;
	Fri, 11 Jul 2025 07:37:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF13BC4CEED;
	Fri, 11 Jul 2025 07:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752219476;
	bh=hlaTSOfwU5t5uUBJH15EMSZMX/iXkdPXO1i1im6HrmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EJ21gcZ6wG8Uj0HdA04vOksRm0n2/UU4SoJfCNz3NmrhNV24uv9zxFXii8sKLVNsF
	 m5Rh6w1zUQTpkVJ9HyCfSpFEmRrTJVXUQf2AAAe1P/5dPD6/o8wXhhcVJ5eZ/FoMn4
	 Fq52ac5fiXga0CofTseD3XacSQs3FADD8hmgVHT+KSbm57/u9WPDrCT4uqguPk0GL1
	 t54Z43UWfWMTQthbWjWwB1DmU/bNbVU7t9TN+FKgVqAlpikG0MggjHm8/UNFEN3jaR
	 YIVdQs0LoW+Qz4ZCcItWXfbs9tcjH136a6cOD+VlNjHO7BrcZWtpUPWucg66dF69hS
	 rGyIlMUNsP1DA==
Date: Fri, 11 Jul 2025 09:37:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, chester62515@gmail.com, mbrugger@suse.com, 
	Ghennadi.Procopciuc@nxp.com, larisa.grigore@nxp.com, lee@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com, ping.bai@nxp.com, 
	gregkh@linuxfoundation.org, rafael@kernel.org, srini@kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, s32@nxp.com, clizzi@redhat.com, aruizrui@redhat.com, 
	eballetb@redhat.com, echanude@redhat.com, kernel@pengutronix.de, imx@lists.linux.dev, 
	vincent.guittot@linaro.org
Subject: Re: [PATCH v7 01/12] dt-bindings: mfd: add support for the NXP SIUL2
 module
Message-ID: <20250711-lean-burrowing-jacamar-38fcc5@krzk-bin>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
 <20250710142038.1986052-2-andrei.stefanescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250710142038.1986052-2-andrei.stefanescu@oss.nxp.com>
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

On Thu, Jul 10, 2025 at 05:20:24PM +0300, Andrei Stefanescu wrote:
> +        properties:
> +          bias-disable: true
> +          bias-high-impedance: true
> +          bias-pull-up: true
> +          bias-pull-down: true
> +          drive-open-drain: true
> +          input-enable: true
> +          output-enable: true
> +
> +          pinmux:
> +            description: |
> +              An integer array for representing pinmux configurations of
> +              a device. Each integer consists of a PIN_ID and a 4-bit
> +              selected signal source(SSS) as IOMUX setting, which is
> +              calculated as: pinmux = (PIN_ID << 4 | SSS)
> +
> +          slew-rate:
> +            description: Supported slew rate based on Fmax values (MHz)
> +            enum: [83, 133, 150, 166, 208]
> +        required:
> +          - pinmux
> +
> +        unevaluatedProperties: false

I noticed Frank's comment and he pointed out that this changed, so all
':true' lines before should be removed as well.

Best regards,
Krzysztof


