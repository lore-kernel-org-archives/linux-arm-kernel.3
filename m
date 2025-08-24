Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F5CCA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 06:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+csAhnTSq9nTMN0IXXONt982/kXLZfoGgBRxeDy+8ek=; b=ykOPxloA1sOB7SQ2wuaL0m7HDn
	my48gljjSbor3a0ZTrmlIpKKGhlsFHSPP7627Kifu4wIp+rzYpL9qpdxgD9kEN/5b8QG21AQ04E6W
	TmYCno8uikfCeGu8FlqyfS4srNXhNDWfueNYmPy5MrBbrvcVlls12+OgaU0W31GUJthismdycfayB
	z+PayVaKOzVJVpL8ZVSKA5vguc5yB0gVKxilyyFvVStcavhFXYsKjOnPFjT28bwrBlMsi3bMyDV5j
	VRWWm0zyk069Tz9jysqfqC+Nqg0tbzpBllHkV4HAnmCvsCfh2ixeCdJze8ujsd0UacHquG79iUbyR
	gvuTxvfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq47m-00000005lfG-0fve;
	Sun, 24 Aug 2025 06:22:42 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq400-00000005l6H-1lei
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 06:14:41 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-76e2ea6ccb7so2604919b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Aug 2025 23:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756016080; x=1756620880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+csAhnTSq9nTMN0IXXONt982/kXLZfoGgBRxeDy+8ek=;
        b=fUFWysIZZ1VCZdr+kWva+cOKLvH9IaPhkdSFEQRkJofPOUBBYKPKDLRDlv7eNMBtLl
         hgLDVrAwI061SMxF6l2LB6D/FNCgaiicV4t5yk3TVe1tg+i3pw83PVKC3MbbaQQMS41+
         vHcaizZ+c9x74xCO+43fYt+tNgtfCIf3BZB78nhl+aR0T/PQjpdtLY8MATq6fsJs6J0S
         MlZUpnis358ZCE7d87y3y1kbiwwraFAUZ+Q2/UR5JpTCtXROUxyRJmX7VcslzptOCzB8
         a/rF3MAs+n+p75LfKZSpUEiQXcSpVe1u5nCeLzxY46w4Ceto4K1XR60rDiwOT1uipPnP
         iANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756016080; x=1756620880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+csAhnTSq9nTMN0IXXONt982/kXLZfoGgBRxeDy+8ek=;
        b=e+E6WhteCSq7GCHZpI7bAkp2i5vwjQvyIwFacLy3fgt/ocIX7QCHHoieGK/Wa/jMTP
         NUfuf3GqxhaHLlO6yfOJhYjthDJhJKsV9XgjvoS1mMvQckXlwUoIQIt9kha/bhVFnfgQ
         VO1rFs45FwuuSQKF2Oa0sYebgjDoJFOlfAPuQo6eSvLUovj2dCgQRHMVTWhY9M1Tf1lW
         TWMI2YCHPGkUPEwsqqDEQXA/gLItzZigjRQ3Q6NfQWc0sQ+GWSXsAVc9HzNlucJ4xe++
         RZeQrD4BDIy4tUzLE887eabZqWLvddQPnElPV3VzVENiST36XF5iGY8/j5haIAJdfX0K
         j1bA==
X-Gm-Message-State: AOJu0YylYFa83eJ7e4PBPVooRQU+M0UPASQ+avRyiYWZFgdjMCHS4bVu
	7WprisNb14X7VfG3Lv5duP8MXUfnLRvxRMELCv+P0S5GmlGG2QxzJiQh
X-Gm-Gg: ASbGnctkq2VntmJ2GahvkdnmItG3yo5lPDS+f4Pfn84t5RecXpk9wjmkEtIwv+C3A1F
	ihVVK9oedvi+DnShqaZjSeUldaUESI0jMWp8+J5plnXuLj8Y0AWbM11IDZdIsLosrXFTd9/jGif
	rNZR7lDHXRC9zWaXpCmgu4LPT24awXwRkNdArDNsva0qTHXq0WeRkxFmIxTm+BNnFba+YjIiam7
	qtjcq4rF99YIMn+sKI3/svG2eI1irwnLzeY0wkWlnP0DndWCR9EJS3sh9DZVuLn9c2CLxyYmimg
	Xt1NoclmMsVXghC7Jd3JnRbkeCXmDFny8pvLCDGtCB5jbrOzM+ky3xt/DcuuRIjRRq1C7yKmkh7
	tWTN+z9cSwmy1+DsCgmyOZOd1aGsCxhaS3aqAotTDyZDCn5q+GdIf
X-Google-Smtp-Source: AGHT+IFXF+ulYVYq6/WZYX4Wzz8c1l4qYzHfwG1UXARA/MN4QDWkAkOJ6QImUbM8o+W/8FDk4xQakQ==
X-Received: by 2002:a05:6a20:7494:b0:240:30c:276a with SMTP id adf61e73a8af0-24340d02389mr11990976637.39.1756016079641;
        Sat, 23 Aug 2025 23:14:39 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d003:7033:ad1b:5a79:43f0:e247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770529149bdsm1654943b3a.98.2025.08.23.23.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 23:14:39 -0700 (PDT)
From: vivekyadav1207731111@gmail.com
To: catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	corbet@lwn.net
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-doc@vger.kernel.org,
	Vivek Yadav <vivekyadav1207731111@gmail.com>
Subject: [PATCH 2/3] kselftest/arm64: Supress warning and improve readability
Date: Sat, 23 Aug 2025 23:14:01 -0700
Message-Id: <20250824061402.13432-3-vivekyadav1207731111@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250824061402.13432-1-vivekyadav1207731111@gmail.com>
References: <20250824061402.13432-1-vivekyadav1207731111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_231440_458038_EFC492C6 
X-CRM114-Status: GOOD (  14.01  )
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

From: Vivek Yadav <vivekyadav1207731111@gmail.com>

The comment was correct, but `checkpatch` script flagged it with a warning
as shown in the output section. The comment is slightly modified
to improve readability, which also suppresses the warning.

```
[command]
	./script/checkpatch.pl --strict -f tools/testing/selftests/arm64/fp/fp-stress.c

[output]
	WARNING: Possible repeated word: 'on'
```

Fixes: 98102a2cb7860 : kselftest/arm64: Hold fp-stress children until they're all spawned.

Signed-off-by: Vivek Yadav <vivekyadav1207731111@gmail.com>
---
 tools/testing/selftests/arm64/fp/fp-stress.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-stress.c b/tools/testing/selftests/arm64/fp/fp-stress.c
index 74e23208b94c..3a0ae96cf909 100644
--- a/tools/testing/selftests/arm64/fp/fp-stress.c
+++ b/tools/testing/selftests/arm64/fp/fp-stress.c
@@ -105,8 +105,8 @@ static void child_start(struct child_data *child, const char *program)
 
 		/*
 		 * Read from the startup pipe, there should be no data
-		 * and we should block until it is closed.  We just
-		 * carry on on error since this isn't super critical.
+		 * and we should block until it is closed. We just
+		 * carry-on on error since this isn't super critical.
 		 */
 		ret = read(3, &i, sizeof(i));
 		if (ret < 0)
-- 
2.25.1


