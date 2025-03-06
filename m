Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39CDC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 13:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M16Hx03LPq6Hpxa+7YZIfd9IWWJDL42bnuEv+y5yizM=; b=ewzY00m1KoxGV90OWL0xvlPwSF
	6dCXc4p9GEy2DMpUkpUUv8sxgrfOS7bWP8FexnuMSjHJ3NiacujE1xKkHTEqoi59Pk/zMJB/36LW0
	RyGMyk56/vRUcqmDOKhJ4rnW+AcCmQLXdVXAfpHxkVTclvVH1RFFpbPuLGY9ljV1o7eLv6t+1zeC2
	Dan76pQQuhoWLrCQoAfgF364dxLl2quG12bqaJzMu1U1mm2xzNqRtn5pIUHlP9NhLeILahdwFDuV4
	5snNsqSUlU+yexPIQok+y0bxfmoWhqhfXgX6+Kn2ZVhPTU6SCMgVigYAPk3oIv/fPeE7a7rEHik0C
	n4DyXWpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAr3-0000000AzI0-255N;
	Thu, 06 Mar 2025 13:01:37 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAGS-0000000AuOS-39AD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 12:23:50 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43bd4ccc4c8so642135e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 04:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741263826; x=1741868626; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M16Hx03LPq6Hpxa+7YZIfd9IWWJDL42bnuEv+y5yizM=;
        b=V5C/PCgv1L89UiWRoCBaqyx7AbbEbhKSANrvYURX+D0x58G7HKCDzswBB4XO2AScas
         kIN/nhRVf6My2Rb6ISU7dwBXdXT8DDQR83XllPNXGFDKzi30ba1Fs/I6cM2cCrl1X9QR
         tBv2sQDuiU8+P5sS2dMMaSnAi1QM1kPWn9Iz4Scaq8lgLliaPIP99Ap/W8oDgBMuTvW9
         e3gQSpBTxhwujKZi8wLzPBJoK6ZAsVjBSMiyu8Wj7q79kv814vijLPMcDI+5iCb++EWO
         WorJHlUfoqplajq9suqOhSImdBr2XZk0kZu6uwZjnQlPo1QUte7uMI3msQkre+z385+3
         mD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741263826; x=1741868626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M16Hx03LPq6Hpxa+7YZIfd9IWWJDL42bnuEv+y5yizM=;
        b=rmGnJzHsQyrh/sEMCJXrwSAk3E0+Iz+WG23xajuccPwsynMcdafpRShKolbTUzdReX
         Te4jCvyq0jDAF2DvTQUkdA/WN/pU7JEBanYCbN0Mp+kPlWF+UKCUwB9yDrfSfWeJ8w25
         Qa3P4nrJMA7M93tEPN38wAam8qHT97bcwjfby/8q01YgzXNwvxG54ybSBfPM70hUf+xS
         IOiDqc6KEpZxQD/Zkm1DAet9o1lJ95JvpHeDqTyKDKbMloB4y3QOEEEdCOdueeEdZzBV
         Kv2CI4g+ES0asn5hAcK/iY4twc7vvqLbiLRiJhinY0oflos5v2MhSSX3ES1jL0VzpsxO
         I/eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoXNK6BXpTehWipk4Y4/5GTBl49zpHwN7qeajIytWx/EzFiOTlcvlMQ1VidjHfaGePZwHqSdiB/f41MxtMe+LQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxugF7WHAKR3SqhV65NaEqTNgNu5XOUA1+cgW6+xyUOZDEfZliR
	aPaIoKqD3SrH3PJMJ7CsgBtUEmkd7O4TzhdInXNinLrG0G2w3TleLV2NXRbHhr0=
X-Gm-Gg: ASbGncs6QByly5Pp2dppCKAi3CVlsjvG6aQM0V30Aj4k8h4msZ1sl9xrupSdnba0YIz
	YXE85wBJaLys4vHNEYLlVfRAb9sK32PfvNfDUZK23xuh+04rWKkoDABD4V9ERone1UZOWbwsIb7
	B9kJrLrk01p3UNLt4DDA9fd98PygIytT8BqUf4G4MPQbVUirJ5b+vjX7mzci6JhAeZEO8Cdk/A+
	5hUGl1l7wXMeoEdtzpn7qoOk+0jGVycplh6RPAb8KWEIb3022mKYO0ENaCTe/8hwHYUzCnDr0tz
	qfnNGK//bZK6Woxef7isqgIHmZ24QqUyTtmNkXQ2IpxM+RnKBvxW5CqxOFY8jNnZ5nQMEWwOPvX
	6M//lc0iRx2w6FbFF47vulsFSEdP4H8fbPwLoByCsS7N0dMDoug==
