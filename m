Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B508DCA5FEB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 02:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPNX+Ya5M9FrrNq/ZOGEeDs8/xwAkhI8Qs4LnaxGt/U=; b=sMSQZZVgszuU1LKauppqlW9HZq
	EfCRBH26hhEFlboecUe5o4zmZFiPG5TVS3jPkpK4YKjEKsTIkDgYdjmkGgJcWxg/0CHDlCsi1yTSO
	SRl7pVGWgwcKtNSNVpM6qa+vRx2Me2SLk8xS5WAWE0rGtaO1DApC3UV9NqEJlNjmzx3l8acOTP00K
	2oF27ewPihqvXI3BU6q26asZTsWiFZGAMm4xKfevheSSEehLzMffEIGMyn+WhrJhbuzEE9A9H51KA
	msvVGE6GIRkhPAjVaF6lMjkkYTlZ/JR03+V+lwJRbXsSB0rYskf+mMTwkITuR8FMy/BDg4DsyagHv
	vN0fS+3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhIKa-0000000GTav-315j;
	Sun, 18 Jan 2026 02:15:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhIKZ-0000000GTaM-0e2q;
	Sun, 18 Jan 2026 02:15:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3145842A2F;
	Sun, 18 Jan 2026 02:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A52B3C4CEF7;
	Sun, 18 Jan 2026 02:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768702554;
	bh=DkTAVOtDgAavmOBCWkEODfmCCxIZofGnZrL0HRHr1+Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JkC0leqUxhwYx7c9VgSjbs4pehA7gDWJipY4nOB3v8Lj7P/i+eC5nHVlv320j9GT3
	 BfDGXuRszKLv6NkMGgyPybmhjCvSb1EKn11Lm/LMxbMpFRRT3KtE8TSaFoR7DfwxSu
	 0aMaCFYCQM3WGigDPntTsfXhQc5J57gW3z5Unee0nMISfGB9pXPbxUb4Z0p0ENQ/g1
	 91y95gJ2R5G44VmxP9Xvdl56Y1Ez4PAwdvoljSlOWK3Zg++D6K66bK4YtpG1ovXI0q
	 ZiE5bQm5MjqCXDJjFFKv+g5qIRCxEon/tTHgp9iw3YpIt0NWjvnPNVAmyKodfJJlrj
	 VcJY0r6o2ENoQ==
Date: Sat, 17 Jan 2026 18:15:51 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Ajit Khaparde <ajit.khaparde@broadcom.com>, Sriharsha Basavapatna
 <sriharsha.basavapatna@broadcom.com>, Somnath Kotur
 <somnath.kotur@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@nbd.name>, Sean Wang
 <sean.wang@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Shay Agroskin
 <shayagr@amazon.com>, Arthur Kiyanovski <akiyano@amazon.com>, David Arinzon
 <darinzon@amazon.com>, Saeed Bishara <saeedb@amazon.com>, Bryan Whitehead
 <bryan.whitehead@microchip.com>, UNGLinuxDriver@microchip.com, Shyam Sundar
 S K <Shyam-sundar.S-k@amd.com>, Raju Rangoju <Raju.Rangoju@amd.com>,
 Potnuri Bharat Teja <bharat@chelsio.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou
 <mengyuanlou@net-swift.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 1/9] net: benet: convert to use
 .get_rx_ring_count
Message-ID: <20260117181551.0b139ca1@kernel.org>
In-Reply-To: <20260115-grxring_big_v2-v1-1-b3e1b58bced5@debian.org>
References: <20260115-grxring_big_v2-v1-0-b3e1b58bced5@debian.org>
	<20260115-grxring_big_v2-v1-1-b3e1b58bced5@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_181555_242344_510C125F 
X-CRM114-Status: UNSURE (   7.75  )
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

On Thu, 15 Jan 2026 06:37:48 -0800 Breno Leitao wrote:
> -static int be_get_rxnfc(struct net_device *netdev, struct ethtool_rxnfc *cmd,
> -			u32 *rule_locs)
> -{
> -	struct be_adapter *adapter = netdev_priv(netdev);
> -
> -	if (!be_multi_rxq(adapter)) {
> -		dev_info(&adapter->pdev->dev,
> -			 "ethtool::get_rxnfc: RX flow hashing is disabled\n");
> -		return -EINVAL;
> -	}

I think we need to add this check to set_rxfh now. The error coming
from get_rxnfc/GRXRINGS effectively shielded the driver from set_rxfh
calls ever happening when there's only 1 ring. Now they will happen.

Applied the rest

