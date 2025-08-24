Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66206CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 06:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfzDzbQEvI2nMK5aWsczii03Df0gZy+c2/ZhXQWQ8fE=; b=MwFbx5B5fHY1xv0GexWRVjreWv
	s3iQ62LfwyOm9L3uow6e5Nm2KkepYReujJ+zLPJ9uiOXI54r9YdwRaFj+yWwr1h3dnLiENj/X/uvg
	VhsD0ohBrqbgiEmmcaBEVqLZjo25T0HEDHnvE/XEsQHkyL/Kh+OwG3+63Q9wMFpHVMKo+WeHOMuoi
	DvUplyCWZG+LJAzGaQMEgjq8SW1wzmh6GMrI7hNtz2kDX03Os6Ee5CFkBpxTiEC9vLzsoudKRypKQ
	wOop7acaVIYuGYLP7GCSb4rrfhtM2XYDe9fupemfbaXIafCgBc78h4n1hbY4UGx6HBDnqaanmdMBk
	VQEV+34w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq4AN-00000005llw-3grv;
	Sun, 24 Aug 2025 06:25:23 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq404-00000005l87-0H3I
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 06:14:45 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so3006730b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 Aug 2025 23:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756016083; x=1756620883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfzDzbQEvI2nMK5aWsczii03Df0gZy+c2/ZhXQWQ8fE=;
        b=GNa8gh7gcW5ATxHXdRtU8nUIQXw/l1HQ1fp5QixoDcG31pLJmUtfos9BKUzKWgchUX
         6dt841TjJqPN8dHCy8lvjda9JYJ6d1ATDA17Kzk4RpFvhTBoI2cUx7tox+KHIFPPVMOZ
         5uf0/OEm6N3ZUP1Kcagh3+Rv6UNTsb8gOsDXiGz8E4odJxQZJHB2cifu6DesJuhlTdEs
         rtuwcoaddj2odYyceT5FfBxcGDIGeYf3YAljfwVwS/VTi3EeHux2QsZ5fEjERCZUC9gB
         GqxjMq5Pd+Z7rsMGPFr057HYkynSsS3O2tEXFrXAu3Unf0M8Nv5jP8BL8ryQ7kr1ANBV
         jpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756016083; x=1756620883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfzDzbQEvI2nMK5aWsczii03Df0gZy+c2/ZhXQWQ8fE=;
        b=QphfRb2tiEi9jaxHwLVVbDhJAwMt5gkCjlM1NDk+EKIUe8R44SZ2KgZsxSzKhJpBHt
         Iwd28T+vVgB7WMJwdoT2ZDc1+xzogROd3hCYbjXN9aCGERDnRvFafUQahQXgEmIhQ5M4
         RAB/AR/7j4TE03hHc+Yrc513fKxNk+CsiYpdfQqzQNeSp6DDYKWuxjqr0ah+/ZhgHxnv
         wMRFpUw6tX5APgU+jstQwBQyLN9fzLuikOvLcPjzKIYfiXX/mkpgfoIdWjhQYwvamtaW
         L0c78eWu+xrqjmXh7/wS5CFRZoXozw/z6Lcs6ZI4f4/vVUEW5EKuIMqQ2leRQl/mSzw3
         G1Vw==
X-Gm-Message-State: AOJu0Yx56yCIxlnw9ELIh1Hwl2kMpGB+DXu5yb716ZqfrlOUe9AmjduP
	rntRIDMJVgOADrRE/PvAk4Hz/suILMM5SvlisxhgF7GtaNTWD9BPyS7F
X-Gm-Gg: ASbGncvo6LNG8ErEh/MBJD3yERsd3/TSu/LQA9/rF61xUHOeLvkxiy7QaXDByT0j+Vk
	rin+MSjwN21pqD5oST09dDmBmpd2LBFBfG1yohkm3h1hJX5Zf4unGWo87btuOj9JTTUD2p+s6fQ
	NdgYcdiN55fb7wIfojRnofIWxM1VijvRf4U23/GiF+gBstqMoEHW7bxIJ9Cj0LV2JY/QMj40l1f
	01grQ5kiH0vBNi2IfgY2IqSrlB38kLZOT5T2odIEAKefV1X4hFtc+oTinFYco7eWS6LvBm57pjp
	5J6UiuuurZmezzkXYWSwncru8gTFdlS7qmjROROBylNAfqtyC4sEdIZ+HR2V5QDpKbPmprB+RNc
	2i6WW+W2Onx829krgHFQf21rlZQeQOuFvzWfx7VMDrbU7HBrB9mcu
X-Google-Smtp-Source: AGHT+IEqAFYx6AisrGgN6ojBhMS+11Jpj/ZwAjl0loDmwXyLPUL3fcKiuqDVFbHLxkK8FpX3ngzJtw==
X-Received: by 2002:a05:6a00:3d06:b0:771:58e:5b1e with SMTP id d2e1a72fcca58-771058e5effmr111559b3a.12.1756016083290;
        Sat, 23 Aug 2025 23:14:43 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d003:7033:ad1b:5a79:43f0:e247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770529149bdsm1654943b3a.98.2025.08.23.23.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 23:14:42 -0700 (PDT)
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
Subject: [PATCH 3/3] kselftest/arm64: Add parentheses around sizeof for clarity
Date: Sat, 23 Aug 2025 23:14:02 -0700
Message-Id: <20250824061402.13432-4-vivekyadav1207731111@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250824061402.13432-1-vivekyadav1207731111@gmail.com>
References: <20250824061402.13432-1-vivekyadav1207731111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_231444_106763_CCDE1A98 
X-CRM114-Status: GOOD (  13.06  )
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


