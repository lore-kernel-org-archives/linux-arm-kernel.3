Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC49C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 14:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dS38MFXL5sWJafNWq6WBYpwV1s5XsZo3zdcDEvu97LA=; b=PSuu81m2rm0wG6Rv2csE+h5Zdf
	ZmbRSLP7yfWCE+voHOV2wdpfDKyKyMoBsPQ+ePGiJO0eVg1I8VK6QEuye8vuaZaHs/fZLjeRVCg51
	oH8f/ss9IU1Y6TRNuoVzi0t3ff/a+T/8TuF6ubl3XdkoQdhL3VbjAn3ei05vr63xFhgGWLep8/uUQ
	EcJlAX8/VDcp6F53GZZSwDEWnHEjAuXruGJDC45xWedvA+i3T+w2yGG3Rb14Xi8pdtT7fHck/QeGV
	CXjm6lh3bMdO455nj/SDuDhOpra0gr+JpTGpmcJ6p/kAjpQNBaASTzpGbviHCP05x5/IvhEkbQJtp
	2NVMlUGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVKR-0000000G0na-0VGl;
	Thu, 01 May 2025 14:55:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVIX-0000000G0ei-0oYe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 14:54:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EF1D4A3BA;
	Thu,  1 May 2025 14:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B347CC4CEE3;
	Thu,  1 May 2025 14:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746111239;
	bh=xXdZzehmKpZnbsgOKXp7I1LKRUhGMB11Fu7G/0fw8sM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=l6vwC7LJ/nVPMGGyFou6rLrkgDYrlUMFVtJy+41fHkxY+TBVNKs8bP5CzLPcCrofQ
	 aSMfrxinRbO9SBF3NsyEyBWxPEMIp34femxxDtb43yYLSIa1fIK8U+AtdNAV6LXYSu
	 HZlm9FWtOA8nXVd0i/nivLRH9hpDNky2RYh1JBl0gNqtTrYLINk92Z9TFpacI/Ah06
	 5at7Z1ZvxaQbdETxwlK7IR7OIvq1Pvr/mdXrQkZut+Zj1yleBO60VU6p4hL7KY4lru
	 rrqxxJiOmmHkmmkLnqCwmsdot5TWQWxbtD28lRwGGQZSpu15FWkzk01GGwStneRnr/
	 HgaYaQuCvBvAA==
Date: Thu, 1 May 2025 07:53:57 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: <dan.carpenter@linaro.org>, <john.fastabend@gmail.com>,
 <hawk@kernel.org>, <daniel@iogearbox.net>, <ast@kernel.org>,
 <pabeni@redhat.com>, <edumazet@google.com>, <davem@davemloft.net>,
 <andrew+netdev@lunn.ch>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: Re: [PATCH net 2/4] net: ti: icssg-prueth: Report BQL before
 sending XDP packets
Message-ID: <20250501075357.37f2dc4f@kernel.org>
In-Reply-To: <20250428120459.244525-3-m-malladi@ti.com>
References: <20250428120459.244525-1-m-malladi@ti.com>
	<20250428120459.244525-3-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_075401_261844_35E37AA6 
X-CRM114-Status: GOOD (  10.34  )
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

On Mon, 28 Apr 2025 17:34:57 +0530 Meghana Malladi wrote:
> When sending out any kind of traffic, it is essential that the driver
> keeps reporting BQL of the number of bytes that have been sent so that
> BQL can track the amount of data in the queue and prevents it from
> overflowing. If BQL is not reported, the driver may continue sending
> packets even when the queue is full, leading to packet loss, congestion
> and decreased network performance. Currently this is missing in
> emac_xmit_xdp_frame() and this patch fixes it.

The ordering of patches in the series is a bit off.
The order should be something like:

  net: ti: icssg-prueth: Set XDP feature flags for ndev
  net: ti: icssg-prueth: Fix kernel panic during concurrent Tx queue ...
  net: ti: icssg-prueth: Fix race condition for traffic from different ...
  net: ti: icssg-prueth: Report BQL before sending XDP packets

This patch is not correct without the extra locking in place.

