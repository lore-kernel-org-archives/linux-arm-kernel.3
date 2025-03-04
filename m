Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED71C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 04:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wW4WcOrMiWwVIoahZMyX0rPgAwzLulIDO+CLS1CIds=; b=RPtSbIwtOA0NAktgKLavJ0u/TU
	Xcc72lfyGMXAPZwHp6I2sz2CTTV0NQKnE/4ruwTACt7SrHzJD/8TDHJZ2jB4zEPDgIGRPZxb10C5U
	j/tmjVcar/4NckC2D8zDch1lMC+0PUgzWiF8UdfYLSNv8QxK9uh7r/C2EvrdXbSmWkxFGfkn9uo/L
	NIUsEE/5ajC3/8Lc5CLNMkkO2ccrZDSpEji/RVi6JgrE/SdQtNRaC2WxE/j4LRLTRhmDcCjV06R/E
	Db37fVWOjqDDrKHggsxgkjx0g7eZx524z1oSLPo4MlZwWBANC6uKmwwjjru4FmCRiVF0ybTO2Ig6A
	vIlHYtwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKBz-000000033OM-2ZO3;
	Tue, 04 Mar 2025 04:47:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKAP-000000033A2-0cgm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 04:46:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A49DEA44E18;
	Tue,  4 Mar 2025 04:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13364C4CEE5;
	Tue,  4 Mar 2025 04:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1741063562;
	bh=BIFrLh9/bQIuBnwap0eqz54Lk04kbf4V0DZ+B0m2mNI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dF8tbczvEn6O6hRjSdWKxvQKkGRzNDZEQd6dsg0AiFp2L+F6YCMhGyxTx3ZlL53AI
	 kaXbQDaf9UtJ2eGtPxCyhDiD+/NG8ggB7max5UArq9jsbxOqNhnoi74SE44bszJ2Pe
	 oKDZeMXGXB5LFz8Eg4Vk7YAWHaK0unPGQ7GwUCdU=
Date: Mon, 3 Mar 2025 20:46:00 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Alistair Popple <apopple@nvidia.com>
Cc: dan.j.williams@intel.com, linux-mm@kvack.org, Alison Schofield
 <alison.schofield@intel.com>, lina@asahilina.net, zhang.lyra@gmail.com,
 gerald.schaefer@linux.ibm.com, vishal.l.verma@intel.com,
 dave.jiang@intel.com, logang@deltatee.com, bhelgaas@google.com,
 jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com, will@kernel.org,
 mpe@ellerman.id.au, npiggin@gmail.com, dave.hansen@linux.intel.com,
 ira.weiny@intel.com, willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
 linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name,
 loongarch@lists.linux.dev
Subject: Re: [PATCH v9 00/20] fs/dax: Fix ZONE_DEVICE page reference counts
Message-Id: <20250303204600.cb49d2d614efcded0b28f8c1@linux-foundation.org>
In-Reply-To: <xhbru4aekyfl25552le5tvifwonyuwoyioxrqxy6zkm2xlyhc5@oqxnudb4bope>
References: <cover.8068ad144a7eea4a813670301f4d2a86a8e68ec4.1740713401.git-series.apopple@nvidia.com>
	<xhbru4aekyfl25552le5tvifwonyuwoyioxrqxy6zkm2xlyhc5@oqxnudb4bope>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_204605_255711_515B6C32 
X-CRM114-Status: UNSURE (   9.67  )
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

On Fri, 28 Feb 2025 14:42:40 +1100 Alistair Popple <apopple@nvidia.com> wrote:

> This is essentially the same as what's currently in mm-unstable aside from
> the two updates listed below. The main thing to note is it incorporates
> Balbir's fixup which is currently in mm-unstable as c98612955016
> ("mm-allow-compound-zone-device-pages-fix-fix")
> 

Thanks, I've updated mm.git to this v9 series.

