Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC1CCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 06:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqw2+O+mVDNPJ/nRjjaLMabjywvg9mGe6YTrHOWMIJg=; b=jHJZbUdOq/aA/LSjJD3nz7xutX
	TOnZ7DGgQ76fCNmG4AtmbTNCrjfvUkV4FEWMcl/AuQk3rN2+6Ki8aJv6QFBNBJhn2hIRv3+GI3a+L
	iZvCLMcxhcuSBcnnWvJ+oLfRme3czMpyI6wNffxVifUQfmYyjta/wqAZNac58UMwuni32SC7X9EVT
	fIe8yKmbQRYQZLH4/ILVj9en/nuEsdQ/5PwuGdPydFvgWIqWLNCRK07v0ezoFPO9e67XeZPTOYn5K
	PeMElK4PKcjgoHYvYfxuR5WplZCIKMnfWfrQ2qoonkTvt0FkZO4F+nFBCWrvmpRuTxP2GS8G9gQil
	1SSUu5Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usySY-0000000BNUi-2udz;
	Mon, 01 Sep 2025 06:56:10 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usyFo-0000000BLzE-2td6;
	Mon, 01 Sep 2025 06:43:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4140743A5E;
	Mon,  1 Sep 2025 06:42:52 +0000 (UTC)
Message-ID: <f7d55c91-8877-41aa-8cf0-64af38a9a109@ghiti.fr>
Date: Mon, 1 Sep 2025 08:42:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] kexec: Fix invalid field access
To: Breno Leitao <leitao@debian.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
 Coiby Xu <coxu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 kernel-team@meta.com
References: <20250827-kbuf_all-v1-0-1df9882bb01a@debian.org>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250827-kbuf_all-v1-0-1df9882bb01a@debian.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduledugeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeejkeeugfdthefhveelffdvgeetgeelteeijeekheehfeevtdduvdfgteevgfehffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhinhhfrhgruggvrggurdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemkeehrgekmeehrggvugemsggrsgefmeeijeelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemkeehrgekmeehrggvugemsggrsgefmeeijeelhedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemkeehrgekmeehrggvugemsggrsgefmeeijeelhegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudelpdhrtghpthhtoheplhgvihhtrghoseguvggsihgrnhdrohhrghdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmr
 dgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepsghhvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheptghogihusehrvgguhhgrthdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_234300_876001_FC24CD6D 
X-CRM114-Status: GOOD (  19.12  )
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

Hi Breno,

On 8/27/25 12:42, Breno Leitao wrote:
> The kexec_buf structure was previously declared without initialization.
> commit bf454ec31add ("kexec_file: allow to place kexec_buf randomly")
> added a field that is always read but not consistently populated by all
> architectures. This un-initialized field will contain garbage.
>
> This is also triggering a UBSAN warning when the uninitialized data was
> accessed:
>
> 	------------[ cut here ]------------
> 	UBSAN: invalid-load in ./include/linux/kexec.h:210:10
> 	load of value 252 is not a valid value for type '_Bool'
>
> Zero-initializing kexec_buf at declaration ensures all fields are
> cleanly set, preventing future instances of uninitialized memory being
> used.
>
> An initial fix was already landed for arm64[0], and this patchset fixes
> the problem on the remaining arm64 code and on riscv, as raised by Mark.
>
> Discussions about this problem could be found at[1][2].
>
> Link: https://lore.kernel.org/all/20250826180742.f2471131255ec1c43683ea07@linux-foundation.org/ [0]
> Link: https://lore.kernel.org/all/oninomspajhxp4omtdapxnckxydbk2nzmrix7rggmpukpnzadw@c67o7njgdgm3/ [1]
> Link: https://lore.kernel.org/all/20250826-akpm-v1-1-3c831f0e3799@debian.org/ [2]
>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> Breno Leitao (3):
>        arm64: kexec: Initialize kexec_buf struct in load_other_segments()
>        riscv: kexec: Initialize kexec_buf struct
>        s390: kexec: Initialize kexec_buf struct
>
>   arch/arm64/kernel/machine_kexec_file.c | 2 +-
>   arch/riscv/kernel/kexec_elf.c          | 4 ++--
>   arch/riscv/kernel/kexec_image.c        | 2 +-
>   arch/riscv/kernel/machine_kexec_file.c | 2 +-
>   arch/s390/kernel/kexec_elf.c           | 2 +-
>   arch/s390/kernel/kexec_image.c         | 2 +-
>   arch/s390/kernel/machine_kexec_file.c  | 6 +++---
>   7 files changed, 10 insertions(+), 10 deletions(-)
> ---
> base-commit: 3c642997252eef4449cb6b6e02af3dc22515d817
> change-id: 20250827-kbuf_all-b9d55c9291eb
>
> Best regards,
> --
> Breno Leitao <leitao@debian.org>


I see that the commit those patches fix is in 6.16 so we should add cc: 
stable.

And who should merge those patches? Should we do it on a per-arch basis?

Thanks,

Alex


>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

