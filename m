Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE68C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 20:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e1Im/IBNO0y7hI7V+On66xP1EYDvFOgnxomSyh9iREE=; b=AZMOutpzmeabUFt7lRnqlzfzSK
	Zrkkp+cBV6UwUhDSoBm81d7/jjOYk/nbWlaT35d0e3pF08giVOSerJQQUix7THneVLJ+jApmu7/gj
	v/4AlCLs4obMlcbJ6sN79+oCRnLSqlPOtNg+FCrQVfInkdqxfU81WL6x/jft0Pka8r/shfNpI1Ze4
	0+qqvRLLlm4Gd4WirKCEwxLf4ft4RXcqiuwdET4FDbhzLfUUFnygG2p973c6hYayBE8kQRNu96Afe
	Wk0/nwz5zHbLEJCVHKQXCRmK/k/W5GYUDT8ArDYmMQtbjQbR/cM1R0XCZqD9DIEefGiI/eUW4pKaW
	PxhonmUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYVyt-00000000n8B-42i1;
	Sun, 06 Jul 2025 20:28:59 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYVwZ-00000000n1N-1s1o
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 20:26:36 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751833592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e1Im/IBNO0y7hI7V+On66xP1EYDvFOgnxomSyh9iREE=;
	b=coIZzHniJqa9x3uqEcYBcBh6IFco8ufa3Rl6nK5J9/1KHfeE7wh567Qg69/3tQHX56t8MT
	rpQlAQS1vES6w2KZEBsJF5cZ6RVFJ3WXR4Y00ANrrHS8vQ3aDNsb74eNTEaWUpqM1iHBLr
	f5NtH/m+mC8gc6TeplIESxle85pjHdN0RVin/bzNQJIyZ4e1zFh4YUSvxM6H7siJbcGCk8
	S8DGx3qKzLCdQUsKnDlX8VOqwSEMnTeVaEmRl2jngSPDbK+54tF6MLYI8SdbwzPIoI0Dro
	NDLTjxROwWEyKK0OSr0/HEjuIYjuLmFu0ioF9PpUB25x5dFbJFZDsjcr37Ev8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751833592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e1Im/IBNO0y7hI7V+On66xP1EYDvFOgnxomSyh9iREE=;
	b=nqs0sa/Ls300GE1wwnRZMFCNZwbj0GF4RFOMIXnc+Z+pDrx+DuU63uVOI7JLmO9jQsVnGS
	wXipWqz9uLDpyRCw==
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Andy Lutomirski
 <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah
 Khan <shuah@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>, John Stultz
 <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, Richard
 Cochran <richardcochran@gmail.com>, Christopher Hall
 <christopher.s.hall@intel.com>, Frederic Weisbecker <frederic@kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Miroslav Lichvar
 <mlichvar@redhat.com>, Werner Abt <werner.abt@meinberg-usa.com>, David
 Woodhouse <dwmw2@infradead.org>, Stephen Boyd <sboyd@kernel.org>, Kurt
 Kanzenbach <kurt@linutronix.de>, Nam Cao <namcao@linutronix.de>, Antoine
 Tenart <atenart@kernel.org>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH 14/14] selftests/timers/auxclock: Test vDSO functionality
In-Reply-To: <20250701-vdso-auxclock-v1-14-df7d9f87b9b8@linutronix.de>
References: <20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de>
 <20250701-vdso-auxclock-v1-14-df7d9f87b9b8@linutronix.de>
Date: Sun, 06 Jul 2025 22:26:31 +0200
Message-ID: <87cyadrrpk.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_132635_628923_02DC451D 
X-CRM114-Status: UNSURE (   7.65  )
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

On Tue, Jul 01 2025 at 10:58, Thomas Wei=C3=9Fschuh wrote:

> Extend the auxclock test to also cover the vDSO.

I'm not really convinved, that this is the right thing to do. Why can't
this just extend selftests/vDSO instead of creating these

> +#include "../vDSO/parse_vdso.c"
> +#include "../vDSO/vdso_config.h"
> +#include "../vDSO/vdso_call.h"

cross directory oddities? Confused.

Thanks,

        tglx

