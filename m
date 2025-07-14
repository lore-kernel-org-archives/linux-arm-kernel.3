Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A49C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 16:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ga/SLn+8eTF/rtgEkbKbAuyJns74DIdROEntSqIYczw=; b=O+TyhzhWUNx5OWeh9VziwnQB49
	9AI9a0CvueO4uhAC/OCJRHGL/jUo6hVsYKEL3lXBf8/6IzO3Ds7z96vQOJkPdHJkio5XFFNzB7bWZ
	i/H3sGlHtX1yzmyNfKSD+E3w+vW+qP0T9IUuMuuip6f2P6UjsCuQF1tR7AHkJ+Cb5wyzZENyDiM1g
	zV4tubbLL2b1X9F0Hf8mTYHQ+bqiuCRr35AX/Bz5o6CvekGqRe9+BFxvIXekVil2qdpo93SckMCqU
	b1XdM7zwwFjn39PAfXbwrnx0jDeVNxdtHUs/rDc3HHlDJBjbIFxcdZEmLX3ir3yltszzu4B3n+hxT
	NvJmJXYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubM1i-00000002pkX-3TVf;
	Mon, 14 Jul 2025 16:27:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKov-00000002bCX-1q46
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 15:10:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E018E45D4B;
	Mon, 14 Jul 2025 15:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7ED5C4CEF4;
	Mon, 14 Jul 2025 15:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752505820;
	bh=VxCykl7yeIAWJjVFGH1guO1tvXM4SvGkFfbkVMygBtM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zh8nBNHlmLfyFWZsuMIA7Hkw3ddNEz0XUz3Pr9+g0MTzGDdm1q5T3EI5Okq3X0JRr
	 77yWCZl7SeJkREuWJqZxL8vUpynLCTOrqySWKuW0p7ErfpLdoTJP0nkg9yTXFQC0a0
	 /FPnk19mP2fyJgoDhhMMnpxd9nh4ZcYJgJu50u4yf0Y0Rbg4OhFNxN8ZfiwkGahw5F
	 HPqixW+4x15vkipgl04BU0+t2dlX+rF3GYUwc7/LIzvJG+mooOnBiyJG6pB4fXYivO
	 Mh4mzbPp20Zdh1ZV0tXnwnk2UFJo7ciB832i1fvF+G2WYY2WdEfueMz+/FhxP8GbMF
	 XygWhQQ4XStvw==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	allen.wang@hj-micro.com,
	peter.du@hj-micro.com,
	andy.xu@hj-micro.com
Subject: Re: [PATCH v2 0/2] perf/arm-ni: IRQ improvements
Date: Mon, 14 Jul 2025 16:10:10 +0100
Message-Id: <175250207277.1540736.2402817264708558809.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1752256072.git.robin.murphy@arm.com>
References: <cover.1752256072.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_081021_495358_3554E143 
X-CRM114-Status: UNSURE (   7.58  )
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

On Fri, 11 Jul 2025 19:15:15 +0100, Robin Murphy wrote:
> v1: https://lore.kernel.org/all/cover.1747149165.git.robin.murphy@arm.com
> 
> Hi all,
> 
> Here's a quick tweak to address Will's concern last time (minus
> the affinity fix that's already queued).
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/2] perf/arm-ni: Consolidate CPU affinity handling
      https://git.kernel.org/will/c/6a5dc6c7534e
[2/2] perf/arm-ni: Support sharing IRQs within an NI instance
      https://git.kernel.org/will/c/89f0b9ccd314

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

