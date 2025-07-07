Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08A0C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 07:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VuuSwo0zQBBN7R4fcUaWhBlskzzr3dByqm+DcqkM4YI=; b=IOR+8JKUGM419gYRdBtPfrYqnq
	oeR70bFwUTuRhN+1dxjRfpIG7+xdjgXs9O3FBfuombmgnQKLChs3A8q2zOjxcP4euPFIU2FvajWRl
	ZU6SN6SJWoJ+xRBJOBy90JRstg1uD6ywiIZ6Bi0VpLf8cjID/mfcGa9hFPgAyCb71yeh2S6uIQ1aY
	rnlcDlg0GxNP72zR0FOYBTf/HYo50ELfnvr26cFRqGKtmTaIXkb+18zAfta3cmFXuiSHysQNp6e2C
	OKINDnafcBDNm9sxQhgug6rk47Hm17hCGmw2jhG1mISsYGb2/khWDHQxqD8PKl0WLy62rgtRbGaN+
	j5c7KDFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfpt-00000001beQ-1m07;
	Mon, 07 Jul 2025 07:00:21 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfnY-00000001b77-2OaS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 06:57:57 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751871475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VuuSwo0zQBBN7R4fcUaWhBlskzzr3dByqm+DcqkM4YI=;
	b=RZQhomkugkDWET94Yk1EOld3uTTrnlT2ny2nAOIi6lXODNKA16WNheYxZSiIzX72vyhBQm
	qiBzwlzjTtgkeH2V8yD+7sTesxD3KuQX0ZiRJfHINndrCkowqWHT+r7qCEZhc1ObgngpyC
	h1i1L3FAmOkbpohyervvPWsobN3ff+ed4ZP6wbbtnZunG3emsz1eJ1UhBX3X6PZPAYdshl
	zUi2nJ2071psoygiVPOA9kZqu2Lj4FH1XZ/c+AQuU7PRX8BazarPMQjIaVtrhrE/bNXQr1
	7um3shwV7yuk9gkbL+glDtG+WoBGW4irz8uyY2loBw5hygbhbaP/5q1Vhcew8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751871475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VuuSwo0zQBBN7R4fcUaWhBlskzzr3dByqm+DcqkM4YI=;
	b=5YDzv/BzqznvW8xhNlqNiTSvwyy3bssfcOYC/6kIheF1XlwtmRKvG2SCCwIiJOdQHLKYVS
	HJ5LqlP3+f/mhzBg==
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
Subject: Re: [PATCH 11/14] vdso/vsyscall: Update auxiliary clock data in the
 datapage
In-Reply-To: <20250701-vdso-auxclock-v1-11-df7d9f87b9b8@linutronix.de>
References: <20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de>
 <20250701-vdso-auxclock-v1-11-df7d9f87b9b8@linutronix.de>
Date: Mon, 07 Jul 2025 08:57:54 +0200
Message-ID: <877c0ksd1p.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_235756_750059_3A97FD28 
X-CRM114-Status: UNSURE (   6.46  )
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
>=20=20
> +#if defined(CONFIG_GENERIC_TIME_VSYSCALL) && defined(CONFIG_GENERIC_GETT=
IMEOFDAY) && \
> +	defined(CONFIG_POSIX_AUX_CLOCKS)

CONFIG_GENERIC_GETTIMEOFDAY requires CONFIG_GENERIC_TIME_VSYSCALL, but
that's not expressed anywhere. This stuff has grown too many config
options over time:

GENERIC_TIME_VSYSCALL, HAVE_GENERIC_VDSO, GENERIC_VDSO_DATA_STORE

All architectures except SPARC64 use the generic code and the generic
VDSO data store implementation. That config maze wants to be
consolidated.


