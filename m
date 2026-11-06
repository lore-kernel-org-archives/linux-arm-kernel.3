Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A3A606A338
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 11:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gxVNPbmw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=AwukKVVr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=L2x+FqwNN2SjKcTzPIIXmSlScBdMJ5xQvJIpzaDWbMI=; b=gxVNPbmwQg51GtMprA2V+taCLd
	o3bFkJfdy8Uv7MdxVCRK1jeROaGSz/q2WquyAJ7nm1bdlyDiLWhlZCVv1kFqjUwo/L6p1LepK3Oku
	2dcGryvPv2gPhOPvJDwwvHJvOTHy2Lzb6Pa5+qF5CLuEQw29Fg1+Xr9ACZYYdVBXyjBTRyCZrywP5
	uWERLIgrUgCoPB60bai/80FFA+yKrdHEJOFfuYDdd5T/UClOAOBvH0s8lIx6FjoBhDu0YqPuuvHkH
	YEC7DPXnIzji7V8tUUoA9PJv8u8ngAEc5zIQM9l9ASbvn1DiYcQfCFG9xfPAr2HI3kHi/7ISx/5K9
	iOxOsfSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIVy-0000000CDtC-1L5D;
	Fri, 06 Nov 2026 11:53:50 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIVw-0000000CDrr-0lNg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 11:53:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=L2x+FqwNN2SjKcTzPIIXmSlScBdMJ5xQvJIpzaDWbMI=; b=AwukKVVr54QxOzzZVEdehAsFBE
	6MnontVg6GSYdkC22unJinnfGQ56l6xMbjwVpJCbWVfEkB8pbWdbkZChK7Whp1NJXMqrUWr+pRLOD
	dXlapB1c+oZaT6eFow5GN+K0WzGA2jmOUylhnA+2PL3phwI0oiZxvEpaguNb8SxCg4EMZjd45grKM
	d32HPtAWx4hxKP4mVjDhOQAPGWFtIAZqwli7NNi8kfKPQ5VT0RDHiWKwBu5cNaBAtEkUt1d4Y0H7e
	wHOnJ5cthoRLrrvIrr2BB69SV24mmWtM+8CF1DbmL5eeR9wUFB6MnrVRoBvTIHWWxqSOTa3K4fAYw
	7snhfS6w==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xPIVK-009GNp-3B;
	Fri, 06 Nov 2026 11:53:11 +0000
Date: Fri, 6 Nov 2026 03:53:04 -0800
From: Breno Leitao <leitao@debian.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Subject: Re: [PATCH v2 2/2] arm64: sdei: Preserve the interrupted context's
 exception registers
Message-ID: <au2_ZaHK0gpqPIFR@gmail.com>
References: <20261105120835.3321912-1-kirill@shutemov.name>
 <20261105120835.3321912-3-kirill@shutemov.name>
 <auyjSmtuqkXCqMvl@gmail.com>
 <au27CSJbg2Wdqh42@thinkstation>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <au27CSJbg2Wdqh42@thinkstation>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_035348_222337_FD09E55A 
X-CRM114-Status: GOOD (  13.82  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Thomas Huth <thuth@redhat.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Usama Arif <usama.arif@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, kernel-team@meta.com, Doug Anderson <dianders@chromium.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>, mrigendrachaubey <mrigendra.chaubey@gmail.com>, Will Deacon <will@kernel.org>, Linus Walleij <linusw@kernel.org>, Dawei Li <dawei.li@linux.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 11:34:19AM +0000, Kiryl Shutsemau wrote:
> On Thu, Nov 05, 2026 at 07:41:12AM -0800, Breno Leitao wrote:
> > On Thu, Nov 05, 2026 at 12:08:34PM +0000, Kiryl Shutsemau wrote:
> > Tested-by: Breno Leitao <leitao@debian.org>
> > 
> > Tested on NVIDIA Grace (firmware SDEI) with next-20261104, KASAN + lockdep,
> > ARM_SDEI_NMI=y: sysrq-l under stress-ng, with a kprobe on show_regs() and
> > eprobes on irq_disable/irq_enable that fault on purpose.
> > 
> > Without the series the box crashed (a task interrupted in el0t_64_sync
> > got the handler's BRK, then lockdep/KASAN fallout and a hard lockup)
> > 
> > With it, KPTI off and kpti=1, ~4000 kprobe hits and ~5500 faults in
> > irqentry_nmi_enter()/exit() produced no warnings or stalls.
> 
> Thanks for testing!
> 
> Just to clarify, does your Tested-by apply for whole series, right?

Right. I was planning to do it in the cover letter, but, there was no
tags there (such as Signed-off-by:) so, I did it on the second one.

