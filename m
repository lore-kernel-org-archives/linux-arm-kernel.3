Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40CFF588E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 15:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORJwumzIdeBv3Fu4R1uWwOxGHiT5kMe0dQTiVgSLw6k=; b=HWjX4+/u/kHAwvArXuE7PBIFYD
	OeiYV3h9r9hBPcSTgmocHarJwargCTBucjmcxvPq3rRwxMzubvsnk7bxycnz/i4ppoTC+HWLUCIFy
	kdQG/x094iWnBDpBwAC+PUhMSnGMw79bL68jbXf5DIydQrj9arNzQdC7iAQW/kx7onXy+Y3eFzVmp
	kVXGsGfun9xNPVVB9Rk1BFQhptrso21KL3+sd1O4tX1kp4lMuOQ3v+xKRwDWICl/oSDNgsli9jAOU
	T7JmcgqhpeUxcD9kdFNUep3jTG/Youf81F8e6R2qXkLojg04W5juNMFJnxSaygHR55mjQTcAekeNV
	+1Bd866A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqqE-00000007LqD-2cYN;
	Mon, 20 Apr 2026 15:47:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqqC-00000007Lpr-0x4E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 15:47:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C839409B0;
	Mon, 20 Apr 2026 15:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A361CC2BCB4;
	Mon, 20 Apr 2026 15:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776700035;
	bh=gQYl0ouZNK7K2Ui1Jbhz83qYxErusxL0Qfr6kR5eiJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TUpWpp2dE22qfn8HiAp791wTxLZ9qlUT4BUg+Zrh7Bb0L2jZBbSI2/8kVNDbInyFJ
	 vy3b1iQ2zB4sgMCqN7VKuNqYCUtgtwankXFfSQyv8uAOmriSRgoP/mYretVXs85GNP
	 WmaD4WMzEKrrOsiRGLFTUPSfBbHWfCvtXZ7XZm113B5OSsWL34P6Dz1tt7pjoUeOfz
	 EQfztFzs1SPkZnpD/MpIaG/uXX2UwErvh+g7EYUIs7x1nbk4NqAHKZsV7fD2/WtmX5
	 o2pt3rERhqFRNCKFFslVqiRtDQhA43tulNMsIvgTbgljB5wcvHjGFDD32Hp5vlZfsA
	 kjJh2kB8jYShw==
Date: Mon, 20 Apr 2026 16:47:06 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
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
Message-ID: <20260420-olivine-cobra-of-brotherhood-bfd4bd@sudeepholla>
References: <20260417175759.3191279-1-yeoreum.yun@arm.com>
 <20260417175759.3191279-5-yeoreum.yun@arm.com>
 <87se8sbozv.wl-maz@kernel.org>
 <aeNeNjfO7i128TIP@e129823.arm.com>
 <87pl3vb5bm.wl-maz@kernel.org>
 <aeS4rAeVQ0yJIPYw@e129823.arm.com>
 <aeXp7WSqpXNytNPG@willie-the-truck>
 <aeXxCe4hdizdQbFD@e129823.arm.com>
 <aeYDMEgWdt8F9jWb@willie-the-truck>
 <aeYGeojpqcYAN5++@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeYGeojpqcYAN5++@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_084716_319086_B744FE7B 
X-CRM114-Status: GOOD (  22.09  )
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

On Mon, Apr 20, 2026 at 11:56:58AM +0100, Yeoreum Yun wrote:
> Hi Will,
> 
> > [+Seb for the pKVM FFA bits]
> >
> > Ah sorry, I mixed up the ordering of 'module_init' vs 'rootfs_initcall'
> > and thought you wanted to probe the version earlier. But then I'm still
> > confused because, prior to 0e0546eabcd6 ("firmware: arm_ffa: Change
> > initcall level of ffa_init() to rootfs_initcall"), ffa_init() was a
> > 'device_initcall' which is still called earlier than finalize_pkvm().
> 
> Right, and this is what I missed when writing patch
> 0e0546eabcd6 ("firmware: arm_ffa: Change initcall level of ffa_init() to rootfs_initcall").
> and it still exists even if it's device call.
> 
> However, rather than changing ffa_init to rootfs_initcall, moving ima_init
> to late_initcall_sync is a better approach, as it also addresses similar
> issues for TPM devices that do not use FF-A. For this reason,
> the FF-A-related changes were reverted.
> 
> As a result, patch 4/4 addresses an issue that existed independently of
> 0e0546eabcd6, as you pointed out.
> 

I was not fully convinced by commit 0e0546eabcd6 ("firmware: arm_ffa: Change
initcall level of ffa_init() to rootfs_initcall"), and I had raised this
concern at the time. However, in the absence of a better alternative, we
proceeded with merging it.

My concern remains essentially the same. That change moved the initcall one
stage earlier, and now, by introducing `late_initcall_sync()`, we are
effectively shifting the dependency issue one stage later instead of resolving
it in a more fundamental way. From my perspective, this still relies on
adjusting initcall ordering as the primary means of making the dependency
work.

I do not think that is a robust or sustainable approach. Tweaking initcall
levels tends to be inherently fragile because it addresses the symptom through
sequencing rather than establishing a clear and explicit dependency model.

I also recall that `finalise_pkvm()` is itself at `device_initcall` level. If
that is correct, would this not introduce another ordering issue or at least
leave us exposed to similar dependency problems? That is exactly why I remain
uneasy about solving this by continuing to move initcalls backward or forward.

More broadly, the fact that we are revisiting the same class of issue again
after such a short time reinforces my concern that this direction is not
sufficiently stable. We may revisit it soon after we merge this approach.

-- 
Regards,
Sudeep

