Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF50D1118F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 18:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXnZBmMMcBqaL+DvhiYDDvgc0bvBDpQl+0qRcxV/rMI=; b=EqJQSOvjIhbsMHkVGN0XbXAIdj
	P4ZTUm5/JXyQLXZOLfIQlzf/MToo7Vpyhq+iTgBJCesLZQsG8pq8DcMNaoC5sdFWi49h1B5ysVuH0
	djCUCYoZtCtZF0OI7C4/sgDzqEQPEu28joST6nhYkCD5d7A4p8x7eKNzQvQOuCojiutvC1gQBz5Du
	offmFNxh4K9lWNiTn+kZTSBs/Iz7CIXC69+RbbQmUjKi41WWb+VCAdN1JnreeXJQHjXxJ9HaRoek9
	7AXjUYV8lNDSdpPXThqP+o0ptHNXMqdUni39wtpY7jrKWNjogcJeVZmUoqb2JSbd9UY3gfczUdnJK
	DpFC1WUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJyV-0000000FTvt-1KFU;
	Wed, 26 Nov 2025 18:10:45 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJyR-0000000FTvL-3Kbd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 18:10:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DXnZBmMMcBqaL+DvhiYDDvgc0bvBDpQl+0qRcxV/rMI=; b=UwduLDd2QSBZYnTFsQNeZ7gUhb
	ugR7BEq1Awwb0Sl1pJANgCHa9RbW5fJogb979YgNPHGV9moAmTbrJ6s+dLcDAnnFOkdE4tVuubBSH
	1VmQFY5MTGbuZQOjMR/K5XUeGRnPdTc96EEZU292HRpDwwwP/7Qp6fj3DKKvaETaf3TfjYtpFLcZh
	2WxqQkz0AeUZ06OWl+kipIg5QxxFnOtma8Aeti10N6RW81xfDSQB5RODA2zZdiOKlBpbAYz0kgd0d
	w5QRtNcGq0hOCNpK0/DWciUgfLnpEdCNlBBC2JezPucP0NYoOXK57GRna2MFXOhCuGmbsTWXDf04q
	5dglf4Yw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vOJyJ-0000000Gm9v-1MMj;
	Wed, 26 Nov 2025 18:10:31 +0000
Date: Wed, 26 Nov 2025 18:10:31 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: brauner@kernel.org, jack@suse.cz, linux@armlinux.org.uk,
	will@kernel.org, nico@fluxnic.net, akpm@linux-foundation.org,
	hch@lst.de, jack@suse.com, wozizhi@huaweicloud.com,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	lilinjie8@huawei.com, liaohua4@huawei.com,
	wangkefeng.wang@huawei.com, pangliyuan1@huawei.com
Subject: Re: [RFC PATCH] vfs: Fix might sleep in load_unaligned_zeropad()
 with rcu read lock held
Message-ID: <20251126181031.GA3538@ZenIV>
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <20251126101952.174467-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126101952.174467-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_101040_102153_492EE5A6 
X-CRM114-Status: GOOD (  10.62  )
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

On Wed, Nov 26, 2025 at 06:19:52PM +0800, Xie Yuanbin wrote:
> When the path is initialized with LOOKUP_RCU flag in path_init(), the
> rcu read lock will be acquired. Inside the rcu critical section,
> load_unaligned_zeropad() may be called. According to the comments of
> load_unaligned_zeropad(), when loading the memory, a page fault may be
> triggered in the very unlikely case.

> Add pagefault_disable() to handle this situation.

Way too costly, IMO.  That needs to be dealt with in page fault handler
and IIRC arm used to do that; did that get broken at some point?

