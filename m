Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF47FD8741
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Utz6RbZ0c9ShKE2u2SHORWdmaBSMyRkDm6s8o9XPWhE=; b=d6+t2KTBnRHAlcqkgsine/6CPI
	RTiv/oFIx3MizOfotnejSY/E7pdcNkxpgf0pIcYTj5bmDu4Bq9u6myrwoWLp6A8lwRIbj5e/9sBYR
	YTQd17zb+VXEHi9U06V99grg9ctMo+kaopLJtTAbKn0bafq8PmDjBnmOE5Zx05ylnpVqVfMVlzMg/
	cUItm4awSJZhIGl04JlEyGaJ/vxYmuoF2y1EPGJX6Pqynaqj5ITxyPHaKosKyfzcAWAPi6foaHq5w
	WNO8Qj3tVKe7G1EuQNfai9ySV0MNu3X+fhd8oqghP7O9oztK8Sb6NYAC26zt19EMCF94G05TDJvd5
	tIPe5B0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Sae-000000068DF-1XTO;
	Tue, 17 Mar 2026 11:28:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SaY-000000068C8-3qZ2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 11:27:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D9D4600AD;
	Tue, 17 Mar 2026 11:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82AE2C19425;
	Tue, 17 Mar 2026 11:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773746874;
	bh=hHykJD+9TL8m1Kg8WRvXe8cTceyGxQGB9+Mf9oqzmBc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lqW110UIZjPBkszkgbYhDWH1b/JZ4MAdLYNHiGMbuavTgpclgWbv9hsyPCFaLLu2Q
	 wx9WHo4SRhO90mH5Q0axGI2KgDcbXdY3TgHSIZR9jxqrc+MD7TehSIg21qJmStbluK
	 8cSSeoIUvq/hK+sayuXm3YFHNwZUzBzWGZRuhy78iAuUiQCL6tj02M3z29eNlWiHEG
	 +yXHRPABYgyIgy+Bz4nEunVKsR790eTGW7uuF5yb03ZDwOG/by6lwsLJg5S+WHfDNM
	 1TmVDKEqQlZaBjkctULbFJTgKsQnfci0hThSlebuh1VjmS4lP48jZlTbn6jCYe+2Y+
	 PV9w2A3gteYMQ==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Marek Vasut <marex@nabladev.com>
Cc: Michal Simek <michal.simek@amd.com>, 
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
 Rahul Navale <rahul.navale@ifm.com>, Sasha Levin <sashal@kernel.org>, 
 Suraj Gupta <suraj.gupta2@amd.com>, 
 Thomas Gessler <thomas.gessler@brueckmann-gmbh.de>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260316222530.163815-1-marex@nabladev.com>
References: <20260316222530.163815-1-marex@nabladev.com>
Subject: Re: [PATCH] dmaengine: xilinx: xilinx_dma: Fix unmasked residue
 subtraction
Message-Id: <177374687115.337094.18303476978785991645.b4-ty@kernel.org>
Date: Tue, 17 Mar 2026 16:57:51 +0530
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


On Mon, 16 Mar 2026 23:25:24 +0100, Marek Vasut wrote:
> The segment .control and .status fields both contain top bits which are
> not part of the buffer size, the buffer size is located only in the bottom
> max_buffer_len bits. To avoid interference from those top bits, mask out
> the size using max_buffer_len first, and only then subtract the values.
> 
> 

Applied, thanks!

[1/1] dmaengine: xilinx: xilinx_dma: Fix unmasked residue subtraction
      commit: c7d812e33f3e8ca0fa9eeabf71d1c7bc3acedc09

Best regards,
-- 
~Vinod



