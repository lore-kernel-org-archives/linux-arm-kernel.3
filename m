Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F6EC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 19:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k9yTtoxH/xWKG6IZlbraRRY+Xrel+M2msfAmxrJCSPU=; b=kTR+ZBnP8H4/TzuLhn9FJR0PWK
	ybm1Eg66e1/aGrcUe4nMWCIg0F8abT6UPA9ofar9GOafU1qPtfn6+uwDGhKC1gWjYmwYBY/QXthvu
	OO5RJj9hjQouZBXWIqbCF7JwJAvT/fRbmyTLTD5Pl+b+J2Zn0wluqc2OLojPoz1OaAP+84vWoztqM
	vYoimYyYjklCvGqjfgUfHTAf9aeSrc+hW5XB1TfjvilrIQl0v8+Cvnn9QzFsJi4nt8sw8Jj8/SqLw
	X82WZmtRjEfjO3jWs2ElmHHme/PMbgvEciXPTZtpPxmJwpROqnPK8SMgqHjIM2fwPg2/jQxiuHqBr
	9ZEzaEbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ELn-00000005D2o-2xgs;
	Tue, 08 Apr 2025 19:11:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2EJh-00000005Cg8-0XBS
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Apr 2025 19:09:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=k9yTtoxH/xWKG6IZlbraRRY+Xrel+M2msfAmxrJCSPU=; b=Axi5BCET0/+sBX+D09NNmSa1UX
	sPI9zmwceosq6AQHBUnE8MKd2xfJNnthP2fo4SAXwS0yjes10vZLZSs89yjtzLOKeLz6R5OAbbOgd
	RVzDawCwm1FmDy05fQ5Xyiw+8fwpxIzbz0ANI0HxMf5HHsGid5gWxjaSBMkFHJxomjlk8nCAiDGjK
	ynIxzmoA6TurzBQuOlOnRjuho59KUISfX20WIPMcxKristKrJ7ZBKUhhlNUL1I6jZnh9w2v7GZqXa
	Pm89z842RIjUcTHhHKWMSBA6cznb3hj26X2XkGZ9qalnPJSG0J79S/+fI/FWLtafz9pKuiCtOfIC1
	PfyD5tFw==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2EJe-00000008PID-0ybO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 19:09:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=k9yTtoxH/xWKG6IZlbraRRY+Xrel+M2msfAmxrJCSPU=; b=bdzK3TmE0IlSyEQdEgOrUaL7Ys
	n5fZvxOtzOw8wDop7soIXjYwQ+oORRP7cHm8jESLnEEzirqlrUFPsoBWPkkS+PANTlOS9qdA76ARc
	zt7dKCvUF+ttDpIzf2rPQqrHHqOGHTtc5f1mBviCNNTDL56QgrDaCnQgQmtE5YmUywIo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u2EJc-008ROo-5S; Tue, 08 Apr 2025 21:08:56 +0200
Date: Tue, 8 Apr 2025 21:08:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Boon Khai Ng <boon.khai.ng@altera.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Tien Sung Ang <tien.sung.ang@altera.com>,
	Mun Yew Tham <mun.yew.tham@altera.com>,
	G Thomas Rohan <rohan.g.thomas@altera.com>
Subject: Re: [PATCH net-next v3 2/2] net: stmmac: dwxgmac2: Add support for
 HW-accelerated VLAN stripping
Message-ID: <c65bfe99-a6e1-4485-90ee-aee0b8e0984d@lunn.ch>
References: <20250408081354.25881-1-boon.khai.ng@altera.com>
 <20250408081354.25881-3-boon.khai.ng@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408081354.25881-3-boon.khai.ng@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_200858_409498_087C4C28 
X-CRM114-Status: UNSURE (   8.06  )
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

> +static u16 dwxgmac2_wrback_get_rx_vlan_tci(struct dma_desc *p)
> +{
> +	return (le32_to_cpu(p->des0) & XGMAC_RDES0_VLAN_TAG_MASK);
> +}

This appears to be identical to dwmac4_wrback_get_rx_vlan_tci() ?

Can it be moved into the shared code, or am i missing something?

	Andrew

