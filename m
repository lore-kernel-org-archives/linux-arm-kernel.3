Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE47D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 08:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5Hf/oCoaC+bmr5nJVcUOjG4GACNlaY1TCA6/nmAPjE=; b=1WZzQteGywkYlIx9AzqxcNM17H
	Pr01DwS1y7FQCF8fK3sLzbZz+MLE20F1IizdjwPI75seWON5soeTizRsRwc3rLw0uWTSHJDltUhhE
	PVQICDb2RSgNTEIhcX/4apT8iQaTeyUeLSphP1BqKThAZUBr8JuLp211WEMQ59JmGKoA4PvrXMQJb
	s7hiEBJXHKx8ZhAqhQeklOdhfT6Ezur1FkJmE94FQCYuWKD1Q2xGj5vmZVaB6ebXS5SC/d6hG2bRO
	Cu+ipMKIzVA4xdPYNI3lC9ULdje06AlPV0r3DYPsKhvfmRvMdSVTQ++HwLyuHCmaTXUvarKt8EUCU
	T1H2e4Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPGik-00000001P4U-06c0;
	Sat, 29 Nov 2025 08:54:22 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPGih-00000001P44-1xHl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 08:54:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=N5Hf/oCoaC+bmr5nJVcUOjG4GACNlaY1TCA6/nmAPjE=; b=PTjftmI8M0fFYykNkkoVgNwvZe
	sRl0yPdorZlBO7dqb9b2+56JO6cvDqq+27j4S4lAbjt0IfK906dSV0JHKIF6oUAcZh7F+1I9OXyXN
	6yRPprKZfRAggthT4NsG5xgCJhC8j4GQ9Y0hCbf/btIVPJ7aUN2sWaFQ1aXkZrmx7iSZU4M6KA5i1
	VpjlZA9tKeXauh5uTQb1RaTc10dAEnvXoJRgc3j3+Qj591X0teehEUGcHrjh3OQWbF6S0017Ao1VM
	/Vau/quGQchFyHIe6X16LLSWuE5UEd5iDmwgbHYeivqdZVuX9//YAH6hMECm1fPh6ioRSJEV6mVbY
	teD+rj7Q==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vPGid-00000007Cs0-3WJq;
	Sat, 29 Nov 2025 08:54:15 +0000
Date: Sat, 29 Nov 2025 08:54:15 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Zizhi Wo <wozizhi@huaweicloud.com>,
	"Russell King (Oracle)" <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, jack@suse.com, brauner@kernel.org,
	hch@lst.de, akpm@linux-foundation.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	yangerkun@huawei.com, wangkefeng.wang@huawei.com,
	pangliyuan1@huawei.com, xieyuanbin1@huawei.com
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger
 sleep in RCU context
Message-ID: <20251129085415.GJ3538@ZenIV>
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <33ab4aef-020e-49e7-8539-31bf78dac61a@huaweicloud.com>
 <CAHk-=wh1Wfwt9OFB4AfBbjyeu4JVZuSWQ4A8OoT3W6x9btddfw@mail.gmail.com>
 <aSgut4QcBsbXDEo9@shell.armlinux.org.uk>
 <CAHk-=wh+cFLLi2x6u61pvL07phSyHPVBTo9Lac2uuqK4eRG_=w@mail.gmail.com>
 <3d590a6d-07d1-433c-add1-8b7d53018854@huaweicloud.com>
 <CAHk-=wjA20ear0hDOvUS7g5-A=YAUifphcf-iFJ1pach0=3ubw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjA20ear0hDOvUS7g5-A=YAUifphcf-iFJ1pach0=3ubw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_005419_506604_CCE1EBD9 
X-CRM114-Status: GOOD (  15.45  )
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

On Fri, Nov 28, 2025 at 05:35:37PM -0800, Linus Torvalds wrote:
> On Fri, 28 Nov 2025 at 17:01, Zizhi Wo <wozizhi@huaweicloud.com> wrote:
> >
> > Thank you for your answer. In fact, this solution is similar to the one
> > provided by Al.
> 
> Hmm. I'm not seeing the replies from Al for some reason. Maybe he didn't cc me.

<checks>
Sorry, I thought you've been somewhere in that Cc, should've verified that.

> That said, somebody should  definitely double-check me - because I
> think arm also did the vdso trick at high addresses that i386 used to
> do, so there is the fake VDSO thing up there.
> 
> But if you get a page fault on that, it's not going to be fixed up, so
> even if user space can access it, there's no point in looking that
> fake vm area up for page faults.

gate_vma is not inserted anywhere - it's special-cased in coredump_next_vma(),
proc_get_vma() and get_gate_page(); none of that can lead to insertion.

AFAICS its uses in mlock_fixup(), __mmap_complete() and should_skip_vam()
are pure paranoia - "if we somehow ended up running into gate_vma, let's
make sure we don't screw it over" and had always been that way.

So VMA lookup would get NULL.

