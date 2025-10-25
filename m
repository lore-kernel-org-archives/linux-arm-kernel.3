Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867C1CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSGBaOZhD7YMIGtASkoY94KR31YSs6yG4R1SCYeYD08=; b=df/khp3hXnB/Sa4Gkdn5eGdYSx
	ldqqEOpQj0BUH4ygkvFNd3Z6XLfaKldbYgg8LAqgC69HtT7C4cKH5gNNZj9xYe9kaNELN6c8WWHKo
	RfNjlQO5XbDFnoDDdtUlHxvdzM3mqjReNu8fAPIfeKhDbv0HrKeJHvwOD2ZkiAgqAHPHzVC+sjIy+
	EgRz9BbOZcGIyu7e4qJqXAe9e9ZaqRm2CsxqwBClQOKkLf/Mgk9NBn9ceBV+twN+U7VlsfjIDEoCG
	O8U8CBdgYbqYUuaexjkJQdLwYFQdszifbVKDg/kumh9Zzhhfbqmrz0U7zi92w0z93dV+A69As80oU
	u2YSNqrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChD0-0000000BX37-17jg;
	Sat, 25 Oct 2025 16:33:38 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChCs-0000000BWv3-3xou
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:33:32 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-79a7d439efbso26159176d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Oct 2025 09:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761410010; x=1762014810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSGBaOZhD7YMIGtASkoY94KR31YSs6yG4R1SCYeYD08=;
        b=fDTyMotOWyUGFSNdiPcSU3sopw7/cx12zvWrwmzdFRdS66thXW73mIEUKugDB4nqn/
         kGytwPNW+htcb6p/H5+4OqjYvCI86VgXAoA84bMXbB3pTjt9xANcdzwpB8AE1TeXqLQY
         OlVmSP5d0NU6WXF3Oqbc/q76wsuqynvMrUoJ3DLDavm00+OjyqDAMa9Ns/Z4G/3dnEps
         jomlyB5hxcKCo6NVJed6aBn6eWhAU/9tflSoReDJTs1xDyjXJlC2sY1TSdfLsw6EC+yV
         RUbRsHWBtagnCOGr+co4mfNREjRLGmcCp5HaJPCBh5UW9FQHn0zHeYLRL+pphvHAAFdO
         TjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761410010; x=1762014810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSGBaOZhD7YMIGtASkoY94KR31YSs6yG4R1SCYeYD08=;
        b=a8nao0xzKDr9IW0sCMnekuLOqEh2MTW0UJfd/O/AxMw7O8gUgGNkJcIBtnOdxdM9AW
         8IIiwQH6XDljsJwnUOnzbxRKcyTgheVtrNHye1W93F6KEIH9MJVfDx+Y3LuGocQf/HqA
         0J0tto4LxBB8MfYIpd2Q4f4vLq+exQd1IqkPAGFrgf8UfHeSes1HOFCojQRq7CC98eU+
         ZFGpPzgq+JpCLe0wSevjH6OjkreZ3b9JYTlyTJEvcGzvjo34hL9J7eReOJ0SIYRrRkog
         ij52yfNJqAbQTW0OL2FjwmUpd7yogodi6YfaQrrAfXEHCbIAUCsrGjBcFfxsfbOP3VA7
         dOQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFrCr/rv7OedljJOTytEF+jNDbhQy7gBW/ZjW5LzFl/g+E7UBLh4P+rTqvCezdvBfq7w8+w4P0/9NKHeR55s1o@lists.infradead.org
X-Gm-Message-State: AOJu0YyCkjxg3jmu/Ko9uIXmH+gzh53d+l5FcmkcUIYZsJFie8cI+naG
	1NC/KLKnHDWTktaYwNw1UJpSWlUAKPLrCI9qnunLs71RGpj0B76/y4ww
X-Gm-Gg: ASbGncvcT6qKJ6ebRo/XykO3wE88Jb6IjI14ItzvTJjXMH5b3BCz/LrLSvgnFfClkw5
	kwpgePotaazT0rRs57x1fJt1vmpfH3JKglVvleMJPQMQGGIRhZAaxnXidyKzMijdEX7hhIeDIds
	O36/VVlMGS/z1eDTRpZyEPRswRNtOERH4gvvoE1E1PYtYqQes7w355tsknsQd5nD8aocs/JYFsj
	Uf1JCZdOutjuKGQgypTK/w2dhhDgSlH7ebIBF+lVPW72UhGHp9jEI4XsmKmyd2R+2leD7lNXoZB
	V5gO49OLBYCWXxPvcah7RbH9PUU9D+fD49KU5SUKm1fx+eZv1hOxSaOpwZuK7bygcfR5zoeqID8
	wZFkF6JjT62S1AqAPxrqvDG3PJ/lu65G1vXHTYDiBLuIxHRFCui2VkcaXGh7YBZQ5cPGTsvGevC
	vuKYrrBLo=
X-Google-Smtp-Source: AGHT+IEwse5jmtf5o3/IBBOm0kKgX0Hal7s087GbKSjPCM9MuS1VqssBnXXTT034Qa8iz97Crbuo3g==
X-Received: by 2002:a05:6214:e4c:b0:87d:fef8:6155 with SMTP id 6a1803df08f44-87f9eeac1bfmr115745596d6.52.1761410009628;
        Sat, 25 Oct 2025 09:33:29 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc48f64aasm16321246d6.27.2025.10.25.09.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:33:28 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: [PATCH 16/21] kcsan: don't use GENMASK()
Date: Sat, 25 Oct 2025 12:32:58 -0400
Message-ID: <20251025163305.306787-9-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025162858.305236-1-yury.norov@gmail.com>
References: <20251025162858.305236-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_093331_006941_0B088EBC 
X-CRM114-Status: GOOD (  10.44  )
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

GENMASK(high, low) notation is confusing. Use BITS(low, high) and
FIRST_BITS() where appropriate.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 kernel/kcsan/encoding.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/kcsan/encoding.h b/kernel/kcsan/encoding.h
index 170a2bb22f53..3a4cb7b354e3 100644
--- a/kernel/kcsan/encoding.h
+++ b/kernel/kcsan/encoding.h
@@ -44,8 +44,8 @@
 
 /* Bitmasks for the encoded watchpoint access information. */
 #define WATCHPOINT_WRITE_MASK	BIT(BITS_PER_LONG-1)
-#define WATCHPOINT_SIZE_MASK	GENMASK(BITS_PER_LONG-2, WATCHPOINT_ADDR_BITS)
-#define WATCHPOINT_ADDR_MASK	GENMASK(WATCHPOINT_ADDR_BITS-1, 0)
+#define WATCHPOINT_ADDR_MASK	FIRST_BITS(WATCHPOINT_ADDR_BITS)
+#define WATCHPOINT_SIZE_MASK	BITS(WATCHPOINT_ADDR_BITS, BITS_PER_LONG-2)
 static_assert(WATCHPOINT_ADDR_MASK == (1UL << WATCHPOINT_ADDR_BITS) - 1);
 static_assert((WATCHPOINT_WRITE_MASK ^ WATCHPOINT_SIZE_MASK ^ WATCHPOINT_ADDR_MASK) == ~0UL);
 
-- 
2.43.0


