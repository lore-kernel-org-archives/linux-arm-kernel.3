Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94474C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 01:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMfWmktpO5zxS6QrUvvJTFoOQx0wf0RVH1WYkmIBE4w=; b=ptbUILc1YA4n++SkW2VeJAV4H9
	gRi8D6aGWNLoUinB5E2fnmx5CICA+IreS037AvaLS3mg6B3rZdg8tDY/BegY5j0mxkEXxFhbtGqI2
	temQYWJBg3I+avlYR8kYqxI6jtfDFYKHDJwi0WhkGZpSxGlBdrMKHfaQvH4EY7lJEt2lKXs+oa3OO
	p61P3FniPoSxUoRlw00Qm7PIzuZt8UQjv3idU2brwkpN9HS1Wyr6dSW38bqOnZdLs67DRHbp8AFx/
	cMpP7z01NEuic5Do2pNzFq2BOAFvwzCIgEZXAixLygzWR/ngev4/AggZxdRFWV/+IAMNySJrYNBFR
	T9m7b0hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuLiS-00000004L7A-0mwN;
	Tue, 18 Mar 2025 01:26:00 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuLgl-00000004Kzo-0FLi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 01:24:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1742261053;
	bh=oMfWmktpO5zxS6QrUvvJTFoOQx0wf0RVH1WYkmIBE4w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=gKheE7nkHHrYa81pj3sE05H0URAhJNVuDUirz7G+9ICCPCdhtph4aZJ+bosokKi9Z
	 38BoVsdQHhZzBwsuoD3MmJVFlRD71cHhnX8Z3fZaxstOgEAxirPoTYLT8i+QhNkQhW
	 Yyf5WgsJKVSSbGUpL9GeZPjaMe7Xe8TrPjTA0FBZ+hVOID0SFAO8u9LVfyNjCtolxU
	 Wqh6CFADRYZ8JuSzLRdCr+1/T2+4OA9uTPzoqnthTDjC6SSMIzyFULEh2QFl7tCSZf
	 4rFBtF7O3ycxB7HYVwuAY1DSDAiD7LZj1vueJJhp5GxMtJnA68E3yJrIDZlPJocf9A
	 /3R40MSPiHQ4Q==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6291777BB4;
	Tue, 18 Mar 2025 09:24:10 +0800 (AWST)
Message-ID: <2cf6056212d0eaae0946fd374edce1947afed93f.camel@codeconstruct.com.au>
Subject: Re: [PATCH 12/15] gpio: aspeed: use lock guards
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>, Michael Hennerich
 <michael.hennerich@analog.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Mun Yew Tham <mun.yew.tham@intel.com>,
 Joel Stanley <joel@jms.id.au>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 18 Mar 2025 11:54:10 +1030
In-Reply-To: <20250303-gpiochip-set-conversion-v1-12-1d5cceeebf8b@linaro.org>
References: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
	 <20250303-gpiochip-set-conversion-v1-12-1d5cceeebf8b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_182415_297281_59AFA120 
X-CRM114-Status: UNSURE (   5.24  )
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

On Mon, 2025-03-03 at 14:18 +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> Reduce the code complexity by using automatic lock guards with the raw
> spinlock.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Nice!

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

