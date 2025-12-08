Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E906D3B7E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 10:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2q3qIpB2rZdmxgNfQrdMX7fXgjlUn1FNnbk0gfok3I=; b=1MqkXhfKXLzdGbYPXLVdQUGKsq
	z86kO4nm56NmYlcmmrdJHQ0ICb6y2I7y+cDebLeocDJ7Wi4zyGdknugKHindMAbQXyiOQ+7ezivSI
	NaETiWZG9nn0xUSU0zPWicnObpCsKgTZ2FyBtpbn2+RTzI8oLiFEH7Z2bneu1Tx2aYD/mYaCDPCAM
	gxeuMZeNOxHqAw41b5SnQ4XD6RzT5T/Ri8YsT7SduATgrdvYolMSRkjqa7LntiD2w0TBhUS8Fgu2+
	O/m+Wv7FGF0jmNAY6oXcvYzpydyfrzFpT+UWYTJHy9O3OZ0MfIt9mjq4iEC3zZjWO0XUYVzwQt82c
	dqw1XbnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSY9c-0000000Cvf8-0FNL;
	Mon, 08 Dec 2025 10:07:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSY9Z-0000000CveZ-02vG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 10:07:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=T2q3qIpB2rZdmxgNfQrdMX7fXgjlUn1FNnbk0gfok3I=; b=Yq1FcK78y3w6nkgHfG8T/MDxrk
	IxPuchTO5iIOBoYJahU8xB/t/TBjpRAjm/4AFYdSRl6UIeQ11DcKzstMyYC6itiWWr6tdIPLP5Y7H
	oqkVhHPMfM+F4oWLKsC9B0VaLXpMAwRhWiAV1s4LEV2C3JSjEkHE7Kgc003Hh1bBk4X6AkWRoEpVW
	oT+77Xz6SycoycRX1c0LeynFqnbm7G1n5TtAHY42t4W9I1dP7Iese3Pe5JIL2yvuHdlvtUE0NKd53
	Oe9oqVQJa7G5XePlJlodhUKIs/7elRd9CSi08xcHHqeO66+yWWWAe3BmmTNtZmFjbpOl1VDVCQCzB
	svgD+L+w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48358)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vSY9S-000000007bR-0fW9;
	Mon, 08 Dec 2025 10:07:30 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vSY9N-000000004vY-2kGQ;
	Mon, 08 Dec 2025 10:07:25 +0000
Date: Mon, 8 Dec 2025 10:07:25 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: viro@zeniv.linux.org.uk, akpm@linux-foundation.org, brauner@kernel.org,
	catalin.marinas@arm.com, hch@lst.de, jack@suse.com,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	pangliyuan1@huawei.com, torvalds@linux-foundation.org,
	wangkefeng.wang@huawei.com, will@kernel.org,
	wozizhi@huaweicloud.com, yangerkun@huawei.com
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger
 sleep in RCU context
Message-ID: <aTajXdAVYh9qJI6B@shell.armlinux.org.uk>
References: <aTLLLuup7TeAqFVL@shell.armlinux.org.uk>
 <20251208023206.44238-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208023206.44238-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_020737_077003_51F60120 
X-CRM114-Status: GOOD (  21.51  )
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

On Mon, Dec 08, 2025 at 10:32:06AM +0800, Xie Yuanbin wrote:
> On Fri, 5 Dec 2025 12:08:14 +0000, Russell King wrote:
> > Right, let's split these issues into separate patches. Please test this
> > patch, which should address only the hash_name() fault issue, and
> > provides the basis for fixing the branch predictor issue.
> 
> I conducted a simple test, and it seems that both the hash_name()
> might sleep issue and the branch predictor issue have been fixed.

This isn't entirely fixed. A data abort for an alignment fault (thus
calling do_alignment()) will enable interrupts, and then may call
do_bad_area(). We can't short-circuit this path like we can with
do_page_fault() as alignment faults from userspace can be valid for
the vectors page - not that we should see them, but that doesn't mean
that there isn't something in userspace that does.

> BTW, even with this patch, test cases may still fail. There is another
> bug in hash_name() will also be triggered by the testcase, which will be
> fixed in this patch:
> Link: https://lore.kernel.org/20251127025848.363992-1-pangliyuan1@huawei.com

That patch got missed - I'm notoriously bad at catching every email.
There's just way too much email coming in.

> Test case is from:
> Link: https://lore.kernel.org/20251127140109.191657-1-xieyuanbin1@huawei.com
> 
> Test in commit 6987d58a9cbc5bd57c98 ("Add linux-next specific files for
> 20251205") from linux-next branch.
> 
> I still have a question about this patch: Is 
> ```patch
> +		if (interrupts_enabled(regs))
> +			local_irq_enable();
> ```
> necessary? Although this implementation is closer to the original code,
> which can reduce side effects, do_bad_area(), do_sect_fault(),
> and do_translation_fault() all call __do_kernel_fault() with interrupts
> disabled.

It's to keep the behaviour closer to the original as possible, on the
principle of avoiding unnecessary behavioural changes to the code. As
noted above, do_bad_area() can be called with interrupts enabled.

Whether RT folk would be happy removing that is a different question,
given that they want as much of the kernel to be preemptable.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

