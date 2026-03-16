Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55E7F46449
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 10:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EtRRL7z2STzmifJPBqKGk/XdEPNe32AtL0ZrNOZGdAE=; b=k/zBMd/7hWR9GSNcLZfd/ytiyS
	vgFNT1F7nPYlKx4uAWkswlWBVO1EZ3zckPmhkwbZDV8EzSd5De7yZkPAC3x5sSyzmBEOFqmVkh8jC
	yq6j0CFcVivXwXExokZRrj4/EJCJ17vHyhcLca0l+nu/c/4S9ynF6/rr90xxilsFncOsEJ9l+1yxd
	QWvWunldcvuGQ7QKJxNAD6qfqXPlw+xbPG9MVATbnS3c7q/jG7I6e8cuvEL5u6l4Vgudeem9qoLJg
	QakWL3ubMS3om3K/pLv0J+omLTco5bojE3LtrsWOElLSbKP1Wwxj2ilmiElWCQOSdZkb3GzgwxQJ3
	t7U4UcJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w25Z3-00000003m8L-36u9;
	Mon, 16 Mar 2026 10:52:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w25Z1-00000003m7M-0MrO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 10:52:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A9F21477;
	Mon, 16 Mar 2026 03:52:36 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 557F23F73B;
	Mon, 16 Mar 2026 03:52:39 -0700 (PDT)
Date: Mon, 16 Mar 2026 10:52:32 +0000
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Sebastian Ene <sebastianene@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH RESEND 2/2] KVM: arm64: nv: Expose shadow page tables in
 debugfs
Message-ID: <vrfd433vtewptnmirvb36i632i2wot4uh7mxkghac2lkww42dy@anzjc5fqojwz>
References: <20260308231829.864983-1-weilin.chang@arm.com>
 <20260308231829.864983-3-weilin.chang@arm.com>
 <abGNLOfKLcNGYcxh@google.com>
 <3virc5zxa7aow3qfuyyjwvzlmnjk4wlsfmmg7lixhder7rhd6q@qtlumbj33fks>
 <87ldfuda2i.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldfuda2i.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_035247_166637_2988E391 
X-CRM114-Status: GOOD (  16.31  )
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

On Sat, Mar 14, 2026 at 09:39:17AM +0000, Marc Zyngier wrote:
> On Fri, 13 Mar 2026 22:28:38 +0000,
> Wei-Lin Chang <weilin.chang@arm.com> wrote:
> > 
> > On Wed, Mar 11, 2026 at 03:41:32PM +0000, Sebastian Ene wrote:
> > > On Sun, Mar 08, 2026 at 11:18:29PM +0000, Wei-Lin Chang wrote:
> 
> [...]
> 
> > > > +void kvm_nested_s2_ptdump_create_debugfs(struct kvm_s2_mmu *mmu)
> > > > +{
> > > > +	struct dentry *dent;
> > > > +	/* format: 0x<vttbr>-0x<vtcr>-s2-{en, dis}abled\0 */
> > > > +	char file_name[2 + 16 + 1 + 2 + 16 + 4 + 3 + 6];
> > > 
> > > Can you hide the size of this definition behind a macro ?
> > 
> > Sure, no problem.
> 
> I don't think a macro helps that much on its own. I'd rather this is
> made a bit more foolproof by directly expressing the actual string
> this results into, and use that for the size:
> 
>   #define S2FNAMESZ sizeof("0x0123456789abcdef-0x0123456789abcdef-s2-disabled")
> 
>   char file_name[S2FNAME];
> 
> which is less ambiguous. The compiler will happily optimise this to a
> nice constant that also accounts for the final '\0'.

Thanks for the advice!
Makes sense to me, I'll change it to that.

Thanks,
Wei-Lin Chang

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Jazz isn't dead. It just smells funny.

