Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52876FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 08:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTSdDPwWW4/ZWzbZYVwv6UgySSpuqfzPBisnZyolzFg=; b=T7GajfPzOhEwWDBclTXoyik5BF
	OTVByFmRe2Age9N+ehVPK2qLwmuMQAGyrjMM4s0ePLl5YkrsFSuA70mFYv9QyKktRdAJacEs7diBK
	7XCr2wU27KD1ZYvxccmHTxsAmKBNIJp3NvSTq5al8pNhQ7J+dSNvBy9Mkm2kCYJVGk5MgDACsfOiz
	UcSL3kxTX/YcYe7pY9wkGbA0I59CufZMHZaTZSuVjRvUPBOKw+0O5/n1E/a2f2eqm7vqPEw8kXyuh
	45A1dHpGRVxBmUXF813UPCMXO48QDe5hj1W3GSWlkKSbbe2TTT9kXwgEjQzI/SMDvvG5oOoGRUhwO
	zd07bRjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJoh7-0000000Cj5e-0Jsw;
	Mon, 04 May 2026 08:30:25 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJoh4-0000000Cj4o-0IRu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 08:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=eTSd
	DPwWW4/ZWzbZYVwv6UgySSpuqfzPBisnZyolzFg=; b=L0LY+0ZKpGp1YN9pVpMW
	YLJxnvPaC+/Tvf3Wjy2FILZZQ3KP/OKnI4y9ILEPNUFtlIDFOeZDZa+KFBM3OSIo
	IHzU4NWS4Z6rsozRkhL3FFH/1lAb6VBCQhFVgTyb8hBF/IVhnQ0YrTAm0Gu/bmMc
	VKQwCXogLBB5dkEcfvZUGGosM53Z/D9c5c85ikTIGg/XyGmHOi5l9o9oYu0Skgcy
	REYwjGNYu4AhTxYZ85kAZefqbvwOAI00HKlfSU+XapOOJDzlN2qv00McvDtVf6bo
	t1meY0cIKIr2aWMMpY8UTrlsW++R6xD3Ok688WLvBwnUDAbnapSq8J4j+jFu80lV
	cA==
Received: (qmail 2104411 invoked from network); 4 May 2026 10:30:19 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 May 2026 10:30:19 +0200
X-UD-Smtp-Session: l3s3148p1@X9uhvflQBM8ujnvR
Date: Mon, 4 May 2026 10:30:18 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Janne Grunau <j@jannau.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 6/9] dt-bindings: i2c: apple,i2c: Add t8122 compatible
Message-ID: <afhZGnc9vATRDH9d@ninjato>
References: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
 <20260320-apple-m3-initial-devicetrees-v1-6-5842e1e393a8@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-apple-m3-initial-devicetrees-v1-6-5842e1e393a8@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_013022_417039_3A2ECEA8 
X-CRM114-Status: UNSURE (   8.66  )
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

On Fri, Mar 20, 2026 at 01:23:24PM +0100, Janne Grunau wrote:
> The i2c block on the Apple silicon t8122 (M3) SoC is compatible with the
> existing driver. Add "apple,t8122-i2c" as SoC specific compatible under
> "apple,t8103-i2c" used by the deriver.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> Acked-by: Andi Shyti <andi.shyti@kernel.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied to for-current, thanks!


