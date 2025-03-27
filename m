Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D85C36012
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 07:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QnbLbsNad7GpmE9Z9Jn4hkvOMZ07ehjB9rgk5FpDDNY=; b=JAr5R6aRWKZGGIXVLll8RZXmCJ
	PoxkzoTf1fg8qCOusg5G1wDoVzN5xhMUwUymOq9u7jcuCSH8fMuqEYfNLpDufqCfS8k7wynCDGLZk
	JUl22hSMp5me33SY0f965bpQ+S9cvQdQ6WKC3Qxqp/ssQEfwwXqAHDVg3LH8NJX0HU+CaTsqfCPU5
	aX4r+XrdIFXyygO1H+ZQbJSdKW+/Q3cQ/VFD5gweAJn52svhj+VunYg6mIdTJknD7V2Ajvmi4l95G
	96fqFow8mqBLMvriQL9UEk+gJZS5YQb2IkcenGpr8MCCNOhrP/sIQMIZXktaj+V387CR5clGgRHzS
	DlgIfivA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txi7X-0000000AO8T-2Zzz;
	Thu, 27 Mar 2025 07:57:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txi5m-0000000ANvb-3goB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 07:55:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 20C01A41BDA;
	Thu, 27 Mar 2025 07:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E03C4CEDD;
	Thu, 27 Mar 2025 07:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743062157;
	bh=XwCGCufdAWY9+XJt03fhUGbNeZ4m9tswVxZeGzrbztM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bcz0RfUU2oa+EZHU2Vp0WF0C2DVMOMzOMUwEtb7hV1R4SacNCyvy/2GIb97V+uKtb
	 BidzlLAIKlWG6R1wPA+K7DOFCQCwT6iNSOBFFRSbwgoCI/H0TJkqESKdxMU6BJ/+jK
	 6LFOdaEKlV1275mkmIt04r4cUsTZGMACGN28QzaPWBMUYBGX6F8s/oHpDK8H0KlvFB
	 ahnNpwQnmpdGFja9fOdgEwKkNmgFwLM/DnmaNZFtApJ5H9bLprpDpRtwLBH+iAzLKs
	 wfquhQ5C8xGa2hRcz48VNQOh2dMweFDr6RPXbM4SK2TOPGKF1yFAqQ+9+gziI0MGBk
	 HVIcZgydh0Jjw==
Date: Thu, 27 Mar 2025 08:55:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Alessio Belle <alessio.belle@imgtec.com>, 
	Alexandru Dadu <alexandru.dadu@imgtec.com>
Subject: Re: [PATCH v5 01/18] dt-bindings: gpu: img: Future-proofing
 enhancements
Message-ID: <20250327-pragmatic-lemon-flounder-e2936a@krzk-bin>
References: <20250326-sets-bxs-4-64-patch-v1-v5-0-e4c46e8280a9@imgtec.com>
 <20250326-sets-bxs-4-64-patch-v1-v5-1-e4c46e8280a9@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250326-sets-bxs-4-64-patch-v1-v5-1-e4c46e8280a9@imgtec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_005558_979300_3A3CA462 
X-CRM114-Status: UNSURE (   9.85  )
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

On Wed, Mar 26, 2025 at 04:48:21PM +0000, Matt Coster wrote:
> The first compatible strings added for the AXE-1-16M are not sufficient to
> accurately describe all the IMG Rogue GPUs. The current "img,img-axe"
> string refers to the entire family of Series AXE GPUs, but this is
> primarily a marketing term and does not denote a level of hardware
> similarity any greater than just "Rogue".
> 
> The more specific "img,img-axe-1-16m" string refers to individual AXE-1-16M
> GPU. For example, unlike the rest of the Series AXE GPUs, the AXE-1-16M
> only uses a single power domain.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


