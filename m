Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E93CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqSEowUNtiX1u5JE5XXaBf5XcLjoVZ++j/SnZW+TjQQ=; b=r/Tut5TldIDfhs
	0IsRKE51BtFTrQc4MT2f9qX2MTlf007G8fr0h6Ht4YQ6cP9FHdnT8HD/23d2nPE8Z4M4hsN/W7XKR
	vxj4NB/bX+/OgGBQKmwd98HNAO9hvZwgJpNnk5cb80ask45Ize/0qdfxO+28LQL5RsNoIH4YTG9e3
	CTGX+sIocORlsiGv4W+Ka7AEA30Y3YKgU/kxIeGO/RNLIPtse6a7CFCZu9KQZMQnsqC1vRgenlATK
	os+KDAe3Oeo0+yAc7+gpKuPK2dnmSYjKLi8A6ltlfNCLn0qQlyGJoe369bAjKOE6J4HH4i0vq9l/b
	rkap3QOZw5H7FUBacSwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3iX-00000008AbV-2pZh;
	Mon, 18 Aug 2025 17:32:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1yB-00000007wAr-0Mtw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 15:40:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C796F458E2;
	Mon, 18 Aug 2025 15:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7B3C4CEEB;
	Mon, 18 Aug 2025 15:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755531622;
	bh=5SCABghAB354amELoyU9VXKcuc66Y0O8hBOvTypXRM8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WWF1Yp0Ay+zqt8/poKCkMgmRjqP/VDzwXyhhUnVYTPbQdi9D88A0JbYuC1Qy065tu
	 cNu1KyJJFRIen1gkr9BfwJRO1WpHD75A2IlsjBf1xo0tXXXu4kD1cj7B2+sd2gpUdj
	 cWcGm7ZlPf0Y9JqLbXiKuVVjuNrA6QSRz1CbV0T6dfF7ampA0VEwFOPWn4kqVm0MFU
	 Va5Vi+tMHqNtJITQt1/tC7wbL14SFpKleF8JSwG6TPxCYJZSDTHTCBmnqkPPWmI2vf
	 C9GXDcLADEd0t25ToHVciyn/gC5cWJpED8fiIXe+07MfJyqmOH5H4s7n/D8b1Wr7gw
	 MeoKF5iWzk4wg==
Date: Mon, 18 Aug 2025 08:40:20 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v13 4/5] net: ti: prueth: Adds link detection,
 RX and TX support.
Message-ID: <20250818084020.378678a7@kernel.org>
In-Reply-To: <1969814282.190581.1755522577590.JavaMail.zimbra@couthit.local>
References: <20250812110723.4116929-1-parvathi@couthit.com>
	<20250812133534.4119053-5-parvathi@couthit.com>
	<20250815115956.0f36ae06@kernel.org>
	<1969814282.190581.1755522577590.JavaMail.zimbra@couthit.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_084023_146064_F983E878 
X-CRM114-Status: UNSURE (   6.86  )
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
Cc: pratheesh <pratheesh@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, saikrishnag <saikrishnag@marvell.com>, m-karicheri2 <m-karicheri2@ti.com>, Bastien Curutchet <bastien.curutchet@bootlin.com>, mohan <mohan@couthit.com>, jacob e keller <jacob.e.keller@intel.com>, pabeni <pabeni@redhat.com>, s hauer <s.hauer@pengutronix.de>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, ALOK TIWARI <alok.a.tiwari@oracle.com>, richardcochran <richardcochran@gmail.com>, johan@kernel.org, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, basharath <basharath@couthit.com>, ssantosh <ssantosh@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, kory maincent <kory.maincent@bootlin.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, horms <horms@kernel.org>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, 18 Aug 2025 18:39:37 +0530 (IST) Parvathi Pudi wrote:
> +       if (num_rx_packets < budget && napi_complete_done(napi, num_rx_packets))
>                 enable_irq(emac->rx_irq);
> -       }
>  
>         return num_rx_packets;
>  }
> 
> We will address this in the next version.

Ideally:

	if (num_rx < budget && napi_complete_done()) {
		enable_irq();
		return num_rx;
	}

	return budget;

