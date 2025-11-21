Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC73CFA46E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 05:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bD/kxunI5AdpL1l1WB/VY1TVoSja9N9k7Lo5f+xNMoY=; b=QmIORi7E07hiDO5HvdXrlq7Bqs
	Nfwf90qetlhtNEdI6H1MUAqvQsubR2WqpHKK1U2ojgwC2VQS/Vc4JlyISyTzepPxrz4W6oN4eiapP
	oocgNa5IpClc8iMht3eugvsH5X0o/f3VK3f2jfYY65LNN1C9tmvRhHh3ly0EitRdKa4Cz1W91WPu9
	9a9/qfBKJdegK4V/x6oI7emI1fsN2o2/JI2h4yfNVGy4Vww7pl4clvksrwW4Vrs7Ao91G5CtqjLdX
	CwhHNjfC++yy1PSeN9nXAzWnM6TmX+frsuC7KlfdJQwq4tEr5tqaO/+88S+bJiLxLKuvw0Yj47/Nj
	8rmo/Rqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJMT-00000007pO8-3QtT;
	Fri, 21 Nov 2025 05:07:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJMP-00000007pNl-3IEN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 05:07:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763701623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=bD/kxunI5AdpL1l1WB/VY1TVoSja9N9k7Lo5f+xNMoY=;
	b=iHCpu/z/laIxAKPBsh4ut096wmYPzMTLSNFpUWPpzA7E8rGkfGHUNxq64Fx6kqsOZh8uIG
	cLWkuusLfkfDiPnX1BpTW5/knd6/2uWDaatPjGlpi3qkPNTQce5hayHbXER2N4RsKkvWR0
	voUKZgcHqV8J6ErApCPHHpzJuWg2mMo=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-hjpft9i5N0SYHXyGsZoY9g-1; Fri, 21 Nov 2025 00:05:07 -0500
X-MC-Unique: hjpft9i5N0SYHXyGsZoY9g-1
X-Mimecast-MFC-AGG-ID: hjpft9i5N0SYHXyGsZoY9g_1763701506
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7865de53d43so20869867b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 21:05:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763701506; x=1764306306;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bD/kxunI5AdpL1l1WB/VY1TVoSja9N9k7Lo5f+xNMoY=;
        b=T/FwRn2nB4VKS9hz17Vsgkf9zdS8r9vdegerwggVyQ+suxnWDGq5DOW9gw/gaiVMsb
         fYQeZ+XH2/KKCGq7S/5X+/ZLt0UsCfiok0KJfBuXcWNvGqIy5UzcwkGkTQRQOJt60U47
         asvW7186AYbGLJ2gpmDOE65y1EfWvq/MxFQGdj+s0WICS0EOmyUZBEmDXEa67xMUKF8g
         CHoON4Yb/91gMNUGeerhYJUX08yFBBc1PPoROy1jT1i7PEV5aaPjbuxg4GWXCANkWDzj
         ZlpGFinnHtXDohVJWj9hrImQU1uA6AxJ+4wMtG2oMTYb8nyJQMSxkdmieNt3A/iZcoeS
         enlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI00eKAaSOx7panvCrO5r+EPRCkHsoH+Oo6UP86XoY6jD+JnfUZrxcfb6VuYfI40VIdTTjDF1sT05lqbRI39mh@lists.infradead.org
X-Gm-Message-State: AOJu0YyyTRv8Z4mC0mqQGnRxUhwlJd+8ezf3cpgmbtE45NdOjOQLEgrc
	R+5BwZK76F8rNeKkYUOQgmSRKVaCXvqfZ+k91g8YPqpxD7KKhDpUY8iHAu5MpBG7MAqZjbZ5Ktl
	UWc2M1o8CTgzWgboJ5yMMaGhHjkDK3Kh0FA2ETULtxfpLSozeQZwPo+9iap617FfF8qlS2uA6S5
	y/c+5qmDTuJsib29orZrS6HoYUP0KLZGozIrdRFFM8UWb/vqkXYUg=
