Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E6FC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 12:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Bv9HPmnHSGIKgImUkd4cszVpywKncR35fxJFY+xxec=; b=dS2KyWt2N7lubEZZjBSr0l4DsI
	Q1BjyzMwPylJHNAXPIjS6eGPH60Wnyh38s21NauvQ/7t8OPwo9qki9ecCYLSvaDQAwViJF1sk2iBd
	Z+d5zPTha1xhSkjUsa7Yl7Nbx+I8ujMypZ4DiQ7KlM+QgH75wx5z30mEjuFKeRmBM+kFlJVkb9A8J
	CyOFou5VpOSH5oQK9ZwYyngaogMqYL9i4eYq/CA8/8z0poelVRKyKZBXDYRTQK3ECP63dcvmF81za
	6L/5TH5ICBYJAUSOa2rKIKVSejsINvT0c0i5n3TU+pYTn7j6wCUQ32eMSkaP/GJffZFzeMaxJVOad
	CVp4+Iew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud72H-0000000EG8I-1tlA;
	Sat, 19 Jul 2025 12:51:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud6zl-0000000EFwp-3l4a
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 12:48:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A89745C4C05;
	Sat, 19 Jul 2025 12:48:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F72C4CEE3;
	Sat, 19 Jul 2025 12:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752929331;
	bh=SZBlAvUTaxgU1cxYHSeOXy3gDq5jLgGKKRP+AKro3v8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R/ICxzhC8cEnWzVqs6l0MMBpXp9Cr+LlIIHRlcWf/5bkvFgBTYqHOTSSHdENxad1z
	 HKyzzNJa/JKo5GhK81201QRJyEoSByW+qCRw5ZiKDuUakmtF94kU7iPTpyUc81qioL
	 IJWUHwS4eWsDvKbcs+vYVny8mm/TNm5F/I3D8FNx+OD/Ui3+IieaEatr9iBxR6RDUC
	 H6lRoDbStOH0XnoSevoOCNzAChIYWAWUkyKoEb3w2aYl7sRcUQM1Tef1iMks3XQEAl
	 jHJRCrujjtOsUGuzvdj0GBxhEZAlBIYEHdAfMwVmLQSmOYb0S6hlSAO/5a7yVyTsOK
	 p7Srn1KUSC6Kg==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Bindings and DTS for Apple SoC GPUs
Date: Sat, 19 Jul 2025 14:48:38 +0200
Message-Id: <175292930365.11148.17885193055707166260.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250710-sgx-dt-v3-0-299bb3a65109@gmail.com>
References: <20250710-sgx-dt-v3-0-299bb3a65109@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_054853_974827_C129C94B 
X-CRM114-Status: GOOD (  11.72  )
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

On Thu, 10 Jul 2025 00:21:43 +0200, Sasha Finkelstein wrote:
> This patch series adds the DT bindings and tree entries for the GPU
> present in Apple M-series SoCs. The driver itself is in Rust and
> upstream is currently missing several prerequisite bindings, so will
> be sent later.
> 
> The kernel and m1n1 (bootloader) that are using those bindings are
> available at the following branches:
> Kernel: https://github.com/WhatAmISupposedToPutHere/linux/tree/starlight
> m1n1: https://github.com/WhatAmISupposedToPutHere/m1n1/tree/bootloader-cal-blobs
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (asahi-soc/for-next), thanks!

[1/2] dt-bindings: gpu: Add Apple SoC GPU
      https://github.com/AsahiLinux/linux/commit/23a6959ff34e
[2/2] arm64: dts: Add Apple SoC GPU
      https://github.com/AsahiLinux/linux/commit/930759aaf34f

Best regards,
-- 
Sven Peter <sven@kernel.org>


