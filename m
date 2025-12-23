Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1A2E6F090
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 14:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93Pf6X13SUCkXiU5R7ykDf2LAtr96ckHMpNWb3vo6Bg=; b=Lo7eXb9yxywEdfWlOeCPd+Ne7i
	KeIKGKdeel7zZTGUHHSYtgN7BuViQH6vtYGmXm4cBzyD+XhnQcLtJJZDDhDm18xLw+wc29n4e7RCB
	y+y4fjkm4MTXuKLNnPhtIMX2OiiiX34JaHQH2+FWBAWiRmUcTFT+Gjt5oRtxW1B2oSF6ry69aQKGq
	wID5q9TYVaEC9o+SR6ut3hO8kyyhmNc2sTF0OEwelJ8kbfASnWkmFjr+TsLmuj7jJL0WRgOlzxUKE
	mBcnb0XzerqXl8AnYgCI+LTyU2pmMI5ia6K1zhx8sel8nAv0CewQ3+q0gwO3OyKabmO/Irc6a3fJo
	zAD2TuVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY39a-0000000Faim-2HBT;
	Tue, 23 Dec 2025 14:14:22 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY39X-0000000FahS-3JlY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 14:14:20 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2a07fac8aa1so54613505ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 06:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766499259; x=1767104059; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=93Pf6X13SUCkXiU5R7ykDf2LAtr96ckHMpNWb3vo6Bg=;
        b=HapoxW4TK4Z2Jgy9MwXZZd++IJhc0L5PdpGqWK5UiUiMTSfyIRu0W4B+YA4F93ZDjv
         BJicRovwYH9YowJJ7U+qZOR3auf5QMq+jE70ECnFtapWDkHo91R/NGmgDCuJIMATNKQv
         BjsR89CJbJN/8+95QFEm/nnrF+ltyJXm32vgFOSRCJ0Je9PGmgLEzpVCMGnf2oDx6djv
         Wn8nJ5kcZj2BVhAWxa8QsDT0jXgKxg0UkqFTVU9zEq6byTo1gBDRPw41NmJDIJT23gmb
         b1s6NkXAtBJ6SwJbuly2DWxN7To5gstZDZbn5BEj29Ed+EyH6KnmGEVTQg9aQLYNQTDM
         kgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766499259; x=1767104059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=93Pf6X13SUCkXiU5R7ykDf2LAtr96ckHMpNWb3vo6Bg=;
        b=PxaR8X2HcHAPCleKK0omffL6ehtKPe18KTul6PNfrfExOrz6BAp4c9wJOfVjMZry2U
         hmI97poGCR7S0L2nHv2W8iO817ILJsN0+BO/PG7dEWFqZu0wFF3jCDmIM7VB0FaWnjxr
         9d/xTmbUpp7TDP0X8zsTRPpK15276HcyorVwe8uOkOCaUJmGsvG+9QVq8kqsR8O34l1o
         BkgGRiClnewgpjCQiv5jqD+WDxPI7XHPx60LUFBFLW4glcHrH929+wQkQBQfh66/IPjd
         8uPS43hf9PtbcGFH67loP/4ktifnRPEdMepi0C30BccBzUAptboITjNppWoO/LIgUnM3
         fO/A==
X-Forwarded-Encrypted: i=1; AJvYcCW3UNPJb6WIGnooc6QMCL65Jw4Op/6t1RWxOhi51vTUpLlllJsazeBHdGVZN/jfXx/nTchgAQjap5yHWHhFbRlI@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0NkTI02sK2/c5lb6iemw4qG3p3EDCFjqDrD0HDUli4RPHfRBS
	wo4D3r1ps6jyuCFuQA0Wov+xOzeHI7C1BEJ2b3aPRHAao7UtcoScWQYL
