Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C4AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 12:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YY9Ny37WV/e8XNd3tcZJEJMvfANE4ZRS8J1X5XId050=; b=LZH7bhYSzOGLDjlI/2E2qeZO3O
	bY0wG2bCINXky1lR7tqZCijUBgQYmn4h1g9s+IN3QBFp8l4YGM/gJCDiGhk7AWSwBlsmBN7HHrPwv
	2AwNhU5pP5doxDhDf0Tl5UGttEdJJBgfnE5msK0KeLF+v/Mcb09kB9nbfrCxkmkU14I0Wp4Osae5L
	UyrIL1pOa0/EiARKRV6x/ZkicpurexUVqhcW/racA/gh4CjWZIwQirsSbiLYxRQCoNFEX70k+bGhq
	pIahNLiau9APPWZtBZi7DEBrcmOn7xRPcyqQKRQVqKVzCkHLfgGAGYr10+0QEXFHqlK8OuNxbKSVp
	2MFfJ6TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM4LX-00000003eDn-0seM;
	Fri, 13 Dec 2024 12:00:39 +0000
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM4KQ-00000003e7I-3lfu;
	Fri, 13 Dec 2024 11:59:32 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 9DEE31140216;
	Fri, 13 Dec 2024 06:59:26 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Fri, 13 Dec 2024 06:59:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1734091166; x=
	1734177566; bh=YY9Ny37WV/e8XNd3tcZJEJMvfANE4ZRS8J1X5XId050=; b=t
	QgxBTJ7cI21MODHm5IIhsr9qQzk4lUA0CTYP4QXEFNOgSxelQHeakjL+MZkdtoSw
	ld7ieKDSHQKVUZJ03hzJ1b4ApDYLShIMZ2/1sQ/07AmlG+/WqCEIkwmJUoSMVuxf
	lE46e4YNbqvpRzK3Er+9gVFjHXCmcI/Iz9vdMIMZzJ5Pfp2+AGW0GcYY+JO+0I9o
	7dU1+wSufBh8U149cRZAVjGaNfVF2qwDh0zkYs5V0v8aojQaYlLgh3BH64mtDwF/
	Uz9OV+qisQPQj1ovy5JQlHG2I0+RDihEkEcY7wqnEPtcDixc/fDiAk7EwCiEBz+u
	k9wr+T8lfG2rdpxyIFU/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1734091166; x=1734177566; bh=YY9Ny37WV/e8XNd3tcZJEJMvfANE4ZRS8J1
	X5XId050=; b=uHJTAYSvYyol+OslkmlWVtjJxWlbd6yvuoAI+aLInxA51QCTJ+w
	0zgUiCFT5M3BkYay9NetzJ9vIKz8Rgl4jPugaEXY/7MwiWU7Q95moFYBNktPp7Rs
	xLlTMyq/0meVG4P6x3w9OSnouLbB8Y0UYi728bJ/WluPkeYT1sg/U3guL9ZMu0Q1
	u/9lOFirZb5EHkekq8HhWCU5T/4ueLYsdvKMuTEO4Jk1GnLUFMMjQuZimGTCLc1e
	8ygE0yPAtfa9FCxYhHauPrTfHoVE0az+9tm3UXC0TUEZz96zvov/NErDhXTU/AIW
	xOySIUmbdP6OPjtwdgpo9amPsZsKG3KOylg==
X-ME-Sender: <xms:nCFcZ9jwvYrdqGJY5AXoELdLaHGuUUfWoHHb7qyvrcs7otL--F9zcQ>
    <xme:nCFcZyC4V1hIWZSgfKWznAW135Kb86FiCIDfn-3_TTYBrClnjPMAFz_QtuZbIpiU-
    5pL5JxhyYjwld8sO4g>
