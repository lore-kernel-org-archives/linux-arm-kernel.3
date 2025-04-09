Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E3BC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 16:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2g04VDx+leyn3CCeVfOpf5581DyHvtr2Z4MCjuFKJM=; b=ZLo28Ix89ft9469kJAf9dRCt3Y
	4IAD9hsqO04xyBhe0eay/3Mg7Onu7HZbMzfccpnIgzbmkZ3BW14T1UdSNTcS6AUKGzUPI9wd6hmTu
	c0sjJ9r4wcVvWDiosXT9wjF8CEDV2tA9FFbFds0W3qJLtWWoNw4kMNuN1tGmPYwmf51cWp7Jar5hH
	yDKKoM2uNhx7cCvABJTVCyfjcHYGtfsKJKW98Glyt7aCLrj0NIyLpbQ0NvEzxIki599BSF79m/Wiu
	zJt7tZFMY2aTOz2r5B033VHFQcum1mPfXapsIw3jGnPYCdbzUJK8fsFKbGY61w8gkj+gWnhbmaQ+W
	96gdhVKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2YP7-00000007uJv-1lgb;
	Wed, 09 Apr 2025 16:35:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2YIR-00000007tAZ-3KhW;
	Wed, 09 Apr 2025 16:29:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0CAC85C0520;
	Wed,  9 Apr 2025 16:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC88C4CEE3;
	Wed,  9 Apr 2025 16:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744216142;
	bh=1q+VSynmwPlJU7x8bslFD2SHwUAh5gUYIiUR0Udy/8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eZ7xuUxMgK193/vloPthk0DdEqC6xqgVTZ2tv4qrUxfwPflPQeu64Wc1z2ve1i4wC
	 savT8q+JPWhHWAXM9qKH3P2CysPMI+H8NXPMOk/sADqIA6DAB3buTZJnOOAFNZIVcp
	 xtJ59dTw/q73luTZIcB+YnEXt0/P970/6Vyuq487Q7JJzQq94DHiDYCvTEthE3ECZE
	 N0fowb03flN7jgsWj1nNsLjDhfnsVDPtyeENaAqDuX3MlYm8kOFld2pfheQecXSH1X
	 Nt2CNZxpIaNjxZa1plq3c+89EGabUCvao75NbpjqHZXPR3QYDBVULQ6/dbKGkd7p8P
	 lIz9Am9lmbk4w==
Date: Wed, 9 Apr 2025 19:28:47 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Pratyush Yadav <ptyadav@amazon.de>,
	Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org,
	graf@amazon.com, akpm@linux-foundation.org, luto@kernel.org,
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com,
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com,
	dave.hansen@linux.intel.com, dwmw2@infradead.org,
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com,
	corbet@lwn.net, krzk@kernel.org, mark.rutland@arm.com,
	pbonzini@redhat.com, pasha.tatashin@soleen.com, hpa@zytor.com,
	peterz@infradead.org, robh+dt@kernel.org, robh@kernel.org,
	saravanak@google.com, skinsburskii@linux.microsoft.com,
	rostedt@goodmis.org, tglx@linutronix.de, thomas.lendacky@amd.com,
	usama.arif@bytedance.com, will@kernel.org,
	devicetree@vger.kernel.org, kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v5 09/16] kexec: enable KHO support for memory
 preservation
Message-ID: <Z_agP1ohC3sVZrM7@kernel.org>
References: <mafs05xjmqsqc.fsf@amazon.de>
 <20250403114209.GE342109@nvidia.com>
 <Z-6UA3C1TPeH_kGL@kernel.org>
 <20250403142438.GF342109@nvidia.com>
 <Z--sUYCvP3Q8nT8e@kernel.org>
 <20250404124729.GH342109@nvidia.com>
 <Z-_kSXrHWU5Bf3sV@kernel.org>
 <20250404143031.GB1336818@nvidia.com>
 <Z_KnovvW7F2ZyzhX@kernel.org>
 <20250407141626.GB1557073@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407141626.GB1557073@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_092903_882617_9E590935 
X-CRM114-Status: UNSURE (   9.73  )
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

On Mon, Apr 07, 2025 at 11:16:26AM -0300, Jason Gunthorpe wrote:
> On Sun, Apr 06, 2025 at 07:11:14PM +0300, Mike Rapoport wrote:
> 
> KHO needs to provide a way to give back an allocated struct page/folio
> that can be freed back to the buddy alloactor, of the proper
> order. Whatever you call that function it belongs to KHO as it is
> KHO's primary responsibility to manage the buddy allocator and the
> struct pages.

If order is only important for freeing memory back to page allocator, you
don't really need it. Freeing contiguous power-of-two number of pages with
proper alignment will give the same result, just a tad slower.
 
> Jason
> 

-- 
Sincerely yours,
Mike.

