Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8645CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7nLDvghTeLFLxfFcfqDmZm0IGTPIPoMSbfTDdVoijE=; b=OXK8eb2PttZeopg2mDynK85H8H
	PpTsKroiXi7bPQuI+zRrcpEpp98xnKHRW/H96Xqz7o/z/uZyZrIeQcl/IhgOq6P98sp+E4WNPFy78
	DL7dHaurIq1ylNY/K171zlBB1d2cpVtmGyU19rwzGbX/VSiFhPyyKpxrlTKAVd6nkapOu3rWpbGF9
	HwDYmZrO0S1HiQDRTldUNixMSeTQUwYvtzu0bfCBYlSZf1d1KFPo3a+LA7lFXQwr8blvEGBBY0LIf
	YBaSF2WDpN6CLKGp4mVKqoYx1ELapBvMDJz0QstzyTLRzxKqUHpKKxiK0b2JxqXE8irTeLhLQmY75
	oyKmVCUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDud-00000000mhU-3HQo;
	Thu, 21 Aug 2025 22:37:39 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7P3-0000000HQiq-0FqQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 15:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1755790835;
	bh=lJZvG23U87rgiOGKfE/Nw17HdxdXmhpAjW+f05nD3+Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tfIHsAKUdlhE3JfZMTPsthocNLD6ubw3qrp7dKiy9ruHd5j/oYnP4pYmy8WF6A4wP
	 xAG33BlmM+fzK3F03ZLgSs0ezFCaQhVS6dEyT9V4uHkDeAvuWCksRs/3LezYuGsZGw
	 iUlNkyBi0x7Kuqg8+SeeiwCto/d5AoZqha81cAm8=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 21 Aug 2025 17:40:34 +0200
Subject: [PATCH 3/7] tools/nolibc: remove __nolibc_enosys() fallback from
 dup2()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250821-nolibc-enosys-v1-3-4b63f2caaa89@weissschuh.net>
References: <20250821-nolibc-enosys-v1-0-4b63f2caaa89@weissschuh.net>
In-Reply-To: <20250821-nolibc-enosys-v1-0-4b63f2caaa89@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755790835; l=841;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=lJZvG23U87rgiOGKfE/Nw17HdxdXmhpAjW+f05nD3+Q=;
 b=RXUu/QyPF4EAgnDokpRfyPuO6CVAQRbUmb7Ce1r3/E3Oekw6nRTlDhkW19/s8p0vL2PX4H+Xz
 mFK27aYX3z2Cw+QsDicbioNafkpEH6HeEA26wEHrqDr9/wv+1VbXwIz
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_084037_243263_0B2E859E 
X-CRM114-Status: UNSURE (   7.89  )
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
 tools/include/nolibc/sys.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 2b9c3bf697e74e80016606814fe21929512ca007..9c4fa7efc1d606f18a5a92b0a3dd9ad7b9b4521b 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -235,10 +235,8 @@ int sys_dup2(int old, int new)
 {
 #if defined(__NR_dup3)
 	return my_syscall3(__NR_dup3, old, new, 0);
-#elif defined(__NR_dup2)
-	return my_syscall2(__NR_dup2, old, new);
 #else
-	return __nolibc_enosys(__func__, old, new);
+	return my_syscall2(__NR_dup2, old, new);
 #endif
 }
 

-- 
2.50.1


