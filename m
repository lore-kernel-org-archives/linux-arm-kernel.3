Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F379EE6748F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 23:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2N3NKmH49hjRiqnrVgcxvKSV4bVv8lUQzTG26S2d3Y=; b=PLPPFTHdOhotMvZQL9KuBYnqZA
	MF+pBKqej67vl+SY5AJGxAeRM+uWDiQpnZv+1QS0wf/jJsSLtnjFBMZuXpsh5Df81tSwBDnnWYe2y
	nle3DbltaH2Pyyu6KBTLmyITCvKwlOjLmedMBxwgV00L3mWaNF9LAeiX86MV6i1KfZ/6ANO+RMtD2
	EZGqQEPBHsL2yxuKksKZLYzHrvXaCchEzO3A2lK2MqcD56NFtyvBigv5QnFS/b75Obl0nCgzXo2Qm
	b3jecsF6QjsbtEmWXGGs2euO2oPift3ybiYrFrywxRiamwi6ffbuYLArQhmZDPMzHcak5hrBbEwmE
	yeFtRprQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6eRj-00000005ApY-0hYu;
	Thu, 31 Oct 2024 23:19:19 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6eQ0-00000005ARn-3bpV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 23:17:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 038AE20002;
	Thu, 31 Oct 2024 23:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730416650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q2N3NKmH49hjRiqnrVgcxvKSV4bVv8lUQzTG26S2d3Y=;
	b=bn2fG+8+pXP2OIG5T46ZntHVHumfx4xU2hVMnhQuJ0sX3uPBQlHbiUl8Tr+WHUjbwvYqPP
	sx+mKsfBDuoCjVzFeyumLm7B+ttWP5/ZzPeTO9f1D3KWdkJ1RehsIGLwytozpfoGFnZZ8j
	atWicNRrYbfkVY+jje2eoTo3oSby7g4dOgJnU6LBHvhPIm5awdpcj0Gl9c4erLIIj4VrK1
	gQMvCk0NZ3DZ4+aE98JcxX5+5ws5Pju+ox4zxRNI62UNW/chM/4iKZPCBV+rjfO3M5UVAd
	4qaWLxpxrLJY/c+Cx95/wPVuJbFtPjnCbrlpcCJwCS1k05muZTYVjEiST3utQg==
Date: Fri, 1 Nov 2024 00:17:28 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	magnus.damm@gmail.com, p.zabel@pengutronix.de,
	Claudiu <claudiu.beznea@tuxon.dev>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: (subset) [PATCH v5 00/10] Add RTC support for the Renesas RZ/G3S
 SoC
Message-ID: <173041660392.2394403.11154347678487291985.b4-ty@bootlin.com>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_161733_056996_B70C16EB 
X-CRM114-Status: GOOD (  10.69  )
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

On Wed, 30 Oct 2024 13:01:10 +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Hi,
> 
> On the Renesas RZ/G3S SoC the RTC clock is provided by the VBATTB
> IP. A 32 KHz crystall oscillator could be connected to the VBATTB
> input pins. The logic to control this clock (and pass it to RTC)
> is inside the VBATTB IP. For this, the clk-vbattb driver was added
> (patches 01-03/12).
> 
> [...]

Applied, thanks!

[04/10] dt-bindings: rtc: renesas,rzg3s-rtc: Document the Renesas RTCA-3 IP
        https://git.kernel.org/abelloni/c/71c61a45c951
[05/10] rtc: renesas-rtca3: Add driver for RTCA-3 available on Renesas RZ/G3S SoC
        https://git.kernel.org/abelloni/c/d4488377609e

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

