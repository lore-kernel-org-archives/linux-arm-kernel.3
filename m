Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294EAC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 07:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbNaBMRffd1cuETaW84fUJxr1cT/KME73I7nEiQPdMM=; b=uijrfUkynKMGhfXv3+XAPUBbkk
	5NHLMH0/Qx4Yu+JfmPZfSM66iPVrLGcjNToovt1Hd81z8MGCgDRyDtq8gBqsFLYch3CNhR4y092P7
	CvhFSreZZvrMvcJeXLR40AF0E3vwVIbu4Dt7u2RATO+RHcvbXtBawkUECzDN15WeILUFN6c+QCjDD
	Hh+XCOsbrQvvMNMO8pTEzwt4l2LMQQokxoUTV1TTi980CDsVmHfLF2nB/c61I2hx9VkFiaw+7k4jX
	Fp3J63z96N9/6M72GDQ1OtXK4bTgmxq0xZ977E6wnilr33EXV+MHPVaMNaVH8QgMG9y1umyUyxE4K
	ySkJpduw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzA3E-0000000HHQ8-1hDr;
	Mon, 31 Mar 2025 07:59:20 +0000
Received: from fanzine.igalia.com ([178.60.130.6] helo=fanzine2.igalia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzA1V-0000000HHCL-3Tgp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 07:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:
	Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WbNaBMRffd1cuETaW84fUJxr1cT/KME73I7nEiQPdMM=; b=PgLlqdibyFcOyQhgFTfYDgJvaW
	qtYnHqxmpTj3zZm1Artv8boPsbA+PH47grvkmcb7iicuiD3xlVNA3acx0q5swg12alMpk4IgYOQyS
	WSKNa0AYxtZhGCrUx/qFkj8vJa8UH2ioUlPfEmGr8hj8b3UQi9F6q6KteUHOY+JVA9Wt6Yj9UZUsu
	XpokjDiIWSMzM1CqkTOC3G3b5hKbp3fqJhHR0zuy5yi7I8BdZfrYcogii/2Y8T3SL6JFZNRe+szmq
	exMGajXE1vhTyrFFKp2mlKTSXQWU5/fdNkiRBBY9cGu6nXbQ9BapuckgFhCVAshgEvuyopsGZ/pQd
	0iCjd6sw==;
Received: from i59f7adb6.versanet.de ([89.247.173.182] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1tzA1I-0096Bo-B1; Mon, 31 Mar 2025 09:57:20 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Mar 2025 09:57:17 +0200
Message-Id: <D8UAHZY0DJ19.18319MPVM5SPC@igalia.com>
Cc: <linux-arm-kernel@lists.infradead.org>, <will@kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH] arm64: Don't call NULL in do_compat_alignment_fixup
From: "Angelos Oikonomopoulos" <angelos@igalia.com>
To: "Catalin Marinas" <catalin.marinas@arm.com>
X-Mailer: aerc 0.20.1
References: <20250326133521.13637-1-angelos@igalia.com>
 <Z-bzOrF-4lSykkgJ@arm.com>
In-Reply-To: <Z-bzOrF-4lSykkgJ@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_005734_163421_2345CA65 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

On Fri Mar 28, 2025 at 8:06 PM CET, Catalin Marinas wrote:
> On Wed, Mar 26, 2025 at 02:35:21PM +0100, Angelos Oikonomopoulos wrote:
>> do_alignment_t32_to_handler only fixes up alignment faults for specific
>> instructions; it returns NULL otherwise. When that's the case, signal to
>> the caller that it needs to proceed with the regular alignment fault
>> handling (i.e. SIGBUS).
>
> Did you hit this in practice? Which instruction triggered the alignment
> fault that was not handled by do_alignment_t32_to_handler()? Standard
> LDR/STR should not trigger unaligned accesses unless you have some
> device memory mapped in user space.

Yah, I've hit this in practice. The offending instruction was an ldrex
to an unaligned address, while running 32-bit code on an "Ampere(R)
Altra(R) Processor Q80-30 CPU @ 3.0GHz". Fixing the unaligned access in
the program is one thing, but this resulted in multiple oopses in CI.

>>  #define REGMASK_BITS(i)	(i & 0xffff)
>> =20
>> -#define BAD_INSTR 	0xdeadc0de
>> +#define BAD_INSTR	0xdeadc0de
>
> Unrelated change (white space I guess), please drop it, not worth
> fixing.

That snuck past me in an amend, will send a v2.

Thanks,
Angelos


