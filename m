Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93865C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 01:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TPUN1WvsE3bUKCu+FnLHn7klpS8pjnbJwrz7uQ/HrDs=; b=DajY684HEPm+Oz
	cRV7PaC6Oc41yxe0ehHfKEVJva7FRmuTMA0NrKNEUHvIIASdOrYTmsoK1s+sTfM/k05HU+XrdWjE/
	h6YTZyYkweK+22wwNWBhVCdIfe6RtJWSYVNbFiA5CBo6j0wqlkd9/63R0RQqkR1FqRdg1PKbZ7Ag0
	hgRbhn6dHbf84Y0o+9D5EYBJ6CuS8CaaxFUuWR68klZaYr+EDcawIZsHvpSzURjn0ITQdcxCWMJVm
	+5VyqiZjrHVyVmsVVB4caCuMH19g9DF2+WcBviKUd7nk55ammPHXdtrQW7DV6A9MRM8czvO84K0h9
	Q6zThFMiEH5ku3AFHKKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueOfc-00000003oTs-16KG;
	Wed, 23 Jul 2025 01:53:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueOaH-00000003nyX-1xVS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 01:47:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 39F0E5C6805;
	Wed, 23 Jul 2025 01:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A242C4CEEB;
	Wed, 23 Jul 2025 01:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753235271;
	bh=Mb7U/KhjDFYsWZAeq7kpLX/tB1mdXgzYH+ofNnJA7w8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eSaxlIQUL3eEVbxCOQIkht46i9qOkmpPjC5awQyRZf+80aAT4OZIJZUgFL0KzvJob
	 jJN9p51Z2Gn4Jjut7HLS2qSJ2CVjZLi7xvRlDmvJH6ovV+oomM+l9vLsoj9OnTbtpW
	 gxs+lyqFOALDov3oq+hcqHiX5bceaHhcg3F2jZnSRCskO2KltNrL1K3hCADq/ykMAl
	 dgy5YzH7L4s2rPVAubBNabH9/l+qwCEmNDieDGEv+uN28T8PLqc2BcIgO84RMCRbiz
	 CXaYalL5ZiufedGuZVCYL1iAm0lLSPJPgbuugLy4hJuM57rIH6Gm01wEMYqpqD4y7f
	 Cib+Y+5jAPyhA==
Date: Tue, 22 Jul 2025 18:47:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v11 2/5] net: ti: prueth: Adds ICSSM Ethernet
 driver
Message-ID: <20250722184749.0c04d669@kernel.org>
In-Reply-To: <20250722132700.2655208-3-parvathi@couthit.com>
References: <20250722132700.2655208-1-parvathi@couthit.com>
	<20250722132700.2655208-3-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_184753_557530_E4889B14 
X-CRM114-Status: GOOD (  10.39  )
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
Cc: pratheesh@ti.com, vigneshr@ti.com, praneeth@ti.com, edumazet@google.com, glaroque@baylibre.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, saikrishnag@marvell.com, m-karicheri2@ti.com, jacob.e.keller@intel.com, pabeni@redhat.com, richardcochran@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, mohan@couthit.com, s.hauer@pengutronix.de, prajith@ti.com, rogerq@kernel.org, basharath@couthit.com, ssantosh@kernel.org, vadim.fedorenko@linux.dev, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, kory.maincent@bootlin.com, m-malladi@ti.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, horms@kernel.org, krishna@couthit.com, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, 22 Jul 2025 18:55:02 +0530 Parvathi Pudi wrote:
> +	for_each_child_of_node(eth_ports_node, eth_node) {
> +		u32 reg;
> +
> +		if (strcmp(eth_node->name, "ethernet-port"))
> +			continue;
> +		ret = of_property_read_u32(eth_node, "reg", &reg);
> +		if (ret < 0) {
> +			dev_err(dev, "%pOF error reading port_id %d\n",
> +				eth_node, ret);
> +			return ret;

missing put for eth_node

> +		}
> +
> +		of_node_get(eth_node);
> +
> +		if (reg == 0 && !eth0_node) {
> +			eth0_node = eth_node;
> +			if (!of_device_is_available(eth0_node)) {
> +				of_node_put(eth0_node);
> +				eth0_node = NULL;
> +			}
> +		} else if (reg == 1 && !eth1_node) {
> +			eth1_node = eth_node;
> +			if (!of_device_is_available(eth1_node)) {
> +				of_node_put(eth1_node);
> +				eth1_node = NULL;
> +			}
> +		} else {
> +			if (reg == 0 || reg == 1)
> +				dev_err(dev, "duplicate port reg value: %d\n",
> +					reg);
> +			else
> +				dev_err(dev, "invalid port reg value: %d\n",
> +					reg);
> +
> +			of_node_put(eth_node);
> +		}
> +	}
-- 
pw-bot: cr

