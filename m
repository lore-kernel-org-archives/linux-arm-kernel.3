Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8152BD10DDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 09:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbvGTcb19VTku5AfvxtxRSOO5WhMzaPzK3JnrNDkBFo=; b=3oOMXOSpUEgEtsy1UVUKxS/eFp
	NEXAIcub2kz+6gr+oyNoR/MS2MdCEO2BLXEkzqbz9iaRzb/xp3oX0MlzftPQBDtaXjLVzYopLjDGg
	1YVQjXFWvSlHcw8fLQcGuNGQn6ETRpDTTzLWgyupuya9t2NAGNuteSbwlwfzjLhMu0hHZZubehckd
	P++XRHxJAWlH/lEpmczLx16+0zA+RueuXS68uCSMBJe5WdPD9zGngVCb1njjs+GPmWqbGMkW6uQSB
	fCHQvHzDZV27UK0WNrKPXOSX89CD3GLVGPIc8pz92FCHUlv5l6dQOPjn/Kq7e45PJNYPP2ZG+QBFG
	M3/rLLZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI3B0-00000005dfi-2AhK;
	Mon, 02 Dec 2024 09:57:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI3A0-00000005dVR-1gUa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 09:56:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9B12FEC;
	Mon,  2 Dec 2024 01:56:34 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 975583F58B;
	Mon,  2 Dec 2024 01:56:05 -0800 (PST)
Date: Mon, 2 Dec 2024 09:55:56 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Andre Przywara <Andre.Przywara@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [boot-wrapper v5] aarch64: Start Xen on Armv8-R at EL2
Message-ID: <Z02ELNY-6PA3wcK7@J2N7QTR9R3>
References: <20241127102300.2822848-1-luca.fancellu@arm.com>
 <Z0hOCh16ThvfN-Jr@J2N7QTR9R3>
 <D246D077-897A-43AF-9B7F-38990A1800B2@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D246D077-897A-43AF-9B7F-38990A1800B2@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_015608_482757_D454A396 
X-CRM114-Status: GOOD (  19.19  )
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

On Thu, Nov 28, 2024 at 11:06:14AM +0000, Luca Fancellu wrote:
> > On 28 Nov 2024, at 11:03, Mark Rutland <mark.rutland@arm.com> wrote:
> > On Wed, Nov 27, 2024 at 10:23:00AM +0000, Luca Fancellu wrote:
> >> When bootwrapper is compiled with Xen support and it is started
> >> at EL2 on Armv8-R AArch64, keep the current EL and jump to the
> >> Xen image using the SPSR_KERNEL as spsr_el2 value.
> >>
> >> The only available boot method on Armv8-R AArch64 when starting
> >> Xen is spin table at the moment, reflect this in the build
> >> configuration.
> >>
> >> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

> >> +# Don't allow PSCI + Xen + aarch64-r
> >> +AS_IF([test "x$USE_PSCI" = "xyes" -a "x$USE_ARCH" = "xaarch64-r" -a "x$X_IMAGE" != "x"],
> >> + [AC_MSG_ERROR([With aarch64-r and Xen, PSCI must be disabled.])]
> >> +)
> >
> > I'll delete the comment and change the message here to:
> >
> > With an AArch64-R Xen, boot method must be spin-table.
> >
> > ... since that's consistent with the other message above:
> >
> > With an AArch32 kernel, boot method must be PSCI.
> >
> > ... and it's slightly nicer to tell the user what will work rather than
> > what won't work.
> >
> > Otherwise this looks fine to me, and I will apply this shortly (with
> > those changes) if no-one objects.
> 
> Sounds good to me! Thanks!

Thanks; applied (with those fixups).

Mark.

