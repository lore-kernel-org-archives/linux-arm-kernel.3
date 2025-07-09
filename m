Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C753C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 00:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T0KjxWnOZKFR+DC/cXe5FqkSc0W9wzLMfGMQEu0yxtk=; b=nzXscB3+bQ1+oV
	hPn18g41/lUIofESRHEJsdWv83PHlPm1x44tcvMJBBbVY+AsuAcKMxNY/xYFk6p6NNuRRYnAv44Xl
	LvasNR6/fpVCE84bMXGL3Pdn23OuOftQwEOmVSvoQC5fdcqHmnyVc/Y1vEBo6Hf4KsvYIzVnHUGLJ
	VRzYoKwp/x+alyaHV+W9b4McSgiGo9LSMrUu89rJbjAfF4dvgfAiZMx8INjBQSSlLMdHBUd6eUj2L
	fFtcEUeqEXwqmN3BL3pIWedwlv/X/+nHxxtr5TE8Qp8DdBBNbViN7BiFiNbBxfVBe2quhxusxoUdj
	jlrEC6n/jmzN6kNRleyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZIxz-000000072bR-1dT3;
	Wed, 09 Jul 2025 00:47:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZIvd-000000072S0-1jr4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 00:44:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2266FA54509;
	Wed,  9 Jul 2025 00:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13BA4C4CEED;
	Wed,  9 Jul 2025 00:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752021891;
	bh=T4lJ7IfchIx8O9WvBI06w6cJ9APqPZYrqfcn3GERTnc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=i9kuF89ldU0b1uMh3vMccYfMUpaz3W1vZn1wwiXEZTgBtDuDh7QZCKIlx5BCCu4Z2
	 RFir5VLFXA9imk7oK0V/i1q7OGqEvsGd1UI0deRqedVHXc9a34nrNB0CMA3XXEtzBW
	 aOTxcyh+eE3AqQOcE66QQby60yMccydVdqtGBps2Xwa2vsHjkDYxG9jwaiJu2gHImJ
	 dztPSn8gNNS3SM3jdvnAA53lxAO6COWG1aA3en5UTk/V4SYsukxIzb3nrm7BZDNSj0
	 IRKPMnGfg0ZxbB2qo6TZv6Fg+syBlOV5QDM79wrAJgtZ4AEsUi9/X94edNtJ4+1Qcy
	 1gMu1pQXGmRcg==
Date: Tue, 8 Jul 2025 17:44:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v10 02/11] net: ti: prueth: Adds ICSSM Ethernet
 driver
Message-ID: <20250708174449.3e8744c5@kernel.org>
In-Reply-To: <20250702140633.1612269-3-parvathi@couthit.com>
References: <20250702140633.1612269-1-parvathi@couthit.com>
	<20250702140633.1612269-3-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_174453_530580_971A6CD8 
X-CRM114-Status: GOOD (  13.58  )
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
Cc: vigneshr@ti.com, praneeth@ti.com, edumazet@google.com, glaroque@baylibre.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, saikrishnag@marvell.com, m-karicheri2@ti.com, jacob.e.keller@intel.com, pabeni@redhat.com, richardcochran@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, mohan@couthit.com, s.hauer@pengutronix.de, prajith@ti.com, rogerq@kernel.org, basharath@couthit.com, ssantosh@kernel.org, vadim.fedorenko@linux.dev, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, horms@kernel.org, krishna@couthit.com, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed,  2 Jul 2025 19:36:24 +0530 Parvathi Pudi wrote:
> +		if (ret < 0) {
> +			dev_err(dev, "%pOF error reading port_id %d\n",
> +				eth_node, ret);
> +		}

unnecessary parenthesis, but also did you mean to error out here?

> +			dev_err(dev, "port reg should be 0 or 1\n");
> +			of_node_put(eth_node);

this error will also trigger if same port is specified multiple times

+			ret = PTR_ERR(prueth->pru1);
+			if (ret != -EPROBE_DEFER)
+				dev_err(dev, "unable to get PRU1: %d\n", ret);
+			goto put_pru;

dev_err_probe() ?

> +/**
> + * struct prueth_private_data - PRU Ethernet private data
> + * @fw_pru: firmware names to be used for PRUSS ethernet usecases
> + * @support_lre: boolean to indicate if lre is enabled
> + * @support_switch: boolean to indicate if switch is enabled

Please improve or remove this, adding kdoc which doesn't explain
anything is discouraged per kernel coding style.

This one is actually more confusing than helpful the fields are
called "support" but kdoc says "enabled". Maybe name the fields
'enabled' ?

> + */
> +struct prueth_private_data {
> +	const struct prueth_firmware fw_pru[PRUSS_NUM_PRUS];
> +	bool support_lre;
> +	bool support_switch;
> +};
> +
> +/* data for each emac port */
> +struct prueth_emac {
> +	struct prueth *prueth;
> +	struct net_device *ndev;
> +
> +	struct rproc *pru;
> +	struct phy_device *phydev;
> +
> +	int link;
> +	int speed;
> +	int duplex;
> +
> +	enum prueth_port port_id;
> +	const char *phy_id;
> +	u8 mac_addr[6];
> +	phy_interface_t phy_if;
> +	spinlock_t lock;	/* serialize access */

'serialize access' to what? Which fields does it protect?
-- 
pw-bot: cr

