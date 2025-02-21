Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9575C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 12:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yhaN5jFfFulcSxXrjGR7FhXNECY7NGeLyXYqnhok424=; b=LtEBizcDJjodhD
	KikBGZ5s84zThSP2p6+pDtXRLdh2S8noeMHJXDQtFnSacbIw9LDAXmpkyowfS9Nj0uNvyFE8q/8aW
	0xxR9HzkHMkb2GfzDuy5XZ7L82bsw9bD5X+H+UNxbrubUoUzau7rGxMWCirZA2XrLpRsB7T/prlF1
	tYIWX9vvUb5pcAd8YIaHhfs9552FebMSFVgNz2gYLN78KliRozeP7Q1fh3ydNWRO9D6rNuQjKIaBz
	NhpOFKBczANBJlZmV2FJt5ehxm/lcZVWpM+UEtAQ2TEBKSeEvtWyKU3t3rlb3oLbhI2vMpZ2PL/pJ
	61oRi1ivHpCb5iJrHV5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSI1-00000005Uys-1Gbd;
	Fri, 21 Feb 2025 12:37:57 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSFQ-00000005USl-1uYt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 12:35:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=yhaN5jFfFulcSxXrjGR7FhXNECY7NGeLyXYqnhok424=; b=mv1+ktNLwj0EgyGwAOwEDcaBfo
	NvqV+iPrTwQyTOnt52Zs+TOFeEHnmQ6Tqiv1dZm906n+n6Kd6+O9pb6EaE+xskdPjVbmOBtlLJ3Mv
	yyYRG/6HVawBKmkuYxjkdTknjkXe9Vq+pZdrZa1pKJ2OSjO9ncOu2JH/hSj0VUPO5wcLkCrbN5fEL
	nEGkTrFFAg03ug0qqz6kvoXkNhIIGw3Y6NCIAIXnSX+iwuXf7v2oUa/ApDAJaUT/KkToUSCwIu48C
	vvOnirNSCqHHwb0h5FCx5fufVfzwv9jfyp2l0OKjskKsnjyuS5tWGkR4CoCrsgqiMI010JkpIQyAQ
	42KETJPQ==;
Received: from [122.175.9.182] (port=40912 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parvathi@couthit.com>)
	id 1tlSFM-0002X9-0D;
	Fri, 21 Feb 2025 18:05:12 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id EC851178215A;
	Fri, 21 Feb 2025 18:05:05 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id C31C7178247D;
	Fri, 21 Feb 2025 18:05:05 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id WrMqSm-ejAqg; Fri, 21 Feb 2025 18:05:05 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 826AE178215A;
	Fri, 21 Feb 2025 18:05:05 +0530 (IST)
Date: Fri, 21 Feb 2025 18:05:05 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Ratheesh Kannoth <rkannoth@marvell.com>
Message-ID: <1219972777.634130.1740141305362.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250220091904.GA1230612@maili.marvell.com>
References: <20250214054702.1073139-1-parvathi@couthit.com> <20250214054702.1073139-3-parvathi@couthit.com> <20250220091904.GA1230612@maili.marvell.com>
Subject: Re: [PATCH net-next v3 02/10] net: ti: prueth: Adds ICSSM Ethernet
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds ICSSM Ethernet driver
Thread-Index: WdttyWoLoXQ9UDMeCG+9GNLwYsLE+w==
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
X-CRM114-CacheID: sfid-20250221_043516_530523_AAFFA7F2 
X-CRM114-Status: GOOD (  12.38  )
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
Cc: nm <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, m-karicheri2 <m-karicheri2@ti.com>, basharath <basharath@couthit.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, richardcochran <richardcochran@gmail.com>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh <ssantosh@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


Hi,

