Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C49FEE4F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 19:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sy+MoMMuIP0uzZzBvgD9IvMEukA2rbz8mQmpWnAUqxw=; b=hNP5TGMD0rM7ZK69jL3YpAXLzi
	5g82UAE6qNhA5xeO8oRdhKZgTMVjXXGD88wdbzG1WKDN+jsYwW/m0Bha3a7RKcZ1CZFzbnq0C2Cm9
	6CJrG91BVTR2efbW1yBeCkIeJ3BdD0YB8ShPUL5TFbnxUSuCNF7pfO4dqxq9tcGCshN21OoB6FWqj
	XMZx0LK5Y4Dp/HKvUSJFq/4M/jCXHPwXfkZT4V1Q0itFgnJE+lCP0hved0b7IzZ2L8XSNj47axAUm
	i08fs1ZtKeuUN9J+lP71BtZithuKWDcUNDDLDdiyu/GxBQliUWt14TApwIK2wAv1YPEd7euUhEQQR
	yXtIiFZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwQDT-0000000ADDu-098C;
	Sat, 28 Feb 2026 19:43:07 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwQDQ-0000000ADDD-1eOI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 19:43:05 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-899ed41208fso4275926d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 11:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772307782; x=1772912582; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sy+MoMMuIP0uzZzBvgD9IvMEukA2rbz8mQmpWnAUqxw=;
        b=KJlOxoyagwF4KTgZ7DRVN4RnKYQ4fHs6nO6D7J+Py5LFTqHJC34adPLTAZpHO6PLqu
         bBNeL6oTkIZQhjhDpqq+kELUWiE9Ww5o2zOR28tFd7YHIPyOprk4iXzzc99Q/7Rlk+eP
         DiGVMbwigwYPVVB7StTmvBIHwiuSl9Hi2/L6PdTAPuN9iNzBR2O48fqyS1uj7gzkE77E
         jhZWiaFGvcEc+JVXrVZpMjwy/C+G2QoV2aoJyE2GGHF/6yC8Vo96d9ZnZLXq8RPF3mba
         ZxgEdgqWKH3e9LNwsINmaiDLmQfGUM3+h2gT3j3cmJt4TSxymXG6jbr+086GYc/KVvy0
         Rljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772307782; x=1772912582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sy+MoMMuIP0uzZzBvgD9IvMEukA2rbz8mQmpWnAUqxw=;
        b=rdARC+gi5R9Mi4b0NzPFnTUUXSspC3ip8uHlIpa0L54wige9NqcWCKKv0Uxc6Ulccd
         nMmxkq055NRDHKMqkyUt0CDiiOSptLlC5+ZZYa7w7TlVjBWYcCRAp5XwMDAGoWWqlLJY
         qSVMoEjZsHwAFCjODZE5hKZ9WWHmMm0sped+1X7daEbaLjLb/4vo4i29WvAJWa0icy/L
         WRwuLzIAudFZdaxRUnz/zhJ4Y4lRRRAZQ5m3hkVKCfMmZWjMptP/Icotn4nnp3ZcMjXN
         B9y572sKca3OdUlC9qV7m1Ecrvr6q41S3w013Vsjb1Blj9OXGBgvglR+Q6yQVnzFzIwG
         VUoQ==
X-Gm-Message-State: AOJu0Yz956JWGTT3qO1KlpYRYDJQnD6WMep/RriqhJkzM3euhOG5LHDJ
	kO/V6UXYmW3LO//qQzkTPHZE0efm9jxi9+YkM7sLuJ8GKxbJ7W5tDvvL
X-Gm-Gg: ATEYQzzPQbJc23+2Ned02zCkjdZh+uadue4vI6bu2gB9v/zwmtQVF2+RzJM7JYUBaSJ
	Zr9sXWXcAN1y5cdJqBBMuLnadlAUgrqL8fPuBu75xDcCqN8TiFlujx7gFKlg4Pc6uNDgEhD3d2L
	vmWbcqrIaop7v5P0KwUFUBF3Bx8TZiDudlkVGSe3w+4xq1Plut6QNXdoWoSJqDG0KE2+h80xYR9
	x9PyKlTuedcRDuFZfaUVqPSOKn87zHzibRYPbkrATYW27pMi6ByYHBs+Xm3Wsza+D9CtQZ4Zco0
	jqiTFH38q5Q0IpXTW+Lgpa24CVmaCZh7NIjmXeSwTV14nA+2ZXGeH65iATxU60+1VdZF69+yqbO
	ag7npGRo6/VjMUOBvgIYLtZOGxIz+bCGz4Iu0jmTdo9tlHj/V4Q+5DBvUy8BWDVpMsEPsfv13SQ
	w46A5X5j8ZCKKolUucm0OCCWvMN8I1+syuKjePdDYhzto8bCkSZjdRjtgKHfxo95v0HzF4SKuyD
	IeK
X-Received: by 2002:a05:6214:27e3:b0:894:71c4:d2c6 with SMTP id 6a1803df08f44-899d1dcba48mr113429866d6.29.1772307782474;
        Sat, 28 Feb 2026 11:43:02 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c7376847sm72669366d6.28.2026.02.28.11.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 11:43:02 -0800 (PST)
From: techyguyperplexable <hlcj1234567@gmail.com>
X-Google-Original-From: techyguyperplexable <objecting@objecting.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	techyguyperplexable <objecting@objecting.org>
Subject: [PATCH 2/3] arm64: lib: fix missing blank line in csum.c
Date: Sat, 28 Feb 2026 19:43:01 +0000
Message-ID: <20260228194301.2467186-1-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_114304_488981_EE7D6D55 
X-CRM114-Status: UNSURE (   8.94  )
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

Signed-off-by: techyguyperplexable <objecting@objecting.org>
---
 arch/arm64/lib/csum.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/lib/csum.c b/arch/arm64/lib/csum.c
index 2432683e48a6..dc363d74afdd 100644
--- a/arch/arm64/lib/csum.c
+++ b/arch/arm64/lib/csum.c
@@ -11,6 +11,7 @@
 static u64 accumulate(u64 sum, u64 data)
 {
 	__uint128_t tmp = (__uint128_t)sum + data;
+
 	return tmp + (tmp >> 64);
 }
 
-- 
2.43.0


