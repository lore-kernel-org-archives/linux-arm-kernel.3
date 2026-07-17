Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD93C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B1150FEolT4Sj5jskF2xoZNy5VPqKCLr3UsGC+Io9tQ=; b=y5vl0hCoGDrXup/2AuLw17Rg2P
	jMgPrMlQkWuKX3upl6tGeeG4ssZo4vAQS0j2Y3Q5JL4VMBFVpr6854c0uXZdvXRwyjNZTk56x211f
	boayv8GH7hD5P3CsMEbtfBkyWIZdI85lzoMz0SlP2Bn2umKnHb+Wp9Cot9Cf97wsABFDDNuFe9rTv
	qM9gGdUp5LrdDuFe9r/W8pxULLuIKBLirqyOqSGSZCTxcjEb2GISUGg8chcWqlM3vJKgmxeguZpY3
	uPucgHbgRvgAHmoZMHcvlMHnNxyLN65qQPhVzkWm3jhBJsCuctYfa2gszR//LCQwbqR0yR2/PvOZ8
	y6mJj1Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdzL-00000001eBQ-1r16;
	Fri, 17 Jul 2026 08:32:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdzK-00000001eB0-0EhB;
	Fri, 17 Jul 2026 08:32:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8278E60A61;
	Fri, 17 Jul 2026 08:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A01F1F000E9;
	Fri, 17 Jul 2026 08:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784277125;
	bh=B1150FEolT4Sj5jskF2xoZNy5VPqKCLr3UsGC+Io9tQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K5QN8LUtjGqpCo64YJ1WWJRUe8xPvGTAhqiDiTvkjbud+ZFKKwzL4WUGpgiczOQY3
	 3CKueGy35nboOLYF0ZP/GGT2ZiR2ja6UurRv1N1ggTYhUoQRJiAwgIq87MiXX8C6x8
	 XhI1Jtmx/ICtI/OIE9s687KDlWvo0DRIKYEFvCz9Xfto6O2NnwTDhREzihnPze8n3f
	 V5H5OQT2hsJBszLIMSXg+VrZyGHuNAKe6gXRXe4X4af0JPYXvA7MEVqQoS45FBq+zU
	 pVCeiMnj2RL45e1lSU2+zRldbqSj6KG3n/Z5vBLoU1RP8r6HxkMJW3p1EZLb5WsmHa
	 ELxeMvzW4WR/w==
Date: Fri, 17 Jul 2026 10:32:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swark Yang <syang@axiado.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jan Kotas <jank@cadence.com>, 
	Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-i3c@lists.infradead.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 3/8] dt-bindings: i2c: cdns: add Axiado AX3005 I2C
 variant
Message-ID: <20260717-skilled-private-leech-e8c3be@quoll>
References: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
 <20260716-upstream-axiado-ax3005-upstream-v3-3-c429095143ec@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Thu, Jul 16, 2026 at 08:51:10PM -0700, Swark Yang wrote:
> Add binding for Axiado AX3005 I2C controller. So far, no changes
> are known, so it can fall back to the cdns,i2c-r1p14 compatible.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


