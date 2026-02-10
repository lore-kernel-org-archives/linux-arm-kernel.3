Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC50EA3F28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 09:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBzL+Asuf+CEy1gI6d921wDSH2eQlY0yUa2w9gJZB7o=; b=F/GDphFeCzjkZLVVkd8kmRewdZ
	IuATVQxzlcOQgWD98VC35RwI9pg7n/W/YffWPRspApWZUcozFxNmbiFkpvpDCP0rkVDizJgsYUkfb
	bDr/bnfC2eps9yNkBzF7bztcoqB3ueBGvI5rBR4Buf9qVoEOHi+WNVI0aChcSdkRXB3NgFES1GAV0
	C84UkPzTCmwJBGLhz6QaQjdpyC/im8iY5n/AFSBgvB8j3UBLDWP0cpqoCTRAV46oNV5qtrbmIxgRH
	tzVQ14uw63WkwYNLOVu1mC9XAD/DjiYyLoi2mMuoUI+M7fEqrHkDWZ6H4DKkSK2ZflK8P0Q9u0eRy
	p33S+96A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpk9I-0000000Gkn2-2lBn;
	Tue, 10 Feb 2026 09:35:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpk9I-0000000Gkmt-1Yox
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 09:35:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3515560123;
	Tue, 10 Feb 2026 09:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A4EC116C6;
	Tue, 10 Feb 2026 09:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770716110;
	bh=qLApdMWtpjsrybaOBv+5Y5DwUbzF9WTlqL/fs5gG75M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DYXa70GNq4NkvKJAti6EdUW56bcSPceeAl8O3fCAVLhUKmvtliGp0OYcXcHumAks5
	 mGIbu2hUr9P0ysmJUtJ13Ovx+/uR8RC+7hgTS76JOcvfXbFTj51zZ7Xb0Xh7CoHPRk
	 WridwzHnxyiytBNvJpZR8EGqTJaEI1zTbUiAwbGqQVxRVXlq8/o00lCXmAy2nzjFxA
	 wjmr+HphrD/xi11Knu+N2LvGMwl1d169dal+xG+OAUnh39lgOMfO3kjwUlgtmZu2GU
	 QQoRqqZm2c1pDT/JBEqFYDYnbvlAnZQj4sPeShBLriw+PQcumVK87FOBhLk4qO280h
	 O+GHJ5kluNm4g==
Date: Tue, 10 Feb 2026 15:05:07 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pat Somaru <patso@likewhatevs.io>
Cc: Tejun Heo <tj@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2] dma: apple-admac: Convert from tasklet to BH workqueue
Message-ID: <aYr7y6C3aNIC-Sbc@vaman>
References: <20260206221143.1261191-1-patso@likewhatevs.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206221143.1261191-1-patso@likewhatevs.io>
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

On 06-02-26, 17:11, Pat Somaru wrote:
> The only generic interface to execute asynchronously in the BH context
> is tasklet; however, it's marked deprecated and has some design flaws
> such as the execution code accessing the tasklet item after the
> execution is complete which can lead to subtle use-after-free in certain
> usage scenarios and less-developed flush and cancel mechanisms.
> 
> To replace tasklets, BH workqueue support was recently added. A BH
> workqueue behaves similarly to regular workqueues except that the queued
> work items are executed in the BH context.
> 
> Convert apple-admac.c from tasklet to BH workqueue
> 
> Semantically, this is an equivalent conversion and there shouldn't be
> any user-visible behavior changes. The BH workqueue implementation uses
> the same softirq infrastructure, and performance-critical networking
> conversions have shown no measurable performance impact.

I would prefer this move to dmaengine specific work of Allen. That is
more apt imo
[1]: 20260108080332.2341725-1-allen.lkml@gmail.com

-- 
~Vinod

