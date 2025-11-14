Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C40CE7AAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 10:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVI70XYhKYZsLUwKcSgm0ZILaXsijNoyMVaO+azULSE=; b=d2yl++pfCcRpmQjsaQZlCCqbN6
	K53cbzn04o9NqLoJCKkbKp92rAb45im01eZHRX24Ps2o12qcApg5wHVscxahp0SqfpBmloP0dBTaW
	FnZhoj/m2SY/WlX7rcH9RTDk8ghyP3gkPhOjx1+6HUQgLyffbjbEMCNZXeOODzaUKOCQ9WV/QUycI
	ZAZLi0BWmY2W5XpS5wSQkBPrmum/FvzX3Y4GB7VCMR5bigWqRvqWDpaRXstScPAB2DPH7+Ppiic6r
	9BjnBPS5uh1UDiry3h06aZHo2ma9VHDV7qDLRrcFPdWXNw66VmQ/Upv7t3Ko9r0+0FSxTaCg33p5h
	nXH2tJig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqkU-0000000ByiL-2bhD;
	Fri, 14 Nov 2025 10:09:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqkT-0000000Byhv-0ajY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 10:09:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7487843EF8;
	Fri, 14 Nov 2025 10:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0E2C4CEF8;
	Fri, 14 Nov 2025 10:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763114984;
	bh=3FPisBOj9ak9xPE4SRE6FfLYTzBMXBsTCrX3XBItwsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dAH3EZ89a4elLYpbNHW8qvo2f6IxnT+9vSDLnBIzISDEtTbgFR6RfLxV/HqIwtjrJ
	 0b1wt4Gezo3lqYZgOJcHiWo1ow/pVPe+xx5r9Uo1XNuhJOf4wVObbRJodU4j7FeJd9
	 q6uXtcaDGCEMoHazQ8enQKc2//ot+OApLd2z5n/BLVoAinejtYeALxPEFjdhcrCnbO
	 K5pd7GmCAbYPH+PfMNW4q1mgdcIh5YZzbyGa2PgevNCYwZECQsajWcl1gBOICKeLZQ
	 aNH63QF0rClbWlrfFDyKdwM6Fr7JGpShEwEVFygr78BGU0B6PaJGyjtfP1leUudVd4
	 Hx9qeKgz8COCQ==
Date: Fri, 14 Nov 2025 10:09:39 +0000
From: Simon Horman <horms@kernel.org>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	maxime.chevallier@bootlin.com, boon.khai.ng@altera.com,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] net: stmmac: Fix VLAN 0 deletion in
 vlan_del_hw_rx_fltr()
Message-ID: <aRb_42Er4k9tMGZO@horms.kernel.org>
References: <20251111093000.58094-1-ovidiu.panait.rb@renesas.com>
 <20251111093000.58094-2-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111093000.58094-2-ovidiu.panait.rb@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_020945_201659_5EBC37AE 
X-CRM114-Status: GOOD (  15.52  )
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

On Tue, Nov 11, 2025 at 09:29:59AM +0000, Ovidiu Panait wrote:
> When the "rx-vlan-filter" feature is enabled on a network device, the 8021q
> module automatically adds a VLAN 0 hardware filter when the device is
> brought administratively up.
> 
> For stmmac, this causes vlan_add_hw_rx_fltr() to create a new entry for
> VID 0 in the mac_device_info->vlan_filter array, in the following format:
> 
>     VLAN_TAG_DATA_ETV | VLAN_TAG_DATA_VEN | vid
> 
> Here, VLAN_TAG_DATA_VEN indicates that the hardware filter is enabled for
> that VID.
> 
> However, on the delete path, vlan_del_hw_rx_fltr() searches the vlan_filter
> array by VID only, without verifying whether a VLAN entry is enabled. As a
> result, when the 8021q module attempts to remove VLAN 0, the function may
> mistakenly match a zero-initialized slot rather than the actual VLAN 0
> entry, causing incorrect deletions and leaving stale entries in the
> hardware table.
> 
> Fix this by verifying that the VLAN entry's enable bit (VLAN_TAG_DATA_VEN)
> is set before matching and deleting by VID. This ensures only active VLAN
> entries are removed and avoids leaving stale entries in the VLAN filter
> table, particularly for VLAN ID 0.
> 
> Fixes: ed64639bc1e08 ("net: stmmac: Add support for VLAN Rx filtering")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Simon Horman <horms@kernel.org>


