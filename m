Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F7BCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 19:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oe8LIePCJW+0XKvrlHmiLxXuQ/BPloIja5KGZgcaRk=; b=lmbgmASJeG9z+5t49lcedLSGLe
	JZjmQ45aoWBNPJ4kBIqai9Q1/muay5UyqqZ+3zYGioOEpL4nG9p5rOLBqsR2xa0qEVN6iTsbUpNQR
	yl4tsKHzO4kvPrlkHffeFgfZHi/00OHLt3QaHClJDu+SnBYf8QRSZVO5kf5m5Cp1pE4aO3QATnBAW
	vpT7wQDHOu3Inm1KRtiigQbkeN0RTTK7HwxsdjfLiapyt3mNdmfJ7U5/M3iMSfWNJPYY3ZI5Sv2JP
	L0q2YeExn8pBr5Rs8f//KN5TcVP8Nis/kKxXo5z/yKmosTL8My9IWuCJxYUXGz0fkK2wVpLwbB68B
	8JjHD2BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBOi-00000000MRa-2OLo;
	Thu, 21 Aug 2025 19:56:32 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7P5-0000000HQl2-3qBX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 15:40:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1755790835;
	bh=K3Flvop9DgAFaUxrOP24qwqt1AB7pgft6CYh8LQ9d1M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NaEuc0pPH/OfFQXUYS/0KYY2jT7bdW/6rWs6H3VQ3Oj9QdljGJTB0FJuq7FAhJTkX
	 r7hgm3fpfXVGi2kRIL9P8FBfAqIdvuUHoZskfU+S+cHLV4sOEyrvMUVR10EmUrdk3Y
	 RBore3JB0gSnXCkiCDLv0RyJa+ZbK/k+n8FCV6RI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 21 Aug 2025 17:40:38 +0200
Subject: [PATCH 7/7] tools/nolibc: drop wait4() support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250821-nolibc-enosys-v1-7-4b63f2caaa89@weissschuh.net>
References: <20250821-nolibc-enosys-v1-0-4b63f2caaa89@weissschuh.net>
In-Reply-To: <20250821-nolibc-enosys-v1-0-4b63f2caaa89@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755790835; l=1555;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=K3Flvop9DgAFaUxrOP24qwqt1AB7pgft6CYh8LQ9d1M=;
 b=LCj6oInxdTg/ApcY0tpjs/r3Gc/B9XIij3VZTtL++fFqMqZwWdJJ6hp7UJas8KDXdMjkJbidm
 5kO4uAgF4ZxDqliD9oncd0c58Alr0+p2Ym8YEQxZRXqJykrR0eL4jlu
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_084040_106360_BD5BCADC 
X-CRM114-Status: UNSURE (   7.86  )
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

Not all architectures implement the wait4() syscall. It can be
implemented in terms of the waitid() syscall, but that would require
some rework of the other wait-related functions in wait.h.

As wait4() is non-standard and deprecated, remove it.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/sys/wait.h | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/tools/include/nolibc/sys/wait.h b/tools/include/nolibc/sys/wait.h
index 56ddb806da7f2466be5523b52fd01480b711daec..4e66e1f7a03e4585c91ec4ea68333b910600239a 100644
--- a/tools/include/nolibc/sys/wait.h
+++ b/tools/include/nolibc/sys/wait.h
@@ -16,27 +16,10 @@
 
 /*
  * pid_t wait(int *status);
- * pid_t wait4(pid_t pid, int *status, int options, struct rusage *rusage);
  * pid_t waitpid(pid_t pid, int *status, int options);
  * int waitid(idtype_t idtype, id_t id, siginfo_t *infop, int options);
  */
 
-static __attribute__((unused))
-pid_t sys_wait4(pid_t pid, int *status, int options, struct rusage *rusage)
-{
-#ifdef __NR_wait4
-	return my_syscall4(__NR_wait4, pid, status, options, rusage);
-#else
-	return __nolibc_enosys(__func__, pid, status, options, rusage);
-#endif
-}
-
-static __attribute__((unused))
-pid_t wait4(pid_t pid, int *status, int options, struct rusage *rusage)
-{
-	return __sysret(sys_wait4(pid, status, options, rusage));
-}
-
 static __attribute__((unused))
 int sys_waitid(int which, pid_t pid, siginfo_t *infop, int options, struct rusage *rusage)
 {

-- 
2.50.1


