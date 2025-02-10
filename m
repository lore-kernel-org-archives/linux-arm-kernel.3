Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A325C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 14:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djFDshgbyGMU1i7PlwDCn0alUMpGrVv8KNT4gCMhJK8=; b=Ev5jRn6LJLtCp3Hm4lnbtkZ8rS
	zKl3r534rYQI6/YmFx+EOiN8bCIRNs4nxZAUUHjyJr3kE5BNpQULSh1+klvfELVc31wcWG86k0V/j
	Mlf/Fjf43/9mi5coVbWSKYjP1hzB+6RANMkh7bEByYt/mBOQSnL+1DFeysx04Q3GYoSERiAWPXYef
	MCwifDV/8eXD2tqMp3CvFGAZUaC+JkC4wDUi8srtvH+qajq6NYjLVx89TVWmim4R1ifSguqt2Kgff
	cqU8+MWSE7FOgKSBO7lq4ctpxX9uI6241fZyXpKkKN59ksqiE0dmAdBWDkjEql0tQXYQ/w5wqf/T0
	7IlVrvVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thUtp-000000009lb-1QeN;
	Mon, 10 Feb 2025 14:36:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thUsO-0000000099W-2sQp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 14:35:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 007FBA416EE;
	Mon, 10 Feb 2025 14:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4BA3C4CED1;
	Mon, 10 Feb 2025 14:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739198107;
	bh=Co8afiWugpJkabF78b8GJNpLEF4rbBHfjLyesRenPLw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Q2ByZBVI5UElkc96ZQaupz7Ackk97ET2SNOfhgtjjW7KILMyaMP/shtmN7600tLKA
	 mXYiC5YTOStx0adGhRsqeHVouxAql6NZJwLkx+jF03TcQNHiFRIqOgsuAzTxMRXSDy
	 vyaRQ4CzQUoAgQgbJvsWbS+Gq9/UbrtOJHq3tuht3e/pq+H538VDlqFqIleLA/2LqV
	 VklIpdIYYZDV+ETmBOcL7qo5hgYl8y1S0MA0WcoD5q6Ze1SUXw51iaqLe48IerwxV+
	 FjGakSc3xITmst8XsUV6aMp+mfY3FgNzHYmuRG4b19TcPN1TIx0el022T399usnuAO
	 ScNx3ym0OXt7A==
From: Vinod Koul <vkoul@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20241008173351.2246796-1-andriy.shevchenko@linux.intel.com>
References: <20241008173351.2246796-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 0/4] dmaengine: dma_request_chan*() amendments
Message-Id: <173919810428.71959.10040102676409346998.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 20:05:04 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_063508_800331_A21E102B 
X-CRM114-Status: UNSURE (   8.19  )
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


On Tue, 08 Oct 2024 20:27:43 +0300, Andy Shevchenko wrote:
> Reduce the scope of the use of some rarely used DMA request channel APIs
> in order to make the step of their removal or making static in the
> future. No functional changes intended.
> 
> In v2:
> - updated the commit messages (Frank)
> 
> [...]

Applied, thanks!

[1/4] dmaengine: Replace dma_request_slave_channel() by dma_request_chan()
      commit: 31d43141d13aa63587f140884b1f667800ce4e1d
[2/4] dmaengine: Use dma_request_channel() instead of __dma_request_channel()
      commit: 1c83d3dfa0905590408595560629627cba4f9261
[3/4] dmaengine: Add a comment on why it's okay when kasprintf() fails
      commit: 1722fb4a1307748f983c1345c4c24178d8e0be47
[4/4] dmaengine: Unify checks in dma_request_chan()
      commit: 91d8560c15918c7d44e4f665fac829ba8057a2f3

Best regards,
-- 
~Vinod



