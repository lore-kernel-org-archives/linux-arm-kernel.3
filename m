Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D936606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 06:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0wyyY57F;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gap6WM2k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ngSZ2pqR2sxPQ2bO2CF7a94hWgprN24K+32PDqqmK40=; b=0wyyY57FL3JXAz
	l/gjvzZyj+4twTrN+wHBWd8r01/WK8cvG9e8e94l02/SxZQK8pBxh6Gxa6ffSrBbz8LiE8MiYhkHA
	fzNO146zErNCQvdjRShYAmosIT6RioS+dLGEjQNZrg8PNjP8sDXCUmDtfxm7cX0kyIocUApVV++gb
	ZAkh2AUOjoIi01+4GCrWr+5uYcEYW1YBxfLcwIKLr5armIZUcBIeQ0tgdNwUsFqA1uG+FaR9cMH/q
	59+OBtJn59pssQEA8e1ziAsQ3qev75TaYPxWTzhS8WGS8U3evV93rstGSRswp5SgoltPqckHPR2iS
	kI1dKHCftGkOLcFyaLyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO7Yp-00000001Aez-16lT;
	Tue, 03 Nov 2026 05:59:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO7Yo-00000001Aer-3cBy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 05:59:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1FD2E601EF;
	Tue,  3 Nov 2026 05:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79CC91F000C1;
	Tue,  3 Nov 2026 05:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793685592;
	bh=ngSZ2pqR2sxPQ2bO2CF7a94hWgprN24K+32PDqqmK40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gap6WM2kbcvJLj8N3Kr0C3GGvAOF52jS3O2quUzstowWmW4i/7W/JGMxOLh+vgNMD
	 a4DDqL2vl/MeciMqeDh3B/4Dbb+8uhYWFwbLwcz3WUCyU1VtxNcMWgGhu/xYr+ZAfA
	 +WyNkJ6PTa6NbnujZIcc8A/Wit+5nWYViJMKfOj77ezmx4GeO8ShsDRTwqZfhIxJXN
	 BGkyJatlIgSaGqz/qQkqQ6EeObav4UQGzpaMQU5XWRkPiWH4qbegYLZz7ZENh1T0ow
	 bCKx0J/yMvhW+yn6b+RThKStPNS5hdjq+oJBDfxqwJ59Q3Ro3eEGobjbRvGzcYU7/4
	 jwKX8CZf2UD5w==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add Apple SART4 support
Date: Tue,  3 Nov 2026 06:59:41 +0100
Message-ID: <179368556096.107891.6027524594611326128.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261018-apple-sartv4-v1-0-1eaa5d63f6a2@cyberchaos.dev>
References: <20261018-apple-sartv4-v1-0-1eaa5d63f6a2@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 18 Oct 2026 18:38:09 +0200, Yureka Lilian wrote:
> this patch series adds the dt-bindings and driver changes required to
> get the new SART4 IOMMU on the Apple Silicon T6050 (M5 Pro/Max) SoCs
> up and running, which is required to use the internal NVMe.
> 
> The dt-bindings and device tree nodes for the ANS2 are omitted here,
> since the minimal device tree is not ready yet.
> 
> [...]

Applied to local tree (apple-soc/drivers-7.5), thanks!

[1/2] dt-bindings: iommu: apple,sart: Add apple,t6050-sart compatible
      https://github.com/AsahiLinux/linux/commit/d276a2b7f437
[2/2] soc: apple: sart: Add SART4 support
      https://github.com/AsahiLinux/linux/commit/01098fba87a0

Best regards,
-- 
Sven Peter <sven@kernel.org>


