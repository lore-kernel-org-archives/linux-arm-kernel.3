Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6612C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 09:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szjlKSRr4QKhQ/BXliXytwAbzwuxRJ9hxfloPYxH0y4=; b=qptZseLJO2XHGiSwmnCUN9J2lB
	+KzdHrXOXkEqvInmLY8WEdfldo1eXMKtwRieq6AAQAVbWGb+2tqKYJ5wmMQeyrOWNKVus7E4gJnqx
	pVIOdKKxvL8p/SgU5PbDm0dYCmiNwvIYRkvCen++C4YHbHTeOc/VDQpr0CAOTGFHu6RKRJkWRoOH5
	+CuA12xi3+aBsTblxDqniloCzBMrrYn4uPds32qluCAyY1EaApv3CBuD6ebu6jZoX0z74l3Yjmu37
	MA3NazV9zHKjW9OXMjY+cObOqVRVgZTM15q0EA6C7+lNt4XXhz8/XDQ/qli9L/ppg7MZ32rFA/hT1
	2EmVh1ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB638-0000000HZmI-3Q8x;
	Mon, 28 Sep 2026 07:45:22 +0000
Received: from out-142.mta1.migadu.com ([2001:41d0:203:375::8e] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB635-0000000HZlH-12R6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 07:45:20 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=szjlKSRr4QKhQ/BXliXytwAbzwuxRJ9hxfloPYxH0y4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790581516; v=1; x=1791186316;
 b=Ys1MQIkeV/eujertlX2VWFwU5ezKap/9dVAzfbmEUf6DnUlEv6WYezG9dz1+jOx+y/kygCmf
 E2Xhp5k25mlYqXyOL/YxtHl/EB3OaMU3Fehd+dE86cLoeZNIy9JYdk79KTmR5rCWZM7RY+6/9lv
 RyZDhXCfnIXPT3us1N30YlYk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 40e7dfb45afa0da6;
	Mon, 28 Sep 2026 07:45:15 +0000
X-Mizu-Trace-ID: 40e7dfb45afa0da6
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b8f42bb8a9so4287e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 00:45:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwKUlZWbtgtgGQajM5xeyE7nby0uUcNSjYP9h++k+a0QQEP961BhNulgNirOiJOOvNLezLREVxXVKbT8s8GNgDD@lists.infradead.org
X-Gm-Message-State: AFq9FYLIiTd/hkzWDda/aCZa99iyrDqgxNFifdNL9Ax6zrPr7jXhP4Dy
	gm3r+GblHrt8k+fUanlQ+HDhhhLYB2ySryLFTs7/zZmTdrQ4+01K9VAOkuhu6mwg3kGQLY6Q7TY
	BCa1alzwoRPvtI6hNkt5PbaWakgiqmY/2i9b3sRaN
X-Received: by 2002:a05:6512:1386:b0:5ae:cf5f:4a88 with SMTP id
 2adb3069b0e04-5b8ef2571demr154509e87.8.1790581510337; Mon, 28 Sep 2026
 00:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260922130821.1666713-1-vdonnefort@google.com>
 <20260922130821.1666713-6-vdonnefort@google.com> <am2rfnuwjkglavbtzkt2lk2gclahvca5irrv5me4vppzkotexf@yauajpybhsnm>
 <87qzie3beb.wl-maz@kernel.org>
In-Reply-To: <87qzie3beb.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 28 Sep 2026 08:44:33 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwwxL3Cs-7B2NgEyedu-ZQFt96ck_V-erCUaTB=hrh5eg@mail.gmail.com>
X-Gm-Features: AclHuK-ALEhQXkggSsAxXnC2DJjXeZyCoNf81U4HcBABH4AnShcbMTLpdrkikjI
Message-ID: <CA+EHjTwwxL3Cs-7B2NgEyedu-ZQFt96ck_V-erCUaTB=hrh5eg@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] KVM: arm64: Use kvm_s2_fault_vma_info in gmem_abort()
To: Marc Zyngier <maz@kernel.org>
Cc: Wei-Lin Chang <weilin.chang@arm.com>, Vincent Donnefort <vdonnefort@google.com>, oupton@kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, qperret@google.com, Sashiko <sashiko-bot@kernel.org>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_004519_493841_55D80217 
X-CRM114-Status: GOOD (  13.60  )
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

Hi Marc, Wei-Lin,

On Sun, 27 Sep 2026 17:30:04 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > Perhaps it is worth reserving plain "gfn" for the value we use as the
> > IA of the (shadow) page table, and name this variable something like
> > canonical_gfn. Similar to what kvm_s2_fault_map() does.
>
> Maybe. We have gfn in the vncr fault handling code as well, but that
> one is the result of a S1 walk, so maybe more obvious.

Agreed, now that s2vi.gfn sits next to it. I'll rename it to
canonical_gfn for v2.

> > Huh, I guess you also fixed a bug here? s2fd->fault_ipa could be the
> > nested ipa instead of the canonical ipa.
>
> Yeah, it appears so. Worth capturing in Fixes: as well.

That one came in with a7b57e0995927 too, so the existing Fixes: covers
it. I'll mention it in the commit message.

Cheers,
/fuad

