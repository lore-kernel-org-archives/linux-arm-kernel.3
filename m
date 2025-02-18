Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7530C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 20:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0OefYp6gIJsoBkqWu85YVPRb1yh3g60mRPL0+SvOSs=; b=VzXLSEKe7rBdwaMpt6SXnJUZtz
	7tb3d90rIWzPY2o7Xk88YHzhAxN2l/wOX118pUytG0Na2wNCbLg6ILvfcwrzsOJWdthvUXqYC6dJV
	bI3+g0ZPUNwrumaaB3ZdK0g4cx6cwzJPun8XHNWTBBlgHqh3GZJLPJFSDFMvI8rL2CcdBqmZTkaOu
	KHTcDEVbdfwQW9KXUcrB5pevQXwgKkZMb+daANEjC6fepbjFXt6STtMuawhbDnbsPUDYkCwk11dUs
	1f/uXMtBQiZGeG8ayyl8/843et/5EAKODZQQSgP+dcVFpAC4WB5gnWBjJWJ2ui0K2zTYycgZ5vAAW
	zpy7PZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkU0t-00000009j2z-3yZn;
	Tue, 18 Feb 2025 20:16:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTUY-00000009chY-2RLI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 19:42:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E0790A414A0;
	Tue, 18 Feb 2025 19:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637C7C4CEE2;
	Tue, 18 Feb 2025 19:42:44 +0000 (UTC)
Date: Tue, 18 Feb 2025 19:42:42 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Morse <james.morse@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, wangkefeng.wang@huawei.com,
	Guohanjun <guohanjun@huawei.com>
Subject: Re: [PATCH v13 4/5] arm64: support copy_mc_[user]_highpage()
Message-ID: <Z7TisqB5qCIF5nYI@arm.com>
References: <20241209024257.3618492-1-tongtiangen@huawei.com>
 <20241209024257.3618492-5-tongtiangen@huawei.com>
 <Z6zWSXzKctkpyH7-@arm.com>
 <69955002-c3b1-459d-9b42-8d07475c3fd3@huawei.com>
 <Z698SFVqHjpGeGC0@arm.com>
 <e1d2affb-5c6b-00b5-8209-34bbca36f96b@huawei.com>
 <Z7NN5Pa-c5PtIbcF@arm.com>
 <3b181285-2ff3-b77a-867b-725f38ea86d3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b181285-2ff3-b77a-867b-725f38ea86d3@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_114250_744218_E504A3D0 
X-CRM114-Status: GOOD (  27.23  )
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

On Tue, Feb 18, 2025 at 07:51:10PM +0800, Tong Tiangen wrote:
> > > > > 在 2025/2/13 1:11, Catalin Marinas 写道:
> > > > > > On Mon, Dec 09, 2024 at 10:42:56AM +0800, Tong Tiangen wrote:
> > > > > > > Currently, many scenarios that can tolerate memory errors when copying page
> > > > > > > have been supported in the kernel[1~5], all of which are implemented by
> > > > > > > copy_mc_[user]_highpage(). arm64 should also support this mechanism.
> > > > > > > 
> > > > > > > Due to mte, arm64 needs to have its own copy_mc_[user]_highpage()
> > > > > > > architecture implementation, macros __HAVE_ARCH_COPY_MC_HIGHPAGE and
> > > > > > > __HAVE_ARCH_COPY_MC_USER_HIGHPAGE have been added to control it.
> > > > > > > 
> > > > > > > Add new helper copy_mc_page() which provide a page copy implementation with
> > > > > > > hardware memory error safe. The code logic of copy_mc_page() is the same as
> > > > > > > copy_page(), the main difference is that the ldp insn of copy_mc_page()
> > > > > > > contains the fixup type EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR, therefore, the
> > > > > > > main logic is extracted to copy_page_template.S. In addition, the fixup of
> > > > > > > MOPS insn is not considered at present.
> > > > > > 
> > > > > > Could we not add the exception table entry permanently but ignore the
> > > > > > exception table entry if it's not on the do_sea() path? That would save
> > > > > > some code duplication.
[...]
> So we need another way to distinguish the different processing of the
> same exception type on SEA and non-SEA path.

Distinguishing whether the fault is SEA or non-SEA is already done by
the exception handling you are adding. What we don't have though is
information about whether the caller invoked copy_highpage() or
copy_mc_highpage(). That's where the code duplication comes in handy.

It's a shame we need to duplicate identical functions just to have
different addresses to look up in the exception table. We are also short
of caller saved registers to track this information (e.g. an extra
argument to those functions that the exception handler interprets).

I need to think a bit more, we could in theory get the arm64 memcpy_mc()
to return an error code depending on what type of fault it got (e.g.
-EHWPOISON for SEA, -EFAULT for non-SEA). copy_mc_highpage() would
interpret this one and panic if -EFAULT. But we lose some fault details
we normally get on a faulty access like some of the registers.

Well, maybe the simples is still to keep the function duplication. I'll
have another look at the series tomorrow.

-- 
Catalin

