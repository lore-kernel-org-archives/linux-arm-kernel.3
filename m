Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532C5CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LryzSxr/CHj1BhiyvnNb/9ryQYgqP9VUO8tu8y6AezM=; b=05M9x1nj3/TdjnPePsdDD44hE4
	He5m89C3DE81umVMiDquRDRVsIsEYJtHmvj3f81fpaR3oJjVPv+C52eD/0LR1/u+Bv1b1/zW2iAD6
	FcyUNnGVVZrLJ/PzRyilPXkMSJBn+jnXE1N9CBq5OtJTqx41czlsJHRK0qcNOvb2+qMMRulz/aO+u
	113KsDZ6JYh/x18hv1cXhEwGi/hn3OpHgLmAHno9jUIQyr36JZONgj54DMpaDgWSMR3OuKHt5pFVV
	CW3pfe23A9UFCUB0uwC8ms1npSS19gk6ANmQuh2GuoJR1zAPl6pRMoiY7/wPh1TZcZ02h7UXNWkVE
	DsDB1i6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDuh-00000000mlo-1xjw;
	Thu, 21 Aug 2025 22:37:43 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7P3-0000000HQir-1So8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 15:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1755790835;
	bh=qlooV4/9feWqqCDg0dJlCRxAE5NSCnoqNE5KelQxzIA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jzvr7swsgNMpRLJVGgYKXJeYY/zF9+CQGtDzE12MdLG2D/lqqz9MVs3o6spjM8b5D
	 Iu07OAkzCfwE+ZSqYSIe+Opla8FTeyip0WCidH4DbDTA3cn9810Lo5gEOZzwqM6lwk
	 SJrfGStyezwSLpbpY+SSc+nPHtwbgzVUWk/X6biQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 21 Aug 2025 17:40:32 +0200
Subject: [PATCH 1/7] tools/nolibc: remove __nolibc_enosys() fallback from
 time64-related functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250821-nolibc-enosys-v1-1-4b63f2caaa89@weissschuh.net>
References: <20250821-nolibc-enosys-v1-0-4b63f2caaa89@weissschuh.net>
In-Reply-To: <20250821-nolibc-enosys-v1-0-4b63f2caaa89@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755790835; l=4789;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=qlooV4/9feWqqCDg0dJlCRxAE5NSCnoqNE5KelQxzIA=;
 b=EDjgZpT3Utcf78HHrbEoVGhAg99CTq/rmAj0Su7rrwewKik8Ue2qWM+GodiSXWP6TsD+6akqR
 Ki3f4Ib5U7zBMfG6djt1iR7Gz4c8Hdxoh7AOw0sC/V8G1SyrkbjEPDm
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_084037_531486_B3F8A4BF 
X-CRM114-Status: UNSURE (   9.17  )
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

These fallbacks where added when no explicit fallbacks for time64 was
implemented. Now that these fallbacks are in place, the additional
fallback to __nolibc_enosys() is superfluous.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/poll.h        | 4 +---
 tools/include/nolibc/sys.h         | 4 +---
 tools/include/nolibc/sys/timerfd.h | 8 ++------
 tools/include/nolibc/time.h        | 8 ++------
 4 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/tools/include/nolibc/poll.h b/tools/include/nolibc/poll.h
index 1765acb17ea01ff53cbad0b4750e4938446b6a45..0d053f93ea99b0363b4bdfd2c400d6df2f932684 100644
--- a/tools/include/nolibc/poll.h
+++ b/tools/include/nolibc/poll.h
@@ -39,10 +39,8 @@ int sys_poll(struct pollfd *fds, int nfds, int timeout)
 		t.tv_nsec = (timeout % 1000) * 1000000;
 	}
 	return my_syscall5(__NR_ppoll_time64, fds, nfds, (timeout >= 0) ? &t : NULL, NULL, 0);
-#elif defined(__NR_poll)
-	return my_syscall3(__NR_poll, fds, nfds, timeout);
 #else
-	return __nolibc_enosys(__func__, fds, nfds, timeout);
+	return my_syscall3(__NR_poll, fds, nfds, timeout);
 #endif
 }
 
diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 295e71d34abadb7f9c7ca995012b4395b6830975..4e5389edda03a61e76ad0377213e8ef0a621d300 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -801,7 +801,7 @@ int sys_select(int nfds, fd_set *rfds, fd_set *wfds, fd_set *efds, struct timeva
 		t.tv_nsec = timeout->tv_usec * 1000;
 	}
 	return my_syscall6(__NR_pselect6, nfds, rfds, wfds, efds, timeout ? &t : NULL, NULL);
-#elif defined(__NR_pselect6_time64)
+#else
 	struct __kernel_timespec t;
 
 	if (timeout) {
@@ -809,8 +809,6 @@ int sys_select(int nfds, fd_set *rfds, fd_set *wfds, fd_set *efds, struct timeva
 		t.tv_nsec = timeout->tv_usec * 1000;
 	}
 	return my_syscall6(__NR_pselect6_time64, nfds, rfds, wfds, efds, timeout ? &t : NULL, NULL);
-#else
-	return __nolibc_enosys(__func__, nfds, rfds, wfds, efds, timeout);
 #endif
 }
 
diff --git a/tools/include/nolibc/sys/timerfd.h b/tools/include/nolibc/sys/timerfd.h
index 4375d546ba58f849b3ba48e7b221e6ec3c15fcf6..5dd61030c9914d2b6b2a71130d07a32ef7c37781 100644
--- a/tools/include/nolibc/sys/timerfd.h
+++ b/tools/include/nolibc/sys/timerfd.h
@@ -34,7 +34,7 @@ int sys_timerfd_gettime(int fd, struct itimerspec *curr_value)
 {
 #if defined(__NR_timerfd_gettime)
 	return my_syscall2(__NR_timerfd_gettime, fd, curr_value);
-#elif defined(__NR_timerfd_gettime64)
+#else
 	struct __kernel_itimerspec kcurr_value;
 	int ret;
 
@@ -42,8 +42,6 @@ int sys_timerfd_gettime(int fd, struct itimerspec *curr_value)
 	__nolibc_timespec_kernel_to_user(&kcurr_value.it_interval, &curr_value->it_interval);
 	__nolibc_timespec_kernel_to_user(&kcurr_value.it_value, &curr_value->it_value);
 	return ret;
-#else
-	return __nolibc_enosys(__func__, fd, curr_value);
 #endif
 }
 
@@ -60,7 +58,7 @@ int sys_timerfd_settime(int fd, int flags,
 {
 #if defined(__NR_timerfd_settime)
 	return my_syscall4(__NR_timerfd_settime, fd, flags, new_value, old_value);
-#elif defined(__NR_timerfd_settime64)
+#else
 	struct __kernel_itimerspec knew_value, kold_value;
 	int ret;
 
@@ -72,8 +70,6 @@ int sys_timerfd_settime(int fd, int flags,
 		__nolibc_timespec_kernel_to_user(&kold_value.it_value, &old_value->it_value);
 	}
 	return ret;
-#else
-	return __nolibc_enosys(__func__, fd, flags, new_value, old_value);
 #endif
 }
 
diff --git a/tools/include/nolibc/time.h b/tools/include/nolibc/time.h
index e9c1b976791a65c0d73268bebbcfd4f2a57a47ee..6c276b8d646a4e8fd84162b6cb74c73649a092c2 100644
--- a/tools/include/nolibc/time.h
+++ b/tools/include/nolibc/time.h
@@ -45,7 +45,7 @@ int sys_clock_getres(clockid_t clockid, struct timespec *res)
 {
 #if defined(__NR_clock_getres)
 	return my_syscall2(__NR_clock_getres, clockid, res);
-#elif defined(__NR_clock_getres_time64)
+#else
 	struct __kernel_timespec kres;
 	int ret;
 
@@ -53,8 +53,6 @@ int sys_clock_getres(clockid_t clockid, struct timespec *res)
 	if (res)
 		__nolibc_timespec_kernel_to_user(&kres, res);
 	return ret;
-#else
-	return __nolibc_enosys(__func__, clockid, res);
 #endif
 }
 
@@ -69,7 +67,7 @@ int sys_clock_gettime(clockid_t clockid, struct timespec *tp)
 {
 #if defined(__NR_clock_gettime)
 	return my_syscall2(__NR_clock_gettime, clockid, tp);
-#elif defined(__NR_clock_gettime64)
+#else
 	struct __kernel_timespec ktp;
 	int ret;
 
@@ -77,8 +75,6 @@ int sys_clock_gettime(clockid_t clockid, struct timespec *tp)
 	if (tp)
 		__nolibc_timespec_kernel_to_user(&ktp, tp);
 	return ret;
-#else
-	return __nolibc_enosys(__func__, clockid, tp);
 #endif
 }
 

-- 
2.50.1


