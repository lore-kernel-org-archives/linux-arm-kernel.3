Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F902C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 07:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6RrCayG0xUHKYkyyjZg3K24ocdryZVIPWFeqEi3bcx4=; b=UMTzNuV4bQzDNOuIRhLVNglT07
	yYGDiY+1kW/VgqtxB0rlo0m2qfc/7lyrQf8i7LY12z+eljgLW624GEN/b6yxtY/ymuql1M5KRg7nH
	aKFFKICNRoiPkVPg+9BRoDwh3hJjB7afcppuatyt+rU3Wzy4zvzwxxgV2FPZCaixOnnhbJo2gAO3O
	wyeFACQ5sM+E15IxsV6UaVzCFL4Y5lWrV0qdd4OjiD+8ovTvxu0XN6m42TeyvmK1NHQlyCv+GfhEP
	hS4eRbdyBIoH0SH+4cE1xcwo4+enZaK2q69cYscOuO7wYggqJVmDTpzxNAbbxGeYWKONevNDraIJ5
	8RyAzKcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toH14-0000000DYGB-2Ih6;
	Sat, 01 Mar 2025 07:12:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toGup-0000000DXOu-1Pd0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 07:05:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0ADCE5C553E;
	Sat,  1 Mar 2025 07:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E51EC4CEDD;
	Sat,  1 Mar 2025 07:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740812738;
	bh=wT10qmxPNjhJO3TUiqD0b6InWJqdJHkHlWn0Rozw/jo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dEgEBU17hpmVAOOUI8kKAia6ph4Q9pDyAxnubjACWGjS0ogNVNHO91AbaVqCrSEhB
	 vHq3hSasyrO0zXBcU2VNGJG1lKoMQ8Aj09mUwCOvyAkp+ofJlaXpoTcnSMqXMH293o
	 tNTyIzv0vCZawxrFaH4waE25ZZ/o8VGwzn5qr1UI8feIkM+lLjaQK2QL6Ec1RHNnKc
	 mH3zxfNHcNcT7GYji3Gq09ZyPyWXZ6UxsjDVas1mrrqkhbnEwQco8hOEBH8j5Ao3kD
	 NkePOROWZKQUaxydCtYJEVE6JWL3IAoR/82hha7W37AHu0+A7ZBjPZ/YgS8npSTzUo
	 Z33Cafx5VVCyA==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	ilkka@os.amperecomputing.com
Subject: Re: [PATCH] perf/arm-cmn: Minor event type housekeeping
Date: Sat,  1 Mar 2025 07:05:25 +0000
Message-Id: <174080632166.3210087.735484296197071169.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <ef46a47fc4ab909093f14b2b4289a4835836ab6c.1738851844.git.robin.murphy@arm.com>
References: <ef46a47fc4ab909093f14b2b4289a4835836ab6c.1738851844.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_230539_418774_64EC6ABF 
X-CRM114-Status: UNSURE (   9.27  )
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

On Thu, 06 Feb 2025 14:24:04 +0000, Robin Murphy wrote:
> While handling RN-D nodes under the functionally-identical RN-I type
> works fine for perf tool users using the "rnid_" event aliases, and that
> is the documented and expected ABI, there's little reason not to be
> permissive and accept the actual RN-D type as an additional encoding for
> the same events as well. This may be convenient for other tooling
> generating event configs directly from its own topology data.
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] perf/arm-cmn: Minor event type housekeeping
      https://git.kernel.org/will/c/678a5d3d6db6

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

