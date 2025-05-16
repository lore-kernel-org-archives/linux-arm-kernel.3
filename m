Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C33C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 01:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZ9EbLYkKfSD4UFzqZqu+8+Ha1W6aEciKkvpFYAzYBM=; b=OFNY/9ALDTRYZdtKVyhVappWA8
	lLrH5DeFYAYF4Trx6peiswQI6eRrV9bMwrGA+sxn1kU3fCchnwcQ8tCmmyHBVnBCrLEZW19HdDPON
	QMLNXBD89uxGy+I4YMRN7fEyPomH6iGhg6czh27eabI4GRuUZjmWal60sIbqf6vMizExiPeNvKBho
	sEDzybHZDFNndMiIwVeJTSnktlzjIC9+0gBi6/X0AMsL7+HYMXqmaEWQaVpOAspDRLUjY2/XBKBQY
	d3Sy+zYWoHfZfapNr/KQIEr0fOvB7Y1y/xKeD016PYRbJwdcE8bJD7KlUILc8v34uN2jLUM5hKpd5
	pYbe2dvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFjjy-00000002CBD-3gFK;
	Fri, 16 May 2025 01:19:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFjeB-00000002Bjf-3UsI;
	Fri, 16 May 2025 01:14:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DB5C8A4E42B;
	Fri, 16 May 2025 01:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CDC6C4CEE7;
	Fri, 16 May 2025 01:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747358038;
	bh=MuVZIaw/gfFWLrrSK9MI2upd2KYATjSbjinT5eDdHNE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QxTe84IJqt05STMoVkHbVJrJ4de5qk6u9F/5Pfw3mC9pWybeCOJsWGaIKOpUrqG4u
	 LdpSe23lM2QSBgmKv5/nI1Kj5lBH/dxw5oq5pk68Q80UdhfLGmJAb2Bwas3/vGSphZ
	 n9fpQ9gcT9fhnYCVyZev8qlKfCGucja3X+dhwHH6KViBdTcGgSpg3R3D+uZcX4FeDF
	 v5q0i5Exn11Lj3FcWK492EPHOVICVKZ8+XmAnzZRz6F38CkbdO1FQnCfKsNKpsVa5v
	 4LMiry9XOaSdJZxG1JyYaw3hYaTzFR3BRRLpfvP18CCmPYFHNtAexeYVtptNJNMT+Z
	 ciU9Frma/4QTA==
Date: Thu, 15 May 2025 18:13:57 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: airoha: Add FLOW_CLS_STATS callback
 support
Message-ID: <20250515181357.73f98a18@kernel.org>
In-Reply-To: <20250514-airoha-en7581-flowstats-v1-2-c00ede12a2ca@kernel.org>
References: <20250514-airoha-en7581-flowstats-v1-0-c00ede12a2ca@kernel.org>
	<20250514-airoha-en7581-flowstats-v1-2-c00ede12a2ca@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_181359_949454_72A35CF6 
X-CRM114-Status: UNSURE (   7.18  )
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

On Wed, 14 May 2025 19:09:58 +0200 Lorenzo Bianconi wrote:
> Introduce per-flow stats accounting to the flowtable hw offload in
> the airoha_eth driver. Flow stats are split in the PPE and NPU modules:
> - PPE: accounts for high 32bit of per-flow stats
> - NPU: accounts for low 32bit of per-flow stats
> 
> FLOW_CLS_STATS can be enabled or disabled at compile time.

sparse isn't happy:

drivers/net/ethernet/airoha/airoha_npu.c:382:15: warning: incorrect type in assignment (different address spaces)
drivers/net/ethernet/airoha/airoha_npu.c:382:15:    expected void *stats
drivers/net/ethernet/airoha/airoha_npu.c:382:15:    got void [noderef] __iomem *
-- 
pw-bot: cr

