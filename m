Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0F7FEE4F7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 19:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tZSn7GNIRNEybdnL02BWe30HKAw5oZr0Cz1LVkRGhr0=; b=JtLV5peiCrxitk0g8GpqA6stdE
	8Q0q82MAPZL70WilC8q6EcLNtdtTaFFjJkRoV9YdloZ2/fbRbMG8g+ekSHnDbuglXVe+vFZzAVDNF
	QXgmqgh+X9D7uak36iXpyUL1Ux5e4MKtyRycQVXZvOYpFnhfSuld6IwsR7gpT+x52rJfIVSS90jr7
	MOuQogZiOIp/ATsZXEa+602A7cg3ZQ7Jgn6xZ8WnmpN/D7YeWjq7bEPT9mo+hHHUXUZcBJVZEJCwk
	cxr0q633C3CVbFL8oYNRV27Foe98R/A02Mxcp2+Fhy0WUL7ElWjcbDeaYkI38xxrbSj9qm+pv4qb7
	E5OwOIGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwQNB-0000000ADlm-3ryW;
	Sat, 28 Feb 2026 19:53:09 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwQN8-0000000ADkb-0X6h
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 19:53:08 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-505a1789a27so19374711cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 11:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772308385; x=1772913185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tZSn7GNIRNEybdnL02BWe30HKAw5oZr0Cz1LVkRGhr0=;
        b=ACYpeNIiONoOiDehRIXK5LGW4TxZ5IigKTYSViFnmzsNgMW70weZ8t7Z1UwQcsd3Av
         TeJ72mnb8vIZLdmuuf69rfceMN9Qp8HcnnPj8r2N8GdIdSF+x8sCnRFC4bNqPxh74Bzd
         MEKHaLDquTHOhZMTqYBC9AKeuJdjiLFv4i658sYHTqCAqXkDtv5PFu6tSTg7qCkJLOLb
         tsa07JhfiraLX/jUOBCu5a4epT+xQx5CB+0jrwE5751ZLFdV5400qxC+YvAR6CDSu6Su
         ljv+C3UojhphhnzqOPXLMxDhzJijqrpEwJ1j3KgEA7mQnoEAexycepQUVAN9h8QyOdg1
         gsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772308385; x=1772913185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZSn7GNIRNEybdnL02BWe30HKAw5oZr0Cz1LVkRGhr0=;
        b=lq32esUWETgzqmhuHFq/vqcSiQHhjypfjW60a+u8bLxANrnl5St/pGaGGw3692Crl0
         V5zqSQZ0l7NBZkKb47rjA7U8L7aKR0EaxGkfKnR53Qi55ps7Yue06ZjwMMpZa1Sw6yOm
         KOgwH2ulQ5AWIFYyhQ7TbaefDfqDDdaV4ap8yM72cjRNC8r7gDgGJWMrOHWlGjChh66J
         REieFnFVXQQL2F2IqNlYrAqCNB1Rnlas086vFxY40J59kIsLR+1P8JQYoHBBriqyQE1h
         QFf7ZbXSsWi127Abu1s8qUcbySoUKqqwvUmVqaLT3Xm5v6Yy1OMZ8V436ss9GIDtiSOD
         4BwA==
X-Gm-Message-State: AOJu0Yw6CS8vk+GJXAFdRlxKTOAHCEyaMFWoR/OpssIjyNdorn21giB9
	az6XGitQPlzboMjjvMR9qGjzYf5AXvyG3C3LJXStt16CLNW582JqsTlD
X-Gm-Gg: ATEYQzydlvFYJZXCoY/8T1jQBTnBvKuqvfsSwoiXSqnXt4tqm9TEsbl0xYlx0YRPbV8
	T4H5wE3kEj7f8EDjwrYIPMvP5PCpBegZkuEw02XH18OaFSrtd7vGszS0bnmbCc45TsUBlYc9X30
	PjWtBnNq+Bq091coZ/VMOiuNS+8Rm0du5UZxO/wVHNd85TIEWHku91KG50T1zQnYbFhzn7h51H0
	o6i7onjDgCzeCdVySl9fylUsZkNFbLMnwJ73hfFRXKbO6okh2Fqzd2tbdCej1ox2j14yw1ltj3E
	4zBh6Gm90x6aNZuSEyBWA5dkjqPJzDjFzRy5RREG10dwie+0LooBX/pLVe8qHsMA0ZpyCHcuvX1
	7CbcoqYY0IepBF17nYOW1r+9ZQqn+ABL2Fwe8JRBX9cmi+t75UmRwwYgFmNVfqLUMmrRTHuv3Ax
	a9Qsf3EcyTuFdq/XprAU33nRavLGpLeE8kLHtg+dv3TGjzeRDEHJoZlhstPbq1YEyDGcqRT4zl6
	HHQ
X-Received: by 2002:a05:622a:190f:b0:506:a22b:fe56 with SMTP id d75a77b69052e-50752970588mr103580211cf.49.1772308384760;
        Sat, 28 Feb 2026 11:53:04 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744963073sm72779411cf.1.2026.02.28.11.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 11:53:04 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v2 3/4] arm64: lib: fix missing blank line in csum.c
Date: Sat, 28 Feb 2026 19:53:02 +0000
Message-ID: <20260228195302.2468327-1-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_115306_888132_8E9E03A2 
X-CRM114-Status: UNSURE (   9.29  )
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

Signed-off-by: Josh Law <objecting@objecting.org>
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


