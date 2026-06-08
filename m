Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC79CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xlgzZtWkhSRLPN2fmw7RI5SY6ZXquR97nXbPnLUoA2U=; b=rCRNdos1k9Ywz8iBud7n6L+cEn
	G8RKDyEAXfx2bFE05eyrCsjt7qRAhTe3YaxBni+9PyWsyGKv4UfvuK/2FsbGYtIRXqTa8f9SpEZZO
	KfNGYSwkctB2nC68xO8GLYOcViQ66+i6QSmnMrZrgGSgciLxYs/D0jypPh0+S3UPZnLb3rQozlkNT
	QczJt3JTPq/tcvCdKJQQ64JOhAPQakzyiww8iIZmba2WOeL+sBsxN0KiEn5r5MvSbQE897i2X9l3T
	B+aFcWINZO8Eev6kg8NdI9WikQDfw4XmjvwQqzeyFyFBpQM6J7Gk0cFsliB3sVdjOHrzXa+MR3CHh
	nJjedyWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb9a-00000003nsh-2Bxx;
	Mon, 08 Jun 2026 14:40:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb9Z-00000003nsY-2lYb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:40:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DF7B601D8;
	Mon,  8 Jun 2026 14:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E18A81F00893;
	Mon,  8 Jun 2026 14:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929636;
	bh=xlgzZtWkhSRLPN2fmw7RI5SY6ZXquR97nXbPnLUoA2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Npzdjz3Xq1UzjuuVBBG0NnSMVk5McHRhfN4uwjquRiwdcccTnwLPPF/7OYZTyDDz+
	 chk63GUPEjLI0kgRcnnTnn/bLRc9Ca7x4iwTsyb4E77a7C+E47YPzMkn1x74axwQYQ
	 jqkKBdGSkI3L9wcDkcvBLQXQ0gJH91RmSokyUPvKS7ztUjpXb7pRZVvs1ZZd4yw8yr
	 4e64YhLCIAUB3aMxBccNLLD/Ufe0FptHj3Ti5/hS3Q8xKVpLgs/H4SsOT0Ym8FJQu6
	 8UG8tI4ayI+HCSbG8lC9aew6k71VGwP3h7BHG457NDGBIkcPlcusrIqIj1KF7oa2Q4
	 bdHSaQ2aZKIdg==
Date: Mon, 8 Jun 2026 15:40:30 +0100
From: Will Deacon <will@kernel.org>
To: Sebastian Ene <sebastianene@google.com>
Cc: Marc Zyngier <maz@kernel.org>, catalin.marinas@arm.com,
	oupton@kernel.org, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, vdonnefort@google.com, yuzenghui@huawei.com,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH] KVM: arm64: Forward FFA_NOTIFICATION* calls to TrustZone
Message-ID: <aibUXmzfDsVWcZjY@willie-the-truck>
References: <20260501114447.2389222-2-sebastianene@google.com>
 <86wlxgy00t.wl-maz@kernel.org>
 <afxuDpecPCVA56cL@google.com>
 <86se83xrwx.wl-maz@kernel.org>
 <afyd8u85L5XIl6dh@google.com>
 <86qznnxptx.wl-maz@kernel.org>
 <af3fW468-f1KXCrC@google.com>
 <ahmxiFXXTupafbXw@willie-the-truck>
 <aibQHiYimPP1ylk3@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aibQHiYimPP1ylk3@google.com>
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

Hey Seb,

On Mon, Jun 08, 2026 at 02:22:22PM +0000, Sebastian Ene wrote:
> On Fri, May 29, 2026 at 04:32:24PM +0100, Will Deacon wrote:
> > I'd probably structure it as a separate patch per call, tbh. That way,
> > the commit message can talk about the specific fields that are reserved
> > for a given call. See below.
> > 
> > > Refactor the handling logic in pKVM FF-A proxy to support checking for
> > > SBZ/MBZ values. While at it, drop the do_ffa_mem_xfer macro and replace
> > > it with two functions that make it clear that we re-write the
> > > function-id with a 64-bit variant, to keep the same behavior as before.
> > > Keep each handler in an array of structures together with a mask that
> > > corresponds to the SBZ registers the spec expects.
> > 
> > Although I agree that we should be enforcing SBZ/MBZ paramaters (because
> > we have no idea what they might do in future versions of the spec), I
> > also think that doing this at the register level is too coarse.
> > 
> > For example, the VM ID parameter to FFA_NOTIFICATION_BITMAP_CREATE has bits
> > 31:16 as MBZ. So I think we probably need to do the checking on a
> > per-function basis, like Per is doing in his series:
> > 
> > https://lore.kernel.org/r/20260501-host-direct-messages-v6-0-3f4af727ed85@google.com
> > 
> 
> For the newly added calls like FFA_NOTIFICATION_* we can do that in a
> separate functions, but what about the other existing calls that have
> MBZ registers ? that was the reason for the inline proposal in :
> https://lore.kernel.org/all/af3fW468-f1KXCrC@google.com/
> (to avoid duplicate checks).

For unused parameter registers that are SBZ, I think you could just add
a helper, e.g.:

	ffa_check_unused_args_sbz(struct kvm_cpu_context *ctxt, int reg);

which takes the index of the first unused register and then checks that
all the registers from there to the last unused parameter register are
zero. You can then just call that directly before you start parsing the
SBZ/MBZ fields on the used parameter registers and there's no need for
the table-based indirection in [1].

Will

[1] https://lore.kernel.org/all/af3fW468-f1KXCrC@google.com/

