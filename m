Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B53C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 13:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bljeXvrNQc2TRnLRKT9Va9qS0HBdN81jZjWPswVutDw=; b=NwQwY7Oul642CKpaKKcKx2RLyt
	5Vzk2rFvOjZJKo9sIGXpWOkHvBNEqAJm0RuKE/DLOWhKNFVOCb3xAb1RCrl5BBMd7P8I2X5UG6+I4
	PlwI+HqRh68gTmL1VmguF/AzSQVs/BQNK1z9m1B47iz8NJN1qWpBMj/vKBLIJfyx7Vk5ElZXPq+3x
	jiVnXliSBO++9+PlLXaGHGupcSct3Otl1Nh2jaZ2g8h9C1GW3ppz8hLZEqrBXKFyYHNlhle+47MVF
	WfMwGs5ToDL/0/JGWMQPCodKC5flYLpmQv46HgLaaGosujMRvMZrS8B7mUdApvdtl5gqAVyYqCHE6
	EDUMYslA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMXX-00000008cvA-3H2Z;
	Wed, 12 Mar 2025 13:54:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMJ3-00000008aq1-2goB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 13:39:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BFEAE5C5B9D;
	Wed, 12 Mar 2025 13:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961E7C4CEEC;
	Wed, 12 Mar 2025 13:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741786772;
	bh=blSMd+ip1wX3c56Bl/lVcDQMN77dkbGIeDaWs3/81Is=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UYDXXwUaqosXaV3w71qysm01C6xWaetISPv62DTByD3/fU58nUD6BFjottqgr8mA4
	 vnMlpO6D9EU7mvJgtpswUt0ub/3QFRvahfKqPbToTDMliU3cdegUGD2KXuylJUalhS
	 EzzOkrs617JKCRaw51WfOQT3UF2mdJIRCyAQq4plh12xNd6sW/9NSyZHrtAy8etvux
	 eRUuaI8m3G3kMBoLLpdbN/xW/8WXbW1LBaZOpE2G6aRut2I1VeCbm+wXQxFyIFoz1B
	 z72L7s7d3rpYZqaAmkId9xIr9UTq1AmpsPFxjesYyXMkXByxECEiLLAebNsf6VeZyz
	 PPTlDZMwVerkg==
Message-ID: <80a1f61a-b2aa-414f-b446-087db7fc54a5@kernel.org>
Date: Wed, 12 Mar 2025 15:39:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: ethernet: ti: am65-cpsw: Fix NAPI
 registration sequence
To: Siddharth Vadapalli <s-vadapalli@ti.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, alexander.sverdlin@siemens.com,
 dan.carpenter@linaro.org, c-vankar@ti.com, jpanis@baylibre.com,
 npitre@baylibre.com
Cc: vigneshr@ti.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com
References: <20250311154259.102865-1-s-vadapalli@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250311154259.102865-1-s-vadapalli@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_063933_729135_2E842343 
X-CRM114-Status: UNSURE (   8.15  )
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



On 11/03/2025 17:42, Siddharth Vadapalli wrote:
> From: Vignesh Raghavendra <vigneshr@ti.com>
> 
> Registering the interrupts for TX or RX DMA Channels prior to registering
> their respective NAPI callbacks can result in a NULL pointer dereference.
> This is seen in practice as a random occurrence since it depends on the
> randomness associated with the generation of traffic by Linux and the
> reception of traffic from the wire.
> 
> Fixes: 681eb2beb3ef ("net: ethernet: ti: am65-cpsw: ensure proper channel cleanup in error path")
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> Co-developed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Reviewed-by: Roger Quadros <rogerq@kernel.org>


