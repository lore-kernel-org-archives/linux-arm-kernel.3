Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1395CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 00:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9aw3k91pDoBMTIya0ydY2C08rTpxsNiCITG8XwHmzjw=; b=IpAOGGc+3VknnPJYIpOYZFtwik
	TVLXJdKx54EN8l6fOKP6f/TkGicCKSqtdg2jy1zpNe2uCE54yJoWundVVfZL6sTVXeexOnZPHGuDI
	6bgCGxod0XZAyCBI8D/nH3Na69tBb99yEwRN56yeECNkWC/ahVlDrRrASkEUb+hvfb96DtUaNy9gy
	K1byS9FTh5MlN3nwVw/+lCJK7CMRiZ1p0wnB16HBFd+MrOkcBElL4ZQ0qxUY1VsB3CzkWQjMsDmbq
	cEpGldgIbCecF1z6Io6OTppQe+3wyghZCw12wST3mC/4vZUaoHeyS6qOBN2hh/cnZ/pzj/Nv78gf0
	BzFW90lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHWNx-00000001e49-30xT;
	Sat, 08 Nov 2025 00:00:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHWNu-00000001e3t-34Xt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 00:00:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 926E661943;
	Sat,  8 Nov 2025 00:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E74C113D0;
	Sat,  8 Nov 2025 00:00:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="BHbRrzGJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1762560044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9aw3k91pDoBMTIya0ydY2C08rTpxsNiCITG8XwHmzjw=;
	b=BHbRrzGJePBy8TS0S5VXpw/OFjO5vpbdNASLPsgISoMNLpHlakF/SIAX1rTfU1HEsKdDFf
	eIdEf0TZUWWWGhFbwQZtaagtlMoxYYRnZSpFO/+kThrLew7t8YruZeFh0DwCwEUcu01hwS
	PPP3PgJwBoPMnJKLgkcEexv7TqxvNIw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4e65cb42 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sat, 8 Nov 2025 00:00:44 +0000 (UTC)
Date: Sat, 8 Nov 2025 01:00:35 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Nick Alcock <nick.alcock@oracle.com>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Shuah Khan <shuah@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Russell King <linux@armlinux.org.uk>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v5 16/34] random: vDSO: trim vDSO includes
Message-ID: <aQ6II2SiLMzTkAWX@zx2c4.com>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
 <20251106-vdso-sparc64-generic-2-v5-16-97ff2b6542f7@linutronix.de>
 <aQ6FcWxZFD80yWye@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQ6FcWxZFD80yWye@zx2c4.com>
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

On Sat, Nov 08, 2025 at 12:49:05AM +0100, Jason A. Donenfeld wrote:
> On Thu, Nov 06, 2025 at 11:02:09AM +0100, Thomas Weißschuh wrote:
> > These includes are not used, remove them.
> > 
> > Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> > Tested-by: Andreas Larsson <andreas@gaisler.com>
> > Reviewed-by: Andreas Larsson <andreas@gaisler.com>
> > ---
> >  drivers/char/random.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/char/random.c b/drivers/char/random.c
> > index b8b24b6ed3fe436c8102968392278d5cb5544f06..3860ddd9527930780d5c13cd4742fbc3c27acc42 100644
> > --- a/drivers/char/random.c
> > +++ b/drivers/char/random.c
> > @@ -57,9 +57,7 @@
> >  #include <crypto/chacha.h>
> >  #include <crypto/blake2s.h>
> >  #ifdef CONFIG_VDSO_GETRANDOM
> > -#include <vdso/getrandom.h>
> >  #include <vdso/datapage.h>
> > -#include <vdso/vsyscall.h>
> >  #endif
> >  #include <asm/archrandom.h>
> >  #include <asm/processor.h>
> 
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Sorry, it's been a long day. I meant:

Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>

