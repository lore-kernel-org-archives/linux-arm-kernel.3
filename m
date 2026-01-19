Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E5ED29C46
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uw6KihBC1TRdvi5ZGo68c20jmI6Js3ekwsf6FSSvJdY=; b=db+DaMScuWiZ3m7aZDo2QOBjH0
	bFvHYsoar2mqrOrGYTjkBiiqORvPU/vqBwyLbo13EW7bR26iJS2Kcr3wcof+N7zpX61i5+qrPp5iw
	nJrvRKJ6S6XQMBZ5NSdq9WVQJP2DHnwgWL/4hDj68IYn9hlaMkO9bUL68LmhYFZa0A+KpaMu7+Y7+
	v5cLBhuYIdphOrC5/k+XhMUiRi5g0hWsUyL+67BCVRfAtXOEpZMi4jVM7N6c2bXVPw9KYvs89UXtD
	P4vZSgwtAKu+8IY+ejeew7hAFuCgyED4c9UhTOJSatTHMbJ6BZBBpq9jBxW/zK1sNSFODViSwWfVT
	8byQOZcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsMX-00000002XKd-4AXJ;
	Mon, 19 Jan 2026 16:44:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsMX-00000002XKP-0Icb;
	Mon, 19 Jan 2026 16:44:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 22A0760054;
	Mon, 19 Jan 2026 16:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B80FAC116C6;
	Mon, 19 Jan 2026 16:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768841059;
	bh=16FGOoiet4+IrVT+FcqrHcvY6YUTC0QcugfuzrxpDdk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=q0tAOJQSpR4lAPo9D9a0ZLzj9fmk4VEFSuwyHRGgr6m2/2bnlj2msqm1OK35ZA72i
	 BsoEW2Hi1Kd0mpXDYPCuFTDERjp9sFatntALxM7RaexoblAcWHEgiVDgn5GR/Cfhs5
	 lJ+7nmPuUhjsYr7LMg0JLovICzoM9fTlHD0eazCWxNpHY+vxS6kc8rz0ZKG0d1VEWg
	 IIhlCXiVHIe0pBTCOoVEENtJxJ+QEakuwJKi7yA2fm+eSBFbxX2gEsdDI8+DoA1Vyk
	 WSTb5IyXokPQcIaRg69SRVfbN0PLcfWUE2soFEJxCYrdO9X8LHmJmpvUejzzI3uzi8
	 2/W6/Js/SDGRw==
Date: Mon, 19 Jan 2026 08:44:17 -0800
From: Kees Cook <kees@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Mark Rutland <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Ard Biesheuvel <ardb@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 David Laight <david.laight.linux@gmail.com>
CC: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_0/3=5D_Fix_bugs_and_perfo?=
 =?US-ASCII?Q?rmance_of_kstack_offset_randomisation?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20fb97f1-7e50-485a-bdfd-a2901d20ec84@intel.com>
References: <20260119130122.1283821-1-ryan.roberts@arm.com> <20fb97f1-7e50-485a-bdfd-a2901d20ec84@intel.com>
Message-ID: <C502BCE6-2FB2-4A06-93A8-E8DEDFC22914@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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



On January 19, 2026 8:00:00 AM PST, Dave Hansen <dave=2Ehansen@intel=2Ecom=
> wrote:
>On 1/19/26 05:01, Ryan Roberts wrote:
>> x86 (AWS Sapphire Rapids):
>> +-----------------+--------------+-------------+---------------+
>> | Benchmark       | Result Class |   v6=2E18-rc5 | per-task-prng |
>> |                 |              | rndstack-on |               |
>> |                 |              |             |               |
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
>> | syscall/getpid  | mean (ns)    |  (R) 13=2E32% |     (R) 4=2E60% |
>> |                 | p99 (ns)     |  (R) 13=2E38% |    (R) 18=2E08% |
>> |                 | p99=2E9 (ns)   |      16=2E26% |    (R) 19=2E38% |
>
>Like you noted, this is surprising=2E This would be a good thing to make
>sure it goes in very early after -rc1 and gets plenty of wide testing=2E

Right, we are pretty late in the dev cycle (rc6)=2E It would be prudent to=
 get this into -next after the coming rc1 (1 month from now)=2E

On the other hand, the changes are pretty "binary" in the sense that mista=
kes should be VERY visible right away=2E Would it be better to take this in=
to -next immediately instead?

>But I don't see any problems with the approach, and the move to common
>code looks like a big win as well:

Agreed; I think it's looking great=2E

--=20
Kees Cook

