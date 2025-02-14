Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB167C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 21:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SjtjrT420mYUlb0fxYSKm7OFC++eW35bsr/vWZzU78s=; b=aJavNDM155uzdjKDKtaEB690na
	n38oqeN3ftchdkpsGKj9zXY/dmORfyZ7iCu/UoEEwHBEd7pqmd/718A/ySim1iqORoxCkTbJynwwD
	b0IUntxgP/E0IoG8u0njNsWjOMH4Tuys1BQxIUkJW3IB6jkR3NOO9QF9MiR385ussB7COEXTB86l0
	XOxea8NSX7lf39cZ4IORGD5w4yAB1B9htYtlE1Wc62dz6sBgeqkJLn6KxaM/5I/Bx/9GEWwFxjy8t
	BaiMJtVAg4GIHazqinZyOwEn7S1OO1w4hda78H31uWLRhzIeQhPMg0nIt1JPdkHvwU/hRB4JIVMKO
	IMrg9MDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj3MW-0000000GHlv-0K4W;
	Fri, 14 Feb 2025 21:36:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj3L3-0000000GHdD-1Wi8;
	Fri, 14 Feb 2025 21:35:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 552EA5C57FC;
	Fri, 14 Feb 2025 21:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A6BC4CED1;
	Fri, 14 Feb 2025 21:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739568907;
	bh=SjtjrT420mYUlb0fxYSKm7OFC++eW35bsr/vWZzU78s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DHP7nNRg/KFypnHBYoKCAJLXHKI2hR9YhY3Eb37iONUHFZB/fLQsjnPESclPsY/nD
	 N/esdW85cVJ1E0SEKs+rsK+fkn8J95H9LxfJfcx3M/4mmL1463DFfnRW51QdmPjsT1
	 3KbZxOGMjnZPdwUI8GLC+5TzJLtKO1A2pAOQjui3RBym2Zl3WzJjhGI5hapB5/EP5H
	 ZI6fV+n/dYNs0Iexv2P8FXQYKcLmYIRHUfliVaJkW+AQDKNT+iROQkKQpwmAG+62S2
	 XO5dbIi2D582s7cvgJlpKTCdp6LVDMiVd3/OgoLYu36HZc93ykppIEOA+EsD4QqnyZ
	 GuZbreVuLpLxw==
Date: Fri, 14 Feb 2025 13:35:06 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Felix Fietkau <nbd@nbd.name>, Sean Wang
 <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 upstream@airoha.com, Mateusz Polchlopek <mateusz.polchlopek@intel.com>
Subject: Re: [PATCH net-next v4 01/16] net: airoha: Fix TSO support for
 header cloned skbs
Message-ID: <20250214133506.1e4a619b@kernel.org>
In-Reply-To: <20250213-airoha-en7581-flowtable-offload-v4-1-b69ca16d74db@kernel.org>
References: <20250213-airoha-en7581-flowtable-offload-v4-0-b69ca16d74db@kernel.org>
	<20250213-airoha-en7581-flowtable-offload-v4-1-b69ca16d74db@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_133509_449177_B1B19C84 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
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

On Thu, 13 Feb 2025 16:34:20 +0100 Lorenzo Bianconi wrote:
> For GSO packets, skb_cow_head() will reallocate the skb for TSO header
> cloned skbs in airoha_dev_xmit(). For this reason, sinfo pointer can be
> no more valid. Fix the issue relying on skb_shinfo() macro directly in
> airoha_dev_xmit().
> This is not a user visible issue since we can't currently enable TSO for
> DSA user ports since we are missing to initialize net_device
> vlan_features field.

Im gonna apply this already so you're <= 15 for v5

