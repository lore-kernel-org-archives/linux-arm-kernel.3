Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC31CE8FDBE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 23:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98AezxJ3jW3ULUSY6zvEN0A6ECnUczrNnBoMc5BW2t8=; b=kLq1Rcv6jR5XGv1YMShyBixT01
	f+inTb60Juekg84tPz0/ic8T/Hs+603RmIaRSpsUjuemgmcm9Xri1qutawfdj7TsRq//Gq1cjcayW
	XPi9GeoU9Ym9eYcYKyvEz57QUx+Xkc5S6jPi9LnF9/aeAcj6DsIhLmzlbDRJnXbvLVYQgqiiHcykQ
	IvvUeSLMyfOG2NQjMfZhNcAlNJ4ouaKuT4vKbsJV7z41/sPuR+sS6VIuZ+5R85U35p8VVol+RrbAx
	IkoLoOOUAhmQ+aKQM+bvfYC4SoU0RtEHAKxLhMgUSFO3lkFDgBwnvw1Z6/zQtks1fKG7sSQJyMF7t
	R4gJqZKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZHfy-00000001ZRV-2APT;
	Fri, 26 Dec 2025 23:56:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZHfx-00000001ZRP-0vZg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 23:56:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E1F2160007;
	Fri, 26 Dec 2025 23:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053BEC4CEF7;
	Fri, 26 Dec 2025 23:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766793411;
	bh=TmkQ20OZkTQkt5CoWiGqlvcZyzl19wgFNsEBjFcJyxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ESTPbVJJEMD9u9uHankO1Rd8hjsHnae8LYU/sqHgEPolKKBWTxvNiLpqtXw/Afw7I
	 kRI+cWQthmnS7MU0oGsE0IHLNMkKsI/EoJ1Ln4bL0WmRvXJQAjMpS6Hm+aFs0XWtNk
	 kouoAQmT585nRVEqyOuSzCqiEASOJPYciCVqlpyTUVW0BZuTZw7B66wIPPcN83E2QN
	 9+5R/Nfv7VVEeSGyicAkaNhQXEc07s2XAd0ApwBhwayDKn7ZvxLcpUabe/caIjhlFz
	 L8GjFTl8a8wrHjo5nhcXTSIWvhmVGzMxb70RcdWJGqcetaCEi73LRF9AFuGejws8Zf
	 flFJuqv38l56g==
Date: Fri, 26 Dec 2025 13:56:50 -1000
From: Tejun Heo <tj@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chen Ridong <chenridong@huawei.com>,
	Danilo Krummrich <dakr@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	Paolo Abeni <pabeni@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Simon Horman <horms@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>, cgroups@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 03/33] memcg: Prepare to protect against concurrent
 isolated cpuset change
Message-ID: <aU8gwjlVmRkMtPZT@slm.duckdns.org>
References: <20251224134520.33231-1-frederic@kernel.org>
 <20251224134520.33231-4-frederic@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224134520.33231-4-frederic@kernel.org>
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

On Wed, Dec 24, 2025 at 02:44:50PM +0100, Frederic Weisbecker wrote:
> +static void schedule_drain_work(int cpu, struct work_struct *work)
> +{
> +	guard(rcu)();
> +	if (!cpu_is_isolated(cpu))
> +		schedule_work_on(cpu, work);
> +}

As the sync rules aren't trivial, it'd be nice to have some comment
explaining what's going on.

Thanks.

-- 
tejun

