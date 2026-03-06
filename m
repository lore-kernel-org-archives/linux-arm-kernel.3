Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA300F0182F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 13:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gLX/vLGdWOlScvV94mBZQHZ++2FDe6d8l62ZQIqal5o=; b=FNcGgtp3EE0OLmDeAhV49lzCBF
	QjgOS4EUf5gNB/lFkdxA5ksjoTA5FdOnJPobi6afP23R5jIbsQkarKAFhkfQVw00hmAoIOzhe9iWk
	oJYjoGMV9lZaVxaNtyLvfIDhX3Pt7nwAlAeLYw07YPd4l25iGYXwiP/WSR1BvcQDWZjL7gedNK2sf
	NooCzNJ+kwvXEi4jXA3K2V59jrL+59kNgNbnIm9iRaOcJUaVSY2oQk2jg3QyyNUMS69gKngTeXaTN
	k2oR/Sxc5xbMNOBA2CpjDNjr1AZK9M+cpnzWQeYUUFEsc81Mab2aHqCnPSykaMBAocx5VnOQn2/1r
	5Y6xqy3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVGB-00000003nik-02TC;
	Fri, 06 Mar 2026 13:30:31 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVG7-00000003nhc-0XsG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 13:30:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1273B1A2D44;
	Fri,  6 Mar 2026 13:30:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D978B5FF92;
	Fri,  6 Mar 2026 13:30:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83118103699F2;
	Fri,  6 Mar 2026 14:30:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772803820; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=gLX/vLGdWOlScvV94mBZQHZ++2FDe6d8l62ZQIqal5o=;
	b=UltR2bA6NlebUf4a8560wOZ2sCNSLRI2hwC35B7QGMOuDXtMFMOj92MOCEQL5ArIj+eU2T
	Um9Ke1hmuZ7eCVJNYIuqidEEMkJUjWWmPPc1h2KGbogfMsSAtdeJ2M8fcWmFDCPEmDmt9/
	WHXVn6EgXvVVn/JhWfbkwdFiKEX002Mnas0hC7Xhq5W7XkxMPDqpj3ACPFnnjX8jt0RA2H
	WtAdm8oRtMMuN3VzoUYRWtqp3SQycrp85kc2l8Mn6tXjTUXUFy7Z6M5f5cOmLHrX90BjMJ
	9QbQae0Yurqf2N+8lAy+/oE8+WTTkEYJJKzPfCQWwhZMpCYHwbXjw9i/o8k4YA==
Message-ID: <690fc924-8605-45f7-810a-4c8e58cf4db0@bootlin.com>
Date: Fri, 6 Mar 2026 14:30:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 4/8] net: stmmac: mdio: convert field prep to
 use field_prep()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Samuel Holland <samuel@sholland.org>
References: <aald--qJquWGIvmO@shell.armlinux.org.uk>
 <E1vy6AE-0000000Btwv-1LM4@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vy6AE-0000000Btwv-1LM4@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_053027_665545_1623D94F 
X-CRM114-Status: UNSURE (   6.81  )
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

On 05/03/2026 11:42, Russell King (Oracle) wrote:
> Convert the MDIO field preparation to use field_prep(), which removes
> the need to store separate mask and shifts. Also convert the clk_csr
> value using __ffs() to do the shift as we need to detect overflows
> for this.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


