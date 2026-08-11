Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA76C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 09:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZ2onyaDqT5qs0nzFmTgZJCPIczB5/qOBEQgG8DVejU=; b=Pd3V7EX30xrscvhUecU/36TLHq
	8ii/a9MuM6PDJs+HQP1Y1xW33eG32dhz4AHwn22UUq4vPtYzubeCPih/pGBSCJgwGUitKGcwGTbSG
	heFvs3pGDXaNlrG1GTFqd8vSvaPdE1fz1l5+BjZUFz7peBcjCCd0fo0TP63wcHrHf2tnUtsntNI75
	ulZzo6X+vpTimI5r+wLIcu0S9JsQWqS8EZE0qu51dlam4wNwz790jIBxP/cb2UKWYYlPyHcc6/7Im
	uXF33dcC8SDa/PAMqUY0npiH3UnEoBzETgzgckM0o6/Phg5UedFAP7ns6sBlCTKTa+Rn/rxUaxAnH
	hB9QFA2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjCw-0000000Dn3o-3DOn;
	Tue, 11 Aug 2026 09:55:42 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjCu-0000000Dn3J-3meF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 09:55:42 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso19480275e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 02:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786442139; x=1787046939; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZ2onyaDqT5qs0nzFmTgZJCPIczB5/qOBEQgG8DVejU=;
        b=svqk9U1ZJh6pj2bFHFQ7gPjTM9pzzEq31W2b/Cdu1ZpCVFSgFSyMF7BHjDBWC6N4e+
         14vHUDCquzMMJZnTOdOtv2+nUZz5NqoaIHbFmPQB6nTfi58QI9uaxWbbd0YyJx3h6mni
         z8bVOfld3cfEOhOFwa0KThecE4kA2mcYbQKX7zu3j/YzOGgVtcX52+iHwkAHfmGyzznT
         d8oVWihw3sZfk34/f17mo3Q85U8raugA8TqceQKqbfm7Q0HdRPH619ekhBrSahFzEura
         8QE4TBm6w3svyilrCphdx92rl3x2MHfvHjJG7Q0LHkZ+anschof6xdkzWWkhmsKMKXsm
         q7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786442139; x=1787046939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EZ2onyaDqT5qs0nzFmTgZJCPIczB5/qOBEQgG8DVejU=;
        b=ck8JOuUeZJWb5852a4XlZ6+JqWNTi4S65wA/05HsSmnnHUJwCyT9QesmhVypKeqGV2
         ZA/Qo049s1ES4C9VwZgIJ4SuRenQnIyCGAuMsjSqEnggJBDhQf+mGSt7txOegKY4/3/U
         oVTds+qDMf/ArzdcSoz0BCMsKL3tEqBnPSTsP/tATtCNKdTNt6Vemf2mzy9NFx1FQfvU
         m468tdoiTWF1MxNfmzahu0MV7q5gujw15SBzGwBvqDvfIpOZg1/bve+ipxW8Tmwby23W
         i1akt1hpP1+tXBbgDhheTQOKMl/JiDuAlW7HpnpL7Zul6kD0fc10TL9VSec20RBkA4o+
         Npjg==
X-Forwarded-Encrypted: i=1; AHgh+RqPHRwxF1fiVWAfTDvVJMcRBlPBcGaPuDR5EdWxVGviOi/vCh4nWAnDlTeoCH3YGUJ0v9iOPS01kqKMPUqC8Dei@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3Z/kY1NKiXD9VIur8sSwYAhko++/jzb6RKcG0UwLvyOfXtUQ7
	So14tFvEzUvAT9YA16dyYa3yBGiG2BxVX5g5uGIB4vFIlFN6SdSwGwiX
