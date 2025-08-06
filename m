Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA7AC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 23:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vLwQExKUfK4JzXgNc/MSuz/ip/toJprM4tvNXBkEa0c=; b=dkB3Pbe8ecF+fG86PGLbj5YnBQ
	KggHa4gT1ULD+bilqWQ2xK8/e+kOCygVGN/NPZZeL/AjjzkMcvdg6bod+FDs0rhflUiXpr+p4FZ0U
	leyTVsMZaAdv78CD82gccqeL+nxM/zicJ05OqzeoC9CjwEJziUY9U+luj0DOOgZTwPbvn6pM+EqYe
	oMfxMHVy3pIuKSSnJBMKKAH7prx1zpn5A40HbX8qlFT2U9/4wrKYWVEIfcncnT4HivhUtqhCPsOim
	AQa8lIor0WIUA/PZya+m845H3H/4i+K1TZPh+cMPo5r4XX9C62M9Jj5IwMiHxbMpXw+/WTg1x9kef
	X+5s5LkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujnLT-0000000Gniv-2uyx;
	Wed, 06 Aug 2025 23:14:55 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkvB-0000000GQiB-3bF3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 20:39:38 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b423b13e2c3so163734a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 13:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754512776; x=1755117576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vLwQExKUfK4JzXgNc/MSuz/ip/toJprM4tvNXBkEa0c=;
        b=e61PL6e7b0VO5LRXuPYNovy/TPRkrr89jc8K4xazQTFQJyGyHkJ4ZBNGNYnRe21otC
         bUGsWVh5SbtjEw81kNw/sy/Au4ohpuhUomE6Li0OOfocqFE4i3ad96uF3xSnviNvTfUl
         U/9CpFp4iccJ8OjJ8Zr3bdfQiRWF+S1XHkxY3k6lWkwX0i/jZ0fl7btc1tfqzynK0RCa
         1LhBlz+HR3uWvl/BLW4cJEjYzPOc7LdHj+HxojKUnt7H9ao4EBc4uxQ+WW8DLfLyFbpc
         qMvaGdtjdr7rpRNIU2MrByxHo0waAsYXShgTE2HiZOLnKWC6NYgp3j5ULy04LK/A6iQ8
         sttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754512776; x=1755117576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vLwQExKUfK4JzXgNc/MSuz/ip/toJprM4tvNXBkEa0c=;
        b=CEexpYs88dghuJ+LXkoijD4W0BHh3Iu2SHPv7dkbA0mwhrosVAtkh66dJqqgNH3hzG
         nmVtiJOd3xVtUb5p0Mwf4c1Sjw4SXKmmtmlqBnKFwgRBEbippXAHLdsEKtK3oP4nHDvR
         itwg0o33sgYLwkp69UPQTfiPWsVWis7Cv5QHtywlg6qW+zp5hNuxiG8GLUyQwwxXVArt
         BpXEsDr/1XFuVBXFDTqiKhq5fYDU7uDC34r+97Bvh4aFciLH2YyoRkcJ6AhkDElB2Jq2
         KiQmA2ypX7M4Ftw/4uOfkbOUzrpsInskWM7v4wMjQiVsUTddWiRWD/4ZpRN+dCxHDuqy
         /rUQ==
X-Gm-Message-State: AOJu0Yzd3QbK5bjbbVMhFb+PvH+IAfvLgGzr+MbUgKsNcOICvtNkv1JT
	zXu707pDe5w01zt2Ap2ZU/eL3MeJqUS74HpGgroQKjUNrHen703VA2cch4gdzoGxzQQ=
X-Gm-Gg: ASbGnctoFqcGekyIAhoQX7l++4FZWNgUi2dYzA68MMugrnAUA/MUXfCcJYfszA6gMFi
	2XyL4UNKGV1WL6H0MDxR3+KUvx+0FWQ0b/aqCBy5hujMzt6IllSquT+Q+Y2qebfMYobwbj4gQF0
	ssQ9DSY+iDLkvsfb88A9EqA7zdFrQXqxmZ8T1hjhbBj/KmQz7Bll9W5EiixJ+gbwHAbmvtr2mG9
	222jvJbYU5jgSHsXhUSzYFytsWVS5hJ3ROj5eKAKE8BFtzer8nq7JZ9eUThuJgIAo290Tf30CQg
	7ezmMLLHSnJCpbhrrN9Gwoj0qxcWk2yoZzZDgEFPH/vFiE0OIfbqRbCEF6ge5mO6mZNSj2vPF7J
	3SvDRyiP5cmh7KeRJ6/Lux3AvrUIfoxOw
X-Google-Smtp-Source: AGHT+IF8wHNHuQVZKKSQQIRqVPww/m8v+NrnrInpYnTghu2nm8e4+4Nb4DI4QQXkDMw2EhctprCEdg==
X-Received: by 2002:a17:903:19f0:b0:242:9bbc:c773 with SMTP id d9443c01a7336-242a0bc9f41mr56677965ad.54.1754512776231;
        Wed, 06 Aug 2025 13:39:36 -0700 (PDT)
Received: from server.. ([103.251.57.138])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef67a3sm166407345ad.15.2025.08.06.13.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 13:39:35 -0700 (PDT)
From: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH] selftests: arm64: Fix -Waddress warning in tpidr2 test
Date: Thu,  7 Aug 2025 02:09:26 +0530
Message-ID: <20250806203928.168365-1-reddybalavignesh9979@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_133937_895479_0512A344 
X-CRM114-Status: GOOD (  10.15  )
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

Resolve compiler warning about always true condition in ksft_test_result
in tpidr2, passing actual function.

This silences -Waddress warning while maintaining test functionality.

Signed-off-by: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
---
 tools/testing/selftests/arm64/abi/tpidr2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/arm64/abi/tpidr2.c b/tools/testing/selftests/arm64/abi/tpidr2.c
index f58a9f89b952..4c89ab0f1010 100644
--- a/tools/testing/selftests/arm64/abi/tpidr2.c
+++ b/tools/testing/selftests/arm64/abi/tpidr2.c
@@ -227,10 +227,10 @@ int main(int argc, char **argv)
 	ret = open("/proc/sys/abi/sme_default_vector_length", O_RDONLY, 0);
 	if (ret >= 0) {
 		ksft_test_result(default_value(), "default_value\n");
-		ksft_test_result(write_read, "write_read\n");
-		ksft_test_result(write_sleep_read, "write_sleep_read\n");
-		ksft_test_result(write_fork_read, "write_fork_read\n");
-		ksft_test_result(write_clone_read, "write_clone_read\n");
+		ksft_test_result(write_read(), "write_read\n");
+		ksft_test_result(write_sleep_read(), "write_sleep_read\n");
+		ksft_test_result(write_fork_read(), "write_fork_read\n");
+		ksft_test_result(write_clone_read(), "write_clone_read\n");
 
 	} else {
 		ksft_print_msg("SME support not present\n");
-- 
2.43.0


