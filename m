Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166E6C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 17:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydgxQP/oa7xEv0jlIXInXGbUm/sXAmGgSanquee8prE=; b=dfTpGMlUZJcNatlP0fcJKzzWEe
	MzcXqod8YgoSE+09pXR+R92UZIlzjrTyPxe88n+VeTlSZSLb3h3GtpY/z41g1uOPnHu7WXNmQUn8E
	EJo2SKvbIwkkj0X0JMTbARnUBHi1nBm6sdUphdUbB5B3O6dlIkPkfVCLvmM1FyB7l2ph0VC4aHmf/
	6e+4u8+8ThnOm3WZwkCkOYXGdjJbFGDHY4efaWYtHPyWjJfUGMq1v5PQK7J+hQMoKvmjrzEC86Qks
	A3Rj+2M8o9I0Vem1S4Xlr972sV8+TU2Cf6ZloBZOhZqc0sl4tZmr+L9csr9En24L4TLAq44RG+v9W
	dknIsPBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgZH-0000000CibP-1GIF;
	Tue, 14 Jul 2026 17:05:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgZF-0000000CibF-0flH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 17:05:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D37F6132C;
	Tue, 14 Jul 2026 17:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4392B1F00A3D;
	Tue, 14 Jul 2026 17:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784048710;
	bh=ydgxQP/oa7xEv0jlIXInXGbUm/sXAmGgSanquee8prE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ieXeiQxD3n0otcy7FEsbZtFaiIVvwxETvj6HHeWLF1vXpuCEQfau5wd0V1WvRFwNG
	 X88F4xnSZxxkDbAVyeqviuAvzdqxE0WXoGYMsC0xLsz8JK7QEvZOirlpPi/9TyeW8V
	 os4P0i5uJ1uoklYH+bhxW46PFHIPm0XrgjIb7/weJWi9p4/Dhg/TanHuEi1rtlTKqY
	 glgBRkR/DsxDxirGvItFlnJiDMsekv1zxklW6KYu4gUMuaelj6QI3adNc5AmSa/c+O
	 WlRC74ba8yU6KOTKHSajbyKbhfB6lKDRwGdnEALDKsoWaTVENAwquyfrMbfVNheIk3
	 HevLzYmgjqiyw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6FB16F4006B;
	Tue, 14 Jul 2026 13:05:08 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 14 Jul 2026 13:05:08 -0400
X-ME-Sender: <xms:RGxWapPXbB5dVu53Jz7RrippvtSKKiAiIJVJ5GoTsW29sf-zJC66Jw>
    <xme:RGxWasZTnBKb9bCAmfX0IqbM8Ed5DZM-tMrieZPtZAv-_vOKsS4WlCPcFe_HzuGoR
    4yhsz-XKh5zBAEJuk9zp0cQ9zWdMZDIdT6qwkGq6rkt24kiKrBV7A>
X-ME-Received: <xmr:RGxWapslvvrOUkuR9AuAdM_Gt0YsL-K_n0305h3XhPWdgjEVANE4Bevhdipelw>
X-ME-Proxy-Cause: dmFkZTFmy+VemEL8y4m/0c6SxM2MpgY/lUB50b1pGO9hizfkVYuDYx4C2dh69xVyekjjVF
    SM16JUY7uBZ4MgywK/EicPR2jaoa2RvJU2pvEyOxthy7IxCU4yoKq5ltVWcNJlEPeG5PD/
    La7r4WvGmHo6f+HQp9hAsZMebjDJ6UU4aeFkik8+mWeHwOszix8pf/umVHOJ3FrSeeX1Ep
    urx2zOqpy79jM/gcgeHPLClx4ZD5PIiAPgkDFFJ8vW2YYYwEh3OSG/Ng0deBensnErFliG
    Cx85IWH5hmqDvVZlFms+1oCUSCe2CgRWM9tg918uHCJjnaCkn6LHh0uivkwfLqo+HrrSqw
    /vD5cDJGDYcRixMT4B1b1W/Oqoir4wrmSc04uvjG+o9qqJajA+QNDm9rCdp5WdTi7wtlWh
    ow8/u1xCky2ml+w62/3u0/11lgO4Ch7qe+KEj+eztYk0agWgOkcNQS7AepEXJIyZ5szllJ
    5aMvBky0fhySWBI5vvukYk5SbrPDoaQ5sIsFNbluAxKbB4KBJjwf0PeW1oKB7+nPQ/n02u
    oCvgqRALMOOl5sngUh6rP3Q5kZHgjv48PtDGFT6kihcspAuv/N1ExURuPiLuhi4HYSCfeL
    q//noQRZyomBaUesw2AggexEf3LHnrFQotNu2k+xS7i3QXELw3IUnA9qhV7g
