Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7116CCA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 19:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MaHEgRvIPjOiIVohU0OwLCN6dcXrjGmPWiU3FEOK/ts=; b=dWCDoIA2CjPOZvrG9Ue42iHZCO
	oDixGImdF/mF13PSfKVoJX6PSNrX4TDEU0hymxnzMXMmJoMgvb0LddxOTjTVtgYjo2vFI0gtjAq87
	jalNm0dUIH4yyWj01DIKbX1Y5qv0pR7Edh9ygzHVpIvBqfyL5z9HizKdIBszZGshMEgHFYftw+JCe
	wDQuNJqJWPzNGO/oh+FQ9wo469IfLRbr6a0FDweaLd0Ck0syjPQ1WlCPS6vmEObDfbLnWRaAz0/a2
	3fGmL0ADCqUXifR6aFdP7OQE+XIEoxF3jsxWO7AT9nIgEkZIrHo15datwE7wQslS/xBL+JJriRX2n
	GyOqPBzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFqJ-000000073eK-3xpm;
	Fri, 09 Oct 2026 19:01:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFqI-000000073e4-3bCF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 19:01:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B0D9405A3;
	Fri,  9 Oct 2026 19:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD781F000FF;
	Fri,  9 Oct 2026 19:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791572478;
	bh=MaHEgRvIPjOiIVohU0OwLCN6dcXrjGmPWiU3FEOK/ts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZsvA7aPyJ65aeRJG+bKMCCH5lX9mZs+u0YlpARqjyqMm6lLHVVVERfrYXtdTdeK+w
	 lPh6T94R3K7KhA5z0T9BW7q7yolQPM/0M/0MkugVhmx/klGsi83WSR/IOWLhpoMmAu
	 gUC6sM82H6JeWjE6ZlQeN7p3UIEupTQBRiOp4HtiAV44Rdo3mTLbXVCWmoLoEJCG4H
	 SBV02jp47cgyffsB3GvqInGFbsQJqEJZKpihxhxxBetnD1hBmzEefk2W+nLEDdfqBi
	 r4yvYAoo6PY835AGbLaG0+BlGsvDqfQKAyzrIeotvfYFruxRLOKmYoh0qU6nCZqGiF
	 DAjzknsCAg5pA==
From: Sasha Levin <sashal@kernel.org>
To: Michal Simek <michal.simek@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddarth Chilukuri <siddarth@nexthop.ai>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] Revert "i2c: xiic: defer RX_FULL until all trailing bytes are in FIFO"
Date: Fri,  9 Oct 2026 15:01:11 -0400
Message-ID: <20261009145800.rc-reply-0001@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008-i2c-xiic-block-read-nack-v2-1-76735ed0b0bf@nexthop.ai>
References: <20261008-i2c-xiic-block-read-nack-v2-1-76735ed0b0bf@nexthop.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

> This reverts commit e6fe3ea04f0113fe4d47c03d76e03805a4768ca7.

Thanks for the report. I've dropped e6fe3ea04f01 from the 7.2, 6.18, 6.12
and 6.6 stable queues.

-- 
Thanks,
Sasha

