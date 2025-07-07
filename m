Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D8FC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 13:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhF2JcPNoR0FO9hi7SfPGNigJ/u6PP1goT7e88VaZuU=; b=B5106rK1LQWPY+zlT0fud76Sp/
	Z3toBMeZrovwfjyjXpxGfgNjzW+HbFtExvR6pQzJY4WGpJ+Xk8u2OjBxFlpGG9cM2Xz4ZjO1hiT9Z
	9iuY9wirmKsZKuY/UmDvBlnSI4Gsb3vBavlUEREYQ/h1I1zzzXEV3FgSNExGBKAZS369KBf84mf+A
	QW2ZxqU8ErNu9xbZD8HUhL2coUWEPNFO89Q+6BkpkVEWMv8IcdIB/fbWt9gd1FHueK+3PJL4OEFvK
	lQTAsfOV7ioD6mOcES6mMbDdrKperH6Ejzq6g+9IFrryKEgLxaEemtqPrtRrJztlglY634G1/nygS
	nWm9D/lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYlmi-00000002XY6-1eZx;
	Mon, 07 Jul 2025 13:21:28 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYlkK-00000002X3O-2Jhn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 13:19:01 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751894339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GhF2JcPNoR0FO9hi7SfPGNigJ/u6PP1goT7e88VaZuU=;
	b=g4dKB5W1tyUW+YFRe2KJ1+HB6LwWDjm/QZ2/L9NDFe4rdlRCHuLkJBv4HloYruslJQf5Az
	ieZU4/v9UxbqEzoGcBqanZ0k21K8cvkEwMvuf8UGcms97EyaGRM40+9zi93ja1sX5hUNKN
	zkqpWZNTFAbGzjaSLkmswwkf2wQfJEQaaH9OY9hsqO5bDaLNrt7TVdiMgskqAUDsdmVz5f
	LK1pzRL76mNB2cZEb4LxSfZFMUaFYuG7bElIf+lnM1/95IE0fP2PydPccW0QYz0NL4Xs1+
	+bY8n791+LJ9r3V6A0nzKBlEpOxgj0MjLjBKxfjPd7t/amoUxczOmVi2+9gJpQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751894339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GhF2JcPNoR0FO9hi7SfPGNigJ/u6PP1goT7e88VaZuU=;
	b=qzxWP6gLU7cYzA2dZHMLb/Y4QyVyqAL0s3+PqLn+lmwdq52+JB3dp/vkPtESBH93QhFzqr
	mzn8dCRoEljMkKAQ==
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Shuah Khan <shuah@kernel.org>, Anna-Maria
 Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, John Stultz <jstultz@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, Richard
 Cochran <richardcochran@gmail.com>, Christopher Hall
 <christopher.s.hall@intel.com>, Miroslav Lichvar <mlichvar@redhat.com>,
 Werner Abt <werner.abt@meinberg-usa.com>, David Woodhouse
 <dwmw2@infradead.org>, Kurt Kanzenbach <kurt@linutronix.de>, Nam Cao
 <namcao@linutronix.de>, Antoine Tenart <atenart@kernel.org>
Subject: Re: [PATCH 14/14] selftests/timers/auxclock: Test vDSO functionality
In-Reply-To: <20250707082144-159cd778-47f3-428f-878c-8c22d4f297fc@linutronix.de>
References: <20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de>
 <20250701-vdso-auxclock-v1-14-df7d9f87b9b8@linutronix.de>
 <87cyadrrpk.ffs@tglx>
 <20250707082144-159cd778-47f3-428f-878c-8c22d4f297fc@linutronix.de>
Date: Mon, 07 Jul 2025 15:18:58 +0200
Message-ID: <871pqsrvel.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_061900_737116_D5C30AB6 
X-CRM114-Status: GOOD (  12.84  )
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

On Mon, Jul 07 2025 at 09:17, Thomas Wei=C3=9Fschuh wrote:
> On Sun, Jul 06, 2025 at 10:26:31PM +0200, Thomas Gleixner wrote:
>> On Tue, Jul 01 2025 at 10:58, Thomas Wei=C3=9Fschuh wrote:
>>=20
>> > Extend the auxclock test to also cover the vDSO.
>>=20
>> I'm not really convinved, that this is the right thing to do. Why can't
>> this just extend selftests/vDSO instead of creating these
>>=20
>> > +#include "../vDSO/parse_vdso.c"
>> > +#include "../vDSO/vdso_config.h"
>> > +#include "../vDSO/vdso_call.h"
>>=20
>> cross directory oddities? Confused.
>
> Then we'd have to duplicate the auxclock management into the vDSO selftes=
ts.

Fair enough.

> I intend to introduce some vDSO accessors which force the usage of the vD=
SO
> fastpath by using parse_vdso.c to directly call into the vDSO and seccomp=
 to
> inhibit the fallback syscalls.
>
> Or, to avoid a dependency we could move the vDSO parsing one step up to
> tools/testing/selftests/vdso_support.h, and clean up the interfaces.

Maybe that's not the worst thing as there are VDSO tests in several
places by now.

Thanks,

        tglx

