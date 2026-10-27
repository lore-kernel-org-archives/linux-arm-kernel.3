Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76D6606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 20:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=otrXyBtX;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fJVIHD8/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YHtJyabGgQzsf8Hg54sXAUggOBZUtwI2PTxu8lZAsv8=; b=otrXyBtXkf4Oy50vQmug+rlUlP
	swwISWbuYQsp9X77m18RLg3HmwXpvSUPr1KahaU5z7IRfvqfeSt5ftdhsee9Fuqjt/mNkxdPAnJKD
	aohhQvbxjGJFQj/CAqT1xvoIXql83KKgSM8t1x0TazndRaH/WE0h1H33COaAC7a9MB0X0ikWpxMAz
	SqVTBZ9YOPWxKFStkxC0ESrnhhUuxtnA1/CbjsCMfhYysvHsS8B8KN/wevasctYPpiBqt04EiFV7W
	XFor9voQjdEYZH5MQXlmBXU9a8dgvQqAMpneuKBc6ky8j7DWOIyMilAlbjrUxvJoUArOF27GlY48B
	XnY+SfXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLnxY-00000005kB0-1LRr;
	Tue, 27 Oct 2026 20:39:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLnxW-00000005kAs-3kre
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 20:39:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 638E443BCB;
	Tue, 27 Oct 2026 20:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064CC1F031E1;
	Tue, 27 Oct 2026 20:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793133590;
	bh=YHtJyabGgQzsf8Hg54sXAUggOBZUtwI2PTxu8lZAsv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fJVIHD8/Rhrw4vEV+SQJl2LXDO9epWVhgBuTqiKHKXVddE3TtcFCBowA2BKKI/S0p
	 7chsjeNknO5y0e6e0Xw9uG6mZFrTfuGJ4NluAXPR7SJNqKGeMC5JsznQe+/SJFS0Lf
	 zzpG94d1GOd+7MN0e08jGgeZI9rRXgG1Gq8KeRxIowGl/pDCL6KdY27jjSpmsHqFRr
	 VOLibSk/p+hb/pFJ1h5H9sLHLNQMujXo0+YH2oWyITzM/PbaP2g2QkLplQXRT5hTca
	 y0zsflOVk/nvhZuD79+xU0ZRsOFvjt6qoXPiElJ+YuHIREZW8lOleIU24Ll3/jx3dw
	 uwEUkJWtpPJig==
Date: Tue, 27 Oct 2026 15:39:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Joy Zou <joy.zou@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	imx@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v2 1/3] dt-bindings: dma: fsl,edma: add per-channel child
 node support
Message-ID: <179313358476.887731.14779042723433167551.robh@kernel.org>
References: <20260930-edma-iommu-v2-0-72a62bf44c74@nxp.com>
 <20260930-edma-iommu-v2-1-72a62bf44c74@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-edma-iommu-v2-1-72a62bf44c74@nxp.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 30 Sep 2026 14:26:09 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add support for optional per-channel child nodes (dma-channel@<addr>)
> to the fsl,edma binding. Each child node can carry its own reg,
> interrupts, iommus, and power-domains properties, describing a real
> per-channel MMIO region.
> 
> Enables per-channel IOMMU stream ID assignment via the standard
> iommus property on each child.
> 
> The interrupts property is removed from the required list since
> channels with child nodes carry their own interrupts. Existing DTS
> without child nodes remains valid.
> 
> Assisted-by: LLM
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/dma/fsl,edma.yaml          | 70 +++++++++++++++++++++-
>  1 file changed, 69 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


