Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5128F5A8A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 17:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRc6tzbhIjqa28m1qmW4UX0qWCRaHh+34fkYVAyFgQw=; b=zH+Blb6R/8+Yq3tE7QvZlau4SS
	SaIyEM1F9RlUvVVSekJ3LmyTzPa4cYOspecI/5lBl8IF8hmtXol5nUBYUcxZ6kRS5oKrZftS9SyMv
	tyncjhWTrfNr5AliRITeDArf7/iG4rRM1ck402DiC9N7vAKRApfkzuR4JhYwvsTPd96PDgm+KCPj7
	+bIcRBwBZyONoC4KQb1s/o7kCjTH/FG/2gko4LZO+quzZtL6aLftJVINv6LHpGRswBRt0XpAOq+XF
	LdN3BXHQrShpDVHbo95+7uSfi9gezfV1vkXSjKboZSP6jHZ8KDMhQYu4ecipopx6sv7fLMKzZ0wVm
	XNgDPReQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEs2q-00000007TFl-26Mq;
	Mon, 20 Apr 2026 17:04:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEs2n-00000007TFN-2PjT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 17:04:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B54D01516;
	Mon, 20 Apr 2026 10:04:13 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50C183F915;
	Mon, 20 Apr 2026 10:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776704659; bh=yRc6tzbhIjqa28m1qmW4UX0qWCRaHh+34fkYVAyFgQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wacy9S/ZPt9Y7v/ct+Hb+QPydm3fjVRQplB9QxXGOsLTBekpTPqnsaMca0kamuoEW
	 SGQ6QONwRmBlO8d/cVwMwpP6TU7OmYw273xBR7Zj7hU5thdu5jlLJAp8INH5VzhLz9
	 ijzBSlASATvCse9gHcojqyT85ag+98biT096gBAc=
Date: Mon, 20 Apr 2026 18:04:12 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	peterhuewe@gmx.de, jarkko@kernel.org, jgg@ziepe.ca,
	oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com,
	sebastianene@google.com
Subject: Re: [RFC PATCH 4/4] firmware: arm_ffa: check pkvm initailised when
 initailise ffa driver
Message-ID: <aeZcjPaIiCHYVwfd@e129823.arm.com>
References: <20260417175759.3191279-5-yeoreum.yun@arm.com>
 <87se8sbozv.wl-maz@kernel.org>
 <aeNeNjfO7i128TIP@e129823.arm.com>
 <87pl3vb5bm.wl-maz@kernel.org>
 <aeS4rAeVQ0yJIPYw@e129823.arm.com>
 <aeXp7WSqpXNytNPG@willie-the-truck>
 <aeXxCe4hdizdQbFD@e129823.arm.com>
 <aeYDMEgWdt8F9jWb@willie-the-truck>
 <aeYGeojpqcYAN5++@e129823.arm.com>
 <20260420-olivine-cobra-of-brotherhood-bfd4bd@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-olivine-cobra-of-brotherhood-bfd4bd@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_100421_779508_6B0377AB 
X-CRM114-Status: GOOD (  29.61  )
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

> On Mon, Apr 20, 2026 at 11:56:58AM +0100, Yeoreum Yun wrote:
> > Hi Will,
> >
> > > [+Seb for the pKVM FFA bits]
> > >
> > > Ah sorry, I mixed up the ordering of 'module_init' vs 'rootfs_initcall'
> > > and thought you wanted to probe the version earlier. But then I'm still
> > > confused because, prior to 0e0546eabcd6 ("firmware: arm_ffa: Change
> > > initcall level of ffa_init() to rootfs_initcall"), ffa_init() was a
> > > 'device_initcall' which is still called earlier than finalize_pkvm().
> >
> > Right, and this is what I missed when writing patch
> > 0e0546eabcd6 ("firmware: arm_ffa: Change initcall level of ffa_init() to rootfs_initcall").
> > and it still exists even if it's device call.
> >
> > However, rather than changing ffa_init to rootfs_initcall, moving ima_init
> > to late_initcall_sync is a better approach, as it also addresses similar
> > issues for TPM devices that do not use FF-A. For this reason,
> > the FF-A-related changes were reverted.
> >
> > As a result, patch 4/4 addresses an issue that existed independently of
> > 0e0546eabcd6, as you pointed out.
> >
>
> I was not fully convinced by commit 0e0546eabcd6 ("firmware: arm_ffa: Change
> initcall level of ffa_init() to rootfs_initcall"), and I had raised this
> concern at the time. However, in the absence of a better alternative, we
> proceeded with merging it.
>
> My concern remains essentially the same. That change moved the initcall one
> stage earlier, and now, by introducing `late_initcall_sync()`, we are
> effectively shifting the dependency issue one stage later instead of resolving
> it in a more fundamental way. From my perspective, this still relies on
> adjusting initcall ordering as the primary means of making the dependency
> work.
>
> I do not think that is a robust or sustainable approach. Tweaking initcall
> levels tends to be inherently fragile because it addresses the symptom through
> sequencing rather than establishing a clear and explicit dependency model.
>
> I also recall that `finalise_pkvm()` is itself at `device_initcall` level. If
> that is correct, would this not introduce another ordering issue or at least
> leave us exposed to similar dependency problems? That is exactly why I remain
> uneasy about solving this by continuing to move initcalls backward or forward.
>
> More broadly, the fact that we are revisiting the same class of issue again
> after such a short time reinforces my concern that this direction is not
> sufficiently stable. We may revisit it soon after we merge this approach.

I understand your concern about relying on initcall ordering.

However, I think there is an important difference in scope in this case.
This change primarily affects the IMA subsystem, and the impact is
largely confined to IMA (at least based on my current understanding).

Also, this is not just about FF-A. The issue arises when TPM devices are
deferred, and IMA does not handle such cases properly. From that
perspective, moving ima_init() to a later stage is not simply about
adjusting ordering, but about ensuring that IMA correctly handles its
dependency on TPM devices.

In other words, the goal here is not to align dependencies indirectly
via initcall levels, but to ensure that IMA is initialized only after
its required dependencies are ready.

Regarding pKVM, finalise_pkvm() runs at the device_initcall_sync level.
Because of this, the FF-A driver needs a reliable way to determine when
pKVM initialization has completed, rather than relying purely on
initcall ordering.

--
Sincerely,
Yeoreum Yun

