Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F30AC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 12:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPKNmYldc3JhqcyaMoIHVg3Ft1IcDhtSwZWN6Bpzulc=; b=iC+IMZWYdrQA/XY5PoJkgCLGfr
	3V3nLJa6cz3pbSPHkBuTL3sW6L2iUc6qDf5ypsURsgs4IqSxV9tWgbgieJQF5sWe3MceAmZ4FPFVO
	caqXxf9+dgt+G3F+iEnLlLiOIie9IDJwKaI5MxAtsMIhUS9szB+bbOBeXo1w+0EfRg3K9XSWi5dmB
	piELfiU1Ga1Pa/eelyZ/L01yddGIvFkB1//1ek7qMnScJl1zsr3yzSNjbBVW5fHeho9ArOOc0lRUu
	4R4mH0liI9PvW/VrjrajbksVzedoyMf/hA7T/2MmlAQP1U8dAQMRze0h8eO4g4+2qLHNAd8UdNkU/
	vw2U82Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndBU-00000007OjX-2n1G;
	Thu, 27 Feb 2025 12:40:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tncg1-00000007IK5-1Vko
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 12:07:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E44225C1109;
	Thu, 27 Feb 2025 12:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1DBC4CEE5;
	Thu, 27 Feb 2025 12:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740658060;
	bh=DcilghX7Y+HrGgkzTIAtQ0rCbPT5/YV6C7nx30r4kWE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cyGHEUPdrJyucAzTTofIphquHOn5vM1cWItJInsXPK4OzvAKSmxBQll+oo/Ggj7+u
	 Da8xYWJqOSCdNrs14p+KY9ZOspizpfipXgTfMsfDOAiobPMVmWDRaDgPEzLga/XhzT
	 DOXwDyOCQekFFRVDMw+mpzz0bpkvZlJ2WqqaFwUSi+4+jSxtrl155RC4KlxVsl054W
	 EES+QI0zh5VwRA/5VFUTWHe5ltl+9RCGewCEIAxvAmRNNBj2gZkjB+kcS0RTVVdoEX
	 22ahhwKZuHpVG5+Ib4Laa0UDAuyyaESgTpJTUHm41Ug4YtjhWzj7E1/LHSUxZ+iGFh
	 xz3dMxauzX0eA==
From: Vinod Koul <vkoul@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: Lukas Wunner <lukas@wunner.de>, Peter Robinson <pbrobinson@gmail.com>, 
 "Ivan T . Ivanov" <iivanov@suse.de>, linux-arm-kernel@lists.infradead.org, 
 bcm-kernel-feedback-list@broadcom.com, dmaengine@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20250107144251.101912-1-wahrenst@gmx.net>
References: <20250107144251.101912-1-wahrenst@gmx.net>
Subject: Re: [PATCH] dmaengine: bcm2835-dma: fix warning when CONFIG_PM=n
Message-Id: <174065805671.367410.2787054913133738713.b4-ty@kernel.org>
Date: Thu, 27 Feb 2025 17:37:36 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_040741_437930_810144A2 
X-CRM114-Status: UNSURE (   6.46  )
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


On Tue, 07 Jan 2025 15:42:51 +0100, Stefan Wahren wrote:
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



