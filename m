Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82224D1118E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 19:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9CMg7xCCCe7pvWjCkZUtW9tN5r9wm9+9Wqdv/t8aKI=; b=J+zy0q6DWEsGzCW2yaJjSgb7XU
	xDPpQF/47p4NDP817GYQujx9/Heo/T5J/tAQrvqPoenNFG0y0aCBazwM9rJS8xVRMiATul6DIQwXN
	wj22XwvPtIh/cqOCqeRNOd+U+KrdR3CNgnJVn1VAkB/DKZhU00OhwY/4E2Q805cwiWfIUwgYNQzgQ
	aDcEHsO2gCMnh4JOelChFTWvHsmEV5I4ETU5ExU5MIlmeCyelK4y7Mb3EcW9dozvyqzmwCkGLY2eN
	zfgiQODdaS7uuvrYM5cL9T/cDnpjKOzLtLa1sS8VrU4c3Vy5kX17ZTVb5cW9fqHD4bB+L/IHaEivv
	Vu3dkIwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOLYj-0000000FZiK-23ii;
	Wed, 26 Nov 2025 19:52:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOLYg-0000000FZhx-38He
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 19:52:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=F9CMg7xCCCe7pvWjCkZUtW9tN5r9wm9+9Wqdv/t8aKI=; b=BHndPZwGPTrM215ddveW6SCQGS
	w5XGshZORwCGNkF8wPex0jf0EUyPFK42vLiC8mTGhk+tO6My2wml6VI0EsCSE2x4vzP4RS3RM2FEr
	lIWTKBpIZsjjNZedOqvW17H9D4sdzF7bEHaBbp3kIO9Fn2PrApcD17fPyx+UpKuLfsy3aPWxinpDV
	sDejfX89mi//7BMUyjo+iWwITrIg/kt2sM2gf2XYfhdVtASKmx7bkn3q3toxJm7yAJQLqE2K8M8wi
	7Zz8OhoN0oy5k2OZqqEPYmZInZGg4p53iAQ37QqdvZp1utXGyGhaL8SAv//OBGvF//QTmxqepp7NU
	1/vp9G6Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39804)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vOLYU-000000004SL-1B7L;
	Wed, 26 Nov 2025 19:51:58 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vOLYR-000000001yH-0OLR;
	Wed, 26 Nov 2025 19:51:55 +0000
Date: Wed, 26 Nov 2025 19:51:54 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Xie Yuanbin <xieyuanbin1@huawei.com>, brauner@kernel.org, jack@suse.cz,
	will@kernel.org, nico@fluxnic.net, akpm@linux-foundation.org,
	hch@lst.de, jack@suse.com, wozizhi@huaweicloud.com,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	lilinjie8@huawei.com, liaohua4@huawei.com,
	wangkefeng.wang@huawei.com, pangliyuan1@huawei.com
Subject: Re: [RFC PATCH] vfs: Fix might sleep in load_unaligned_zeropad()
 with rcu read lock held
Message-ID: <aSdaWjgqP4IVivlN@shell.armlinux.org.uk>
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <20251126101952.174467-1-xieyuanbin1@huawei.com>
 <20251126181031.GA3538@ZenIV>
 <20251126184820.GB3538@ZenIV>
 <aSdPYYqPD5V7Yeh6@shell.armlinux.org.uk>
 <20251126192640.GD3538@ZenIV>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126192640.GD3538@ZenIV>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_115210_808756_CD2AAD51 
X-CRM114-Status: GOOD (  23.47  )
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

On Wed, Nov 26, 2025 at 07:26:40PM +0000, Al Viro wrote:
> On Wed, Nov 26, 2025 at 07:05:05PM +0000, Russell King (Oracle) wrote:
> > On Wed, Nov 26, 2025 at 06:48:20PM +0000, Al Viro wrote:
> > > It's been years since I looked at 32bit arm exception handling, so I'd need
> > > quite a bit of (re)RTF{S,M} before I'm comfortable with poking in
> > > arch/arm/mm/fault.c; better let ARM folks deal with that.  But arch/* is
> > > where it should be dealt with; as for papering over that in fs/*:
> > 
> > Don't expect that to happen. I've not looked at it for over a decade,
> > I do very little 32-bit ARM stuff anymore. Others have modified the
> > fault handling, the VM has changed, I basically no longer have the
> > knowledge. Effectively, 32-bit ARM is unmaintained now, although it
> > still has many users.
> 
> Joy...  For quick and dirty variant (on current tree), how about
> adding
> 	if (unlikely(addr > TASK_SIZE) && !user_mode(regs))
> 		goto no_context;
> 
> right after
> 
> 	if (!ttbr0_usermode_access_allowed(regs))
> 		goto no_context;
> 
> in do_page_fault() there?
> 
> NOTE: that might or might not break vdso; I don't think it would, but...

I don't understand how that helps. Wasn't the report that the filename
crosses a page boundary in userspace, but the following page is
inaccessible which causes a fault to be taken (as it always would do).
Thus, wouldn't "addr" be a userspace address (that the kernel is
accessing) and thus be below TASK_SIZE ?

I'm also confused - if we can't take a fault and handle it while
reading the filename from userspace, how are pages that have been
swapped out or evicted from the page cache read back in from storage
which invariably results in sleeping - which we can't do here because
of the RCU context (not that I've ever understood RCU, which is why
I've always referred those bugs to Paul.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

