Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B73C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 16:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=379aetDgXOPgSIreXsR1vpe/EcBFOYaG+eiElKBm1+8=; b=EIP+MyxF4z42rEam0dlAG5V3PJ
	uhVJhJShlMjutd7ko4yor9V6e/akdNBX9iVu9b5q2M8p0xXEb2fZxBFYZFV7OCHWP9dqSlapTntoV
	Y6v4WmGo9ZFK2y6cokHEAijOQhTQJzYdiPas6PqF+RSDZZnLNpJdqCmg8LC6DIt1HcgS9gxZt9cdM
	m2T99Lkwg8eUXSQ1ZtvshDgA9Zg+iBjDw3c5rjDZfm7nQt+BHo+K7KfbooXSNGlYnl4jOtQ44vO6c
	eBgAXd6IH0zP2UxKlOx2R6kNQrF9Gs5N1sEPoAhPUL+CjuR5NftwLjSD2nQSB6bzNiKFN7K7x2pbs
	F2gO982Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugnWV-0000000HIrQ-2DeU;
	Tue, 29 Jul 2025 16:49:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugnFy-0000000HHHK-0Y57
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 16:32:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7BCE55C54E0;
	Tue, 29 Jul 2025 16:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3A9C4CEF4;
	Tue, 29 Jul 2025 16:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753806769;
	bh=4Q/A4r8d1ZQG3FbhyPguPVRCWfgSCwtAKYlECW9aL8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZSDzJN4qfDySDa3inQAme1/5ohrxBxAW/m6YDS4aZWvssxOisP/Qrif3iXkCfvyVq
	 gE1dlFv2TJ2qocOnrCdmyhnChms0rISSR/pkTd9pVUb+mJcQ5LJI4hsdauM4CsJc4T
	 OGglGeFVQjf8GmrSN/16Bue5Jjap/Xm3SsersBB4klsxCfFjQcVBL4MWVqMyX4HxqR
	 KOYNUkLjKrlIJ1y83HloS3aPL+q2T0xEbeDtfsjzrLKLC65OsF8LgsVhNwliWhFbRf
	 EWD2G78Gs0vzKVg4B7mybseNtKrOtw5WdRdDTNSUaHKXVoixG0zu0p6kkiAsCdHyXX
	 XBlae83qbcz+Q==
Date: Tue, 29 Jul 2025 11:32:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Simona Vetter <simona@ffwll.ch>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 05/12] dt-bindings: arm: stm32: add required #clock-cells
 property
Message-ID: <175380676749.513254.17364402562772205374.robh@kernel.org>
References: <20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com>
 <20250725-drm-misc-next-v1-5-a59848e62cf9@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725-drm-misc-next-v1-5-a59848e62cf9@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_093250_210481_31657ED5 
X-CRM114-Status: GOOD (  10.84  )
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


On Fri, 25 Jul 2025 12:03:57 +0200, Raphael Gallais-Pou wrote:
> On STM32MP25 SoC, the syscfg peripheral provides a clock to the display
> subsystem through a multiplexer.  Since it only provides a single clock,
> the cell value is 0.
> 
> Doing so allows the clock consumers to reach the peripheral and gate the
> clock accordingly.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  .../bindings/arm/stm32/st,stm32-syscon.yaml        | 31 +++++++++++++++-------
>  1 file changed, 21 insertions(+), 10 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


