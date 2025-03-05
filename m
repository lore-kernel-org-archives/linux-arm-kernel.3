Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669D0C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 00:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HIO8zlI48cSRvLSSy7N+UCIHi4vDket1eonlB3L4YpU=; b=ZrB2XNrd5mBOwlqbNGKWrEUMxN
	oN7ZMC3Yt87ncXQGotZyeFBR/F8zRFYlBdl5W2h2FO7up2PQqvCK8tl/vZimYKuUXrs5zD90OiPYM
	VsKkIJ9YMv+e07+bmGbjfJFauF1epHjtsTuBB5iuOrOL5tBrmPlpPOAFyTvYYOI52avtKEgi/wbL5
	LG6hSVRJV5eUqOPE152498RFlau9sRcN68sudYxFXSpYoqrjuiejWYTcEz7TrxznqNc6UP6eJEXCz
	BVn03mCbj260wORxXu86S/9QYNgWrcYu1VAie4G4+WajB//mHuM04MkFGH+wm3NjsuL1I0Qxkoac6
	bGbIKGnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpcaY-00000006dEQ-3pUg;
	Wed, 05 Mar 2025 00:26:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpcYy-00000006d5R-1kod
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 00:24:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8940A5C5C49;
	Wed,  5 Mar 2025 00:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0B7C4CEE5;
	Wed,  5 Mar 2025 00:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741134279;
	bh=y7MUgOurul1EqCfOPhyeQVHxMvZ/06Rrgth75p612z4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=I24VjWZcx9Ymy+7xo+8CCH9TX+64bhNNNvNx2o7T1lA/eOFylvVerKppIGqIgh1CM
	 xWVQ9cYsdW2TFSWCBd9dkxuTZ80jX01sUZ+gYa72T3x6fGDCCgO/tZghcrhqhzRg9s
	 4FYw0WJOcZGfWFzDOH2I+W+ohZ61bo1X0Zm7t8NUhkg3vopQ3wY6XmnzUSlsGvJnb2
	 IdlKhbZozjSpte/QIdfm5P2wgkS+S0vaVdC4/dcVvcFBjAN6+jwRz6HChWLuViGkji
	 /3e8whUPFok+qqAFmLYldOD5MWFMM9BKujS+QRTGfx+3RcDM/3TfHYC82SYyWTu2GI
	 i6ryNq/MPaOjA==
Date: Tue, 4 Mar 2025 16:24:37 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: Meghana Malladi <m-malladi@ti.com>, Diogo Ivo <diogo.ivo@siemens.com>,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, "David
 S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>
Subject: Re: [PATCH net-next] net: ti: icssg-prueth: Add ICSSG FW Stats
Message-ID: <20250304162437.0160f687@kernel.org>
In-Reply-To: <33c38844-4fbe-469c-bb5f-06bdb7721114@ti.com>
References: <20250227093712.2130561-1-danishanwar@ti.com>
	<20250303172543.249a4fc2@kernel.org>
	<33c38844-4fbe-469c-bb5f-06bdb7721114@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_162440_555139_91A1D743 
X-CRM114-Status: GOOD (  23.33  )
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

On Tue, 4 Mar 2025 13:46:39 +0530 MD Danish Anwar wrote:
> On 04/03/25 6:55 am, Jakub Kicinski wrote:
> > On Thu, 27 Feb 2025 15:07:12 +0530 MD Danish Anwar wrote:  
> >> +	ICSSG_PA_STATS(FW_PREEMPT_BAD_FRAG),
> >> +	ICSSG_PA_STATS(FW_PREEMPT_ASSEMBLY_ERR),
> >> +	ICSSG_PA_STATS(FW_PREEMPT_FRAG_CNT_TX),
> >> +	ICSSG_PA_STATS(FW_PREEMPT_ASSEMBLY_OK),
> >> +	ICSSG_PA_STATS(FW_PREEMPT_FRAG_CNT_RX),  
> > 
> > I presume frame preemption is implemented in silicon? If yes -
> > what makes these "FW statistics"? Does the FW collect them from   
> 
> The statistics are maintained / updated by firmware and thus the name.
> 
> Preemption is implemented partially in both the hardware and firmware.
> The STATE MACHINE for preemption is in the firmware. The decision to
> when to PREEMEPT / ASSEMBLE a packet is made in firmware.
> 
> These preemption statistics are updated by the firmware based on the
> action performed by the firmware. Driver can read these to know the
> statistics of preemption. These stats will be able used by
> ethtool_mm_stats once the support for Preemption is added in the driver.

That was going to be my next question. If the statistic is suitable 
for a standard interface it should not be reported via ethtool -S.

Please leave the stats for unimplemented features out.

> >> +/* Incremented if a packet is dropped at PRU because of a rule violation */
> >> +#define FW_DROPPED_PKT		0x00F8  
> > 
> > Instead of adding comments here please add a file under
> > Documentation/networking/device_drivers/ with the explanations.
> > That's far more likely to be discovered by users, no?  
> 
> Sure I will drop these MACRO comments and create a .rst file in
> Documentation/networking/device_drivers/
> 
> One question though, should I create a table for the stats and it's
> description or should I create a section for each stats?
> 
> Something like this,
> 
> FW_RTU_PKT_DROP
> ---------------

Let's document the user-visible names! The strings from ethtool -S

> Diagnostic error counter which increments when RTU drops a locally
> injected packet due to port being disabled or rule violation.
> 
> Please let me know what do you think.

Taking inspiration from:
  Documentation/networking/device_drivers/ethernet/meta/fbnic.rst
should be a safe choice, I hope.

