Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BFFC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 22:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5Yg+pdTXpo6t0O7UQl+RIbiB4LOKOnIdXdXoBOJyck=; b=c0tvGnyGBAsOhzJ9CQF0cz5CC3
	YC4KvxuXSw5IErWq3Xqg+kM1NDJNLB3msv48QCm3dhbbT7LsZXfw8rsnEHFeY70dQigdKRuOI+bHd
	tI4pMychiwikHyjBWOgVb5BzSmL/KISC40+/wF+TQ1GGLu6MZYhM8gDMca1XXAlTCprXuxXRebmMG
	aLF8Ys7o8kAvS/CeADDHdxUESny8Q1OERKMw8xyG/XOhgz3DuS9j2CQPM9Hmp7oVUdqLFlEkmZHCK
	EAxdW93Eqq5mAm14+nIcWZ98kyA1+EaDhN9LahjRLMqbBs8u/MnJMjvTkrWOxDuv5RbLzweLHlsHl
	vzEg/PVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueLjG-00000003cJ7-1rGG;
	Tue, 22 Jul 2025 22:44:58 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueLgj-00000003c7R-2Klx;
	Tue, 22 Jul 2025 22:42:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 69C9943275;
	Tue, 22 Jul 2025 22:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753224136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b5Yg+pdTXpo6t0O7UQl+RIbiB4LOKOnIdXdXoBOJyck=;
	b=OiwP4pKbiIk4mcSLaL9RdN2P/6K+rHryH62SPWAsZd52iz5Z/rFoylJzCtRSvzA2tb7on4
	Cc+C1huFf+QizyFqpxlSeHww+c27B+NZbxavUsmSYrsFLRmzmwATEOBRdHu/X4+i8rNedF
	2Rt+a/ijrDx8kZhxNeKML482g2M6o/w7sLBzT7INqvxOROp87kjKZhylh0BO0pXsSKSaAm
	8TCPBtxwgM1FWhZWQj5TMO6jTubmAUh0Ad+QSa1VcFrFdJ291BxVmw0E+cYdPHvpUTuVT3
	uHDpKLgC1+i+WXdaDsm52o61H8G7VrwA+8WYRlDT/vS+J283lNr85hBFHGxudw==
Date: Wed, 23 Jul 2025 00:42:14 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Harshit Shah <hshah@axiado.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Frank Li <Frank.Li@nxp.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, soc@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	Jan Kotas <jank@cadence.com>, linux-serial@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 06/10] dt-bindings: i3c: cdns: add Axiado AX3000 I3C
 controller
Message-ID: <20250722224214cd72ae8b@mail.local>
References: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
 <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-6-543979a60ccf@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-6-543979a60ccf@axiado.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejiedufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegsieehmegsvdhftdemkegsleekmeejledtheemrggsvgelmeduhedvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemsgeiheemsgdvfhdtmeeksgelkeemjeeltdehmegrsggvleemudehvddvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvgedprhgtphhtthhopehhshhhrghhsegrgihirgguohdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehjihhrihhsl
 hgrsgihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihgthhgrlhdrshhimhgvkhesrghmugdrtghomhdprhgtphhtthhopehpghgrjhestggruggvnhgtvgdrtghomhdprhgtphhtthhopefhrhgrnhhkrdfnihesnhigphdrtghomhdprhgtphhtthhopegssghrvgiiihhllhhonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_154222_249755_84CE4F05 
X-CRM114-Status: GOOD (  14.59  )
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

On 22/07/2025 13:15:34-0700, Harshit Shah wrote:
> Add binding for AX3000 I3C controller. So far, no changes known,
> so it can fallback to default compatible.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Harshit Shah <hshah@axiado.com>

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>



> ---
>  Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
> index cad6d53d0e2e35ddaaad35215ec93dd182f28319..6fa3078074d0298d9786a26d7f1f2dd2c15329a7 100644
> --- a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
> @@ -14,7 +14,12 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: cdns,i3c-master
> +    oneOf:
> +      - const: cdns,i3c-master
> +      - items:
> +          - enum:
> +              - axiado,ax3000-i3c
> +          - const: cdns,i3c-master
>  
>    reg:
>      maxItems: 1
> 
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

