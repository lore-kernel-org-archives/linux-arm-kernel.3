Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB34C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 14:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Op9cD1U0KRYqHmW8EnMYGo3fVWW5K4SEiP+kI5MweBQ=; b=vdNeNbCpu7kMwJ4L6N3UMT5ydt
	1GFz+Pwvtk7/F8Lpu5troNMLcj+5uQWtn24cGp0kkSoOuod7qCK8FFIttv4hok2nPG4CurnTd6Yrx
	s6X5SpOWN7gR/0Sawr16iFtrcPt4iB9XtJWmWD6l3Ynk9QhNpYoG35KdoIst9XMkDDnAIxZX6wA7M
	BUunuWvl9SHo3KzxasjK5hzSctN/on3nZ3at7fxdPQz4/FWCtFJV6dZIUCuA+eksuwkne1onR0R8I
	glYfA0V4oJV5FsbCZmEE93EJmE+mxBXrjpriO58+2JP0JFM/GWgHjEqmMipZNiCt4LJDtuS7hz6sE
	ycbsh2/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttS3h-0000000GPyK-1hGl;
	Sat, 15 Mar 2025 14:00:13 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttS21-0000000GPre-3CFW;
	Sat, 15 Mar 2025 13:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Op9cD1U0KRYqHmW8EnMYGo3fVWW5K4SEiP+kI5MweBQ=; b=PuvGPAjucn1pH/T3gmp8kVswvv
	vz/GySD7QeVeaaijo9DnWkJEu3lF2h9Xec16pwWR3tZVgy7u2K3gK1vUXDIe9wQXpuJEOFbzmSW1E
	TZ6OFz+nAdiK6WE6bTZ9K2AIcjNJrZatWNfRxWDa79Ft8e8QUDDu6X+5I8X6lrYYCJfo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ttS1q-005avu-TO; Sat, 15 Mar 2025 14:58:18 +0100
Date: Sat, 15 Mar 2025 14:58:18 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: airoha: Validate egress gdm port in
 airoha_ppe_foe_entry_prepare()
Message-ID: <b647d3c2-171e-43ea-9329-ea37093f5dec@lunn.ch>
References: <20250315-airoha-flowtable-null-ptr-fix-v2-1-94b923d30234@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315-airoha-flowtable-null-ptr-fix-v2-1-94b923d30234@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_065829_890870_B315E270 
X-CRM114-Status: UNSURE (   8.49  )
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

> Fix the issue validating egress gdm port in airoha_ppe_foe_entry_prepare
> routine.

A more interesting question is, why do you see an invalid port? Is the
hardware broken? Something not correctly configured? Are you just
papering over the crack?

> -static int airoha_ppe_foe_entry_prepare(struct airoha_foe_entry *hwe,
> +static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
> +					struct airoha_foe_entry *hwe,
>  					struct net_device *dev, int type,
>  					struct airoha_flow_data *data,
>  					int l4proto)
> @@ -224,6 +225,11 @@ static int airoha_ppe_foe_entry_prepare(struct airoha_foe_entry *hwe,
>  	if (dev) {
>  		struct airoha_gdm_port *port = netdev_priv(dev);

If port is invalid, is dev also invalid? And if dev is invalid, could
dereferencing it to get priv cause an opps?

	Andrew

