Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38D0C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 09:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SK3l8BMMu95VGRUTPaxq3odjbGz7PFs+Kx3KugUm1Eo=; b=T1ahPTcvrtbmw9C69o92Is5FNz
	AkS6GSz7MI5755Kklazy1ezCtR+Et4TDcQyn3mZNWa+IFimJmuD2nnvPBZt+72kX+elb26ld2EmDb
	pWJBXxeuX64HYffKEAgN3ZhscykMz0ZBssSufWJS59LKkSTDYd0pdbrPaVE/cdbovotskASJyJ8qc
	dMyqRaPRMctqbYBWDMqjkhHB3pdUjsYPSgB7pTYpOGs/cMTUzR8IZlXCWB1wex5fDf8MZqMStCYr7
	mYBPsY86Y76LJNI7qiivoH65epjx/FX4ecMw288PeyRMF8fiE9xqSVLtfqHonOqrB7aIF4VGiKFB9
	xUljfE7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXPy-00000004cCc-2U0r;
	Tue, 01 Jul 2025 09:36:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWp4-00000004WRs-2ht5
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 01 Jul 2025 08:58:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=SK3l8BMMu95VGRUTPaxq3odjbGz7PFs+Kx3KugUm1Eo=; b=nBhUP2vIpLxY7LJrbbuNFLGyBk
	e6HCrzG1z7/O7bZlg9ZqEcgxH2nhFVwkxFQsAEJahDS3FHwpNdSltzEDdjDblZmr3WldDs09v0waF
	y9lkJB/XJzRCSIQtucCIDG7xuvR6blBrTXSR8Cl8TnjAq3DevVlENDr5fWEKsJc0aj2ssylqDIgAE
	JDDtoPJGzjvy4JsqqznjKXDUSTerFJ1ClPsq2oQW9ci8cu8BLwc/4Ew5oaF74iUMEyOqPSBRVa9dk
	65t4MV+RHgm4TwGngmi5T2bXnBF/y32L4yxM0lKVHy3XkD62stiixyDIzxLIyXAUHlR8aJrwZ6Fwq
	D5MbZYCg==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWp0-000000070nn-2v0t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 08:58:37 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751360292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SK3l8BMMu95VGRUTPaxq3odjbGz7PFs+Kx3KugUm1Eo=;
	b=yJy4keyDvwMT/d9Iuu10ATzWX27er316R8MoS0J/wlG2ms9yMllswmbVSX7F0oNSwves1g
	4BHh6Q4jDj04y5tvLIG38Qesc8j4udGrpFb/JzMG0obIbHT6BDsnGHDR3DXhExTQldLZ6p
	TIasEskPYlMcM5UrKm56HckiWHr+AUvISU8YbBHWzgTK18tmfKhhbgxVDRSJKsCXwJJsdS
	unOL13ZIK+7PxGSejg9WpLpB+LqhcYWknE+Zk2SB60y6kV+IgHufR9RIF781J+pDe5CBBM
	+pMyGuApf62S98iO1hYC0KPj1CfUKMGbSZUeLlqo9p2OxoU2n3zbwq/MJ4zTEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751360292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SK3l8BMMu95VGRUTPaxq3odjbGz7PFs+Kx3KugUm1Eo=;
	b=PlSEIyIg2wzGfdV+P8vGns3fGgMZoJ8TdGRsj5fKXuwEfe7qrVEvJ9Z02lp1QogJ04DZst
	NVCqYmbA/AfuVkAg==
Date: Tue, 01 Jul 2025 10:58:08 +0200
Subject: [PATCH 14/14] selftests/timers/auxclock: Test vDSO functionality
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250701-vdso-auxclock-v1-14-df7d9f87b9b8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751360285; l=4589;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=x/PnXWFdRLfiD0A/OSKGxuIkOAxAGhB8JsdPBHMIAYg=;
 b=OA+n1MSc80uZUXpqQjNbqDIekjmoLXtWUGfIg6qkJB8FJfSi1QgdUq+BefaVbWNSC/4NI7as+
 cDOwHVLSM6QABo3bS6VhO/hkfNIXLsquyPVrTFpjyRRleSToVAMh0A8
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_095834_969574_2B673E6B 
X-CRM114-Status: GOOD (  13.59  )
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

Extend the auxclock test to also cover the vDSO.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/timers/auxclock.c | 95 +++++++++++++++++++++++++++++--
 1 file changed, 91 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/timers/auxclock.c b/tools/testing/selftests/timers/auxclock.c
index 0ba2f9996114ade3147f0f3aec49904556a23cd4..314037839c1c7dd32ca32722231c67bc408a2ea3 100644
--- a/tools/testing/selftests/timers/auxclock.c
+++ b/tools/testing/selftests/timers/auxclock.c
@@ -10,11 +10,16 @@
 #include <linux/timex.h>
 #include <sched.h>
 #include <stdio.h>
+#include <sys/auxv.h>
 #include <sys/syscall.h>
 #include <unistd.h>
 
 #include "../kselftest_harness.h"
 
+#include "../vDSO/parse_vdso.c"
+#include "../vDSO/vdso_config.h"
+#include "../vDSO/vdso_call.h"
+
 #ifndef CLOCK_AUX
 #define	CLOCK_AUX	16
 #endif
