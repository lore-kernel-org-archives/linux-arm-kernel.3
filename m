Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB6FC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTHe1fmNUO9bvL9hCjLeub+8/tAAP+2ZQbhY2uHobs4=; b=Z2aTsEP+sOsw98FyDzctQKpqB/
	iWTInAkxVcpU7u20oeW/+nvLhrehgsP+RWDo6IlymJ+5878wxG1OwK6Qls5ejgf5N9E4VRLMPN/7H
	9/Y48wR4kqHkmyVY+Gq4PqjMDiVffJZmiMokgtcCqHM1Y+hABNWCWSyuR6iGjUjKonKN2W8+CDfPh
	m3wdzKbIMD7FhYRnil87z9eRuOkFbyNU1fKCDzSP0EJth6DDJsBvMBrd75qaLVNnOxk7bNBtFBZiq
	kt0P2ofoX5ByVjDsQHq8dJAzRfEUGWUbtsHt1uuG9D9+d+V9e34A/iMbvaQIoLevYmn+aZGAUT4gz
	mU+ceh3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppug-0000000Cya7-314b;
	Fri, 31 Jul 2026 16:16:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppue-0000000CyZs-3ELq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 16:16:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DB0036004E;
	Fri, 31 Jul 2026 16:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 936231F00AC4;
	Fri, 31 Jul 2026 16:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785514603;
	bh=iTHe1fmNUO9bvL9hCjLeub+8/tAAP+2ZQbhY2uHobs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f7YBLmtnFmTslofGzS3hwbZxgz4GJWBwGCfZ2n/xsQV6wD1takhdmkFvCjGSLZWmE
	 pZKWQU6ozvZhrilus4n1XAB7J4loKay8CBeiOYTNc3/XmLAilMjky7Lzxnz0SisaxC
	 o/xwV83soagMYdxB1xPD2UNG0XtDxQaJE/XFjnXn4eHm9KCZDYD9gp/w8EL3NwYQzy
	 ZresMeF1Kp+IJ2C7eKinAa2EaNNmF0Pl4eeTebclz8cSzMz4HkkxmVMKPG32hwn4i7
	 kdUyqu2dklna0+IXAWLI2mV//2cin5GnIlYmEiv2ToRjFfOMuCfq1PEkMCo+Ejbejf
	 Gxpd9Xe1fWwow==
Date: Fri, 31 Jul 2026 17:16:38 +0100
From: Will Deacon <will@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arch: arm64: add early_param idle=<wfi|yield|nop>
Message-ID: <amzKZgqrqqM7E_9Q@google.com>
References: <20260711-arm64-idle-param-v2-1-0ab67652a435@cyberchaos.dev>
 <amE5bX0jey6WS0U1@willie-the-truck>
 <a6602971-87f8-4365-9ec2-dfe3a1ccfeb6@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6602971-87f8-4365-9ec2-dfe3a1ccfeb6@cyberchaos.dev>
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

Hi Yureka,

On Mon, Jul 27, 2026 at 10:49:57AM +0200, Yureka Lilian wrote:
> On 7/22/26 23:43, Will Deacon wrote:
> > On Sat, Jul 11, 2026 at 09:35:25AM +0200, Yureka Lilian wrote:
> > > diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
> > > index e278e060e78a..2452990ed37a 100644
> > > --- a/arch/arm64/lib/delay.c
> > > +++ b/arch/arm64/lib/delay.c
> > > @@ -15,6 +15,8 @@
> > >   #include <clocksource/arm_arch_timer.h>
> > > +#include "../kernel/idle.h"
> > > +
> > >   #define USECS_TO_CYCLES(time_usecs)			\
> > >   	xloops_to_cycles((time_usecs) * 0x10C7UL)
> > > @@ -49,7 +51,8 @@ void __delay(unsigned long cycles)
> > >   		 * Start with WFIT. If an interrupt makes us resume
> > >   		 * early, use a WFET loop to complete the delay.
> > >   		 */
> > > -		wfit(end);
> > > +		if (likely(idle == ARM64_IDLE_WFI))
> > > +			wfit(end);
> > Rather than scatter the idle implementation check across all users of
> > WFI*, why not move this into the macro itself? That way, the callers can
> > all stay like they are but the macro behaves as specified.
> 
> In practise, I could only find the following uses of WFI / WFIT / wfi() /
> wfit() in arm64 code: 1) the default idle loop and delay() function;
> arguably the only "real" users 2) parking cores after different kinds of
> unexpected situations / crashes.
> 
> Just to confirm, you are suggesting to add the conditionals to
> arch/arm64/include/asm/barrier.h, and have wfi() and wfit() macros not
> actually do WFI / WFIT depending on the value of the idle param?
> 
> I'm torn about this: We should maybe first discuss what effect idle= should
> have: Should it prevent WFI running anywhere in the kernel when idle=nop, OR
> is its intended use case to change the default arm64 implementations for
> idle and delay, while still allowing other parts of the kernel to use WFI
> (for example, for custom cpuidle implementation)? I think the existing nohlt
> parameter, which disables all idle states, is more fitting for the first
> goal, even though it currently does not prevent the wfit in the delay
> function.

I think nohlt will break the PSCI cpuidle proposal here:

https://lore.kernel.org/all/20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org/

> For preventing WFI anywhere, I think alternatives patching based on the
> earlyparam would be the most reliable way to achieve that, and second most
> reliable way is putting the conditional in the wfi() / wfit() macros.
> 
> But my assumption is that what we want to achieve is actually closer to
> changing only the default idle implementation, while allowing an idle state
> registered at later point to still do its thing (including using WFI for
> this purpose). And for this (and to be more flexible with other idle modes
> e.g. yield), what I proposed in this patch makes more sense, and I'm
> relatively confident it will fulfill the Apple Silicon use case without
> adding many more scattered checks other than these two.
> Does this make sense?

I keep changing my mind about this patch :/

What do you think about a funny sort of hybrid approach where:

  * We have idle=, but it really only affects the idle loop
  * We have a cpu_errata entry to detect (based on the MIDR) this CPU
    and then avoid patching in the WFIT instructions (i.e. don't detect
    the ARM64_HAS_WFXT capability).

I think that would solve the case for you, as well as giving others finer
grained control over the idle implementation and adding the infrastructure
we need to handle a CPU with broken wfit.

Will