X-ME-Received: <xmr:nCFcZ9F9puHXqz8UHyPic35ImT0xh5322Wrg0RuDrW1285oZXBluiCDQENsEoz8MWdodpA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkeejgdefgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdfstddttddvnecu
    hfhrohhmpedfmfhirhhilhhlucetrdcuufhhuhhtvghmohhvfdcuoehkihhrihhllhessh
    hhuhhtvghmohhvrdhnrghmvgeqnecuggftrfgrthhtvghrnhepffdvveeuteduhffhffev
    lefhteefveevkeelveejudduvedvuddvleetudevhfeknecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirhhilhhlsehshhhuthgvmhhovhdr
    nhgrmhgvpdhnsggprhgtphhtthhopeeftddpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepthhhohhmrghsrdhlvghnuggrtghkhiesrghmugdrtghomhdprhgtphhtthhopehk
    ihhrihhllhdrshhhuhhtvghmohhvsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpth
    htohepsghpsegrlhhivghnkedruggvpdhrtghpthhtohepthhglhigsehlihhnuhhtrhho
    nhhigidruggvpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtohhmpdhrtghpth
    htohepuggrvhgvrdhhrghnshgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphht
    thhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhphgrseiihihtohhrrd
    gtohhmpdhrtghpthhtoheplhhuthhosehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:nCFcZyTEfCh21EnlTiPrK6G66zjhnkSICcPVJ5yGL_XX7CPK1LepTg>
    <xmx:nCFcZ6yfy5onCbvtfbE9MjEOnuFY59LeQraVqzy6cMwh2dZO7nNzwQ>
    <xmx:nCFcZ44gnrVsQRUU0evquTZE4W0t006Zwd1VWEzwQw8dmXJ7O69QwA>
    <xmx:nCFcZ_wBGf8yVd5DPOy-M9IiNQcdKezDc7xTboVD_T-5GwLBVrORwA>
    <xmx:niFcZz8dofWI4yELC61Xl2mY9kvqAIng5IyYovyCZ3-xyAvp6G73usVl>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Dec 2024 06:59:15 -0500 (EST)
Date: Fri, 13 Dec 2024 13:59:12 +0200
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 	Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 	Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 	Albert Ou <aou@eecs.berkeley.edu>, Alexei Starovoitov <ast@kernel.org>,
 	Andrea Parri <parri.andrea@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 	Daniel Borkmann <daniel@iogearbox.net>,
 Eric Chan <ericchancf@google.com>, 	Jason Gunthorpe <jgg@ziepe.ca>,
 Kai Huang <kai.huang@intel.com>,
 	Kefeng Wang <wangkefeng.wang@huawei.com>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 	Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 	Russell King <linux@armlinux.org.uk>,
 Samuel Holland <samuel.holland@sifive.com>,
 	Suren Baghdasaryan <surenb@google.com>, Yuntao Wang <ytcoode@gmail.com>,
 	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	Ashish Kalra <ashish.kalra@amd.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCHv2 2/2] x86/mm: Make memremap(MEMREMAP_WB) map memory as
 encrypted by default
Message-ID: <myzpconz5z7xf4j7fnofb5zgxv7fc3evxhcys6wnqlao2c3xkj@aoapggj7lchq>
References: <20241021105723.2707507-1-kirill.shutemov@linux.intel.com>
 <20241021105723.2707507-3-kirill.shutemov@linux.intel.com>
 <20241118164616.GAZztvWGs9cOV8t20_@fat_crate.local>
 <s4frmqwtuvclinuu7ttyzfpe7bj7hju5xgt6sxzy3gyt3prr62@rrgvhkv4lgwv>
 <20241121114952.GCZz8eYEVa3yubYQzO@fat_crate.local>
 <bz3vlh3lri7yfckdkddopwhsgvkmizhw5q6ecomgeba7q22ufp@ntu2kugiho4o>
 <079cb87c-78aa-5fb5-b28f-e7a54e51aa78@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <079cb87c-78aa-5fb5-b28f-e7a54e51aa78@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_035931_631123_F6DD286D 
X-CRM114-Status: GOOD (  38.31  )
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

