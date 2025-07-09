Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAFBC83F14
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 19:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ra0q1YRk8dc9wL0sB8bADJNs5V8YEwxRwJMrTAmQyqQ=; b=S3CXfFfpCwjJ+u5KDkUlw8cRuD
	q1P/ReIELJXJ8q2HTmJC9Yt9w/rGWuKK4NEClpebdry0vqhuHWU66+gFNx+7JcF8YZZBZTVQtPLpu
	/ECS0pQBJeL0LrwinbN4SckARuzQixX30cl2W0EuCDTIY74XVoJ2P0kKFbH9KRaS0mKCbAiTerntg
	cSMBHymGOqdhP5qdD1zAhZegYYWrftTO3DdBQ24tsklYhWbPMSwMBhsXilc6z7oK4YTRqoCYM+KzM
	I1ArpQNRk6pklUaL3hx/ELR8pu8xK87vbFVa4ITE3SWaEHytEppjFCwuNeQks3UfCSs5wpG6wUDAe
	LK8koYcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZaFG-00000009fX4-1JC2;
	Wed, 09 Jul 2025 19:14:18 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWqq-00000009Bcg-2b2f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 15:36:53 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 4F76E299;
	Wed,  9 Jul 2025 17:36:50 +0200 (CEST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Jul 2025 17:36:50 +0200
Message-Id: <DB7MWBOS4YDK.2QIYX7WQ3X1KU@kernel.org>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Shawn
 Guo" <shawnguo@kernel.org>, "Lee Jones" <lee@kernel.org>, "Frank Li"
 <Frank.Li@nxp.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Andrew Lunn" <andrew@lunn.ch>, "Ioana Ciornei" <ioana.ciornei@nxp.com>
Subject: Re: [PATCH 4/9] gpio: regmap: add the .get_direction() callback
X-Mailer: aerc 0.16.0
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-5-ioana.ciornei@nxp.com>
 <0d0e9cee-2aaa-402d-a811-8c4704aadd74@lunn.ch>
In-Reply-To: <0d0e9cee-2aaa-402d-a811-8c4704aadd74@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_083652_794515_31842B45 
X-CRM114-Status: UNSURE (   4.90  )
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

> just provide the bitmap, and gpio-regmap.c can look at the bit in
> the bitmap?

I like that idea.

-michael

