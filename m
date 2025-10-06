Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0DCCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 20:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2Ovqc/nTi5/UXw483+mGacXvgUl3L1/5cp/GbV9sQE=; b=Q1esMJLe7MTqIxXuqfhEq41GUg
	zukze4vwd4J7Vi/Zkw9sm76q2ujSlmr7PZGWlvB/f7KKnUBSrNJu7ddqr5FK3/3xmMsjkMd+UEXvA
	t1YyGKTz3iiqkraNRQ/WyhctlLINXBZ7DCehrecWrmEDuR98PTlxJUN4Lqy/NJ2yQqtGBYNJWJ6Tz
	Y8PnHICTFONOmJtYPRDww3Yo5hABwE8bopFUclDp5BqqNDuTBXERxIGbvcig43y0U91YOHIwoPSFc
	OBKprIRIO7EQTSqIDBkdKDcyEO6G1nu7QovYV64WA2EQtZNTdtYkSIDO1eGUtq7nRKhbY9I70eMnk
	PAxND3GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5sDE-00000000maB-0ex5;
	Mon, 06 Oct 2025 20:53:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5sDC-00000000mZb-1kZK;
	Mon, 06 Oct 2025 20:53:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BA49A43890;
	Mon,  6 Oct 2025 20:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7199AC4CEF5;
	Mon,  6 Oct 2025 20:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759784017;
	bh=0tCd4WF0gQtfi6/fB2e1mBANwyNMnWMhiYWPsP6L4b4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=igLEaH4CU8kFnBHLB8+7B/C+/775mvsFWWGMwqL/+iOGRFpic5iwoBGBCMunOKQj1
	 caxJUTzwJQsFj2+GTKVA6x/Be2ciFIV2vsPxOfFlpyGSixxfYrPNA7mop0Y/RHFVwb
	 EpGtxCL4NdwCKZVUF9bL3615/Hxt7B+dxTWxJ+0vb6rRvgUWm2ViiTR5Vz0b5qmFq1
	 UYctq6gFsHmXYLXJvjJxwYlTilTF0ODJsEqgfztVaGXLR4iIPPcy7DEG0yGPHtDyfB
	 2Z1qb8LOySvxZP5qoUzlwxq91n1FVsrIWGyj0S7srBm56v0dsTqyYwM7gBAIuktG07
	 5SwJceazLJCBA==
Date: Mon, 6 Oct 2025 15:53:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Sven Eckelmann (Plasma Cloud)" <se@simonwunderlich.de>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-wireless@vger.kernel.org,
	Shayne Chen <shayne.chen@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH mt76 v2 2/3] dt-bindings: net: wireless: mt76: introduce
 backoff limit properties
Message-ID: <175978385977.561952.12777844195936444721.robh@kernel.org>
References: <20250926-backoff-table-support-v2-0-16d3726646c4@simonwunderlich.de>
 <20250926-backoff-table-support-v2-2-16d3726646c4@simonwunderlich.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926-backoff-table-support-v2-2-16d3726646c4@simonwunderlich.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_135338_474528_56B9677C 
X-CRM114-Status: UNSURE (   8.67  )
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


On Fri, 26 Sep 2025 12:04:53 +0200, Sven Eckelmann (Plasma Cloud) wrote:
> Introduce path backoff limit properties in mt76 binding in order to specify
> beamforming and non-beamforming backoff limits for 802.11n/ac/ax.
> 
> Signed-off-by: Sven Eckelmann (Plasma Cloud) <se@simonwunderlich.de>
> ---
>  .../bindings/net/wireless/mediatek,mt76.yaml       | 60 ++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Though I know nothing about this. Is there any reason why this is 
all specific to mt76 rather than being common? Perhaps these settings 
are all just part of the opaque "calibration data" in the QCom case?

Rob

