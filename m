Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF884CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 17:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDPjSZ0W1ixFetVDM7vbYVUk5f0pY0gAdryhOcsw67I=; b=y7qgIM0WWQ3TtTAVaUl5Vm6vld
	5qVg9jJfcjrZyQJ7AHIPNzsFkvKJS3/AWZwry+CgULHsWprYZs+nJRa+8D7HgVLZY7g6zegfL3ajx
	OnxahVnsR0ajiugmEwNUm9YlcHWEvqujgKi3Aop25yOAYIYRuXpqCD4rNn7oZtRjnGF8Y8GlBvPsm
	64J4AEcn+pjuLfQ2bPfQasvh8lh6BOGlVYwdMw8T2DO2dphj8zCLVj4uqXDHo6jeiRJsIwqcEDO+U
	GNFBiS7wApAYEqZcg0DQyIBznJHrbpxS3LhLBOZBBo2Bl9bD7l2Q9wJ70a+hvsMFDCj9xpMI7EyLu
	sWujAbgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT13u-000000080dF-3hv3;
	Fri, 29 May 2026 17:31:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT13s-000000080bX-0isu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 17:31:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780075912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wDPjSZ0W1ixFetVDM7vbYVUk5f0pY0gAdryhOcsw67I=;
	b=c1vvRooNumX6slPSyH7QVXIQMDFd5NpeZLDzPhg+gYiv/7BjJiqp3wj8uy/+bMZ2J0p/Fi
	DoCfS/oSLT/vimY0q7K2xQoAeVqVOMYf6oEMKjHl94jLtDI2VuoACLWb2RBtrtFpvqODHt
	vBugBd1RiHO++ZXHw+V00QlsnRGIKWQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-4-6JlxD7NOyjPmdKxiEVaw-1; Fri, 29 May 2026 13:31:50 -0400
X-MC-Unique: 4-6JlxD7NOyjPmdKxiEVaw-1
X-Mimecast-MFC-AGG-ID: 4-6JlxD7NOyjPmdKxiEVaw_1780075909
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-48fd33b4921so91806315e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 10:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780075909; x=1780680709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wDPjSZ0W1ixFetVDM7vbYVUk5f0pY0gAdryhOcsw67I=;
        b=ZRJbNFcqaWsdD1QHmUtudnWapHVMw8Ig/0pdasX2qXQFQnEXIOICzTzuTjzq3fQWyr
         c68CdXiT2rzKkApIdufxTwGixel/CDCfTnlnNUUfRvJBZrfETzV5G+JCe4bzseNJ7vEA
         /KBsu/Jx/tsmIFYNWMpdMoErF4qcp9xmMq2mQz9fohDAK5q33aTpaWpcPNQuk4YM2bRn
         LHO73nJz26rJW9JtPtoXgsrYuVvB0GZXwSCkUDgNE519X0JzgxfuAnL6WMFzoXmBp74L
         LUhh1vZLRsDE309GvbdEcS1vcEm9axaffmDJ8eRjA2zGstJU2AYoyKMr5lXEZfL0hXwr
         qCwQ==
X-Forwarded-Encrypted: i=1; AFNElJ/JOoFSxqNjeg3p+UekwaffhO5S0pg9nKkEu4W0Tv9TDhXt+pIV12HdB0h8FwKxasy8xDW7Wc8DBOQQjxvs/KUY@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs8US/9YUu/syLCowAshvlvF5mmgXMCZZPIKeEN19x3Z+z6wzL
	trVaSzDFM3ejcRAwotvYS6EVhFYF9HfgZbogT+IpHZrymFNIQtu1W+YlW/dkTmADphDTxpcYNW1
	dsRJ8eohfQLL8JOX/AxJQXID88uW0muTOWY5hqIR/uJRm7iAtDKIQPpTQsSEV7QeikoZvBPgCON
	ipiHfwI0cpAOWSs/ThO9eICHjO9bMx6EVn/kcbcpy/xp/K3nuYI0A=
X-Gm-Gg: Acq92OHJQVG5l1f5/D4NN4fCQDQbhevCKd6L9NWEGaw0tnFUAQJs4v3hnHWa06Kg3+E
	sZdwKbzVtUl0Cu2kGbAXqgB20BERqfaMTZeek+p+65VJNPJ5sCUDIcvRi0OU46iTMU95FoBbmwY
	r1D/LTJLwHgCq2BYNetYkQ82y4SCXw7+ul8izDQw3Fg9pdjZDwkdeP1go/4bYuL8tWmhlySrDVG
	sgm52XFbH5FVUrnrdtHVeSN86J3S+1GU8MpjXy4oP1nHvsdAFN1bqUPy5AfRD/pEn6s5XSA3AYN
	LUYFuNC/f1+i3EOIhA==
