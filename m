Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6260BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 01:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPmp4bTaoMgGyxKWDl4hyootOO3DyrJbTpPjEsI959o=; b=wmuDloxjzzF0+D2vaAl+7mhc6b
	HhSr4reQGBpyLiTVvDKsQF8wKza7uBDaHL4btyqE9aMCTi1bqaeP3OWK9xqMwjHCT8bKRkFeD6W8L
	jDlNeysaEj7DM0OWoTAYKBnc9SPXp3A1LSNHfOf64NgKrwHERXWyEDHczAp//LJqtZKoLGxIz14Wp
	Wbmm75klhaDVdNN59S8MpcA7ypnpRbiKTcjhJBQCcXqQwgiKE/dsBuv8OaF6AFf0qM/sOazbI7Y/K
	uHTpYnygMoGVkjFS+DZgOGMxFq7AWz0sQ2YkBZYYJugG0/c6W+UCLNBhBK16BdsOeLWy6AelVn/C5
	aFZOVeVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuLk5-00000004LKV-3US9;
	Tue, 18 Mar 2025 01:27:41 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuLhd-00000004L3d-0djE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 01:25:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1742261107;
	bh=lPmp4bTaoMgGyxKWDl4hyootOO3DyrJbTpPjEsI959o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bsNvKS6QD1044iBQatImnxqfM2ryIpayU6Xlej8mBkjEwgHgFdo+R6oFz2U3tP30t
	 Bcq37i1W6QRUC4qYCJqm3SVWHFzrXv/q5burE+CtCXaD0oILvyJgA4DT3mg9z8cIXB
	 Ejdt6SDdKdHeh7JkehZp/FtXZ5lW4CerqNRvXKCAGH1xXj0xZxL3rAMDwzcpkzM0Zm
	 mlCY8Y4FL66Rc9H0ydXLFPJG72PZvR80ZZoTsVMLdgckIU379emKNfAmY5lqhx5FNP
	 ZFgHLFwUS4MzKEKwVBIIeo839By+lfegH9Fx0XXzh6H9zhlTd6zl70ujcF5lCfVrwn
	 ESvNiLxQitVcg==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DA1937A5D1;
	Tue, 18 Mar 2025 09:25:06 +0800 (AWST)
Message-ID: <bbc06c8cfd3ccd1847ec309f0fe4af80649720d4.camel@codeconstruct.com.au>
Subject: Re: [PATCH 13/15] gpio: aspeed: use new line value setter callbacks
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
Date: Tue, 18 Mar 2025 11:55:06 +1030
In-Reply-To: <20250303-gpiochip-set-conversion-v1-13-1d5cceeebf8b@linaro.org>
References: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
	 <20250303-gpiochip-set-conversion-v1-13-1d5cceeebf8b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_182509_394860_19BDE98C 
X-CRM114-Status: UNSURE (   6.34  )
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

