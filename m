Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B488C71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 12:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kwm6Q3e6wSWJBfVDvRFl9+KrkJAtrmY8c4WD++NBMos=; b=P8xepSOBcNdnWftE9YHKd7yYtb
	GQ6I/JbgY338w2sEngQ+eZYvHDvwuRd1MeB+foCqk/w90QHdv6ZtStMwXc0gH0Jmr9/bS7rd2Tpw6
	1OJ1UflSSRmyC+ywWfOTTbz9q3glMi27KQdajzDIe2S6/GQzfjg4sUpEXQ7ONvAa40h+vA2uebvzW
	6sNhhFUAp5ARYOP5CoC+IgtSgH4VnC0cjUZO30T2T6yc5/zGUGZGeZbxUIWosKpHeA503Joe447x/
	BXIMLRRSako97MZbsrbX08bhrfOSDNN7zFIWIxetf+DF8RtCFpN2Z7jxlULPLFgkno4M83AkxN+1v
	OcQgmIyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8wO-00000004Mmh-2OWD;
	Mon, 16 Jun 2025 12:27:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR83G-00000004Ctt-0HnP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 11:30:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A028749F92;
	Mon, 16 Jun 2025 11:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 215DEC4CEEA;
	Mon, 16 Jun 2025 11:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750073457;
	bh=qF+W8quHXLHHAKZPzpHYUEFKApC9/3tqpkRo0sEKlIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fo8PQdtLlrssX+hei7P8EJLKpMa1xTScxIAUGqKueS/66+InyMpFX0VJDws59tGp3
	 mn+m65UN4hbimRnADg9YPlA3uaapRv2noXWyGoNxITfeAkm3/BDB3tF8OYV5mAVr41
	 ZbjIxYPWrsFfHkhqpbOr+B1Fx3FL9j5yi82ddQ4dYis+fjlTaDjQ2f7Dgv7eQGz5hP
	 mHD/xKtJDusl4DR7K55WkkTeLk5M1VGW2iPtFF5L83AgG3nt+qD9XUtXIyaMywyB1u
	 2Cz8PSNIBApXacIMFH7DbUaMAFXy/IupUwzOIClvsWlqC4soHbJCO2T/eVasnf5ucN
	 m3Jj/rMRCbUag==
Date: Mon, 16 Jun 2025 12:30:52 +0100
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Catalin marinas <catalin.marinas@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] arm64: Unconditionally select CONFIG_JUMP_LABEL
Message-ID: <20250616113052.GA17582@willie-the-truck>
References: <20250613141936.2219895-1-maz@kernel.org>
 <aEw6A5-xvWSGPnOF@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEw6A5-xvWSGPnOF@J2N7QTR9R3>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_043058_126416_B99821EF 
X-CRM114-Status: GOOD (  18.94  )
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

On Fri, Jun 13, 2025 at 03:47:31PM +0100, Mark Rutland wrote:
> On Fri, Jun 13, 2025 at 03:19:36PM +0100, Marc Zyngier wrote:
> > Aneesh reports that his kernel fails to boot in nVHE mode with
> > KVM's protected mode enabled. Further investigation by Mostafa
> > reveals that this fails because CONFIG_JUMP_LABEL=n and that
> > we have static keys shared between EL1 and EL2.
> > 
> > While this can be worked around, it is obvious that we have long
> > relied on having CONFIG_JUMP_LABEL enabled at all times, as all
> > supported compilers now have 'asm goto' (which is the basic block
> > for jump labels).
> > 
> > Let's simplify our lives once and for all by mandating jump labels.
> > It's not like anyone else is testing anything without them, and
> > we already rely on them for other things (kfence, xfs, preempt).
> > 
> > Link: https://lore.kernel.org/r/yq5ah60pkq03.fsf@kernel.org
> > Reported-by: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> > Reported-by: Mostafa Saleh <smostafa@google.com>
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Catalin marinas <catalin.marinas@arm.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> 
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> 
> It might be worth noting that even with this, we still need to take care
> to not use arbitrary static keys in hyp code (since we don't to consume
> anything that can legitimately be flipped after hyp initialization), but
> that aspect should be dealt with by reviewing additions to image-vars.h.

Right, we should probably try to re-use the static key sealing mechanism
used for the handling of __ro_after_init keys so that the host doesn't
try to patch the hyp text after de-privilege (which will result in a
panic).

Will

