Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3630E7718C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 16:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XgGAjTZNwBn/Z85i6WDZT8AJq3hE2+N5shzkenhzSio=; b=MuFHXm4gY+iRaZpdMzHX9cUKZ4
	0x4zLIQRDxpuxpYlRjbGPZ9+WjTy+DcJn1rKhZNYB/YhAhHucczijEpnJsBoaDXWSBS1F+wqzPClH
	IJDlQmiD2kJGXLgCAXvaJiTuvo/aAqXmwiu1LBtl1Oes5CaYbY2IwlH8QXC/VQIi2bBILpBJukoqQ
	GVHatDhxqMyzc8Hhh5vyRbG/5bunNwWJjAQsorAmnhxa7SKfHkqQ3azdxMrjlifUHSCbNUOhO3hLg
	29l+BEHNxdUs2X8dOzhyf4huFRCv8aVfXewPlMyt8WPxaATrU250SzKeSH+2e7/Cl6Z70VqzU8+Q+
	/1zW6mmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfhu-00000005RN4-1aLV;
	Fri, 20 Dec 2024 16:18:30 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfgk-00000005RIr-2i1D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 16:17:20 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BKGH7n0088336;
	Fri, 20 Dec 2024 10:17:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734711427;
	bh=XgGAjTZNwBn/Z85i6WDZT8AJq3hE2+N5shzkenhzSio=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=WdrcnkyXuFzZWTAEEqwHRefcFOFE8sqXYOvjF1tjaWRC3ohzyAJE5oiZFHZQPyB8F
	 WlkgYnZUSDTh+V20jydUZePPXCLSh1gx/LEixIco1kA7x3szg9S8PZ5OroKF7t4CFu
	 5Eg82C83/YwGz8znlZkFlva/DuWIsIIdXaDwAa5Y=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BKGH7Hp074138
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Dec 2024 10:17:07 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 20
 Dec 2024 10:17:06 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 20 Dec 2024 10:17:06 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BKGH5eQ049440;
	Fri, 20 Dec 2024 10:17:06 -0600
Date: Fri, 20 Dec 2024 21:47:05 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <stable@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
        <kuba@kernel.org>, <pabeni@redhat.com>, <rogerq@kernel.org>,
        <horms@kernel.org>, <dan.carpenter@linaro.org>, <c-vankar@ti.com>,
        <jpanis@baylibre.com>, <npitre@baylibre.com>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <srk@ti.com>
Subject: Re: [PATCH net] net: ethernet: ti: am65-cpsw: default to round-robin
 for host port receive
Message-ID: <6whu7jzxigyqmnk5424ltu3tpdnlgetpqv6nvfbaxvlw2nseq4@y2vi3c56o3dd>
References: <20241220075618.228202-1-s-vadapalli@ti.com>
 <eb573f51-4363-4cd7-ab1b-0d7304820d85@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <eb573f51-4363-4cd7-ab1b-0d7304820d85@intel.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_081718_843401_B4F9F3AA 
X-CRM114-Status: GOOD (  24.46  )
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

On Fri, Dec 20, 2024 at 11:41:26AM +0100, Przemek Kitszel wrote:
> On 12/20/24 08:56, Siddharth Vadapalli wrote:
> > The Host Port (i.e. CPU facing port) of CPSW receives traffic from Linux
> > via TX DMA Channels which are Hardware Queues consisting of traffic
> > categorized according to their priority. The Host Port is configured to
> > dequeue traffic from these Hardware Queues on the basis of priority i.e.
> > as long as traffic exists on a Hardware Queue of a higher priority, the
> > traffic on Hardware Queues of lower priority isn't dequeued. An alternate
> > operation is also supported wherein traffic can be dequeued by the Host
> > Port in a Round-Robin manner.
> > 
> > Until [0], the am65-cpsw driver enabled a single TX DMA Channel, due to
> > which, unless modified by user via "ethtool", all traffic from Linux is
> > transmitted on DMA Channel 0. Therefore, configuring the Host Port for
> > priority based dequeuing or Round-Robin operation is identical since
> > there is a single DMA Channel.
> > 
> > Since [0], all 8 TX DMA Channels are enabled by default. Additionally,
> > the default "tc mapping" doesn't take into account the possibility of
> > different traffic profiles which various users might have. This results
> > in traffic starvation at the Host Port due to the priority based dequeuing
> > which has been enabled by default since the inception of the driver. The
> > traffic starvation triggers NETDEV WATCHDOG timeout for all TX DMA Channels
> > that haven't been serviced due to the presence of traffic on the higher
> > priority TX DMA Channels.
> 
> I get it right that the starving is caused by HW/DMA (not SW)

Yes. The CPSW Host Port in Hardware can be configured to dequeue packets
queued onto the DMA Channels by Linux in either a Priority-based manner
or Round-Robin manner. Linux is submitting the packets onto the TX DMA
Channels to be received by CPSW, with CPSW's Host Port dequeuing them
in one of the two modes (fixed priority or round-robin) that has been
programmed.

> 
> > 
> > Fix this by defaulting to Round-Robin dequeuing at the Host Port, which
> > shall ensure that traffic is dequeued from all TX DMA Channels irrespective
> > of the traffic profile. This will address the NETDEV WATCHDOG timeouts.
> > At the same time, users can still switch from Round-Robin to Priority
> > based dequeuing at the Host Port with the help of the "p0-rx-ptype-rrobin"
> 
> why the flag has rx in the name?

The "rx" corresponds to "receive" w.r.t. the Host Port (P0). As indicated
in the $subject of this patch, we are defaulting to "Round-Robin" (rrobin)
mode of operation of Host Port dequeuing i.e. packets received by the Host
Port from Linux are to be dequeued in a Round-Robin manner from each of the
TX DMA Channels (TX from Linux's perspective). As for the naming convention
being followed, it is based on the Techincal Reference Manual.

[...]

Regards,
Siddharth.

