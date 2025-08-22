Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D94CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxlF4fcBzeC9dCgxCh6O/IjFpHhEw0t8O2TZfLCPWYg=; b=vBQfkWw4EKS4CUf6PFr0pxMDDp
	YtC4tY1R3Yi82OHEYkrtCA0NX0/u+jzJRTSXjSbTziauKdtsmE/9YglhkqBaV/P6kHJ+1SNRrIoLq
	2A5/oHdMG3W5B70NuYYQpSf20cvp4Z2aSC8LkvPJJyfYE1s6RUk/kBrvbYNKtExvIn7bZGi9yg7WM
	9+lV5AVvkhLOPBGoGb8x2pMHkyeHcbqDPn6gKMAVUHip/qun4li2IQhdwU2ljNlRMLb04LKkbjwKg
	oflF4hFDQoOyy4+wuMW/VzORsnQ/szUkcbcOSDVicSqhomuECXsI2TAynclXMJTJ5Y6pARn5pmPxS
	cxr0o20Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphuW-00000004AtZ-3wXJ;
	Sat, 23 Aug 2025 06:39:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upUb6-00000003AVp-3sQZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 16:26:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FBA3402A9;
	Fri, 22 Aug 2025 16:26:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652C6C4CEED;
	Fri, 22 Aug 2025 16:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755879996;
	bh=gqeBbcxNavI1L2mbvgc6p1M/POMGsZs1Pur53RdU1zM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UfZEfi65V81DWiABQvuX9GVUFfEBh5DX1N//+22SzsOvF7mKscQvJktc1iiW1+kkk
	 2r24TzHuOfqhYjwgWu+p8B7ghwOtlV2pwR0Kr6JJ3BRYWLBskO13LZcQ78Ff27Y1Om
	 63pPAPFFO3kD7cZLG+ST8G6mujcjXfAPSMPVdFJuy7/Y4U6wvTOulLvWSZy3zqfinv
	 Duzw6UxrqEgevFlDHG3bQ3LW53Hmsk1dv2+bqpjuGz9rhj5DdNNR2YnHIbO1Q3221f
	 NTL70yCogjD6O1IvAk5+RnhAXucniMeW6SvWioa2sBeGMMjYKMEuZa7nVLeRge7JSh
	 ARMfUAJ/aUG8w==
Date: Fri, 22 Aug 2025 11:26:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Simona Vetter <simona@ffwll.ch>, Fabio Estevam <festevam@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	David Airlie <airlied@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: arm: fsl: add compatible for Skov
 i.MX8MP variant
Message-ID: <175587999529.3977942.15581850893122892977.robh@kernel.org>
References: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de>
 <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-4-b492ef807d12@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-4-b492ef807d12@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_092636_983725_30DA2791 
X-CRM114-Status: GOOD (  11.14  )
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


On Thu, 21 Aug 2025 09:55:31 +0200, Steffen Trumtrar wrote:
> In preparation for adding a new device tree variant with a different
> panel, describe the DT compatible in the binding.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


