Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F9AC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 17:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wsOhJNavEVEuHUNn8/mtc0ydZ43wJ+QIoNT3mULk4c=; b=ARIePuK58CKAVCgk+Tt1ynzMqq
	EDUBtZZhvzjKLQbk2tUv/ohEajVcq8eYy9Fic01UflS1/rGPyKOXY4Il3tddsJoU10n+WVn+1XFUv
	RQItV4oc3ccH7AcFId8qvjjVcsT1P4up+CBgJGb4RjNg6emysMRcQp7ShH79hjVHJTdvVC9k+R/gs
	pw3WdE6XPdjt5Xfuipv280fCqHupjJWbd6BBqoHJO98JunV1Db9ut9LiDYjyT5VZ5wi+7LWKwAo+D
	AgmXw9jh4nHbDI4fHvodkw77+Af3GBb2dOpgsjfR70Ytm2nRVPGywsfK+qj42SwBfEe8uAOVVNKXz
	0kkXEJiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thXTS-00000000hYB-0bZo;
	Mon, 10 Feb 2025 17:21:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thXCE-00000000dXr-3p2M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 17:03:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+wsOhJNavEVEuHUNn8/mtc0ydZ43wJ+QIoNT3mULk4c=; b=XbKdGlGWuizr2h7RV/h79Av8MM
	aR4qmyE1fVtaYDu3Bj8krer6Rd/NSQ6Qxp1vHqtgtl3tQMVmT1HrLhpChYVg3y06xd5h0+dqSAV09
	TQsGsGt2GiLTnVZFY0zGdBVVJJJT7v+jSGkXmShySJOLtYDFonVQcat/Mw0woyvOYw9qmxnXSbF3L
	Wth9UukiCC/6b35SraYEhitr2oWwLyKRcoiOwbtCwxMpOvUybau89/GWfDHEtP4Cnzz8kXdEEt01l
	KjY6ZB5mcGf/SbolVWl7unte/pptLl/xUde8eifncaUtAz4FvegzywhAB1K1g61mrFKs72HVKRtyV
	ZZy5BWIw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45040)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1thXBn-0007bE-0v;
	Mon, 10 Feb 2025 17:03:19 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1thXBh-0007ej-0r;
	Mon, 10 Feb 2025 17:03:13 +0000
Date: Mon, 10 Feb 2025 17:03:13 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ezra Buehler <ezra@easyb.ch>
Subject: Re: [REGRESSION] NULL pointer dereference on ARM (AT91SAM9G25)
 during compaction
Message-ID: <Z6oxUdrVBPd5ZTEu@shell.armlinux.org.uk>
References: <CAM1KZSmZ2T_riHvay+7cKEFxoPgeVpHkVFTzVVEQ1BO0cLkHEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAM1KZSmZ2T_riHvay+7cKEFxoPgeVpHkVFTzVVEQ1BO0cLkHEQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_090346_942895_6080C539 
X-CRM114-Status: GOOD (  11.18  )
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
Cc: linux-arm-kernel@lists.infradead.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Matthew Wilcox <willy@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, David Hildenbrand <david@redhat.com>, open list <linux-kernel@vger.kernel.org>, Muchun Song <muchun.song@linux.dev>, Hugh Dickins <hughd@google.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, Peter Xu <peterx@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, "Mike Rapoport \(Microsoft\)" <rppt@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Feb 10, 2025 at 05:49:38PM +0100, Ezra Buehler wrote:
> When running vanilla Linux 6.13 or newer (6.14-rc2) on the
> AT91SAM9G25-based GARDENA smart Gateway, we are seeing a NULL pointer
> dereference resulting in a kernel panic. The culprit seems to be commit
> fc9c45b71f43 ("arm: adjust_pte() usepte_offset_map_rw_nolock()").
> Reverting the commit apparently fixes the issue.

The blamed commit is buggy:

arch/arm/include/asm/tlbflush.h:
#define update_mmu_cache(vma, addr, ptep) \
        update_mmu_cache_range(NULL, vma, addr, ptep, 1)

So vmf can be NULL. This didn't used to matter before this commit,
because vmf was not used by ARM's update_mmu_cache_range(). However,
the commit introduced a dereference of it, which now causes a NULL
point dereference.

Not sure what the correct solution is, but at a guess, both:

	if (ptl != vmf->ptl)

need to become:

	if (!vmf || ptl != vmf->ptl)

but I haven't checked wha tthe locking context actually is here
(I've been out of MM stuff too long to know this off the top of my
head.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

