Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C321606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 12:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S0pHLgWW;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QfCNjwZv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BPdc3G7jz54Uqtjn7AC8nrE7lGpl51rsY51aLrfVh0c=; b=S0pHLgWWkqJ9a72XU8OgS2dbIJ
	Fb2rRDPHlxAg6pbj+iW1FMKUgfGvqNbxy+RhY9Wz63/dFWoF/0CRr0aUuRfVcxYHPd3ZsZqnCzK/G
	oBHuNtqFHnZEOrqmTnHZTVwcVhweNJ+qDukUgWYMR6O9lodKQcMNonCgMPsVFU+S0a9XryKd5CXES
	UvUnI6tWwFSun6x+dbwts1kzJl+XByp9e4E7e83isVDvcBj/6VeYnF6GcX+vS44asU6I7hXZsIPAF
	KM3XmnDl5yLl2kNtv3LTkrdXnIhaQ85qfX0xw801OtOrREc7+RpozCtzlcsxhZxzWjHcBqdUQBXvX
	sHuPTn6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJKz-0000000CLWM-0DK0;
	Fri, 06 Nov 2026 12:46:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJKx-0000000CLVz-1WvT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 12:46:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A644605EB;
	Fri,  6 Nov 2026 12:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FFF01F0089F;
	Fri,  6 Nov 2026 12:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793969190;
	bh=BPdc3G7jz54Uqtjn7AC8nrE7lGpl51rsY51aLrfVh0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QfCNjwZvG+CC3xe0eQ7y6UM6w726zb7ufYTmtI0p1Ftuu85DVYYfmSTmHBnmcWuph
	 Y9PK5Jvm8k3OS2FeKPm56HB66JXa4HaEHqwIdNZ3BmlSLCcMz0lJHOvDAlRZ2v3/ay
	 sXV/z8qIDvgNYf1DhjV3M26yY2Mf+CriYIIcS2FvcvbuRyhDyWW7AxmG6Lm0CfXEoj
	 Ld6aB6yq5Z3kl+NIjJ5NcA9Xvhmt5p3aoEhbqM7hfgE9kJ9D1f7gFhPUBlqh73y3gS
	 D+xoy3ZafBK3VqN1noxIZaktAn2p7Fqx2TO3cmzRwwvErOWtsZFvoNCXBQyqgA6fVr
	 hhG8crctKJ0Qg==
Date: Fri, 6 Nov 2026 13:46:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Sasha Finkelstein <k@chaosmail.tech>, Linus Walleij <linusw@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 6/9] dt-bindings: pinctrl: apple,pinctrl: Add t8142
 compatible
Message-ID: <20261106-undetectable-vicugna-of-advertising-6d048e@quoll>
References: <20261104-apple-m5-initial-devicetrees-v2-0-fd727a82d380@cyberchaos.dev>
 <20261104-apple-m5-initial-devicetrees-v2-6-fd727a82d380@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104-apple-m5-initial-devicetrees-v2-6-fd727a82d380@cyberchaos.dev>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 06:24:19PM +0100, Yureka Lilian wrote:
> The pin controller on the Apple Silicon T8142 (M5) SoCs is compatible
> with t8140. Add "apple,t8142-pinctrl" as SoC specific compatible under
> "apple,t8140-pinctrl".
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


