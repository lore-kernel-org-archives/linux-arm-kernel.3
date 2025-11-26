Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA99CCF9F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 22:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdiNBuFehcyPOmOy5sppRLIzajFbdjUkb07I69kLGso=; b=Y29lbLqtIajXWl97aGWB6OdHw0
	mEsiNCs0azvdhlDlIPfsM98rnEDQyvGs6xSRfIWnNefweYOJIcteyWD4yWQrb1zGrRqTXWCjvbb+Y
	2VVj+qX72zeIjutYnr8giAbJ7+5eFt9AUlPTTBwbqPzQqfmzKI38Do2XawqC7TdMqH34oBepB+zW+
	1jJgDHtUwRsjXIZIyVFVBQNYa8R5WuJsHNIt7xh639bqrhcyXaaWIDQa5jEzk1ZK9/N367ivKkHv8
	Ab4WzB33eisxIIyoRaFpzHGD+AF8hjPORcwv6MzGwpoBYmlD7rCB9yxLWes3vh71xC4ntW3GHgBzd
	WxNOBEUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vONxU-0000000FiPq-2BWj;
	Wed, 26 Nov 2025 22:25:56 +0000
Received: from mailtransmit04.runbox.com ([2a0c:5a00:149::25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vONxR-0000000FiNg-3KO5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 22:25:55 +0000
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight@runbox.com>)
	id 1vONws-00Anzk-V3; Wed, 26 Nov 2025 23:25:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date;
	bh=JdiNBuFehcyPOmOy5sppRLIzajFbdjUkb07I69kLGso=; b=xcD55qt/yTlHbRKdH+dBDSqh0U
	D42VMdh3YZT9pboyItqPjUEFlMjqGvWOkqKAMtxuETcqWYgXpz4rKroO5l/tRmc3L1BOxUfisIxkl
	rB1Iby8Ydzrb+bQCoPA7DatT6VLRSGNsdHwRDRTFQ5z0moPBOyfGsIcUf8++5wUiEyW+pE4J/YgUA
	OPPMAkQtF/m5Q1ardScEOjgI2eA0Y9fd/zb1MeRycorFUZdoNr0n/uOOSlhpqKg4fAk3vPaH5FtCr
	IgHttiJ0P0sh6EEouRQ3I09DwKT03Sa31APrSym62KaZbRen3hdZZ1gjJ53lTWC+Ky3pEFG8BjzHd
	gB2J9ibQ==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight@runbox.com>)
	id 1vONwr-0006Pi-3U; Wed, 26 Nov 2025 23:25:17 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vONwi-00EfwT-M2; Wed, 26 Nov 2025 23:25:08 +0100
Date: Wed, 26 Nov 2025 22:25:05 +0000
From: david laight <david.laight@runbox.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Xie Yuanbin
 <xieyuanbin1@huawei.com>, brauner@kernel.org, jack@suse.cz,
 will@kernel.org, nico@fluxnic.net, akpm@linux-foundation.org, hch@lst.de,
 jack@suse.com, wozizhi@huaweicloud.com, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, lilinjie8@huawei.com, liaohua4@huawei.com,
 wangkefeng.wang@huawei.com, pangliyuan1@huawei.com
Subject: Re: [RFC PATCH] vfs: Fix might sleep in load_unaligned_zeropad()
 with rcu read lock held
Message-ID: <20251126222505.1638a66d@pumpkin>
In-Reply-To: <20251126200221.GE3538@ZenIV>
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
	<20251126101952.174467-1-xieyuanbin1@huawei.com>
	<20251126181031.GA3538@ZenIV>
	<20251126184820.GB3538@ZenIV>
	<aSdPYYqPD5V7Yeh6@shell.armlinux.org.uk>
	<20251126192640.GD3538@ZenIV>
	<aSdaWjgqP4IVivlN@shell.armlinux.org.uk>
	<20251126200221.GE3538@ZenIV>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_142553_839234_84CC04B6 
X-CRM114-Status: GOOD (  28.17  )
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

On Wed, 26 Nov 2025 20:02:21 +0000
Al Viro <viro@zeniv.linux.org.uk> wrote:

> On Wed, Nov 26, 2025 at 07:51:54PM +0000, Russell King (Oracle) wrote:
> 
> > I don't understand how that helps. Wasn't the report that the filename
> > crosses a page boundary in userspace, but the following page is
> > inaccessible which causes a fault to be taken (as it always would do).
> > Thus, wouldn't "addr" be a userspace address (that the kernel is
> > accessing) and thus be below TASK_SIZE ?
> > 
> > I'm also confused - if we can't take a fault and handle it while
> > reading the filename from userspace, how are pages that have been
> > swapped out or evicted from the page cache read back in from storage
> > which invariably results in sleeping - which we can't do here because
> > of the RCU context (not that I've ever understood RCU, which is why
> > I've always referred those bugs to Paul.)  
> 
> No, the filename is already copied in kernel space *and* it's long enough
> to end right next to the end of page.  There's NUL before the end of page,
> at that, with '/' a couple of bytes prior.  We attempt to save on memory
> accesses, doing word-by-word fetches, starting from the beginning of
> component.  We *will* detect NUL and ignore all subsequent bytes; the
> problem is that the last 3 bytes of page might be '/', 'x' and '\0'.
> We call load_unaligned_zeropad() on page + PAGE_SIZE - 2.  And get
> a fetch that spans the end of page.
> 
> We don't care what's in the next page, if there is one mapped there
> to start with.  If there's nothing mapped, we want zeroes read from
> it, but all we really care about is having the bytes within *our*
> page read correctly - and no oops happening, obviously.
> 
> That fault is an extremely cold case on a fairly hot path.  We don't
> want to mess with disabling pagefaults, etc. - not for the sake
> of that.
> 

Can you fix it with a flag on the exception table entry that means
'don't try to fault in a page'?

I think the logic would be the same as 'disabling pagefaults', just
checking a different flag.
After all the fault itself happens in both cases.

	David

