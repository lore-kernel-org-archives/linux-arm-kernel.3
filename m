Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FCFF9D0C9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 12:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrEbNwq0wU+eIYA2Akm+iQiv1mTUuZg+JocQyt4c7kQ=; b=sit0kN1/o+dSUWY2j7s8aqr6Fi
	PtVtXnIlBw4teBwG1oh4yCwevbCi3U2nell0MR2RL4702OmHtK/PwvstGIa3gHAkMj7V52n3AOiwS
	gXT2Q1v95LmSG4KvsM6w4apyCSA3dMtEnP4mudoym1CpUrbc81AscGiKSeFV0kETFS0K0aPCVKKaV
	cd2yrQpSgDPA7wLhU/DCiJtzybLMqLi8wUzCleN/MBJ8idU3I/XMnXdv7Dvs1MdeP3JO9hgjhL0VI
	10qkE0BhI65x7NctlCtnemmkoNPW3VoSigfJH5oLxgnb4rMMAouYX+LMRihqmLqHa1y1UbPtXmVIL
	BtAg4SOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCd4A-0000000HJ5u-0bnq;
	Tue, 14 Apr 2026 12:40:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCd48-0000000HJ5j-1J8N;
	Tue, 14 Apr 2026 12:40:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E3B2160018;
	Tue, 14 Apr 2026 12:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A47EC19425;
	Tue, 14 Apr 2026 12:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776170426;
	bh=IPBwqh9d3tDbxmlKfehIU4Pa/JiRA+IdViszBuMtYAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l+o6JimJSyx0n76jesd6mCHnnhRw0R97PxIu1yNKcBHkqXebFznuJ4wQvjRE2Jf0r
	 H5pS6nhw8wsbwz6zcAlqNG0+5JM0yUpBW64Q0KUIC/saKUWa8CXBo8CLl0BM2tYwJe
	 /yC+jTNFhqchoZlVTqiV/NH+mGZ5zCTUFKmUfQ5amTHKmZan/hGLqkgcDOh6kqa5Un
	 PP3SGIGAMjuuVAOoIcpq4PAc+qTuDhjECcYVCgazCVL7I4txSLrm4WqhtAywLG8ZT5
	 8OAv6dyZbOFWMoLsr/jQnii/m3pNJqKNIaQz8rsCTasnzS6znKczm1Xh/+bt/nOdN9
	 Y5Du/+H/533tQ==
From: Simon Horman <horms@kernel.org>
To: lorenzo@kernel.org
Cc: 'Simon Horman' <horms@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Fix max TX packet length configuration
Date: Tue, 14 Apr 2026 13:40:11 +0100
Message-ID: <20260414124011.751922-1-horms@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412-airoha-fix-max-mtu-v1-1-333030d0a564@kernel.org>
References: <20260412-airoha-fix-max-mtu-v1-1-333030d0a564@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: 'Simon Horman' <horms@kernel.org>

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://sashiko.dev
---
net: airoha: Fix max TX packet length configuration

This commit fixes the MTU configuration for the Airoha driver by removing
ETH_FCS_LEN from the maximum TX packet length, matching the hardware
documentation which states the register does not include the FCS length.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index c14cdce588a7c..a81ffda72b39f 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1629,9 +1629,9 @@ static void airoha_update_hw_stats(struct airoha_gdm_port *port)
>  
>  static int airoha_dev_open(struct net_device *dev)
>  {
> -	int err, len = ETH_HLEN + dev->mtu + ETH_FCS_LEN;
>  	struct airoha_gdm_port *port = netdev_priv(dev);
>  	struct airoha_qdma *qdma = port->qdma;
> +	int err, len = ETH_HLEN + dev->mtu;

Does this regression cause MTU-sized VLAN-tagged frames to be dropped by the
hardware?

By limiting the frame size to ETH_HLEN + dev->mtu, the maximum allowed length
becomes 1514 bytes for a standard 1500 MTU. An Ethernet frame containing a
standard 802.1Q VLAN tag and a maximum-sized 1500-byte IP payload requires an
18-byte L2 header, making the total frame size 1518 bytes (excluding FCS).

Previously, the inclusion of ETH_FCS_LEN inadvertently provided the 4-byte
headroom needed to accommodate a single VLAN tag. 

Could the configuration explicitly account for VLAN headers using VLAN_ETH_HLEN
instead?

[ ... ]

