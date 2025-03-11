Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12255C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 12:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vKDyUgpw6Q4aIJE72j+f0zqhW5duCqFlcDY2QYRW1/A=; b=0ytAQrX0ai/zMz
	+p6rVx2l8vzAsX+pEbhNtqWwZIvA3sfYY04cAHr6Q+4TijAKGHPno3L/FGQ2NjjlCz5DJxbWs6KHH
	TEj6WsmdzF9PoLCLU92/YVZgKtF+JAX1X+ILJrpWDgt7nr98S8ZyMZexPupRgtzBmqJKgqnwr9gNY
	jRYfIr+znIUv9+Aael3pgwtsIgUVQ+1qn28T3XLgHkkCdvSINRST6PfQfeK8Zp2QmQPYetcPzLsgV
	TX0SuJl+WAydpRpZb61kJ4sTqusXgjB5KUXnPi4Q2r50eGIVdyuEsg37+9c2rsK9aQynzTXMqimBS
	okW9OIUAV1+0qkJo4G1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tryc2-00000005cAI-0mfn;
	Tue, 11 Mar 2025 12:21:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tryZW-00000005bYs-2W5a;
	Tue, 11 Mar 2025 12:18:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC95E5C61C4;
	Tue, 11 Mar 2025 12:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B21B9C4CEE9;
	Tue, 11 Mar 2025 12:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741695537;
	bh=cxGH/8yoDlpE4cyb58o3A+GZk4q5gxWQrv+6hcsMkZc=;
	h=From:Subject:Date:To:Cc:From;
	b=Qg9XgULlvTkmtg0c04NCeS/POwdITsEwNTU9JRDvynwh/TnYiS0cSjFsMIB15EhBm
	 R2wy51d1AFWimBfb/c+s3+6Pz7vGcOBuJtqhmkMDrTVB/3rLjOIYqdl2vab1jLUhzh
	 KpP0eBgLPkrob502RZxRbwxJ4ROcA+OuiW8LE1/6Kon/S4SU64Do0vTdkVew+wdViW
	 y5/RoaK1YPKyAjRH6HHnxr6K5mypKvgeikxkc7l4xEfP8QPXTYAu5ztwMQApm8YYQK
	 18ylxNuTJ5TaqVT6OvLrx9XC5w9g/DFbgzyJPTsTEEElk9hIWzWV0QI0q3Iu89Iuq4
	 BY6R1kU88xxkQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next 0/7] net: xdp: Add missing metadata support for
 some xdp drvs
Date: Tue, 11 Mar 2025 13:18:32 +0100
Message-Id: <20250311-mvneta-xdp-meta-v1-0-36cf1c99790e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABgq0GcC/x2MSwqAIBQArxJvneAvsK4SLSRf9RaaaIQg3T1rN
 7OYqZAxEWaYugoJb8p0hiai72A9bNiRkWsOksuBK8GZvwNelhUXmf9AIXfW4Kb1aKBVMeFG5T/
 Oy/O8CTjfnmEAAAA=
X-Change-ID: 20250310-mvneta-xdp-meta-3e0da8ef4498
To: Marcin Wojtas <marcin.s.wojtas@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Masahisa Kojima <kojima.masahisa@socionext.com>, 
 Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>, 
 Subbaraya Sundeep <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>, 
 Bharat Bhushan <bbhushan2@marvell.com>, Felix Fietkau <nbd@nbd.name>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Roger Quadros <rogerq@kernel.org>
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-hyperv@vger.kernel.org, linux-omap@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_051858_751122_E0D92930 
X-CRM114-Status: UNSURE (   8.25  )
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

Introduce missing metadata support for some xdp drivers setting metadata
size building the skb from xdp_buff.
Please note most of the drivers are just compile tested.

---
Lorenzo Bianconi (7):
      net: mvneta: Add metadata support for xdp mode
      net: mvpp2: Add metadata support for xdp mode
      net: netsec: Add metadata support for xdp mode
      net: octeontx2: Add metadata support for xdp mode
      net: ethernet: mediatek: Add metadata support for xdp mode
      net: mana: Add metadata support for xdp mode
      net: ti: cpsw: Add metadata support for xdp mode

 drivers/net/ethernet/marvell/mvneta.c                  |  5 ++++-
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c        |  8 ++++++--
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c | 13 +++++++++----
 drivers/net/ethernet/mediatek/mtk_eth_soc.c            |  7 +++++--
 drivers/net/ethernet/microsoft/mana/mana_bpf.c         |  2 +-
 drivers/net/ethernet/microsoft/mana/mana_en.c          |  4 ++++
 drivers/net/ethernet/socionext/netsec.c                |  7 +++++--
 drivers/net/ethernet/ti/cpsw.c                         |  6 +++++-
 drivers/net/ethernet/ti/cpsw_new.c                     |  6 +++++-
 9 files changed, 44 insertions(+), 14 deletions(-)
---
base-commit: 8ef890df4031121a94407c84659125cbccd3fdbe
change-id: 20250310-mvneta-xdp-meta-3e0da8ef4498

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


