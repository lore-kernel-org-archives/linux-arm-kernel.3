Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C0ACCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 15:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+WGt0cv6lLjP7TTTzKdDcUwT/Nmru/ATJlKONEKntac=; b=RZ/odua5iB7Yz3BzTU0TVNK8Df
	kLPgF/YNluAXcZ1qQozfLMIjbq8yHpwvBHktcDXz1KetM0W+mer+CPLdsHbcpsjzOgCAIz7Qevb1C
	06o0jN+SdDlfmK+1GIYgPKwV0QzAOiBAvtyIBLtQSSqpELRnJ0leXmL0z+b/iHsmZlV9OqFXyz2NK
	pFOAvq2eTe8dPXPtwCiJmj5Wn7SyxIgFzcE9t6P8BWyLifews2i+SlZS+hjCfFvGN3jDIz/I4l2U6
	bcLXmfn7j4Ku8NHG5F59tKZtOv76XT/cYfb5JjTZwLmtJd1h+zHilhhrp6/Hcn3rxIxZ0FexNUzte
	o7X4S+uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCK5B-00000009rZH-1yb3;
	Fri, 24 Oct 2025 15:52:01 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCK59-00000009rYh-0UwV;
	Fri, 24 Oct 2025 15:52:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=+WGt0cv6lLjP7TTTzKdDcUwT/Nmru/ATJlKONEKntac=; t=1761321119;
	x=1761925919; b=MuiviN58qCK68CjYs4IhYM/Bvl4ezQsb6dZ4gMHzJpkcgRDGn95o0P7HwJeZU
	L8/k7I5zGSonrOZTwuDcMyuipYnG4q0oB8MJ2mH7/a5umcbMwDDdfx/5a7H+Ssxb0mVLaOP/a9q2V
	slzIpLTlZycx/f4+nWB5Oop5wHKOlxtc9ksxZzSpuc3kIWEPClvYYZjWo4vJ52XtXlG6eT/HxvSCW
	Bjk3Rm+v6b71cFHC9f3ZolUdEDq/98ZLF07hyM6jxfpMVuFL3P201MsbGkSJrIk2Xrf9ZXDq+NDz9
	ASg+M4SATDSWnXmTYDwXWaBEqd1eNKi6Bm1odRnMDzvF3xNJ5A==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1vCK55-00000000R61-3t7w; Fri, 24 Oct 2025 17:51:55 +0200
Received: from p5b13aa34.dip0.t-ipconnect.de ([91.19.170.52] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1vCK55-00000000Lvz-2RRr; Fri, 24 Oct 2025 17:51:55 +0200
Message-ID: <1d9f416fd3665faf27841b6305b1e8d661427125.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v3 11/13] x86/xen: use lazy_mmu_state when
 context-switching
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: David Hildenbrand <david@redhat.com>, David Woodhouse
 <dwmw2@infradead.org>,  Kevin Brodsky <kevin.brodsky@arm.com>,
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
Date: Fri, 24 Oct 2025 17:51:54 +0200
In-Reply-To: <9faf750e-2369-4fae-b58a-ed9052cfd6f6@redhat.com>
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
	 <20251015082727.2395128-12-kevin.brodsky@arm.com>
	 <f0067f35-1048-4788-8401-f71d297f56f3@redhat.com>
	 <348e5f1c5a90e4ab0f14b4d997baf7169745bf04.camel@infradead.org>
	 <70723f4a-f42b-4d94-9344-5824e48bfad1@redhat.com>
	 <cbe0d305cce6d76e00b64e7209f15b4645c15033.camel@infradead.org>
	 <fcd7b731d38b256e59edd532e792a00efa4e144e.camel@physik.fu-berlin.de>
	 <9faf750e-2369-4fae-b58a-ed9052cfd6f6@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.170.52
X-ZEDAT-Hint: PO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_085159_684895_D5B179BC 
X-CRM114-Status: GOOD (  16.09  )
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

Hi David,

On Fri, 2025-10-24 at 17:47 +0200, David Hildenbrand wrote:
> > Please have people test kernel changes on SPARC on real hardware. QEMU =
does not
> > emulate sun4v, for example, and therefore testing in QEMU does not cove=
r all
> > of SPARC hardware.
> >=20
> > There are plenty of people on the debian-sparc, gentoo-sparc and sparcl=
inux
> > LKML mailing lists that can test kernel patches for SPARC. If SPARC-rel=
evant
> > changes need to be tested, please ask there and don't bury such things =
in a
> > deeply nested thread in a discussion which doesn't even have SPARC in t=
he
> > mail subject.
>=20
> out of curiosity, do people monitor sparclinux@ for changes to actively=
=20
> offer testing when required -- like would it be sufficient to CC=20
> relevant maintainers+list (like done here) and raise in the cover letter=
=20
> that some testing help would be appreciated?

Yes, that's definitely the case. But it should be obvious that from the sub=
ject
of the mail that the change affects SPARC as not everyone can read every ma=
il
they're receiving through mailing lists.

I'm trying to keep up, but since I'm on mailing lists for many different ar=
chitectures,
mails can slip through the cracks.

For people that want to test changes on SPARC regularly, I can also offer a=
ccounts
on SPARC test machines running on a Solaris LDOM (logical domain) on a SPAR=
C T4.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

