Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE0BC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2h0zvhiWJL99Ql/LzjPEa4TBK4rGTdRlw5CNE1+M5o=; b=aI3ZidVFxR9fWZp/MXXK9ldQ3E
	MTUIPEG2L73tX0xewR+hUaGOb6Bh4MN9z8e3WLAwV3hSZGqIHMUYvNSIn+DihhAJWF9UDUp6oaCBk
	Glscq5NOSQhLt0vXPtPAD4zg6b1LHt5STpT28LqOhTY5TA7haCQtsFUFtNnqreju1cq5i4dc2gSAM
	w6yA6QleoO2aqiD0T4Fp/8oYGk0vIFBs7H3ddXquVSkaL7zDqYN22fr66NnNkO3OqNUFu8IU40vao
	7NcCrK5L5lQXR1Vobq3j5w4dE+NTgpPUNBld1EPQ8sMytItUjYCcp5447HvOZVJaqVs7JaFXubBbp
	gZJbY3uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojSp-00000005bIX-2DRl;
	Tue, 28 Jul 2026 15:11:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojSn-00000005bIG-1a2y;
	Tue, 28 Jul 2026 15:11:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BC2FA42AA4;
	Tue, 28 Jul 2026 15:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7263F1F000E9;
	Tue, 28 Jul 2026 15:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785251484;
	bh=P2h0zvhiWJL99Ql/LzjPEa4TBK4rGTdRlw5CNE1+M5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EVhR5HlvuT1lZzNuSDVgOjAPEYxN1UXWOjDHMF42Al88ql5VBXHTz0zc/I1+qKmA1
	 3TCF7yGMwxeewqJ6xW1vr+9JdpBYj8LfP6UxPQe2eOxOWRhbOtxsRwOxRvI2ewRJeH
	 d59QIYqyLJg0iNCBH26m5PaV4O1hiXkKjh0Hr1cRzfdyU3be/BCsdycZsOguWMpQNL
	 YmD+A3WKNSNcY9Fpm++V7tz8VB6duU88XPXLV55UnQWe9EdRVYWEBrkOvLhir+6m5V
	 avDAn1aZWF4Y1XE4DuxO2tKudWhej7/euP+WBRN+liVa9XRbMqsAYIFYjPVAnHYNm7
	 G8GpR9d8irT7A==
Date: Tue, 28 Jul 2026 17:11:20 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Swark Yang <syang@axiado.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jan Kotas <jank@cadence.com>, 
	Michal Simek <michal.simek@amd.com>, =?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Boris Brezillon <bbrezillon@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Mathias Nyman <mathias.nyman@intel.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-i3c@lists.infradead.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 3/8] dt-bindings: i2c: cdns: add Axiado AX3005 I2C
 variant
Message-ID: <amjGh1ZQXTGXFv7q@zenone.zhora.eu>
References: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
 <20260716-upstream-axiado-ax3005-upstream-v3-3-c429095143ec@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-upstream-axiado-ax3005-upstream-v3-3-c429095143ec@axiado.com>
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

Hi Swark,

On Thu, Jul 16, 2026 at 08:51:10PM -0700, Swark Yang wrote:
> Add binding for Axiado AX3005 I2C controller. So far, no changes
> are known, so it can fall back to the cdns,i2c-r1p14 compatible.
> 
> Signed-off-by: Swark Yang <syang@axiado.com>

merged to i2c/i2c.

Thanks,
Andi

