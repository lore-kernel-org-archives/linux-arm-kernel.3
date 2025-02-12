Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DE8C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 18:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=inGRSlbH/WmsvVKxrUYZ/331rEtbmKmWDXpqasLyr6g=; b=NlWRSxPRSR4Xfs
	XWWx1G6XaSuPl3Mz2jKVIf7BxYDMK4iWotJB12sb0h5Mzpqiwfa8VgC3iojq7MtD1d0ZLZI/ZhAC0
	gNtgc+kzHomcvoxO5yruCdM40jhlnxZh0+6RrCF3upjirqNb7E37DDTv13MuIGyqAOpPm2vtVTHck
	55taoQ31xnRUGaFMrBZUFnCJWPKyO9LBG6n2sO0/EwUnf7PejU93pImzlXGoiAmTDUJ+KJRg0NHOe
	9cRI+jS7IdA9TKwZgWzllLxgDnAU/e2eYv3iaxdihp4gvFsbk0bx/yQO74ewXdEOX+JJN2MA5Ootl
	Lv5ofuOK5UEMNqgMudvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiH7O-00000008Q84-1hOp;
	Wed, 12 Feb 2025 18:05:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiH5x-00000008PuW-0rst;
	Wed, 12 Feb 2025 18:04:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E8DFC5C611E;
	Wed, 12 Feb 2025 18:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC491C4CEE2;
	Wed, 12 Feb 2025 18:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739383460;
	bh=WS+R/MsKFg8gFxvOplGbhuZvpxRikRAbX5wBQj9Cnjk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ad6Y00Hxis2VHNE+cLwsU1pGxEAgDcklFFThTU3lTKWlQEkO53CLvt6/yvyOE9vL1
	 xPzPSsqbISnQ/0bjC3XVm4y16gziqZuV0252ZL8tUB8HBB9bgzmE/ytl350C6b3ryJ
	 aq5XDJSj1CM5tQEsXNopN28X6to4bUQbLDi1xWzjlfcE8nK8qvACpcLCEaEEoxLS4k
	 qzUZ5NBOCtLUhAIlY/p04DuY205BpRJtzUOJhjJlN2QV3TZ6nmcwAWYWS3psncyobs
	 +V3Fe1KvyOeYSpLD1CIMHja55bMZ3J2U8nSHz6yzM29U5zArLuTkRuEYHMz0uVThus
	 aNnePWVa/TpAA==
Date: Wed, 12 Feb 2025 12:04:16 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v5 -next 00/11] Add PCIe support for bcm2712
Message-ID: <20250212180416.GA86064@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a74f5917-af94-42a1-9a7a-dd449d34dbfc@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_100421_288870_99FE9913 
X-CRM114-Status: UNSURE (   8.47  )
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

On Tue, Feb 11, 2025 at 03:30:22PM +0200, Stanimir Varbanov wrote:
> Hi Bjorn,
> 
> Do I need to send a new version with the collected Acked/Reviewed tags?

No need to resend unless you change the code.

Bjorn

