Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BEFE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 13:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HD5+UGwPhPjBTRomgMW1WMHP3Ot9+Wi9ed4vzq6Oo4=; b=t19CCsnq+YSN6bJV4nEf7Nst5W
	JixC+vbPRcka4x+MHJcCXnk45DQfUGsd31ff1xc2UdB2Mzslc2eEoxZ26VheNm3v0NxLodYvVt5J4
	ocotVLoJ4Rg6osAIng/Lzf9+tmYnDCR09hw0Stszz6QKINI9Jf1HZwxsVpc7ott8SbHrnu5PpjrYa
	QUU4l1eQO1A13eBD4CUiFHHXrDFKRmI162BxLQow3IrKDxv7Sri8MEPdLLbk8sxOx8Hbl1XNGu3nT
	rueJBpRMhRMPfgqNTrZTPO9XsLFo+CLc9qfmS+k4/FRZ3mQKbTvCP6ccR4L9fMTYjYvoOym1LJYQL
	cRAkxJJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXIu-0000000DVZL-3qo5;
	Tue, 17 Dec 2024 13:08:00 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXHM-0000000DVGB-1kC6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 13:06:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FC6C40009;
	Tue, 17 Dec 2024 13:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734440781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0HD5+UGwPhPjBTRomgMW1WMHP3Ot9+Wi9ed4vzq6Oo4=;
	b=oRbaBnyXDJFZn1UBMCOUL8udFQoFdfQ/7OLxQ6Av1DNPffbCo2AS9KhCVm6RuJK2VKy57R
	pqSivEIciVVKEoGDz+rJaFC1c/DgDUqoPkhccB75V2bHN+Cz6ZNCGJgYrEH5MqdEQQMNGq
	bOUb1h/rlXCZF6q6JGvMm8Q6gbCP5IN3aIKU7I2XqNDBC2ixLOpR3bJRlnB8GCdAPNs5Eo
	cchPboxxjf9s5kcAk8gziPNqTJMltTjYcM46078lyB5ZfMVeR8vpodyQ5KoPMhIc2TJc9g
	lzulpSxwHX4RS/4eMQUXRL3p0OwvGXsmv+xCMy5+ir1PVHcIYzsKazRIQG4fMQ==
Date: Tue, 17 Dec 2024 14:06:18 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/5] net: phylink: add support for PCS
 supported_interfaces bitmap
Message-ID: <20241217140618.0debd644@fedora.home>
In-Reply-To: <E1tMBR5-006vaS-Ou@rmk-PC.armlinux.org.uk>
References: <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
	<E1tMBR5-006vaS-Ou@rmk-PC.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_050624_589786_26977F70 
X-CRM114-Status: GOOD (  10.71  )
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

Hi Russell,

On Fri, 13 Dec 2024 19:34:51 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Add support for the PCS to specify which interfaces it supports, which
> can be used by MAC drivers to build the main supported_interfaces
> bitmap. Phylink also validates that the PCS returned by the MAC driver
> supports the interface that the MAC was asked for.
> 
> An empty supported_interfaces bitmap from the PCS indicates that it
> does not provide this information, and we handle that appropriately.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks,

Maxime

