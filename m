Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4051CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 05:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfzDzbQEvI2nMK5aWsczii03Df0gZy+c2/ZhXQWQ8fE=; b=IIcyYtOsVDzP2o8Z97UuSOPrE1
	WW6FjDFdCUhm9zsszb+qMIR7ageNkHgXx5VBa9Mow6IjfYky4SWgn86gJ5JdK1j00aRb9Rv2A3RRR
	CTvIsUBYaq58s+owmry+xxjq70gUpkYGvhdv6Zc3+ILVGmZTvlqf0gbwP7w/Mn8/Y82UWb1QVjIJg
	d/BNZlOVSYVlWSvOIsOiATZ3Mw5EPiIoIGHYz+7xfG8hCFSUM3Ha84rV8NXfUx3NkUv8U3y/0KtRw
	/NVbokDv0zN4aB4mNxNNBHoC6WIuiiHfoIHV9MADz9dvYrlelXDAtDfPuPAt96HP/nS2NlvvteoSP
	GVINEE2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unW7D-00000005Nam-3YCc;
	Sun, 17 Aug 2025 05:39:35 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unVuL-00000005Mmh-3Uq5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 05:26:18 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-244581caca6so23266225ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 22:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755408377; x=1756013177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfzDzbQEvI2nMK5aWsczii03Df0gZy+c2/ZhXQWQ8fE=;
        b=Y8JoJ/roW7kAAlbPld3HGorcd+py12F2ZXMLyUqv+9O9+h1p+ECg0jAOwQGIWY1RSc
         44mJ2T1YovfV7l/usS64neJ4VhbnlLlHaYKrwK8mwtfQwuRqIGfk8etSWqNmtIqYXFEZ
         Mh3cgeXa3fdvC5eBkLBsSWyV38Ro99gZj+m7Tl15maifB8AmHdVB6MtTcRa+NSt4o5DQ
         7o8jF3N5KPMHHFxRQvydpOvSV+iJfuv5KgA2zv9c507jgbKc1NZU9iIEu8JRBrMAOkPI
         xHXojC8KDWJbAmy0mgxrm6wgeTASPnlDNtELlKX3VZH9ehEdAGfExbU3Jv6u5ckrUbWS
         b32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755408377; x=1756013177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfzDzbQEvI2nMK5aWsczii03Df0gZy+c2/ZhXQWQ8fE=;
        b=sALYP4yz3mWat2UOcO5ME2qF8Ywy9DTRCpwHR1X7rMV054fuIHyrI3GI4OOZ/ndYrC
         PPoacWzQq6qniC+fP0s3PwfmbvWT+Z5+tnv26D4J7uhcObB+bGOa52Jqo9Owa/dr+xxP
         daANMrSwd1p4pggZRy9PWhp840LjUG9NfJCVT+iuZopVyW4Vg9YvBOR6Ek7Rppq5Dfxl
         SGNtAglXfCqZX62IJ9TWaecdwEVU5JL+HfPT52p8blbwp0xBRHQI8ufhUBZ3mGz57aC3
         bO+dOojh5mhO8qYsKfh3CSMNBGv52l58KLMKXPtRF5Wvk3ISYdm9g6Wq1X8kxR1dr6Ns
         lLDA==
X-Gm-Message-State: AOJu0YzSbTDSrczIdVIsXfY+idGnv1JGdzqlaPSZw3r86+lfT/tHCntW
	Qbgzhb4X4pgdVR1acuxbSY70Fwrqdqh7RNMzWmqPAoZ6Eck1z3IHyJ1y
X-Gm-Gg: ASbGncv0vS/XmAEm5jo1F6TS2z202PpDXcRKEoPGY/vPtH0MvA35OofHy4RCedi19fk
	8bw7OPT5ciPtq4mAk8ZZR4PH6J5kbbd6j25pPMmxTtNm7+xMEBPe8ADG7afkVcl2wpgXRhbTHOb
	6GyXJxNEpo+XewD8mV60V+QM4YeTPeSuOJQZOTmBhM+2v3BTOasWbvoBxwZI09gJKAYD/z1bU5B
	QVnWXONp9/Ps/eYM7649oAz1kafr0gv9lU5srQMURrejSNY0elVKSBxnp6nUAhSQsGNElJMHFj5
	jEbpb9b4dSLGE8GcVVTbpOWaHD2uNt/3yrcbRy1c2QVAD35iNjP22VO3E6BKKSNqEheF63RBsZG
	t8UuKqH3w6VCmwC3OTCG6QIRLVh0gQ94pafUzdgl58g4mu5bkQDXe
X-Google-Smtp-Source: AGHT+IGWIBenOHMDT/65eAOHKbmsBAK8zZg1qh3FS9nY9K/gdBwYB+48FUufYjOD/dFQdCa8+Imhag==
X-Received: by 2002:a17:903:2986:b0:240:7c39:9e25 with SMTP id d9443c01a7336-2446d889e8amr97866635ad.27.1755408377039;
        Sat, 16 Aug 2025 22:26:17 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d003:7033:ad1b:5a79:43f0:e247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d592448sm47417625ad.161.2025.08.16.22.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 22:26:16 -0700 (PDT)
From: vivekyadav1207731111@gmail.com
To: catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vivek Yadav <vivekyadav1207731111@gmail.com>
Subject: [PATCH 3/3] kselftest/arm64: Add parentheses around sizeof for clarity
Date: Sat, 16 Aug 2025 22:25:52 -0700
Message-Id: <20250817052552.8953-4-vivekyadav1207731111@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250817052552.8953-1-vivekyadav1207731111@gmail.com>
References: <20250817052552.8953-1-vivekyadav1207731111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_222617_876119_0842B4C1 
X-CRM114-Status: GOOD (  12.91  )
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

Added parentheses around sizeof to make the expression clearer
and improve readability. This change has no functional impact.

```
[command]
	./scripts/checkpatch.pl tools/testing/selftests/arm64/fp/sve-ptrace.c

[output]
	WARNING: sizeof *sve should be sizeof(*sve)
```

Fixes: 0dca276ac4d20 : selftests: arm64: Add test for the SVE ptrace interface

Signed-off-by: Vivek Yadav <vivekyadav1207731111@gmail.com>
---
 tools/testing/selftests/arm64/fp/sve-ptrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/sve-ptrace.c b/tools/testing/selftests/arm64/fp/sve-ptrace.c
index b22303778fb0..90c56b38dabf 100644
--- a/tools/testing/selftests/arm64/fp/sve-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/sve-ptrace.c
@@ -115,7 +115,7 @@ static struct user_sve_header *get_sve(pid_t pid, const struct vec_type *type,
 {
 	struct user_sve_header *sve;
 	void *p;
-	size_t sz = sizeof *sve;
+	size_t sz = sizeof(*sve);
 	struct iovec iov;
 
 	while (1) {
-- 
2.25.1


