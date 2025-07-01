Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8273EC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 09:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppCsL5OVpZ0yuAtg6csvrRyWQ6LdTuXSpwMAtwV+V0Y=; b=OpEz/WjrDqAL74slGblq0hLZfl
	2wM9DteTFX/YiyRKcf21vftxnQ73XvtGUF53AFzm22BvOxDLrh1A+XEaJtvDQ7w0OlLPVW/nZ+Ddc
	IYzkJXCAHsCQUWe2U8A9xEl6GXeU5xBjXqNmy+pmlIXZj8jfp3huCQpg+UJkpRiu8uqu5E3hddtry
	OzCbrrAAPTAPzfBE4AKR988W5/VrD6rs0pjxl/mlw3VCri22kDleOTYH5j8dBQl1dsb8zf7y5kV1W
	eJkWzP8OeJONqtXa55tqqZqEwvbqM9tqfOElozqXBoJJjFsaANpKVlKpbVAtx9AIzPj8ozBRZsmen
	aHHF9gEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXGl-00000004b8t-1022;
	Tue, 01 Jul 2025 09:27:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWp1-00000004WR2-3sXm
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 01 Jul 2025 08:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ppCsL5OVpZ0yuAtg6csvrRyWQ6LdTuXSpwMAtwV+V0Y=; b=C0aAj1OgcaxvKa9RQfuqrbWo3E
	dYaRjxhSy2lbO2YK6ryrdYJYnq6rumgHZK0NVp74Gw8MlHMJmRsuHWf1+2+R6Jq8qa8m5pzoZ915X
	p6DJE1jfdEs1/KStUAkJ8e87t+7KQGDUdTWh5IIPp6oaWrEAYLnfGmpcyaXUiX0zFoaMuyfdY3//m
	U/9/G1gXXK8wdTiylFjbCR5cVShVnEbFzYi16oM6IRh3IsVMTOnDFpmYAYI4V44DNXnsOzKHSA7cQ
	tXVr65XNToVdYYhmseV47lFgBQGGGIMRpq591nfBOvIL2GoleiHXj4WVdvXy8WEnt1+jRtoB8lbkx
	1Rrp9feg==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWow-000000070nR-1DXW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 08:58:32 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751360290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ppCsL5OVpZ0yuAtg6csvrRyWQ6LdTuXSpwMAtwV+V0Y=;
	b=bYXsA4VmsKOFmUrNashY+TPxEK36HHs4Y1/tS2ESFs1Sa90DCYM6pLwrbgoJjLO9Yshy+E
	cdk0CYyPuvhpLBR7Y0A+DlWZQHPQSlGG/J9v8CDbIplQiFtQfl69euvkbceuSZ6/gOyv3D
	LeqjJBv/x3eKsgi35z8qXD7dUsYUyRboPPfq07V+n5/u6MPqzpLvTOYNTzjaMkCWOOV3FK
	4wCX5/sLqv0t1UbLTMX6VPn6Is9LA1QB4JKytwxEP2A1fYNXPlqbsEVBOA58ednTEaW66I
	XC1RZs82INjio8hSj3u0el7uaWbzFkkzJ74lx5EDuRzdsUVXaXe8E9i1wked1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751360290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ppCsL5OVpZ0yuAtg6csvrRyWQ6LdTuXSpwMAtwV+V0Y=;
	b=FUAZLmGC+2tmC8OKCBX9MqhPAG/d2/zbiiyE0dF93F/Iph1Ozm1GlEk02gT6NQSgN4PusN
	jI73TlfCOkkGPbCg==
Date: Tue, 01 Jul 2025 10:58:03 +0200
Subject: [PATCH 09/14] vdso/gettimeofday: Introduce vdso_get_timestamp()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250701-vdso-auxclock-v1-9-df7d9f87b9b8@linutronix.de>
References: <20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de>
In-Reply-To: <20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, John Stultz <jstultz@google.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, 
 Richard Cochran <richardcochran@gmail.com>, 
 Christopher Hall <christopher.s.hall@intel.com>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Miroslav Lichvar <mlichvar@redhat.com>, 
 Werner Abt <werner.abt@meinberg-usa.com>, 
 David Woodhouse <dwmw2@infradead.org>, Stephen Boyd <sboyd@kernel.org>, 
 Kurt Kanzenbach <kurt@linutronix.de>, Nam Cao <namcao@linutronix.de>, 
 Antoine Tenart <atenart@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751360285; l=3113;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=0gcdrnEsMPGXM7V1cQMwcYqk1YZH4nLzPxPwfGW0xR8=;
 b=IVyUepdPhAMRvqhjIat4Jqx5hEP07rmKNZAocQkuDF92onJqNyNB/RxoxLX8R4u71m9CiGGyF
 mM3B4kOZaFfA1deox2uLdBFZiKv83hAOc9ObMZimXUM26NGMOQTuH9L
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_095830_641217_6AFDC32F 
X-CRM114-Status: GOOD (  10.97  )
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

