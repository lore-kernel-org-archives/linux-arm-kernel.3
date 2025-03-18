Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5E3C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 01:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qKvfbybSgzxVC9QLPwnRVKlfys38kBlYo29Mi3CfoU=; b=UkBDPk6aFjSDH2JNAKQ8p9sZvK
	VIYe4JdNdV8oCg1rrGqTM99DsGJFo/Iq3LS27KRN1Iek9mMhhxGPKxwQAUvFPoqMp2phUi6ySLSNT
	2rob0LO0qIU15qEJS9clDydVwGB8R3G5DFnK067CbyrgzWJ7Jzp4DeUvB0jfRcHeCTFNC2nxLFbSq
	9sq0OrCfjPwFGSMs0iGd2HPB+vylB9xqOyEdmNvd67cHBDOALxflA49ltv3GSIjYxa4tDBPyA1sPQ
	sAPNJ9Ksf34aAlI8iDrOuDH1ScicrqPXrH4rB2zTzZq9EOLaXLodatQ2nV4XZ6niwzgKyadDu3OXE
	ku2dvjxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuLnP-00000004Lik-13xy;
	Tue, 18 Mar 2025 01:31:07 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuLj6-00000004LEb-0Xpd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 01:26:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1742261198;
	bh=8qKvfbybSgzxVC9QLPwnRVKlfys38kBlYo29Mi3CfoU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=C+NGQUgudkaryNlxpr+Bh9rYvk2OfGEBFs9x7fJ2Q1bAnXm9xqsV60gCn1kJVjx8r
	 7UWvgJxoo9f+Xas+7ze2zyTisPdjRvt6v+tyvEBxQo8432S2UhwskhE77CAfXjzhYh
	 NJAeFE4CsA3JGGjnriSHv6fW0fAZerqwjUzFfigHB81o+fq3Tbha3IWgEaAfV54MwR
	 YzgoSJnCuq2BMgIvrT/xetkcK1/rFhAKLXCrX3q68/9a8WN05p/HmxO4NOMnEIz7gi
	 90sFG6miV+Bm5HK1y1SxvCXjLaPy2ywC7atf/aY1fOTy+H5p1TE8aykGCQS7bnFdgX
	 Rm+VpKU4VqdUw==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C0D7F7A5D4;
	Tue, 18 Mar 2025 09:26:37 +0800 (AWST)
Message-ID: <ace3d4bfa8bf4d59e1578a5f8b7c9aa92a25d85b.camel@codeconstruct.com.au>
Subject: Re: [PATCH 14/15] gpio: aspeed-sgpio: use lock guards
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
Date: Tue, 18 Mar 2025 11:56:37 +1030
In-Reply-To: <20250303-gpiochip-set-conversion-v1-14-1d5cceeebf8b@linaro.org>
References: <20250303-gpiochip-set-conversion-v1-0-1d5cceeebf8b@linaro.org>
	 <20250303-gpiochip-set-conversion-v1-14-1d5cceeebf8b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_182640_367901_6A777C53 
X-CRM114-Status: UNSURE (   5.35  )
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

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

