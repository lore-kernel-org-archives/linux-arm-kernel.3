Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16010D11193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 19:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nU80GOb9NiCLGKUDlF0jPjWnpLtyN6G9RlF17vc6RcQ=; b=TvwpNOOQDQDIyZHX3GZbcWVYcI
	i0KRj4iFytmSbg+tYJHi2qbDvBuBr2hJUbEFzcw0/UY8kNN95F+fldCHWGo/Br64VBtbpL2xKrqj/
	8XkNKpZsd7Qmmzh1d2CBZGnMBsMabSncVaG2ngLUU79f51vDUUHb4D3S4phliWzgYxYRSn4IL1Hw8
	udnIz6MeWXoeiBvCcVANz1Ax3S5UyyhkIyLQcyHmLHR8FkTsoyhIXdQAYvvPQ3R5s7hwoL7DJZYyw
	p8RDUD47JLrfv1XbSULzqkyX5qxsqfKE5gTB9k1JsTxy6URKtHxivOmCfcZz0NJJvlq3k7jHBH6Id
	J7pZSN5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOLA7-0000000FY6l-24Eq;
	Wed, 26 Nov 2025 19:26:47 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOLA4-0000000FY6M-3JVw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 19:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nU80GOb9NiCLGKUDlF0jPjWnpLtyN6G9RlF17vc6RcQ=; b=m5IyTggrRAAY5MhBN6EpasSDVL
	YnL4rtLPSW0hBjjOgYMp5fLiiyp/wwm7von1AJhAekg73plC0swbRI6WCfUWNQ+P6t7lyjB2IwWHK
	dHG3UMGxNUmXcARXsH20a+MKTVvBYdnODh/AQrhfKkPdN/yqqcu2nz9UzxOTCwSxCeDov1UGjAWpd
	LRU9WIJuinhZqwhWTWmliPFSxagjI+DUY21bqlM1h0ikrfoablwBCOy2u85OE1+TvvgXc8peS4IO3
	q6s2ELwC4XDldzOHD/QHYDaCIUs7has7C2uaIiYN19w0u1KZqxMxK8bdXYbLyPvUw9OW2F289fVxg
	elLHBApA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vOLA0-00000000kzD-2DFB;
	Wed, 26 Nov 2025 19:26:40 +0000
Date: Wed, 26 Nov 2025 19:26:40 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Xie Yuanbin <xieyuanbin1@huawei.com>, brauner@kernel.org, jack@suse.cz,
	will@kernel.org, nico@fluxnic.net, akpm@linux-foundation.org,
	hch@lst.de, jack@suse.com, wozizhi@huaweicloud.com,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	lilinjie8@huawei.com, liaohua4@huawei.com,
	wangkefeng.wang@huawei.com, pangliyuan1@huawei.com
Subject: Re: [RFC PATCH] vfs: Fix might sleep in load_unaligned_zeropad()
 with rcu read lock held
Message-ID: <20251126192640.GD3538@ZenIV>
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <20251126101952.174467-1-xieyuanbin1@huawei.com>
 <20251126181031.GA3538@ZenIV>
 <20251126184820.GB3538@ZenIV>
 <aSdPYYqPD5V7Yeh6@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSdPYYqPD5V7Yeh6@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_112644_830312_8AB43369 
X-CRM114-Status: GOOD (  16.01  )
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

On Wed, Nov 26, 2025 at 07:05:05PM +0000, Russell King (Oracle) wrote:
> On Wed, Nov 26, 2025 at 06:48:20PM +0000, Al Viro wrote:
> > It's been years since I looked at 32bit arm exception handling, so I'd need
> > quite a bit of (re)RTF{S,M} before I'm comfortable with poking in
> > arch/arm/mm/fault.c; better let ARM folks deal with that.  But arch/* is
> > where it should be dealt with; as for papering over that in fs/*:
> 
> Don't expect that to happen. I've not looked at it for over a decade,
> I do very little 32-bit ARM stuff anymore. Others have modified the
> fault handling, the VM has changed, I basically no longer have the
> knowledge. Effectively, 32-bit ARM is unmaintained now, although it
> still has many users.

Joy...  For quick and dirty variant (on current tree), how about
adding
	if (unlikely(addr > TASK_SIZE) && !user_mode(regs))
		goto no_context;

right after

	if (!ttbr0_usermode_access_allowed(regs))
		goto no_context;

in do_page_fault() there?

NOTE: that might or might not break vdso; I don't think it would, but...

