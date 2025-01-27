Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00249C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 18:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Imgxozkm6aUWVB9gzKkThS2UchPua13u8YtM2MiEcIQ=; b=jSVoi7FIVdJ/L0awoexld3yw2r
	/xHyBBjNIQBWIdMD4bRhliELDPaUSPaa5y8STYUgI5DEobQOSymkZdAD3pgb9YdpBoE2s9OSQyl8G
	8DPBkRbZ64vfnChkasWyB39GEJpfVRjyzYuAPntC24qTqipHM90feGeNBwLlUaayghwqH/QUK+h6x
	tPbwniwK8s6lvJcObKY9NSL5qy/+tJ5tkbh8bwIQorAf8W+wvWYkb2MN5lkEs35Cl9Zsxy/wEmdVY
	NY2i6sVHxAtArl0/svMDRp66ghlKZaMr6dqOstora761eZgrJn8NG5p8CU13ZLtQP8tE2e6XBEHU1
	N+b7umkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcToe-00000003283-49UB;
	Mon, 27 Jan 2025 18:26:33 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcTnJ-000000031zv-1QBG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 18:25:10 +0000
Message-ID: <bd0f4776-1a7a-4b99-9245-49a636be8238@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738002301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Imgxozkm6aUWVB9gzKkThS2UchPua13u8YtM2MiEcIQ=;
	b=qkJ8mp449t69E5hfdt/+sgt2Pz8v/LBsRF/xab3q2SHHaSEVN91uDDJTnX5k6ctYh5um89
	vepBVGo0sP6O40g9WKSydJo4q1hvS2DNaTYYRdjkCENWeeYItK9CY5JjoBViwawMCFiFlS
	rHoTe1SOGziwra6qKvkPG1guNr1xOeg=
Date: Tue, 28 Jan 2025 02:24:40 +0800
MIME-Version: 1.0
Subject: Re: [PATCH net v4 3/3] net: stmmac: Specify hardware capability value
 when FIFO size isn't specified
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Furong Xu <0x1207@gmail.com>,
 Joao Pinto <Joao.Pinto@synopsys.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250127013820.2941044-1-hayashi.kunihiko@socionext.com>
 <20250127013820.2941044-4-hayashi.kunihiko@socionext.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250127013820.2941044-4-hayashi.kunihiko@socionext.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_102509_588571_92FEE491 
X-CRM114-Status: GOOD (  10.07  )
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

在 1/27/25 09:38, Kunihiko Hayashi 写道:
> When Tx/Rx FIFO size is not specified in advance, the driver checks if
> the value is zero and sets the hardware capability value in functions
> where that value is used.
> 
> Consolidate the check and settings into function stmmac_hw_init() and
> remove redundant other statements.
> 
> If FIFO size is zero and the hardware capability also doesn't have upper
> limit values, return with an error message.
> 
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng


