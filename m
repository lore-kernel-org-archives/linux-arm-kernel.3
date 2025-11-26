Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFADD1039D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQa7pr2d2LWfMGLERrFlEKDeH19thDdsNOy8z01FBYg=; b=ozFRtKOgM8TppK5MOLSN4nR9Om
	VxqJHNnpFlFyqhvkg9o5nuXLKYwONBXh4hQ06WZCZi7O4r1QvO6VFYbUgTzdpRe51uzVs64CK6HQZ
	cRa5CmvV2P04oxy5j4Z5Q0yUk8BBKGb4+i+Gb80rz2NA8M3I6uhGIgxvJeZhVfRwn/wKtzUtHvzlH
	2NsfntzqGxAICWNZTJyt2xys67fKA2TnuEviuvk2TteAAGQxqCGtH9/tlE04dgmF1D03kpIzXvAmD
	aQIT+/FGnA6gof1aoI5BnJj/7x2tqoRYUxNCopLPmoa60heBnDnoJv+nOmFO2Pl2y/JKJh8YF/LiW
	3YnNBz6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOD2v-0000000EpYK-3Eyu;
	Wed, 26 Nov 2025 10:46:49 +0000
Received: from sender3-of-o54.zoho.com ([136.143.184.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOD2t-0000000EpXh-1REM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:46:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1764153999; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SUtnv6J7VsnEM7W/tPWaAY59MO76NcqiqWLy59E4stpw0Oy/UoQu/9x5KWlWm6p+XmkPpbVbaRwEVfqvVSo8MPTkQGjtP96pRr2cEfN1amil6n/gpsbQ5x5L5/MGEFiHgyaqZgeoi6qGxlz3vs7bbQfI2pilJ5iDZMNdg8MDUAw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764153999; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JQa7pr2d2LWfMGLERrFlEKDeH19thDdsNOy8z01FBYg=; 
	b=RGG3sMdrXFgh+ACK59yNKbWfUlgf3Xw8ab1jH2jy1YZcunteDjaeLXR6tBuN/KK9yxgcGroPLEGVhQvDenfKjYN8u5foLnS4MkYL0hmsdWFr9WbudSL7izeledchIbfm+PcCf4mYJI96Oaosa5OfrwLjA/zVf3T4vzR16tFwN7s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=anirudhrb.com;
	spf=pass  smtp.mailfrom=anirudh@anirudhrb.com;
	dmarc=pass header.from=<anirudh@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764153999;
	s=zoho; d=anirudhrb.com; i=anirudh@anirudhrb.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=JQa7pr2d2LWfMGLERrFlEKDeH19thDdsNOy8z01FBYg=;
	b=GjLHrdFlCRbKQosUewtLukpsHWYOb1Q/Zw4/NlQxgEGfHGJiVw4DAm6MhlPCBDB0
	80W0hYhphDDhtGxj4WlqgsDBPLev+nRAmE1NUKmIduuP57b4WfPRbw1mJ8QcfQKosMR
	uycMbEuEGlqVDGsxpHB0wrEeYYRpaG0guYCZU/g4=
Received: by mx.zohomail.com with SMTPS id 1764153997500477.0715187596991;
	Wed, 26 Nov 2025 02:46:37 -0800 (PST)
Date: Wed, 26 Nov 2025 10:46:31 +0000
From: Anirudh Rayabharam <anirudh@anirudhrb.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, longli@microsoft.com, catalin.marinas@arm.com,
	will@kernel.org, tglx@linutronix.de, Arnd Bergmann <arnd@arndb.de>,
	akpm@linux-foundation.org, agordeev@linux.ibm.com,
	guoweikang.kernel@gmail.com, osandov@fb.com, bsz@amazon.de,
	linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH 2/3] irqchip/gic-v3: allocate one SGI for MSHV
Message-ID: <aSbahzqu_3GN-PPJ@anirudh-surface.localdomain>
References: <20251125170124.2443340-1-anirudh@anirudhrb.com>
 <20251125170124.2443340-3-anirudh@anirudhrb.com>
 <86bjkqq9dp.wl-maz@kernel.org>
 <aSa_rxG80LDXDlhr@anirudh-surface.localdomain>
 <86a509qi8p.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86a509qi8p.wl-maz@kernel.org>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_024647_439926_F42FD771 
X-CRM114-Status: GOOD (  36.63  )
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

On Wed, Nov 26, 2025 at 09:02:30AM +0000, Marc Zyngier wrote:
> On Wed, 26 Nov 2025 08:51:59 +0000,
> Anirudh Rayabharam <anirudh@anirudhrb.com> wrote:
> > 
> > On Tue, Nov 25, 2025 at 06:01:38PM +0000, Marc Zyngier wrote:
> > > On Tue, 25 Nov 2025 17:01:23 +0000,
> > > Anirudh Raybharam <anirudh@anirudhrb.com> wrote:
> > > > 
> > > > From: Anirudh Rayabharam <anirudh@anirudhrb.com>
> > > > 
> > > > From: Anirudh Rayabharam (Microsoft) <anirudh@anirudhrb.com>
> > > > 
> > > > Currently SGIs are allocated only for the smp subsystem. The MSHV
> > > > (Microsoft Hypervisor aka Hyper-V) code also needs an SGI that can be
> > > > programmed into the SYNIC to receive intercepts from the hypervisor. The
> > > > hypervisor would then assert this SGI whenever there is a guest
> > > > VMEXIT.
> > > > 
> > > > Allocate one SGI for MSHV use in addition to the SGIs allocated for
> > > > IPIs. When running under MSHV, the full SGI range can be used i.e. no
> > > > need to reserve SGIs 8-15 for the secure firmware.
> > > > 
> > > > Since this SGI is needed only when running as a parent partition (i.e.
> > > > we can create guest partitions), check for it before allocating an SGI.
> > > 
> > > Sorry, but that's not an acceptable situation.
> > > 
> > > SGIs are for Linux to use, nobody else, and that allocation must be
> > 
> > Why does this restriction exist? In the code SGIs 8-15 are left for
> > secure firmware. So, things other than Linux can use SGIs. Why not MSHV
> > then?
> 
> Because SGIs are for *internal* usage. Not usage from another random
> piece of SW. The ACPI tables explicitly don't describe SGIs. DT
> explicitly don't describe SGIs. Do you get the clue?

The name Software Generated Interrupts suggests that it is supposed to be
used by pieces of SW.

Yes, ACPI/DT don't describe SGIs because they're not supposed to be used
by devices. SW has full control over SGIs and it is up to the SW to
assign meaning to them, isn't it?

> 
> > > the same irrespective of whether Linux runs virtualised or not. This
> > > also won't work with GICv5 (there are no SGIs at all), so this is
> > > doomed from the very start, and would immediately create technical
> > > debt.
> > 
> > Hyper-V always presents a GICv3 so we don't need to worry about GICv5.
> 
> Well, that's pretty short sighted of you, and eventually you'll have
> to support it, or just die. So do the right thing from the beginning.

Well, we don't when or if that will happen. But if it does happen, we
can solve it in a way that makes sense for GICv5. If there are no SGIs
at all, great, maybe we'll have a nicer solution then.

> 
> > >
> > > If you want to signal an interrupt to Linux, expose a device with an
> > > interrupt in a firmware table (i.e. not an SGI), and use that in your
> > > driver.
> > 
> > You mean in the ACPI tables? That would require us to modify the
> > firmware to expose this virtual device right?
> 
> Yes. How is that surprising?

It's not ideal that we would need some custom firmware to run Linux on
MSHV (as a parent). Do you think there could be some other possible solution
for handling this in the kernel? Maybe by thinking of it as a platform specific
quirk or something?

Thanks,
Anirudh.

> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

