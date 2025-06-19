Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE79EC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1uxxxZkeo3NrWAJN19Hdj2JiSWPWIAI41fo5h8wydQ=; b=zIgP9cegNpyydFSur3D3do1raL
	oDbtp8/L9wuWfoDnDPSVemppzESl3JKatkPv54o5zDPWOsMSMGYBdmd45xRs+q9VsvNGMLBcNVjLH
	YcELS39DhIJdHoG78mGV40pGY5y4ThrvEMXaN/lZx5sRssGGw674sUlO1l5IgkZBXs99ZyGJFMRxO
	Q/E2UyIWLar+2uJT54+RQD5E8WLPhnZ9m8X+eKacH1X3lth7rbwnstOOVbermPn+wB2DrVH36KkeA
	a+CsiBH/XJMcS/XseOfMAoSj2AHdSSbZTStac06Tgv29yRzf0289DoxT6ttIArydK7ByMoz+63G7A
	81MX53Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHSz-0000000DTrJ-0mdd;
	Thu, 19 Jun 2025 15:46:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDmQ-0000000Cwun-0NR8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 11:50:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 46E44A54440;
	Thu, 19 Jun 2025 11:50:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B52C4CEEA;
	Thu, 19 Jun 2025 11:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750333805;
	bh=xcXMxMStMR8/rb3GKA1jioXnMSxQsU2Ozqjqe/yF1w4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iJBUADiP0/X9+azGm/g0vceCBNhs6nGkYRctOjZ0QujbBcVw07QEuw90FiyNinK/F
	 NfZ37rkV0sUP/G0oblx/GVCfEyXj/nhORcmp5qDKSX0KH3ot5K7K59vws1ab9u98Lq
	 EJoWZgGz25N5q51nkLZxnbG4upiC8/EdjQ/1y/YDTUhEIrC8aEDgvYIxCJ8RpieFcI
	 rVHrJS0yuA3ss51VZzsJ4cSoJHpoOVA5SxIfiC93NY9Py8Y8VzT/lpbSGO9BzGefL0
	 Vz9D/grzsbiLENfOJmkZpKpjPCCVMTxRsZEVtE/ahvL6O4duPDOE61p95G5saaxSRZ
	 FiFGUqm7XKKiQ==
Date: Thu, 19 Jun 2025 12:49:58 +0100
From: Lee Jones <lee@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Marc Zyngier <maz@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v7 05/10] mfd: Add Apple Silicon System Management
 Controller
Message-ID: <20250619114958.GJ587864@google.com>
References: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
 <20250610-smc-6-15-v7-5-556cafd771d3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610-smc-6-15-v7-5-556cafd771d3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_045006_194370_C522DCCE 
X-CRM114-Status: GOOD (  14.80  )
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

On Tue, 10 Jun 2025, Sven Peter wrote:

> The System Management Controller (SMC) on Apple Silicon machines is a
> piece of hardware that exposes various functionalities such as
> temperature sensors, voltage/power meters, shutdown/reboot handling,
> GPIOs and more.
> 
> Communication happens via a shared mailbox using the RTKit protocol
> which is also used for other co-processors. The SMC protocol then allows
> reading and writing many different keys which implement the various
> features. The MFD core device handles this protocol and exposes it
> to the sub-devices.
> 
> Some of the sub-devices are potentially also useful on pre-M1 Apple
> machines and support for SMCs on these machines can be added at a later
> time.
> 
> Co-developed-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  MAINTAINERS                |   2 +
>  drivers/mfd/Kconfig        |  18 ++
>  drivers/mfd/Makefile       |   1 +
>  drivers/mfd/macsmc.c       | 498 +++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/macsmc.h | 279 +++++++++++++++++++++++++
>  5 files changed, 798 insertions(+)

This is ready.  Let me know when you have all of the other driver/* Acks.

-- 
Lee Jones [李琼斯]

