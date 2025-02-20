Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349F4C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 09:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6z79uj0D+hvHkgcPpuUpI1aZTG2v3akXnDlrGc8hqU=; b=Vhlq9IlUQ7AsTFwQYEoTMoWkKA
	v15FqjyocEIaQ5wzlRh24umQ09hFS8BQO+hBhRtSTyoYFigS3ZgQXIdsZOs2fFP0jtiXShTIF9v8w
	pxOXAcDAyatYFyfgCrGQWDEd4JPio9h4UQl0X/TbEdeFI5vmUGiQ6fQ/7KrBCPxmVV0UGr5JRDUgE
	CXi+rjNdF4mKqpKoOLzBZDPK6lTF7bPNvvGoPcDt8PnCI8B58KMGFrwpfObTFs5BtGHsq6yYxWqBm
	cprvkMnp/bBQZPP0HDgXGWJnxY1/rU8XmgRofleuE+bP5RqAniiw9Q1Qa3gEm1IYDFTtIH1Jy3ic1
	lHbXY+eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2qv-000000001GZ-3HuA;
	Thu, 20 Feb 2025 09:28:17 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174] helo=mx0b-0016f401.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2kJ-0000000HaOW-0ITU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 09:21:28 +0000
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K7Zctf023149;
	Thu, 20 Feb 2025 01:19:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=V6z79uj0D+hvHkgcPpuUpI1aZ
	TG2v3akXnDlrGc8hqU=; b=JA1HLaGcYiGl7zln21xvb7uit6enZw6xlti8mDBlR
	G4SJbwbdO7iO819Aev81Ct6m/q/6A1Kc4n+tXBmtMZehhrJPWZL4LkJCOexaL01n
	tiQUPOBB9Ho/r3kG8CDGMp5SyIPW5rgylecfEDo7M64xRQgi971JyIQSkDNW2l8H
	LWGW5gZac97OMItRvqat+JY/TRgM0rwWnCxHupHXGrZhusaDqKyNhO2Hvy+M+lca
	SQwWFYwWbr0su9QcSS6+vo984zcS3e2kBZ7Mfob/SoXWFI83t6FmQzXWFsgzy7uk
	gbzH1GqlhrS+2R2j6pCRF1BSHmawI4HEWaIp6vX+CDKMA==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 44x04yg88b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 01:19:16 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 20 Feb 2025 01:19:15 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 20 Feb 2025 01:19:15 -0800
Received: from maili.marvell.com (unknown [10.28.36.165])
	by maili.marvell.com (Postfix) with SMTP id BE6253F7058;
	Thu, 20 Feb 2025 01:19:05 -0800 (PST)
Date: Thu, 20 Feb 2025 14:49:04 +0530
From: Ratheesh Kannoth <rkannoth@marvell.com>
To: parvathi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v3 02/10] net: ti: prueth: Adds ICSSM Ethernet
 driver
Message-ID: <20250220091904.GA1230612@maili.marvell.com>
References: <20250214054702.1073139-1-parvathi@couthit.com>
 <20250214054702.1073139-3-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250214054702.1073139-3-parvathi@couthit.com>
