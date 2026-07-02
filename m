Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1263C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtNd6BSHdRaL0Wa1rIKAQuRLmED7YnoMHeDT0+9L1os=; b=uc1TrhaDpDlD7ngZ4Qx/wL5NE1
	mIQ2iUeQlFzSPU/SnNmJ83zjO4XDkKcTFYFzHU5QGZuUoWMA+EoCiCykt1IJLEA4zQWmlZPnOSa9F
	ge6HoYf8ckUGii24nGI3eeYXGKccR8Z7tlSlTpAdVBCP7kn3T+cIdkC8SKCU3Ozj66XdPYNeB0pOk
	6doPFJKJrLybovwVjiQ3he70N9lWF0Ha0nwBZrqB2+e+t5/4LzR3UAcwy1N8j4GCe32OAKCUE3k2w
	qF4HMZEYf5GjXwIdO37MHJdiBa7NTo8UpxCmwUdq9NK0GQSrlw5Z4TSR0RA92MMK5vHsE9c5/4Yob
	3FZv2wVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJtG-00000004vva-0VYE;
	Thu, 02 Jul 2026 16:03:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJtF-00000004vtc-21Lb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:03:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2904743B59;
	Thu,  2 Jul 2026 16:03:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFB71F00A3A;
	Thu,  2 Jul 2026 16:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008229;
	bh=UtNd6BSHdRaL0Wa1rIKAQuRLmED7YnoMHeDT0+9L1os=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YVjNS9G9IcSAAFNX7IuV/uQMIz74W5Vz5r3Ondup6k/Ze9BrwqgCXPAJE0/Whc5Bd
	 oc0DhkAPFmuwawqja0ZY9D2/nW/3FLynz8BBGDnP3SfzV+OQ61/4POGaYdfxW21aFt
	 ru27hIJ5csE+s2Uv+FvarXZP/yvBYUFED2E/1O0SeK014fZ99f8b7a0rK3FWe7XTTq
	 tbazRlxXn4wCTb9RJA8Dol2r+qpTGNkThydlUkP/9/oejjfh6R2xlFJp8b+cbX58WH
	 1hcDep6PFJgKFiZcBYQHZuMG5JW9GxJgrlncXGfMut0v+uFVgw967kRf0NcSQBUZFA
	 VFEENUyobEmVA==
From: Vinod Koul <vkoul@kernel.org>
To: Frank.Li@kernel.org, michal.simek@amd.com, abin.joseph@amd.com, 
 kees@kernel.org, ptsm@linux.microsoft.com, sakari.ailus@linux.intel.com, 
 radhey.shyam.pandey@amd.com, u.kleine-koenig@pengutronix.de, 
 Golla Nagendra <nagendra.golla@amd.com>
Cc: git@amd.com, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260630064844.705173-1-nagendra.golla@amd.com>
References: <20260630064844.705173-1-nagendra.golla@amd.com>
Subject: Re: [PATCH 0/2] dmaengine: zynqmp_dma: fix race between runtime PM
 and device removal
Message-Id: <178300822534.756665.17882853364669506909.b4-ty@kernel.org>
Date: Thu, 02 Jul 2026 21:33:45 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Tue, 30 Jun 2026 12:18:42 +0530, Golla Nagendra wrote:
> This patch series addresses two issues in the zynqmp_dma_remove() function:
> 
> 1. Fix the race condition between runtime PM and device removal where
>    pm_runtime_disable() was called after the power state check, leaving
>    a window for the runtime PM framework to change state unexpectedly.
> 
> 2. Update the stale kernel doc comment that still references a return
>    value after the function was converted to return void.
> 
> [...]

Applied, thanks!

[1/2] dmaengine: zynqmp_dma: fix race between runtime PM and device removal
      commit: 516ba2d8b7aac4238f9fcbd58579c43c71b9b695
[2/2] dmaengine: zynqmp_dma: fix kernel doc for zynqmp_dma_remove()
      commit: f7e89cba18a1ca6462712ae459a88dd40537b693

Best regards,
-- 
~Vinod



