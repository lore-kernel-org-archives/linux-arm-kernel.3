Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CDFCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 23:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvYAnP+tfAbV4eOZWpVc5xOr8eoezANtw8MTL1UP1M8=; b=j5ziGNHit0Yv1El7CDxfb/T66R
	juO+OaP66ICdmemLrlz7D1iLAHa9HEMBHr6kf6MMAoayg/ER4W26B9zWiGYIrovLXgzK9lUWvg+JH
	76SD6TULziOkd+b6CTDEfDaCJoGaBKzCWZ88pzfB7oA2DVEeWi+4D2PxzC9pFsY5MXwvBFEwrr68S
	SFhA2cQWyG7zjr+Hcgz4VkhES+maznOlzlv/FRSj5FdWJG+8GCC/zqYXNMY7e/OGsy2vH3J5+oaDA
	DBGZ4B9gQJu+vRl3xMWuAXlWv9ZoIrtQkopzXeDtZS7jmy3fckJa/SQUZc9nAo+i9BjUc7bbY2Go8
	3e3quLLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIyY-000000041t1-2l0E;
	Wed, 13 May 2026 23:26:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIyX-000000041st-3A44
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 23:26:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C591B60052;
	Wed, 13 May 2026 23:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC0CEC19425;
	Wed, 13 May 2026 23:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778714808;
	bh=q3i21lJvhVy9opCji1T4ar4kNcI5PZwWn8BflTqdQ3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gzRCoaHwgfpMxXtV5i7hcsOfWpF4L1ft/Q9VIAyK5ZJzkTiS454hh2sAIGpggmoIS
	 B9j0knU5zEFe/qnB7P0JctaEghBvxW6W76RHLeddbrQ1CdZ6VYJDEjfnHpsZ/Qa8Th
	 jKP3jJrqVwoINxJbxqY10pEHStpSlELHor+xoC79qPymPpXbzTaIZB0WXChSoYmsPY
	 Lt10Kj5huXqpAvdKD88ox8f7uLKY9cVwUHH+ie6+argLgDZZDAugk3f902RWGX1eAN
	 dTnan5PrrRuN4doIBw1aRAoURp3Z/3JPBI3LxwY4jeWjo7vesG0WPAFL6SoEkvC7bB
	 1e87ClxSOCDqw==
Date: Wed, 13 May 2026 18:26:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Paul Barker <paul.barker@sancloud.com>, Grant Feng <von81@163.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Robert Marko <robert.marko@sartura.hr>, Lee Jones <lee@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Enric Balletbo i Serra <eballetbo@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Andre Przywara <andre.przywara@arm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
	Baruch Siach <baruch@tkos.co.il>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: leds: issi,is31fl319x: Add description
 for the shutdown-gpios property
Message-ID: <177871479468.2298897.389759358706715014.robh@kernel.org>
References: <20260508152435.21389-1-jerrysteve1101@gmail.com>
 <20260508152435.21389-2-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508152435.21389-2-jerrysteve1101@gmail.com>
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


On Fri, 08 May 2026 23:24:18 +0800, Jun Yan wrote:
> The IS31FL319X series features an SDB shutdown pin.
> Driving it low (active low) places the chip into hardware shutdown
> mode for power saving, while all register contents are preserved
> and registers are not reset.
> 
> Add description for the shutdown down (SDB) pin and fix the example
> device tree binding.
> 
> Fixes: dbc801b472c1 ("dt-bindings: leds: Convert is31fl319x to dtschema")
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  .../devicetree/bindings/leds/issi,is31fl319x.yaml        | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


