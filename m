Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48679CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 09:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stypqYixykz0edCBvjzPmFemgegjwJCNpmxRea78PU4=; b=Tphss4MkHLEBKU79dADDkuci6g
	gRrOhtU0n3WHCP4DSHAELyVR0fuN3CmyX2hReAz0wJlkA81B8HJ6Y7D2NF8Ttp3aTeg6Q9xQPfQHM
	BeinNb8Fa/vqowC78RiTqKEFwQctmuVyt+YHpqqwgBQAkVLfPBQYr4tviC+ektG/WU/4VdZAKURSp
	66UIdFCUlnphR/ZA2mfwDNGwB+GQMQGCB4yV+GB40qgcWa86QZbKaGpbzemkuI5AoRet/XUWE91B3
	aGH55R9av4dtkWEjhwBTnpo9dyf561xKPwOjsMHlZ2f2Kg4tMKFGl/LrbF/UCmoBVEndSSvz6m6ha
	YvJf5+EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvXR-0000000F6Fp-3Hpb;
	Wed, 14 Oct 2026 09:44:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvXO-0000000F6BA-1ThP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 09:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791971083; x=1823507083;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ysek4aHBu0K0buhWqgycnMaaYu9WclMvVNBclLQQdm0=;
  b=I4VviG3B8i+xFfimi7myL1QNuG5VmdN+Obhxwc0XfoYTLbNcXVvcao6H
   xGp8Pb3EVPEZVg/vmHIjbe205kMcwTS3+YSOtUK6KnvXN/yxumkevMHbc
   OLdxNrGGD3YQq9kdOFwqHjx+yZeIkC6WhOXHWOlRiPsWmkhxGTYPZ3hwB
   PEW7RP6U8UKpmFvcUBcAOzia18RG3iaAGNlZc/W/MGYXlvHHoT/3wLDdH
   NhhHbWamDtSceZGAx8v/m5dqgnt7T0SKo5+ec551iv6hgB6QZPvdpigzN
   Qgg53uKsdhWMw2osH7qmsA4K9V7nsXDccm4hpswAoVpUOaV0Ryy6Q2NBO
   g==;
X-CSE-ConnectionGUID: boNXzslZQNSo+OPTzTF2vw==
X-CSE-MsgGUID: fBHndb8dQ7CH8LVtG9XtNg==
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="296435375"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Oct 2026 02:44:41 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 14 Oct 2026 02:44:39 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 14 Oct 2026 02:44:37 -0700
Date: Wed, 14 Oct 2026 11:44:37 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next 0/5] net: sparx5: add tc matchall port policer
 offload
Message-ID: <20261014094437.tunkwehr5w6v7hdn@DEN-DL-M70577>
References: <20261009-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v1-0-4916708a7ea2@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261009-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v1-0-4916708a7ea2@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_024442_638316_1EB7E466 
X-CRM114-Status: GOOD (  19.99  )
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

> This series adds offload of tc matchall filters with a police action to
> the ingress port policers of Sparx5 and lan969x, which are both served
> by the sparx5 driver.
> 
> In hardware, each ingress port has four single-rate leaky bucket
> policers. A policer drops the frames that exceed its rate and burst.
> The four policers of a port share the pass and drop statistics counters
> of the port.
> 
> The driver uses one policer per port, because with more than one, the
> statistics reported to tc could not be attributed to the right policer.
> This matches lan966x and ocelot. The policer meters each frame
> including 20 bytes of preamble and inter-frame gap, so the configured
> rate is a line rate, also as on lan966x and ocelot.
> 
> Since the policer meters all ingress frames on the port, only filters on
> chain 0 with protocol all are offloaded, and filters on shared blocks
> are rejected. Only drop is supported as the exceed action, and the
> police overhead parameter is not supported.
> 
> Patch #1 drops a redundant prefix from the existing POL_UPD_INT_CFG
> register macros.
> 
> Patch #2 adds the registers used by the port policer.
> 
> Patch #3 tracks whether the ingress block of a port is shared, and adds
> the per-port policer state.
> 
> Patch #4 adds the hardware programming of the port policer.
> 
> Patch #5 adds the tc matchall offload.
> 
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
> ---
> Daniel Machon (5):
>       net: sparx5: Drop redundant POL_ prefix from POL_UPD_INT_CFG
>       net: sparx5: Add registers used by the port policer
>       net: sparx5: Track shared tc blocks and per-port policer state
>       net: sparx5: Add hardware programming for the port policer
>       net: sparx5: Offload tc port policers via matchall
> 
>  .../microchip/sparx5/lan969x/lan969x_regs.c        |   7 +
>  .../net/ethernet/microchip/sparx5/sparx5_ethtool.c |   1 +
>  .../net/ethernet/microchip/sparx5/sparx5_main.c    |   6 +-
>  .../net/ethernet/microchip/sparx5/sparx5_main.h    |  36 +-
>  .../ethernet/microchip/sparx5/sparx5_main_regs.h   | 117 +++++-
>  .../net/ethernet/microchip/sparx5/sparx5_police.c  | 404 ++++++++++++++++++++-
>  drivers/net/ethernet/microchip/sparx5/sparx5_qos.c |   4 +
>  .../net/ethernet/microchip/sparx5/sparx5_regs.c    |   7 +
>  .../net/ethernet/microchip/sparx5/sparx5_regs.h    |   7 +
>  drivers/net/ethernet/microchip/sparx5/sparx5_tc.c  |  14 +-
>  .../ethernet/microchip/sparx5/sparx5_tc_matchall.c |  38 ++
>  11 files changed, 627 insertions(+), 14 deletions(-)
> ---
> base-commit: d8674294aefef02266c4d47ad10131f1bffbe534
> change-id: 20260930-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-474610756e26
> 
> Best regards,
> -- 
> Daniel Machon <daniel.machon@microchip.com>
>

At least a few medium severity issues reported by sashiko are worth fixing. I
will respin a v2.

pw-bot: cr


