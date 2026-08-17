Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBC7C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 13:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ndGaNRfoNoSmNjoeBTk9W6ub7IDFY1I1hsv9aH7jqkg=; b=5BfmO31V4QInioTYgsh0VKEnxo
	xQyR5QsxLasfsKM7uRi9gEu4ctYTjswltq5MiEVkeIIsE16qY4N5tMXma1YMViukwhmFplMM+uJUj
	RSyiO8j4USNZ2f6lAtPznyKBOaTsgrPIcLKeHLaHOFOJHTxQkEZRw9Sm+tqYqHClgyr93IHa2u1Ow
	HN3Cs6Y1M+BL5IYXvDCwkoPxZzstOakaCzLBMlxIn5JM/TwtfZnVe7zvOE87qYVUJfucQt/7pFv3t
	uuuvEqWtDtLz7DRhENsY8pzjF8ThLHSSVTkY2QwWsB28C0ui5z7AeIlAyYFxkAmVgw16Ig8Mjz/1n
	TIkZ5OUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvwzE-00000006AwQ-2ahT;
	Mon, 17 Aug 2026 13:02:44 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvwzC-00000006Ava-1vG6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 13:02:43 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2d53197d8b5so26668325ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 06:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786971761; x=1787576561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ndGaNRfoNoSmNjoeBTk9W6ub7IDFY1I1hsv9aH7jqkg=;
        b=QN3tUPq2bLwg/CsGtqRkybDVOYnB8/XCl3rGhS3lzXEiQlnnLrWLkuCJrGBACjuG+x
         nbwp98AxFJwjRnMoGa1KH6lQL4EyShiylt182AM6Ogqvbui4WuWaJKPuEBCTnBRz4iVy
         0vbjFBYmbDAHf8R7RVDc3v/p24WgTyJKLvXxALd11xkV66ggdQyuPA1ZmYkSuvg9sa/U
         AiKzlEebpBVsvH4JGHxb7In4SC6/skKAOmgEv+hsAWs/lavT0hf2oXyCszBk33eKwjPH
         fUak61eyiwJmcTAUMoTi0QO3vuteL0OhnNxyY2CT+62fLUyD4Lu1cvqFF3Rl881E2/zR
         dZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786971761; x=1787576561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ndGaNRfoNoSmNjoeBTk9W6ub7IDFY1I1hsv9aH7jqkg=;
        b=QDfhTelivX+aVT2quzcT1e3RC3o9G/GdPKNv8UiBtvekke8oMrGVzZ+ZBzmTp3fyDq
         +48DG5SJfqJvs38mdGBZIiJwFU8A3KKOYfnq4JlLXGDfTUHxB3Nqnznne72xye7zbIAO
         jE97bSCN4RN6jD6C9D6cijAIXRP0/CkB71kvfqXR3nD/XCkhZVeR84NsbvGy3b6SqW4V
         m2jFBGtLEICup8tnHVigLQLSk7HTPgr2oqcEGQMgxkxZ4dRFdsdDD/cEeIfCB0eafocK
         N53sACS954HlwKHZpMgFzV7n/8PodznaCECHcdHVM3hFxxzG48spUylPceMEEWidlbHO
         uGKQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+f5BDJjn4NxSCECkUswwwuTzsQhJZfXOO94cmaFert3m7LhmCRThtF2Tfta7ZTx6hjt7Eqls7zZRPTjMG6HXX@lists.infradead.org
X-Gm-Message-State: AOJu0YxeYmOTaaXXOTSNsceOXd12jEakEDLOkrZuNDM2g7yNhlOEuX0u
	vfZgq0ZW0eVFaQLbo1uR95PE62BE+ue/f/gjTrd/Lpfij9I9mN3Wp7yZ
X-Gm-Gg: AR+sD12OHywifO+LQIWyrKGNQntPY8TqZaS+BMTCgF9265VByagvUI4+ej9jGiOT3c5
	iGbpRu5BGvo12t2Y0QXRNSdswXT0bP+kMUF6T5P5NMh0vXOUgxktV6xwIIvf/QtS2Cut3phmdUj
	ZJHvyFjgbOU04wHwjrLMydU9gUISZJIFOHkJzmNne2pGGOE9AgQEAguuNjW/S3Id+dIwFq4Stch
	uSlObDQGuDY0he2l3dTmjwXzSLXzK89LfgaoUgyfjHHbkG0eOGjFI1wn7qAeL2+iMsSESeBUoW2
	RVjpsdt4Mz7qFWep1i0qtbYPVxY5JjTkdTpxs9EmpGifgakM5JX0kGvrOfA3qC8d906xHuWstuA
	lL52ALrrGGjwzlqGb94lw7xZafpfMP+Hqx3j21jxkqlAlbsSACkk+QtuYjlStg6IJkYNe8doaso
	sOHbcQiyJPRUPZIMsc8SqKjRWJkjnc5h4NI03n+hK4MzKsEVsx98MMg37+wrvYHqiAOfvFiBWqT
	Xu9fgL2BlwrG/I=
X-Received: by 2002:a17:902:ebcd:b0:2d2:ae04:5712 with SMTP id d9443c01a7336-2d5c5422f5cmr1611025ad.21.1786971760878;
        Mon, 17 Aug 2026 06:02:40 -0700 (PDT)
Received: from mi-ThinkStation-K.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb499e8csm5402435ad.2.2026.08.17.06.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 06:02:40 -0700 (PDT)
From: zhaohaiyang1 <yewentian395@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-i2c@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zhaohaiyang1 <zhaohaiyang1@xiaomi.com>
Subject: [PATCH] i2c: bcm2835: add missing braces to for loop in bcm2835_i2c_xfer
Date: Mon, 17 Aug 2026 21:02:34 +0800
Message-Id: <20260817130234.372628-1-yewentian395@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_060242_506051_DD246ADC 
X-CRM114-Status: GOOD (  12.40  )
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

From: zhaohaiyang1 <zhaohaiyang1@xiaomi.com>

Add curly braces around the multi-statement body of the for loop
that checks for unsupported read messages. This fixes a coding
style issue where the compound statement lacked explicit braces.

Signed-off-by: zhaohaiyang1 <zhaohaiyang1@xiaomi.com>
---
 drivers/i2c/busses/i2c-bcm2835.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
index 8554e790f8e3..76d017cf1582 100644
--- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -349,12 +349,13 @@ static int bcm2835_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 	unsigned long time_left;
 	int i;
 
-	for (i = 0; i < (num - 1); i++)
+	for (i = 0; i < (num - 1); i++) {
 		if (msgs[i].flags & I2C_M_RD) {
 			dev_warn_once(i2c_dev->dev,
 				      "only one read message supported, has to be last\n");
 			return -EOPNOTSUPP;
 		}
+	}
 
 	i2c_dev->curr_msg = msgs;
 	i2c_dev->num_msgs = num;
-- 
2.43.0


