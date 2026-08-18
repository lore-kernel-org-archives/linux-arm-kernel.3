Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36F8C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 15:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fu2n3BnOxXot3kZ7+JaRDlx1+WuO9eZ8yLgzOEaQxiY=; b=QOZg02Kz+XiONXdOlzi0WKPEKd
	Y+M1U3FGuWU6pQaREFvOmY/oVIZEZtpck8FzOWm9Bb+jYPNOG60b5IqQ3oECK0wzNQP+dJTkg0RNO
	l770iEN956UFkPnyTukQaSs7u1zkLwdc/Yt8KQkXcpN6UYBsgF0iOjkg6SVum3xObU3sn/WNJvASo
	yu40Ajw5u+xSFJW0C4TTTWmLLk5OtvIat4YFnL7GHkhwxzlj45ENOIs/QvqgkxjZ42txetkknysUA
	BMjx7Fc+FAty6ZE5hqC/Fo46rPmdJePJZ1tTR+yKvSLGdvgj0A+gmDXvYgKmCI0ZkMo5gVZ4YPjK8
	H4cT7JpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLkv-00000008GZM-2aFo;
	Tue, 18 Aug 2026 15:29:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLkt-00000008GYj-3101;
	Tue, 18 Aug 2026 15:29:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0BD274077F;
	Tue, 18 Aug 2026 15:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A09141F000E9;
	Tue, 18 Aug 2026 15:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787066974;
	bh=Fu2n3BnOxXot3kZ7+JaRDlx1+WuO9eZ8yLgzOEaQxiY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=M7fhLpkcm85yYr+S4YvfDk1ZyJ0JikJVkvVqSs5a7i77lp3GCICaHjW1TJIyAQ5ky
	 8w+v+8WEzKxNtwatOg9DdmOrIElZNO5Zlbmizi2D4OORnK5fg10I2vHWkke1+VMzPq
	 QJ9C7QAWGWu/U8WRFC4tyy/fxWoObOX0U/pgGPqesbVP9dGPbY3EPK8KB5ZR2jRrs6
	 wGWdlUDa/krBtcqSBTt2kj61cXxJavNI359zUk4zs+zLYlY3kIUvU46z4IgoksZokc
	 PKcrVKXMIf4bULIjHuEVp4wam/bI0Mprh7JoMf3qzXAFUNJaqEoPypnX6ZpBHxNhEy
	 qhZYgee67Esuw==
Date: Tue, 18 Aug 2026 08:29:33 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Pawlik <pawlik.dan@gmail.com>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, win847@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v8] net: airoha: npu: use cacheline-sized buffers for
 mailbox DMA
Message-ID: <20260818082933.28b5c9d1@kernel.org>
In-Reply-To: <CALC2Apj7rQv=6uUqaqBjfJ9yO+VCddQqHB=yDhXH7+QUCh2JyA@mail.gmail.com>
References: <20260817090601.1256389-1-pawlik.dan@gmail.com>
	<20260817161756.5fd2185a@kernel.org>
	<CALC2Apj7rQv=6uUqaqBjfJ9yO+VCddQqHB=yDhXH7+QUCh2JyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 18 Aug 2026 08:23:33 +0200 Daniel Pawlik wrote:
> v8 does not switch to coherent DMA; it only rounds up mailbox payload
> allocations (dma_get_cache_alignment() in v9) and maps the same rounded
> length with DMA_BIDIRECTIONAL, while the mailbox length register still
> uses the original payload size. On this board, mapping only the payload
> size regresses probe back to 0.0 even with the larger allocation, so the
> rounded map length seems required here.

Please trace into the dma API implementation on this platform where the
alignment makes a difference. The "unaligned length" path must be buggy.
We should fix it there, not in all the drivers (my concern being that
this is not the only driver that hits the issue).

