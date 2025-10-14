Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6FDCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 20:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=1mt7hrsHnt06SvjuPDDWU079eVk0nFE4tzseKt8Vbpk=; b=urncyu7Qh6vh1x
	n81qTUGQrF9A2y81wn9kbzrapOqhC21oQEI9GvV2f6BplkqekxAtQ5KIIznIKmQky9en4lANKrc4H
	XGAPflh2ulapsxjg/G/ENx1Wda/o5zmIr87fRZGI0Mp/ncyjPwNofBYEKdSpleEciTlUya5E8Fgxh
	LXNCzUBijpSx2Hsi4X9IZvrdv6QRkxPgpqujBXyk8DjrGT3nQlu8CiX06xl6OExRfG5W7Jiy1gxA3
	DorPADF0Ng0lWDUfc1/1EPtd39j5OoxX7pUPKP4w0Ij6G2W+A+W+Tt+Nlc4W+y5vm15YWvsEMZp+k
	RP0ePLG+sxd2g+C3HVEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8lyi-0000000HODm-0bh5;
	Tue, 14 Oct 2025 20:50:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8lye-0000000HOBR-3T8i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 20:50:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 95BB940A85;
	Tue, 14 Oct 2025 20:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45767C4CEE7;
	Tue, 14 Oct 2025 20:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760475035;
	bh=5rxoTWolHOm4oraQzi00YA/zUXuac4iY3HiED5t3UAw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=axsarSWx827Fh8I2C7WoflR8ZEe8mbgEs9R6CNEb6ECRF5VzvbWJ7lxhJgY29BVla
	 00hCz190I4TJB55vPEw8SOgjqeKIwZNiDizKvjrSRahk1tH4/0AZQwjEGe6AFvBQW7
	 KMeLDw8WmfkNZa/bigvyqkE8GtU9qkyFABpYhCWiuxdm4ZxzvEPywsTf5N66DmsQpT
	 OK747OQH2ZOYXfuDc5kNybLckElodrxrtoImcUoDyIeBQJ3xD4cAtL9fAycICL2Oeo
	 VVEnQeIDZi1UX4ffYitoGKZ/qhA4CW0Ud24/ggKohRDgxpn3zp1xwRgHW83PZ6s3pf
	 Cz5dN01+ANVYw==
Date: Tue, 14 Oct 2025 15:50:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
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
	Simon Horman <horms@kernel.org>, Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>, cgroups@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 16/33] PCI: Flush PCI probe workqueue on cpuset isolated
 partition change
Message-ID: <20251014205034.GA906667@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013203146.10162-17-frederic@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_135036_888580_820383FE 
X-CRM114-Status: GOOD (  11.02  )
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

On Mon, Oct 13, 2025 at 10:31:29PM +0200, Frederic Weisbecker wrote:
> The HK_TYPE_DOMAIN housekeeping cpumask is now modifyable at runtime. In
> order to synchronize against PCI probe works and make sure that no
> asynchronous probing is still pending or executing on a newly made
> isolated CPU, the housekeeping susbsystem must flush the PCI probe
> works.
> 
> However the PCI probe works can't be flushed easily since they are
> queued to the main per-CPU workqueue pool.
> 
> Solve this with creating a PCI probe specific pool and provide and use
> the appropriate flushing API.

s/modifyable/modifiable/
s/newly made isolated/newly isolated/
s/susbsystem/subsystem/
s/PCI probe specific pool/PCI probe-specific pool/

