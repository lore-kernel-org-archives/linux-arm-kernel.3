Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF18D11195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 20:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4aSs3i8MxSsH9LQQdFXRZ1BuzBNVqWnsabFj67iIHM=; b=bYIev/JVRuJcE2rD9n9jYfE/pe
	DNDs5vPJWrFX85SfCeCWYPAvII2/k55NRB9YKdFu4s9TI0jd8Xc9ZuwV7/jPGr0Kr2VrxEgm+954q
	BXbfII/ovvDArVl1voxutGgHYam4s9lZ/N+WgQGD+zQokPonqps6VJ/iyEn8j65paqbiCVaEYksRF
	wp3bP/sqv0P7b3g6ci/xKkGqFQF8jEvD5xed9SPwjxLanI09vDLjOT20HSv1hu2zN93/jL1+kQmJv
	83Wsh8Dpd4yV60la/ZtS+JYcJqCBia9Z88/PL5JeHpAZ/+lDTxM/y4xppxmQBeDfO+SiHsF9RG39A
	P8EdLP3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOLie-0000000Fahl-08Ls;
	Wed, 26 Nov 2025 20:02:28 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOLic-0000000FahK-1TEW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 20:02:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=o4aSs3i8MxSsH9LQQdFXRZ1BuzBNVqWnsabFj67iIHM=; b=LZmCZ9GqC2htrAE0BVjhaPqHbm
	INkERVhSMY1db6iQJ4Ngu9AKIvVQpb9JE8xz31dPizJduLq671DX531BBB+KJV1Sjyi/sey8w80IQ
	YOooCFH/lLeUp17ag+6xUA8yKj8RZDwMFNUSsjcs8VJMcvgbypRlKTy66U0t99XSc8VTR1NQehinX
	SKIa6txZRdmeT3ZKSTGrp4Wk3OXxlT1Stsz9j2rwT5sTQN4R4aAYzSJbTvsx88Wgb9TMv6xbiMhs5
	v6200KJYAwWcQ8YmK66v/BuAUrigq0ReBXRDD+8ti0UsNN07jiln45kL/AfUkfpouHzXAAC6n4Y5x
	st2zoTKw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vOLiX-00000001VKP-2ggS;
	Wed, 26 Nov 2025 20:02:21 +0000
Date: Wed, 26 Nov 2025 20:02:21 +0000
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
Message-ID: <20251126200221.GE3538@ZenIV>
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <20251126101952.174467-1-xieyuanbin1@huawei.com>
 <20251126181031.GA3538@ZenIV>
 <20251126184820.GB3538@ZenIV>
 <aSdPYYqPD5V7Yeh6@shell.armlinux.org.uk>
 <20251126192640.GD3538@ZenIV>
 <aSdaWjgqP4IVivlN@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSdaWjgqP4IVivlN@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_120226_391042_7F9BA339 
X-CRM114-Status: GOOD (  19.49  )
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

On Wed, Nov 26, 2025 at 07:51:54PM +0000, Russell King (Oracle) wrote:

> I don't understand how that helps. Wasn't the report that the filename
> crosses a page boundary in userspace, but the following page is
> inaccessible which causes a fault to be taken (as it always would do).
> Thus, wouldn't "addr" be a userspace address (that the kernel is
> accessing) and thus be below TASK_SIZE ?
> 
> I'm also confused - if we can't take a fault and handle it while
> reading the filename from userspace, how are pages that have been
> swapped out or evicted from the page cache read back in from storage
> which invariably results in sleeping - which we can't do here because
> of the RCU context (not that I've ever understood RCU, which is why
> I've always referred those bugs to Paul.)

No, the filename is already copied in kernel space *and* it's long enough
to end right next to the end of page.  There's NUL before the end of page,
at that, with '/' a couple of bytes prior.  We attempt to save on memory
accesses, doing word-by-word fetches, starting from the beginning of
component.  We *will* detect NUL and ignore all subsequent bytes; the
problem is that the last 3 bytes of page might be '/', 'x' and '\0'.
We call load_unaligned_zeropad() on page + PAGE_SIZE - 2.  And get
a fetch that spans the end of page.

We don't care what's in the next page, if there is one mapped there
to start with.  If there's nothing mapped, we want zeroes read from
it, but all we really care about is having the bytes within *our*
page read correctly - and no oops happening, obviously.

That fault is an extremely cold case on a fairly hot path.  We don't
want to mess with disabling pagefaults, etc. - not for the sake
of that.

