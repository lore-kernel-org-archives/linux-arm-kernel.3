Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04438C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 13:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l83Dw368hueJll8PyntCW0Nb5bpCWlX4zt8mq3uaKys=; b=DFgYDFz8p7xMrky0Ev/2L/V1Ce
	8XtCoJsCdBxe7cMy7Q1Fz8iJcYOFWe8BoKSzzRFURILKshRWxxy5KYuM3tpi9h7I7Uc3XqEyB+7XL
	DXD90iML3ppx1/91Mhf/ekeN6euxqJTJK1Aj50/zDoR9uVxo484xXe7+YzhI1/JBvX48BgBAFPLdI
	50pXCt3Rfle5+k6uz15Nco0L80WVBfobh64X92B48LTS+yj3hwOEaZbCEznNym+JvbB89e/cimFEM
	+57RGvMyQqDUUBkRhUHkZYRDHVtCp6VdjSMFCNu67XMLG5U5nyPhUh+bm81Wurq5Ooa9LvLTyca+f
	We/w430g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tffDn-00000003MKa-2wRl;
	Wed, 05 Feb 2025 13:13:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tff5S-00000003Koo-1n3n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 13:05:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738760700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l83Dw368hueJll8PyntCW0Nb5bpCWlX4zt8mq3uaKys=;
	b=U1CTw6YbfUG03EHhfbYRacPYt/866z5zfVcOJqw8KrEYsNaOKbXdrL4RxVqB6Wrxh6cvsD
	uCyuUa+oK7yWFgg6y+08M3PQNS+p+lufZ1XLrx9jEIJnG7w+APUY9KF+bcXA/SPtsD+wAC
	IN77YlTH8/ZvQDd5+zoj0lHpWqzdah0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-491-1l4K9GaVMGO1d3Se1A4h_Q-1; Wed,
 05 Feb 2025 08:03:26 -0500
X-MC-Unique: 1l4K9GaVMGO1d3Se1A4h_Q-1
X-Mimecast-MFC-AGG-ID: 1l4K9GaVMGO1d3Se1A4h_Q
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5FC961801A0D;
	Wed,  5 Feb 2025 13:03:19 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.80.186])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 72B8C3000197;
	Wed,  5 Feb 2025 13:03:15 +0000 (UTC)
Received: by fedora.redhat.com (Postfix, from userid 1000)
	id A724B6AA37D; Wed,  5 Feb 2025 08:03:13 -0500 (EST)
Date: Wed, 5 Feb 2025 08:03:13 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: akpm@linux-foundation.org, dan.j.williams@intel.com, linux-mm@kvack.org,
	alison.schofield@intel.com, lina@asahilina.net,
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
	German Maglione <gmaglione@redhat.com>
Subject: Re: [PATCH v6 01/26] fuse: Fix dax truncate/punch_hole fault path
Message-ID: <Z6NhkR8ZEso4F-Wx@redhat.com>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <bfae590045c7fc37b7ccef10b9cec318012979fd.1736488799.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfae590045c7fc37b7ccef10b9cec318012979fd.1736488799.git-series.apopple@nvidia.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_050502_599864_C4EA32A4 
X-CRM114-Status: GOOD (  26.85  )
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

On Fri, Jan 10, 2025 at 05:00:29PM +1100, Alistair Popple wrote:
> FS DAX requires file systems to call into the DAX layout prior to unlinking
> inodes to ensure there is no ongoing DMA or other remote access to the
> direct mapped page. The fuse file system implements
> fuse_dax_break_layouts() to do this which includes a comment indicating
> that passing dmap_end == 0 leads to unmapping of the whole file.
> 
> However this is not true - passing dmap_end == 0 will not unmap anything
> before dmap_start, and further more dax_layout_busy_page_range() will not
> scan any of the range to see if there maybe ongoing DMA access to the
> range. Fix this by passing -1 for dmap_end to fuse_dax_break_layouts()
> which will invalidate the entire file range to
> dax_layout_busy_page_range().

Hi Alistair,

Thanks for fixing DAX related issues for virtiofs. I am wondering how are
you testing DAX with virtiofs. AFAIK, we don't have DAX support in Rust
virtiofsd. C version of virtiofsd used to have out of the tree patches
for DAX. But C version got deprecated long time ago.

Do you have another implementation of virtiofsd somewhere else which
supports DAX and allows for testing DAX related changes?

Thanks
Vivek

> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Co-developed-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> Fixes: 6ae330cad6ef ("virtiofs: serialize truncate/punch_hole and dax fault path")
> Cc: Vivek Goyal <vgoyal@redhat.com>
> 
> ---
> 
> Changes for v6:
> 
>  - Original patch had a misplaced hunk due to a bad rebase.
>  - Reworked fix based on Dan's comments.
> ---
>  fs/fuse/dax.c  | 1 -
>  fs/fuse/dir.c  | 2 +-
>  fs/fuse/file.c | 4 ++--
>  3 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
> index 9abbc2f..455c4a1 100644
> --- a/fs/fuse/dax.c
> +++ b/fs/fuse/dax.c
> @@ -681,7 +681,6 @@ static int __fuse_dax_break_layouts(struct inode *inode, bool *retry,
>  			0, 0, fuse_wait_dax_page(inode));
>  }
>  
> -/* dmap_end == 0 leads to unmapping of whole file */
>  int fuse_dax_break_layouts(struct inode *inode, u64 dmap_start,
>  				  u64 dmap_end)
>  {
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index 0b2f856..bc6c893 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -1936,7 +1936,7 @@ int fuse_do_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  	if (FUSE_IS_DAX(inode) && is_truncate) {
>  		filemap_invalidate_lock(mapping);
>  		fault_blocked = true;
> -		err = fuse_dax_break_layouts(inode, 0, 0);
> +		err = fuse_dax_break_layouts(inode, 0, -1);
>  		if (err) {
>  			filemap_invalidate_unlock(mapping);
>  			return err;
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 082ee37..cef7a8f 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -253,7 +253,7 @@ static int fuse_open(struct inode *inode, struct file *file)
>  
>  	if (dax_truncate) {
>  		filemap_invalidate_lock(inode->i_mapping);
> -		err = fuse_dax_break_layouts(inode, 0, 0);
> +		err = fuse_dax_break_layouts(inode, 0, -1);
>  		if (err)
>  			goto out_inode_unlock;
>  	}
> @@ -2890,7 +2890,7 @@ static long fuse_file_fallocate(struct file *file, int mode, loff_t offset,
>  	inode_lock(inode);
>  	if (block_faults) {
>  		filemap_invalidate_lock(inode->i_mapping);
> -		err = fuse_dax_break_layouts(inode, 0, 0);
> +		err = fuse_dax_break_layouts(inode, 0, -1);
>  		if (err)
>  			goto out;
>  	}
> -- 
> git-series 0.9.1
> 


