Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CB0C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 10:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IplbbsjtQNJ9e6AF522ZXUvBfXM+LfwzW90At7QJSew=; b=Iu7ScGKa8M+UR7
	UOpwl71Ufy/v423SlyQF69/W+GHwjDuaDjSbGU9jKWZYa9LxRfWYU4oDKmZARtZ4meR9Eo/ZeJk7P
	4gDGm8c7JDRyU5FNwvchUHJuy9CNXCrc0rakaGQfIUMpRn6q/8KOWXbbUIgjmDuQxg9VvzhSNAoua
	qzdR7EVz8F9tK3XVt015FvKEvi3thA633phzOSKztdqAqFNIRmik1gHMJ4+Hm2RJkpWgOzhOAxEtB
	sY+LpRGwMa6NmrDgSrWlqeiX8kEy8Ou0GTGDw31aK+eVS8mJiCEiBGBGzp+R8PweX5tdbhiOD3qBV
	CatAp7DdeMS9GSwysuYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKb9-00000007hFk-2wbz;
	Tue, 18 Feb 2025 10:13:03 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKNw-00000007dSV-420n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 09:59:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=IplbbsjtQNJ9e6AF522ZXUvBfXM+LfwzW90At7QJSew=; b=skjPJG3qHyyrQxKdigVU5Yrf/3
	Yj1J/c5z6dFoGQWIMJTz4LBoTxUbW8gsCvnA4wrW7EZhOq66KKLmF+eUxYtNF0/HOxlgJn5x9roGh
	5TeDGN3kOkGFJ8y8IQFZR39DRkbtQeRdu7QKAw+YKlU0G+JbpWpKyzpA3xItlRY2rqL349W98C9Mg
	WegKmZcHRR3VkNP4DPHhdZzVHw02BBXWB0OuikiFV0Zr5Ibng073GjDtPHAVyf6sSNrSKfAylxAAK
	TcjfojLRd+Ix+3zdxJ1yc/08VFtBY1EGx3p9oIi+SrbylPcIA5adTn/LlD1AVu/CKdCaEhXgpXt7o
	p1+xvIRg==;
Received: from [122.175.9.182] (port=27501 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parvathi@couthit.com>)
	id 1tkKND-0007xL-1i;
	Tue, 18 Feb 2025 15:28:40 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id AEF9617821C8;
	Tue, 18 Feb 2025 15:28:29 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 85C9C17823D4;
	Tue, 18 Feb 2025 15:28:29 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id SPe3V9-vo6EN; Tue, 18 Feb 2025 15:28:29 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 41B8D17821C8;
	Tue, 18 Feb 2025 15:28:29 +0530 (IST)
Date: Tue, 18 Feb 2025 15:28:29 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <1901840071.600762.1739872709135.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250214164422.1bb58a89@fedora.home>
References: <20250214054702.1073139-1-parvathi@couthit.com> <20250214073757.1076778-5-parvathi@couthit.com> <20250214164422.1bb58a89@fedora.home>
Subject: Re: [PATCH net-next v3 04/10] net: ti: prueth: Adds link detection,
 RX and TX support.
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds link detection, RX and TX support.
Thread-Index: ruvuX5QuiCck3qy25K/1ke8txq1XdQ==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_015925_078453_83DCE4E9 
X-CRM114-Status: GOOD (  12.84  )
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
Cc: nm@ti.com, Vignesh Raghavendra <vigneshr@ti.com>, praneeth@ti.com, edumazet@google.com, krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh@kernel.org, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, m-karicheri2@ti.com, basharath <basharath@couthit.com>, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan <mohan@couthit.com>, richardcochran@gmail.com, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh <pratheesh@ti.com>, m-malladi@ti.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, danishanwar <danishanwar@ti.com>, afd@ti.com, andrew+netdev@lunn.ch, parvathi <parvathi@couthit.com>, horms@kernel.org, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


Hi,

> On Fri, 14 Feb 2025 13:07:51 +0530
> parvathi <parvathi@couthit.com> wrote:
> 
>> From: Roger Quadros <rogerq@ti.com>
>> 
>> Changes corresponding to link configuration such as speed and duplexity.
>> IRQ and handler initializations are performed for packet reception.Firmware
>> receives the packet from the wire and stores it into OCMC queue. Next, it
>> notifies the CPU via interrupt. Upon receiving the interrupt CPU will
>> service the IRQ and packet will be processed by pushing the newly allocated
>> SKB to upper layers.
>> 
>> When the user application want to transmit a packet, it will invoke
>> sys_send() which will inturn invoke the PRUETH driver, then it will write
>> the packet into OCMC queues. PRU firmware will pick up the packet and
>> transmit it on to the wire.
>> 
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> 
> 
>> +/* update phy/port status information for firmware */
>> +static void icssm_emac_update_phystatus(struct prueth_emac *emac)
>> +{
>> +	struct prueth *prueth = emac->prueth;
>> +	u32 phy_speed, port_status = 0;
>> +	enum prueth_mem region;
>> +	u32 delay;
>> +
>> +	region = emac->dram;
>> +	phy_speed = emac->speed;
>> +	icssm_prueth_write_reg(prueth, region, PHY_SPEED_OFFSET, phy_speed);
>> +
>> +	delay = TX_CLK_DELAY_100M;
>> +
>> +	delay = delay << PRUSS_MII_RT_TXCFG_TX_CLK_DELAY_SHIFT;
>> +
>> +	if (emac->port_id) {
>> +		regmap_update_bits(prueth->mii_rt,
>> +				   PRUSS_MII_RT_TXCFG1,
>> +				   PRUSS_MII_RT_TXCFG_TX_CLK_DELAY_MASK,
>> +				   delay);
>> +	} else {
>> +		regmap_update_bits(prueth->mii_rt,
>> +				   PRUSS_MII_RT_TXCFG0,
>> +				   PRUSS_MII_RT_TXCFG_TX_CLK_DELAY_MASK,
>> +				   delay);
>> +	}
>> +
>> +	if (emac->link)
>> +		port_status |= PORT_LINK_MASK;
>> +
>> +	writeb(port_status, prueth->mem[region].va + PORT_STATUS_OFFSET);
>> +}
>> +
>>  /* called back by PHY layer if there is change in link state of hw port*/
>>  static void icssm_emac_adjust_link(struct net_device *ndev)
>>  {
>> @@ -369,6 +426,8 @@ static void icssm_emac_adjust_link(struct net_device *ndev)
>>  		emac->link = 0;
>>  	}
>>  
>> +	icssm_emac_update_phystatus(emac);
>> +
> 
> It looks to me like emac->link, emac->speed and emac->duplex are only
> used in icssm_emac_update_phystatus(). If you consider either passing
> these as parameters to the above function, or simply merge
> icssm_emac_update_phystatus() into your adjust_link callback, you can get
> rid of these 3 attributes entirely. It even looks like emac->duplex is
> simply unused.
> 

Sure, we will address this in the next version.

Thanks and Regards,
Parvathi.