> On 2025-02-14 at 11:16:54, parvathi (parvathi@couthit.com) wrote:
>> From: Roger Quadros <rogerq@ti.com>
>>
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
>> +
>> +		if (reg == 0) {
>> +			eth0_node = eth_node;
>> +			if (!of_device_is_available(eth0_node)) {
>> +				of_node_put(eth0_node);
>> +				eth0_node = NULL;
>> +			}
>> +		} else if (reg == 1) {
>> +			eth1_node = eth_node;
>> +			if (!of_device_is_available(eth1_node)) {
>> +				of_node_put(eth1_node);
>> +				eth1_node = NULL;
>> +			}
> It depends on your DT, but is there any chance that more than once, we reach
> here in else case.
> { if (of_device_is_availabke(...) } ?
> 

Yes, we will enter here in case of "EPROBE_DEFER".

>> +		} else {
>> +			dev_err(dev, "port reg should be 0 or 1\n");
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
>> +		dev_err(dev, "port0 and port1 can't have same reg\n");
>> +		of_node_put(eth0_node);
>> +		return -ENODEV;
>> +	}
>> +
>> +	prueth->eth_node[PRUETH_MAC0] = eth0_node;
>> +	prueth->eth_node[PRUETH_MAC1] = eth1_node;
>  ...
> +
>> +	if (eth0_node) {
>> +		prueth->pru0 = pru_rproc_get(np, 0, &pruss_id0);
>> +		if (IS_ERR(prueth->pru0)) {
>> +			ret = PTR_ERR(prueth->pru0);
>> +			if (ret != -EPROBE_DEFER)
>> +				dev_err(dev, "unable to get PRU0: %d\n", ret);
>> +			goto put_pru;
>> +		}
>> +	}
>> +
>> +	if (eth1_node) {
>> +		prueth->pru1 = pru_rproc_get(np, 1, &pruss_id1);
>> +		if (IS_ERR(prueth->pru1)) {
>> +			ret = PTR_ERR(prueth->pru1);
>> +			if (ret != -EPROBE_DEFER)
>> +				dev_err(dev, "unable to get PRU1: %d\n", ret);
>> +			goto put_pru;
>> +		}
>> +	}
>> +
>> +	/* setup netdev interfaces */
>> +	if (eth0_node) {
>> +		ret = icssm_prueth_netdev_init(prueth, eth0_node);
>> +		if (ret) {
>> +			if (ret != -EPROBE_DEFER) {
>> +				dev_err(dev, "netdev init %s failed: %d\n",
>> +					eth0_node->name, ret);
>> +			}
>> +			goto put_pru;
>> +		}
>> +	}
>> +
>> +	if (eth1_node) {
>> +		ret = icssm_prueth_netdev_init(prueth, eth1_node);
>> +		if (ret) {
>> +			if (ret != -EPROBE_DEFER) {
>> +				dev_err(dev, "netdev init %s failed: %d\n",
>> +					eth1_node->name, ret);
>> +			}
>> +			goto netdev_exit;
>> +		}
>> +	}
>> +
>> +	/* register the network devices */
>> +	if (eth0_node) {
>> +		ret = register_netdev(prueth->emac[PRUETH_MAC0]->ndev);
>> +		if (ret) {
>> +			dev_err(dev, "can't register netdev for port MII0");
>> +			goto netdev_exit;
>> +		}
>> +
>> +		prueth->registered_netdevs[PRUETH_MAC0] =
>> +			prueth->emac[PRUETH_MAC0]->ndev;
>> +	}
>> +
>> +	if (eth1_node) {
>> +		ret = register_netdev(prueth->emac[PRUETH_MAC1]->ndev);
>> +		if (ret) {
>> +			dev_err(dev, "can't register netdev for port MII1");
>> +			goto netdev_unregister;
>> +		}
>> +
>> +		prueth->registered_netdevs[PRUETH_MAC1] =
>> +			prueth->emac[PRUETH_MAC1]->ndev;
>> +	}
>> +
>> +	if (eth1_node)
>> +		of_node_put(eth1_node);
>> +	if (eth0_node)
>> +		of_node_put(eth0_node);
> nit: A function would be better than code duplication for eth0_node and
> eth1_node ?

It is due to possibility of using a single node.


Thanks and Regards,
Parvathi.

