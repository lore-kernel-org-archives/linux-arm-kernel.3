Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB163FD0048
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 00:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=54PWO4lr5BZEBcjPpCtrQR7k9s+Egz3chgNQY+b5FhI=; b=ts06ZAyZVaSZW8WQfy8l/XxZ54
	ALQtDT+irWBqptrmfi28k9cOcMuJmWsc2Xx5lKaLAVOgck0jbCiCYDc9hvu+neobogy3GzmwGxTiU
	OYy1pbSbKa8IpkppVl8JeLC1eHLmABqgufZqP8yMEhCxa1evVQTYCzwwcORSxA/b3M9hcFgJLI8ue
	XWvm25MnBUPfwCR2ECAx+exzMnQJbVUW1IxiIONKHjo34AF7gl5GGZmzblcMSynAxP4izuC5JZOB2
	lnhhDR4QCRPJyGXORu8ir78jTtD6ZS/3D/UGv3bxGTFvW7ZbZpqnX42qoXQYug7p6SRK8Yp9SONTG
	kOU/xItw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwUpq-0000000AQDN-3BL3;
	Sun, 01 Mar 2026 00:39:02 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwUpo-0000000AQBR-1LxM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 00:39:01 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-8cbc593a67aso276037285a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 16:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772325539; x=1772930339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=54PWO4lr5BZEBcjPpCtrQR7k9s+Egz3chgNQY+b5FhI=;
        b=cpIOp9Q+442lDhbyne4e+5o6yeFjz0u/xk0eVpH6JtefW8seh32zhm3UrQbMw9W/Kz
         izyyW9T0MPS+D1kRo5ApaOnfnM/b2R+ZcjZGg8lp2/BSUGIjBrOj7Sq58WjJb1UDzlPv
         uaDHQNecgCvvFnsrpApmJNKRfOv1yLLvNbwGxBDkuhsILCFOQG6Bd6iq63HLgEw8mZ82
         pllQ+IsZWECz9FXx9nuVUeUwQv3VN0Y4IRZRtG7S7jg/b1FIT2VgvRRK16GRzU3jHdKb
         fHSTompBw+URAi26ojTzWMemw02REAJRDnC2kka/58rHhOx2HBEGuBUDzCqbiL7z7HGX
         y7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772325539; x=1772930339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54PWO4lr5BZEBcjPpCtrQR7k9s+Egz3chgNQY+b5FhI=;
        b=fMPAEaKMwZGQz4vo4sDgYRFgTDR+/O6fpop6/o3kfl+utDoposG3TRTIgv6YDQS0kB
         QAgiAufi4nOCOOAudB7VRde7iiukCiGSCZhI7XZi065tC2b6KyCsYbylv7mI7o85+lXr
         0wBSDtiQVeVwDV1DqYXKK+79veLMgbEVOmDd5JJ9Rq3iCs3wXmZsHTo45SfSrN3XaxUR
         EjDNc5+hHjBNhUP6tfvf0kqklCX0EPduSn/XRb6tBmMzCVtJcWmiXJ0r9h6AaQMXRUwk
         iZborMRNL64GULmoDFnzU4gi1YdLTO6TiGRKOxAGT8/huHG1/zfKgpOOpIyL8kgKcEZN
         ebKQ==
X-Gm-Message-State: AOJu0YxWN0Vh5VmoAFnAIcJ8EsBcIUKBcTqnTIMEwg1W3F0Oveobn3+W
	+kCVBd8cXReyWXe1bvPJSo/nRewNYW3HkN530enJ6NXYqBZY6eO7Z9uX
X-Gm-Gg: ATEYQzwcehLCfnsJiA03aH3XT8S4T3YeJCdll6E7jfSoIGh2sKEve5YTZmMySZzHKWI
	FyEo2FzwHLpVsf9mhlnipnGhPC03fEnKxwsRaSnjhrm8eqHYUnBs2smzcd2PR0l3z7X3/zQBZJZ
	32eV502PRILGAZhetg+ALhdbHibZ9t4xqvOkI4rkDeF+64iS0QD9kMdtmkY15JLPlWHlgSyFTNM
	MQnCnKdDKuniWuF3d2FKmUnt5kJZwpmgK+B7F4LJL+PW9IPdZNa78LjJr3RB/ixE4uOk06iWKEy
	vg4nFQyxwdJlVgjaqYTUlDzgJT+YriScOoeGZCec2uII5y/Xw9fuASsFatNydLhzthbr3pWBuRe
	5vDyWdbWfi0mxkFFWyczGKjAX9u3CRe6TMzDbcaHAatvi5lRrtkK7Jk4M1vAZ30px0W8gbU7cDj
	on//hkfqPWHXNMd57eHXdp4ati3W16gLg0IMZhRlw2E4LLHf9qn8yquIfuxRd+c3OpsaQ+byzry
	Kgw
X-Received: by 2002:a05:620a:4110:b0:8c9:fb65:7f08 with SMTP id af79cd13be357-8cbc8df6a50mr952064385a.46.1772325538804;
        Sat, 28 Feb 2026 16:38:58 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6541f1sm801230985a.3.2026.02.28.16.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 16:38:58 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Theodore Ts'o <tytso@mit.edu>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH 4/4] arm64: vdso: fix SPDX comment style in vgetrandom-chacha.S
Date: Sun,  1 Mar 2026 00:38:57 +0000
Message-ID: <20260301003857.2504495-1-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_163900_362511_0EBE4D05 
X-CRM114-Status: GOOD (  11.47  )
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
 arch/arm64/kernel/vdso/vgetrandom-chacha.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/vdso/vgetrandom-chacha.S b/arch/arm64/kernel/vdso/vgetrandom-chacha.S
index 67890b445309..b58207d6bcd0 100644
--- a/arch/arm64/kernel/vdso/vgetrandom-chacha.S
+++ b/arch/arm64/kernel/vdso/vgetrandom-chacha.S
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 
 #include <linux/linkage.h>
 #include <asm/cache.h>
-- 
2.43.0


