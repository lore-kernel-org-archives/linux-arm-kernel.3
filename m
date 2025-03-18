Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74FEC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 01:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPmp4bTaoMgGyxKWDl4hyootOO3DyrJbTpPjEsI959o=; b=LovwlHIIxup+uOiRlQ5YLjy3g2
	U5p/eP3bTcu8Yw7NKLp3oLD1TflqeXxpIYZXJ+JTy1esUk1p95sLpiFhIXBj3e9X5JUTmF/aYnTO4
	gpCIvFY4aE85zkcnL+ZRDUIsBmHQCXXQMi6FIEt+4NvydDXiYD2xRdYTW0zmfyjCIWUVFZXc4mGB5
	e6UnzNX7fL9UAQXJAM3AQws9evX2qIf3V18mdALSCCRqNXyIOjJWNb9OsvrdQ4j/3/1Xc66nZHlQN
	qx5sshLpq1Ta0DP7eLKWSWhuCWiPHY1KgqZMyrpXYwkydZ2nxaKwPCims7Qsj2ZtfG4OTf6RwKbp4
	qJz9fXgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuLp2-00000004LuK-3uqL;
	Tue, 18 Mar 2025 01:32:48 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuLjz-00000004LJt-3opK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 01:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1742261254;
	bh=lPmp4bTaoMgGyxKWDl4hyootOO3DyrJbTpPjEsI959o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MQWYmk8TcQXao5iPuOHm2Zq43lqT1nc6k8aJyHOAOo+sXf9VN+kI/vmVrUw5RSa7d
	 KvsGQu8yN7QRfG1FxY95hlna5/EgKwrNLPKgsTWoNkTjz8qwafWIR8ezrvstFUE60J
	 aLR0rKR5FTbQ2K/k3bjTOCkbxAgEOum5VzvjFppbmGxmf7BCRwXLGSpFhB64KsZejS
	 X8ftTyvDt8mtHEHAtjbEWInsnJwCJC9uWlhUWC0ML3u+wTjghbynsrEBkmqonjmMrB
	 bTvn0Epz445EkXjvyKYZDj/Bm+nKkJhL1c5vh6WyUl14Wrw6HidfYlpWzxOLfSdW66
	 2LEOz+VgXTp0Q==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9D1227A5D7;
	Tue, 18 Mar 2025 09:27:33 +0800 (AWST)
Message-ID: <91090eae4f8f4843139ba0a0baf9215965cd44d6.camel@codeconstruct.com.au>
Subject: Re: [PATCH 15/15] gpio: aspeed-sgpio: use new line value setter
 callbacks
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
Date: Tue, 18 Mar 2025 11:57:33 +1030
In-Reply-To: <20250303-gpiochip-set-conversion-v1-15-1d5cceeebf8b@linaro.org>
References: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
	 <20250303-gpiochip-set-conversion-v1-15-1d5cceeebf8b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_182736_146673_FBF3D9ED 
X-CRM114-Status: UNSURE (   6.44  )
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
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