X-Google-Smtp-Source: AGHT+IFsubZy1stzLlAQAO2x9t8qCSSvv55Pi5w0YDWBthveEExrqPR8Wq2/UXbzt8+RS0SQ+6/D5w==
X-Received: by 2002:a05:600c:3d1a:b0:439:9a1f:d73d with SMTP id 5b1f17b1804b1-43bd2ae647bmr19310215e9.8.1741263826596;
        Thu, 06 Mar 2025 04:23:46 -0800 (PST)
Received: from mordecai.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm1886787f8f.3.2025.03.06.04.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 04:23:46 -0800 (PST)
Date: Thu, 6 Mar 2025 13:23:43 +0100
From: Petr Tesarik <ptesarik@suse.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Valentin Schneider <vschneid@redhat.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-users@vger.kernel.org, Mike Galbraith <efault@gmx.de>, Peter
 Collingbourne <pcc@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Thiago Jung Bauermann
 <thiago.bauermann@linaro.org>, Mark Brown <broonie@kernel.org>, Kristina
 Martsenko <kristina.martsenko@arm.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Jinjie Ruan <ruanjinjie@huawei.com>, Juri Lelli
 <juri.lelli@redhat.com>, Phil Auld <pauld@redhat.com>
Subject: Re: [PATCH 1/1] arm64: enable PREEMPT_LAZY
Message-ID: <20250306132343.6b902a3d@mordecai.tesarici.cz>
In-Reply-To: <Z8hAZ09Q40fxLJSk@J2N7QTR9R3>
References: <20250305104925.189198-1-vschneid@redhat.com>
	<20250305104925.189198-2-vschneid@redhat.com>
	<Z8hAZ09Q40fxLJSk@J2N7QTR9R3>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_042348_802516_441DF544 
X-CRM114-Status: GOOD (  25.23  )
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

On Wed, 5 Mar 2025 12:15:35 +0000
Mark Rutland <mark.rutland@arm.com> wrote:

> On Wed, Mar 05, 2025 at 11:49:25AM +0100, Valentin Schneider wrote:
> > From: Mark Rutland <mark.rutland@arm.com>
> > 
> > For an architecture to enable CONFIG_ARCH_HAS_RESCHED_LAZY, two things are
> > required:
> > 1) Adding a TIF_NEED_RESCHED_LAZY flag definition
> > 2) Checking for TIF_NEED_RESCHED_LAZY in the appropriate locations
> > 
> > 2) is handled in a generic manner by CONFIG_GENERIC_ENTRY, which isn't
> > (yet) implemented for arm64. However, outside of core scheduler code,
> > TIF_NEED_RESCHED_LAZY only needs to be checked on a kernel exit, meaning:
> > o return/entry to userspace.
> > o return/entry to guest.
> > 
> > The return/entry to a guest is all handled by xfer_to_guest_mode_handle_work()
> > which already does the right thing, so it can be left as-is.
> > 
> > arm64 doesn't use common entry's exit_to_user_mode_prepare(), so update its
> > return to user path to check for TIF_NEED_RESCHED_LAZY and call into
> > schedule() accordingly.
> > 
> > Link: https://lore.kernel.org/linux-rt-users/20241216190451.1c61977c@mordecai.tesarici.cz/
> > Link: https://lore.kernel.org/all/xhsmh4j0fl0p3.mognet@vschneid-thinkpadt14sgen2i.remote.csb/
> > Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> > [testdrive, _TIF_WORK_MASK fixlet and changelog.]
> > Signed-off-by: Mike Galbraith <efault@gmx.de>
> > [Another round of testing; changelog faff]
> > Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> > ---
> >  arch/arm64/Kconfig                   |  1 +
> >  arch/arm64/include/asm/thread_info.h | 16 +++++++++-------
> >  arch/arm64/kernel/entry-common.c     |  2 +-
> >  3 files changed, 11 insertions(+), 8 deletions(-)  
> 
> Catalin, Will, given this is small and self-contained, I reckon it makes
> sense to pick this up ahead of Jinjie's series to move arm64 over to the
> generic entry library (which is on my queue of things to review). Even
> if we pick up both, it'll be easier to bisect and debug issues caused by
> this patch alone.
> 
> The fixes/cleanups from Mike and Valentin look right to me, so FWIW:
> 
> Acked-by: Mark Rutland <mark.rutland@arm.com>

Thank you, all. Much appreciated.

Petr T

