Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471D9CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 09:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uo8TBg8AtxzlOE4Yqx7kavPid3wS0PC/nG9PfSHZKxs=; b=Sl/VXcjehCWJflTdovYFzjZPTz
	exshAxI2VLD67cO+i3UokBYSAATRnRw/O0k2LQ8CAzlXcXuwHMP1Py4CZVZf+1nodeNc4wOO0fGOi
	0u41wf5GKb5oUTngjBUV1rj8U4B7rZGMFXxRGCb151rrGIyq/1ngimr3KscELbTP7e82cbCrsOglM
	J8ewxjbcU4zupRkt/a659mNad8ThPc9eb0XVAxzqNAlONpNGu0LcC9CoOjImTnJ1d1G7MLerIie3K
	aD1Rx4kWVkgPkxwOAVm/iV6OAo8/1G128eVhJjO3wGSMx6igEmTG+i+84SVkle4VQzYD5zqr6W+5x
	wyNij6Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPHVa-00000001RDh-36Qp;
	Sat, 29 Nov 2025 09:44:50 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPHVW-00000001RDG-3K5P
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 09:44:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Uo8TBg8AtxzlOE4Yqx7kavPid3wS0PC/nG9PfSHZKxs=; b=WdQujMwngoaiotKE+sjfTEDix5
	/Quh6v3dAOZbKwpiPRmLYx/4yq+iMPUTybuIxveIGsrIk9ol/Pwww2I6MKFzY9/8bfk5KC9gvcxlJ
	+XI3SdRUCbwXwlTUuxNp4Nssse82eDUiCkIRhOxgRrdnjJJ1nLFoXEuKXjIQtr+/z152+d0nhkZbV
	NMeLLVqYZSe2YuFhUS0OEmOm50coh4aYAoV2OlrFIZlICaBRiN2AX66N1ci9LOUKXUn0WTkKBJpBx
	vWjAt7xOnJlyU4zU5+O3ctln5KTWQG8AXSGsbGXZvUeB7266YsqjJelIwqS4mTr5vMv5iHIN6lym+
	pwkRJgvw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vPHVY-00000008MI2-2f73;
	Sat, 29 Nov 2025 09:44:48 +0000
Date: Sat, 29 Nov 2025 09:44:48 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: will@kernel.org, linux@armlinux.org.uk, bigeasy@linutronix.de,
	rmk+kernel@armlinux.org.uk, akpm@linux-foundation.org,
	brauner@kernel.org, catalin.marinas@arm.com, hch@lst.de,
	jack@suse.com, linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, pangliyuan1@huawei.com,
	wangkefeng.wang@huawei.com, wozizhi@huaweicloud.com,
	yangerkun@huawei.com, lilinjie8@huawei.com, liaohua4@huawei.com
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger
Message-ID: <20251129094448.GL3538@ZenIV>
References: <20251129090813.GK3538@ZenIV>
 <20251129092545.5181-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251129092545.5181-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_014448_293020_3ACF309C 
X-CRM114-Status: GOOD (  20.70  )
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

On Sat, Nov 29, 2025 at 05:25:45PM +0800, Xie Yuanbin wrote:
> On Sat, 29 Nov 2025 09:08:13 +0000, Al Viro wrote:
> > On Sat, Nov 29, 2025 at 12:08:17PM +0800, Xie Yuanbin wrote:
> >
> >> I think the `user_mode(regs)` check is necessary because the label
> >> no_context actually jumps to __do_kernel_fault(), whereas page fault
> >> from user mode should jump to `__do_user_fault()`.
> >>
> >> Alternatively, we would need to change `goto no_context` to
> >> `goto bad_area`. Or perhaps I misunderstood something, please point it out.
> >
> > FWIW, goto bad_area has an obvious problem: uses of 'fault' value, which
> > contains garbage.
> 
> Yes, I know it, I just omitted it. Thank you for pointing that out.
> 
> > or
> > 	if (unlikely(addr >= TASK_SIZE)) {
> > 		fault = 0;
> > 		code = SEGV_MAPERR;
> > 		goto bad_area;
> > 	}
> 
> In fact, I have already submitted another patch, which is exactly the way
> as you described:
> Link: https://lore.kernel.org/20251127140109.191657-1-xieyuanbin1@huawei.com
> 
> The only difference is that I will move the judgment to before
> local_irq_enable(). The reason for doing this is to fix another bug,
> you can find more details about it here:
> Link: https://lore.kernel.org/20250925025744.6807-1-xieyuanbin1@huawei.com
> Link: https://lore.kernel.org/20251129021815.9679-1-xieyuanbin1@huawei.com

AFAICS, your patch does nothing to the case when we hit kernel address from
kernel mode, which is what triggers that "block in RCU mode for no good reason"
fun...

