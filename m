Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A195C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 21:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0Qke2MJ1HJVMkRL4x9cKT9HsBqDpy4hRHvANY0ZAq8=; b=LhPbekbrEpYoG4ynSVMzww/lTK
	nmYlx7FkUEPhxVd2WK4io4CfVjXcSw+6Zrk0IuQJrtXiookXN3Zi8vQytkYDVBICiBc6X6O6IsGuN
	bGAFeIPW7Q1K76QwJ8CzRtvFD9/El07deqvpH/j+TddzfZtJ2I+sSjzJAaqTmkyTiT1zXMcmPUZpY
	HXFJoQhJF+TOO20pVeOC43cdNodiOO99hMptztZavxioyzKPUqXZcc9cogVXz1gFhCV3ruDZVw+a2
	SZJ64T3StuvrlhauIqSzpjRkRGHH8OGhCYgRPDuTD5UnBz+fSIUA8dm102zzpuwXswdcJA5TAwW3x
	26RaP4Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhDuf-00000002RXR-19mm;
	Wed, 30 Jul 2025 21:00:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhDr6-00000002Qy0-0M1y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 20:56:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 99E9B44744;
	Wed, 30 Jul 2025 20:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D34CC4CEE3;
	Wed, 30 Jul 2025 20:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753909015;
	bh=meJm08gIW/vRrCYpVEM3urM9k5Mm+PBeXQeuvnQVQVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R/abVUfbuP7icZl+93Lwq3my8o2/6jYbJCSJ0QiaT84VAMWsguxPTRoaNY3GpCz6W
	 TyzKtkhybnWvlCMN/wRcxd5rwQd9lzfZ4gBQ1R5snp7d0gO2KB0wqAUBzQgvDWQDv4
	 gvKTMqalfwzGGXkZOb52EDKsLC+5bk2v2cgq1IBaqlHWcjZ16LasrbxA//uQ462lrc
	 I81cbSHyXF9EeRXShOA+lG3Ex2Qt7PJx3D9QmZl80sRV2Z0MCRxig1sWAIHGtJ+oEB
	 l4FeT15ITP8uapf9qWEUqtO2ZartcWM0t6tQrgJ8GJhO6Vbo4Z2fQFo+t+/VvxKVqe
	 UcaQvCMWw/m+w==
Date: Wed, 30 Jul 2025 15:56:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Joy Zou <joy.zou@nxp.com>
Cc: mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, festevam@gmail.com,
	alexander.stein@ew.tq-group.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	Markus.Niebel@ew.tq-group.com, ulf.hansson@linaro.org,
	imx@lists.linux.dev, othacehe@gnu.org,
	linux-stm32@st-md-mailman.stormreply.com, richardcochran@gmail.com,
	frieder.schrempf@kontron.de, kuba@kernel.org, Frank.Li@nxp.com,
	conor+dt@kernel.org, shawnguo@kernel.org,
	alexandre.torgue@foss.st.com, davem@davemloft.net, peng.fan@nxp.com,
	edumazet@google.com, s.hauer@pengutronix.de, primoz.fiser@norik.com,
	linux@ew.tq-group.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	will@kernel.org, kernel@pengutronix.de, pabeni@redhat.com,
	andrew+netdev@lunn.ch
Subject: Re: [PATCH v7 02/11] dt-bindings: soc: imx-blk-ctrl: add i.MX91
 blk-ctrl compatible
Message-ID: <175390901389.1733801.13463071578614787293.robh@kernel.org>
References: <20250728071438.2332382-1-joy.zou@nxp.com>
 <20250728071438.2332382-3-joy.zou@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728071438.2332382-3-joy.zou@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_135656_141959_9AC2B52C 
X-CRM114-Status: GOOD (  12.28  )
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


On Mon, 28 Jul 2025 15:14:29 +0800, Joy Zou wrote:
> Add new compatible string "fsl,imx91-media-blk-ctrl" for i.MX91,
> which has different input clocks compared to i.MX93. Update the
> clock-names list and handle it in the if-else branch accordingly.
> 
> Keep the same restriction for the existed compatible strings.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> ---
> Changes for v7:
> 1. add clocks constraints in the if-else branch.
> 2. reorder the imx93 and imx91 if-else branch.
>    These changes come from review comments:
>    https://lore.kernel.org/imx/urgfsmkl25woqy5emucfkqs52qu624po6rd532hpusg3fdnyg3@s5iwmhnfsi26/
> 4. add Reviewed-by tag.
> 
> Changes for v5:
> 1. The i.MX91 has different input clocks compared to i.MX93,
>    so add new compatible string for i.MX91.
> 2. update clock-names list and handle it in the if-else branch.
> ---
>  .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     | 59 +++++++++++++++----
>  1 file changed, 47 insertions(+), 12 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


