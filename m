Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94991CCF2D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=io7/1CBGpuEJksfwcZ+XEOWyqPrISU4aqPzE15+/GSY=; b=NIW+a+ujTzSSwWPe2CErckgpsk
	3KCqLzDzhnZtiS3cJ4l03RgLVLbEJ+iApdZezn2PvP0KYSKDUsOjQYpih+qm1SQhjzn2uX5wnuEkY
	Aqup863PpC5A8UnXl+ijKI5jiX12HNXQAFFcw6QDGRtO23gkskA9KWI7oVUp97hvZ4TRpsifCvEhx
	S5p7Xd4U0Xn9yzs6LFk1zxh9st9yM6vNHd99Ng5HQyFKzpx0CTcpNmT7Yb/gtvNjueTLe5Rl+GYmR
	XQi+0dSBxtmhy9NT6gSnMmDRXFUMFaBupE/F6mzL2GYNxh18+drOfGC/HFrAgSMqZdOFCDT+8qJIk
	iOzX7FVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmOJ-00000001l0d-1FN8;
	Mon, 19 Jan 2026 10:21:47 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmOH-00000001kzx-1Ujs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:21:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A87AE1A2941;
	Mon, 19 Jan 2026 10:21:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 788F360731;
	Mon, 19 Jan 2026 10:21:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D7C310B6993C;
	Mon, 19 Jan 2026 11:21:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768818102; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=io7/1CBGpuEJksfwcZ+XEOWyqPrISU4aqPzE15+/GSY=;
	b=Lx/LxEnmn6xez3KdCkr3UsfqmbFYZZYuzGUq47Asl1MAutDbD7JnSvswBbUh9qHB0bIYif
	prLSBcz/d3UArSjqKesJwqFgL+o9k4zrQcyXdHls7Jhc0sZZfOlkqu1Gu36C3vhVlBMSJm
	yslnIS5tEBpYZI2uMorwYIvLPQ/vBo5m/HPtZ4VGMsgzL5FMlGARp7bCYJrdI79alT6y/b
	xG2q3iV5HISuUzXKEr+tcVWaWL8J0Xc8+UzduWVtbfLvty3oFctuFJmfmADN5n5Wf7YpZc
	CzHdptaSEB6AJlnK8iDwHgm9tnSYFtbIaZm2WCsfPYE4XlAiLpnJuzNrpt4R9w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Russell King <linux@armlinux.org.uk>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] at91: Remove of_platform_default_populate() calls
Date: Mon, 19 Jan 2026 11:21:35 +0100
Message-ID: <176881807614.2444994.10707378152162604281.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260105-at91-probe-v3-0-594013ff2965@kernel.org>
References: <20260105-at91-probe-v3-0-594013ff2965@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_022145_519695_CC104624 
X-CRM114-Status: GOOD (  12.41  )
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

On Mon, 05 Jan 2026 15:06:42 -0600, Rob Herring (Arm) wrote:
> This is another attempt at removing of_platform_default_populate() calls
> on at91 platforms. The last attempts were in 2018[1] and 2023[2]. The
> problems reported are PM and NAND failures. Both of these depend on SRAM
> pool which doesn't have any fw_devlink tracking. Also, the PM code is
> not a driver, so fw_devlink wouldn't help. For the NAND driver, we can
> simply defer probe. For the PM init, we can move it to the .late_init
> hook.
> 
> [...]

Applied to nand/next, thanks!

[1/3] mtd: nand: atmel: Defer probe if SRAM is missing

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

