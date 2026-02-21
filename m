Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB0AC5CFE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 16:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AcL+LjLtgj73uDqcT/XdINauKu/QyxlVh7Et5BeJGAU=; b=X0zaxR26dxg3h6DdIKw5YH1AC4
	ZALASdTgXsYvnBQO0YwvBNK4N/AkEEyYgKXUibV+mBSQAP/Ji3SAcHfyUW/yODPNzf4dK5nviOl+f
	RI0HjuFZuHySb5H2/HRGvloT9F+FGZGrq3D9lrEwtmZe0qB7Z7AVuobAv5D94bNXQDYeTQ6Sd9wgT
	ppX0p7N6J+m2VsHCPiREwQmVXRgaAhycXK3GaJRZzbmDo57ubNODTl50k2Gq6j+kceF3cxaigoGKV
	cCoFUa1JtTYpy4usP77/uHvMtJdu1iqxRvciUQL01e8idLSwJ+2Rng3ul2qOfb5ycSPxwlJBGf3z6
	QoFwPzSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtpS0-0000000GAJ3-0ET5;
	Sat, 21 Feb 2026 16:03:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtpRy-0000000GAIa-03lc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 16:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AcL+LjLtgj73uDqcT/XdINauKu/QyxlVh7Et5BeJGAU=; b=0YgrQZM5mI0X4FF+DOl1FYNvKm
	Q9zSYiUM5uEhaPOtJvMd06M6mNkKisj441dcul8OhViQ1/mbs+QjD7azOeQX83TDjQDy5//PP75zM
	6ThLKoaK0WmUZq4jJA3IuGgExnqmhmcMbzfPj8iC7BEY+tCJwS4s29BAsc/hMcahDFE1Sz1Yee/PZ
	k2TQB8eIPQRbErd/rtNGFv9w15gQNhfCzvu0DqsX8hyAiPd1Axnn2oKoyn+bgyIM0tUQonltBdRA9
	jpL8e1F0Ev07nr7RMhxPxg1mw6v2Xaq0FdHcnlyieimJhi5XkKSqRF2IvBXDEmXug/flcBTFXI0r8
	+mHdI8ug==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33072)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vtpRt-000000002dA-26pU;
	Sat, 21 Feb 2026 16:03:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vtpRs-000000005Rw-1s8h;
	Sat, 21 Feb 2026 16:03:16 +0000
Date: Sat, 21 Feb 2026 16:03:16 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: Add runtime constant support for armv7 and
 !THUMB2_KERNEL
Message-ID: <aZnXRGFJ1F-nT4Ou@shell.armlinux.org.uk>
References: <20260221141831.16136-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260221141831.16136-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_080322_054550_40185006 
X-CRM114-Status: GOOD (  13.35  )
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

On Sat, Feb 21, 2026 at 10:18:31PM +0800, Jisheng Zhang wrote:
> Implement the runtime constant infrastructure for
> armv7 && !THUMB2_KERNEL. So that armv7 can use this infrastructure
> to generate constants to be used by the d_hash(), dentry_cache(),
> names_cache() and so on.
> 
> This is the armv7 variant of commit 94a2bc0f611c ("arm64: add 'runtime
> constant' support") and commit e3c92e81711d ("runtime constants: add
> x86 architecture support").
> 
> As for < armv7 or THUMB2_KERNEL, we fall back to the generic
> runtime-constant.h, no functionality changes.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

This looks fine to me, but it will need to appear in the patch system
for me to apply it. Details linked via my signature below.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

