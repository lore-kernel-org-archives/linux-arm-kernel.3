Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE139C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 17:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8N6GKlbK16hAp/92AuGA8T5bSLcIE21CMka1AVFczE=; b=Fgm2bpKz3jxhbwmrczfFqdliM+
	lTNjFWNzi3UZbPYRG7ArACXu+k6HbpF6alfWSIcF7yjhWp0TCQDL30sFFEvm1a6V98x1CZ+ve8qG5
	4CPdE66WL3Iz4z/ilo3/xTb45X3gsYYl3BNdyc3xJJiZabdif3LFkBKjJllz/p4uzutjxTXV0bNwT
	6Lz9ipiw8+QC+p/qaeTCMyi/eArc/+aKmj20Kaaqmi2cGBiF00vDBNJmcjL3G9GefnrSXHdBGcr0k
	cpW/l23qbBHJYKV7ockTSDWvu8rKKJjHcqWzznq60vfH6sFBK9XSaDeBQJ+rriChXBe6U6U4Jr4ag
	iVLYx8BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEX1f-0000000ADZe-103N;
	Mon, 12 May 2025 17:33:15 +0000
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEWl3-0000000ABGH-01Cf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 17:16:08 +0000
Message-ID: <5f99168b-c309-4c60-9313-d6687bb1998c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747070162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K8N6GKlbK16hAp/92AuGA8T5bSLcIE21CMka1AVFczE=;
	b=aCzoCDXjrbj/khZWc3y7z15EqUNWmg1j25agjJ4p6xbwu55Ty1xS9zdRCHBWMpvgl1XE2d
	T2RIo99ThvKuKH578Qs7qFHYNP552cmLjy0rOJ10TA1ra3CePl0qIM8khepBF06SERJT8P
	FxLOwkO9bIqHawSbMjbhAcMiFx+rLCE=
Date: Mon, 12 May 2025 13:15:53 -0400
MIME-Version: 1.0
Subject: Re: [net-next PATCH v4 00/11] Add PCS core support
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 upstream@airoha.com, Kory Maincent <kory.maincent@bootlin.com>,
 Simon Horman <horms@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>,
 linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Clark Wang <xiaoning.wang@nxp.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Joyce Ooi <joyce.ooi@intel.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Robert Hancock <robert.hancock@calian.com>,
 Saravana Kannan <saravanak@google.com>, UNGLinuxDriver@microchip.com,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250512161013.731955-1-sean.anderson@linux.dev>
 <aCIrvTAGP5ukmwnb@makrotopia.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <aCIrvTAGP5ukmwnb@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_101605_256090_4CB40C72 
X-CRM114-Status: GOOD (  12.83  )
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

On 5/12/25 13:11, Daniel Golle wrote:
> On Mon, May 12, 2025 at 12:10:02PM -0400, Sean Anderson wrote:
>> This series adds support for creating PCSs as devices on a bus with a
>> driver (patch 3). As initial users,
>> 
>> - The Lynx PCS (and all of its users) is converted to this system (patch 5)
>> - The Xilinx PCS is broken out from the AXI Ethernet driver (patches 6-8)
>> - The Cadence MACB driver is converted to support external PCSs (namely
>>   the Xilinx PCS) (patches 9-10).
> 
> Are those changes tested on real hardware?

Yes. I have tested the Xilinx changes on a custom board which uses both
macb and axi ethernet MACs with the Xilinx PCS. I also tested the Lynx
PCS changes on an LS1046ARDB. As noted in the AXI Ethernet commit, it
has also been tested by Suraj Gupta, although I am not sure what
hardware he used.

--Sean

