Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837F5C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 12:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Z/kJTk2QbAg2RGdv2Thg8ncSm9fehAseAOCDXfVOJo=; b=oIy+MVO+6bVbLMtBkgT8PUo1dL
	DL57hjJUG3VDZoq1Kdfr7FEOM49A0xo3EIzXmGWffRPTAB0jZl9fJUi0N9/gsYmwqv/JaHNg3YO67
	xnTlMtukBiWvocC/PYbCY2Xofyik1lNXtaFOiAVrdVlSbzOSGLzDtFnl0x0UpJjVe6P54vLiCuBSf
	/fL6icwP/M/RbQ+5j9OmqvPuPGEJK+sZx2RnjK3szqiEA//i97zm6koSKyagirlAeW6eq/BI9LQaq
	m2uO3w45zyzsLkbQvaKF2kbagbo+onUjLVcFzePpI8oH539PqI+RaeCfddppJmQBOnYLjjsaZra5J
	G376T6cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndG0-00000007Pjd-3Cg9;
	Thu, 27 Feb 2025 12:44:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tncgL-00000007IOi-0Wju
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 12:08:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C02B65C54FE;
	Thu, 27 Feb 2025 12:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB90C4CEE5;
	Thu, 27 Feb 2025 12:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740658080;
	bh=ME/jFBB/8LAlnipMqfXDhYq3yllHUs3jw+ftJDiUXPo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MgJmAANJa63nT4JPr6QeRtdr5TyxDyYclFJ9fiUy4OTHpRQ8oJEbJbTVWk1GPU2bY
	 gGJ79fOBrhDNEzBVCxlFvdFqyGCjrvGYjdmrbG5z2CcCMUryz46BM+qKj0zmnkHejP
	 NeDgH+fNQaxwaWFYSqY3h4CUR0Yg0bOX6ujqVmXsxyL43oRaVaZRuq/USty4KDv6EB
	 mFJQ5vUyCkQ3fm2wptEeAiB1SN1SxD0djCc8nJPg+qx+eQcppjadjncB/ZMYZHowZT
	 1aoDoMY/uBJGrQNHu0vbsa//ZonsHRfxZqTjjHFLByy2yHPXdDBydhRzfb03WNGEJN
	 sXrYROekYL6Bw==
From: Vinod Koul <vkoul@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: Lukas Wunner <lukas@wunner.de>, Peter Robinson <pbrobinson@gmail.com>, 
 "Ivan T . Ivanov" <iivanov@suse.de>, linux-arm-kernel@lists.infradead.org, 
 bcm-kernel-feedback-list@broadcom.com, dmaengine@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20250222095028.48818-1-wahrenst@gmx.net>
References: <20250222095028.48818-1-wahrenst@gmx.net>
Subject: Re: [PATCH RESEND] dmaengine: bcm2835-dma: fix warning when
 CONFIG_PM=n
Message-Id: <174065807656.367410.3130811879285785040.b4-ty@kernel.org>
Date: Thu, 27 Feb 2025 17:37:56 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_040801_208134_94EB6F1D 
X-CRM114-Status: UNSURE (   6.49  )
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


On Sat, 22 Feb 2025 10:50:28 +0100, Stefan Wahren wrote:
> The old SET_LATE_SYSTEM_SLEEP_PM_OPS macro cause a build warning
> when CONFIG_PM is disabled:
> 
> warning: 'bcm2835_dma_suspend_late' defined but not used [-Wunused-function]
> 
> Change this to the modern replacement.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: bcm2835-dma: fix warning when CONFIG_PM=n
      commit: 95032938c7c9b2e5ebb69f0ee10ebe340fa3af53

Best regards,
-- 
~Vinod