X-Received: by 2002:a05:600c:1989:b0:490:51b9:2309 with SMTP id 5b1f17b1804b1-490a297e1e1mr8600765e9.29.1780075909396;
        Fri, 29 May 2026 10:31:49 -0700 (PDT)
X-Received: by 2002:a05:600c:1989:b0:490:51b9:2309 with SMTP id
 5b1f17b1804b1-490a297e1e1mr8600305e9.29.1780075908958; Fri, 29 May 2026
 10:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260529105405.1839362-1-maz@kernel.org>
In-Reply-To: <20260529105405.1839362-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 29 May 2026 19:31:35 +0200
X-Gm-Features: AVHnY4KaJCOFob7wQLVfZdIu2G30xvMt9_hks8OfF0JM1D0ZM-lUBdSqwLPd7jg
Message-ID: <CABgObfbnG1gPBiZbq9o_W9LRqiYY2XCdLjJne-Ldz0cKbpwqww@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 7.1, take #4
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Qiang Ma <maqianga@uniontech.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JyzNcyc6Z6QxvlA4sCNLs-Qwkwy5lWfzoI52WaUEmw0_1780075909
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_103156_282791_F26C5F92 
X-CRM114-Status: GOOD (  23.11  )
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

On Fri, May 29, 2026 at 12:54=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrot=
e:
>
> Paolo,
>
> This is hopefully the last round of fixes for 7.1 on the KVM/arm64
> front.
>
> We have yet another batch of fixes for the newly introduced tracing
> code (memory leaks), a fix for a config symbol misspelled in the
> source code (therefore being permanently disabled), a fix for an
> embarrassing bug in the PMU emulation (write any value as long as it
> is zero), and an SVE sanitisation bug in nested virt resulting in a
> guest being able to access more than it really should.
>
> I've purposely refrained from adding another lot of fixes for more
> benign issues since His Majesty has announced he'd be picky about
> that. Fear not, they'll be in the 7.2 pull request.

I'm afraid I'll already have enough reasons to be shouted at this
week. :)  Pulled, thanks.

Paolo

> Please pull,
>
>         M.
>
> The following changes since commit 1702da76e017ae0fbe1a92b07bc332972c293e=
89:
>
>   KVM: arm64: Fix nVHE/pKVM hyp tracing error on invalid desc (2026-05-20=
 08:08:37 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kv=
marm-fixes-7.1-4
>
> for you to fetch changes up to 83726330748981372bde86ed5411d7b306612991:
>
>   KVM: arm64: Correctly cap ZCR_EL2 provided by a guest hypervisor (2026-=
05-29 10:04:00 +0100)
>
> ----------------------------------------------------------------
> KVM/arm64 fixes for 7.1, take #4
>
> - Restore CONFIG_PKVM_DISABLE_STAGE2_ON_PANIC to its former glory by
>   making sure the config symbol is correctly spelled out in the code
>
> - Don't reset the AArch32 view of the PMU counters to zero when the
>   guest is writing to them
>
> - Fix an assorted collection of memory leaks in the newly added tracing
>   code
>
> - Fix the capping of ZCR_EL2 which could be used in an unsanitised way
>   by an L2 guest
>
> ----------------------------------------------------------------
> Mark Brown (1):
>       KVM: arm64: Correctly cap ZCR_EL2 provided by a guest hypervisor
>
> Qiang Ma (1):
>       KVM: arm64: PMU: Preserve AArch32 counter low bits
>
> Vincent Donnefort (4):
>       KVM: arm64: Fix CONFIG_PKVM_DISABLE_STAGE2_ON_PANIC
>       KVM: arm64: Fix meta-page unsharing in pKVM hyp tracing
>       KVM: arm64: Fix rollback in hyp_trace_buffer_share_hyp()
>       KVM: arm64: Fix memory leak in hyp_trace_unload()
>
>  arch/arm64/include/asm/kvm_host.h       |  2 +-
>  arch/arm64/kvm/hyp/include/hyp/switch.h | 16 ++++++++++------
>  arch/arm64/kvm/hyp/nvhe/host.S          |  2 +-
>  arch/arm64/kvm/hyp_trace.c              |  9 ++++++---
>  arch/arm64/kvm/nested.c                 |  5 +++++
>  arch/arm64/kvm/pmu-emul.c               |  4 ++--
>  arch/arm64/kvm/sys_regs.c               | 11 +++--------
>  7 files changed, 28 insertions(+), 21 deletions(-)
>


