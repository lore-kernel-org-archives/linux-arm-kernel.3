Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE51C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 13:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nspgpTKACwnJViil0+KY2bLyYPAuZdNAZfkrhD4X0fk=; b=OeODX99ZXYZrn/6WLqD2CcCcn6
	j9eWpwDlnYMFiPmD6/YzH1e6AFPeQhBvm34g4sb2xhKOhMIE74HMlavMpQzoqetnoAh0fWiN79GkI
	NIt2ebcuDCAOB3Ptd3OIaTqoOoIUYIbCjSNbcljUWSUl0lxmaCYhFpV/LEw6COv0gBVd93ohqDjuj
	EkXfbM/ptVDzhnKlHvRUwnpJoIo7+OhdvC3oOTANyzQivE7exWosw9KwF4z9a5FAiwDjQLyfg4Cm/
	PdavFHXBbgAy6MVglajTZTMJQoX9JyLJW7GiImCiPu7L9oQCGPq5V4zJmRnQIapS7oePax4LsfaGv
	eiPIT5dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMS6I-0000000B6fi-2Bim;
	Tue, 03 Jun 2025 13:54:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRy9-0000000B4nl-21Ep
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 13:46:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43D0512FC;
	Tue,  3 Jun 2025 06:46:00 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 078913F59E;
	Tue,  3 Jun 2025 06:46:14 -0700 (PDT)
Date: Tue, 3 Jun 2025 14:46:08 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH] arm64/trap: fix broken ct->nmi_nesting when die() is
 called in a kthread
Message-ID: <aD78oNHA5SlaH50z@J2N7QTR9R3.cambridge.arm.com>
References: <20250530092723.3307630-1-yeoreum.yun@arm.com>
 <20250602124738.GD1227@willie-the-truck>
 <aD27GxSWsFekORcy@e129823.arm.com>
 <aD2_Jp7CQgnp15Kx@J2N7QTR9R3>
 <aD3kfTx8sF8/Yar/@e129823.arm.com>
 <aD7EA2Bmp-mrWZaN@J2N7QTR9R3.cambridge.arm.com>
 <aD7ZCnNUqxb9XWNh@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD7ZCnNUqxb9XWNh@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_064621_563080_B8C7A53E 
X-CRM114-Status: GOOD (  17.07  )
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
Cc: linux-arm-kernel@lists.infradead.org, ptosi@google.com, pcc@google.com, catalin.marinas@arm.com, bigeasy@linutronix.de, linux-kernel@vger.kernel.org, joey.gouly@arm.com, mcgrof@kernel.org, broonie@kernel.org, geert@linux-m68k.org, kristina.martsenko@arm.com, james.morse@arm.com, Will Deacon <will@kernel.org>, rppt@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jun 03, 2025 at 12:14:18PM +0100, Yeoreum Yun wrote:
> > On Mon, Jun 02, 2025 at 06:50:53PM +0100, Yeoreum Yun wrote:
> > > So, what I think:
> > >   1. arm64_enter_el1_dbg() should ct_nmi_enter() as it is.
> > >   2. in bug_handler() while handling BUG_TYPE, add above ct_nmi_exit()
> > >      conditional call.
> > >   3. DAIF.D and DAIF.A handling.
> >
> > No, that is not safe. In step 2, calling ct_nmi_exit() would undo *all*
> > of the ct_nmi_enter() logic, and may stop RCU from watching if the
> > exception was entered from some intermediate/inconsistent state.
> 
> Yes if call ct_nmi_enter() without condition.
> But I imply with the condition check what I posted.
> if CT_NESTING_IRQ_NONIDLE,
> it wouldn't need call and that cpu can be watched by RCU.

I am not keen on conditionally calling ct_nmi_exit(), and would strongly
prefer to avoid that, regardless of where that lives in the flow.

I suspect that it would be bettter to triage the interrupted context
earlier, and rethink the way entry/exit works, but that's a much larger
bit of work and will take more thinking.

Mark.

