Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E3DEE36B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 17:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVoDgNvFPAPR1EbqgE32vWztdqGv08NyBHpovwVsjTU=; b=x4pmWDYBQl2uXEiQxh7UC00e3A
	rRhyR6RXOysvRWD27CcK9QL5Ir3YkAWu4ICKTk4+Mk3tZK8IzLpHJcftmMCNmFuOZ8Zu7SznXQin6
	mTZHdRMyvwZRS6r2splL7CVFTFFX8pQKGhHv2onfYUmuR35ihE1Sjl+JopGNdHb82WdjgQQBypXm6
	NLDhvaIrsKN7wpymrdrDr5jZEUZtgyvM0m3DsaPEMSLVY4NjPY/t+4CkmGYFEMoUmAUbaxtICHC9J
	qWzrBukyRn9aE+nwdCLmWPagFCGQJTl+97oglJmUIeldtnEqJl4U4Z7/TLRYAL18ZNc52mcITpsQr
	fmLghk0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqasu-00000002TtE-1Lxo;
	Thu, 12 Feb 2026 17:53:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqasr-00000002TsY-1qtD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 17:53:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4EFA343FAC;
	Thu, 12 Feb 2026 17:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E1FC4CEF7;
	Thu, 12 Feb 2026 17:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770918824;
	bh=ZwsAByPty+lTE4KYyectuJTv8ZOdcyIpbTH3QqcqjnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=trWs5SlrsmoR2B9g/1WisjJh3lx4QRifD3oG3j6OvCHKmsS81sQUemKNKte6ZcfvL
	 hYi0onICvtPKHsKRoAupiPGwshr6K8rJYJS4+P9Gqu8XAwJN02lySHtWixGJ0NtK2j
	 3mZ8YhQIas6ym4fhmg9a3GS0ol8mZX/3amNNFpSMGdB83kutFCr7P7YnMVn/UhkG1H
	 an8+z4oAh9EkaYRIimum2W2KrlkQwjJw9qlymRkjxlvvWanQSmOpFeXj1huZuRm/3j
	 bmMrCy8D48PUuolOoA5AKiOPChvPTkuTvuFu+v/Q7O9W1YD4LMa2x1ydJ9EX7hgZFZ
	 Pub7zi7PgEZPQ==
Date: Thu, 12 Feb 2026 17:53:39 +0000
From: Simon Horman <horms@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	UNGLinuxDriver@microchip.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: sparx5/lan969x: fix DWRR cost max to match
 hardware register width
Message-ID: <aY4TozfU1piv40Nh@horms.kernel.org>
References: <20260210-sparx5-fix-dwrr-cost-max-v1-1-58fbdbc25652@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210-sparx5-fix-dwrr-cost-max-v1-1-58fbdbc25652@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_095345_494159_26DE127C 
X-CRM114-Status: GOOD (  10.90  )
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

On Tue, Feb 10, 2026 at 02:44:01PM +0100, Daniel Machon wrote:
> DWRR (Deficit Weighted Round Robin) scheduling distributes bandwidth
> across traffic classes based on per-queue cost values, where lower cost
> means higher bandwidth share.
> 
> The SPX5_DWRR_COST_MAX constant is 63 (6 bits) but the hardware
> register field HSCH_DWRR_ENTRY_DWRR_COST is GENMASK(24, 20), only
> 5 bits wide (max 31). This causes sparx5_weight_to_hw_cost() to
> compute cost values that silently overflow via FIELD_PREP, resulting
> in incorrect scheduling weights.
> 
> Set SPX5_DWRR_COST_MAX to 31 to match the hardware register width.
> 
> Fixes: 211225428d65 ("net: microchip: sparx5: add support for offloading ets qdisc")
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

Reviewed-by: Simon Horman <horms@kernel.org>


