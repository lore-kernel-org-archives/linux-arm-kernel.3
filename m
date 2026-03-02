Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BFEE9B370
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlk3cqJZ30Lz5MhUet1qgc5NgTTbprbGncwAJnGFeH8=; b=CMwkNkM3nRdsP+rZNOo/8bbJfc
	+O+A9HNPZ574OrMtox9RGXRQrpkDrFuarhjmyBEeV5NKjjOyhNlzCjtBGpNQS5+0BSdUHceUYb3ep
	CE1yhkrpjsb4uBhS3+hw8E1jzPEjszo4c8gyK477IZdPgwM1cvVsh1Y9sSLCnnBuR7QU7JEW+ZNl3
	cZfVTzhtSX5EkSMOAXnkq6ELJWn8R1hzHBGIt4q+8S8bh0YoPsxDipYx50YY8N+OUa7vuLFuPdjxd
	i9BDuieWKT6jJaZeazg4KPUkV/vzpw2DObz7u2OZ4sEtvbNg7QeIOjtqjLxXcihYbZ7EcCQIRwEcS
	E0GqiTvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LX-0000000Cw4n-2YKs;
	Mon, 02 Mar 2026 12:25:59 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2LP-0000000Cvqc-0Nv5;
	Mon, 02 Mar 2026 12:25:53 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tlk3cqJZ30Lz5MhUet1qgc5NgTTbprbGncwAJnGFeH8=;
	b=CRJt/UjA77my9s/VwzZr+j6qmjyF3oIVyiLTMYKBq2Sh1cqL0kMsN1qmUgdc0mTKviVZ9P
	rN5i5a2mJ6Syz8O+A5oRl7YkQu+OSRfqOmex5k1XFQHkmUmRrESTPgOKRNKDTjrQIhhPOe
	Pi1gueEvqygXyPKCQB6giWSdTNlUs1PSeqcgS1aXQZ/YSKg5AdFODTmb+LA74y68Q8bzlw
	jpjjnG3HeKthKo3qJCjXHqWWI2YRAQZEtkJjshcmL3gflfzyYuoBG9keXT4sRjMDDa8Mjo
	FvTT8WwqKMRr+0hgvx/TqCyJBmOuXOHqaUuaNctXm7PoJedartXLjhTimMdJLg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tlk3cqJZ30Lz5MhUet1qgc5NgTTbprbGncwAJnGFeH8=;
	b=MBwnxjs+xWwop6Ct7CBgP9e8by6gH+y3rfllXxAy/TGMGEjACAyDkON2IpJ6i+NGG/l5A8
	GOlZMj1xzUvgZ9Aw==
Date: Mon, 02 Mar 2026 13:25:30 +0100
Subject: [PATCH 06/15] arm64: Remove AT_VECTOR_SIZE_ARCH from UAPI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260302-at-vector-size-arch-v1-6-a11f03ba2ca8@linutronix.de>
References: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
In-Reply-To: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=1548;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=NcNAjFpusRcTaOeHqUd5vUDlghSduTpD8ok7Y/f07wQ=;
 b=MiKiwAWA2C+9P7E+r7QvNNNf10TuRkC/eecHXJHLCNJUMLtyvOLvvIqkh8xzavM6nRpnPO504
 Fm13zL1o5/hDGNiNI3mFFSmqn9QMFTOn5P81Y3mb9x9by94kvb/sFzx
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042551_312507_FFECD14B 
X-CRM114-Status: GOOD (  11.44  )
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

There is nothing userspace can do with this value. In the kernel is
always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
userspace and also changes from time to time.

Move the symbol to a kernel-internal header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/include/asm/auxvec.h      | 7 +++++++
 arch/arm64/include/uapi/asm/auxvec.h | 6 ++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/auxvec.h b/arch/arm64/include/asm/auxvec.h
new file mode 100644
index 000000000000..de24eaaa06e2
--- /dev/null
+++ b/arch/arm64/include/asm/auxvec.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_AUXVEC_H
+#define __ASM_AUXVEC_H
+
+#define AT_VECTOR_SIZE_ARCH 2 /* entries in ARCH_DLINFO */
+
+#endif
diff --git a/arch/arm64/include/uapi/asm/auxvec.h b/arch/arm64/include/uapi/asm/auxvec.h
index 743c0b84fd30..fb51e906813a 100644
--- a/arch/arm64/include/uapi/asm/auxvec.h
+++ b/arch/arm64/include/uapi/asm/auxvec.h
@@ -14,13 +14,11 @@
  * You should have received a copy of the GNU General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef __ASM_AUXVEC_H
-#define __ASM_AUXVEC_H
+#ifndef __UAPI_ASM_AUXVEC_H
+#define __UAPI_ASM_AUXVEC_H
 
 /* vDSO location */
 #define AT_SYSINFO_EHDR	33
 #define AT_MINSIGSTKSZ	51	/* stack needed for signal delivery */
 
-#define AT_VECTOR_SIZE_ARCH 2 /* entries in ARCH_DLINFO */
-
 #endif

-- 
2.53.0


