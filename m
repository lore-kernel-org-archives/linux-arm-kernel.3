Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11314C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 09:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3cRD5tp61vGr5S2DsLizm6q3lmn7Tl+FjuVbnFjpaWY=; b=OO/nYyC+3KVLAkq0eK8nDNkDBm
	tgZPVZl+E18q7AmyCTkyige6ZH9dC9M0tZTyGJCL6+h1H1SKVnR9Hop9p0fd0J+P1Rvb9Mu0eWmL3
	v2O7zOfMELjnDl5YollFOkUQzHmMSQjZo/DhqbVEPTrCMfzFfw/5OuUsD0rruX/KnLmANPsWUg/0o
	nkIB+yvFdsvLRaUM4lPOuc2BjskgJ7cDVL45hsKCG8YT4xBXyoTYsqdVlUIK2oCmuun1sgaPOL+op
	Hb+EU8eYJ5h2Mu+1x5oTlKJSz9b/VBW8AT8hOfKZarIU9LhdW6BPFPP0JZvGX5IjXHCz9xtDD+0No
	Bo2b0ACA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZjm-0000000BUd9-3OSN;
	Tue, 14 Jul 2026 09:47:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZjl-0000000BUcl-09tu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 09:47:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EC3543896;
	Tue, 14 Jul 2026 09:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D44AC1F000E9;
	Tue, 14 Jul 2026 09:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784022456;
	bh=3cRD5tp61vGr5S2DsLizm6q3lmn7Tl+FjuVbnFjpaWY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=V0sXocaSYQi1xJqIt1MJBdQzPhZD56BHBzx2m7Yw0YvJlKm/n/fHnWNSauFyKWV5z
	 zNzTWGK/iFFwE+3x1Ak1tagoeCjsnadtm9wSEkHbw90gj+TOltpVAtj9SXn43yKJmf
	 0n/67q79i+1sQA53I2SYp+edL/sjVAnbH56U6DPa4G9rAY6EusqDThdfaNYdZroMDE
	 lzwZ6EroTsbWJw6S+IjzuD0irNPcqh8slpr3mzTzFQ5oR47KkQ0VmF7KH9jsma9UOV
	 4A4d/TMUv9TB6ORGVL/BtfLzbJPS2jeOLBLIQFffPB2cUzJfzQFXluodTlVZNLTyu8
	 hVfMkzX/tHOLw==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH mm-hotfixes v2 2/4] x86/mm/pat: acquire mmap lock on
 page table free to avoid ptdump UAF
From: Lorenzo Stoakes <ljs@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Lorenzo Stoakes <ljs@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Toshi Kani <toshi.kani@hpe.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Kiryl Shutsemau <kas@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Dev Jain <dev.jain@arm.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, David Carlier <devnexen@gmail.com>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
In-Reply-To: <20260712165341.GAalPGldsKpBs5treJ@fat_crate.local>
References: <20260712-series-vmap-race-fix-v2-0-ad134cc3a12a@kernel.org>
 <20260712-series-vmap-race-fix-v2-2-ad134cc3a12a@kernel.org>
 <20260712165341.GAalPGldsKpBs5treJ@fat_crate.local>
Date: Tue, 14 Jul 2026 10:47:20 +0100
Message-Id: <178402244099.69739.5281491459981359633.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=642; i=ljs@kernel.org;
 h=from:subject:message-id; bh=t4XiP/IHs/MAWTmAJpg8U8XhqPVl/Di3JCGllCa8vzE=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLLCWFcta9IJr9ALSwlJ11PfNz119ZLQC4ssPNa9fy9c8
 53xZt7HjlIWBjEuBlkxRZbnX8T3B4mEzeu84O8GM4eVCWQIAxenAEwkkoeRoeedzY2VCb/y5dql
 I87/W3A80feA/QmBunpebqWfO4IZyxj+J/eLv1gpe2b6b+2PijPuX0mbW1f4l+297Me6f7PDA9j
 CGAE=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
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

On 2026-07-12 09:53 -0700, Borislav Petkov wrote:
> On Sun, Jul 12, 2026 at 11:42:25AM +0100, Lorenzo Stoakes wrote:
> > This patch resolves the issue by acquiring the mmap read lock on init_mm to
>
> s/This patch resolves/Resolve/
>
> > provide mutual exclusion against ptdump, which acquires the init_mm write
> > lock.
>
> ...
>
> > We also include cleanup.h in order to use a scoped_guard() to implement
> > this cleanly.
>
> You don't need to explain that.
>
> Thx.

OK will reword on respin.

>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
>

Thanks, Lorenzo


