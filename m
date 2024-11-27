Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A016D6ACDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 14:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fVpfE1DT7WKEEdAdua79wEXCVTG1srLmglyWX6/q1fo=; b=uhaoBeuquA7mcVWm2LyTdKqxJz
	/ymeUX72pQNmiW+S15yzPV3sBwTqUb+IpBooWdS3e9+7doDjVgOgEM8FkxIIEXub2RGA4aBvXz91p
	oJIjhkAHuWNxhjU170NUjGgodeTMy8OVsK1+dbCRw3ienU/Agu3o4tp8qXsrxh6GdFC+ZxOUGhtll
	FPHjpWoLca44y+TtITelPo/wEOpzOGjSD74Bl7qX/jO1G7sgbWI6GGKRdAkQLvNSfbNAC1nPuHwP/
	MzctuD5r6kZ0iKPS++6lfkCCylJgsiCrp3H3L/l6k57fAY3zfbsTjJUagiKSl9gOs02VvI0YKbA21
	KDMhLHsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIjy-0000000DLRd-3l7v;
	Wed, 27 Nov 2024 14:10:02 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIj0-0000000DLMG-13CE;
	Wed, 27 Nov 2024 14:09:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60A50E0003;
	Wed, 27 Nov 2024 14:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732716536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fVpfE1DT7WKEEdAdua79wEXCVTG1srLmglyWX6/q1fo=;
	b=V0m3y3rQ21r/yw6cqjlYOWFOnXMUo+QMtVx/LlHTBpRZ4b1Fa887ZIv4FbiwotcfJ//V+c
	aQ0XkMe88euHh+n0M9jT+cODKa8BOoMLjHAj7nDJibFT/0oLWudJfCWxBWrqwKHBjD3MrF
	rXUiqVIHpv4t364D2z5IyU5aIvguihd6Q7t+BzBG81QdeEmlDJStKytDS/B5++6vW5NhWj
	UhjsJcDF/YtJGMAKSMKAU2fYpPxJWAiP18eMegipFSTp0PgAJbWZTnzhDXdv7FkEy6RRZJ
	ngwZog+2QaGkYy9IMoEMQDlR2GpJkLceX8AwbzdgUhTzdb/XkPQDc8IACN2bTw==
Date: Wed, 27 Nov 2024 15:08:53 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexander Couzens <lynxis@fe80.eu>, Andrew Lunn <andrew+netdev@lunn.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Daniel Golle
 <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Ioana Ciornei <ioana.ciornei@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Jose Abreu <Jose.Abreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Marcin Wojtas <marcin.s.wojtas@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>
Subject: Re: [PATCH RFC net-next 12/16] net: pcs: pcs-lynx: implement
 pcs_inband_caps() method
Message-ID: <20241127150853.1f38e829@fedora.home>
In-Reply-To: <E1tFroq-005xQk-SU@rmk-PC.armlinux.org.uk>
References: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
	<E1tFroq-005xQk-SU@rmk-PC.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_060902_429711_3F644001 
X-CRM114-Status: UNSURE (   6.88  )
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

Hello Russell,

On Tue, 26 Nov 2024 09:25:16 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Report the PCS in-band capabilities to phylink for the Lynx PCS.

I'm a bit familiar with Lynx for Altera TSE, so my experience with it
is limited to 1000BaseX/SGMII. I unfortunately no longer have the
hardware to test it.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks,

Maxime

