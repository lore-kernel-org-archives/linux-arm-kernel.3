Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2C2C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 14:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xukk9OGvcwqm9MooCxrwEuAs8AQ3wHFuGuGVVdhagAs=; b=TDVeg0SwhW0Fx/Qh7t8lsc5o9M
	ASNZQlGj9GRvnwhum3nKmdGxLpBW+O5nmHaHoAXrqL7ZadSa/dlOGzVnQNQQxr4HjXLw3BGXpfnih
	CvtIHErkRr1/nBHCu2MLLW5cSdb/sCtQu57NVDZfsXQ1bo4a9yVl0WlF5ZiGq0eS9BL3HXesmaDtM
	dlK5yWoVvdv32RXkoqSQo8wvwA+WuotyWjGLbgJwZfpXgNbPVbbQb8TmiGLio+UMoqwF6eGlcg9tT
	PypHIR5Gz+lrQazPy3RyTRyNJU0cX6GE53DSiN5iepaOz+L/JEZJikSv1w4hZHmsqyWMNOPYXtQdE
	Ts+aJ56g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thUvB-00000000A9F-46r1;
	Mon, 10 Feb 2025 14:38:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thUsS-000000009CH-1U7D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 14:35:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 35E335C54AF;
	Mon, 10 Feb 2025 14:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 074B0C4CED1;
	Mon, 10 Feb 2025 14:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739198111;
	bh=4MQF+duV3Z6GyqMReLLQ/7muGG1r298coZ8wUK0yw+o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s3MYC9rSDnFSp7lkxZJlHWDHcSbdcADd94W13WlhfeHkOjSmAkOAptF0CneJIDnG3
	 MvSIf6oWqquQcXqmf92AxfO1Ds8MNPE8V9lgQTMx6K52GX3q2ZbiN2Tq3Nfwgjulh3
	 9ma1c5gd6uKvPlVxdIdu5DHeFryGi4cp39GWNw3cgsm6ltJ0IHCqsEtl3DZTebiCO9
	 G3PNZ3/JxZFISL2/vvuvXB9A9wUEQRhKcKx4bdw+J7VVdviC7q75MRRS4EjM4SMET6
	 soBI2DwLdZBL9u/C7lUMsgXiKIvz4MQDOry3NnVGv41laXoGRsIbSpSojTACHYvp4j
	 7zZQvslkOXJlQ==
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>, 
 Frank Li <Frank.Li@nxp.com>, Paul Cercueil <paul@crapouillou.net>, 
 Randy Dunlap <rdunlap@infradead.org>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20250205145757.889247-1-andriy.shevchenko@linux.intel.com>
References: <20250205145757.889247-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 0/4] dmaengine: dma_request_chan*() amendments
Message-Id: <173919810764.71959.6637536991455894544.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 20:05:07 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_063512_452451_3E03EA47 
X-CRM114-Status: UNSURE (   8.06  )
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


On Wed, 05 Feb 2025 16:57:08 +0200, Andy Shevchenko wrote:
> Reduce the scope of the use of some rarely used DMA request channel APIs
> in order to make the step of their removal or making static in the
> future. No functional changes intended.
> 
> In v3:
> - rebased on top of v6.14-rc1
> 
> [...]

Applied, thanks!

[1/4] dmaengine: Replace dma_request_slave_channel() by dma_request_chan()
      commit: 31d43141d13aa63587f140884b1f667800ce4e1d
[2/4] dmaengine: Use dma_request_channel() instead of __dma_request_channel()
      commit: 1c83d3dfa0905590408595560629627cba4f9261
[3/4] dmaengine: Add a comment on why it's okay when kasprintf() fails
      commit: 1722fb4a1307748f983c1345c4c24178d8e0be47
[4/4] dmaengine: Unify checks in dma_request_chan()
      commit: 91d8560c15918c7d44e4f665fac829ba8057a2f3

Best regards,
-- 
~Vinod



