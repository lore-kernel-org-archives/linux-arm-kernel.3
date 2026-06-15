Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653D3CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 17:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UF9tuXD0qQaVlmKMJ+WYam5R3vjuOlAQ9UZzDWobYyE=; b=nD2Aujaynm0mZQlkhN/TvlOaMm
	yn2KtQgTURtWJU23nJ79jhuEOMOUjnEG4A7sEzz6ELoOY11msCKew+xb9JmwQrln3oCb6Jm8icExG
	OXHk70+lJ1Ylq+IbN3hb7TRnJ6DrTqX5iPtWImggYVeCnTLLNANO4k+M2fc6e8yjRGjMSYg4flYIf
	4ApZJ06IZSEmOr4sE9YsX1mLdagGFjIJBLa2de35y5HDwRAoRr8+fGeuhIk6gPHqo5FXtuQqyX/a3
	NZXfFfzBiJvt/LSW/4E9Loi1kUMheqHrWGphKEGlcS0/gzes69yDJQUdFLsJ72lpRFfG6+4mJlOmQ
	b6Phl0FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZBI9-0000000Efky-443W;
	Mon, 15 Jun 2026 17:40:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZBI8-0000000Efks-2BNN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 17:40:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E7840431CF;
	Mon, 15 Jun 2026 17:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A44DB1F000E9;
	Mon, 15 Jun 2026 17:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781545207;
	bh=UF9tuXD0qQaVlmKMJ+WYam5R3vjuOlAQ9UZzDWobYyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VPYwndpqwNN8bVPja/h+B9Vf6gpt3GVs6I/fVvL/+ckkt+gB//E57E0DsUn708zTt
	 HzUiL6voPzDQNIZ5HmrdrnkN6JYacJBuzLGzfAFf2baCp8ljwNjPsc9vHs1f+Gv/6V
	 RKmYtBqw9QWyu0YCASzUw1tns01qvI5ADQiAriCjNYIo4D14+K3o5XBpsqtvnhZ4Gw
	 ryZ//Gcu/qbAYE/Ap7crhK2/2P//K+C61Xruvhagv7Ff9eGTAouFeDxHfCvqNKnu7P
	 smm4WtN+GsbxRCPHvYRunBUkH17kNyHygTg7tfo/80ZiQDgDxnY42fyq8clkLvW9ei
	 W2wwObVUUMczg==
Date: Mon, 15 Jun 2026 07:40:06 -1000
From: Tejun Heo <tj@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Will Deacon <will@kernel.org>, David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>, sched-ext@lists.linux.dev,
	bpf@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] mm: Add ptep_try_set() for lockless empty-slot
 installs
Message-ID: <ajA49jgCaMo_3KdB@slm.duckdns.org>
References: <20260522172219.1423324-1-tj@kernel.org>
 <20260522172219.1423324-2-tj@kernel.org>
 <ai50IpfcvBiTZ7Ss@willie-the-truck>
 <ai8PO0NThJeuQYzy@slm.duckdns.org>
 <f6e87467-2fa1-4edc-a739-9899be36196c@kernel.org>
 <31d1ac68dc230564301fc1e7dc748a1d@kernel.org>
 <79338662-e637-412b-84b4-71cef3883b3d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79338662-e637-412b-84b4-71cef3883b3d@kernel.org>
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

Hello,

On Mon, Jun 15, 2026 at 07:36:19PM +0200, David Hildenbrand (Arm) wrote:
> On 6/15/26 18:27, Tejun Heo wrote:
> > Hello, David.
> > 
> >> Is BPF maybe picking up patches from other subsystems up too early
> >> without waiting for acks?
> > 
> > Do you mean the comment cleanup I just sent, or the original
> > ptep_try_set() merge?
> 
> I am talking about any patch that touches arch code without an ACK from the
> maintainer.
> 
> Maybe arm64 and x86 people are fine with that, but I heard other voices
> recently, thus my question.

I see. I don't know the dynamics here. I'll leave it for bpf folks.

Thanks.

-- 
tejun

