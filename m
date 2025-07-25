Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 938D3C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 19:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQeD/kV6aGeSr4ujNvJX8oH7M9irhCtOhgxLqTyYNzU=; b=NV+y4RtoTw1YnldvQe73MVSdSh
	cpWC6h59tJ3VzxD48cNrKLJ+r93ekSX52gjXgFrITASt7xUBaiLI7mui9ewi7fLSTf++JFEsszdeR
	HG5vZUjDL05N1FrifNdUEX483U0pNH5/bp99Se3WUgAUW5JxDXc+PcBvFwAQfQq3SZmbZ3OgmTPnh
	MqpeGhpeosx739ZE9zD4w0QLvFMXP447/XmGBfjhNsr7hwpaahI1pphjFTsrN5CXc+M12zxOg15hr
	HHTdIMqqziWZ7mEcrMEbxd4aLYyTqRNZSHlcOlvh4+bYBlWDiBucm9d/PpXsVy80HiOe4hawUCL4W
	SodVfJGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufOX7-0000000AbCq-3zpc;
	Fri, 25 Jul 2025 19:56:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufOR7-0000000AaaV-1JYT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 19:50:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A61C95C5EA4;
	Fri, 25 Jul 2025 19:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA87C4CEE7;
	Fri, 25 Jul 2025 19:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753473032;
	bh=6lY6UGRDx8pQqm2Sb2XSSnUUQnx59WVl3IMojaG/Ruw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oxp9UEfET5NaqA86+frV0GpYesrm5a6+Y91ObXxbH/l3ZMs8itaYumIF4kJ262fui
	 f2JZ7SK43n7wt6+w7fB6MND3aDzqMst07G5/AmDUVIusijI0gwZFKPS04db+yGZ5z/
	 C1Bum5jGv372JMKCMeSVyzfYbUEkIwTVbpmjB4qUM3hm1y2RSGGZjGHfkq8S8Z7IR0
	 0bCYDOArJfhVtXL723YvFzRR2U32j+hXNLIRPYe02YwpnMkkaVs/P2RPcPt5DssKor
	 3BPb7ZjZvWk08y9FE71kJUgyYZPR8N2AlauH73m3hFUzaRGj3q/LyLoGfJa0PPOMSj
	 j1QAIkSAe23cg==
Date: Fri, 25 Jul 2025 14:50:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: linux-kernel@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Will Deacon <will@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>
Subject: Re: [PATCH 02/12] dt-bindings: display: st,stm32-ltdc: add
 access-controllers property
Message-ID: <175347303098.1735273.16989682825723022280.robh@kernel.org>
References: <20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com>
 <20250725-drm-misc-next-v1-2-a59848e62cf9@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725-drm-misc-next-v1-2-a59848e62cf9@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_125033_390179_C180A230 
X-CRM114-Status: GOOD (  12.74  )
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


On Fri, 25 Jul 2025 12:03:54 +0200, Raphael Gallais-Pou wrote:
> access-controllers is an optional property that allows a peripheral to
> refer to one or more domain access controller(s).
> 
> This property is added when the peripheral is under the STM32 firewall
> controller.  It allows an accurate representation of the hardware, where
> the peripheral is connected to a firewall bus.  The firewall can then check
> the peripheral accesses before allowing its device to probe.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