This code is duplicated and with the introduction of auxiliary clocks will
be duplicated even more.

Introduce a helper.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/gettimeofday.c | 43 ++++++++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 50611ba28abfcfc7841616e8787101ea1ffcb7d8..c383878bb5445a62d8fea6591e8550183852c2e6 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -87,6 +87,26 @@ static __always_inline void vdso_set_timespec(struct __kernel_timespec *ts, u64
 	ts->tv_nsec = ns;
 }
 
+static __always_inline
+bool vdso_get_timestamp(const struct vdso_time_data *vd, const struct vdso_clock *vc,
+			unsigned int clkidx, u64 *sec, u64 *ns)
+{
+	const struct vdso_timestamp *vdso_ts = &vc->basetime[clkidx];
+	u64 cycles;
+
+	if (unlikely(!vdso_clocksource_ok(vc)))
+		return false;
+
+	cycles = __arch_get_hw_counter(vc->clock_mode, vd);
+	if (unlikely(!vdso_cycles_ok(cycles)))
+		return false;
+
+	*ns = vdso_calc_ns(vc, cycles, vdso_ts->nsec);
+	*sec = vdso_ts->sec;
+
+	return true;
+}
+
 #ifdef CONFIG_TIME_NS
 
 #ifdef CONFIG_GENERIC_VDSO_DATA_STORE
@@ -104,28 +124,20 @@ bool do_hres_timens(const struct vdso_time_data *vdns, const struct vdso_clock *
 	const struct vdso_time_data *vd = __arch_get_vdso_u_timens_data(vdns);
 	const struct timens_offset *offs = &vcns->offset[clk];
 	const struct vdso_clock *vc = vd->clock_data;
-	const struct vdso_timestamp *vdso_ts;
-	u64 cycles, ns;
 	u32 seq;
 	s64 sec;
+	u64 ns;
 
 	if (clk != CLOCK_MONOTONIC_RAW)
 		vc = &vc[CS_HRES_COARSE];
 	else
 		vc = &vc[CS_RAW];
-	vdso_ts = &vc->basetime[clk];
 
 	do {
 		seq = vdso_read_begin(vc);
 
-		if (unlikely(!vdso_clocksource_ok(vc)))
-			return false;
-
-		cycles = __arch_get_hw_counter(vc->clock_mode, vd);
-		if (unlikely(!vdso_cycles_ok(cycles)))
+		if (!vdso_get_timestamp(vd, vc, clk, &sec, &ns))
 			return false;
-		ns = vdso_calc_ns(vc, cycles, vdso_ts->nsec);
-		sec = vdso_ts->sec;
 	} while (unlikely(vdso_read_retry(vc, seq)));
 
 	/* Add the namespace offset */
@@ -155,8 +167,7 @@ static __always_inline
 bool do_hres(const struct vdso_time_data *vd, const struct vdso_clock *vc,
 	     clockid_t clk, struct __kernel_timespec *ts)
 {
-	const struct vdso_timestamp *vdso_ts = &vc->basetime[clk];
-	u64 cycles, sec, ns;
+	u64 sec, ns;
 	u32 seq;
 
 	/* Allows to compile the high resolution parts out */
@@ -183,14 +194,8 @@ bool do_hres(const struct vdso_time_data *vd, const struct vdso_clock *vc,
 		}
 		smp_rmb();
 
-		if (unlikely(!vdso_clocksource_ok(vc)))
+		if (!vdso_get_timestamp(vd, vc, clk, &sec, &ns))
 			return false;
-
-		cycles = __arch_get_hw_counter(vc->clock_mode, vd);
-		if (unlikely(!vdso_cycles_ok(cycles)))
-			return false;
-		ns = vdso_calc_ns(vc, cycles, vdso_ts->nsec);
-		sec = vdso_ts->sec;
 	} while (unlikely(vdso_read_retry(vc, seq)));
 
 	vdso_set_timespec(ts, sec, ns);

-- 
2.50.0


