Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E657CC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 02:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=934E9G/VFk13K7ue7jt2ZAeg69cidVPg44xfl0uq5KI=; b=jFebRpIGHXWFUEtFYlX5Eey/I8
	hSmgYc05QBqhqYOB13W8GidKgBrpdhdLn7tUcWWwiawpPIA1i7NpYbOThExdYdZWYpK7BY71pO2lW
	M35ObFp7drT6es+FY/nhjPxVvJ0vtRDjj8ASQusOGO91M13SG9lP9kh9Z19U8FPZ7LQTusxmvT4Zb
	DMjC4Eefd38WTXvRXwe1IghDA86cmAd4M+SJfdtwcRr7gFifge/B62zmaKam9lqhf8W+ZfsJFJrvA
	UQlOdqxIGPWYYVQatdvnpl3rSJ2gU2UHMrAySI9Yt8FqUukYkx8UxEj9YtM6d7xeAij5WFaI7C1DT
	zzhwT2bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX9ck-0000000A1NE-2dzw;
	Thu, 03 Jul 2025 02:24:30 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX9aO-0000000A1Cx-494h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 02:22:06 +0000
Message-ID: <9565e540-3dc5-4831-b9bb-7453e5979a21@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751509321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=934E9G/VFk13K7ue7jt2ZAeg69cidVPg44xfl0uq5KI=;
	b=gxMjs3vQ3tOa+mTvpJv6AjmHN0EyRg0DcW5fQzAaRbnPbRuI111+pbCJRpbIBCXJmmtwMH
	5Etpal8fel6d5RO2Ft4TpaiVEznDYLn91e58qEhESQ8Z7DOrIljjOprRFMDuG5Hj5WIiHe
	jURBv2u3HB7Zw7nGfB7qGGa/+ABJh3M=
Date: Thu, 3 Jul 2025 10:21:52 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2] net: stmmac: Fix interrupt handling for
 level-triggered mode in DWC_XGMAC2
To: EricChan <chenchuangyu@xiaomi.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Serge Semin <fancer.lancer@gmail.com>,
 Yinggang Gu <guyinggang@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, xiaojianfeng
 <xiaojianfeng1@xiaomi.com>, xiongliang <xiongliang@xiaomi.com>
References: <20250703020449.105730-1-chenchuangyu@xiaomi.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250703020449.105730-1-chenchuangyu@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_192205_234724_ED302DAE 
X-CRM114-Status: GOOD (  11.83  )
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

在 7/3/25 10:04 AM, EricChan 写道:
> According to the Synopsys Controller IP XGMAC-10G Ethernet MAC Databook
> v3.30a (section 2.7.2), when the INTM bit in the DMA_Mode register is set
> to 2, the sbd_perch_tx_intr_o[] and sbd_perch_rx_intr_o[] signals operate
> in level-triggered mode. However, in this configuration, the DMA does not
> assert the XGMAC_NIS status bit for Rx or Tx interrupt events.
> 
> This creates a functional regression where the condition
> if (likely(intr_status & XGMAC_NIS)) in dwxgmac2_dma_interrupt() will
> never evaluate to true, preventing proper interrupt handling for
> level-triggered mode. The hardware specification explicitly states that
> "The DMA does not assert the NIS status bit for the Rx or Tx interrupt
> events" (Synopsys DWC_XGMAC2 Databook v3.30a, sec. 2.7.2).
> 

> The fix ensures correct handling of both edge and level-triggered
> interrupts while maintaining backward compatibility with existing
> configurations. It has been tested on the hardware device (not publicly
> available), and it can properly trigger the RX and TX interrupt handling
> in both the INTM=0 and INTM=2 configurations.
Is there anyone willing to help test this patch on a publicly
available DWC_XGMAC2 hardware device (if such a public device exists)?


Thanks,
Yanteng

