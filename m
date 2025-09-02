Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64999CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4/XJ9D73TP0STT4CGa6csLzIeRTuDdoTaz4bTOmNE0=; b=hCtkzL9RnyIFgnmHYmeN6TiMEz
	M7uv5bGBF96JhxfkFus2s+vrrwkDfOjCf2TSbQ1RPEnr52b+STSJXJefktTv9fSNQ5WSY9Axw59hl
	6CQocZ7UP0KfDN/xuaTULRgtyrf+bcUhmo+dopr8fQ/C4b8ejHOUb/G+o7vBRXzD35XP1XwauGLJb
	9jUYUYHPLRT49r4vj9flep2raGytOErhZT2qdZcek+a7dEIX7Qy5UQSInKXX/wdJ6GU4eNvNOGHwe
	VJDbMxeH4Tjw9GFHrfRaZDVgbELEOO18y7C0jkjw3EGeAmZ0GPN5/2QbLShuArUB8rfGYlHWUjhH6
	JPnXpERQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ9b-0000000HHjZ-36UM;
	Tue, 02 Sep 2025 12:30:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNe7-0000000GTpo-03Qk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:49:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B7FA543C1F;
	Tue,  2 Sep 2025 09:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9B7C4CEED;
	Tue,  2 Sep 2025 09:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756806586;
	bh=oiC77Gt5Bj8xCAydKBJRED6CaafusXzrJw9yIWxwsDw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tYzAFZ38V5G6Gt3eTwgJvUQUA7ZPqTjMvC3nQOZ/EyjmYUBXTCYCw8DaoGrJdvjYM
	 bZyBoyzCstWCUjYVf3TS4iak2Qr/3IL6VIbDPwQc6LLegOdZp/vFyqCPgYTRDsncr7
	 kI9CawhkuRWGTeyPunYkMRiF7/TgHZ7SuU6BUA0hLpcuE0OGQl8hd2YyA4FowukegJ
	 sZdOHIl4Wpwd1FYlGXuBJyu3v8FtADzdkv8R15Ip+dilBj3RQ8uCz11iTwfdSU8OYV
	 MGEvVnpHDhVcJdgY4LqalvPG/MIpfwXwGQ17c9LtA8QKsb0WFbnl3DGFlrCOBsAT4K
	 C1oOOVJXtQPqA==
From: Vinod Koul <vkoul@kernel.org>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, 
 Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Cc: kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250830132633.1803300-1-chelsyratnawat2001@gmail.com>
References: <20250830132633.1803300-1-chelsyratnawat2001@gmail.com>
Subject: Re: [PATCH] dma: Replace zero-length array with flexible-array
Message-Id: <175680658329.246694.13588903495066267713.b4-ty@kernel.org>
Date: Tue, 02 Sep 2025 15:19:43 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_024947_120496_1DB571AF 
X-CRM114-Status: UNSURE (   6.15  )
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


On Sat, 30 Aug 2025 06:26:33 -0700, Chelsy Ratnawat wrote:
> Documentation/process/deprecated.rst suggests that zero-length
> and one-element arrays are deprecated, flexible-array members
> should be used instead.
> 
> 

Applied, thanks!

[1/1] dma: Replace zero-length array with flexible-array
      commit: 981d4978ff09d13690739663b3cd71ad8bb5ad94

Best regards,
-- 
~Vinod



