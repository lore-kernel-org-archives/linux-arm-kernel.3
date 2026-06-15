Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83125CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 15:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93S5IJn8Nm38fDgXmSpC8QemVzQ1sjDUuJR7xlPUztY=; b=ChMH3v5zeePtNl9d2CPEoZ1jCb
	a+6+QHSVd2jpVM4P8sG4pkZCVqc85zP1Lf0rjYJBEr+MBDbcmF8R7v8SIhKKf0vNDxtSaPqc8Ool0
	BVFmJK7qAetFOndNmfztyWVYXCBlhDVItIcf7turm1qgtW50uAwuuPSYJcYhEBvLM1/F7YFxgr0oZ
	qwkQnm1F+xNYWVoRfphfIHyOuVwQ7QTLl821UCPXDVW1zHzfjfOh4H9uqYlnwB1fcmfDfd7gJl0k1
	7EyUcT/jvn7fMryaUUJaf7BnrClYlElIuN9XaqNkOYO11XJKDcrHBhLQlCHQ6P5AiqycY2bfnYF1x
	SzLRi5SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ9E5-0000000EVAI-0dzw;
	Mon, 15 Jun 2026 15:27:49 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ9E2-0000000EV9c-10D8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 15:27:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6FDD4C51474;
	Mon, 15 Jun 2026 15:27:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 378B460015;
	Mon, 15 Jun 2026 15:27:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75110106C8297;
	Mon, 15 Jun 2026 17:27:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781537262; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=93S5IJn8Nm38fDgXmSpC8QemVzQ1sjDUuJR7xlPUztY=;
	b=eJqkbjRIok7cjg54WjqMc6fe6G3dz/a0LkNOep2ilTQerWzkrRIgxxZMEeXuBNJq5web0h
	A2M4yefSKsLwn1t9M3LWHFWS342nrWp1I/I+le6oqzVXZwbLxbRWljpwWhXkZt3z9dbbp3
	Y4ID0x3rhrNyTGd8RV+HSFmrEOqKHB7EXbFyyR/3Nm/hV/LQeaufsrgpRp1NVpapIFdIJN
	4ptnQyWdKWKmvviISPPROC4tzfvLfVr1jxsz2p0q+lyMLhAHnUJvWiPmbXknRKRv0pojOg
	3qd6uC0pIgFR1T1Z2qqNnVNoqRsGL4vTTrumHZUfX5YXpUpINApAtumDwT/5bA==
Message-ID: <53f0eca8-05ef-4432-87c7-25bad6252585@bootlin.com>
Date: Mon, 15 Jun 2026 17:27:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix supported_interface
 set after phylink_create
To: Christian Marangi <ansuelsmth@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, Daniel Golle <daniel@makrotopia.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260615151106.15438-1-ansuelsmth@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260615151106.15438-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_082746_476242_FFDE2BE2 
X-CRM114-Status: UNSURE (   9.71  )
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



On 6/15/26 17:11, Christian Marangi wrote:
> Everything configured in phylink_config it's assumed to be set before
> calling phylink_create() to permit correct parsing of all the different
> modes and capabilities.
> 
> Commit 51cf06ddafc9 ("net: ethernet: mtk_eth_soc: add support for MT7988
> internal 2.5G PHY") while introducing support for 2.5G phy for MT7988,
> probably due to an auto-rebase, placed the configuration of the INTERNAL
> interface mode for the supported_interfaces for phylink_config right after
> phylink_create() introducing a possible problem with supported interfaces
> parsing.
> 
> While this doesn't currently create any problem/bug, move setting this bit
> before phylink_create() to prevent any possible regression in future code
> change in phylink core.

Agreed

> 
> Fixes: 51cf06ddafc9 ("net: ethernet: mtk_eth_soc: add support for MT7988 internal 2.5G PHY")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


