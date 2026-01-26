Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B9FD13C0D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 13:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4VpehwRlJ7i5t1l2Yl9R834m3oPT3yev9rVS4TQ1wVY=; b=ayco5cW2IAbloeyLxT9sfhHCWi
	1czzVOQAMXQwYxrSvh7hNHTAlrqqN96WUtkHuxz3/dVxa8wQO5CGMw5kxXM3YJfKF6K1SQqvX+Ov3
	G4zxPdsyEAk58tYQumV+Le8MQ3YTgikiMJv950gDuG39ZB97tRaMUMKLVA7juuef8+OnxHcNur+p/
	yVy2KoRH1hlXLy6QoMSnm2ROGfN4fDtwD0kcs0E5fLeWfpUkFwiITtKqRiQf+KPToHX8wxW95bIvf
	qJMFMR2MEu2/KwU+PehkmQvC1eaE6L2dXfNr8omyxb1f5SwwcTjcTPMI9yZKY828MPtGqJRGg46tL
	3/jPi05A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkMeu-0000000CcdI-2daZ;
	Mon, 26 Jan 2026 13:29:36 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkMep-0000000Ccc8-40mO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 13:29:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4AD571A2A49;
	Mon, 26 Jan 2026 13:29:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 150F460717;
	Mon, 26 Jan 2026 13:29:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 99E0E119A8633;
	Mon, 26 Jan 2026 14:29:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769434166; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=4VpehwRlJ7i5t1l2Yl9R834m3oPT3yev9rVS4TQ1wVY=;
	b=BCrSE+mwhylQ4tQixlFfLMNCHR1HqfQYOItuKPvQ6/aoZHerpdcVoSB7In1NJ5PwEqF5kM
	irzRf74H31TNzv3Dyj3h7OlEmNZJUVjQUUhru8R1ff2RPeqJGgi8gnt9PkNMTXXUKq/k+Y
	DlzUB+84WjuXD4FN6wGA7IwcLNav2zCTomQZNN75hCIiWBBzZc/dtSls6bNK+hDxUGcDkp
	5rLG/zkVRryOwJ9NSRIri6OQ8llqfnNXCmbfz3K+MiooPSWiRR+e9iZZIhRt93ZDxZlDXA
	T62L6mnYQ4tO7Amw1WOFEWb04bfT1scWymEKbqOvFPiaHJGhS6TPLuFUFV15Nw==
Message-ID: <2ce008fd-cb9b-4f5d-bdb0-cccb1f09eae8@bootlin.com>
Date: Mon, 26 Jan 2026 14:29:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: don't pass ioaddr to
 fix_soc_reset() method
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
References: <E1vkLmM-00000005vE1-0nop@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vkLmM-00000005vE1-0nop@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_052932_489765_AD9483E9 
X-CRM114-Status: UNSURE (   7.14  )
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

Hi,

On 26/01/2026 13:33, Russell King (Oracle) wrote:
> As the stmmac_priv struct is passed to the fix_soc_reset() method which
> has the ioaddr, there is no need to pass ioaddr separately. Pass just
> the stmmac_priv struct. Fix up the glues that use it.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

