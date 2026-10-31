Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49116606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 13:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a9qNZh1a;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wm3wvK8u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9XWbC7ZxLw6jVxWLU+pCBYSR3Sh1yV++LUbjveX1pN4=; b=a9qNZh1ak2vi9klEuD82KhnyH1
	dsRSId7afmDGEyzzJeg4VTI89IJxD5/brKeEo/FP53UJK37zYy8jOYrq/wGBp19MLPxm4bkhHbK/b
	gALc2rr+qEAPekZvKiLpHGUDSOCh1Vji5txeyeN2HhCbWRrUIH5S1iT4BfEN5xm+jeoDcz6O2Kb1R
	WfTOjVWbFNycyjgOD3UvSZm7RaIhUF+mwkW6AQZ3R+m2XH40ORq75UX5euamQ2VorRWCFEQ549LGK
	c16a87Gn8spqlcxJaVzLNvkQmjkVAR9bNAG/qjqQxql47Vq+XWqq68oP8g4BS+qs6PDyM46nNohlG
	KeEPvkHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8hI-0000000DLpg-3wLI;
	Sat, 31 Oct 2026 13:00:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8hH-0000000DLpP-3FwG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 13:00:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D1C1F42A64;
	Sat, 31 Oct 2026 13:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCEEF1F000C1;
	Sat, 31 Oct 2026 13:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793451634;
	bh=9XWbC7ZxLw6jVxWLU+pCBYSR3Sh1yV++LUbjveX1pN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=wm3wvK8uyJ8DoBrMikTSHt7SewcgaKQ7yEW222ntOY5QgqL1xozXEOOc2MXGlE4vJ
	 Whf8wdwybWPlwjpawl9ABbMs7PlZG+vZT4NydVg7WwbJF6vTZ78eFQ3At1Gibukz9c
	 tzsg5h/E7k5JNiOjb29yd0m2fyfksLbJEB6DXupo=
Date: Sat, 31 Oct 2026 13:59:20 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Samarth Narang <samarth.colleges@gmail.com>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, linux-serial@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] serial: fix TX kfifo underflow on flush in five
 drivers
Message-ID: <2026103146-dance-hull-0a9e@gregkh>
References: <20261031004733.3345841-1-samarth.colleges@gmail.com>
 <20261031123911.3784690-1-samarth.colleges@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031123911.3784690-1-samarth.colleges@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 31, 2026 at 12:39:06PM +0000, Samarth Narang wrote:
> This series addresses the TX kfifo underflow reported in the parent
> thread, where uart_flush_buffer() resets the transmit kfifo but a
> completion callback from an earlier DMA transfer may still call
> uart_xmit_advance() using the byte count from before the flush.
> 
> The fixes take two approaches depending on how each driver manages its
> TX DMA mappings. In samsung and tegra, which map the TX buffer once,
> samsung's new flush_buffer() terminates the outstanding transfer, as
> tegra's already does, following the approach introduced in 8250 by
> 9e512eaaf8f4. A completion already in progress skips the kfifo update if
> the transfer has since been retired by flush_buffer() or stop_tx().
> 
> In sprd, msm, and pch_uart, which map each transfer separately,
> terminating DMA there would leave the flush hook to unmap a buffer the
> controller may still be reading. These drivers therefore leave the
> transfer running and mark it as flushed, allowing the completion
> callback to unmap the buffer without advancing the kfifo. This means
> that the data already queued for DMA before the flush may still be
> transmitted.
> 
> All five patches have only been compile-tested with arm64 defconfig and
> the relevant drivers enabled, including pch_uart through COMPILE_TEST,
> using W=1 with no new warnings. I do not have access to the affected
> hardware, so testing by someone with suitable devices would be
> appreciated.

If you don't have the hardware, and can't test that the race is even
there, are you sure this is needed?  :)

What about using qemu?

thanks,

greg k-h

