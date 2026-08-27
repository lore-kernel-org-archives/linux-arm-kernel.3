Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61C5C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 15:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1dskDq3YlfPUTs7ZBROt0XFP+E3XiVYxZsEvgT9oZ8=; b=rTrT5pxYq5jKVc8SD+mzoFIfvh
	9VilJpXHRY7IDP/wF3McniaONflfjsLquXeI+NZspu7hJO4Eyr08itsLqcp6YwBgJjav1xZS7o5Zf
	zNG9vdHpyM/FFeo53ZuP0DhNzZXWIklD5p5cIGPtQovfdi/Kj5QTzNgj8adPWUQHHnZ53oDs6u9Ki
	Wv5BbOECOQW6zxV6fZ5GRNSoQZYd7RuMXXurLwOSReJuppj0vpLBSRDS/+l2hCrMQiDUYzYz1hHyb
	Pkcuj94t1Fr9rK1VS+MiAz/EOg9UfyR9Nr/9TJOov1HmKS1buAR1E+IWM9pDByEcOuAIRMD9cQ6pf
	22rls3Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcSU-00000004HTM-0dkR;
	Thu, 27 Aug 2026 15:56:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcSS-00000004HTE-3gzL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 15:56:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 37B3E437F8;
	Thu, 27 Aug 2026 15:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1C61F000E9;
	Thu, 27 Aug 2026 15:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787846164;
	bh=F1dskDq3YlfPUTs7ZBROt0XFP+E3XiVYxZsEvgT9oZ8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=jOfd3drQ5PBY8tSHtB1/izAzUxw9nBElKnaXqF9PLLsuL7DDFwzYw+BTCLpUX5rys
	 PjFFvpYNgVycjq4YFrqykFgdglsOlOZF4lTnnr5thKqnY0bwQTTuBo99fX29xNz7qh
	 y325KdtceIcibBi8tGrhXj43oD5plYUpdQUmJKk3Ue9X8Q/ioPOX403G/Sm9mz3M9V
	 gOboBSOlCuLxaLE1hhu4562BAdHhQyjLxZqDNbYdLzMJ/1m/OB4uVAyybEfJCrxyg+
	 ye+LlJDnJBrfUQMIrWMPkxPtMdHAAC+k1gJGPmqCVdyhvlZpCsxtaG/wTEPVmTRo04
	 4Xg93L/d+KB8g==
Date: Thu, 27 Aug 2026 08:56:03 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: manushprajwal <manushprajwal555@gmail.com>
Cc: sgoutham@marvell.com, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] net: thunder_bgx: fix fwnode leak in
 bgx_init_of_phy()
Message-ID: <20260827085603.2d37835f@kernel.org>
In-Reply-To: <20260823111231.372-1-manushprajwal555@gmail.com>
References: <20260823111231.372-1-manushprajwal555@gmail.com>
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

On Sun, 23 Aug 2026 16:42:31 +0530 manushprajwal wrote:
> Subject: [PATCH 1/2] net: thunder_bgx: fix fwnode leak in bgx_init_of_phy()

We never saw patch 2/2, you need to repost it as standalone or send
both to netdev.
-- 
pw-bot: cr

