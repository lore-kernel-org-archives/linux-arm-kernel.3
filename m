Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2536AC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 12:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l7S/vG1lp5geqRglunYVLNLd5lLTAffxPlQ/qp918/4=; b=kzCC0Cb/rmg5jC0ltSxXpcrkR/
	eCUD1EB1UnMz2eHVg89x0lGG0gasM1wotIX8f83Qmnm4PxbTYIB86mS/LKbIq2ynuLrYF/rlNjNfR
	+Q5ikqE4eIYJcU0hah1Flu4y85vjcyqhOpRCbM8+WMLOQkjd1IAoks7IcDWONHowuxhDMm/Vgwcge
	jEZvGF1AHYh8aivEpKMoccfvV97oQ4IRBVTW9x0cO7SLv4rZjtO4gieu1EAcOdatOUru8cofUU53x
	mLlrMKueHQdXtbXqRFysiCPDPEudGfOKBm2plwXQ7tz8UUhA150GicHUVmkloNCqUI5WyMOiQua0+
	a27OJk/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFtu4-00000003Ku9-1oGV;
	Fri, 16 May 2025 12:11:04 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFtrX-00000003Ke9-231H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 12:08:28 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cf680d351so18477495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 05:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747397305; x=1748002105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l7S/vG1lp5geqRglunYVLNLd5lLTAffxPlQ/qp918/4=;
        b=KEMJzTiB53juMWTpB9C++fQ5CtXK4PTL5S0Lp80NMS1M+kKqFvgZmY+I/wmC0aWL/N
         mTdfHydECG+xp4L5OP1ozXAqnfIKsBAizfSSRm0lhFGZzjDhL9pIxl09pUx3HuE2nqhs
         2hlQ1iR4+Nhw54erEHiqr776QdtDyjtT7hmRFJf+HBkzhixkP9MTRrQtL0e9nkRMqaaw
         kOtRXZu9iM/TbAAY2+0+YmGqD+Vyyby2WhmrcMngcKfzHMgdNUVNa/cT+UpZvaj3ReP6
         XeK3y1BtOjgdkVZZ+qNGvp9erpO5IAoQ9Bh0G4jU7Jtl3DszixO5KVhrpKuQgr7nwI/Q
         mssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747397305; x=1748002105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l7S/vG1lp5geqRglunYVLNLd5lLTAffxPlQ/qp918/4=;
        b=jB04ZG6KlJfhYIKv4xWdrkWi/cCYGTJFCbN6o+pjibijNUNjePhlbGJJ+s1IgMQ32E
         8rsUiURnPcogft/0CHwChac2jmx+meLNJDJ/nqh+97HKIPn7gsaSvD0U33UJig2LAmec
         8D4xvsgLuGTdAguGXq0Ks6R5RSpqFf9WoqtQbIa+nv80prcOafI5mNCsvoqORCci9yRh
         1Tlq0sQKNsgL7cIcAa9eEUJgObQRsIy/3Jm30AVjnwtrGHeDVYggNKPtCjoLQLxoH1+a
         gaF4rcyEEE0eBiphQySclQTPERTOtY8kRCQFAdH7E6XXK5Cko48oYmb0xuj7rD1RiYIy
         q+gw==
X-Forwarded-Encrypted: i=1; AJvYcCV5Rss0pgA5Kuw3y2LXZZqp1WVzzYfcXilvfLTzjkZ8ues3MKki4aYrTg72FrR4bl42QYsw46a4v2tp1lSTMYH0@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4U5Yck+eLBcgkibs/uZZgeRuarhX/RjqpMWdcxR41upjPpiwZ
	Bia1IOYJcqWAbpik+ojVEjeOPvCQBd0E9Epzj5+NFpxWUYy9IS9+Cir3
X-Gm-Gg: ASbGncvq/a0HO9i26V18RQS3kHvtav9gh7Y88i0YA9wT+2nMgVYuRFG+q/y9mlDzJmd
	yTkwXXck2P/1Ud9uw1Xf+XVTr9zu3bBcMDJHvDlczn4dFnM7uQaik+0Tm0UabHLd+5vUn5d16IG
	0jivj/tBlbh4B91b7IMCcQG1QoY8NLAWg82q+yo8xMunNRIVHmhFicSAbGJtcZdfRdmAdTpRHz3
	UFyHtYIsybHaam4F9v6E9eSEyHHeOxg2yVyeZIKSTP4my1Ueg2gkOjpKmTKyFjN0y0Kt4pZmU5r
	uEkAKTxyjxnWbBIE2L7oUDv6PHnSXPF/bj4KdXbXn1A90SLnqLLPD6J5251fz2kuUN2Yx0DV9V2
	9FT4=
X-Google-Smtp-Source: AGHT+IETHNO4PZaxAV5fQzFYG7nB1lHUisZaUbqvlKR7l0R0thhXbB9LDnls9f0950ZGMS0nNFwq9w==
X-Received: by 2002:a05:600c:821b:b0:43b:bfa7:c7d with SMTP id 5b1f17b1804b1-442f84c2008mr72290655e9.2.1747397304833;
        Fri, 16 May 2025 05:08:24 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f07:610b:a400:6472:d2f9:d536:4c30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f338050csm102275725e9.10.2025.05.16.05.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 05:08:24 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: clabbe.montjoie@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org
Cc: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH] crypto: sun8i-ce - move fallback ahash_request to the end of the struct
Date: Fri, 16 May 2025 15:06:56 +0300
Message-ID: <20250516120656.3610623-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_050827_521148_36C941EE 
X-CRM114-Status: GOOD (  13.99  )
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

'struct ahash_request' has a flexible array at the end, so it must be the
last member in a struct, to avoid overwriting other struct members.

Therefore, move 'fallback_req' to the end of the 'sun8i_ce_hash_reqctx'
struct.

Fixes: 56f6d5aee88d ("crypto: sun8i-ce - support hash algorithms")
Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
index 3b5c2af013d0..83df4d719053 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
@@ -308,8 +308,8 @@ struct sun8i_ce_hash_tfm_ctx {
  * @flow:	the flow to use for this request
  */
 struct sun8i_ce_hash_reqctx {
-	struct ahash_request fallback_req;
 	int flow;
+	struct ahash_request fallback_req; // keep at the end
 };
 
 /*
-- 
2.48.1


