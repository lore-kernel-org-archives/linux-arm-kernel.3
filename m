Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D52CA1000
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 18:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BM2bi8XRe0Tu2TIMsONhhCSzDVLZSgA3tXyyfFdHX3Y=; b=BNeZCZBNo+b8s5QZkrpfPj6Xjm
	qLCE6QQUV02/2xosMGi/ZAkTVmQXmYEsDq7HwmvmddiogQRsDyUCSiizWXoYk2fSrFieLYG4uptoQ
	hCrysm5J4JK2bFb0O44idPZQndhA/y3KVoCm4ZY1OggaX80O1f11iAQFVDUVjG8nlukCcrFbfh7nQ
	11ZlQ+hqU584GX9HPOIbsDMTVB1zMpz7ToOIUNWbV41MuAnIq3rfKMFTT0E0DgbVTDJIo/Bb+LkoT
	eMRzlSkB+zGxomkcLm/c93NwPQ+iMlcovcsTAElMLSFXywq2DHDtYLbj2sz8vgDeIz+FoevPtoPvA
	TWfepotg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut8tW-0000000DWUc-1anG;
	Mon, 01 Sep 2025 18:04:42 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5sW-0000000CvPH-1ne1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 14:51:29 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 581En5Ht2389135;
	Mon, 1 Sep 2025 09:49:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756738145;
	bh=BM2bi8XRe0Tu2TIMsONhhCSzDVLZSgA3tXyyfFdHX3Y=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QTDqVkHuLE5jwYg6dSJ09edO1hNNNA9dWYcbctfJzbJU+MrSLbcIUsBB+c5t3DxY+
	 m0M6dPQuOBLcSSxTOM0vqMpQpEpWjyfqWGQd8vf/mULIDWLCyhtHAyA7KXOCsgZdKw
	 X/cSnefthPRuFHZx/h3Aj7sH4M6mA7L70XgG0ZA8=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 581En5ik2171508
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 1 Sep 2025 09:49:05 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 1
 Sep 2025 09:49:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 1 Sep 2025 09:49:04 -0500
Received: from [10.249.130.61] ([10.249.130.61])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 581EmpLK2668338;
	Mon, 1 Sep 2025 09:48:52 -0500
Message-ID: <1b892cde-bcdc-4a4e-83b7-35cc13eef8f4@ti.com>
Date: Mon, 1 Sep 2025 20:18:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v14 2/5] net: ti: icssm-prueth: Adds ICSSM
 Ethernet driver
To: Parvathi Pudi <parvathi@couthit.com>, <danishanwar@ti.com>,
        <rogerq@kernel.org>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
        <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <ssantosh@kernel.org>, <richardcochran@gmail.com>, <m-malladi@ti.com>,
        <s.hauer@pengutronix.de>, <afd@ti.com>, <jacob.e.keller@intel.com>,
        <horms@kernel.org>, <johan@kernel.org>, <m-karicheri2@ti.com>,
        <s-anna@ti.com>, <glaroque@baylibre.com>, <saikrishnag@marvell.com>,
        <kory.maincent@bootlin.com>, <diogo.ivo@siemens.com>,
        <javier.carrasco.cruz@gmail.com>, <basharath@couthit.com>
CC: <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <vadim.fedorenko@linux.dev>, <alok.a.tiwari@oracle.com>,
        <bastien.curutchet@bootlin.com>, <pratheesh@ti.com>, <prajith@ti.com>,
        <vigneshr@ti.com>, <praneeth@ti.com>, <srk@ti.com>, <rogerq@ti.com>,
        <krishna@couthit.com>, <pmohan@couthit.com>, <mohan@couthit.com>
References: <20250822132758.2771308-1-parvathi@couthit.com>
 <20250822132758.2771308-3-parvathi@couthit.com>
Content-Language: en-US
From: "Anwar, Md Danish" <a0501179@ti.com>
In-Reply-To: <20250822132758.2771308-3-parvathi@couthit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_075128_646496_56BED8FF 
X-CRM114-Status: GOOD (  14.30  )
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

Hi Parvathi,

On 8/22/2025 6:55 PM, Parvathi Pudi wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> Updates Kernel configuration to enable PRUETH driver and its dependencies
> along with makefile changes to add the new PRUETH driver.
> 
> Changes includes init and deinit of ICSSM PRU Ethernet driver including
> net dev registration and firmware loading for DUAL-MAC mode running on
> PRU-ICSS2 instance.
> 
> Changes also includes link handling, PRU booting, default firmware loading
> and PRU stopping using existing remoteproc driver APIs.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>

[ ... ]

> +	/* get mac address from DT and set private and netdev addr */
> +	ret = of_get_ethdev_address(eth_node, ndev);
> +	if (!is_valid_ether_addr(ndev->dev_addr)) {
> +		eth_hw_addr_random(ndev);
> +		dev_warn(prueth->dev, "port %d: using random MAC addr: %pM\n",
> +			 port, ndev->dev_addr);
> +	}
> +	ether_addr_copy(emac->mac_addr, ndev->dev_addr);
> +
> +	/* connect PHY */
> +	emac->phydev = of_phy_get_and_connect(ndev, eth_node,
> +					      icssm_emac_adjust_link);
> +	if (!emac->phydev) {
> +		dev_dbg(prueth->dev, "PHY connection failed\n");
> +		ret = -EPROBE_DEFER;
> +		goto free;
> +	}
> +

Why are you returning EPROBE_DEFER here? If phy connection fails, you
should just return and fail the probe. That's what ICSSG driver does.

In drivers/net/ethernet/ti/icssg/icssg_prueth.c

 404   │     ndev->phydev = of_phy_connect(emac->ndev, emac->phy_node,
 405   │                       &emac_adjust_link, 0,
 406   │                       emac->phy_if);
 407   │     if (!ndev->phydev) {
 408   │         dev_err(prueth->dev, "couldn't connect to phy %s\n",
 409   │             emac->phy_node->full_name);
 410   │         return -ENODEV;
 411   │     }


Before phy connect you do `dev_warn(prueth->dev, "port %d: using random
MAC addr: %pM\n"`

If device is using random mac address, this will be printed, your phy
connect fails, you try probe again, print comes again, phy fails again
and so on ...

This results in system getting spammed with continuos prints of "using
random MAC addr"

I suggest if phy fails, let the probe fail don't do EPROBE_DEFER.

Saw this issue on few boards which has issue with ICSSG phy.

> +	/* remove unsupported modes */
> +	phy_remove_link_mode(emac->phydev, ETHTOOL_LINK_MODE_10baseT_Full_BIT);
-- 
Thanks and Regards,
Md Danish Anwar


