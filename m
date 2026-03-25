Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0270106B53F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1F+7Gw+G/hP5z5nt7152wgtEV1xSsKN3O2mDCBx1HUw=; b=cTwtJ56/M3IuPr1iYGA8uqzXIy
	tsFwwwdrh+RcBGarSFy5G/D7qjrRKIA4z0HSrsZtPElG0QRdGaCkLCCiZU3lzcy3OpYVbB5ft+nqd
	PXUaoKbxpp4y30waT0mso+U9KHMFDxfieCgPFofBXcBw0gpsLncUc5/p8+pxjmdKN0CiZad3c3uYe
	uvukXykFXNzbaHh72mugB4uCuxXNVjYKRxbYnFQbhADZCSfU8R6mZOJAnRPRIs1wl83UvGLBHfbnL
	K6ewcytv9YU4XW4K1FIP4nsH2evnDPij4iA1NATZfpxbJILro8yynkOktxYt2s+qDSz1PkfcRTQzE
	UiK2aKAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Oz5-00000003XoQ-1mlB;
	Wed, 25 Mar 2026 14:13:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Oz2-00000003Xnh-2KI8;
	Wed, 25 Mar 2026 14:13:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C103043D70;
	Wed, 25 Mar 2026 14:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2230C116C6;
	Wed, 25 Mar 2026 14:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774447999;
	bh=O4KR79NA3w5wXHTjCgl3Y/eCUkwrrxsmxAb2QYX2GZc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=THeeRJa+fvQrbUlWi1AzdB4xesJwfM/iMX3IW08X/F2tnmO2Sq9kSk/X2JbnvBwo+
	 iPnryERXRmcoJKHw/RDO7vBm9UnM6P4u2a/TcWW6nfb0TUYORcveAXebJPr293zK4g
	 +Ias1QKlEaBi/7zTZtA8JdEJ1rJD+alcOdsXxMvOub3PzN5vN6Q+XGM1CXkMhPMjr2
	 Csb2YPWXjwzAvXrWoN0WUbuDkR+1/J4hY4VMkUm1BHPU75vVOYy14wxbfq7tTP5S66
	 vlraXxz0FCKhIq2kJIQumHP3qwlqv9CrN5md/W0QopKDjxp/BTGH75Ssk1SU3JAold
	 B+q4e2Bddgs5Q==
Message-ID: <92042416-251e-43bf-b5a7-cfa9c826d020@kernel.org>
Date: Wed, 25 Mar 2026 15:13:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/21] uio: replace deprecated mmap hook with
 mmap_prepare in uio_info
Content-Language: en-US
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Clemens Ladisch <clemens@ladisch.de>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Bodo Stroesser <bostroesser@gmail.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 David Hildenbrand <david@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 Ryan Roberts <ryan.roberts@arm.com>
References: <cover.1774045440.git.ljs@kernel.org>
 <157583e4477705b496896c7acd4ac88a937b8fa6.1774045440.git.ljs@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <157583e4477705b496896c7acd4ac88a937b8fa6.1774045440.git.ljs@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_071320_638405_BF812BB7 
X-CRM114-Status: GOOD (  19.56  )
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

On 3/20/26 23:39, Lorenzo Stoakes (Oracle) wrote:
> The f_op->mmap interface is deprecated, so update uio_info to use its
> successor, mmap_prepare.
> 
> Therefore, replace the uio_info->mmap hook with a new
> uio_info->mmap_prepare hook, and update its one user, target_core_user,
> to both specify this new mmap_prepare hook and also to use the new
> vm_ops->mapped() hook to continue to maintain a correct udev->kref
> refcount.
> 
> Then update uio_mmap() to utilise the mmap_prepare compatibility layer to
> invoke this callback from the uio mmap invocation.
> 
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

> ---
>  drivers/target/target_core_user.c | 26 ++++++++++++++++++--------
>  drivers/uio/uio.c                 | 10 ++++++++--
>  include/linux/uio_driver.h        |  4 ++--
>  3 files changed, 28 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/target/target_core_user.c b/drivers/target/target_core_user.c
> index af95531ddd35..edc2afd5f4ee 100644
> --- a/drivers/target/target_core_user.c
> +++ b/drivers/target/target_core_user.c
> @@ -1860,6 +1860,17 @@ static struct page *tcmu_try_get_data_page(struct tcmu_dev *udev, uint32_t dpi)
>  	return NULL;
>  }
>  
> +static int tcmu_vma_mapped(unsigned long start, unsigned long end, pgoff_t pgoff,
> +			   const struct file *file, void **vm_private_data)
> +{
> +	struct tcmu_dev *udev = *vm_private_data;
> +
> +	pr_debug("vma_mapped\n");

This looked like testing leftover at first, but it matches
tcmu_vma_open()/close() (in case anyone else wonders).

> +
> +	kref_get(&udev->kref);
> +	return 0;
> +}
> +

