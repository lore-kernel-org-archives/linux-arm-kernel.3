Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D218FC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 13:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXxRUdXqmfxaZfLrJ4X9zDN6u+LElKEVesAj3Tp9yj0=; b=dJ+B3Lhc+ztyOxrn3dlgIg+qWr
	KU4GAo788lFVFlZfFbKrId3WQD8zEki0UH+i4ypVjjAKjZJ98douzedcUGIkOubFTJtLHeUalO72Q
	iyP3LBkBzGIeEqZvZ0YgAkQ8M6vzFQNvyipQrg2XXs6LyWDXuzunbXKS94AlhQURT/yhW3Q9pP73R
	1z7H5b5soab/7/1Tq2ci/FSyAdcYhzfkGbVUSdlJp+H9UCOBybBbQ8qdQ92cBp/Oyg7X+W+r3RnH8
	7aSYOSQEdbTCywEaxg6RtRw5jDXVTeVDHL0tyXvqSVSrRycZJj7BkXTVqW1YIAxUsjEtrlLVEjfye
	Ioqxebmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmvC-0000000E8iF-0UXx;
	Tue, 11 Aug 2026 13:53:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmvB-0000000E8i6-2GFe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 13:53:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E777438A5;
	Tue, 11 Aug 2026 13:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 094931F000E9;
	Tue, 11 Aug 2026 13:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786456417;
	bh=cXxRUdXqmfxaZfLrJ4X9zDN6u+LElKEVesAj3Tp9yj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T2HM8ACrzefnEewnDI7WsdoKzf3r3sMzzekKlS5Omm9nrOWlYTMqL4MApiTPRlpeG
	 WhD5Yqv0Z/eO6sf5YyB44A5OiGcfw48Gg+6sramLudG0jjFsK1V6RGBN9w5T7QM6IB
	 bVKsc7/doSeGgQFW9MTNhXKXj9WPWs1/GGB+B+62f1xe5h5WTAHgxh1LbaSrrtAfR8
	 NzBzfn9SnXS7q1BpBTJFS/GXajWD4YUUiIBMjNK25VPNDtjcRDtQM//wc5SYCEcmNJ
	 Khidd8S3VvLjxzclUIHzbzu/t1FAuTg0hmhJiE/gYrWNA11xLs9gWwERXqSs4eKrfj
	 dwW5uGbDbuzGg==
Date: Tue, 11 Aug 2026 08:53:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Radu Rendec <radu@rendec.net>,
	Janne Grunau <j@jannau.net>, linux-gpio@vger.kernel.org,
	Neal Gompa <neal@gompa.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>, linux-i2c@vger.kernel.org,
	Hector Martin <marcan@marcan.st>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sasha Finkelstein <k@chaosmail.tech>, asahi@lists.linux.dev
Subject: Re: [PATCH v2 6/9] dt-bindings: i2c: apple,i2c: Add t8132 compatible
Message-ID: <178645641594.2075087.11441421386167172018.robh@kernel.org>
References: <20260801-apple-m4-initial-devicetrees-v2-0-5cb07cc275da@cyberchaos.dev>
 <20260801-apple-m4-initial-devicetrees-v2-6-5cb07cc275da@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-apple-m4-initial-devicetrees-v2-6-5cb07cc275da@cyberchaos.dev>
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


On Sat, 01 Aug 2026 23:40:36 +0200, Yureka Lilian wrote:
> The i2c block on the Apple silicon t8132 (M4) SoC is compatible with
> t8103. Add "apple,t8132-i2c" as SoC specific compatible under
> "apple,t8103-i2c".
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/i2c/apple,i2c.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


