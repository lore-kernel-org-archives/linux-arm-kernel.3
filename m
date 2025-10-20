Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EB4CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 20:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VObExaMwHFV3eVmo/NVT5zmOlkzWNGgqfS1IlWAFtz0=; b=QHvRq2Skhi4HiCRCX5RQT+7Spm
	38pa5b64riGlaeRiTaQ3ulZdilUAEUCklLVDFvbX5XckMd8KG2rg0EmdAoCaxTPHOqSCk4wOX8H3i
	+MI5uyN8VPFUbYjOvsvMnlc8yUFzfM2QPmXCESV/ddgjUcajhJnx5HSkeRS+DbI6AS/2v9Vzw7Nlp
	p9cBJDe7jQA/R9pLFtktSg3GnwcsztAsByXPYpPBSM0wJPMT9nDzWBc3CWhuXCYwb/Nb3RM/W/S8V
	Q9xGHQaNoJ8GKJO9120+uME+RRXKfwU0L8YVQWkKf2CbwrsRXOqv3ZN9r3Qf+JROu6R9PyrIAP2vw
	lCoyNYvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwis-0000000EwPX-0Hhr;
	Mon, 20 Oct 2025 20:43:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwiq-0000000EwOy-0N7C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 20:43:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B8D462085;
	Mon, 20 Oct 2025 20:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A546BC113D0;
	Mon, 20 Oct 2025 20:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760992980;
	bh=ICw2tymwdpgjAi7jhcPJWNLOmDSZpCZMN8Mq3WAbZvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R69E1IQLHAg+VkCglHtQ7jfYYiZBlMH6G6VVr5UwKG2JKxJUnQmBoyYwUjYTjwpiG
	 LzbemwGnrE3WwwyCfneg3YNd9kdypNQxp6jCuPXO9ZLEDCAjIpxP+d/YLo9qVrVo9E
	 VuBIWlDPwi3BcL8735Qcg0NaoNrA4fxqyjGi1IvPBL8h9ceUt3FX8pK8GwOjmE6sTf
	 OZqBXL0sGjdkIeQUL/GNkcLBJ2r8IaZl5PEjyFWpy07/UPGgwJDLCJw96uAGDULfua
	 AceGo5xy4hfJtMc8BOarTUexozbSlCMzLbrZ+27NxvQBI+3lqD4a9Wqc5lnJBxp0Kz
	 PUK899RLlA1vA==
Date: Mon, 20 Oct 2025 15:42:59 -0500
From: Rob Herring <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Ripard <mripard@kernel.org>, Liu Ying <victor.liu@nxp.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/4] dt-bindings: bus: don't check node names
Message-ID: <20251020204259.GA1591976-robh@kernel.org>
References: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
 <20251020060951.30776-7-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020060951.30776-7-wsa+renesas@sang-engineering.com>
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

On Mon, Oct 20, 2025 at 08:09:50AM +0200, Wolfram Sang wrote:
> Node names are already and properly checked by the core schema. No need
> to do it again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> I'd suggest to give subsystems some time to pick this patch before
> Rob applies it?

Not really any subsystem for this one, so I've applied it. The rest 
should go via subsystems.

> 
>  .../devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml        | 2 +-
>  .../devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml | 2 +-
>  Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml       | 2 +-
>  Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml   | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

