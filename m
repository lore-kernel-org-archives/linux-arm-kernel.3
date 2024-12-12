Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437B3E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 12:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVPFWke+32LF+VNqhaT9B9tF2JFyFFczsWV47mMq+3s=; b=sma4QXGWFWicY3JXOyI6xl4Sg1
	Amad+E8iMzyzop4DrPiTGxZLwsdBPSWaUFE/uNn7XEx/3YgtLY0zUWZ7gBxJ0te2OwbKCFM5vw1r7
	k1gG3dKn2PUP+smen45hkOUJOg7np8LXxpg6PvDOar5NH6aGkNRUqV8BKDHKhezF6/SCCh5zBNPB2
	rgBVzEJuMUNmi445ZzgaOsyIGOPniSawqIfPdVxXKbpbmZzP/S1WQn/ZPKkI9/pIop4sLz8T4OWdj
	WYt2bNr+l1AwKulMmpCgMWavb1FpXdyaq0a419pQ8RDTTHZsHG4LItXV4B7qNssNek0bXe5S9XuAi
	263OypAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLi4k-00000000L2U-3L3V;
	Thu, 12 Dec 2024 12:13:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLi3g-00000000KuT-16Da
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 12:12:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D27355C560E;
	Thu, 12 Dec 2024 12:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E268C4CECE;
	Thu, 12 Dec 2024 12:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734005562;
	bh=+XrIez4xocMGbkR6OBBEEUJb2yDAgLlSckB/4e+OAsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tZRDZ6IX+vjLI18v2MB96dEha09ed9JEGGrjLB+JQwNQa16MI3woIcLG9jW5ssmWq
	 HrdSxmo5pR57A6yq8KYBKA2MHGjJe6m6XfiqxvtUYUiUWEf3KGQl+6BdaOXJMCe9ac
	 N0uMU7Mb61frJCgjr7Gd5mweVWTETA6/9e11E5KhWi90UDpPV3cM5ZX/hKkinvuOke
	 CJEjjvg81KK5+i5ymmNxYTIPMIw7nxqZx4cfX498VSjczbU/GMbY4zr+BpGVbxW57d
	 IV4GvvYp36RpSQKbAw1HF2U315GQI86YFcUzPEfKyBirKo6hfd9ZLCngPEd0FYkU/J
	 UPuG4Qn7qP8Ig==
Date: Thu, 12 Dec 2024 13:12:37 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: carlos.song@nxp.com
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, frank.li@nxp.com, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: make controller available until system
 suspend_noirq() and from resume_noirq()
Message-ID: <awvsvzf5ucgcvl6v7giuxeb6dvt3sw5e6kxo7t56n4rk6u3527@2hid4a7acavv>
References: <20241125142108.1613016-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125142108.1613016-1-carlos.song@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_041244_344644_3A3E2E43 
X-CRM114-Status: GOOD (  12.06  )
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

Hi Carlos,

On Mon, Nov 25, 2024 at 10:21:08PM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> Put runtime pm to resume state between suspend() and suspend_noirq(),
> resume_noirq() and resume(), because some I2C devices need controller
> on to do communication during this period.
> 
> The controller can't be wakeup once runtime pm is disabled and in
> runtime autosuspended state.
> 
> The problem can be easily reproduced on the I.MX8MQ platform:
> PMIC needs to be used to enable regular when the system resumes.
> When PMIC uses I2C controller, I2C runtime pm has not been enabled,
> so in i2c xfer(), pm_runtime_resume_and_get() will return error,
> which causes data transfer failed. Therefore, regulars can not
> be enabled and hang system resumes.
> Here is resume error log:
> [   53.888902] galcore 38000000.gpu3d: PM: calling genpd_resume_noirq @ 529, parent: platform
> [   53.897203] i2c_imx_xfer, pm_runtime_resume_and_get is -13
> [   53.902713] imx-pgc imx-pgc-domain.5: failed to enable regulator: -EACCES
> [   53.909518] galcore 38000000.gpu3d: PM: genpd_resume_noirq returned 0 after 12331 usecs
> [   53.917545] mxc_hantro 38300000.vpu: PM: calling genpd_resume_noirq @ 529, parent: soc@0
> [   53.925659] i2c_imx_xfer, pm_runtime_resume_and_get is -13
> [   53.931157] imx-pgc imx-pgc-domain.6: failed to enable regulator: -EACCES
> 
> I.MX8MQ system resume normally after applying the fix. Here is resume log:
> [   71.068807] galcore 38000000.gpu3d: PM: calling genpd_resume_noirq @ 530, parent: platform
> [   71.077103] i2c_imx_xfer, pm_runtime_resume_and_get is 0
> [   71.083578] galcore 38000000.gpu3d: PM: genpd_resume_noirq returned 0 after 6490 usecs
> [   71.091526] mxc_hantro 38300000.vpu: PM: calling genpd_resume_noirq @ 530, parent: soc@0
> [   71.099638] i2c_imx_xfer, pm_runtime_resume_and_get is 0
> [   71.106091] mxc_hantro 38300000.vpu: PM: genpd_resume_noirq returned 0 after 6458 usecs
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

merged to i2c/i2c-host.

Thanks,
Andi

