Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBA0CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 22:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=we48tBQw9ocPjYNwaCbiP8f9KxGA8PAJRh4NO+1os0M=; b=iqLoV0ppwa0T0a0ekWK/hsuk5K
	nP4mGmGYu2gogU5QXsxv2axEYnUaDErCIhW5qaIDkzSPFSDXCT9h7E5syMBD+WuPRe4x9zbVCl+Hs
	q0hL/EiQCKLtJaxyHiCHekdsVNKtd3jk3ds5ctOvN9rnkAhrUOWrpLpAjZRWsIXy+tj4DzVkpmHd9
	2UgI0y+gbPLFBZanhS0hJHTZsP7TBgmMTPymb+pbkJEExLICJPndEyOyLovO/MJ6y8UYcTVCWPpz3
	ySFEFAAv3Ra7arGguRlfnub5lBjmk7/tU2gYT4xEItlHxdteuG5S75pdHin4Tq6Bm4qrENqXoc5MQ
	5Fj9fwIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uorCg-0000000F5MO-1JHS;
	Wed, 20 Aug 2025 22:22:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uompO-0000000EaDC-2FOR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 17:42:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DF2ED5C6948;
	Wed, 20 Aug 2025 17:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C180C4CEE7;
	Wed, 20 Aug 2025 17:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755711745;
	bh=taFllpfPeK/OWKFrcmr/fx+iqbU6n6aNamWk8kSs85c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JZShsMle4YSqU5Cg5hrdNlXcr7QOuELENAwgYGh7PvYEF0Pfnn3bFkIdJvHeR8yYY
	 zWxxVpbzARHC9IDfAFtF+R59D5CPixT+D8AlnchCwqiqav6Wtly8wxmGbUYzsHs1va
	 kEFpG1iivL5WxhlC1T3WyFPOC+dlkXJgfILLuEx37kvwibrLEHBSqsM2De5ieZ/DO7
	 p6B4Y30M1Zp7LpWnNP4lj9a4sw5vp1oUOXbEBY0NpmWmaJDELVg5KV82Ck1d5HMkl2
	 EhuFtJr6jxyrPNk6nCyCwmLCVPxC6tVSEa8LxMpMHgYoOHrNAN9Nb7w/4Uq+V0v7rB
	 7rIkSjg00NMZw==
From: Vinod Koul <vkoul@kernel.org>
To: michal.simek@amd.com, yanzhen@vivo.com, radhey.shyam.pandey@amd.com, 
 palmer@rivosinc.com, u.kleine-koenig@baylibre.com, 
 Abin Joseph <abin.joseph@amd.com>
Cc: git@amd.com, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250722070255.28944-1-abin.joseph@amd.com>
References: <20250722070255.28944-1-abin.joseph@amd.com>
Subject: Re: [PATCH v3] dmaengine: zynqmp_dma: Add shutdown operation
 support
Message-Id: <175571174185.87738.5416812365218476037.b4-ty@kernel.org>
Date: Wed, 20 Aug 2025 23:12:21 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_104226_617504_3E822351 
X-CRM114-Status: UNSURE (   7.64  )
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


On Tue, 22 Jul 2025 12:32:55 +0530, Abin Joseph wrote:
> Add shutdown callback to ensure that DMA operations are properly stopped
> and resources are released during system shutdown or kexec operations.
> Fix incorrect PM state handling in the remove function that was causing
> clock disable warnings during the shutdown operations, which was not
> implemented earlier. The original logic used pm_runtime_enabled() check
> after calling the pm_runtime_disable(), would always evaluate to true
> after the disable call, which leads to unconditionally calling the
> runtime_suspend regardless of the device's actual power state.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: zynqmp_dma: Add shutdown operation support
      commit: 72dd8b2914b5db1dccf902971c2ea6b541711b28

Best regards,
-- 
~Vinod