X-Gm-Gg: AY/fxX6LfAZWydMneqEgj0H1g6xBVZcaUCy2HYlYQB8QXvPH+VU2YfpeHM/3Fl1TRIv
	ZmzkFpP7Lctmx5EXC8iM3VCsmGayYVUfzhN4inFp7oT/10LP0TIHKrwc+4Sqfl6i3w4jJJCKkAl
	rhcw8nX9KZhFjJL5vZlsvqOfcxMrrT/DFiLXTYPj5VoyVmJrGsDz6rRo7N6VShwgfbesL9FrThi
	N0v75vp5liCEd66ghEE5+CEB5QK91ENQKrANSxuLviA1Zu8LhG+/Y/N2RuYSZe4HH7ZAfMxAwO0
	thndOEpfP+lWK/EPstEytbI2omzUIdYalxh7I02iqyBEq+U+Z04gk6b8d3Hs3l64ykxLwiDVBeb
	eanTz6J5a7Squu/U49lSyr+iMxiqsvGAtF4ZTBuZui5FN+ABGESARN2INwFaUFxpF86aObzATGn
	kWsocxiuyQg0PS
X-Google-Smtp-Source: AGHT+IFxxP4o8t9oxgJnfMD7Rvph5B8jqUM/0u1lCIkIRDfEj0VekGFpThdkzLHanj3mcLJ2UNhZtw==
X-Received: by 2002:a17:903:19cf:b0:2a0:abba:a2f4 with SMTP id d9443c01a7336-2a2f2202f9fmr180596745ad.2.1766499258811;
        Tue, 23 Dec 2025 06:14:18 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3d5dea1sm126783015ad.81.2025.12.23.06.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 06:14:18 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 23 Dec 2025 22:13:43 +0800
Subject: [PATCH 2/3] soc: apple: rtkit: Add protocol version 10 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-rtkit-v10-v1-2-12b4783d6403@gmail.com>
References: <20251223-rtkit-v10-v1-0-12b4783d6403@gmail.com>
In-Reply-To: <20251223-rtkit-v10-v1-0-12b4783d6403@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2685; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=tTm+zqXwen50SB01rU9h2NYFDbVkJ0agw2KXYp566Rw=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpSqO00cm9gv6KSqRnEOw+U36x5MViiExoXK7ex
 +D6c8eT/xeJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaUqjtAAKCRABygi3psUI
 JJ+HEACIk6GTMOs0PDPBjmRg01FJtNN9rcdzL8dCpXfy5X/I1/6GLZI+H2rJMZU7lNdCazplt4v
 aGYE6aL+d1xpwKsEFGGR2nKfu2No0WRAsBJeFXcjQRYbMuKTBWwg6Q5MTdMXnZ/HVzXZSd2rURj
 IWQ7KxszSNG23lX8pzC5Dd1RbnY6C2bfaYShPzmOShThArTTR0kmVGgJIMphlQYS+n6rlCgqES/
 fnu6LF7mC23G1HcAKInIuh2mg5dbDu8pvg0N8g9qIvEVIoXbsasBxWA5RUAXt1aYjskiyJTbZEV
 BQ9l6FBzjaY/wmIBV72/d0SGXsRCTUOcy08cP2P0tT+CwGeMUZ0iJ9jqQAazSce15j3lsTvVlcq
 SwN7tGJKJs2GcDds+HWCSD9hCVLhzCkKzWYgoz5+ahmRe9DZqbVpD09IT48CYKAU1/2X25h20Bk
 sr5G9nu76yqXVj4JhrfB7dmYsMIOGsOtfmn+lA1vPI0hQajvTePtqtJIyB1gjoUf9C5DgyImncu
 onMIVq6Ysc25U5Iuot9o3EckNK0mPnen76ldjS1ckH28YC+FkqktlYWmEdDKQB7xnhesI7EqvJL
 YODj3XltpvKFNr3q6RsBKclhQEOXrwYgnjna6BTJej+dluDTQ11ZmiiMMy0JaGPzXBptqldbg25
 88uroAOXqqLp2yg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_061419_837471_8C9E218F 
