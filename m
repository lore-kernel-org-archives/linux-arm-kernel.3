Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AEDFD8741
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDPbBiiKG/tLyGRbLHzyLOlP/tGn21la/powtD7s63I=; b=ioR6oOq3EB+ac6WYuoJNunaNKS
	emPK47MaCu6EU7P+akCs6n700E9SCjJT9EMvp/9a5RH+MKkgSF/sKdJ3YMKmWtQp3kGHb9xPRJYZY
	Bf1uZ955k2hus8/ddyg2K7xypjgeJVA9/lfYNz19shaYqGTRsT+2oKSYwFON3L4qDrOU/ya3w1J+y
	2Q+s2qivuiqFZK+1HL0R3zdwMlez/Yxx94W5KYVAqLCoxX03lBZgekaiY0sJW/RGf5XS7YutGwMyi
	RUkj5w1I0zxuv8E7FgsFQcLxC7N7+CJmcCzgeq/tU8tvQXrcvQwVjRAxIePC86iwq7mxtKDyBS/GJ
	mLIO0KEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SaT-000000068Ac-3ArP;
	Tue, 17 Mar 2026 11:27:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SaS-000000068AV-2rdT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 11:27:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0460760008;
	Tue, 17 Mar 2026 11:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05352C4CEF7;
	Tue, 17 Mar 2026 11:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773746867;
	bh=k60n7rIsHTQCJ1JUsN0o0C8TVxX9c3H5zo5Xx7is9QE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=A/Tk4A6vamLp3o6wEm8v0NoGM6RZcUb6LJuMJ82n6YJx3Onntn+ciBEwiNKI2PfbF
	 jzqNbRTNI9RPYGpm/sAIvFddG6dyL7+L2mOf3GXgut9KqFl/qVHGvVH+kBCApFALwN
	 joFR6J56V9+KMyefcWoYI3Wc+lFMzMXsEVfF5HFBVhrpscTpij6nmGUZfWg1/5fXu1
	 hovLIKzcqls5UqwG6uxsMxwzRDWt47XNhTBENvVoMp16W3YCKezwCza5aqlhUAVlK7
	 Qi/7VdO29sPiOpKdIG/APECfSC/ggkNbapdiS6P5Lf+qhjDIuXza/M6OMVzVHwitzN
	 iXkbqS9Fo133A==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Marek Vasut <marex@nabladev.com>
Cc: Michal Simek <michal.simek@amd.com>, 
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
 Rahul Navale <rahul.navale@ifm.com>, Sasha Levin <sashal@kernel.org>, 
 Suraj Gupta <suraj.gupta2@amd.com>, 
 Thomas Gessler <thomas.gessler@brueckmann-gmbh.de>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260316221728.160139-1-marex@nabladev.com>
References: <20260316221728.160139-1-marex@nabladev.com>
Subject: Re: [PATCH] dmaengine: xilinx: xilinx_dma: Fix dma_device
 directions
Message-Id: <177374686462.337094.8706717983323051098.b4-ty@kernel.org>
Date: Tue, 17 Mar 2026 16:57:44 +0530
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


On Mon, 16 Mar 2026 23:16:54 +0100, Marek Vasut wrote:
> Unlike chan->direction , struct dma_device .directions field is a
> bitfield. Turn chan->direction into a bitfield to make it compatible
> with struct dma_device .directions .
> 
> 

Applied, thanks!

[1/1] dmaengine: xilinx: xilinx_dma: Fix dma_device directions
      commit: e9cc95397bb7da13fe8a5b53a2f23cfaf9018ade

Best regards,
-- 
~Vinod



