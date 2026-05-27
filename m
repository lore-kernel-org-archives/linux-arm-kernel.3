Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73240CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 10:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUY3wO3AXoTGpLJpP08Nie3HTtt2sZoLXbNAigBBj80=; b=ZNhKwaieQ4m4dcftYkAbm3uW0l
	PZ6a5+1gwEq0IVeyHscpPWpGaH9mfGCKbQaBZZ2i9spMXHQf7V9V7wuwbnMaTyDUSKIijmvXl3wtF
	QHN5oIPRXoyIJMXyvTFkR9n/+bQrJab0o2T/EYc4C9NuHU+GxOfD6Bv38nSVDjbhWXiULPM25csCd
	IiQAm/d5dwgVE8f01XErJLuhA1vvtg0pll5OaJjJzEsqCup6GRkzaaaccsE0OA8NCWdQLkni73Zdk
	RATkQFWCNk8yuRZjfLTas8xOf8fJUFzUUQupHX6gx5defw1EV/MAyeW37MIhZ3dOJxvYGEBFr54Ir
	vCkfqBOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBZC-00000003v53-2Tl3;
	Wed, 27 May 2026 10:32:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBZ9-00000003v2K-3vST
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 10:32:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27B751595;
	Wed, 27 May 2026 03:32:40 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98CEB3F7D8;
	Wed, 27 May 2026 03:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779877965; bh=0st74ItZiJDJHY//YKi9k3j5LAz4Sxki0o7s6Hb9c5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JLiGXkxk0Fgkp4N/V0D32PUPj34yCyi7teBulpO88R+mFWUqu6IeJUKwO8I6RMgg4
	 olOb0D10ygJCmOyRBDlt+6nGQU+prgNtRjpdkLDBhFs6V8bLFC9fCYZgLfnMB+9i9m
	 2NLTXZ/Cy1rh7UFF1i8yww+vOhjVDTJYgVz5b/kA=
Date: Wed, 27 May 2026 11:32:37 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>, will@kernel.org, catalin.marinas@arm.com
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	broonie@kernel.org, james.morse@arm.com, oupton@kernel.org,
	tabba@google.com
Subject: Re: [PATCH 00/18] arm64+KVM: FPSIMD/SVE/SME cleanups
Message-ID: <ahbIRe0jR95elM2L@J2N7QTR9R3>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <86se7duvgc.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86se7duvgc.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_033248_014229_79090B43 
X-CRM114-Status: GOOD (  15.43  )
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

On Wed, May 27, 2026 at 09:07:31AM +0100, Marc Zyngier wrote:
> On Thu, 21 May 2026 14:25:38 +0100,
> Mark Rutland <mark.rutland@arm.com> wrote:
> > This series cleans up low-level FPSIMD/SVE/SME state management code,
> > making it easier to maintain and extend (e.g. adding SME support to
> > KVM), and enabling better debugging (e.g. by making SVE/SME save/restore
> > visible to KASAN and KCSAN).
> > 
> > This is purely cleanup, there are NO bugs addressed by this series.
> 
> I had a look throughout, and couldn't see anything untoward other than
> the couple of nits that were already pointed out. Killing the horrible
> asm macros definitely brings a bit of fresh air to this code base.
> 
> Given the sensitivity of the change, I'd like this to simmer in -next
> for a bit. How do you want this to be merged? I'm happy to take the
> whole thing in kvmarm, and share the branch with arm64.

That works for me.

Catalin, Will, any preference?

> I assume you'll post a v2 anyway?

Yep; given the bits that need fixups, I'll send a v2 by the end of this
week unless something explodes.

Mark.

