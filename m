Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FCEC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p2e6Hbr3mS3jtYf8ADqm2O2fYI50hKUDyZ+DuMwGlh8=; b=VE1pHobpMV8L5i1JG9HkoAqgNs
	tQVUsw3L3sR5saxHFZFE0GHQWH2NWcY7xPSy+y0u/gecuqIN0oE/oBR16I+nirQ7uufyq/DQAJd+B
	AWX7XCo49tXvYA5tA7JUlWwgtwXWYXRWcUtjDn4ZkQVj0GCnMwFWtcfrQlJXCnB19X3h1xh1vndZ+
	NQVohLK7WULJaHeP5HbGFhTzYp7OAdzgOwRTrFMQCrWLHvFJ/h7FM5/90U6UIbGnzN4MhZXwSib5D
	5P4u7cCfCzp8cRft77R0mRA97EW0++yXQvnhzquWjqpxTuAFGnLafISaeNSgkaGyCEeRWDLMJRlzX
	rqR2/uRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqOi-0000000DB0e-08zh;
	Fri, 31 Jul 2026 16:47:48 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqOf-0000000DB00-2vPJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 16:47:46 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-38e88b60121so1022921a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 09:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785516464; x=1786121264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p2e6Hbr3mS3jtYf8ADqm2O2fYI50hKUDyZ+DuMwGlh8=;
        b=W9941g2CExWj2kvJurPzVM4lu3XGtq6fFS9fQXs0+Y+zAc8Ic8qJZO7MpXp/wD/51s
         MRFMY1Qnwk3RTkcl7cuFlQpbtEI1JF7paEBsXsKBIFV6WEn1rc7BF5A+B4GtkUlXaBXa
         FSEUbm/Tonx6o6Zi75XwDhWgS6oVzuOeMAQqD1/Njf8uPeuHZnscK9Ihi8P4ftMFi3je
         X+MLzJd5Y8yeZqkOdvCF6tmKxXG+losE7us/Zcr0EE+H/YcxiJjgvOTJZbPrbI/O8Whl
         BljMJ4Cl6GfFL36PEvigRezMtpNhM9647wPoPAmn7M+wDizfyU4BcwrFwey+XD8Lh22+
         wJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785516464; x=1786121264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p2e6Hbr3mS3jtYf8ADqm2O2fYI50hKUDyZ+DuMwGlh8=;
        b=OxSE6Jrqpqyt49xs39f3Jyq82Dx/W59S8Q2ID/Z0XMdw4ZzZnrQTh4WIylAGych4zt
         OJ0gqV9uze91LLZJ5vfWkyJE12bFSg5Rvtq763Ar830fuS2SxUeZzmHJjZScm5XaLzln
         Pq8e4u/GX/9HriWQ0paZHIvtps74QPfDgCfSEevxy7kAAZFkSOzXvsAxh+CDcWwS5Uq3
         Eid0bAbUfIoTcwyV1PMXOswaCkicv0XMermJGmiHFporjI3zkMivwyuD/Bx7fdxR+f+c
         QsvS4+c8tE1JU7ifugZIU5hb6At9FsnLtDU1Kg00AEgl3nXUX2rKi389qEKb5O748+Cr
         kDfg==
X-Gm-Message-State: AOJu0YybXmlNY3NKCMxBF28x4dl0CZLw5/NOxpLtCaaF4DE7aLmI2r5i
	o/n9TdoVkBBluzjsVUSUBWz3bqkvLeW+GPy0+WL949eje0XGhDQjUgjM
X-Gm-Gg: AR+sD120dnEuf18MNuNm9ufcRJvfzIM8cmzOezg9ipQjWyQ3t0wfLfK3WKD6HoYieze
	ngqKX7gx0mWk1h+1isuHCLac/c/voF+8YhBj1CuE4dWB8wcI84whqrnsXyUjKEfHFeRdGZOvpz0
	b6MAuGLlQfzHvGcyWhBAdfwuqOgf+QAKXx0XX3XtGwXuT6QrOxL2Tvy2njJ/3RiEMU5aHv7Ds1S
	0Csw9sm2r9Mpb/VwIFNU3c2NqJu5IpQ6mwA9DNvbjYUOuFG4WGpjbvhrOpWI2gn6nnLKDjHr9b3
	f+VVV58U4Ayv3FZrubRV3qZNHI4roSt2ub68gDsLmRcPSx0qTbmibwCZSe+us035x7cpGUJT5/r
	gTrujAXDg672GymTZgUMxYGjhltGes5DH3cQASAbG3JDwypa99uHJyhAmFfEiaH2xNO5lrb1dqT
	WDUQnPdapT6k2Hk5Cw82V6DgL7fj/g3ZcPicdjHf/mX1p2P+SP9Z1dR0U=
X-Received: by 2002:a17:90b:5403:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-38fbc434501mr587545a91.11.1785516464469;
        Fri, 31 Jul 2026 09:47:44 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2575819sm970637a91.0.2026.07.31.09.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:47:43 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH] wifi: mt76: mt76x2: use min_not_zero() in mt76x2_get_min_rate_power()
Date: Sat,  1 Aug 2026 01:47:26 +0900
Message-ID: <20260731164729.1210247-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_094745_736912_E320C05D 
X-CRM114-Status: GOOD (  10.90  )
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

The loop in mt76x2_get_min_rate_power() skips zero entries and picks
the minimum of the rest with the same logic as min_not_zero().

So use min_not_zero() instead.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt76x2/phy.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/phy.c b/drivers/net/wireless/mediatek/mt76/mt76x2/phy.c
index a5efa13a892f..89733f3fb1f2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/phy.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/phy.c
@@ -121,15 +121,8 @@ mt76x2_get_min_rate_power(struct mt76x02_rate_power *r)
 	int i;
 	s8 ret = 0;
 
-	for (i = 0; i < sizeof(r->all); i++) {
-		if (!r->all[i])
-			continue;
-
-		if (ret)
-			ret = min(ret, r->all[i]);
-		else
-			ret = r->all[i];
-	}
+	for (i = 0; i < sizeof(r->all); i++)
+		ret = min_not_zero(ret, r->all[i]);
 
 	return ret;
 }
-- 
2.43.0


