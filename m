Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7E7C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 11:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pyj1IxyEiHDzb1omORAbYqm4qq0QWh7NPJiL+KPZjZU=; b=5EEh4F9GXncBnH0MOjVAveXtY1
	HucausuBpdmjfUgMcqSiRJoI1sa4WKwcBW5CGeypAjHxrVMaBw+j25kaViNPQsdoOkM5+uqSkFl6v
	FUvZqFLqFioau0c98j9tHIVq4D3OobPfk0zidRz5fEkZzKT1Pd1JFDx47akewjoVXVRfYhcGs83b7
	e5fjoTAbooOhI9jzmGfR6/RZERIGHOnH3BHLugwg6YLeU3Wyli8ho9Y9RL322IUvZmVfXI85GYE3d
	9IVLzC+8DVTPKhHwiALhF/DFL88GDvECBTDV2ZEIekKbuMbIlXIUKk3nbhEuoNEjb5pky3o6lTge9
	8GuXRp+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4A2-00000000bW4-0i30;
	Mon, 03 Mar 2025 11:40:38 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3hZ-00000000Tne-2X02
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 11:11:15 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pyj1IxyEiHDzb1omORAbYqm4qq0QWh7NPJiL+KPZjZU=;
	b=Hq5nQCL4Yqyk+CDi93tJpT9Oi13+ow8IszmUV4Vu/VHd2FENx7+H+Du3uD5wvU/tnhs/zD
	VzRHknypKYXIK6kbwwIfL7ebFp5/0tUDgZmPAaxarUqH0RDuhGXH2DsDPW35i/ZIpfprj/
	9vhPAMhBO9qAfuIx8fFGKQNcDBPdkKANEBekqk1vd8v211dOHwoNCsDBHD5o0T9FQ+6rv5
	j9pB3HfKzxbP4tLOnkE1hqhtlF5mGW/1Txl3ionFX2E9BIQOATmP7lqByIVfNGWR4Vh7Lv
	kxbangM0gQMY9gDkuXb+8nKtnLR/0iJ7LAHVgINmbjAhqBCp5Uppts89t57B8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pyj1IxyEiHDzb1omORAbYqm4qq0QWh7NPJiL+KPZjZU=;
	b=TcNtVpAoj25nYr8wfOBMAU2VQZOSGfhXsyz9J2vtCm/R2et11itzp9oVNgtCfLC0wTCTlb
	HYoANd1UtDCjztBw==
Date: Mon, 03 Mar 2025 12:11:07 +0100
Subject: [PATCH 05/19] vdso/helpers: Prepare introduction of struct
 vdso_clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250303-vdso-clock-v1-5-c1b5c69a166f@linutronix.de>
References: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
In-Reply-To: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=2876;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=BVwKlh7nZG29QSg4aACtXecQDv4XfbsPrpsv60UP7oo=;
 b=vBuoT+GV5Ao/ScTJev2pjAGz9yeqc5sBd4U73vTBi0IKxl+THc3SVbj81r1LH6q3a/3xD9iZ5
 sdfdW90RaA7A3q8557olDGbvxS0iFS73Rr5hY83HQURZwksSZ5ku1dh
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_031113_924468_4498E1A2 
X-CRM114-Status: GOOD (  15.51  )
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

From: Anna-Maria Behnsen <anna-maria@linutronix.de>

To support multiple PTP clocks, the VDSO data structure needs to be
reworked. All clock specific data will end up in struct vdso_clock and in
struct vdso_time_data there will be array of it. By now, vdso_clock is
simply a define which maps vdso_clock to vdso_time_data.

Prepare all functions which need the pointer to the vdso_clock array to
work well after the structures get reworked. Replace struct vdso_time_data
pointer with struct vdso_clock pointer whenever applicable.

No functional change.

Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/vdso/helpers.h | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/include/vdso/helpers.h b/include/vdso/helpers.h
index 41c3087070c7ab21d7adec04e6cd30c4b32ea221..28f0707a46c62187ad7500543e169f5b99deee70 100644
--- a/include/vdso/helpers.h
+++ b/include/vdso/helpers.h
@@ -7,49 +7,53 @@
 #include <asm/barrier.h>
 #include <vdso/datapage.h>
 
-static __always_inline u32 vdso_read_begin(const struct vdso_time_data *vd)
+static __always_inline u32 vdso_read_begin(const struct vdso_clock *vc)
 {
 	u32 seq;
 
-	while (unlikely((seq = READ_ONCE(vd->seq)) & 1))
+	while (unlikely((seq = READ_ONCE(vc->seq)) & 1))
 		cpu_relax();
 
 	smp_rmb();
 	return seq;
 }
 
-static __always_inline u32 vdso_read_retry(const struct vdso_time_data *vd,
+static __always_inline u32 vdso_read_retry(const struct vdso_clock *vc,
 					   u32 start)
 {
 	u32 seq;
 
 	smp_rmb();
-	seq = READ_ONCE(vd->seq);
+	seq = READ_ONCE(vc->seq);
 	return seq != start;
 }
 
 static __always_inline void vdso_write_begin(struct vdso_time_data *vd)
 {
+	struct vdso_clock *vc = vd;
+
 	/*
 	 * WRITE_ONCE() is required otherwise the compiler can validly tear
 	 * updates to vd[x].seq and it is possible that the value seen by the
 	 * reader is inconsistent.
 	 */
-	WRITE_ONCE(vd[CS_HRES_COARSE].seq, vd[CS_HRES_COARSE].seq + 1);
-	WRITE_ONCE(vd[CS_RAW].seq, vd[CS_RAW].seq + 1);
+	WRITE_ONCE(vc[CS_HRES_COARSE].seq, vc[CS_HRES_COARSE].seq + 1);
+	WRITE_ONCE(vc[CS_RAW].seq, vc[CS_RAW].seq + 1);
 	smp_wmb();
 }
 
 static __always_inline void vdso_write_end(struct vdso_time_data *vd)
 {
+	struct vdso_clock *vc = vd;
+
 	smp_wmb();
 	/*
 	 * WRITE_ONCE() is required otherwise the compiler can validly tear
 	 * updates to vd[x].seq and it is possible that the value seen by the
 	 * reader is inconsistent.
 	 */
-	WRITE_ONCE(vd[CS_HRES_COARSE].seq, vd[CS_HRES_COARSE].seq + 1);
-	WRITE_ONCE(vd[CS_RAW].seq, vd[CS_RAW].seq + 1);
+	WRITE_ONCE(vc[CS_HRES_COARSE].seq, vc[CS_HRES_COARSE].seq + 1);
+	WRITE_ONCE(vc[CS_RAW].seq, vc[CS_RAW].seq + 1);
 }
 
 #endif /* !__ASSEMBLY__ */

-- 
2.48.1