X-ME-Proxy: <xmx:RGxWaltsTtr4ZjIGeOTb2H7BlQE0FP4YCrbw4gdcPHSHCzs3YznmIg>
    <xmx:RGxWag1RMUC3o23VL7q3yu2zQ7NeU5EL7ocwG3bKkk9QlCg4JI_YCg>
    <xmx:RGxWaqNrWGr5C3kXNzgBHVFPBVDWKgd0N3KUDgFTF3sMfQqZ9VOE8A>
    <xmx:RGxWat5YHEcBpFpFY44XIzGRimwMYLN9Edflpk0v-w5jXuD5GmbpCQ>
    <xmx:RGxWapZdlcn3WvyTxZNGFMK7K0whXjTgVTcsMq0ulr4g5weXE5EZKU6t>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jul 2026 13:05:05 -0400 (EDT)
Date: Tue, 14 Jul 2026 18:05:01 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 	Suren Baghdasaryan <surenb@google.com>,
 "Liam R. Howlett" <liam@infradead.org>,
 	Vlastimil Babka <vbabka@kernel.org>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>, 	Uladzislau Rezki <urezki@gmail.com>,
 Toshi Kani <toshi.kani@hpe.com>,
 	Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>,
 	Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@kernel.org>, 	Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 	"H. Peter Anvin" <hpa@zytor.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 	Will Deacon <will@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Ryan Roberts <ryan.roberts@arm.com>, 	David Carlier <devnexen@gmail.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, 	bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
 	syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
Subject: Re: [PATCH mm-hotfixes v2 0/4] mm: fix UAF caused by race between
 ptdump and vmap pgtable freeing
Message-ID: <alZm0tBf8DpMXimM@thinkstation>
References: <20260712-series-vmap-race-fix-v2-0-ad134cc3a12a@kernel.org>
 <alTn7NguEW_4bodu@thinkstation>
 <alTq4V50767L-s5H@lucifer>
 <alUNiWcygLd4rqBo@thinkstation>
 <178404602957.85099.8935151447302412515.b4-reply@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178404602957.85099.8935151447302412515.b4-reply@b4>
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

On Tue, Jul 14, 2026 at 05:20:29PM +0100, Lorenzo Stoakes (ARM) wrote:
> Basically you need the IRQs disabled to get the semi-RCU behaviour and to
> be able to safely traverse page tables that way.
> 
> So with CONFIG_PT_RECLAIM you're safe to RCU traverse PTEs only.

I think this is stale. Since 1fb3d8c20bfa ("mm/mmu_gather: replace IPI
with synchronize_rcu() when batch allocation fails") the !PT_RECLAIM
fallback is a real grace period -- note your own quote of
__tlb_remove_table_one() calls tlb_remove_table_sync_rcu(), which is
synchronize_rcu() nowadays, not the IPI broadcast. The name invites
the confusion.

Together with a37259732a7d ("x86/mm: Make MMU_GATHER_RCU_TABLE_FREE
unconditional") that means every freeing path through the generic
mmu_gather is genuine RCU, batched or not, all levels. A plain
rcu_read_lock() walker is protected; IRQs disabled is not required.

> HAVE_ARCH_TLB_REMOVE_TABLE is set for powerpc, which also enables PTDUMP :)
> and that's because it actually tracks multiple PTE page tables together as
> a fragment.

sparc also sets it with SMP. So the audit list for custom
tlb_remove_table() implementations is powerpc and sparc -- everything
else gets the generic behaviour above.

No disagreement on the rest: the walker needs
ptep_get_lockless()/pmdp_get_lockless(), and the ppc kernel-side
fragments need a look.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

