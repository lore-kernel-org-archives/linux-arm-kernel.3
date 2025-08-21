Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18984CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/F29cEovaHVN8o+FIDVU061rnTin0toZlCYdfK4Q0zg=; b=eR7ul5vUUzPug1e6VQ2YcbRB1v
	gjFrKoEUOPTxT/CmVnrQP6sQqaK1mQMyeANgrwjKM0YMBIxZip+b44bri+2lyGn1dnyw09EdAzYcN
	f20b8t/CAdd0fWlySbGSpjXojZEdhsxAxvC0ICDS+bEWcg4rdsiXMtZsBFeynt+TGOhS1pDJ0I1J/
	Mw+3d/ie5s4nYkd+0owzE1OM+OdeY1pz/upkIy04lTuL/iMG8gIhhUnqIC/bfPUaet5uR5wpaHabC
	1/e3uxClBYOc1AapmB/CmEPZAgs41VTqmT73PwhWSiUqzCpZ2fajws6b9OsplZEg5EKBzxobOyZJQ
	+xYtGjDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDuv-00000000n0i-0I2f;
	Thu, 21 Aug 2025 22:37:57 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7P5-0000000HQkz-3dNF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 15:40:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1755790835;
	bh=q8eDqbBILV1czBvM5POhEnSq70A3azxubc0c65GrQKM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E7tpchI2nBpTyr+2NlCGg78PYwKvGYmLXU4Uyf9IURlN/qMjFhotSb2EBBZe5bxvo
	 peHSg2ztW64C706LhaLGnw2xczkfS89hB7/tnD9yKTbw0TJrC6cQv6ApWadoddU0WN
	 /lahqv/cFbpUQwhJV6YJe87P0NjBdeuB41TGBuRQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 21 Aug 2025 17:40:36 +0200
Subject: [PATCH 5/7] tools/nolibc: fold llseek fallback into lseek()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250821-nolibc-enosys-v1-5-4b63f2caaa89@weissschuh.net>
References: <20250821-nolibc-enosys-v1-0-4b63f2caaa89@weissschuh.net>
In-Reply-To: <20250821-nolibc-enosys-v1-0-4b63f2caaa89@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755790835; l=2033;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=q8eDqbBILV1czBvM5POhEnSq70A3azxubc0c65GrQKM=;
 b=VMu49a5Wy73r0fgc4zP29tox+EehdPaQ8G+k4voG279AOB1IPE6egnoEbJYZboZiVaYYqWHOj
 JibyB/ALf/sDEha4WbsUFrhO0NXKNF++R8g+lamKvC5+KVmDGyPro03
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_084040_049093_442873C6 
X-CRM114-Status: GOOD (  11.27  )
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

Align the implementation of the fallback handling inside sys_lseek()
with the rest of nolibc.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/sys.h | 42 ++++++++++++++----------------------------
 1 file changed, 14 insertions(+), 28 deletions(-)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index fc3c8a3d02e9a031aad2229a430c232eb60065b1..f31db0f471131f82389129989054e2b55a41a7cb 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -581,41 +581,27 @@ off_t sys_lseek(int fd, off_t offset, int whence)
 #if defined(__NR_lseek)
 	return my_syscall3(__NR_lseek, fd, offset, whence);
 #else
-	return __nolibc_enosys(__func__, fd, offset, whence);
-#endif
-}
+	__kernel_loff_t loff = 0;
+	off_t result;
+	int ret;
 
-static __attribute__((unused))
-int sys_llseek(int fd, unsigned long offset_high, unsigned long offset_low,
-	       __kernel_loff_t *result, int whence)
-{
-#if defined(__NR_llseek)
-	return my_syscall5(__NR_llseek, fd, offset_high, offset_low, result, whence);
-#else
-	return __nolibc_enosys(__func__, fd, offset_high, offset_low, result, whence);
+	/* Only exists on 32bit where nolibc off_t is also 32bit */
+	ret = my_syscall5(__NR_llseek, fd, 0, offset, &loff, whence);
+	if (ret < 0)
+		result = ret;
+	else if (loff != (off_t)loff)
+		result = -EOVERFLOW;
+	else
+		result = loff;
+
+	return result;
 #endif
 }
 
 static __attribute__((unused))
 off_t lseek(int fd, off_t offset, int whence)
 {
-	__kernel_loff_t loff = 0;
-	off_t result;
-	int ret;
-
-	result = sys_lseek(fd, offset, whence);
-	if (result == -ENOSYS) {
-		/* Only exists on 32bit where nolibc off_t is also 32bit */
-		ret = sys_llseek(fd, 0, offset, &loff, whence);
-		if (ret < 0)
-			result = ret;
-		else if (loff != (off_t)loff)
-			result = -EOVERFLOW;
-		else
-			result = loff;
-	}
-
-	return __sysret(result);
+	return __sysret(sys_lseek(fd, offset, whence));
 }
 
 

-- 
2.50.1


