Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F39CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 15:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73Zwdq32M3wvIOvcsImSKjLgygutGdvwi4JFjWo6zTA=; b=Ags32KFd4Jhe30iU6EingYVad0
	tnljFK+y88mL4gn5Ejq5pq64l5aGHxYUVletFcHmGlusaOeUxB9RNpj8ESD6TZvJezfHT6WgMEWqW
	fY8cwD/2UumWL7lMF3tUtzutM0Dz5QE7Za/dKTnLg2WzZnxvURg8SdO9VYa2/SDjYUmzDGixdnsyH
	7eFeIucyz92jZwgoc1YWhQriXse+AXm1td32bve7gLj9ctrbLeh5HT9kXj8KN/mFgswLPaNS6whC2
	9wtahbQUzbiqDMd2arTF7sZ5AhDLbVrcGBHS175ZvRrMl1iiioO5TXtrF9zOSyS2IShMFrmUj7Vp4
	6pfMAwYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJsN-00000009pMS-1ZGw;
	Fri, 24 Oct 2025 15:38:47 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJsI-00000009pIq-1Cvp;
	Fri, 24 Oct 2025 15:38:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=73Zwdq32M3wvIOvcsImSKjLgygutGdvwi4JFjWo6zTA=; t=1761320322;
	x=1761925122; b=pVYdTyYWCLwcvaS/whAgSuxGDOlDkOj0hIBLwMAjQu7ueRxq1U/Mm06SQn0VA
	wrS3+t4eJR1874vkm2WqGKr6YN8AuOr/UQ1IvlAhtz8ZH1CvYAYI7Lh6HrkCAAC0IK5BqH8EgBly5
	VMO/ShjaK4HB2s21TzXf0SRAqbfkZyvK2ZRRg3HdGyqaRWmLkIq3K66HN5m5ITzaAXPNYFuFklQH2
	+ofJSfkldcHxi9fudBHWrn8fjw9u9O368msoGxdi8eEym4ZvtNauX64vX1OYBNh3MUSSr3jfiOuLu
	kSRlnRtWRFSXE3mDZmayIrMIotfsXAUu4AHoyVOs1QcQf5oejw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1vCJs4-00000000MJF-0C1i; Fri, 24 Oct 2025 17:38:28 +0200
Received: from p5b13aa34.dip0.t-ipconnect.de ([91.19.170.52] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1vCJs3-00000000KCV-30QZ; Fri, 24 Oct 2025 17:38:27 +0200
Message-ID: <fcd7b731d38b256e59edd532e792a00efa4e144e.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v3 11/13] x86/xen: use lazy_mmu_state when
 context-switching
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: David Woodhouse <dwmw2@infradead.org>, David Hildenbrand
 <david@redhat.com>,  Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev
 <agordeev@linux.ibm.com>,  Andreas Larsson <andreas@gaisler.com>, Andrew
 Morton <akpm@linux-foundation.org>, Boris Ostrovsky	
 <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>, Catalin
 Marinas	 <catalin.marinas@arm.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>,  Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin"	 <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,  Juergen
 Gross <jgross@suse.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes	 <lorenzo.stoakes@oracle.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>,  Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko
 <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, Nicholas Piggin
 <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Ryan Roberts	
 <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>, Thomas
 Gleixner	 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Will
 Deacon	 <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Date: Fri, 24 Oct 2025 17:38:26 +0200
In-Reply-To: <cbe0d305cce6d76e00b64e7209f15b4645c15033.camel@infradead.org>
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
		 <20251015082727.2395128-12-kevin.brodsky@arm.com>
		 <f0067f35-1048-4788-8401-f71d297f56f3@redhat.com>
		 <348e5f1c5a90e4ab0f14b4d997baf7169745bf04.camel@infradead.org>
		 <70723f4a-f42b-4d94-9344-5824e48bfad1@redhat.com>
	 <cbe0d305cce6d76e00b64e7209f15b4645c15033.camel@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.170.52
X-ZEDAT-Hint: PO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_083844_760380_836BEC9D 
X-CRM114-Status: GOOD (  23.85  )
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

On Fri, 2025-10-24 at 16:13 +0100, David Woodhouse wrote:
> On Fri, 2025-10-24 at 16:51 +0200, David Hildenbrand wrote:
> > On 24.10.25 16:47, David Woodhouse wrote:
> > > On Thu, 2025-10-23 at 22:06 +0200, David Hildenbrand wrote:
> > > > On 15.10.25 10:27, Kevin Brodsky wrote:
> > > > > We currently set a TIF flag when scheduling out a task that is in
> > > > > lazy MMU mode, in order to restore it when the task is scheduled
> > > > > again.
> > > > >=20
> > > > > The generic lazy_mmu layer now tracks whether a task is in lazy M=
MU
> > > > > mode in task_struct::lazy_mmu_state. We can therefore check that
> > > > > state when switching to the new task, instead of using a separate
> > > > > TIF flag.
> > > > >=20
> > > > > Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> > > > > ---
> > > >=20
> > > >=20
> > > > Looks ok to me, but I hope we get some confirmation from x86 / xen
> > > > folks.
> > >=20
> > >=20
> > > I know tglx has shouted at me in the past for precisely this reminder=
,
> > > but you know you can test Xen guests under QEMU/KVM now and don't nee=
d
> > > to actually run Xen? Has this been boot tested?
> >=20
> > And after that, boot-testing sparc as well? :D
>=20
> Also not that hard in QEMU, I believe. Although I do have some SPARC
> boxes in the shed...

Please have people test kernel changes on SPARC on real hardware. QEMU does=
 not
emulate sun4v, for example, and therefore testing in QEMU does not cover al=
l
of SPARC hardware.

There are plenty of people on the debian-sparc, gentoo-sparc and sparclinux
LKML mailing lists that can test kernel patches for SPARC. If SPARC-relevan=
t
changes need to be tested, please ask there and don't bury such things in a
deeply nested thread in a discussion which doesn't even have SPARC in the
mail subject.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

