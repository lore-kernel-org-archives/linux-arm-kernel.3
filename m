Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74497C88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 09:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOCOVInC775WiBtqQH5pSV36SDX5kInkJA9FSrFvl/M=; b=OdD4pcSo4ersau/upgARQ/maLx
	z3gtjZB+7Q5GDyf81Hp3KNZ+ZAT1AIi4KrOZGADXdFk9y/gpo6FTBxBAnK2iVykppKEU3pGKFOmkO
	YWI1nNaBFWXRrxJikzcRtMkGiJqqDZD7nqt/2l/pTTmh+mRSit1aDqlkr25VOQxOR5ib/Bt/14u5U
	+DJz09keKYrOSN6clJIWx4mO7Db8R4UYJUw36rJOQhun/FF1CxL0f7kgM6P8lgq8rX8hLEa/IILSo
	/jnvT5fhJO+Xtpo8dNCHsedKQYG/l+8e4pifh8OS6D4aYYwNUAhoCSa6cbPEno1HNmTt3xMxHB+7S
	vlYnkw+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xYx-0000000GGgN-2K8L;
	Fri, 11 Sep 2026 09:28:51 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xYt-0000000GGec-1K6I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 09:28:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C112D4E401AD;
	Fri, 11 Sep 2026 09:28:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 92144601DE;
	Fri, 11 Sep 2026 09:28:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 286D611C7AF8E;
	Fri, 11 Sep 2026 11:28:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789118923; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ZOCOVInC775WiBtqQH5pSV36SDX5kInkJA9FSrFvl/M=;
	b=aD5Jiji/jcKYCmhgOG4txZ+FrxgDrogxM96MJW4fmpStxLY0A/quwGPuuDjd/UlC92cMGi
	AubQsBFwmOpM6eGZAqzKcAZJ/hwDVd8ZBW3txW0Auklp/hbx3H4yaGeRHqpvxF3ooeBPVH
	1xhLLFy2DgZuz88GxSBd/9dW86YtzBwtPUR6coTJviNJRhzUjgQb5EILDXj9rGLXpj974j
	STNu3HlOYVismUbumDR9++8TZolCUGboEvZZJhCFG/AV6C1i8Ou/EWiHe6X2WzQ8+HcFpZ
	TASjWnYLTAU79cEyDEPvvuyq/RQ1BI3kViE1Wo00vXNVuJCDv51zSiCXAzxoOw==
Message-ID: <476761e1-81f1-48d8-9946-0f0696ce26a8@bootlin.com>
Date: Fri, 11 Sep 2026 11:28:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: fix TSO header length truncation
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Niklas Cassel <niklas.cassel@axis.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260911-stmmac-fix-header-length-v1-1-8fc103334327@oss.qualcomm.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260911-stmmac-fix-header-length-v1-1-8fc103334327@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_022847_497034_F8FB1F8E 
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

Hi

On 9/11/26 11:20, Lorenzo Bianconi wrote:
> stmmac_tso_xmit() stores the protocol header length returned by
> stmmac_tso_header_size() in a u8. stmmac_tso_valid_packet() admits
> headers up to 1023 bytes, so a header longer than 255 bytes wraps modulo
> 256 (486 becomes 230, 256 becomes 0).
> 
> A TCP over IPv6 socket carrying a few hundred bytes of sticky
> destination/hop-by-hop options makes skb_tcp_all_headers() exceed 255
> while staying below the 1023-byte limit, so such an skb reaches
> stmmac_tso_xmit().
> 
> Widen proto_hdr_len to unsigned int, which is sufficient since the value
> is bounded by the hardware limit, and adjust the debug print specifier
> accordingly.
> 
> Fixes: 9edfa7dab811 ("net: stmmac: enable TSO for IPv6")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


