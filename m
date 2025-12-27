Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1700BE8FDBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 00:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqqCbB2mj50TN7avhjwe/+WbGPlCb+AgjTd9tIn8GNQ=; b=NOROW2l1tS7voMoBoVttBXEbQi
	vd5xQgEK/TUO4V2+He65zqxMCq7If/z7t81X2IwcWe12VTmkZvp2CSOD+BfJss0ShVH8R/P2onUF2
	ainYVYEzDnUV9251EgJMAbGYsO82ow0nkAYKA79nsbkML8R2DCTZGCLbTKMElBgvWKKyP2X7beMka
	FIyBekCTnHMHRCKOb7qSJHC4BPWgVZyhTc5zCaUDRC3Toz9dQo0EbAECvJbAhdOLhKhiuo2DXssL/
	plhl8A7D9n+7wGQfb1rrkzWHExVRN8OLtXSrOR8ssKLUjwugrDANNDh2w80T1lKPznst8x8eZTmME
	aK3IJDJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZI0Y-00000001ajH-20sn;
	Sat, 27 Dec 2025 00:18:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZI0W-00000001aiq-14fv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 00:18:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FE4E40657;
	Sat, 27 Dec 2025 00:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F066C4CEF7;
	Sat, 27 Dec 2025 00:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766794686;
	bh=ZqpJU+rrtyriuXVbfa8/1GLYlSPnOy7NbFVtMvqk1so=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tduMpdCm7pTU545ESqbiCA9OZMUAVvB4CzcHOhvSiJfeHqftgQCgmlMdDZwImZ0je
	 g8gEFnw4krUQuccQ0OMgu0Kv3Fz5iPLHuGKiJTV+qsqBtqF0j6ykjSlhaX3N6RsT3O
	 P6qkaOv/wtXzqWrZ//onWroe6YEnQn5jt+HhekOR5TasgETXMgdvyTGjNAGKrhMzsB
	 KE8n+88ZNp6U9Pvu/FYPmsB0cbUiZu6HvKgQgmIsi5kpMngPZrD1k6arRFvELAHWN8
	 AJ/zWgabDLlnKrCqpClwTNBuhtZlm2B4uJFjmeBTj9e4gSvzkm4m3dhI9DZLsCfLK8
	 UYuhDQ1G9YJkg==
Date: Fri, 26 Dec 2025 14:18:05 -1000
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
Subject: Re: [PATCH 18/33] cpuset: Propagate cpuset isolation update to
 workqueue through housekeeping
Message-ID: <aU8lvW7nfTukNKGK@slm.duckdns.org>
References: <20251224134520.33231-1-frederic@kernel.org>
 <20251224134520.33231-19-frederic@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224134520.33231-19-frederic@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_161808_318697_8234AD24 
X-CRM114-Status: GOOD (  10.52  )
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

On Wed, Dec 24, 2025 at 02:45:05PM +0100, Frederic Weisbecker wrote:
> Until now, cpuset would propagate isolated partition changes to
> workqueues so that unbound workers get properly reaffined.
> 
> Since housekeeping now centralizes, synchronize and propagates isolation
> cpumask changes, perform the work from that subsystem for consolidation
> and consistency purposes.
> 
> For simplification purpose, the target function is adapted to take the
> new housekeeping mask instead of the isolated mask.
> 
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun

