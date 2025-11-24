Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95DACFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 14:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jSkF3ZRD0txUuUowRzgmTMI1fvINIcu6kZL0IrYQPWs=; b=pOZ248PUZ+nFe1KSQP50tA9ux/
	TMfnHHsdX2DcyAe9ziospembwCD55YQ1VdSf+UzGYqo4m3hbPRq4ppiAKLPEGtElXxwHMoeTLDbtY
	9XPMt7s++BEyM3ltVy6yaqY6WkM4xzGP3Ze/PI2Hpqy1AFjxwGBgMUoHlM1KFcmrau71EpwB/7wfT
	NsCZc2HneRl1yGWoI4VOSiWFbAViFaJs8BoGkY+zZPhO3B7rigbjaPalF4cXebyFwwGFBCqHgtnUI
	9/OnvVhpHIonH7/HcmEs662iwa+O7LYX++jYny8eLUwPV0MGF5xbSm6o0fiEklgJi+PJNwIldtmDm
	K8qbvspw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNXHT-0000000BorX-3vmi;
	Mon, 24 Nov 2025 14:11:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNXHS-0000000BorM-3tc1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 14:11:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C0786601DF;
	Mon, 24 Nov 2025 14:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6DAC4CEF1;
	Mon, 24 Nov 2025 14:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763993461;
	bh=9kXuey4j1iyNfngrjmnOHDtQji8gClrywMZaIofSoSs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ToE45XUaNEKKgD2WXInctkwlv3+HBQ1TWbbC/9sEmPQZUN1wYevCeBRVBAV0rozFL
	 I7wUvi5bxWcACKzxrEjR9VQMVUyaT8qQ5kFVhrVVlB89kgJUI6qWdrkHnaxN18F/OQ
	 mF0tJs2Sp8oYTUiLgE5alNCnrBVLa6AKCyHt+H//u0eb1VNFNAFg7+La3UkcsIK7YK
	 bQXVkMezHzr95Qf3Ef+lnUif4ZyWCABBRpSmPiFrnUGowf1Rr2Xo8pRrZ38LeAit4M
	 dcuirEqLwFTeqTAFHiWTbkf/ytXN0PIulzMPv+dkinYGeRr/hIAHNbLek15LEi+dsr
	 2rHEM1RGj8ISg==
Message-ID: <ef07b0f4-1f77-4c6b-9c67-8228632b1fec@kernel.org>
Date: Mon, 24 Nov 2025 15:10:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/12] arm64: mm: replace TIF_LAZY_MMU with
 in_lazy_mmu_mode()
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <20251124132228.622678-10-kevin.brodsky@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251124132228.622678-10-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 11/24/25 14:22, Kevin Brodsky wrote:
> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
> mode. As a result we no longer need a TIF flag for that purpose -
> let's use the new in_lazy_mmu_mode() helper instead.
> 
> The explicit check for in_interrupt() is no longer necessary either
> as in_lazy_mmu_mode() always returns false in interrupt context.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---

Nothing jumped at me

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>

-- 
Cheers

David

