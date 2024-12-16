Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB53E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 06:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTeuGSh1CGSThRU7myc0e4PzU/URwKkheVQYIA9QTkw=; b=nkC7MVVXTAUeBXMqYSKDy8kJXu
	Y9EQfkOpcMQjmKqCyd/QOBMgSii0tG8/csTGYDd0xHutdVw08WYbpj51cf65h7FlAEteCoH6SPiRh
	rajBU90uQS389CnRNI3c5rLTCv91PiISAWTmeUgovYFkLDcrLdJGn9VchqaIt0XtEgb3pKpDnq9i6
	FACdeMx9ZCpwbdANLCyhg/9BLe9PpL564sZClZ/+qZ0/izgXF1T8C1K/AcfGjY6pPTPOnIN/EmpEk
	ksNWPRY0F8UYZ9qveAa05kk144oup1DBjI45TCBWwkZF4IvBoEAjRZEl843xIzX0AubOndN2L/v7v
	OsQ/UeAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN4aO-00000009BVv-232P;
	Mon, 16 Dec 2024 06:28:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN4ZG-00000009BKa-3EK0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 06:27:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 874665C5F33;
	Mon, 16 Dec 2024 06:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640B9C4CED0;
	Mon, 16 Dec 2024 06:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1734330417;
	bh=YTeuGSh1CGSThRU7myc0e4PzU/URwKkheVQYIA9QTkw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GY0AZMxmMTcjeSKYZE7GmeuX3SKjxwb/58gdhtCO5ezpDtS7gHlr8h702y1OHXEf3
	 vY6Jr3J4GAa6Wcr8zvbFGqgmpilb6SPi4mi0P9Bicw+/iyZasNONa8WkQjjSoDOyRm
	 3Dc5fonxtLGVn5tPwYlTUYvPZ0flblYJeuQt5VAY=
Date: Sun, 15 Dec 2024 22:26:55 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Alistair Popple <apopple@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, Dan Williams
 <dan.j.williams@intel.com>, linux-mm@kvack.org, lina@asahilina.net,
 zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
 bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
 will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org,
 djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, peterx@redhat.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 david@fromorbit.com, sfr@canb.auug.org.au
Subject: Re: [PATCH v3 00/25] fs/dax: Fix ZONE_DEVICE page reference counts
Message-Id: <20241215222655.ef0b15148120a2e2b06b2234@linux-foundation.org>
In-Reply-To: <wysuus23bqmjtwkfu3zutqtmkse3ki3erf45x32yezlrl24qto@xlqt7qducyld>
References: <cover.e1ebdd6cab9bde0d232c1810deacf0bae25e6707.1732239628.git-series.apopple@nvidia.com>
	<675ce1e5a3d68_fad0294d0@dwillia2-xfh.jf.intel.com.notmuch>
	<45555f72-e82a-4196-94af-22d05d6ac947@redhat.com>
	<wysuus23bqmjtwkfu3zutqtmkse3ki3erf45x32yezlrl24qto@xlqt7qducyld>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_222659_279463_5839C5E2 
X-CRM114-Status: GOOD (  12.37  )
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

On Mon, 16 Dec 2024 11:55:30 +1100 Alistair Popple <apopple@nvidia.com> wrote:

> The remainder are more -mm focussed. However they do depend on the fs/dax
> cleanups in the first half so the trick would be making sure Andrew only takes
> them if the nvdimm.git changes have made it into -next. I'm happy with either
> approach, so let me know if I should split the series or not.

My inclination is to put it all into the nvdimm tree, with appropriate
MM developer acks.

But I'm having difficulty determining how practical that is because the
v3 series is almost a month old so my test merging was quite ugly.

Perhaps you could prepare a new-doesn't-need-to-be-final version for
people to look at and to aid with this head-scratching?

