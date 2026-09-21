Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04426C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIi2nadaz9v+40zq6lBkL1D9SKdfdSIeq13JuEYLWgM=; b=RizvHmRzL5z50fZlDv3DwYicWH
	baHhIe17H8HaLxi+c4yRaogPlqRcO/s5NJyIHzL06iic8cGGu/EX5RnAj5W2v6KaLNGWobVZAokwf
	MQnxR41BC7JY/VdAlflb8I1CZVWup1Q7LTZjryWhHLd3ZxmOOyX+C4g7MewV14+AnB8jXzsBJCGsi
	gJ7vLpkNN5qpKn68YUq27QwgFyuwgmBhEYtI7fo0v38VI3GWfDYSqr+uv6bzxr3Q14snD2fO+CZxm
	VHdXWR137YCVAHognIoGvHlLL6omBTF+J9/KlAeQPuFBMXINorJYUOeu+4cSSV/4pxjYNDZ/uw0s5
	fr+FqRhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gKJ-00000002hFN-3RPH;
	Mon, 21 Sep 2026 15:53:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gKC-00000002h9p-0tkk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 15:53:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A6A2E43ECC;
	Mon, 21 Sep 2026 15:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8EB61F00898;
	Mon, 21 Sep 2026 15:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790005979;
	bh=hIi2nadaz9v+40zq6lBkL1D9SKdfdSIeq13JuEYLWgM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cNfQol+0/dbhPr7tGbQyWQFtuRS1ayA/d4OnAEZ7bAMZDyVMydSz918Ly76J9LDt0
	 k3lVzbO8m3ix+LIpOhR1XQdq4vcFcTD73OgtHIcxZYwqs8Fxydtwc7XmlKe6XONnlA
	 ChkIZBix+f69C1AJDB35bAudUESRo+LIJG7D3B38iDBlVPjh11s/Wou78uB4tudJCR
	 LafwSwciHWxN1rIWH1GOeIMfM2Z+AaqOdwMH+BlFUvcgeDXTkWbBQPw8PkbgbDjr+S
	 ulNE4iE81x5iKrUgAHcXfRWzc0hZ7EdIh3UEevcXHdEE4qXBCIUoTimj4Mx036LfF9
	 VX3W+RZRmnWCg==
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Stephen Boyd <sboyd@kernel.org>, Alastair D'Silva <alastair@d-silva.org>
Cc: linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Samuel Holland <samuel@sholland.org>
In-Reply-To: <20260916042910.382744-1-alastair@d-silva.org>
References: <20260916041104.239999-1-alastair@d-silva.org>
 <20260916042910.382744-1-alastair@d-silva.org>
Subject: Re: [PATCH v2] clk: sunxi-ng: ccu_common: Use
 readl_relaxed_poll_timeout_atomic for PLL lock
Message-Id: <179000597757.4029583.5932313029750743285.b4-ty@kernel.org>
Date: Mon, 21 Sep 2026 23:52:57 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Wed, 16 Sep 2026 14:29:10 +1000, Alastair D'Silva wrote:
> The Allwinner sunxi-ng CCU driver currently uses
> readl_relaxed_poll_timeout() in ccu_helper_wait_for_lock() to wait for
> PLLs to lock.
> 
> This non-atomic poll macro relies on ktime_get() and the kernel
> timekeeping infrastructure. During early boot or sensitive clock
> transitions (such as CPUfreq DVFS scaling) where timer interrupts or
> timekeeping may be suspended or unstable, ktime_get() fails to advance.
> This turns the timeout calculation into an infinite busy-wait loop,
> causing RCU stalls and system freezes if the PLL lock bit does not
> assert immediately.
> 
> [...]

Applied to sunxi/clk-for-7.4 in sunxi, thanks!

[1/1] clk: sunxi-ng: ccu_common: Use readl_relaxed_poll_timeout_atomic for PLL lock
      https://git.kernel.org/sunxi/linux/c/9ef62592b80c

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


