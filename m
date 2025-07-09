Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0933EC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 09:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rJt4heSROgDS1eV9ocRaQHZQ3lJ1qX0A+5cng2rs84=; b=j9KGJAdC9uS4jDaCnIAx9YZyxk
	LfEmjVvpiPMRUC3Dg429j94NJx3v7WybwfanvyvbYm+znzB5dBbPdtwyPhWrOuX9aaudQKWok7W96
	2CmoJueY79y33ZOqHia+jc0wa35HFXcr3A8m4Z6cGbn+pv4o1eNr1gPWesGHFBWAkRz6dzDGUpl5m
	zDB6kE6GIYdoyF29qiXSW3lI1U6b+VvTJ+rOPZRARWifZLn/FqPUqWeF55s3GZU30KgkBmgZVg5qB
	XiYwYuC8HjSAvUOykjj4rw+aORSYt0QE6iWrNk1hTJ4siAQwesMuAqasw5d5G9ElGnAipWL0HzTzS
	5ZIysDQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQvR-000000086Ad-06G9;
	Wed, 09 Jul 2025 09:17:13 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPK3-00000007pF6-16DD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 07:34:32 +0000
Date: Wed, 9 Jul 2025 09:34:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1752046467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6rJt4heSROgDS1eV9ocRaQHZQ3lJ1qX0A+5cng2rs84=;
	b=PKzHusUQs+w0o4p0sZCP9FjgK6pS2tok18H/l9wBTus+Fnd2mt8mIxmot+O55FNVBY0l74
	kKPUYZNYjrw4yYxpMExxG5gh3hWMKhBjOfDxeR55mTI5XnN2VO5dPHoHIf+menq6THLNua
	4ZW4Ag/C7e5TYAEFHrHwm+NwKsEFgS1nr9J6i5u0x+p/AhaXLZHq8t+4xx5oht0FMmkI9X
	YetbSJVb74Yl4W9Jv1SEoepeZD7p3OZm0Qvs3EMywvT3D9DSgGjkxtaFdGfCQf6sS6sAPP
	vOv8o0ILi7wL1QghNp3NTFlbn/L+3JiMFRFEqxtZcmsIa11x1uERp4a4/6phHw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1752046467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6rJt4heSROgDS1eV9ocRaQHZQ3lJ1qX0A+5cng2rs84=;
	b=yl+jodkn7KTLjpkGEy0Z/8kw3gAECyIK38lKFA1jDazOKrm6eOGWMbFhBFgaijK22nfLfD
	twbjIvJAWKpLYQBw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, 
	Richard Cochran <richardcochran@gmail.com>, Christopher Hall <christopher.s.hall@intel.com>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Werner Abt <werner.abt@meinberg-usa.com>, 
	David Woodhouse <dwmw2@infradead.org>, Kurt Kanzenbach <kurt@linutronix.de>, 
	Nam Cao <namcao@linutronix.de>, Antoine Tenart <atenart@kernel.org>
Subject: Re: [PATCH 06/14] vdso/gettimeofday: Return bool from
 clock_gettime() helpers
Message-ID: <20250709092958-37148883-ed89-40fe-8cd5-ded5dd60957e@linutronix.de>
References: <20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de>
 <20250701-vdso-auxclock-v1-6-df7d9f87b9b8@linutronix.de>
 <02bcd954-5323-4663-a766-f53c67c5a18f@samsung.com>
 <CGME20250708154921eucas1p1fd8fa4374610a991ca5c67bd612ca0c2@eucas1p1.samsung.com>
 <e8c6b9a7-eaa6-4947-98e1-9d6fecc958d4@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8c6b9a7-eaa6-4947-98e1-9d6fecc958d4@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_003431_474796_7B4A0CC0 
X-CRM114-Status: GOOD (  24.39  )
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

Hi Marek,

On Tue, Jul 08, 2025 at 05:49:18PM +0200, Marek Szyprowski wrote:
> On 08.07.2025 17:17, Marek Szyprowski wrote:
> > On 01.07.2025 10:58, Thomas Weiﬂschuh wrote:
> >> The internal helpers are effectively using boolean results,
> >> while pretending to use error numbers.
> >>
> >> Switch the return type to bool for more clarity.
> >>
> >> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> >> ---
> >> † lib/vdso/gettimeofday.c | 58 
> >> +++++++++++++++++++++++++------------------------
> >> † 1 file changed, 30 insertions(+), 28 deletions(-)
> >
> > This patch landed in today's linux-next as commit fcc8e46f768f 
> > ("vdso/gettimeofday: Return bool from clock_gettime() helpers"). In my 
> > tests I found that it causes serious problem with hwclock operation on 
> > some of my ARM 32bit test boards. I observe that calling "hwclock -w 
> > -f /dev/rtc0" never ends on those boards. Disabling vdso support (by 
> > removing ARM architected timer) fixes this issue.
> 
> I spent some time analyzing the code refactored in this patch and it 
> looks that the following change is missing:

Thanks for the report and investigation!

> diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
> index c5266532a097..7e79b02839b0 100644
> --- a/lib/vdso/gettimeofday.c
> +++ b/lib/vdso/gettimeofday.c
> @@ -344,7 +344,7 @@ __cvdso_gettimeofday_data(const struct 
> vdso_time_data *vd,
>  ††††††† if (likely(tv != NULL)) {
>  ††††††††††††††† struct __kernel_timespec ts;
> 
> -†††††††††††††† if (do_hres(vd, &vc[CS_HRES_COARSE], CLOCK_REALTIME, &ts))
> +†††††††††††††† if (!do_hres(vd, &vc[CS_HRES_COARSE], CLOCK_REALTIME, &ts))
>  ††††††††††††††††††††††† return gettimeofday_fallback(tv, tz);
> 
>  ††††††††††††††† tv->tv_sec = ts.tv_sec;
> 
> 
> In my tests this fixed the hwclock issue on the mentioned boards.

This fix looks correct to me.


tglx:

Are you going to fold the fix into the commit or do you want a proper patch?


Marek:

If a new patch is required, do you want to send it? You found and fixed the
issue after all. If not, I'll take care of it.


Thomas

