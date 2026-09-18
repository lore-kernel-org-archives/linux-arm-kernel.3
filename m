Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E3DC982DD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 19:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8IYTH9i4dCWQ3YBYlg4BiRyNyAFEn5b5sEjDutkcG8=; b=pjSwOOYiTgVTB9zn1wOoRozZ29
	GFUbrbrxXsB+VGHSzNrKo00sR2ug7waLHqu+GVblEPAPkPSXI1TePnsyquXafNeza/I6L3dkqqMQj
	lwzi22XL5scJ3xOLVFPFwehyj4DIUCNKeVwMMdD9pkJW5C1yLt/CDdQDpEHYrlaSyGlqCtGkzHDFw
	mIu4Y++6sSVXF7CSBivSDnARvFGtJY11rD7B0/PwE9EvWla6FRvEe+u+iWvkIolKzzwUmpNwEOMsw
	btyG8hcjfIDLQnxWc66CyrdcHU8W7BkrDcN8mR65AHNQwYin+bE89VflPxE0FI0/SOx68eQ2d8F+f
	qxDFWqLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7e3z-0000000FOhe-26Ju;
	Fri, 18 Sep 2026 19:15:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7e3y-0000000FOhY-2ad8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 19:15:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 072BA43722;
	Fri, 18 Sep 2026 19:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B71C01F000FF;
	Fri, 18 Sep 2026 19:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789758957;
	bh=c8IYTH9i4dCWQ3YBYlg4BiRyNyAFEn5b5sEjDutkcG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YKw6sfhqahSo98FQ4YDH83GDubZmslsBOzCwRX5YmDgRq4HgmZJeuxuuLlj7Wn12F
	 JIG9OZfecc0o4NNUKdBwXgChQhS5qOW5SdJLY5S/tVMCBbxqGzDuUYl3TxbWLC4EWy
	 gUwN/Y4EcNvvttHTWMxLeq+kzDOwANwRuOCT/6YcFyJh6UdAjROaC9kgfsRGBH8KH+
	 A4JafannxaoNil5bz7YTyuzn0Hju8miNiJ13qxM+0cR67wm7FhxSZFInUOc9moQ2PD
	 81EZNkvRtpWmJJtckhzdjUremJPwG4eaSA0hyhPDyp97TmxvhDFVwX9xBfBgsD8hcd
	 GD22mktcJix5g==
Date: Fri, 18 Sep 2026 12:15:56 -0700
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Yuchao Zhang <ndaugoing@gmail.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: vgic: Do not remove in-flight LPIs from
 AP list on disable
Message-ID: <aq2N7HYbQw7zbpCq@kernel.org>
References: <20260918040214.85580-1-ndaugoing@gmail.com>
 <20260918040214.85580-2-ndaugoing@gmail.com>
 <CA+EHjTx8zzvgqj99TKWfRD58X-M8v+hs9358_r_1zZonFNEsgw@mail.gmail.com>
 <CAC2BP3K-fvW2s2j2ys+kPMuxrzeMw9yc6MrAk7U7CqCpb2WePQ@mail.gmail.com>
 <CA+EHjTx9bTDuTnGgkrCcaAG+1S1Lx6+1BZnuhJcWNTJxWXkAHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTx9bTDuTnGgkrCcaAG+1S1Lx6+1BZnuhJcWNTJxWXkAHw@mail.gmail.com>
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

On Fri, Sep 18, 2026 at 12:58:17PM +0100, Fuad Tabba wrote:
> Hi Yuchao,
> 
> On Fri, 18 Sept 2026 at 12:51, Yuchao Zhang <ndaugoing@gmail.com> wrote:
> >
> > Hi Fuad,
> >
> > Thanks a lot for pointing me to that thread! I was not aware of
> > Hyunwoo's earlier report and the discussion with Oliver and Marc.
> >
> > I'll read through the thread and their rationale on the ap_list_lock
> > approach. I'm happy to defer to Hyunwoo's effort to avoid duplicate
> > work.
> 
> I'm not sure you should defer to their effort. It doesn't seem like
> Hyunwoo has done any work on this for a while. I just wanted to point
> you to the existing discussion.

Yuchao if you have cycles I would definitely appreciate it if you can
pursue a fix. My view hasn't changed since before: let's make that
traversal of the ap_list is done under the ap_list_lock, as this is not
intended to be walked lock-free.

Taking a step back, the whole cross-vCPU LPI disabling always leaves me
feeling ill... Really when RWP=0 becomes visible from another vCPU we
need to guarantee that the LPIs have been actually retired, meaning we
can't have one sitting in an LR. Even with the locking fix I think we
miss this.

Given how unlikely it is for well-behaved software to disable LPIs
remotely in the first place, I wonder if we should just halt the VM
similar to how we handle accesses to the active state. That's a really
big hammer but we've had a lot of bugs in this department and I'm
somewhat biased towards an obviously correct solution.

We wouldn't need to do this for a vCPU disabling LPIs on its own
redistributor since we've already exited the guest.

I'll think on it a bit more.

Oliver