X-CRM114-Status: GOOD (  13.11  )
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

Add support for protocol version 10 used from iOS 11-13. In
protocol version 10, epmap is always completed within a single
message, and app endpoints start at 0x6 instead of 0x20.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/soc/apple/rtkit-internal.h |  1 +
 drivers/soc/apple/rtkit.c          | 19 ++++++++++++-------
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/apple/rtkit-internal.h b/drivers/soc/apple/rtkit-internal.h
index 52ef7a202120eb8a56c149179389741ec0f5e358..5f91dea8b7a178b368783d74f8c5786ea2965fa7 100644
--- a/drivers/soc/apple/rtkit-internal.h
+++ b/drivers/soc/apple/rtkit-internal.h
@@ -19,6 +19,7 @@
 #include <linux/workqueue.h>
 #include "mailbox.h"
 
+#define APPLE_RTKIT_APP_ENDPOINT_START_V10 0x6
 #define APPLE_RTKIT_APP_ENDPOINT_START_V11 0x20
 #define APPLE_RTKIT_MAX_ENDPOINTS 0x100
 
diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index 716d6a3e6eefd82d919467e39d68245c5c0d137c..376d1d30fd1e2176357c1daa24c76300c7c70f85 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -71,7 +71,7 @@ enum {
 #define APPLE_RTKIT_OSLOG_SIZE GENMASK_ULL(55, 36)
 #define APPLE_RTKIT_OSLOG_IOVA GENMASK_ULL(35, 0)
 
-#define APPLE_RTKIT_MIN_SUPPORTED_VERSION 11
+#define APPLE_RTKIT_MIN_SUPPORTED_VERSION 10
 #define APPLE_RTKIT_MAX_SUPPORTED_VERSION 12
 
 struct apple_rtkit_rx_work {
@@ -140,7 +140,10 @@ static void apple_rtkit_management_rx_hello(struct apple_rtkit *rtk, u64 msg)
 		 want_ver);
 	rtk->version = want_ver;
 
-	rtk->app_ep_start = APPLE_RTKIT_APP_ENDPOINT_START_V11;
+	if (rtk->version < 11)
+		rtk->app_ep_start = APPLE_RTKIT_APP_ENDPOINT_START_V10;
+	else
+		rtk->app_ep_start = APPLE_RTKIT_APP_ENDPOINT_START_V11;
 
 	reply = FIELD_PREP(APPLE_RTKIT_MGMT_HELLO_MINVER, want_ver);
 	reply |= FIELD_PREP(APPLE_RTKIT_MGMT_HELLO_MAXVER, want_ver);
@@ -171,14 +174,16 @@ static void apple_rtkit_management_rx_epmap(struct apple_rtkit *rtk, u64 msg)
 	}
 
 	reply = FIELD_PREP(APPLE_RTKIT_MGMT_EPMAP_BASE, base);
-	if (msg & APPLE_RTKIT_MGMT_EPMAP_LAST)
-		reply |= APPLE_RTKIT_MGMT_EPMAP_LAST;
-	else
-		reply |= APPLE_RTKIT_MGMT_EPMAP_REPLY_MORE;
+	if (rtk->version > 10) {
+		if (msg & APPLE_RTKIT_MGMT_EPMAP_LAST)
+			reply |= APPLE_RTKIT_MGMT_EPMAP_LAST;
+		else
+			reply |= APPLE_RTKIT_MGMT_EPMAP_REPLY_MORE;
+	}
 
 	apple_rtkit_management_send(rtk, APPLE_RTKIT_MGMT_EPMAP_REPLY, reply);
 
-	if (!(msg & APPLE_RTKIT_MGMT_EPMAP_LAST))
+	if (rtk->version > 10 && !(msg & APPLE_RTKIT_MGMT_EPMAP_LAST))
 		return;
 
 	for_each_set_bit(ep, rtk->endpoints, rtk->app_ep_start) {

-- 
2.52.0


