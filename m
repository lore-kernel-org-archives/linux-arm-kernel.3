Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA8CCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 16:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+unaJQbdyjel9IpeR1c1h6SCsWMzBnVM8jhQ9WLsK0=; b=G9nrGcUCO7QyqHnnG8bsdKO85n
	eX2/uMOJMXO2ztZOvrkMYxEvxIyTpcCujJgRu8U2BgQT2vjT1oP5FJhv+dE5Y2DrkvUs8Ntq15FTd
	0u32vfq8YAB+j2k4G0XZzG2+2OO/zQa1SbJXrYRgVtORxGTxnfye3+mC86Zk1UEVlddpXuzEwhEZp
	A4XkJMfhxOw5WFBWGZCYgenrBGlH419oYlcpR8B1OoaPpVVfVqBWUL6sphd7xprjUTazB6NnUabnd
	0bvwEk1HppYjBrp6aUYqREZmuyztLi6Ew9S9Zt5SIZRlnixLuuBMZzs7AoYd5Qlf0+j2NpzISkcUI
	fiWcmKAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNyH-0000000Faeg-2dwk;
	Wed, 10 Sep 2025 16:47:01 +0000
Received: from smtprelay0010.hostedemail.com ([216.40.44.10] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNyE-0000000Fac7-1YVW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 16:46:59 +0000
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 5C5F61179B7;
	Wed, 10 Sep 2025 16:46:55 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf04.hostedemail.com (Postfix) with ESMTPA id F405F20024;
	Wed, 10 Sep 2025 16:46:51 +0000 (UTC)
Date: Wed, 10 Sep 2025 12:47:42 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 15/24] KVM: arm64: Support unaligned fixmap in the
 pKVM hyp
Message-ID: <20250910124742.34185645@gandalf.local.home>
In-Reply-To: <20250821081412.1008261-16-vdonnefort@google.com>
References: <20250821081412.1008261-1-vdonnefort@google.com>
	<20250821081412.1008261-16-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: q9cbx38hryj33o5fwyipu7ui3mmw96do
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: F405F20024
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19JP+3dHgVZ3OldSVYgQj0MefUC8Z85EjM=
X-HE-Tag: 1757522811-725488
X-HE-Meta: U2FsdGVkX18yi2o/B62gDqm8AYG/9T+wf5t8LxVLQsiafH2QQ0ZSJcX1Vb7j7AiT4OouF7YoGLFO2B2fGds+ZHAWLiDNewTEYVHdqKFpaeyLhLEv9JLayHPnToecZQWsjUPlDVCbcqL3bL4AeMUcrCTQb4kM6TyxEqIA+jRCS/V3seDhQUEPG0w8Fa/+uWh0Uou/l/T1IRlDdcVFx6Kb7kaJ1gtG2oReVEQomDU1nXZWBWMF5eFh4PUamQfSfxJPHT0Q2JNTiLTuW7BnjLlcz0p2nXNAoVRZjazY3QOnAkakhg8Unj47qVdWCCseW1W1wQstnQ5n7CfASD/U738xhId8P4KuziyF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_094658_473952_D8E91D8F 
X-CRM114-Status: GOOD (  15.68  )
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


Would be nice if the arm KVM folks could review the second part of this
patch series.

Vincent, I finished my review, and you can post a new version. But it would
still be good to get some input from the architecture folks.

-- Steve


On Thu, 21 Aug 2025 09:14:03 +0100
Vincent Donnefort <vdonnefort@google.com> wrote:

> Return the fixmap VA with the page offset, instead of the page base
> address. This allows to use hyp_fixmap_map() seamlessly regardless of
> the address alignment.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
> index ae8391baebc3..75014dc7d82e 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mm.c
> @@ -239,7 +239,7 @@ static void *fixmap_map_slot(struct hyp_fixmap_slot *slot, phys_addr_t phys)
>  	WRITE_ONCE(*ptep, pte);
>  	dsb(ishst);
>  
> -	return (void *)slot->addr;
> +	return (void *)slot->addr + offset_in_page(phys);
>  }
>  
>  void *hyp_fixmap_map(phys_addr_t phys)


