Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FADC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 11:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfUaF9ZM/sDC2742hKCsP1ynzqPjDFo3SoemEN7MXiw=; b=R/gEoLVfz2bCrJtfw14hyrVpV6
	GRBvICAfJKcPXbc9+YFnfHVkb+3d1CIPyLhkfi8gCsubcTloY27jHM9fx3puvjcdH/L1Q2DRZLpqg
	xNqj//+fhCgdNU2tUdBytIau0If9OlrQXb9QTlyyZhy15MMeXRDcjbmXGI3Fgb8GJOuBF8z2TAZFh
	bGSfnASxQVPCdpKodt2KfpHWyjBFuK+rI5rrBlKKzsP6RWAVFIyi1wP19wFxjmxTVuVi4cwx+TVPR
	9ROJE31vQ7SKDzhZhO1PcdL0XZ1liucI4/HMzwYwNCepEMAXinDsTa6sKBO/c1uANWhLtmGVipY0I
	96FUhFRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4MK-00000000e3u-3ZDV;
	Mon, 03 Mar 2025 11:53:20 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3hc-00000000Tr1-4B1B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 11:11:18 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TfUaF9ZM/sDC2742hKCsP1ynzqPjDFo3SoemEN7MXiw=;
	b=rsLn/M4m3C8C47//EcdlpS0gXuo2S8wQBjDlujUkeS/RnT2e7kEu1ZpPQLBhJPnl5F5Dmx
	Bnz9W6RvqO+XSj3gXinEcZXHTpjXZbuevhvVGl0N2jdGn/+Tig4flR6nR/JGTxB9/cyvYn
	eP2uKi7alGTLQIjYf+iG6izSyMtWFfHgpfTidXcTJL+QBX26d7SIb2ZkMVVy9cVLS/75qJ
	SSHpkxYM79/XNYhRRZbdx8weq1qxLRdEz+P/dzOcM918QM7Xn6IxyB1uOJQv4tBq0chmKS
	Z4cp3An4kPROpJxzqRvLsLIFdgmSIZomtmy7D4kFiX784zgsUt/5hgwfGEmaqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TfUaF9ZM/sDC2742hKCsP1ynzqPjDFo3SoemEN7MXiw=;
	b=+G7CPOXa/ZWNxu6fthMtPvHWjD/eNSSKNL+q0WW80iJGWJhuVfvM0Ibxa4KTEM0uLK5NDu
	Ntj+12tjKCTbUGCQ==
Date: Mon, 03 Mar 2025 12:11:15 +0100
Subject: [PATCH 13/19] vdso/namespace: Rename timens_setup_vdso_data() to
 reflect new vdso_clock struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250303-vdso-clock-v1-13-c1b5c69a166f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=2585;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=deY68vPxYVkoFnSlPdJ3pbtph7Y53gSWK99Jd8i7ioE=;
 b=qUFMIhhMLCqTE6c0fsVZpLM2srZkxcqqjDXZ3u3EzqbyA9lpIiErtiIS89RMGeKHwKrCWS4y9
 zvNwoxlkRFFDJzuFefrTwdqSIzx82VtsLrum1h7uvLyVZbiQfvPmRLS
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_031117_327943_04FABCFC 
X-CRM114-Status: GOOD (  14.27  )
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
struct vdso_time_data there will be array of it.

For time namespace, vdso_time_data needs to be set up. But this is only the
clock related part of the vdso_data thats requires this setup. To reflect
the future struct vdso_clock, rename timens_setup_vdso_data() to
timns_setup_vdso_clock_data().

No functional change.

Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 kernel/time/namespace.c | 6 +++---
 lib/vdso/datastore.c    | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/time/namespace.c b/kernel/time/namespace.c
index 12f55aa539adbc11cce4055f519dbeca8a73320c..f02430a73be8f081618792c8968bf0c112c54505 100644
--- a/kernel/time/namespace.c
+++ b/kernel/time/namespace.c
@@ -176,8 +176,8 @@ static struct timens_offset offset_from_ts(struct timespec64 off)
  * Timens page has vdso_time_data->clock_mode set to VDSO_CLOCKMODE_TIMENS which
  * enforces the time namespace handling path.
  */
-static void timens_setup_vdso_data(struct vdso_time_data *vdata,
-				   struct time_namespace *ns)
+static void timens_setup_vdso_clock_data(struct vdso_time_data *vdata,
+					 struct time_namespace *ns)
 {
 	struct timens_offset *offset = vdata->offset;
 	struct timens_offset monotonic = offset_from_ts(ns->offsets.monotonic);
@@ -238,7 +238,7 @@ static void timens_set_vvar_page(struct task_struct *task,
 	vdata = page_address(ns->vvar_page);
 
 	for (i = 0; i < CS_BASES; i++)
-		timens_setup_vdso_data(&vdata[i], ns);
+		timens_setup_vdso_clock_data(&vdata[i], ns);
 
 out:
 	mutex_unlock(&offset_lock);
diff --git a/lib/vdso/datastore.c b/lib/vdso/datastore.c
index e227fbbcb79694f9a40606ac864f52cf1fdbfcf4..4e350f56ace335b7ebca8af7663b5731fae27334 100644
--- a/lib/vdso/datastore.c
+++ b/lib/vdso/datastore.c
@@ -109,7 +109,7 @@ struct vm_area_struct *vdso_install_vvar_mapping(struct mm_struct *mm, unsigned
  * non-root time namespace. Whenever a task changes its namespace, the VVAR
  * page tables are cleared and then they will be re-faulted with a
  * corresponding layout.
- * See also the comment near timens_setup_vdso_data() for details.
+ * See also the comment near timens_setup_vdso_clock_data() for details.
  */
 int vdso_join_timens(struct task_struct *task, struct time_namespace *ns)
 {

-- 
2.48.1