X-Gm-Gg: AR+sD102IiGHCfHCE54CgmRTfLbHkI0IHP3aZ9Wy9QWoZdfbZ4XNFhUKECWtnWKLZEL
	qOYyVJ6VlznJYhhNsUwK7sF+jKdZUZO2LuUHMEBo7HEnlGMcwSKVQh/7lId+Urp57Sh7gn8T0Kt
	9BoiKxrL8TKQ/chQPvT9GLvq+yKVnGTU+heYGuDwLisfHqlZLA2vG9rFcAVb3lNvv+wa6+DRWEU
	KyOEjScap0Lhvy2hZcpWXVwH0efSr5A/Y6B2nU52o0IOBEL2MfaVspgn+wt2ZNAXksaLjZUZhT3
	vu4dtU8gVZiTJLFHRO7kgq61v+UGZ96CA7WDH7e7PmPPtAvZiVGKBLrEdl40eXb/jIPgKwXu73o
	Setkt6xgTnLn1gQ+wHjS8oC2nPEPBojACHP0DlCrMILICyBN5fw7TqvdDc5KlSof+0JUTPBwDFy
	DRJCYnEIhLVS4GqMvwThsILwdjrtDCf8lyYjz/DXF2SdhNT+p/xfstpd+dHdsQehTmh3All1KSl
	9mu0mCuryvWpa4LEu3kXUNd6/z8X0qoZZm9zvxoJpWJODRVz6bSM7lxpAM4D5PDvL1ny8jsBGmY
	kDjcytWENMAJPOxH0ebkM4PLrinljm6SXKZZP7I6hPpaurzGYEoSy2+6kXUt5lp+IbaKppV1f28
	J+Hs=
X-Received: by 2002:a05:600c:3b2a:b0:499:79ba:ed92 with SMTP id 5b1f17b1804b1-49979baedc9mr7626265e9.13.1786442138414;
        Tue, 11 Aug 2026 02:55:38 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a133-e401-bc8e-d36c-2d08-c5e0.310.pool.telefonica.de. [2a02:3100:a133:e401:bc8e:d36c:2d08:c5e0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499788a6cdfsm21958995e9.6.2026.08.11.02.55.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 11 Aug 2026 02:55:37 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	syzbot+229d761b8a110e6de517@syzkaller.appspotmail.com
Subject: [PATCH] irqchip/gic-v3-its: Don't WARN on LPI free allocation failure
Date: Tue, 11 Aug 2026 11:55:32 +0200
Message-Id: <20260811095532.48454-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <564b7035-7d20-4f5b-ac7d-a48e58e4a0a0@mail.kernel.org>
References: <564b7035-7d20-4f5b-ac7d-a48e58e4a0a0@mail.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_025540_953875_ADD3A552 
X-CRM114-Status: GOOD (  13.90  )
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

free_lpi_range() cannot give LPIs back to the allocator without
allocating a struct lpi_range to describe the freed range, so it
returns -ENOMEM (its only failure mode) when that allocation fails,
and its_lpi_free() turns this into a WARN_ON().

syzbot triggers the WARN_ON() by injecting a slab allocation failure
on device teardown, which with panic_on_warn becomes a panic:

  WARNING: drivers/irqchip/irq-gic-v3-its.c:2251 at its_msi_teardown+0x3a4/0x424
   its_msi_teardown+0x3a4/0x424
   msi_remove_device_irq_domain+0x16c/0x27c
   msi_device_data_release+0x38/0x9c

The failure is transient and the consequence benign: the freed range
is simply never returned to the allocator. This does not warrant a
WARN_ON() backtrace, so log a rate-limited error instead.

Fixes: 880cb3cddd16 ("irqchip/gic-v3-its: Refactor LPI allocator")
Reported-by: syzbot+229d761b8a110e6de517@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=229d761b8a110e6de517
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 6f5811aae59c1..5ab278affa9dd 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -2248,7 +2248,8 @@ static unsigned long *its_lpi_alloc(int nr_irqs, u32 *base, int *nr_ids)
 
 static void its_lpi_free(unsigned long *bitmap, u32 base, u32 nr_ids)
 {
-	WARN_ON(free_lpi_range(base, nr_ids));
+	if (free_lpi_range(base, nr_ids))
+		pr_err_ratelimited("ITS: failed to free LPI range %u:%u\n", base, nr_ids);
 	bitmap_free(bitmap);
 }
 
-- 
2.53.0

