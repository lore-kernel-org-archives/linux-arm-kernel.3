Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0357BE6BF31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 17:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZzFWgEUHdwooMtG4TuZHw8S0x/mQPwXY7nuasg2QDI=; b=Wzy/3JrMNMq7r+BK/Ld0FLXB1R
	WWoHR/Nwfq9zd/dPXp5SdUuBFHYo1u2T6aADDMKz06nFOcHgP0EwTGtVbAKyt1OriMSAZ+RUEemWb
	AVzAt4DY2qzV0674GYs3m1gOs59Q+qQrTtj6zWUYWonvbPBqz+HntEBMxC42z3OOXtCd1ACtZxyeR
	gqZEAs0df7dNajpFU/PCYmzGF56QBrh46pE1YCYC3EEDvnu6ZN2MaPRW5QCUIU49zCs73HQcfO/RX
	dNYiMTbGsVonVlFGSpTJUeoSllfiP0LGa2UJDKDf6SRqEnmX3bBzqBdCqcidJyk7vidbzmtJrQ/XZ
	Y3rYVHEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsJO-00000001lcb-2C7l;
	Fri, 30 Jan 2026 17:29:38 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsJL-00000001lbv-07L6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 17:29:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A2C504E42358;
	Fri, 30 Jan 2026 17:29:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A8BF6075A;
	Fri, 30 Jan 2026 17:29:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97C22119A8875;
	Fri, 30 Jan 2026 18:29:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769794168; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=BZzFWgEUHdwooMtG4TuZHw8S0x/mQPwXY7nuasg2QDI=;
	b=XVPFzqWE/z0q/vA8cfnLwOCF3GNHBAMElHHkvpKxj31B01szcfHhv/MKqqagCBZ8AupfGP
	iJnYgAFQPPqjQz2LP7F9tPLSXhQ/rveMFz5B1N3+K0PJTHrk2FIjdlIEuMWQ6nEoy35VIu
	fGu7Mpkvbtq2hLUetqyQN58STUftYZ1PBBZ+NbZsE2+H+nXU6U4z6X2rRJZh7AbmyIuUWv
	jcKaGmFoFFRS9yFM7L7bkbIVuuA5wPQmKwXIPbUig+QD8Q6t9z6n0nK0TnDyodFKE1FDdk
	EgQqGJaF7h7V+QOEE/qTXrfJRJrssg1ZsYssc42w0PaeeYTQTsBNqNZgyGvmjg==
Message-ID: <9dfdeee0-7758-439b-a2a5-a7f243427cf4@bootlin.com>
Date: Fri, 30 Jan 2026 18:29:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/3] net: stmmac: clear half-duplex caps where
 unsupported
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aXyRlFw7ZuhRPiKo@shell.armlinux.org.uk>
 <E1vlmOQ-00000006zuz-0ffN@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vlmOQ-00000006zuz-0ffN@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_092935_224628_BA18F574 
X-CRM114-Status: GOOD (  10.36  )
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

On 30/01/2026 12:10, Russell King (Oracle) wrote:
> Where a core supports hardware features, but does not indicate support
> for half-duplex, clear phylink's half-duplex 1G, 100M and 10M
> capability bits to disallow half-duplex operation and advertisement of
> these link modes.
> 
> This will avoid the need for special code in the PCS driver to do this
> based on the ESTATUS register bits, as the support in the PCS is
> dependent on the same synthesis choice as the MAC core.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Gave it a quick test on socfpga, as this impacts all variants,
and we seem to be good so,

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime



