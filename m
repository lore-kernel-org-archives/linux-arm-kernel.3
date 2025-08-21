Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F48CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kP8M+83ssqO6dNwfXdJUOoxGNlSXFzicbgZV4R7Bd/4=; b=V4AMLzzrRK13hzzlkTbDfvhhCe
	W8bbLDjCTlXpL3r9kEg6iTdj3Ce/JBTJ8tG/m1cErc7kQk+WUUoDF5ASBjYxQPuVacr7WmYQDFxPx
	oH2/VeZ3FXCz6UPlRkpskqOKLsZckkVc5hi51DcPz4MB3r3fXvJXewxH1IDSKndmfrLXq+SODNnx/
	gbk1PLWJYYw5N3P2UyJ6VcZ+E3RRc6peQpv0JUtg8Nn5j1gsFuaQAmVQneFa+apqWmQmyzY1Xpsm7
	4GUbUXEXXx6LasfvsTa1GYFyXWbSy+8cdjqHnVWbPMbkmE2mwjIxLz22AT3kjHmllyEfSvYbB3z+w
	t1yps3dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDup-00000000mv0-1RSk;
	Thu, 21 Aug 2025 22:37:51 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7P3-0000000HQjM-3lmh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 15:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1755790835;
	bh=Q57fMOSIHmitf0RgmFKEHgmC2mjuTNIw+xrEbPhFM0A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oSG85jo53WxZgChcG3vNCa8gPefb1cturzLp9fcUP98upOiFiroLPHpHpgE38s2QB
	 gqX4zuyIOYV3okHTd69KK+maRfMpns8+JCInjuIUn4DzlXTkVnLnmPwtgZIyG/CsgJ
	 4q8kZgGaxstJA8CEJjfkA68GgkE0l+6ORojsh/h8=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 21 Aug 2025 17:40:35 +0200
Subject: [PATCH 4/7] tools/nolibc: remove __nolibc_enosys() fallback from
 fork functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250821-nolibc-enosys-v1-4-4b63f2caaa89@weissschuh.net>
References: <20250821-nolibc-enosys-v1-0-4b63f2caaa89@weissschuh.net>
In-Reply-To: <20250821-nolibc-enosys-v1-0-4b63f2caaa89@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755790835; l=1260;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Q57fMOSIHmitf0RgmFKEHgmC2mjuTNIw+xrEbPhFM0A=;
 b=Jj4T58dHtrOBuyLoxgHvWb7fDfeE6kTlbVgRDvn6fIGP5YcQbg/u386kNVBZ8TQh6ak/SuV7Y
 XyieRAHMi+7DaJKjka98snqABIVCEl0ZB62dI4HElo+w7UIqKKzcXjL
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_084038_129108_9B8BDC42 
X-CRM114-Status: UNSURE (   8.60  )
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

All architectures have one of the real functions available.
The additional fallback to __nolibc_enosys() is superfluous.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/sys.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 9c4fa7efc1d606f18a5a92b0a3dd9ad7b9b4521b..fc3c8a3d02e9a031aad2229a430c232eb60065b1 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -321,10 +321,8 @@ pid_t sys_fork(void)
 	 * will not use the rest with no other flag.
 	 */
 	return my_syscall5(__NR_clone, SIGCHLD, 0, 0, 0, 0);
-#elif defined(__NR_fork)
-	return my_syscall0(__NR_fork);
 #else
-	return __nolibc_enosys(__func__);
+	return my_syscall0(__NR_fork);
 #endif
 }
 #endif
@@ -341,7 +339,7 @@ pid_t sys_vfork(void)
 {
 #if defined(__NR_vfork)
 	return my_syscall0(__NR_vfork);
-#elif defined(__NR_clone3)
+#else
 	/*
 	 * clone() could be used but has different argument orders per
 	 * architecture.
@@ -352,8 +350,6 @@ pid_t sys_vfork(void)
 	};
 
 	return my_syscall2(__NR_clone3, &args, sizeof(args));
-#else
-	return __nolibc_enosys(__func__);
 #endif
 }
 #endif

-- 
2.50.1