X-Gm-Gg: ASbGnctO6CKUCIn5bFPHsjd6NL3x6MqNx1l0aUPVTmhSfA5LGj5O1dIh/FIHXO/yc3n
	LvoVsKpwrWJQ0A6CHGzzyIs3V4WLJdpehEtYCeI5ZNZL7CowkrZjiCX73yy0TMxikuGbKlSTe48
	COs16+09U9IganuinU6fr48jNvkPqI+24RIfvr7nRf5oUYwhYDvC/FikTaJwlEpRyA2+c=
X-Received: by 2002:a05:690c:3382:b0:786:8331:6a02 with SMTP id 00721157ae682-78a8b56c1c0mr12462697b3.69.1763701506338;
        Thu, 20 Nov 2025 21:05:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIjbO92Z83tqhLByVY35E41+vsMACr1OEz2slmB3F8pKUejv4IGvIgka+Ng7cr6HVNQqZjvZDixUVOC78tuUM=
X-Received: by 2002:a05:690c:3382:b0:786:8331:6a02 with SMTP id
 00721157ae682-78a8b56c1c0mr12462487b3.69.1763701505954; Thu, 20 Nov 2025
 21:05:05 -0800 (PST)
MIME-Version: 1.0
From: Luke Yang <luyang@redhat.com>
Date: Fri, 21 Nov 2025 00:04:55 -0500
X-Gm-Features: AWmQ_bmDy0u5e9A2yyjX0yGnilVy89lF0nwbbPkrsmq70L9p1eE08B8l02uCUFU
Message-ID: <CAL2CeByu46f48j8O9=237fvhpPUCsKjOZkFuuHU3xrr3wVF5Eg@mail.gmail.com>
Subject: [PATCH] arm64: clear_user: align __arch_clear_user() to 128B for
 I-cache efficiency
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Jirka Hladky <jhladky@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joe Mario <jmario@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DN3kGvENGpTgMyOIkap8cXL-ylN3uqJeAeKFJmRXTxA_1763701506
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_210705_920985_C5795979 
X-CRM114-Status: GOOD (  11.57  )
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

On  aarch64 kernels, recent changes (specifically irqbypass patch
https://lore.kernel.org/all/20250516230734.2564775-6-seanjc@google.com/)
shifted __arch_clear_user() such that the tight zeroing loop straddles
I-cache lines. This causes measurable read performance regression when
reading from /dev/zero.

Add `.p2align 6` (64-byte alignment) to guarantee the loop stays within a
single I-cache boundary, restoring the previous IPC and throughput.

Tested on bare-metal aarch64 systems:

  Good kernel: pread_z100k ~ 6.9 s
  Bad kernel:  pread_z100k ~ 9.0 s
  With patch:  pread_z100k ~ 6.9 s

Reproducer:

// gcc -O2 -Wall -Wextra -o pread_z100k pread_z100k.c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <sys/time.h>

#define SIZE (100 * 1024)
#define COUNT 1000000

static double now_sec(void)
{
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return tv.tv_sec + tv.tv_usec / 1e6;
}

int main(void)
{
    int fd = open("/dev/zero", O_RDONLY);
    if (fd < 0) { perror("open /dev/zero"); return 1; }

    char *buf = malloc(SIZE);
    if (!buf) { perror("malloc"); close(fd); return 1; }

    double t1 = now_sec();
    for (int i = 0; i < COUNT; i++) {
        ssize_t r = pread(fd, buf, SIZE, 0);
        if (r != SIZE) { perror("pread"); break; }
    }
    double t2 = now_sec();

    printf("%.6f\n", t2 - t1);

    close(fd);
    free(buf);
    return 0;
}

Signed-off-by: Luke Yang <luyang@redhat.com>
Signed-off-by: Jirka Hladky <jhladky@redhat.com>
---
 arch/arm64/lib/clear_user.S | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/lib/clear_user.S b/arch/arm64/lib/clear_user.S
index de9a303b6..91eee4a7c 100644
--- a/arch/arm64/lib/clear_user.S
+++ b/arch/arm64/lib/clear_user.S
@@ -17,6 +17,11 @@
  * Alignment fixed up by hardware.
  */

+/*
+ * Ensure __arch_clear_user() always starts on a clean I-cache boundary.
+ */
+    .p2align 6    // 2^6 = 64-byte alignment
+
 SYM_FUNC_START(__arch_clear_user)
     add    x2, x0, x1

-- 
2.51.1


