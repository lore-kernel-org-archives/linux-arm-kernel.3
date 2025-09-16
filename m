Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A207CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 16:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qqkXzxxknXamH7BrZkFPAvijm4XBibdU4Q55tTWKGZk=; b=edYOJTzSZCmdooqfbs1/A2MWPN
	9/PWSPr9NVMEztLpRZq9rrBtWfBEsVLzYcecoZS900vTM9RW+++zYms6UDrKaA/hjpCGFWFAUnfTD
	+HVXB0j6YLM5McYPisNuvVirEmHRHM5ybU1Rw5sq86nHgFWd5CRws0bsA+gmrnp95u+XqqCmYgkBv
	rH4ks0vtYOovEtCYx5cKH7ddU08gvklkXaRkhi1bP1kKBWUy5HCdjfYsfP6sMteG4UOcmfI4I2kSA
	Hvyu6h4H9lYls15EXkN5ANla5xRf7e4XRMRH354FDKztRZRfNokzrDmpXf97teTz9yG5Nk7aNcn3C
	osQ/o2eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYuJ-00000008XSp-18e2;
	Tue, 16 Sep 2025 16:51:55 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYuG-00000008XRA-3UGC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 16:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1758041508;
	bh=lBF3mDXzti9+laxIzr4FHTuLqFzaAZ5MHcHfIKkRgqE=;
	h=From:Date:Subject:To:Cc:From;
	b=dfX7/PBYX9o6OmQQ5mVCPe1wVbVQoZ1oMUaQF+ooFBmySRUtb0+p3IeOSXqi02FSm
	 utNVgiZS4SE4lAQvG70jNzpiwxY6GxcVRurvy7w/5tQGebavlbjK1c7z17g+qTfnOk
	 rvkM5uJJlKrCdQGHCb12UuMrCQ5pty3EzcU32HJY=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 16 Sep 2025 18:51:35 +0200
Subject: [PATCH] kselftest/arm64/gcs/basic-gcs: Respect parent directory
 CFLAGS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250916-arm64-gcs-nolibc-v1-1-ee54aa65fc26@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAJaVyWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS0Mz3cSiXDMT3fTkYt28/JzMpGRd8xTDNAPjRKNE4+Q0JaC2gqLUtMw
 KsJHRsbW1ALPe7+ZiAAAA
X-Change-ID: 20250916-arm64-gcs-nolibc-7d1f03a2a3cf
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, 
 Linux Kernel Functional Testing <lkft@linaro.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758041507; l=2128;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=lBF3mDXzti9+laxIzr4FHTuLqFzaAZ5MHcHfIKkRgqE=;
 b=k/GviUbM+MEMtaxixr3f1Or6Y88ToYlCi3Dv8wXkzwS729fUzQxmaGGkpeUfsWF8zi6QA6j/Q
 s2SOuEGp+WcDRb8GXPEQ0KPh6IS/WlK77QYakGkAydZD48tzEcrHQ0a
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_095153_043887_BE69DC41 
X-CRM114-Status: GOOD (  10.19  )
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

basic-gcs has it's own make rule to handle the special compiler
invocation to build against nolibc. This rule does not respect the
$(CFLAGS) passed by the Makefile from the parent directory.
However these $(CFLAGS) set up the include path to include the UAPI
headers from the current kernel.
Due to this the asm/hwcap.h header is used from the toolchain instead of
the UAPI and the definition of HWCAP_GCS is not found.

Restructure the rule for basic-gcs to respect the $(CFLAGS).
Also drop those options which are already provided by $(CFLAGS).

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Closes: https://lore.kernel.org/lkml/CA+G9fYv77X+kKz2YT6xw7=9UrrotTbQ6fgNac7oohOg8BgGvtw@mail.gmail.com/
Fixes: a985fe638344 ("kselftest/arm64/gcs: Use nolibc's getauxval()")
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/testing/selftests/arm64/gcs/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/arm64/gcs/Makefile b/tools/testing/selftests/arm64/gcs/Makefile
index d2f3497a9103fc12ebc90c7f4e33ab9b846c6c8a..1fbbf0ca1f0291d00882920eb2d1efbf99882ec1 100644
--- a/tools/testing/selftests/arm64/gcs/Makefile
+++ b/tools/testing/selftests/arm64/gcs/Makefile
@@ -14,11 +14,11 @@ LDLIBS+=-lpthread
 include ../../lib.mk
 
 $(OUTPUT)/basic-gcs: basic-gcs.c
-	$(CC) -g -fno-asynchronous-unwind-tables -fno-ident -s -Os -nostdlib \
-		-static -include ../../../../include/nolibc/nolibc.h \
+	$(CC) $(CFLAGS) -fno-asynchronous-unwind-tables -fno-ident -s -nostdlib -nostdinc \
+		-static -I../../../../include/nolibc -include ../../../../include/nolibc/nolibc.h \
 		-I../../../../../usr/include \
 		-std=gnu99 -I../.. -g \
-		-ffreestanding -Wall $^ -o $@ -lgcc
+		-ffreestanding $^ -o $@ -lgcc
 
 $(OUTPUT)/gcs-stress-thread: gcs-stress-thread.S
 	$(CC) -nostdlib $^ -o $@

---
base-commit: 14a41628c470f4aa069075cdcf6ec0138b6cf1da
change-id: 20250916-arm64-gcs-nolibc-7d1f03a2a3cf

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


