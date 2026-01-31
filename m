Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2D0D46C1D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 01:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vH0lP79HaV5LbaTszb4NAbC9+QDgda8LyApKaCrIWE8=; b=TQc05xdwdREjbSF7FbMNvkD37/
	mO5PwmpGH4gGvONWAR+yoHwLXIUIFHlJo7ww+BrJbGmrnQhQLFKAYn/g53m7t8mIEpEqhwYBDZxgp
	hRu+rt4NcC9BhXVlbZ9cfRismPKlsRSdj4VsjJNfwgQD3VqJWo2SqBvxpvZRKMWRTNFLrvFcZ3wef
	O+8HoOeCCBaegKykh9ja/mNjmM4tR8kG0G66sh1GEGKLPTBJ4gBqP5YRANixMYXYMOH5btbko8IHG
	mjdAyBJiOc7fQdaWpy4Se48RDLE5ybliTnpqcJJw/OSUy9uWRmFFqzGOE2RErZmLEQ6VFOY55fBTn
	PcaVFdvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm0CE-00000002D3n-3FgB;
	Sat, 31 Jan 2026 01:54:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm0C9-00000002D1p-1MC9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 01:54:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B7A160008;
	Sat, 31 Jan 2026 01:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 307CFC19421;
	Sat, 31 Jan 2026 01:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769824480;
	bh=mwWaS4H/LxHe5XEFQqTOAXnZqbeC9QaLnwYKAnsw5zA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A6jsBIXW6Zwo5I+kZ/SjmoTdAmJhFmdiNiMuU9spwWhbSDAK5BSn6E018EOXF1RKX
	 eLnJOnRCxSd63EKnPdwRYh+q9TXS4HoTLUwcDSYxgfd0WUPNZT6Q1KAfHuG91C7kjp
	 oJbKG79e9JmT3w0ATU6qRap31lvoBppmcOtfWRZY/g3ynv3yEcDdIfqrZIlype8/a7
	 /4AgqSAJiRnReNTQzEOtBAWSU14RFeYus/4f6fkRw+6nbEXCh7+LLxyhpko81LQlhq
	 FWDWLT6Ca0XPk6S5KnT0WlCsCrf4Wh7i7EVtXUixtyIQmG577FAklQ+9w3L9yQWzld
	 gF5wLQSIWRP7A==
From: Jakub Kicinski <kuba@kernel.org>
To: lukasz.majewski@mailbox.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	devicetree@vger.kernel.org,
	horms@kernel.org,
	krzk+dt@kernel.org,
	s.hauer@pengutronix.de,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de,
	richardcochran@gmail.com,
	shawnguo@kernel.org,
	edumazet@google.com,
	linux-arm-kernel@lists.infradead.org,
	andrew+netdev@lunn.ch,
	pabeni@redhat.com,
	wahrenst@gmx.net,
	davem@davemloft.net,
	festevam@gmail.com,
	conor+dt@kernel.org,
	imx@lists.linux.dev,
	andrew@lunn.ch,
	robh@kernel.org
Subject: Re: [net-next,v21,6/7] net: mtip: Extend the L2 switch driver with management operations
Date: Fri, 30 Jan 2026 17:54:37 -0800
Message-ID: <20260131015438.972436-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129110154.1699976-7-lukasz.majewski@mailbox.org>
References: <20260129110154.1699976-7-lukasz.majewski@mailbox.org>
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: mtip: Extend the L2 switch driver with management operations

This patch adds management functions for the L2 switch including VLAN
configuration, port learning/blocking, multicast/broadcast control,
and forced forwarding for port separation.

> diff --git a/drivers/net/ethernet/freescale/mtipsw/mtipl2sw_mgnt.c b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw_mgnt.c
> --- /dev/null
> +++ b/drivers/net/ethernet/freescale/mtipsw/mtipl2sw_mgnt.c

[ ... ]

> +int mtip_vlan_input_process(struct switch_enet_private *fep,
> +			    int port, int mode, unsigned short port_vlanid,
> +			    int vlan_verify_en, int vlan_domain_num,
> +			    int vlan_domain_port)
> +{
> +	/* Only modes from 1 to 4 are valid*/
> +	if (mode < 0 || mode > 4) {
                       ^^^^

The comment says modes 1-4 are valid, but the condition allows mode 0
to pass through. Should the check be "mode < 1" instead, or is the
comment incorrect and mode 0 is actually valid?

> +		dev_err(&fep->pdev->dev,
> +			"%s: VLAN input processing mode (%d) not supported\n",
> +			__func__, mode);
> +		return -EINVAL;
> +	}

[ ... ]

