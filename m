Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2261C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 09:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=joYJ/MT5CmKtbgnKXRG/YOnvLpHO2Kz90MtG4Gjijrg=; b=hZwyt9T72R0dlbboPwO7/6bPU+
	4pH0EvIfrC1NuygjHUqvW8c0tltzHbJ4ZQEW1vK8twQytwplORH0hx1US2+c+f/IryktkcJinuwCp
	8ErgGBJziZEPqsly/LiQCyax1WxEE9QNBcicS46gznN8BenWM2ZKdeVPzi+9tSyvTGBV89jiXrc1E
	nAUrfvqpQwaY6nY9itZJ8KhXdoBEnZvqtBeN8MsuFLXo2EPmsuX5IAyam+0j7M5qsYGKG2tJzZq3L
	IXV3nL9uMg4a99lEBrWHJqlC1TChJlx4DF+X+2YgZbWXxCKQFXzpdphXT6X+B9/X8JEGRX+y+WeP6
	SeG10nLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWX56-00000004Zmv-3fFZ;
	Tue, 01 Jul 2025 09:15:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWow-00000004WOO-3pIO
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 01 Jul 2025 08:58:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=joYJ/MT5CmKtbgnKXRG/YOnvLpHO2Kz90MtG4Gjijrg=; b=oEHKr2dXOunDS+LB+Fox3Yq956
	mAU7AJ0w3YkJK/ykDnznbV1L43xGIOloqzarsBzKB9Lm3imwly0Qln0jNQPrYTELcIR82olGBK6m7
	h0nx96MN7pvKqM0ZmQWbqvQqa/faKUWG2pW4hpNU26qFo/16t/AfL11/Lkfmp7uDLiSZma5p+J1mG
	cmwkSHPcau71ndzw6QQjIgJ7m701CGIcfDwDbNYwOcfiiPnVZzgZVeIj9JzzCNXe58BI+B2yzO4Z9
	7Q8c7fYIIFG9DP7t1nbuSPOwjzewCAVshpsqde3Tmi4zQ1mWHZeJKdipTOujlbO8XfMipsyZLQ/H5
	xEheMDMQ==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWos-000000070hX-1yAW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 08:58:29 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751360287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=joYJ/MT5CmKtbgnKXRG/YOnvLpHO2Kz90MtG4Gjijrg=;
	b=krhzk1D7lMKjKujXnkLtewos+ZEzFtnviygSNaOH81NLdcFvKN/5rDRHKcXOviJlF3+ScF
	sSILpbPEvg02UQ1tMXjR5TaSdR/FfpEQQqNmxduF9+Ik3MltL4gtmiTPuYMBbT6NeHj/05
	A3uixZ4X0oVqt3aL+jlBkOEGFbdSJvTlpGtuHIpX7MX93qQdlwlv1aQSBYGRWGbiXcqsmQ
	g2Dgs2/mnFTJpWcmNXUDJaA+lnr+OK6wH5Ml/yKwi7detYOtAGVs/lDEe9ZV8sPaucJVAh
	BBwMxWYo4/YRtsZk1pdnC/QcBBaBwHLByplJSYT7HkirgcFaobHSVwpbFaWTrw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751360287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=joYJ/MT5CmKtbgnKXRG/YOnvLpHO2Kz90MtG4Gjijrg=;
	b=xmufFQQ4bBO6kk1ikyfHdIQHNbO5pST5YTXQizxVBEE+zeJrwv081AC82PS6mNifoki68y
	WZNpjH/czo0tVLAg==
Date: Tue, 01 Jul 2025 10:57:58 +0200
Subject: [PATCH 04/14] vdso/helpers: Add helpers for seqlocks of single
 vdso_clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250701-vdso-auxclock-v1-4-df7d9f87b9b8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751360285; l=2571;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=sd/v7cGkj/tjrSz2ZYvXIB3XB5Mae2DoLyqaD2YDD50=;
 b=xHNJy1mqucZQ/T+0vCZcI6A5yV4d5Wm2CvBT6moVq8zEmS9PmdFRxsLmxUq/vJzGB524dlpsL
 qipcU3XvOpkCtiYJVJhEl2zHKlPnzAMS3lIQiV9mGiAkdtMch9Ht/rp
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_095827_330776_F88D2143 
X-CRM114-Status: GOOD (  13.44  )
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

Auxiliary clocks will have their vDSO data in a dedicated 'struct vdso_clock',
which needs to be synchronized independently.

Add a helper to synchronize a single vDSO clock.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/vdso/helpers.h | 40 +++++++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/include/vdso/helpers.h b/include/vdso/helpers.h
index 0a98fed550ba66a84a620fbbd6aee3e3029b4772..a5679f5efdfdcaaf6efd5f4a317d1f132c3dc617 100644
--- a/include/vdso/helpers.h
+++ b/include/vdso/helpers.h
@@ -28,32 +28,46 @@ static __always_inline u32 vdso_read_retry(const struct vdso_clock *vc,
 	return seq != start;
 }
 
-static __always_inline void vdso_write_begin(struct vdso_time_data *vd)
+static __always_inline void vdso_write_begin_clock(struct vdso_clock *vc, bool last)
 {
-	struct vdso_clock *vc = vd->clock_data;
-
 	/*
 	 * WRITE_ONCE() is required otherwise the compiler can validly tear
-	 * updates to vd[x].seq and it is possible that the value seen by the
+	 * updates to vc->seq and it is possible that the value seen by the
 	 * reader is inconsistent.
 	 */
-	WRITE_ONCE(vc[CS_HRES_COARSE].seq, vc[CS_HRES_COARSE].seq + 1);
-	WRITE_ONCE(vc[CS_RAW].seq, vc[CS_RAW].seq + 1);
-	smp_wmb();
+	WRITE_ONCE(vc->seq, vc->seq + 1);
+
+	if (last)
+		smp_wmb();
 }
 
-static __always_inline void vdso_write_end(struct vdso_time_data *vd)
+static __always_inline void vdso_write_end_clock(struct vdso_clock *vc, bool first)
 {
-	struct vdso_clock *vc = vd->clock_data;
+	if (first)
+		smp_wmb();
 
-	smp_wmb();
 	/*
 	 * WRITE_ONCE() is required otherwise the compiler can validly tear
-	 * updates to vd[x].seq and it is possible that the value seen by the
+	 * updates to vc->seq and it is possible that the value seen by the
 	 * reader is inconsistent.
 	 */
-	WRITE_ONCE(vc[CS_HRES_COARSE].seq, vc[CS_HRES_COARSE].seq + 1);
-	WRITE_ONCE(vc[CS_RAW].seq, vc[CS_RAW].seq + 1);
+	WRITE_ONCE(vc->seq, vc->seq + 1);
+}
+
+static __always_inline void vdso_write_begin(struct vdso_time_data *vd)
+{
+	struct vdso_clock *vc = vd->clock_data;
+
+	vdso_write_begin_clock(&vc[CS_HRES_COARSE], false);
+	vdso_write_begin_clock(&vc[CS_RAW], true);
+}
+
+static __always_inline void vdso_write_end(struct vdso_time_data *vd)
+{
+	struct vdso_clock *vc = vd->clock_data;
+
+	vdso_write_end_clock(&vc[CS_HRES_COARSE], true);
+	vdso_write_end_clock(&vc[CS_RAW], false);
 }
 
 #endif /* !__ASSEMBLY__ */

-- 
2.50.0


