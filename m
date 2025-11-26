Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C238D111BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 23:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkC4EC2zssMx28s9No60sCNue+peZIp/avGbOKBlk10=; b=DNSO4vdw+40x/cwEI5rDBG67Hs
	VQMdraSXAvWEpa2SuFl3jr5XbMmcp/F6buzLhtV3/J7Ni+4qGKit5WHj0LpnZax14lvq9/d6iaQTl
	pCo50HEMBJj+5E6aFOaCQuvOtIU8BTNdfty9ubVIvemtPlbp/fqdg0/2dglg2y1nUWzlKv2o/DOCe
	RCxV7GY8uC+OsnaLfrmB4f/if22W6BqzU+Xmrhw4Grka6BCOWSeHm1klP/52d8pHBlEDHX9UY5Tpf
	DpB1nz4v/GxNrcexaqbGHS0QBrQm5NGWLg+8Zykv/f2YOqqD3QLp3eGN79wLgYdd6Ic/8Ldda7FA+
	O9LyW+IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOPIR-0000000FmEs-2cxV;
	Wed, 26 Nov 2025 23:51:39 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOPIO-0000000FmEX-1BAM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 23:51:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wkC4EC2zssMx28s9No60sCNue+peZIp/avGbOKBlk10=; b=n1nD1shoa5nvuzhDtF44Purkpc
	5bjbZrX5nCdzonSHSYJqpHMlADRQU+VwdfC5fXQJk4ojTO3bemQGJkJw4CtbUfR3/1ghTrFjzhzLX
	xyxRHWbxXcWc/dcbMkci+w69UUeqkccHLZw+oxDejQ0dfn9XN7hKH3lGMnDlRq24PyViwiT8WzOce
	q2moRs0tG+D5MF9A0E0YYwDfqx8PGiMrkbyZL8OzaYBxQXeFNUwufzjmsRtaWbHmJMdD6AyCQLs21
	KjxSQ2LIwidiH62xuLMZf1PIo8EYJ2NeqssUZH5KpjxYnGZXyeoC6X9sAxibDbEo/JmThxsV/WJUM
	r/WQtNxg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vOPII-00000006Ijc-3QlD;
	Wed, 26 Nov 2025 23:51:30 +0000
Date: Wed, 26 Nov 2025 23:51:30 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: david laight <david.laight@runbox.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Xie Yuanbin <xieyuanbin1@huawei.com>, brauner@kernel.org,
	jack@suse.cz, will@kernel.org, nico@fluxnic.net,
	akpm@linux-foundation.org, hch@lst.de, jack@suse.com,
	wozizhi@huaweicloud.com, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, lilinjie8@huawei.com, liaohua4@huawei.com,
	wangkefeng.wang@huawei.com, pangliyuan1@huawei.com
Subject: Re: [RFC PATCH] vfs: Fix might sleep in load_unaligned_zeropad()
 with rcu read lock held
Message-ID: <20251126235130.GG3538@ZenIV>
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <20251126101952.174467-1-xieyuanbin1@huawei.com>
 <20251126181031.GA3538@ZenIV>
 <20251126184820.GB3538@ZenIV>
 <aSdPYYqPD5V7Yeh6@shell.armlinux.org.uk>
 <20251126192640.GD3538@ZenIV>
 <aSdaWjgqP4IVivlN@shell.armlinux.org.uk>
 <20251126200221.GE3538@ZenIV>
 <20251126222505.1638a66d@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126222505.1638a66d@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_155136_324584_F8F5E882 
X-CRM114-Status: GOOD (  19.45  )
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

On Wed, Nov 26, 2025 at 10:25:05PM +0000, david laight wrote:

> Can you fix it with a flag on the exception table entry that means
> 'don't try to fault in a page'?
> 
> I think the logic would be the same as 'disabling pagefaults', just
> checking a different flag.
> After all the fault itself happens in both cases.

The problem is getting to the point where you search the exception table
without blocking.

x86 #PF had been done that way from well before the point when
load_unaligned_zeropad() had been introduced, so everything worked
there from the very beginning.

arm and arm64, OTOH, were different - there had been logics for
"if trylock fails, check if we are in kernel space and have no
matching exception table entry; bugger off if so, otherwise we
are safe to grab mmap_sem - it's something like get_user() and
we *want* mmap_sem there", but it did exactly the wrong thing for
this case.

The only thing that prevented serious breakage from the very beginning
was that these faults are very rare - and hard to arrange without
KFENCE.  So it didn't blow up.  In 2017 arm64 side of problem had
been spotted and (hopefully) fixed.  arm counterpart stayed unnoticed
(perhaps for the lack of good reproducer) until now.

Most of the faults are from userland code, obviously, so we don't
want to search through the exception table on the common path.
So hanging that on a flag in exception table entry is not a good
idea - we need a cheaper predicate checked first.

x86 starts with separating the fault on kernel address from that on
userland; we are not going anywhere near mmap_sem (and VMAs in general)
in the former case and that's where load_unaligned_zeropad() faults
end up.  arm64 fix consisted of using do_translation_fault() instead
of do_page_fault(), with the former falling back to the latter for
userland addresses and using do_bad_area() for kernel ones.
Assuming that the way it's hooked up covers everything, we should
be fine there.

One potential problem _might_ be with the next PTE present, but
write-only.  Note that it has to cope with symlink bodies as well
and those might come from page cache rather than kmem_cache_alloc().
I'm nowhere near being uptodate on arm64 virtual memory setup, though,
so take that with a cartload of salt...