@@ -133,7 +138,45 @@ static int sys_clock_adjtime64(__kernel_clockid_t clockid, struct __kernel_timex
 #endif
 }
 
-FIXTURE(auxclock) {};
+FIXTURE(auxclock) {
+	int (*vdso_clock_gettime)(__kernel_clockid_t clockid, struct timespec *ts);
+	int (*vdso_clock_gettime64)(__kernel_clockid_t clockid, struct __kernel_timespec *ts);
+	int (*vdso_clock_getres)(__kernel_clockid_t clockid, struct timespec *ts);
+};
+
+static int vdso_clock_gettime64(FIXTURE_DATA(auxclock) *self, __kernel_clockid_t clockid,
+				struct __kernel_timespec *ts)
+{
+	struct timespec _ts;
+	int ret;
+
+	if (self->vdso_clock_gettime64) {
+		return VDSO_CALL(self->vdso_clock_gettime64, 2, clockid, ts);
+	} else if (self->vdso_clock_gettime) {
+		ret = VDSO_CALL(self->vdso_clock_gettime, 2, clockid, &_ts);
+		if (!ret)
+			timespec_to_kernel_timespec(&_ts, ts);
+		return ret;
+	} else {
+		return -ENOSYS;
+	}
+}
+
+static int vdso_clock_getres_time64(FIXTURE_DATA(auxclock) *self, __kernel_clockid_t clockid,
+				    struct __kernel_timespec *ts)
+{
+	struct timespec _ts;
+	int ret;
+
+	if (self->vdso_clock_getres) {
+		ret = VDSO_CALL(self->vdso_clock_getres, 2, clockid, &_ts);
+		if (!ret)
+			timespec_to_kernel_timespec(&_ts, ts);
+		return ret;
+	} else {
+		return -ENOSYS;
+	}
+}
 
 FIXTURE_VARIANT(auxclock) {
 	__kernel_clockid_t clock;
@@ -193,6 +236,18 @@ static void enter_timens(struct __test_metadata *_metadata)
 FIXTURE_SETUP(auxclock) {
 	int ret;
 
+#ifdef AT_SYSINFO_EHDR
+	unsigned long sysinfo_ehdr;
+
+	sysinfo_ehdr = getauxval(AT_SYSINFO_EHDR);
+	if (sysinfo_ehdr)
+		vdso_init_from_sysinfo_ehdr(sysinfo_ehdr);
+
+	self->vdso_clock_gettime = vdso_sym(versions[VDSO_VERSION], names[VDSO_NAMES][1]);
+	self->vdso_clock_gettime64 = vdso_sym(versions[VDSO_VERSION], names[VDSO_NAMES][5]);
+	self->vdso_clock_getres = vdso_sym(versions[VDSO_VERSION], names[VDSO_NAMES][3]);
+#endif /* !AT_SYSINFO_EHDR */
+
 	ret = configure_auxclock(variant->clock, variant->clock_enabled);
 	if (ret == -ENOENT)
 		SKIP(return, "auxclocks not enabled");
@@ -220,6 +275,20 @@ TEST_F(auxclock, sys_clock_getres) {
 	ASSERT_EQ(1, ts.tv_nsec);
 }
 
+TEST_F(auxclock, vdso_clock_getres) {
+	struct __kernel_timespec ts;
+	int ret;
+
+	ret = vdso_clock_getres_time64(self, variant->clock, &ts);
+	if (ret == -ENOSYS) {
+		SKIP(return, "no clock_getres() in vDSO");
+	} else {
+		ASSERT_EQ(0, ret);
+		ASSERT_EQ(0, ts.tv_sec);
+		ASSERT_EQ(1, ts.tv_nsec);
+	}
+}
+
 TEST_F(auxclock, sys_clock_gettime) {
 	struct __kernel_timespec ts;
 	int ret;
@@ -233,6 +302,20 @@ TEST_F(auxclock, sys_clock_gettime) {
 	}
 }
 
+TEST_F(auxclock, vdso_clock_gettime) {
+	struct __kernel_timespec ts;
+	int ret;
+
+	ret = vdso_clock_gettime64(self, variant->clock, &ts);
+	if (ret == -ENOSYS) {
+		SKIP(return, "no clock_gettime() in vDSO");
+	} else if (variant->clock_enabled) {
+		ASSERT_EQ(0, ret);
+	} else {
+		ASSERT_EQ(-ENODEV, ret);
+	}
+}
+
 static void auxclock_validate_progression(struct __test_metadata *_metadata,
 					  const struct __kernel_timespec *a,
 					  const struct __kernel_timespec *b)
@@ -310,9 +393,13 @@ TEST_F(auxclock, progression) {
 		auxclock_validate_progression(_metadata, &a, &b);
 
 		memset(&a, 0, sizeof(a));
-		ret = sys_clock_gettime64(variant->clock, &a);
-		ASSERT_EQ(0, ret);
-		auxclock_validate_progression(_metadata, &b, &a);
+		ret = vdso_clock_gettime64(self, variant->clock, &a);
+		if (ret == -ENOSYS) {
+			a = b;
+		} else {
+			ASSERT_EQ(0, ret);
+			auxclock_validate_progression(_metadata, &b, &a);
+		}
 	}
 }
 

-- 
2.50.0


