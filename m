Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7534FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 12:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6N8phbfSv9V0CpUrr5t8I9tEoX+mLXZakuN/NJixNGw=; b=WygWHiS32Dy37b
	6V5FY46l7ZBUvaViXTYSJ7ciS0qLEAXIpGF/PfBbz7FSOqVRVJDTvaNllk6qSJwiOYVO7kLMX2SXX
	weOp+S+nxe1cBfW+j+rb1RPazb4N8JJeed7hcDAA0gEOdtUi40IgoExemlDmaGKA8ZFLsdq7mNBRZ
	9xs1JrwLYHRPmrOI94+P2u1YjY26xUf7vJuvMOeaE9Kp6C3a5KMNrpAdto9Ob88oF5ei3N1UGzN2v
	+snya+11+L29F4MQOboPUe2AYJ33mKls9XPPfVJUHfJjpCTyIUyWAImz4JnGiq/EmqMzOPPQX287s
	HQ8OUpyDkTc5xW0Y4ahQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5knF-0000000G4FW-0K6L;
	Fri, 18 Apr 2025 12:26:05 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5klJ-0000000G3qe-26H3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 12:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6N8phbfSv9V0CpUrr5t8I9tEoX+mLXZakuN/NJixNGw=; b=GXiJnl4D0z2eqznZsfm7Xsd/EU
	+02d/HwTSj/ip/0N44Tlz/UButm0fDm0wXLu8eyDeqwAf1K9/zuJq0k4EHF80fFU0jneSL5mBTegg
	cwbJigiNr9UvZppwKOTVhBwUFrtU2w1FYv7GFOUqplxcRCfPPLF6CoYDXOLEPKzNihvIUqWFspG7O
	LA6Lo9TzzE72MtTcTcGQNoxM/euZGRqdWBEmbFU4d1hvSpqgZHSQXakzC7z0DfaozCtDfOMuBy3gq
	eD2OUT6VqCv8Pyzxd6x+AMYolVobsOt8JdAsbQjLHsUdaZ0aaDktQP5H8B836UAZBIiznPze/pKSr
	LyGftaZA==;
Received: from [122.175.9.182] (port=16515 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1u5kkY-000000004ak-3tGs;
	Fri, 18 Apr 2025 17:53:19 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 60FFA17823F4;
	Fri, 18 Apr 2025 17:53:09 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 3B2471783F61;
	Fri, 18 Apr 2025 17:53:09 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id UmjO3TSNTQeh; Fri, 18 Apr 2025 17:53:09 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id E4DC917823F4;
	Fri, 18 Apr 2025 17:53:08 +0530 (IST)
Date: Fri, 18 Apr 2025 17:53:08 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: horms <horms@kernel.org>
Message-ID: <440344110.1093115.1744978988608.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250416091632.GM395307@horms.kernel.org>
References: <20250414113458.1913823-1-parvathi@couthit.com> <20250414113458.1913823-3-parvathi@couthit.com> <20250416091632.GM395307@horms.kernel.org>
Subject: Re: [PATCH net-next v5 02/11] net: ti: prueth: Adds ICSSM Ethernet
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds ICSSM Ethernet driver
Thread-Index: S0aUb2vCfdcMlVbjfjteCA2lYt5ujg==
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
X-CRM114-CacheID: sfid-20250418_052405_577534_44CAD19C 
X-CRM114-Status: GOOD (  20.39  )
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
Cc: nm <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, tony <tony@atomide.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, praneeth <praneeth@ti.com>, m-karicheri2 <m-karicheri2@ti.com>, basharath <basharath@couthit.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, richardcochran <richardcochran@gmail.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, s hauer <s.hauer@pengutronix.de>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh <ssantosh@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, rdunlap <rdunlap@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> On Mon, Apr 14, 2025 at 05:04:49PM +0530, Parvathi Pudi wrote:
>> From: Roger Quadros <rogerq@ti.com>
>> 
>> Updates Kernel configuration to enable PRUETH driver and its dependencies
>> along with makefile changes to add the new PRUETH driver.
>> 
>> Changes includes init and deinit of ICSSM PRU Ethernet driver including
>> net dev registration and firmware loading for DUAL-MAC mode running on
>> PRU-ICSS2 instance.
>> 
>> Changes also includes link handling, PRU booting, default firmware loading
>> and PRU stopping using existing remoteproc driver APIs.
>> 
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> 
> ...
> 
>> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
>> b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> 
> ...
> 
>> +static int icssm_prueth_probe(struct platform_device *pdev)
>> +{
>> +	struct device_node *eth0_node = NULL, *eth1_node = NULL;
>> +	struct device_node *eth_node, *eth_ports_node;
>> +	enum pruss_pru_id pruss_id0, pruss_id1;
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *np;
>> +	struct prueth *prueth;
>> +	int i, ret;
>> +
>> +	np = dev->of_node;
>> +	if (!np)
>> +		return -ENODEV; /* we don't support non DT */
>> +
>> +	prueth = devm_kzalloc(dev, sizeof(*prueth), GFP_KERNEL);
>> +	if (!prueth)
>> +		return -ENOMEM;
>> +
>> +	platform_set_drvdata(pdev, prueth);
>> +	prueth->dev = dev;
>> +	prueth->fw_data = device_get_match_data(dev);
>> +
>> +	eth_ports_node = of_get_child_by_name(np, "ethernet-ports");
>> +	if (!eth_ports_node)
>> +		return -ENOENT;
>> +
>> +	for_each_child_of_node(eth_ports_node, eth_node) {
>> +		u32 reg;
>> +
>> +		if (strcmp(eth_node->name, "ethernet-port"))
>> +			continue;
>> +		ret = of_property_read_u32(eth_node, "reg", &reg);
>> +		if (ret < 0) {
>> +			dev_err(dev, "%pOF error reading port_id %d\n",
>> +				eth_node, ret);
>> +		}
>> +
>> +		of_node_get(eth_node);
> 
> Hi Roger, Parvathi, all,
> 
> I feel that I'm missing something obvious here.
> But I have some questions about the reference to eth_node
> taken on the line above.
> 
>> +
>> +		if (reg == 0) {
>> +			eth0_node = eth_node;
> 
> If, while iterating through the for loop above, we reach this point more
> than once, then will the reference to the previously node assigned to
> eth0_node be leaked?
> 

We will modify the condition as below to avoid leaks
if ((reg == 0) && (eth0_node == NULL))

>> +			if (!of_device_is_available(eth0_node)) {
>> +				of_node_put(eth0_node);
>> +				eth0_node = NULL;
>> +			}
>> +		} else if (reg == 1) {
>> +			eth1_node = eth_node;
> 
> Likewise here for eth1_node.
> 

We will modify this also as below
if ((reg == 1) && (eth1_node == NULL))

>> +			if (!of_device_is_available(eth1_node)) {
>> +				of_node_put(eth1_node);
>> +				eth1_node = NULL;
>> +			}
>> +		} else {
>> +			dev_err(dev, "port reg should be 0 or 1\n");
> 
> And, perhaps more to the point, is the reference to eth_node leaked if
> we reach this line?
> 

We will check and add of_node_put(eth_node) at the end of the for loop.

>> +		}
>> +	}
>> +
>> +	of_node_put(eth_ports_node);
>> +
>> +	/* At least one node must be present and available else we fail */
>> +	if (!eth0_node && !eth1_node) {
>> +		dev_err(dev, "neither port0 nor port1 node available\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	if (eth0_node == eth1_node) {
> 
> Given the if / else if condition in the for loop above,
> I'm not sure this can ever occur.
> 

We will remove this.


Thanks and Regards,
Parvathi.