X-Proofpoint-ORIG-GUID: PTTJNwmlFUm2mcEocC2aGHWKxK5J707q
X-Proofpoint-GUID: PTTJNwmlFUm2mcEocC2aGHWKxK5J707q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_03,2025-02-20_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_012127_136193_529E4334 
X-CRM114-Status: GOOD (  21.11  )
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
Cc: nm@ti.com, vigneshr@ti.com, praneeth@ti.com, edumazet@google.com, krishna@couthit.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, m-karicheri2@ti.com, basharath@couthit.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, richardcochran@gmail.com, prajith@ti.com, rogerq@kernel.org, jacob.e.keller@intel.com, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, horms@kernel.org, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 2025-02-14 at 11:16:54, parvathi (parvathi@couthit.com) wrote:
> From: Roger Quadros <rogerq@ti.com>
>
> +static int icssm_prueth_probe(struct platform_device *pdev)
> +{
> +	struct device_node *eth0_node = NULL, *eth1_node = NULL;
> +	struct device_node *eth_node, *eth_ports_node;
> +	enum pruss_pru_id pruss_id0, pruss_id1;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np;
> +	struct prueth *prueth;
> +	int i, ret;
> +
> +	np = dev->of_node;
> +	if (!np)
> +		return -ENODEV; /* we don't support non DT */
> +
> +	prueth = devm_kzalloc(dev, sizeof(*prueth), GFP_KERNEL);
> +	if (!prueth)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, prueth);
> +	prueth->dev = dev;
> +	prueth->fw_data = device_get_match_data(dev);
> +
> +	eth_ports_node = of_get_child_by_name(np, "ethernet-ports");
> +	if (!eth_ports_node)
> +		return -ENOENT;
> +
> +	for_each_child_of_node(eth_ports_node, eth_node) {
> +		u32 reg;
> +
> +		if (strcmp(eth_node->name, "ethernet-port"))
> +			continue;
> +		ret = of_property_read_u32(eth_node, "reg", &reg);
> +		if (ret < 0) {
> +			dev_err(dev, "%pOF error reading port_id %d\n",
> +				eth_node, ret);
> +		}
> +
> +		of_node_get(eth_node);
> +
> +		if (reg == 0) {
> +			eth0_node = eth_node;
> +			if (!of_device_is_available(eth0_node)) {
> +				of_node_put(eth0_node);
> +				eth0_node = NULL;
> +			}
> +		} else if (reg == 1) {
> +			eth1_node = eth_node;
> +			if (!of_device_is_available(eth1_node)) {
> +				of_node_put(eth1_node);
> +				eth1_node = NULL;
> +			}
It depends on your DT, but is there any chance that more than once, we reach here in else case.
 { if (of_device_is_availabke(...) } ?

> +		} else {
> +			dev_err(dev, "port reg should be 0 or 1\n");
> +		}
> +	}
> +
> +	of_node_put(eth_ports_node);
> +
> +	/* At least one node must be present and available else we fail */
> +	if (!eth0_node && !eth1_node) {
> +		dev_err(dev, "neither port0 nor port1 node available\n");
> +		return -ENODEV;
> +	}
> +
> +	if (eth0_node == eth1_node) {
> +		dev_err(dev, "port0 and port1 can't have same reg\n");
> +		of_node_put(eth0_node);
> +		return -ENODEV;
> +	}
> +
> +	prueth->eth_node[PRUETH_MAC0] = eth0_node;
> +	prueth->eth_node[PRUETH_MAC1] = eth1_node;
  ...
+
> +	if (eth0_node) {
> +		prueth->pru0 = pru_rproc_get(np, 0, &pruss_id0);
> +		if (IS_ERR(prueth->pru0)) {
> +			ret = PTR_ERR(prueth->pru0);
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(dev, "unable to get PRU0: %d\n", ret);
> +			goto put_pru;
> +		}
> +	}
> +
> +	if (eth1_node) {
> +		prueth->pru1 = pru_rproc_get(np, 1, &pruss_id1);
> +		if (IS_ERR(prueth->pru1)) {
> +			ret = PTR_ERR(prueth->pru1);
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(dev, "unable to get PRU1: %d\n", ret);
> +			goto put_pru;
> +		}
> +	}
> +
> +	/* setup netdev interfaces */
> +	if (eth0_node) {
> +		ret = icssm_prueth_netdev_init(prueth, eth0_node);
> +		if (ret) {
> +			if (ret != -EPROBE_DEFER) {
> +				dev_err(dev, "netdev init %s failed: %d\n",
> +					eth0_node->name, ret);
> +			}
> +			goto put_pru;
> +		}
> +	}
> +
> +	if (eth1_node) {
> +		ret = icssm_prueth_netdev_init(prueth, eth1_node);
> +		if (ret) {
> +			if (ret != -EPROBE_DEFER) {
> +				dev_err(dev, "netdev init %s failed: %d\n",
> +					eth1_node->name, ret);
> +			}
> +			goto netdev_exit;
> +		}
> +	}
> +
> +	/* register the network devices */
> +	if (eth0_node) {
> +		ret = register_netdev(prueth->emac[PRUETH_MAC0]->ndev);
> +		if (ret) {
> +			dev_err(dev, "can't register netdev for port MII0");
> +			goto netdev_exit;
> +		}
> +
> +		prueth->registered_netdevs[PRUETH_MAC0] =
> +			prueth->emac[PRUETH_MAC0]->ndev;
> +	}
> +
> +	if (eth1_node) {
> +		ret = register_netdev(prueth->emac[PRUETH_MAC1]->ndev);
> +		if (ret) {
> +			dev_err(dev, "can't register netdev for port MII1");
> +			goto netdev_unregister;
> +		}
> +
> +		prueth->registered_netdevs[PRUETH_MAC1] =
> +			prueth->emac[PRUETH_MAC1]->ndev;
> +	}
> +
> +	if (eth1_node)
> +		of_node_put(eth1_node);
> +	if (eth0_node)
> +		of_node_put(eth0_node);
nit: A function would be better than code duplication for eth0_node and eth1_node ?
> +	return 0;
> +
> +netdev_unregister:
> +	for (i = 0; i < PRUETH_NUM_MACS; i++) {
> +		if (!prueth->registered_netdevs[i])
> +			continue;
> +		unregister_netdev(prueth->registered_netdevs[i]);
> +	}
> +
> +netdev_exit:
> +	for (i = 0; i < PRUETH_NUM_MACS; i++) {
> +		eth_node = prueth->eth_node[i];
> +		if (!eth_node)
> +			continue;
> +
> +		icssm_prueth_netdev_exit(prueth, eth_node);
> +	}
> +
> +put_pru:
> +	if (eth1_node) {
> +		if (prueth->pru1)
> +			pru_rproc_put(prueth->pru1);
> +		of_node_put(eth1_node);
> +	}
> +
> +	if (eth0_node) {
> +		if (prueth->pru0)
> +			pru_rproc_put(prueth->pru0);
> +		of_node_put(eth0_node);
> +	}
> +
> +	return ret;
> +}
> +

