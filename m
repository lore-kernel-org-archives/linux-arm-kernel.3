Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AF610706DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 13:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkxY/8TiSWLBM2IDc0KNHMH7mRaqhfJoCvOrhCbIHu0=; b=zNFsB72CLWdgK0U17tuM6tbn1h
	W/pZWbeeTMcRVa2B6Q9WA5ZEbcyIvyFM1vzcREr7/JSMtc8QomY4gAHhurLoM/LeKz/3ruQohmzFY
	2aU54KF4ne5HNzH6XAxYTweK0GEHUNJ6hWcARxN9f24d9q5sMb+GfH3YNtYQTvJ/QgRu9DRbi43lK
	3dSEcefQ6PXAsM5BxrtnxcXzwleds/yiCJYvdByT4UiqLRwuGuGihVDE3gTeHZdg5jdfq1F1qNQy9
	lXE1WmJyORva4yDh9ccq7Hwxcdr5yOjDQ7jaXtu5q1LKh782TFxHwMN+9WQ6bqUuJddE4GAiqgIM9
	BzXyMfFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1OoN-00000001sLR-27qz;
	Sat, 14 Mar 2026 13:13:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1OoL-00000001sL5-2ZzC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 13:13:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B20124099A;
	Sat, 14 Mar 2026 13:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F947C116C6;
	Sat, 14 Mar 2026 13:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773494024;
	bh=6gcZCrWNBMWCJ2rVIp8u8DGpdWLgEe3iegnZ0nHqqPE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=o6eSe+7rRxpimIhRgJz0UD0ujM1PWgKdkdaQDhvJyAVm7CYaFoMzBl91PcrcLVzKv
	 rLswmURYOYRA2p8X/mTAuARSDSOPqtbcLnR4Drl2laA7xUC38nBicD8Ccl18mnzRdw
	 HKPtQsl1vq0EyCgDPtCJ6pPF4J1cFyeCcw0QE7+jGwMLt0JQtitClQ981Y9EAyy7Qv
	 LSW2xnOYX4MdqLYjYkaD2pQ2N+D1HYba5v1HuSCgyN6dU4CFm0/cONKJoxlY6AJig8
	 o4cgmPCMr1Uti3yc9DTYfq+VQEuN6WBp4Y7K67vr4aTOUW8ZW2UR/0EsQn2dxbjAHT
	 sdo79JRByBvzg==
From: Chen-Yu Tsai <wens@kernel.org>
To: mripard@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
 Ethan Tidmore <ethantidmore06@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260226163836.10335-1-ethantidmore06@gmail.com>
References: <20260226163836.10335-1-ethantidmore06@gmail.com>
Subject: Re: [PATCH] drm/sun4i: Fix resource leaks
Message-Id: <177349402208.44870.10275878012349571806.b4-ty@kernel.org>
Date: Sat, 14 Mar 2026 21:13:42 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_061345_697230_F52ADD34 
X-CRM114-Status: UNSURE (   5.51  )
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

On Thu, 26 Feb 2026 10:38:36 -0600, Ethan Tidmore wrote:
> Three clocks are not being released in devm_regmap_init_mmio() error
> path.
> 
> Add proper goto and set ret to the error code.
> 
> 

Applied to drm-misc-next in drm-misc, thanks!

[1/1] drm/sun4i: Fix resource leaks
      commit: 127367ad2e0f4870de60c6d719ae82ecf68d674c

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


