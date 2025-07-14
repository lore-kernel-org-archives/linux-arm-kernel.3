Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FD9C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 11:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTO5H+w/R3e93jAhSa1imoJazJbPu8w+LumDkqLqHyU=; b=b0qZE/OWe4gKdSoapROxhS47/o
	zBpqdeTqT+oqqnDd6f94bB2XxVJkM70Ei9CO5QhbSpYXw8WRd4zyhKhc5mVCjxpxacqXhmHWjzpIO
	r/C5o5T3yTIHyBiPVLXCUmAZv210z0Qj8v646MCIPrYazMUQccuwtYVdTno3l5H4YrhWLP8fOD/ic
	7FgJQIl9Pw78+QRv5K3RLoSR35whPd+I7BpViIT3bTCtto1ijwUGaXEZQuLZXW9Hrg9nxcpezGRko
	d0j1uFpUYkGgwk/F7QabuL/bKmHtis+9wPdLED009pi/6/FeRQQ8EtT2BSkosUuL/bGGbIH0zQiU8
	0uDNW14w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubGzF-00000001zWG-1Xp0;
	Mon, 14 Jul 2025 11:04:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubGwo-00000001z87-0Pj5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 11:02:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D0819A56FC7;
	Mon, 14 Jul 2025 11:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691D4C4CEED;
	Mon, 14 Jul 2025 11:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752490932;
	bh=nPxink05T5UZYe3FMijXbIpttjgyGk6c2hQX0HSdz2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f3R5uK4sIyPd3KoHIFWgzDtMaGRUupHCjSrUaE74omqUFb3docOSmYQBSycv8G5EG
	 fKSE7Bq8rm/1fLWNp1oHKc4+eSyHVm6TsrwZ4LSxPNtLcjtl3FaCu6PzAF5mwEfVcm
	 21GzmF4/pm5Rx72n4eUJZ1Y4Z3d7T8s1CI1jHMyP5juQhYGxmDDmyoMNi9FmlzKJK2
	 pdL0MBQqfNmMCd1n5t6+LwrQgN75JzTWdbrP00m1LZZK7Hu77j4vwpuPnTR5cX3OOc
	 lpHgQN9i1tUVWQHSLYKoq9gApIrF/jU+IawGxwc59hNUI/rwChj+kH1X8feDAtQv1z
	 aviBLuPeo76mg==
Date: Mon, 14 Jul 2025 12:02:06 +0100
From: Simon Horman <horms@kernel.org>
To: Markus =?utf-8?Q?Bl=C3=B6chl?= <markus@blochl.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Richard Cochran <richardcochran@gmail.com>,
	John Stultz <jstultz@google.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	markus.bloechl@ipetronik.com
Subject: Re: [PATCH net] net: stmmac: intel: populate entire
 system_counterval_t in get_time_fn() callback
Message-ID: <20250714110206.GI721198@horms.kernel.org>
References: <20250713-stmmac_crossts-v1-1-31bfe051b5cb@blochl.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250713-stmmac_crossts-v1-1-31bfe051b5cb@blochl.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_040214_200063_859410CE 
X-CRM114-Status: UNSURE (   9.27  )
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

On Sun, Jul 13, 2025 at 10:21:41PM +0200, Markus Blöchl wrote:
> get_time_fn() callback implementations are expected to fill out the
> entire system_counterval_t struct as it may be initially uninitialized.
> 
> This broke with the removal of convert_art_to_tsc() helper functions
> which left use_nsecs uninitialized.
> 
> Initially assign the entire struct with default values.
> 
> Fixes: f5e1d0db3f02 ("stmmac: intel: Remove convert_art_to_tsc()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Markus Blöchl <markus@blochl.de>

Reviewed-by: Simon Horman <horms@kernel.org>


