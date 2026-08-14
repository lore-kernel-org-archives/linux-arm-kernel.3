Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C46FC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 19:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TFEy1Pzzmf9oV8+r6B/Uh7d0hODw3XhZm9afSq3e+o8=; b=dKiYec9OYxuu/SSiMx5N49QZ7i
	wzl2saFUYxQ2G4oapveXRpCCBjV2BX5Kl9Q/rYFnjTrs4kQ42IeQUaD4bj/2Fozw8j0eZcBG0oFow
	AL8F6appZSuwn3SmawD6k/xVBYnZQGCmnmCwuFFs/+fk1xTbSV4gSGBGvt2SGjYlayT4fILKYFss+
	NrzGr4lGSZEXBkJ2LOl+cVxtjYH8JTTF9XlRsj5ZaJZngtQJgsQz98YXOU0zw8dXePODELpLb7CgR
	xmg0wpMXCBxCXhStUyh9+dijWrZh62aEBkx/P8DcGIk9K7iOqCTOZNypeME5L4zNyaW/AMtSreTdU
	CkehbHcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuxJ7-000000034wz-3eYJ;
	Fri, 14 Aug 2026 19:11:09 +0000
Received: from mail-pg1-x548.google.com ([2607:f8b0:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuxJ4-000000034wc-1FhW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 19:11:07 +0000
Received: by mail-pg1-x548.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so1683279a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 12:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786734664; x=1787339464; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TFEy1Pzzmf9oV8+r6B/Uh7d0hODw3XhZm9afSq3e+o8=;
        b=P30UOMRKYlXrIGyOo02XNKV+uUVK3sCQxL5Pz2sYBv/i4Kb2xutti4p2GqjVH0C14l
         yIKBjs24Jgb9zV8qBOrL4bhNKRf5poHNk27Xq4hz0vX+dxL+RlnGf34wdPb7xl3EsrLE
         oIoPKf+G4aEEgURlqfxdjzvkicQjDmpsBNgafeD5pHyRP2uTw7i+i5IM55zYLmI7RRoi
         qoo0nI/Oqx56wmlcZyAAjTvqblv/e08ns0F0FwDvzWV9k7O0voDfLkqvd1vtdY7o66Jx
         1tpowSIZF+UtNQLKEEzzzfNG4GsdGSgsqakKTcKrOtFDRV2dRbwXuXiBxG9EH4ScBGac
         tKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786734664; x=1787339464;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TFEy1Pzzmf9oV8+r6B/Uh7d0hODw3XhZm9afSq3e+o8=;
        b=ovQvxU5nmKJXvJVaGHCb4XfFVFdgBr00yt+LWmZZlhf2MT+ndBM0M8agsUyqRLru7w
         6fYvrUjqjHeD5z8U+ber8OG/vpl3dXuEs9UrjTGOnf+SqxER2cgJqfPH5snJ7XadzWui
         ikzKTNL5+VOCDrNEyt6InpxADp+c29P856fC2yVv9Kc6QeGyNwWWWFXAqyu+t1tUwdq/
         +eIB7sMwo+bAHMYAoLSFmaFdq3qwI4TEr3h+ByE+jx4IfjMWXUUUWX/9YHjez5qaIU8+
         hmUr0CdSDLwZTrsz8aQyM8do50MMNy0CPdVCpMiQmNDdg1tRg+LKviHdGjd47AOtsFMy
         bqkw==
X-Forwarded-Encrypted: i=1; AHgh+RolTRHRrQ51xgnKQRxTC75pdZCRZ5zUrcaCM64Ox3jXf9YoxI/wk+UtpPA0SfQbTJVpY8T+ukMspoUtUjRtV4bs@lists.infradead.org
X-Gm-Message-State: AOJu0YyEe3/EMpZ8XyI9e9H7gHURAiqXUjFGvYlQ3qFntZpvs1JaKrtf
	LNY/HQEH+4XKutn4mnPdLHvBsQeiMwpZXQpvsL06e0CXYKVP+TUMnbdPZlwHoTUYurASq60GqAE
	KDJtxaA==
X-Received: from pfbkr10.prod.google.com ([2002:a05:6a00:4b4a:b0:848:569f:3464])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4004:b0:847:99bb:b6d8
 with SMTP id d2e1a72fcca58-84fde251c75mr9480785b3a.26.1786734664084; Fri, 14
 Aug 2026 12:11:04 -0700 (PDT)
Date: Fri, 14 Aug 2026 12:11:03 -0700
In-Reply-To: <an9JNUln8dKaidQc@raptor>
Mime-Version: 1.0
References: <ak-EKSslAz1uqEtv@J2N7QTR9R3> <ak_wC4Q-mQe14DI8@google.com>
 <alDI1b8fC99SG4_a@J2N7QTR9R3> <a127176a-1722-460c-aa84-754e1d343f53@arm.com>
 <an3sEiQlIuGEjUur@raptor> <b6080c23-a2a8-4bc5-b3bd-982bd766c648@arm.com>
 <an5UJ4S_P1LUFmzD@google.com> <487aa57c-72ad-453b-971d-ca24a8380429@arm.com>
 <an8SOvLybeilzCEU@google.com> <an9JNUln8dKaidQc@raptor>
Message-ID: <an9oR3dBVgFs7j7q@google.com>
Subject: Re: [RFC PATCH 0/3] KVM: Dirty page logging for guest_memfd-only memslots
From: Sean Christopherson <seanjc@google.com>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: David Hildenbrand <david.hildenbrand@arm.com>, Mark Rutland <mark.rutland@arm.com>, pbonzini@redhat.com, 
	kvm@vger.kernel.org, maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	fuad.tabba@linux.dev
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_121106_344363_4603B09F 
X-CRM114-Status: GOOD (  18.14  )
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

On Fri, Aug 14, 2026, Alexandru Elisei wrote:
> On Fri, Aug 14, 2026 at 06:03:54AM -0700, Sean Christopherson wrote:
> > Yes, I'm supportive of KVM expressing to guest_memfd that page migration isn't
> > supported by the VM.  I'm only objecting to expressing that memory must stay
> > mapped in S2, because guest_memfd doesn't care *why* page migration is or isn't
> > supported/allowed by a particular VM.
> 
> My naive contribution is this idea I had:
> 
> 1. Userspace queries support in KVM for feature xyz by checking the
> capability KVM_CAP_xyz.
> 
> 2. Userspace knows that for feature xyz to work correctly, it is required
> that memory remains mapped at stage 2.
> 
> 3. Userspace creates a guest_memfd instance with the right combination of
> flags set and _unset_ for feature xyz to work correctly - i.e, to keep
> memory mapped at stage 2.
> 
> For this to work, new guest_memfd features that might lead to memory being
> unmapped are enabled via a flag, and KVM keeps memory mapped at stage 2 by
> default, to maintain compatibility with an userspace not updated for the
> new features/flags.

Probably?  It's impossible to know what the exact flows will look like, but the
common theme for everything will be "don't break userspace".

We might make guest_memfd page migration opt-in, but if all of the incompatible
setups can enumerate their existence prior to creating guest_memfd files, we may
handle it all automatically, e.g. enable page migration by default, but disable
it if a TDX, SNP, pKVM, or SPE-capable VM is detected.

