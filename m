Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3BDC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 12:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NuKsMEW2bmL3HYEzGzn4/Q1vMLgkj5WzRXYhVoZ/eTE=; b=A3IzVhUyqYce3QCuqy9yII3fGV
	G45byqt0Nx6dNUoDRMQfFHYTt72BtEfsenOyPIhk1jRNqv5utKdsZ8fk8HLN/Qf7fia8sLbGSDyl+
	CtiiE2n+tYJXoyqQHuCcyTQDNjkkoUL54oGeMhIQtgt3pK373yjvlomd1uX1tZ4cqJW9ihuWsic8p
	eZnwUaITsMih049P4lQwUV/PuGi1Bmnulmlq1AIRqDKeFSIEauuwG0Uy6NY2IB4TpKJRgWZy3FKWe
	MP+lpbRxQV4HbDyYkLNahLxIYTr/6lg8ScFdR6uGJn21W8S/eL8aoBW6Ub6xofPjPisZ12GdOMrSV
	EncBadag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAo92-0000000GK8Q-3WoU;
	Sun, 27 Sep 2026 12:38:16 +0000
Received: from out-29.mta1.migadu.com ([2001:41d0:203:375::1d] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAo8x-0000000GK6H-2ikX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 12:38:15 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=NuKsMEW2bmL3HYEzGzn4/Q1vMLgkj5WzRXYhVoZ/eTE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790512687; v=1; x=1791117487;
 b=YoOy7FYI07NfKhq/rxl+c8ufiWB9B28zFEShCUlnm5Y7nQYNHkw9kZsJr7lIobFgRXspYp7n
 0EcrpMr/wVykj3uZyhMO/VAnkuU1o6IlmIikfEa23q9V09g26IcWWyi3S17EtSANCYAYqk+OP4B
 /wM4Qld+qoUW7E8/+6jn0HGc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d8f7900bf8c04d17;
	Sun, 27 Sep 2026 12:38:07 +0000
X-Mizu-Trace-ID: d8f7900bf8c04d17
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b8ea0ca5baso4744e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 05:38:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxRGXwFcqNi20aFWNpW4HZE9+xbT8PTfngKK3+0Oxi5npf/3JlxbnveyR/JNUpz89E3O25uz/Foae3pGqZfd/t7@lists.infradead.org
X-Gm-Message-State: AFq9FYI0S78kX6mZvIfXa1TQvt9zCnuXhyj9Lru/I8jLVDtF6jXTAAST
	L64sHxWHq+oS01Fmx/omwU7lfLGiRRTele1RPZYIpEpk72DHZw9vwrGbTmf4zmGCDfmP9wqYC4W
	9n16wycYmcI2qCZzc5aEvbpvwMvpxHOibFU4gYGxb
X-Received: by 2002:a05:6512:b8d:b0:5b6:bcb:26c4 with SMTP id
 2adb3069b0e04-5b8ef285eb3mr99786e87.16.1790512681261; Sun, 27 Sep 2026
 05:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260914113338.159227-1-fuad.tabba@linux.dev> <20260914113338.159227-16-fuad.tabba@linux.dev>
 <86a4ph5fb9.wl-maz@kernel.org> <CA+EHjTzCQkeXQQcCDwABLR2w+NTmKTG3V6RSmhzYNayaoYXw3g@mail.gmail.com>
 <865x045mke.wl-maz@kernel.org> <aq0628Ci4pfEj0KG@willie-the-truck> <871paf3y1n.wl-maz@kernel.org>
In-Reply-To: <871paf3y1n.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 27 Sep 2026 13:37:25 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzmGzwhVg=6jkHxzV6LF_WsdR1drobOFNTVWNyB1ZDGiw@mail.gmail.com>
X-Gm-Features: AclHuK83YcLXY0C9NhVVfgcTUZxPrypRPxP9P25GK7wvjm4osxpyz56DMnGRBu4
Message-ID: <CA+EHjTzmGzwhVg=6jkHxzV6LF_WsdR1drobOFNTVWNyB1ZDGiw@mail.gmail.com>
Subject: Re: [PATCH v3 15/18] KVM: arm64: Reject host access to protected VM
 private state
To: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, joey.gouly@arm.com, seiden@linux.ibm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com, 
	steven.price@arm.com, vdonnefort@google.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_053812_439885_AAEFCF42 
X-CRM114-Status: GOOD (  20.22  )
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

Hi Marc, Will,

On Sun, 27 Sep 2026 09:20:52 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > and it would be really helpful to discuss it on the list. As you probably
> > know, on Android, pKVM has the semantics you describe above: the ONE_REG
> > calls succeed, but the register state isn't propagated to the guest once
> > it's started running. I think we largely did it this way because we were
> > solving a million problems at once during the initial development and
> > having to pipe-clean VMMs wasn't particularly appealing at the time.
> > It's also worth adding that, to my knowledge, we've never had any issues
> > in Android because of this decision.

That's Android 15 (6.6). Android 16 and 17 reject ONE_REG once a
protected vCPU is finalized, except x0-x3 during one forwarded
hypercall so the VMM can complete it [1]. crosvm has shipped against
that on both.

[...]
> > If it's helpful, we can ask the crosvm developers here if they have
> > opinions for/against the two behaviours?
>
> I guess that'd be useful to know what they'd prefer, and also to look
> into what QEMU does in this case -- I'm not exactly a good judge when
> it comes to UAPI definition... ;-)

QEMU stops syncing registers once it has marked the guest state
protected [2] (bar the virtual counter save/restore on stop/cont), and
the QEMU CCA series sets that flag when the VM starts [3].

On the kernel side, the CCA series rejects a SET_ONE_REG for a realm
outside the GPRs, PC and two configuration registers with -EINVAL, and
lets GET return what its message calls "(stale)" values [4].

Given that, are you ok with v4 keeping the error? :D

Cheers,
/fuad

[1] https://android.googlesource.com/kernel/common/+/cfc696b1fb110
[2] https://gitlab.com/qemu-project/qemu/-/commit/5c3131c392f84c660033d511ec39872d8beb4b1e
[3] https://lore.kernel.org/all/20260903193611.1058589-5-mathieu.poirier@linaro.org/
[4] https://lore.kernel.org/all/20260924160504.853911-23-suzuki.poulose@arm.com/

