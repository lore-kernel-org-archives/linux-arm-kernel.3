Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDF1CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 14:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tD9Dd2I5mfKt/jOPREylpMxst4xlujfA1H39bh/pAM=; b=OTVMy1NLf8XHA7G18Y1yek7fym
	S5uJdkvkM1IWbIhQWAmocVTN9qmKtS9upxN6uHgmXaZCQZvMbkAWMqzuVA3qF6YMaYNqQgN/CBN4/
	JWyxos8EyaYKbD4haNKLjwx+ozQzBxISxaMKYA/qxKuXXBORYostSlQ3HYFIUuveeVVLJSbz3Pomy
	V9kdSih5DnCu7qDlL6o/WgHHevW3dHmDmhWFuIQwM7u15yg2tp78Et4cd4o+ozSO2thv4nRgA2mNt
	dkc+xusjFPXRrGpwoSpfMZJdPvZnJwvzkQTPTDiYgibKTYFu0IVWMKhG+L+4lZr68qM/Sp5WODs8J
	lqBaLtKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZZl-00000003AEF-0JTP;
	Wed, 22 Oct 2025 14:12:31 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZZh-00000003AD0-3FEt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 14:12:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 59D2D1A15D4;
	Wed, 22 Oct 2025 14:12:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 32FEA606DC;
	Wed, 22 Oct 2025 14:12:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47A7F102F2432;
	Wed, 22 Oct 2025 16:12:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761142343; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2tD9Dd2I5mfKt/jOPREylpMxst4xlujfA1H39bh/pAM=;
	b=Ar1UucqO2ytR2avAw0DsbeqP3tjYfW3tcBpwoXfy+A3o1GpC+BboZjWTzKIB9dj7pyfFhB
	bOuASXrnWebu4BAkXx2CScZDu/F8i9goSPLq85Etsdt/w+GCiU4nqyCRfOF3lPzjlnYNEt
	2iIg0MdKTdXIfDYT3yiXuVizvajwDjIsHaDjfPxlgdeMIxZEt/bB1ohsXRIo26jyGl/c3Y
	3/FlAEQXutzLAgzytk4ezgNzuBM7laNYWaUUWRipBS7Fch4jdtp/m07SkErQQKVEH/s1R/
	xDANDM7g0/4y6j52X/SEhc7JeS3vBcWYN4mX4rIriWgh0l9YCcPP4tHtfm9IHQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,  Gregory Clement
 <gregory.clement@bootlin.com>,  Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Linus Walleij <linus.walleij@linaro.org>,
  linux-arm-kernel@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org,
  linux-gpio@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: Convert Marvell AP80x System
 Controller to DT schema
In-Reply-To: <20251014153040.3783896-1-robh@kernel.org> (Rob Herring's message
	of "Tue, 14 Oct 2025 10:30:38 -0500")
References: <20251014153040.3783896-1-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Oct 2025 16:12:21 +0200
Message-ID: <87frbbrpoa.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_071226_032326_07F4D564 
X-CRM114-Status: UNSURE (   8.51  )
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

On 14/10/2025 at 10:30:38 -05, "Rob Herring (Arm)" <robh@kernel.org> wrote:

> Convert the Marvell AP80x System Controller binding to DT schema format.
>
> There's not any specific compatible for the whole block which is a
> separate problem, so just the child nodes are documented. Only the
> pinctrl and clock child nodes need to be converted as the GPIO node
> already has a schema.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l

