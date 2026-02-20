Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBB5C56205
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 15:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RC6UWKhYAqjXr+w+j0q5aXbJy6JdNfJtgpcO3BWFBCE=; b=Abbj1GyRcU3cNmpcaVZ0oUtLPu
	9IQgEpM3XhaJtJDwXydtVrzLxRH7CK5W9JZYprnL1WuRNqBhALN4jw1MIXtgv0czu2t3qdw5XFrDM
	KZ7SitdFgorEviawGEKLRTg5fcHUJn+t7V3tI0o8mTAexU8akl8uqHUAoghWrM4pHl+FRDF2OFirQ
	rR3AAYFzmh8Rte2aFgm0Fo27uAGCKm3IaRP0Lm9E4GqcatasEQVpZjrsK7sAUjBJ6MS3U5rbTtG0+
	v+Y7eV05O0GX/iFRW33p8F9HlXuVmj9QDuoOLmrGTXGFzzFBgTSU4i08z1v1qmi3CSfJ45lRYS8Om
	7yJb6H/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtS2G-0000000Ew4W-3l6i;
	Fri, 20 Feb 2026 15:03:16 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtS2D-0000000Ew3R-35BL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 15:03:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RC6UWKhYAqjXr+w+j0q5aXbJy6JdNfJtgpcO3BWFBCE=; b=yCYm6N50SwTaKaQZc1oQ2b/z5q
	w71B750olRFvQRKPRNMAb5fTVLD8IWGadeV8ttWl/rVLElf75xB+aQwyEB6zpw/Z0K3AbzkA6sh4Q
	9mvOWZjQtkHQswqZiSnUhyC+0cRfDSPULWiDT4hXalQD3TZ0TcYrmpd257ALa9NzskY8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vtS24-0085KC-UU; Fri, 20 Feb 2026 16:03:04 +0100
Date: Fri, 20 Feb 2026 16:03:04 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Neeli, Srinivas" <srinivas.neeli@amd.com>
Cc: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"Simek, Michal" <michal.simek@amd.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"richardcochran@gmail.com" <richardcochran@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"git (AMD-Xilinx)" <git@amd.com>
Subject: Re: [RFC PATCH 4/8] xilinx: tsn: Add Ethernet MAC (EMAC) and MDIO
 support to the TSN driver
Message-ID: <dd65446d-0c40-4b90-8699-122fffd546f3@lunn.ch>
References: <20260219054911.2017362-1-srinivas.neeli@amd.com>
 <20260219054911.2017362-5-srinivas.neeli@amd.com>
 <b408cad2-90de-44df-85a6-64a028216290@lunn.ch>
 <SN7PR12MB8147BA0300639B61306EDC949368A@SN7PR12MB8147.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN7PR12MB8147BA0300639B61306EDC949368A@SN7PR12MB8147.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_070313_794710_0B43CA01 
X-CRM114-Status: GOOD (  10.17  )
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

> > > +           tsn_mdio_mdc_enable(emac);
> >
> > It is unusual to stop MDC. I suspect some PHYs will not like this.
> > What is your reason for doing this.
> >
> The intention is to reduce power consumption by gating  the clock when it is not required.

There is only one other MDIO bus driver that i know of which disables
the clock between transactions. And it does it because the board has
ageing problems, and if the clock it left ticking all the time, the
magic smoke eventually escapes.

How many different PHYs have you tested this with? How good a feeling
do you have this is not going to cause problems? How much power do you
actually save?

	 Andrew
 

