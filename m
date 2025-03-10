Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A168C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 17:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/jbGKRUts84NApaIU4ODSIOqYgEZ7ke4E1YEaVdoBo=; b=2la74uVmWxr411c0HX9Z9g1LMB
	od9GJdEYYOKlqPoyaDSnUvRWCB7JQPxatJcuLBGjgrWEMnMb6/cvJwCEkKFXkCxnpJU7D6cBBwHzI
	dFxyb+mYeokgWUmjY/PA2t+9g7qIR8XjcdHdUK/vVvLQX7yU89pn/zLfoppgUGvffIKoZGL8Yxtud
	GJ0ETZrCl7CA/9UDq08xLaodt31k36adzDd7rWeCxUtnxB6wAN8SiEPanzNMMtzgPK+EEBXtIsdjs
	nmwKai96q0w8deEPMqO+v4rUTwnXqPnxoaxkq2+xwT3WdJshuL2Sh92VczrHxjoFQhDqJ+y51J8aD
	4pXidZzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trhOU-00000003Y9M-2EAf;
	Mon, 10 Mar 2025 17:58:26 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trhMq-00000003Xyl-0v6p;
	Mon, 10 Mar 2025 17:56:45 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741629401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I/jbGKRUts84NApaIU4ODSIOqYgEZ7ke4E1YEaVdoBo=;
	b=iB0IHfs12VxJhCVnUQPcHdSj6A35Caff7fnpnJc2rZHzEHS+J+VZOVZg0Y7Oq0J2yzI0ug
	UjbptTofrkQ3jTEvaBQ4pef3OI4GTh/EPGvnIZ+Cl7km1q2RL9WilUyRof7ANHeY/yOw4Q
	g+hH+vIfC5QYGHwrs1Yqh4wMHGcZ3SYARh3IDh3/kSW2A+rIRN5R4cslQDlLjcwzTBLRHP
	crEFNblsAF4eHXZnEilusHyv0psL8mReZhecpKSacf5LgGfGrNSHbt+0/51fMZfTWpfxgg
	QGGT50z6R6cwIRqss5f332b8PyKRlOLDn4ueRV58yWs9ZgDqJRg+Z2kGQk3C2g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741629401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I/jbGKRUts84NApaIU4ODSIOqYgEZ7ke4E1YEaVdoBo=;
	b=bh/F4PMrokCyw/FNdKUi8/VPBZ3V3SiUaJ3FDva1iG/o9JezcsMxR/uar4iwib/R0af1Cl
	DwXqIg6jjxlSV9Dg==
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH v4 0/4] Add GPIO interrupt support for Amlogic A4 and A5
 SoCs
In-Reply-To: <20250307-irqchip-gpio-a4-a5-v4-0-d03a9424151b@amlogic.com>
References: <20250307-irqchip-gpio-a4-a5-v4-0-d03a9424151b@amlogic.com>
Date: Mon, 10 Mar 2025 18:56:40 +0100
Message-ID: <87h64022hz.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_105644_400512_B49B2055 
X-CRM114-Status: UNSURE (   8.81  )
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

On Fri, Mar 07 2025 at 16:49, Xianwei Zhao via wrote:
> Xianwei Zhao (4):
>       dt-bindings: interrupt-controller: Add support for Amlogic A4 and A5 SoCs
>       irqchip: Add support for Amlogic A4 and A5 SoCs
>       arm64: dts: Add gpio_intc node for Amlogic A4 SoCs
>       arm64: dts: Add gpio_intc node for Amlogic A5 SoCs
>
>  .../amlogic,meson-gpio-intc.yaml                   | 19 ++++++++-
>  arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        | 19 +++++++++
>  arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        | 12 ++++++
>  drivers/irqchip/irq-meson-gpio.c                   | 45 +++++++++++++++++-----

I can't take that through the irqchip tree as the amlogic dtsi files are
new and in Neil's for-next branch.

Neil, feel free to pick the lot up, I don't have conflicting changes for
that driver sitting in my tree. I'll reply to the irqchip patch seperately.

Thanks,

        tglx

