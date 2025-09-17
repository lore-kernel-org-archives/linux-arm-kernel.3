Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D517DCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7aeGdc4h/xbTU28LGIZWy8TrSPx7BLpfWZuTxuR8H4=; b=IvhFpYERCFuBGV10soR3ZN9PKS
	4qPojv8dril4RCoioJ3LvGBhDxZlDpCO9Kn94uY82/7klA6c4E+g65JxgDnZozg2huO8nXOyJr6tI
	VQcQUZ6PMJa2BOnktVrxhn7aSn4FTW2jsKDlPeWyxavAsHNdRlbhQvJtK/0usCuymuM5g8ztMEF/I
	XMPh69mFae4u+ZwwQxFFFBvCRi/HWtCJSUM2QTyCIOdRruj+LGRY3QgNYLirDnY/unZgLKRBOpl7n
	hwb5ke0fva09NTJqppAmupx66MGdSEmSPyYBpveWRD5mqRZgPxF/4RMZPFylh7i2xggycP06pGD65
	ILfJfW8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyskQ-0000000ByZj-2CTW;
	Wed, 17 Sep 2025 14:03:02 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysja-0000000BxFH-0zUz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:02:11 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P7aeGdc4h/xbTU28LGIZWy8TrSPx7BLpfWZuTxuR8H4=;
	b=vYy29jAZQnRR5kkZwIC9/NqHVRT/v1e2p/cWs+5f7g7fNNC/qoT+53uKFSNXNXsKpN8B2E
	m+3qCLLbTTZ4+Q96GqGryHaf5zSkRuKSrLOv7JNnwp/ax9lb75MCIt7UbsTlifunq53XTQ
	B46ki2hXNpwpzRE1odnOnVvVzvtZoGaksRKLigLO3C4JTMPhUMIipfkhqk+D3ihmvMV4vl
	Qgeomg1DaO3T2zUH8ztRienoHkEnpRBu2zZqtaT43Cw/vXV7Xeom7hcqtVDV/wqkpkDpmo
	aRVRkGuzAn/IPoV9lK7w3+GPH9smyZ20TYSXiCbrIviD1Kg2xx7cUNP1q+dATw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P7aeGdc4h/xbTU28LGIZWy8TrSPx7BLpfWZuTxuR8H4=;
	b=8rpn2BjnZVsb8tPf6dmKjqucj8fOf5/3u7+hCpbjStyZMv/tfE9fcq9R0uNWBv39P6QgxG
	B3rJO306ctdpmgAw==
Date: Wed, 17 Sep 2025 16:00:23 +0200
Subject: [PATCH v3 21/36] vdso/datastore: Reduce scope of some variables in
 vvar_fault()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-vdso-sparc64-generic-2-v3-21-3679b1bc8ee8@linutronix.de>
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
In-Reply-To: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, 
 Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=1194;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=wJ2ZQvnRu7lReSnB3moga2OR6vDIxnQa442GGRRHccQ=;
 b=K0LFnuU1SD/ZvOVTq6nddMBtV2MFVwXdiwVEqfkJP7aZOr/CzMJ7BNdx4j5egkqUW+ECu+RO0
 nzTKkm9h79bBlr1IYgrhBtUrkRW+sWDBvTh59Nbyi6vQt3hEpQrsVjR
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_070210_465509_5605ED29 
X-CRM114-Status: GOOD (  11.25  )
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

These variables are only used inside a single branch.

Move their declarations there.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/datastore.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/vdso/datastore.c b/lib/vdso/datastore.c
index a565c30c71a04ff4116c14f43f4450210eba99c5..2cca4e84e5b5e7686d6a2b42b41af4f399cc5261 100644
--- a/lib/vdso/datastore.c
+++ b/lib/vdso/datastore.c
@@ -41,8 +41,7 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 			     struct vm_area_struct *vma, struct vm_fault *vmf)
 {
 	struct page *timens_page = find_timens_vvar_page(vma);
-	unsigned long addr, pfn;
-	vm_fault_t err;
+	unsigned long pfn;
 
 	switch (vmf->pgoff) {
 	case VDSO_TIME_PAGE_OFFSET:
@@ -54,6 +53,9 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 			 * Fault in VVAR page too, since it will be accessed
 			 * to get clock data anyway.
 			 */
+			unsigned long addr;
+			vm_fault_t err;
+
 			addr = vmf->address + VDSO_TIMENS_PAGE_OFFSET * PAGE_SIZE;
 			err = vmf_insert_pfn(vma, addr, pfn);
 			if (unlikely(err & VM_FAULT_ERROR))

-- 
2.51.0


