Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D50BCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tqa3Jtb+wXhw2XIjpcld703BSkxqJFVzJEXH38I5E8c=; b=juQdWKocvExzL89Lm0lQR+8gSU
	1z6MMYl8pmI8wMYLOx4cs+wgyFVeOswDmY7JNHVZnHfe8W84LngLiWfoAzWBBhMRACOsDBdTRu5fs
	kQN20gBfwI/Mv/qJgxNTFMv1fjgVDg/ZjdJDi4lle9NRdITqPazmLLK3ycpFUImbtjAS/7mr+zZfe
	qsnZudM2yMtSdt6Q4OW2ricpw1J8iOgLsc/VN8EDe9wnHRAf1OjyKbhE8NN4cQKsxVjVGE61jPulw
	il76aDKwA+twLyVPV/jMZEdO+WFS5koejbEuW/a8OfGYHqv0W/FWkkY99s6Tmh7EnrOx6wIDesREW
	0qDcvldQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphr4-0000000464u-1y5b;
	Sat, 23 Aug 2025 06:35:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSJY-00000002hbU-2i2m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 14:00:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E548AA57B27;
	Fri, 22 Aug 2025 14:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A0DC4CEED;
	Fri, 22 Aug 2025 14:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755871219;
	bh=NhcqNJcEWkTWGz8ovLpQi/hjQY3as5SmrOYUySgeg2E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pkOPw/WHe5B9a4j3FhXTTUyx/m4orDiZW+owegOeFJg3JhJTsM/i/35kfS2vO1ujh
	 i6vIKqxsz4hm02PfMUhJK6hKGbg4TBRldoCfDxzZJjZSoP1pbeGshY+mwMbolz612G
	 W3jH/tu707bGd5eT0GLly11JcMATjFRVYt7U2FT5MW21iGAIulz+piRLK10Hb6+Dje
	 zma9YLw9ntGnz/zU6iWzEp3CVo1MvOttpOV4jDw0rlUzKeeWihIr2aG42kyBc8QEuG
	 Bq73EDU+U0BxDy9V8+uW+4eboZ+DnYkj/XYoPQepHoH1NOXVpc2yjAKo2M1FhyWsjA
	 4rA4pDSw/WfBg==
Date: Fri, 22 Aug 2025 07:00:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Cc: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Serge Semin <fancer.lancer@gmail.com>,
 Romain Gantois <romain.gantois@bootlin.com>, Jose Abreu
 <Jose.Abreu@synopsys.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Matthew
 Gerlach <matthew.gerlach@altera.com>
Subject: Re: [PATCH net-next v2 3/3] net: stmmac: Set CIC bit only for TX
 queues with COE
Message-ID: <20250822070018.35692c26@kernel.org>
In-Reply-To: <0f391b0a-6e9d-4581-9f3a-48e67ea90b31@altera.com>
References: <20250816-xgmac-minor-fixes-v2-0-699552cf8a7f@altera.com>
	<20250816-xgmac-minor-fixes-v2-3-699552cf8a7f@altera.com>
	<20250819182207.5d7b2faa@kernel.org>
	<22947f6b-03f3-4ee5-974b-aa4912ea37a3@altera.com>
	<20250820085446.61c50069@kernel.org>
	<20250820085652.5e4aa8cf@kernel.org>
	<feb15456-2a16-4323-9d69-16aa842603f2@altera.com>
	<20250821071739.2e05316a@kernel.org>
	<0f391b0a-6e9d-4581-9f3a-48e67ea90b31@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_070020_755459_6438EFEC 
X-CRM114-Status: GOOD (  17.85  )
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

On Fri, 22 Aug 2025 18:19:01 +0530 G Thomas, Rohan wrote:
> On 8/21/2025 7:47 PM, Jakub Kicinski wrote:
> >> Currently, in the stmmac driver, even though tmo_request_checksum is not
> >> implemented, checksum offloading is still effectively enabled for AF_XDP
> >> frames, as CIC bit for tx desc are set, which implies checksum
> >> calculation and insertion by hardware for IP packets. So, I'm thinking
> >> it is better to keep it as false only for queues that do not support
> >> COE.  
> > Oh, so the device parses the packet and inserts the checksum whether
> > user asked for it or not? Damn, I guess it may indeed be too late
> > to fix, but that certainly_not_ how AF_XDP is supposed to work.
> > The frame should not be modified without user asking for it..  
> 
> Yes, I also agreed. But since not sure, currently any XDP applications
> are benefiting from hw checksum, I think it's more reasonable to keep
> csum flag as false only for queues that do not support COE, while
> maintaining current behavior for queues that do support it. Please let
> me know if you think otherwise.

Agreed.

