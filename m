Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0800EC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 13:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5N+Al59YmEDtBoKSzwKPTh6WUXLbEAKXSUpJ7QukWWw=; b=peyFK2syl/p5zxeZahbGivVhgc
	KvCfT9Rzy2bUHFyfkP432NwSw3bcgaL17ZbKwUsEz+4trv5adPNs11Gp+FNGZHI3nAnoZN7sNQ3Yy
	MKCCrj0Aw9v8dH6EklrVLMpA9wScGnXxkwC288LlC6SbYnt6Jl2L+KiqfNqeuJaJnh29dbHwwUYrX
	H6sh4J4VVCupnACLzO/02UPyYziJmzDc7pOWCsMmgWXxE+vojwo1DYbj1ff9S5kuPnACTXtmmNSrH
	i7uJtMX6CvR1JgtyVr9QgyypfxPmrK4SS9cX5u3exjQHQVylDb54hb16VE88mDhS0dYCa5jejLBIM
	pO/QVxOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2PA-00000006VJB-418j;
	Thu, 06 Feb 2025 13:58:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg24q-00000006SUd-2ueW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 13:37:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738849074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5N+Al59YmEDtBoKSzwKPTh6WUXLbEAKXSUpJ7QukWWw=;
	b=Mgvo+vzs3KjHSP/DDhot9MOS1Khk6BNrq7OM4Pt3BiAqHe0GKf0LPOvInLT+lFrj+UmkDE
	BaSCD1u3U0Vid6Rj1rO9cgH/+xuv/L+WvtJRRA/xdZRZEmni/FFvPG61JdG9C0GX2BXCvJ
	Fg6ZOIbYdnYESLEMQcRRPmMP8Fi2+G4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-537-Z1CCXbCkNJ6JlHV_rykxEg-1; Thu,
 06 Feb 2025 08:37:51 -0500
X-MC-Unique: Z1CCXbCkNJ6JlHV_rykxEg-1
X-Mimecast-MFC-AGG-ID: Z1CCXbCkNJ6JlHV_rykxEg
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3A21C18DFE39;
	Thu,  6 Feb 2025 13:37:14 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.64.235])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4FC6618004A7;
	Thu,  6 Feb 2025 13:37:09 +0000 (UTC)
Received: by fedora.redhat.com (Postfix, from userid 1000)
	id 9E1E56AA45D; Thu,  6 Feb 2025 08:37:07 -0500 (EST)
Date: Thu, 6 Feb 2025 08:37:07 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org, alison.schofield@intel.com, lina@asahilina.net,
	zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
	bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca,
	catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
	npiggin@gmail.com, dave.hansen@linux.intel.com, ira.weiny@intel.com,
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
	linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name,
	loongarch@lists.linux.dev, Hanna Czenczek <hreitz@redhat.com>,
	German Maglione <gmaglione@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v6 01/26] fuse: Fix dax truncate/punch_hole fault path
Message-ID: <Z6S7A-51SdPco_3Z@redhat.com>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <bfae590045c7fc37b7ccef10b9cec318012979fd.1736488799.git-series.apopple@nvidia.com>
 <Z6NhkR8ZEso4F-Wx@redhat.com>
 <67a3fde7da328_2d2c2942b@dwillia2-xfh.jf.intel.com.notmuch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67a3fde7da328_2d2c2942b@dwillia2-xfh.jf.intel.com.notmuch>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_053756_815587_24DBD886 
X-CRM114-Status: GOOD (  30.85  )
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

On Wed, Feb 05, 2025 at 04:10:15PM -0800, Dan Williams wrote:
> Vivek Goyal wrote:
> > On Fri, Jan 10, 2025 at 05:00:29PM +1100, Alistair Popple wrote:
> > > FS DAX requires file systems to call into the DAX layout prior to unlinking
> > > inodes to ensure there is no ongoing DMA or other remote access to the
> > > direct mapped page. The fuse file system implements
> > > fuse_dax_break_layouts() to do this which includes a comment indicating
> > > that passing dmap_end == 0 leads to unmapping of the whole file.
> > > 
> > > However this is not true - passing dmap_end == 0 will not unmap anything
> > > before dmap_start, and further more dax_layout_busy_page_range() will not
> > > scan any of the range to see if there maybe ongoing DMA access to the
> > > range. Fix this by passing -1 for dmap_end to fuse_dax_break_layouts()
> > > which will invalidate the entire file range to
> > > dax_layout_busy_page_range().
> > 
> > Hi Alistair,
> > 
> > Thanks for fixing DAX related issues for virtiofs. I am wondering how are
> > you testing DAX with virtiofs. AFAIK, we don't have DAX support in Rust
> > virtiofsd. C version of virtiofsd used to have out of the tree patches
> > for DAX. But C version got deprecated long time ago.
> > 
> > Do you have another implementation of virtiofsd somewhere else which
> > supports DAX and allows for testing DAX related changes?
> 
> I have personally never seen a virtiofs-dax test. It sounds like you are
> saying we can deprecate that support if there are no longer any users.
> Or, do you expect that C-virtiofsd is alive in the ecosystem?

Ashai Lina responded that they need and test DAX using libkrun.

C version of virtiofsd is now gone. We are actively working and testing
Rust version of virtiofsd. We have not been able to add DAX support to
it yet for various reasons. 

Biggest unsolved problem with viritofsd DAX mode is guest process should
get a SIGBUS if it tries to access a file beyond the file. This can happen
if file has been truncated on the host (while it is still mapped inside
the guest). 

I had tried to summarize the problem in this presentation in the section
"KVM Page fault error handling".

https://kvm-forum.qemu.org/2020/KVMForum2020_APF.pdf

This is a tricky problem to handle. Once this gets handled, it becomes
safer to use DAX with virtiofs. Otherwise you can't share the filesystem
with other guests in DAX mode and use cases are limited.

And then there are challenges at QEMU level. virtiofsd needs additional
vhost-user commands to implement DAX and these never went upstream in
QEMU. I hope these challenges are sorted at some point of time.

I think virtiofs DAX is a very cool piece of technology. I would not like
to deprecate it. It has its own problems and challenges and once we
are able to solve these, it might see wider usage/adoption.

Thanks
Vivek


