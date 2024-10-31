Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8503DD767E1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 16:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0o+s3aiY3Bsw3fqfqelZWwzh9qVu/lo25kdUzlaTJI=; b=MGiW7wOygLdZnZcl125ustxZvK
	ccyKx1gptHOPeEu4ALoJDp/vU9fVPRxfRv4NIJ80027Jlihquz5XYSvDraRPhCL21dVSAXB6CYYZk
	Zt8DYg4Vlx8Dnn6bad71doSYwzXOHgaQU62lZr2kZ5SM+6rOOjw2rjP3EurOpUboZxGsmjBdGj+BH
	3/hbCgZ48R0QuicVha8VOaOWhvbeo5Y0hpOhb8d3OGqbE1kq5NMxSNUVYhQs0rgR1ocZYAcRLQl4j
	ysm35oSGftccEiCXAhFE2s7aAgB5RAtQRUcwr8CQozwWUFomfwtEZIbSivOpZIw+K8lJ6xIqR+mJQ
	khwBxUug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6YDH-00000004DEM-0qXQ;
	Thu, 31 Oct 2024 16:39:59 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6XoL-000000049Nl-2A4y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 16:14:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23BFEC0006;
	Thu, 31 Oct 2024 16:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730391248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n0o+s3aiY3Bsw3fqfqelZWwzh9qVu/lo25kdUzlaTJI=;
	b=pVHehoUF8pW4Qa2282JzDFtPU04KfzlzIxAbszb4P968e5MJa90O1zSyM+ikSZDVsVvLcE
	RtyQsl9G9LymtJRvP1c1NLx+JsSRL/ALz3qfBWuinM4hZRDqWsnOWF6+57Mqf77U2JIXsF
	nl52gOg46uHvXvw3VHK6UkMmjNZhVXsCGVc+4GlcKx8l97af1+PXPDSfnznH187Ll4GofN
	jaO5j8DvGgyiAp6o5ns62uVWzkxjHc0Vudr8B5kDWY1DbCM1U9fAfIBUIsSw7+MZFhbPiU
	VAbW7oGRhTcTfXSvt+3azmrUnExu7Rg80E3ZrNiZhH8GeipwyUcNX5I8RRgcYw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 31 Oct 2024 17:14:06 +0100
Message-Id: <D5A4I4MRPY8J.OBNCJBOHUTM5@bootlin.com>
Cc: <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vladimir
 Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Andi Shyti" <andi.shyti@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH v3 0/6] i2c: nomadik: support >=1MHz & Mobileye EyeQ6H
 platform
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241009-mbly-i2c-v3-0-e7fd13bcf1c4@bootlin.com>
In-Reply-To: <20241009-mbly-i2c-v3-0-e7fd13bcf1c4@bootlin.com>
X-GND-Sasl: theo.lebrun@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_091413_838893_CE55FBBE 
X-CRM114-Status: UNSURE (   6.91  )
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

Hi Andi,

On Wed Oct 9, 2024 at 4:01 PM CEST, Th=C3=A9o Lebrun wrote:
> Three patches are about adding Mobileye EyeQ6H support to the Nomadik
> I2C controller driver, in the same vein as was done a few months ago
> for EyeQ5.
[...]
> Three patches are about supporting higher speeds (fast-plus and
> high-speed).

I come in checking. What's your state of mind about that series?

Rob has given his Reviewed-By on both dt-bindings patches, and Linus
gave his on all patches. I can send a new revision taking the three
Reviewed-By trailers from this V3 if you like.

Also, i2c-host-next is free of conflicts on Nomadik files.

Thanks!

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

