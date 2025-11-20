Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37146CF9C7B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 18:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+SZMoFx7dp0WnikjZjwf3tKOhG9vjl6fcv9sqh5zY4=; b=hIuFzjTiF/VHp2Cb1xAgFErBj4
	0Bq4ZILtblYm6aXsopoJ6gN/c17O7NK0Q3sGzPOfUj/9YkQ6wwZUXauJCrzYWT7qrsLJOVmjjUYco
	RkgWiNYYocTwcOyxyiz6aqMIlWXuLb7LnrXC8/xldA6a6lZEW0wTLP+68pzYWXi3w19g5WrVZIg1w
	6v/Aw2J5NplY6eWEz0Mma2hVW4z0YNVI3Ppgkn3ED0mxCjlFCzDnlRbX6QT59zLfsd5tyG55pMbZu
	APAxhMUaZtoJOVLK1JwIc+8sGRZxMWJyUP07utwmaEAJQJgjqdBcMjQ3K5syeuXXDSwAVp0mS/rUr
	tvbfheDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM92G-00000007CTG-19Lz;
	Thu, 20 Nov 2025 18:05:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM92F-00000007CT5-2hFq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 18:05:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0CE8D60017;
	Thu, 20 Nov 2025 18:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8CDC4CEF1;
	Thu, 20 Nov 2025 18:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763661934;
	bh=z/7LLYkvtilOWW5B51I+SFKAypZVG2JftnUA/TgVcMk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C8nF/1nVWL5ajQOj6JSm5+XBikJxM+6CcUGfF12YXQvVZujtmdiHas+O01AIThTQd
	 X+icPKmat1sv9+HLzUDgVCqyGZ9L/PoXc5lC33UbwxMeumO6LD8JXlCSaUr+ety3mm
	 5ohV9hCoKV8q4q7sRfufZ+SHqlb+PJ86aA7rt+49R19s7JVYyoXoG3jZMwCn0wOBNB
	 PCTDrWEyXGZAL3sDKJxP8/JUdP42dwnDVQiTtvhAe+8Y5/NxJKZhe9o3nFiFPJfzRK
	 P5XJ7OUw9ctPXXodCvuq/f+w4323GYBGFsWfXm66O/I5vDm2hOurv/LNcPNalLpMYE
	 u4Ly/lc2ntudw==
From: Catalin Marinas <cmarinas@kernel.org>
To: will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cai Xinchen <caixinchen1@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	lujialin4@huawei.com
Subject: Re: [PATCH -next] arm64: remove duplicate ARCH_HAS_MEM_ENCRYPT
Date: Thu, 20 Nov 2025 18:05:11 +0000
Message-ID: <176366191170.2470788.1195732994612259145.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120013025.1791800-1-caixinchen1@huawei.com>
References: <20251120013025.1791800-1-caixinchen1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

From: Catalin Marinas <catalin.marinas@arm.com>

On Thu, 20 Nov 2025 01:30:25 +0000, Cai Xinchen wrote:
> The commit e7bafbf717775 ("arm64: mm: Add top-level dispatcher for
> internal mem_encrypt API") adds ARCH_HAS_MEM_ENCRYPT. And then the
> commit 42be24a4178fe ("arm64: Enable memory encrypt for Realms") adds
> duplicate config. Just remove it.
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: remove duplicate ARCH_HAS_MEM_ENCRYPT
      https://git.kernel.org/arm64/c/f20810157f6e

-- 
Catalin


