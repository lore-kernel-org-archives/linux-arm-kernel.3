Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4489606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 08:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BX6k3z8/;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TCaSoz+D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lfr+9f3d0uSXwEEu6qQaZk27BopGzDyuDbKtBIZ0OVU=; b=BX6k3z8/Klw+Ar
	PRLy8sBTlFG45rPoryGoSEZ/0L3dbi1b6Eup1kxckSwtiGm2H9vP6ibncHJ9rOD30w+s4pPpUF14P
	nyfy7xBvqcGCtzGWkzD9kifir7xr17KF1+fGZaOME3Pnzp9wdhyRxADSBs4KN2D8jwI7PYUlYc6/5
	YpshBploh4doHUt+hBHzFTXYmrcBhFNZYV2ca4EAEbHQ9KTkuCVvJs/nWHeKPNzSGl6lobzQScOja
	MLYXnP/N/NJde02RuZm8SlceRSuSkcIZUsOrdH9Fi1j0Cjd6G6RUoH+2Vn2IuldWIJvKWH+SYwmd4
	vGs68yDiloa8gAmInA5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnXQ-0000000Ft0I-2r50;
	Mon, 02 Nov 2026 08:37:08 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnXN-0000000Fsy7-0ChJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 08:37:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E67E31A1402;
	Mon,  2 Nov 2026 08:37:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE76B60750;
	Mon,  2 Nov 2026 08:37:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6286910329123;
	Mon,  2 Nov 2026 09:36:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793608620; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=lfr+9f3d0uSXwEEu6qQaZk27BopGzDyuDbKtBIZ0OVU=;
	b=TCaSoz+DO/wzRp2Sz1lkU5w0pxuYwycMzx9SH1Wr7XPr0oGIz5YdiRmVsK2OlSyy3J2Iaq
	u6LWiI7sNn1oAwOCtJ9Dtlg+QXv1it/jJANgVoc1F4b2pWU1cIZ+bu/kbBrrm3batPP82X
	sJkpkvdsXBazNjL3e/tdhA7F1Ij8IVWluJ7WxtrY7kyN7yGACRSQIYwdMa55LZaDmOSFG9
	1xQ09j4chDBGdeVw1YK1EMJa7fgJKz5beObCjMYp9sB9hQ40kDfFs/jMh7zi+rkJMGlF1S
	Ao9AjHJOYlDnyVpu4NyOqByLuIaLAqqpgVkrvXCtXGQa4diXJOPaThYcDhoBJw==
Message-ID: <f5a88825-2d0b-4f5f-863b-e2369d009d24@bootlin.com>
Date: Mon, 2 Nov 2026 09:36:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: dwmac-motorcomm: mask the MISC interrupt
To: Nicolai Buchwitz <nb@tipi-net.de>,
 Magnus Leatti <magnusleatti@kernelriot.com>
Cc: Yao Zi <me@ziyao.cc>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261102080938.2955-1-magnusleatti@kernelriot.com>
 <805aeb73d9e32b237bcb30c8fd44ffed@tipi-net.de>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <805aeb73d9e32b237bcb30c8fd44ffed@tipi-net.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_003705_527900_34780A55 
X-CRM114-Status: GOOD (  10.50  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/2/26 09:29, Nicolai Buchwitz wrote:
> Hi Magnus
> 
> On 2.11.2026 09:09, Magnus Leatti wrote:
> 
>> [...]
> 
>> Russell, d3265c19b35d ("net: stmmac: xgmac2: disable RBUE in default RX
>> interrupt mask") describes a similar storm on xgmac2. Should dwmac4 do
>> the same? I have only tested the glue change.
> 
> AFAIU RBU is the cause. Dropping it in dwmac4, as Russel did in  d3265c19b35d,
> would cover all multi-MSI users.

As I commented, the other solution is to properly ack it. I'm not convinced about
the RBU interrupt's usefulness TBH, even when ack'd it makes a bad situation even
worse, but it does have the nice effect of making this visible by incrementing the
associated counter.

Anyway, this issue should be covered by this :

https://lore.kernel.org/all/20261030102251.208929-1-maxime.chevallier@bootlin.com/

Maxime


