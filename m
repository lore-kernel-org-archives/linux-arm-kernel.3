Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4324DFD8740
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+l0QiChe0VDIUFImWeuAXSEYRjVG4lKvollPQDiqRTY=; b=lBWAj4KauEs3sqUiFt60nvL4Yy
	3O3yn1ADow8q4usjzvTigA86JUWUHDP/Lbm9mL7FTdSycOmhOvYtvuZ4T0p9zwgZb5v4/1Hn8dZLu
	8qwI0uDY6Ate0z3QMxPwu8wcUAfjnIE/QrSs2CKDIiJIXc/aR3qWxO/8bPy5g1tF5s+SDKYcBRthu
	CoWsHT51bMhXoOKj/Ik+IdjG+mjvsfLzza/KhGXT5gD0rYzf9WxkjieKNxW5KNb0ol/YkUuWYZoru
	EQ8SNzBAyudFwMrM52Kh51PlkXxLyCdipPrbVmNpMJ/O9Xj0GAWuROo3AvikL5wD4CktIipSAPSII
	2+J/PIaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SaX-000000068Ba-0I6A;
	Tue, 17 Mar 2026 11:27:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SaV-000000068At-2TG5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 11:27:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1395B401EF;
	Tue, 17 Mar 2026 11:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 464C4C4CEF7;
	Tue, 17 Mar 2026 11:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773746870;
	bh=/lJzgKXZtpaNxm1OXKdJSaQHb6rqsXre/eLfhtNuPiA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JuepidAi89V8qdQRJBp2BIDWiFoG7kj/Ku2MkdVTHyyUqr2Rc8ZJsn2LnikH8Fsn0
	 sJd4b0km1i5kEp5RjsiI24PRRK2UghKmIQ0gbT+duSQK0Bo8lOawzeMtNknxseImbv
	 W+bxtXfNrPdrrSPPz5KqyzOlFuEDzOyDSL79hUYNT9knsfxAbOacaXPBwgBa4DFuAD
	 qY9c/ZX0VYIS2h4Rb1YKzrsa6j7bxhWzuWw/K+OtyejkijWM+uUQsPzMQVQeAQJXhl
	 xWWNEs5gKy5tw/gS7PN5lKUNEli4XCdfyIDqQvabmdy+7Xf/RUZvBfQnQSFlBOvcga
	 eorLBi7rv+fpg==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Marek Vasut <marex@nabladev.com>
Cc: Michal Simek <michal.simek@amd.com>, 
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
 Rahul Navale <rahul.navale@ifm.com>, Sasha Levin <sashal@kernel.org>, 
 Suraj Gupta <suraj.gupta2@amd.com>, 
 Thomas Gessler <thomas.gessler@brueckmann-gmbh.de>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260316221943.160375-1-marex@nabladev.com>
References: <20260316221943.160375-1-marex@nabladev.com>
Subject: Re: [PATCH] dmaengine: xilinx: xilinx_dma: Fix residue calculation
 for cyclic DMA
Message-Id: <177374686790.337094.9907584689024913744.b4-ty@kernel.org>
Date: Tue, 17 Mar 2026 16:57:47 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_042751_657332_D39F3918 
X-CRM114-Status: UNSURE (   9.64  )
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


On Mon, 16 Mar 2026 23:18:57 +0100, Marek Vasut wrote:
> The cyclic DMA calculation is currently entirely broken and reports
> residue only for the first segment. The problem is twofold.
> 
> First, when the first descriptor finishes, it is moved from active_list
> to done_list, but it is never returned back into the active_list. The
> xilinx_dma_tx_status() expects the descriptor to be in the active_list
> to report any meaningful residue information, which never happens after
> the first descriptor finishes. Fix this up in xilinx_dma_start_transfer()
> and if the descriptor is cyclic, lift it from done_list and place it back
> into active_list list.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: xilinx: xilinx_dma: Fix residue calculation for cyclic DMA
      commit: f61d145999d61948a23cd436ebbfa4c3b9ab8987

Best regards,
-- 
~Vinod



