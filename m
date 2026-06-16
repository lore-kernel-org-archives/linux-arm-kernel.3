Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36553CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 10:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rgXck3qhvoJPxsaGkk1pMrxcKj77tOWzD/6bHjBzG1I=; b=TO+uWuiFOGhdadSkcpYBgKf2N/
	lq5t0g41oM3OBUmxL/ZMIXhF7zy/Ck92R0RbmGMHDmmqxMOJ8HnZxKix4Olcd5MuNGj1ROBY2axQz
	BLKy0ZOvkoXcO11+wpNwjxh3kg5H7xCXwM2WT82yEzlWgqQR1uhusGzqbQpeviv4dJb7h7uXjfZQq
	qIHvBAZK9PCKq9e7wKTwYbFK7fz5q3MLjGThaG5amKBDvMPjEZCd5zP4xPwp1GUMLXnueicZRA/3n
	kdqLopaMlXjmIiNB2vvVSnAuz5rei8rQHBpwW/UNu/WGJsOKirkfhXpzDuPBgviep3eXVOWBsozeM
	88jE1CAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQkM-0000000FZnE-1VGk;
	Tue, 16 Jun 2026 10:10:18 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQkK-0000000FZmI-0X5X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 10:10:17 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-842307472d4so1608584b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 03:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781604615; x=1782209415; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rgXck3qhvoJPxsaGkk1pMrxcKj77tOWzD/6bHjBzG1I=;
        b=b0orjZVRQcki2Yo8cd79rV2BBuW9bqmx/SN26QitDb5j7rXpwAFdiQt0ESFyL0P65n
         o101bn7wpbBLKamFDa1uajMCqPRAq3e05ZUiZ8KnFGj88H3qnQEmwoiz0DwZmxEZfWp/
         glyZRzN/At8BYUV0dN9ud14rf01PuX0iDlF1MSYthjfZPvimwAM0U6EDj2tkmhKWsxQs
         w5wUYBgboZ7JT84ghxhf4lbGpHwxY9usN6ws2+hRURLqIXhoULtuaTxFr5PaEvkfc5l9
         /JreX1GTpHNqmVlP/ZEkwBUQxbKISM+3HsRGpNA4Rmg4bk/8Res0HmQK8FYISBkBb/IX
         /nag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604615; x=1782209415;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rgXck3qhvoJPxsaGkk1pMrxcKj77tOWzD/6bHjBzG1I=;
        b=b4QGrJelJLvQxgUKzWYALMUAI0sA3FpbgzhONY3uJiav6n1luP6sc2EZqymUrnx09k
         JeHUTlFrlTNiyxJKBiPhdaEnb3WbdeeolQO7hPDrIGGSYz1JIZ0MMO5iteb8e/uSMRp5
         NRKfIz2XGoZ+0FTfbghnnNFJbeNwTzt1BJSYfVYgHktuXbsbv1gBcGUAcxoF0bBE44Qk
         96nKRQmPkx8e2iOBVm3Kf09vtY+j10WD+CT/1oyTgSwZj3cSaviyn9xMwgDG5Q4ejOdu
         7S1mzvylsXumjWj6WsuiGlJGz5g83Nv9ifrmIsgImHMzsMsecRDXnLd+YXRICDkZT7Qd
         uNvg==
X-Forwarded-Encrypted: i=1; AFNElJ8HvwqcyeL2BUjA3SSU5+DWPHzJHJGbDcX3dCiNMZgW4dukstZ3zH7Xq1rFWtAp1Ei0VxCDzlOxe+4xlPH/jDu/@lists.infradead.org
X-Gm-Message-State: AOJu0YzwHt/WTjyprBNCSP8YidAlT0OKr7BK37UGL1xYsEqBIbRxXRoV
	cZ4MqjViBMD62VtlOZ9/RImSDJ8/FG3FL/Ian2uUvBUFacc/Y76tjIkd
X-Gm-Gg: Acq92OEyHKXA2EAMJxnfFyGSYHWlr0Zmkb6Nyud81ph36r9N6XSOTgXn3sp1uojZMtC
	ZfWk3mz9zcIhEX2QArNPRUHVDr5EXftJD9iowB5K3fnHEWWkiEXyjX95x36gwopSZ/SG8PmVgNc
	jRkqjjPy91U+ef1ZPXKLEHOH12BiDtYQ4kG++x7ymKmYgJrJv7+FHCzMf+H4ZCliJyngDlHWrm/
	u1t9giNaTGjXgsdZ8jWUUtCsaa2FOAnQhfqouk8y03t/tUmI9NflRKo+J1IjBco9Fjpt7o92cmH
	Y4BaHKE8prmZBX88ZNdi7hLZljEku3Z2mfv2uvjcr1v+eko/ZzxQUi1EN7NCzfSdMm2/pXqnfjn
	S2XFBFfVT/JyO0bZ+MELoCNkzVL06fkdLmh2QZ9ghoNVRSJHbN7gljiYY4q+qxyQWVa3EtLbsh4
	YKSBZ4l1m9mpPVFiKU
X-Received: by 2002:a05:6a00:1151:b0:842:6fac:bd3 with SMTP id d2e1a72fcca58-84515556183mr2848320b3a.28.1781604615062;
        Tue, 16 Jun 2026 03:10:15 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ad03fdcsm12396943b3a.24.2026.06.16.03.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:10:14 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] net: airoha: fix foe_check_time allocation size
Date: Tue, 16 Jun 2026 17:49:03 +0800
Message-ID: <178160461057.2154221.15886112443159132305@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_031016_165264_F5301D3C 
X-CRM114-Status: UNSURE (   8.71  )
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

foe_check_time is declared as u16 pointer but was allocated with
only ppe_num_entries bytes instead of ppe_num_entries * sizeof(u16).

When airoha_ppe_foe_verify_entry() is called with hash >= ppe_num_entries/2,
it writes beyond the allocated buffer, causing heap buffer overflow and
potential kernel crash.

Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 5c9dff6bcc..8fb8ecf909 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -1578,7 +1578,8 @@ int airoha_ppe_init(struct airoha_eth *eth)
 			return -ENOMEM;
 	}
 
-	ppe->foe_check_time = devm_kzalloc(eth->dev, ppe_num_entries,
+	ppe->foe_check_time = devm_kzalloc(eth->dev,
+					   ppe_num_entries * sizeof(*ppe->foe_check_time),
 					   GFP_KERNEL);
 	if (!ppe->foe_check_time)
 		return -ENOMEM;
-- 
2.51.0