On Thu, Dec 12, 2024 at 08:23:07AM -0600, Tom Lendacky wrote:
> On 12/10/24 07:26, Kirill A. Shutemov wrote:
> > On Thu, Nov 21, 2024 at 12:49:52PM +0100, Borislav Petkov wrote:
> >> On Tue, Nov 19, 2024 at 10:21:05AM +0200, Kirill A. Shutemov wrote:
> >>> Sure, we can workaround every place that touches such ranges.
> >>
> >> Every place? Which every place? I thought this is only an EISA issue?
> > 
> > I looked at other places where we call memremap(MEMREMAP_WB) such as
> > acpi_wakeup_cpu(). We actually get encrypted/private mapping for this
> > callsite despite __ioremap_caller() being called encrypted == false.
> > This happens because of IORES_MAP_ENCRYPTED check in __ioremap_caller().
> > 
> > So we depend on the BIOS here. The EISA problem happens because the
> > target memory is in !IORES_MAP_ENCRYPTED memory.
> > 
> > It's hard to say if any other memremap(MEMREMAP_WB) would trigger the
> > issue. And what will happen after next BIOS update.
> > 
> >> Then clearly your changelogs need to expand considerably more what we're
> >> *really* addressing here.
> >>
> >>> Or we can address problem at the root and make creating decrypted/shared
> >>> mappings explicit.
> >>
> >> What is the problem? That KVM implicitly converts memory to shared? Why does
> >> KVM do that an can it be fixed not to?
> >>
> >> Doesn't sound like the guest's problem.
> > 
> > Well, the problem is on the both sides.
> > 
> > VMM behaviour on such accesses is not specified in any spec. AFAIK all
> > current VMM implementations do this implicit conversion.
> > 
> > I think it has to be fixed. VMMs (not only KVM) should not silently
> > convert memory to shared. But VMMs cannot make memory access to go away.
> > The only option they have is to inject #VE instead indicating bogus
> > access. At this point it becomes a guest problem.
> > 
> > It will get fixed in VMMs naturally when TDX Connect gets enabled.
> > With a secure device assigned to a TD, VMM would loose the ability to
> > convert memory on its own. The guest would have to unlock the memory
> > first. This will make implicit conversion impossible.
> > 
> > But it also means guest should never initiate shared access without
> > explicit conversion. Otherwise #VE will crash it.
> > 
> >> Or maybe this needs a lot more explanation what we're fixing here.
> >>
> >>> Such mappings have both functional (as we see here) and security
> >>> implications (VMM can manipulate the guest memory range). We should not
> >>> create decrypted mappings by default on legacy interfaces.
> >>
> >> So we're getting closer.
> >>
> >> The changes themselves are fine but your text is missing a lot about what
> >> we're fixing here. When I asked, I barely scratched the surface. So can we
> >> elaborate here pls?
> > 
> > What about this:
> > 
> > x86/mm: Make memremap(MEMREMAP_WB) map memory as encrypted by default
> > 
> > Currently memremap(MEMREMAP_WB) can produce decrypted/shared mapping:
> > 
> > memremap(MEMREMAP_WB)
> >   arch_memremap_wb()
> >     ioremap_cache()
> >       __ioremap_caller(.encrytped = false)
> 
> That's because try_ram_remap() invokes arch_memremap_can_ram_remap()
> which is returning false (for some reason).

In EISA case try_ram_remap() is not called. is_ram is REGION_DISJOINT

> When arch_memremap_can_ram_remap() returns false, ioremap_cache() is
> invoked. ioremap() should provide shared mappings unless specifically
> requested to provide an encrypted mapping (via encrypted parameter) or
> if __ioremap_check_mem() determines that an encrypted mapping is needed.

I don't propose changing ioremap() behaviour. It's about memremap().

> Can logic be added to arch_memremap_can_ram_remap() to return true for
> the cases that TDX is having issues with?

It will not help EISA case, because we don't get this path.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

