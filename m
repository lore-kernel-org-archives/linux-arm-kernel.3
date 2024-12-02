Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61F6D7833D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 17:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZmOarn85vgr9FzytW0VtDxdUzGbdB2lqJCF18EvmPE=; b=b3NVL4AmQjlpGfhSHqeIaw6Ovh
	wEL1+bG1HR9cGAIzDqcCJWO8YMJvu9V5yS8DxFgpe0a4fzVAiL1Eam0zhXx3l5EVqpgw0Vjc3gy5w
	fVl7Yg9B6uSDyYXoIpNG19FkLY/iEB6uQ7gRMxyYHKptUcBWI20UidX21DbK2fPpUm2RCVkgXgdUR
	2utVWL2dAxW+OFK89h9Wc9y2Z30V+arm1lUI+EKrhTjdQj5j2kJEPKTCCOtcggshmWoIJcwdp/O5N
	pGQ8K9k/v4c/4jjk2VQhji/zg9rOVWCMgWbjBrhLZYszMKVfmeY852FCtBJwlVs34lpF+T/nV5s7s
	cWY2anQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAOC-00000007390-35xp;
	Mon, 02 Dec 2024 17:39:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAGY-000000071Nq-2qSY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 17:31:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6C693A41070;
	Mon,  2 Dec 2024 17:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E972C4CED9;
	Mon,  2 Dec 2024 17:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733160681;
	bh=WMt7Cfzx5clJe+hR86E0PnFc9JGU/GXcD2Ch07F0c50=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jZEEAJHHTV85F8upg5TJ2HjEOIJGfjThYSmzx1Fbq45FDLkFpuHylKQupbavUjwzp
	 5iPgKlMEQHPfi8g0tip4477HiAYnli/foCPAs6vl0/1U1XW78Twi763P9Y1/oW7Zfd
	 QqMONgmLT0Nl1/OLMei9IAzK8egHS0dHbV/CHEYV3EkyjEIYKty/VzQN6hkZ2yZSAT
	 UrVhG+NNiVy4nkp0RV8yMVkMo/pBhCsr8sSgJfSZS/VNvI4T1b4uEjCeAo6xypzRD6
	 sWBoSOB9Dd3K/C8/Ih8GE23oS0Xh47EbwlhuYRlJv/GrqUAJMurebXc3NepVeD+Y3y
	 rO+ljxGMFOB4Q==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Marek Vasut <marex@denx.de>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Michal Simek <michal.simek@amd.com>, Peter Korsgaard <peter@korsgaard.com>, 
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20241031171132.56861-1-marex@denx.de>
References: <20241031171132.56861-1-marex@denx.de>
Subject: Re: [PATCH] dmaengine: xilinx_dma: Configure parking registers
 only if parking enabled
Message-Id: <173316067900.538095.9728729453604607068.b4-ty@kernel.org>
Date: Mon, 02 Dec 2024 23:01:19 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_093122_782666_6856C417 
X-CRM114-Status: UNSURE (   6.11  )
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


On Thu, 31 Oct 2024 18:11:04 +0100, Marek Vasut wrote:
> The VDMA can work in two modes, parking or circular. Do not program the
> parking mode registers in case circular mode is used, it is useless.
> 
> 

Applied, thanks!

[1/1] dmaengine: xilinx_dma: Configure parking registers only if parking enabled
      commit: 8a20040f9de3a4ea90ab900cdd7745d57bc2da82

Best regards,
-- 
~Vinod



