Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464FDCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 06:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLoS84sI3WPajohaQC0KpHU4wyA5Vb0hbn/MruTGk+s=; b=W3doxubKQ3rbpD6nbsAkQK/9v4
	muV0mVPtjNSbMmS+9zbVariRjAmPPWNVS0tKTafJ8lN0wNDbmO9fjAiFFSCPjelkjkfrEiTqI/HYd
	rGdduBvqmMJFOKkRGiqboPaNYUjT8hDhdQQEZuxmdlV7zybSdIg5ea4dhwsWmR552eSDEktqwIHT9
	+Qtd7bIKtsiS1hfp6nBKHN2E8MDc4hE9ujjtg5an9iXctP/dT+jwsN/2Tu79ZPilbDuXcVZ9OIeKK
	LPX62/2NDOwarvZIvplz5a1JkhpX+xPG77TmYqWOnvqkL1eBNIRNDUSk+REIDWp+PjwTo8SImG2Y9
	St59PI+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBpGR-00000005HJM-3ce5;
	Thu, 23 Oct 2025 06:57:35 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBpGP-00000005HHF-0w4s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 06:57:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2F168C0C407;
	Thu, 23 Oct 2025 06:57:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD1096062C;
	Thu, 23 Oct 2025 06:57:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D715E102F2408;
	Thu, 23 Oct 2025 08:57:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761202649; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dLoS84sI3WPajohaQC0KpHU4wyA5Vb0hbn/MruTGk+s=;
	b=GHf+lrBmpBmgVdtkZP91sFj0DpTN9geFzGA8ihLfWcHmArhd6VWJst+JG8qh1FxhuQHEfq
	/FqHEo7Fy+mAH5T1VBkCdCLtyXBbu+FE0Ou5cvPTdGwIW7tRjKG6AusfdfwAzCRjMm6aVa
	q2lmsxG3Ofyg6wfl+uQFbV/VAE6G9fswgMhd35cGSUWwwkemjHH0VzhJzaMG0WAHC/wCxD
	ZtJviPDLQyk0ZO4/QxwkXgjpalb7AyfA6mLfuVK/0kuy+tX5KoSpixXiYG70OMsRXiPT0n
	91zS7OrSUgqFJsSkBq7XvGK/ZDBg8VEU/R2dZdwlNphzin27YN9luDeR0LVD8A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,  Gregory Clement
 <gregory.clement@bootlin.com>,  Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Linus Walleij <linus.walleij@linaro.org>,  Richard Cochran
 <richardcochran@gmail.com>,  linux-arm-kernel@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org,  linux-gpio@vger.kernel.org,
  netdev@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm: Convert Marvell CP110 System
 Controller to DT schema
In-Reply-To: <20251022165509.3917655-2-robh@kernel.org> (Rob Herring's message
	of "Wed, 22 Oct 2025 11:55:08 -0500")
References: <20251022165509.3917655-2-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 23 Oct 2025 08:57:20 +0200
Message-ID: <87ms5iqf5b.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_235733_445179_6E9FC610 
X-CRM114-Status: UNSURE (   9.82  )
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

Hi Rob,

> Convert the Marvell CP110 System Controller binding to DT schema
> format.
>
> There's not any specific compatible for the whole block which is a
> separate problem, so just the child nodes are documented. Only the
> pinctrl and clock child nodes need to be converted as the GPIO node
> already has a schema.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

[...]

> +  "#clock-cells":
> +    const: 2
> +    description: >

I am surprised you prefer a description to a constraint expressed with
yaml. Yet, I am totally fine with it.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l

