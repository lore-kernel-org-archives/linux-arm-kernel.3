Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34D5CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 14:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MqGd4dGQEDc9B35okJhvbxyP0Rp/RpHorOynofVJnc=; b=TMFFNccS6u+s/GT2YlTFfvrtbd
	azD10M31nH6+iW/rUHoSOptxr+/fu3R1PCNXRELyeBWXO0N83sPyueMkLWETd0a7L4j69C8p30XME
	5xt6VlZkvazFg9vP1JOXHZxnl0ZzlcyVvejiGRJhEdGMZi5CQoclNgmON505KgdNv5YOj4QeBloez
	qtLSkTcQjCFc7YjAIQRgToFjg0Lc88g3ocRw+NwnokVbwcdApXhGKRE60BQ+uS5FRLphwwjKTlnor
	VvhLrX7v//FbRMm2hac4Nba8HLnglqU518RvJzHt70VAV6bZztmgqIo81RWIYFK/NLKhY+pHwnxkI
	QpzD73uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5mOC-00000000C6u-0BLk;
	Mon, 06 Oct 2025 14:40:36 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5mO8-00000000C4i-0fct
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 14:40:34 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 596EcFqJ4077801;
	Mon, 6 Oct 2025 09:38:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759761495;
	bh=6MqGd4dGQEDc9B35okJhvbxyP0Rp/RpHorOynofVJnc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=R1KrgpF/shgqXllPhZJn/0LOpFciTL6MxG/JLmDVRcjn2xYQwsrQ9d3DBH+zjTfLS
	 xQ5hMGIA3orlHB0wHs0O1q42sFjL+9loFEz+3MXLx4Q9CUP05+l9PZr22hOQl2+k0F
	 /QAyH6TZb8vhvWHFDbmJP44M08Rp030eAo0ESwzQ=
Received: from DFLE210.ent.ti.com (dfle210.ent.ti.com [10.64.6.68])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 596EcF6Z2292605
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Oct 2025 09:38:15 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 6 Oct
 2025 09:38:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 6 Oct 2025 09:38:14 -0500
Received: from [10.249.130.74] ([10.249.130.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 596Ec8NT3823059;
	Mon, 6 Oct 2025 09:38:09 -0500
Message-ID: <44ed3d16-a8d2-49f3-a6b4-16d9a14d1cc6@ti.com>
Date: Mon, 6 Oct 2025 20:08:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v2 3/3] net: ti: icssm-prueth: Adds support
 for ICSSM RSTP switch
To: Parvathi Pudi <parvathi@couthit.com>, <andrew+netdev@lunn.ch>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <danishanwar@ti.com>, <rogerq@kernel.org>,
        <pmohan@couthit.com>, <basharath@couthit.com>, <afd@ti.com>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <pratheesh@ti.com>,
        <prajith@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>, <srk@ti.com>,
        <rogerq@ti.com>, <krishna@couthit.com>, <mohan@couthit.com>
References: <20251006104908.775891-1-parvathi@couthit.com>
 <20251006104908.775891-4-parvathi@couthit.com>
Content-Language: en-US
From: "Anwar, Md Danish" <a0501179@ti.com>
In-Reply-To: <20251006104908.775891-4-parvathi@couthit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_074032_368841_E57D62F7 
X-CRM114-Status: GOOD (  19.37  )
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

On 10/6/2025 4:17 PM, Parvathi Pudi wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> Adds support for RSTP switch mode by enhancing the existing ICSSM dual EMAC
> driver with switchdev support.
> 
> With this patch, the PRU-ICSSM is now capable of operating in switch mode
> with the 2 PRU ports acting as external ports and the host acting as an
> internal port. Packets received from the PRU ports will be forwarded to
> the host (store and forward mode) and also to the other PRU port (either
> using store and forward mode or via cut-through mode). Packets coming
> from the host will be transmitted either from one or both of the PRU ports
> (depending on the FDB decision).
> 
> By default, the dual EMAC firmware will be loaded in the PRU-ICSS
> subsystem. To configure the PRU-ICSS to operate as a switch, a different
> firmware must to be loaded.
> 
> Reviewed-by: Mohan Reddy Putluru <pmohan@couthit.com>
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> ---

[ ... ]>
> +static void icssm_prueth_change_to_switch_mode(struct prueth *prueth)
> +{
> +	bool portstatus[PRUETH_NUM_MACS];
> +	struct prueth_emac *emac;
> +	struct net_device *ndev;
> +	int i, ret;
> +
> +	for (i = 0; i < PRUETH_NUM_MACS; i++) {
> +		emac = prueth->emac[i];
> +		ndev = emac->ndev;
> +
> +		portstatus[i] = netif_running(ndev);
> +		if (!portstatus[i])
> +			continue;
> +
> +		ret = ndev->netdev_ops->ndo_stop(ndev);
> +		if (ret < 0) {
> +			netdev_err(ndev, "failed to stop: %d", ret);
> +			return;
> +		}
> +	}
> +
> +	prueth->eth_type = PRUSS_ETHTYPE_SWITCH;
> +
> +	for (i = 0; i < PRUETH_NUM_MACS; i++) {
> +		emac = prueth->emac[i];
> +		ndev = emac->ndev;
> +
> +		if (!portstatus[i])
> +			continue;
> +
> +		ret = ndev->netdev_ops->ndo_open(ndev);
> +		if (ret < 0) {
> +			netdev_err(ndev, "failed to start: %d", ret);
> +			return;
> +		}
> +	}
> +
> +	dev_info(prueth->dev, "TI PRU ethernet now in Switch mode\n");
> +}
> +
> +static void icssm_prueth_change_to_emac_mode(struct prueth *prueth)
> +{
> +	bool portstatus[PRUETH_NUM_MACS];
> +	struct prueth_emac *emac;
> +	struct net_device *ndev;
> +	int i, ret;
> +
> +	for (i = 0; i < PRUETH_NUM_MACS; i++) {
> +		emac = prueth->emac[i];
> +		ndev = emac->ndev;
> +
> +		portstatus[i] = netif_running(ndev);
> +		if (!portstatus[i])
> +			continue;
> +
> +		ret = ndev->netdev_ops->ndo_stop(ndev);
> +		if (ret < 0) {
> +			netdev_err(ndev, "failed to stop: %d", ret);
> +			return;
> +		}
> +	}
> +
> +	prueth->eth_type = PRUSS_ETHTYPE_EMAC;
> +
> +	for (i = 0; i < PRUETH_NUM_MACS; i++) {
> +		emac = prueth->emac[i];
> +		ndev = emac->ndev;
> +
> +		if (!portstatus[i])
> +			continue;
> +
> +		ret = ndev->netdev_ops->ndo_open(ndev);
> +		if (ret < 0) {
> +			netdev_err(ndev, "failed to start: %d", ret);
> +			return;
> +		}
> +	}
> +
> +	dev_info(prueth->dev, "TI PRU ethernet now in Dual EMAC mode\n");
> +}


The APIs icssm_prueth_change_to_emac_mode and
icssm_prueth_change_to_switch_mode seems identical. Won't it be better
to have one function to change modes and which mode to go to passed as
function argument.

	icssm_prueth_change_mode(prueth,mode);

This will also work seemlessly if you add more modes in future. With
current approach you will need to add new APIs
icssm_prueth_change_to_xyz_mode()


-- 
Thanks and Regards,
Md Danish Anwar


