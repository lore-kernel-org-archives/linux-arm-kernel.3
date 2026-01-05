Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96383C79FA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 17:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XcRilEYH2bfnmuZ1zIL53k3/Kpsk0gDXaMn2E8c+4cM=; b=uKBg3op6EsKqjUT7w/usnlY1tL
	Hso1Q9jzObnzDKmJzrFefze4tbJzqpA/BibI1lvDr9XywcuyZ6MW2nqyugojidx4/EPsRisob6ggm
	Lr2SzE5dDlCwl3jbDH4pBIxEZZroax51MHEIK/s87AS1IIUSnKXeis5l0cK3iENMtadpVDpmGy1Tx
	ClafwPLf9SZpQEkJ+QEqh0vhDLqgs/C4WWo5DDE+vqkPXJg4c3kj45Vq8plBv9B0ab1BLwRSpkIvy
	qnB6neluog699puIQmPorkkq4Oh8uoV6yk4JI++/uiIMyUZQii0iC9f03dFBWSFtTLvjcBlxwOWMt
	Z8/0+otA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoTL-0000000BqOq-0Mqu;
	Mon, 05 Jan 2026 17:34:27 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoTH-0000000BqOE-3zOo;
	Mon, 05 Jan 2026 17:34:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E4EE71A2666;
	Mon,  5 Jan 2026 17:34:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B220A60726;
	Mon,  5 Jan 2026 17:34:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4A031103C81E3;
	Mon,  5 Jan 2026 18:34:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767634459; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XcRilEYH2bfnmuZ1zIL53k3/Kpsk0gDXaMn2E8c+4cM=;
	b=bH6rlJiZ7gEgXbfiaCigmNEiRt4RliIin4nbRgNQM9xaoFaJIiaBILIgaOVIBqIK01diFR
	lOKGmw34tDDxAgYVi7xSz7RANxUgUcmFFkp20oavk9pMYWl9jGfGSCaWpVlEVupPmvhPVG
	n6wtaCTRADILAiPvSCgBUMkIdjdrCR/PWKhQlsa6hXzCTGa/SR8F0H9g2ncW7r/6rvhEE1
	5aGqEIC7T5dj0+WcCZZLnijJAIumDveA/UwYQeHZpeYLqGN16XEhr98lM4cmnGAYS7qqi7
	guyeI2lA19oBc6GUBKL9aI4LqUERdvVhHBfJaiwGzt/X/5Oxi3GNQiDwnXxePA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Jan 2026 18:34:14 +0100
Message-Id: <DFGU4A5WRAFB.2PVUYY20ACOS7@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH RESEND] thermal: broadcom: Use clamp to simplify
 bcm2835_thermal_temp2adc
Cc: <linux-pm@vger.kernel.org>, <linux-rpi-kernel@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Thorsten Blum" <thorsten.blum@linux.dev>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Daniel Lezcano" <daniel.lezcano@linaro.org>, "Zhang
 Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>, "Florian
 Fainelli" <florian.fainelli@broadcom.com>, "Broadcom internal kernel review
 list" <bcm-kernel-feedback-list@broadcom.com>, "Ray Jui"
 <rjui@broadcom.com>, "Scott Branden" <sbranden@broadcom.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>
X-Mailer: aerc 0.20.1
References: <20260105121308.1761-1-thorsten.blum@linux.dev>
In-Reply-To: <20260105121308.1761-1-thorsten.blum@linux.dev>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_093424_124757_DA7A5A0B 
X-CRM114-Status: UNSURE (   4.12  )
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

On Mon Jan 5, 2026 at 1:13 PM CET, Thorsten Blum wrote:
> Use clamp() to simplify bcm2835_thermal_temp2adc() and improve its
> readability. Explicitly cast BIT() to int to prevent a signedness error.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

