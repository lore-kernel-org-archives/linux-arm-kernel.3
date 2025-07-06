Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1DDC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 19:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQ2ofv+1+bTJIyO4X+Dd0vlpx4YzhCJIFQaCUQm3+2M=; b=ZKO5TuRlktSNnwVQauLpPouIX6
	d7Atv2C5bK5YOxtGas734uh3UIE5j5mKwISdm2aXvEK0TEbo3RhEn/rDdDPY44Rs32qFkWk+JW4JV
	uAsGUfmH/ZwXgLbA62hBIubmHLiKsaV7SSl2GZnFrURmf8Y8GVUHcMN0zzlEuUhLhVPQdPBcYRAND
	ROTotgjZMaXKyGGN6XRY9PIyo0FhdmdVr9nG+fIm2q2T0dlmJgJJnJPN+QATYltXDvc7m/bnlXTAS
	ftHeQ3Jpc3dGa55Gj8X2m/7K6pbCD1At1su72nndKigginthxW/Qw0rb76KWne3htHkUbevf28hj+
	z986q5FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYVKU-00000000kU5-3q9N;
	Sun, 06 Jul 2025 19:47:14 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYV4y-00000000jDe-1gAX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 19:31:14 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751830270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HQ2ofv+1+bTJIyO4X+Dd0vlpx4YzhCJIFQaCUQm3+2M=;
	b=ouRlHTa4haX1qT8sDx76BltC3KKVZP/ZFOMqYyWAYBv7odCxFXjSDNln0ScqPB0rG9e4FW
	ZhfoT5HmVDdWSMIdcjTm9FwWuliyu3d8VZ915+f4fTyhtpV1Ifn4NlOIQhjBk4IiObEenT
	mfx6N4liAmA8qS/Vc/xnGHoRhgfir2eQilEeiu6HShp+odVWfUTUBBOOQvce3jcWfTPzcq
	njz37X9XuDwuN7t55pDqviLFR9CarXeJPmZNxMvt/+MZRx+EE0Xyl24dv1hYiW5T1wX6Fy
	o45l4IxDCAGJ1WVWTNqWqNZkb3gUIdHdwOZcixtvSmuXXBAyR5WuSoQHZeHmyg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751830270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HQ2ofv+1+bTJIyO4X+Dd0vlpx4YzhCJIFQaCUQm3+2M=;
	b=08w8b11HUPEFVAPYIV20BJr7Gnft2w4D17JIHk7NQkX3TBpuwvcO7FDNcCx/mp9lpAMhsG
	2fx7UuR/2nzikNAw==
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
Subject: Re: [PATCH 12/14] vdso/gettimeofday: Add support for auxiliary clocks
In-Reply-To: <20250701-vdso-auxclock-v1-12-df7d9f87b9b8@linutronix.de>
References: <20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de>
 <20250701-vdso-auxclock-v1-12-df7d9f87b9b8@linutronix.de>
Date: Sun, 06 Jul 2025 21:31:08 +0200
Message-ID: <87frf9ru9v.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_123112_581247_49C0A157 
X-CRM114-Status: GOOD (  13.23  )
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
> +static __always_inline
> +bool do_aux(const struct vdso_time_data *vd, clockid_t clock, struct __k=
ernel_timespec *ts)
> +{
> +	const struct vdso_clock *vc;
> +	u64 sec, ns;
> +	u32 seq;
> +	u8 idx;
> +
> +	if (!IS_ENABLED(CONFIG_POSIX_AUX_CLOCKS))
> +		return false;
> +
> +	idx =3D clock - CLOCK_AUX;
> +	vc =3D &vd->aux_clock_data[idx];
> +
> +	do {
> +		/*
> +		 * Open coded function vdso_read_begin() to handle
> +		 * VDSO_CLOCK_TIMENS. See comment in do_hres().
> +		 */
> +		while ((seq =3D READ_ONCE(vc->seq)) & 1) {
> +			if (IS_ENABLED(CONFIG_TIME_NS) && vc->clock_mode =3D=3D VDSO_CLOCKMOD=
E_TIMENS) {
> +				vd =3D __arch_get_vdso_u_timens_data(vd);
> +				vc =3D &vd->aux_clock_data[idx];
> +				break;

This actually wants to be a continue because otherwise @seq contains the
stale value from the initial read of the TIMENS page, which is
0x1. That's a pointless extra round through the below.

With continue it re-reads, but this time the actual value from the time
data page and also takes an eventual odd value into account properly.

I fixed it up locally already.

Thanks,

        tglx

