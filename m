Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8775AC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 07:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrzZ2cF1Io1dR7rxLZTZ2RNlPL2+psWqsHHUghsEwxE=; b=4Ce7bZxn2HFfy6dcZGXuVy1qBG
	apyYGnNV623ADHZvyatVQ7JY087dyYMsObYUZ+zOjHzfvJCfLXUijXGFSbZvGMqjp5hJQvlU7oI9x
	zpE1q9wN87ysYASJKBtMSfEIwjEx80EvfOYfP2uDQK0W7HKfiB5dqx0B7PBM9BmNOHh3Uj1TKcRON
	SpcWR9WyzXHLTulb/NYdFgxWqhV4a86hXCxE6hBwVzoWcK3d5qyKMW64eL1gQ3R8Egr5VGAB8GYSv
	Mpw1Vc03gdXWsjyCan4IHmF15+hX9bkHrtpKV72A+BEl+skhGESlCozPpwcWrPTpjzDyAf+lfJplB
	cjLHedEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV38u-0000000DmJo-1E0x;
	Fri, 27 Jun 2025 07:05:00 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV34D-0000000DlKq-1KKC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 07:00:10 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 382824EF92;
	Fri, 27 Jun 2025 09:00:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1751007608;
	bh=bDYAcTGKsVDb6IWccLRj1xVKwNT7RPiW70T7zFFjHYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Stm5HhYkUu3h6SLUQiusZ3SjfNQAz1CfbfJUUJZ2Oj0lu3dfUOi42iU3ElQW57su2
	 SQnGE9nJsxg4OuuM0Tj1trCZ7J23KRbeipebbfLsdGQcHeV00lmUvs1eOuDCz0ff5X
	 yKXJZkDuxx7+I9hJOBlDlaKVR6EH5WAAch7bvuTLJIcWWICusFh48YSqOFLgjtqy0k
	 tmPO3UDurTb0UUOpN+m7w1TfNJvAA1zT4y9A8qeICYGzybB9nlSGMsnZ3W6xMWljwf
	 dfyt3ELUTaiTvKOH1p8OzjzVvV2FLT3pnKhhgYmcEWBE4JczYMRuX/7GETCdX+PZ7E
	 0vW4syJXZl9yg==
Date: Fri, 27 Jun 2025 09:00:07 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	iommu@lists.linux.dev, linux-input@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 07/11] iommu/apple-dart: Drop default ARCH_APPLE in
 Kconfig
Message-ID: <aF5Bdx-vmQeufdpk@8bytes.org>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
 <20250612-apple-kconfig-defconfig-v1-7-0e6f9cb512c1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-7-0e6f9cb512c1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_000009_497238_8360FD70 
X-CRM114-Status: UNSURE (   8.64  )
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

On Thu, Jun 12, 2025 at 09:11:31PM +0000, Sven Peter wrote:
>  drivers/iommu/Kconfig | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks Sven.

