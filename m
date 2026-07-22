Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E763C44512
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 06:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zb3qHEfQNdn/VPyYyBL6pEsHOl2hhCoI2rgqrXHwIU=; b=lkLw0aOHP7wBe4V0CL81CtKOuw
	i0/sENfkYd6hi3SXVKFd0LPBhwhoPFp4TWki1lkycXJXCvHvjrKUlFIOQ5hbPA0LVvNAv6cnGhmT5
	XFjTxPqRAxG+4TRkR8oZCRLlSu2cbyvhw+PgNyBLJ6fBoQLdV4kp7ZSUqYstP87qeUfR+qV5PPWhk
	Fi8bS+sCDNUxG0X38Pg4mjA2CQbQ/trytSTz0W/3UiAC8sY+5Z2iFxQkujvkvb7c4Fsah2QNpJS8E
	ckRNaheTIkh/V3cVC0Khkq/liJevDJkFn6x64E88lYiHyb4eeMIdXa0B8gmvv4kD7eIzWd8TQjatp
	1QWz8STw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQb7-0000000AyvU-2kZk;
	Wed, 22 Jul 2026 06:38:29 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQb4-0000000Ayuv-4Bgw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 06:38:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784702304;
	bh=+zb3qHEfQNdn/VPyYyBL6pEsHOl2hhCoI2rgqrXHwIU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=eSe99VQZiVbw4Fq0s58JabWxbarccjIvszDKZhQLLk4Yv3U8Am0+gmICw1uqhhv0Z
	 KnM6wgUNlZ9d9PiqfqSXh1g9Km1CX+mzFtZgu9HSUL9UkzwSlfPQb9eCFD1zHVNQXt
	 93NC8NHw7PC8wQIfOm5iOjGORm4Hj+p/ckpQNSKuDvbYvABav4Ix4MdsxFaDuCIWGP
	 nh/5xBGWW8YceGIEX4AD1lRQeKjmFkx8o2+L2lUHRNZEPwnfw4ZHkOCa9EsDGOBztS
	 TcSoAFEQJNStXvrQJXB6sQe6v7vJew1xaCJgiMEJk3gf6mFoF/boTqiQgEGZtpYAS4
	 6zEWuZRMIe06g==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1FC0465B37;
	Wed, 22 Jul 2026 14:38:24 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Patrick Williams <patrick@stwcx.xyz>, Potin Lai <potin.lai.pt@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Mik Lin <Mik.Lin@quantatw.com>
In-Reply-To: <20260716-upstream-sanmiguel-fix-pwrgd-rmc-n-v1-1-8287b306e02a@gmail.com>
References: <20260716-upstream-sanmiguel-fix-pwrgd-rmc-n-v1-1-8287b306e02a@gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: sanmiguel: fix PWRGD_RMC_N
 active-low hog configuration
Message-Id: <178470230401.777395.14157899070923881410.b4-ty@b4>
Date: Wed, 22 Jul 2026 16:08:24 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_233827_254426_2E37540E 
X-CRM114-Status: UNSURE (   8.00  )
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

On Thu, 16 Jul 2026 10:31:17 +0800, Potin Lai wrote:
> GPIO 14 on the fio_ioexp (pca9555) controller corresponds to the
> PWRGD_RMC_N signal, which is active-low.
> 
> The pwrgd-rmc-hog node currently specifies output-low for this GPIO
> with GPIO_ACTIVE_LOW flags. Under Linux gpiolib, configuring an
> active-low GPIO hog with output-low sets the logical value to inactive
> (0), causing the subsystem to drive the physical line high.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


