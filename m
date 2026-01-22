Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFF7C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 08:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hpMnG7yo/s/EPaRILMIXawP8xxRqeEWUw6ffTIMdA+E=; b=qFo+oDrZUZ8VZ0jdIAuTpxW38C
	8bTrIIP4cNSSBCbP4Z55uI/LE1/QW2SajMMowh73zq15P9AUjKy3HYeUlv6FXxmb+kY4Az22tJjXX
	qnYa2jiML3bYgMsQnoOn8WnrjbVspPIoAdWc7plorDDh2nkVRG8e1CZo3o+UtX0sjklFOf++UU3e1
	4rc9tOtiFvP01gKIRWEOrywMzkw+1L/YnAfn7TAgnrmHMZZ2TJg7hjDzUfNC0Tt6A3GhZrxi+Rmfu
	YhLgrgAGY7RDWH81CFNjKd+Qf8uJ6JJ5p8JiSzQRHmcribqxlOhLPw3V1XZDmRS6SaRaYUjtJZH1I
	uDoY05Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqEl-00000006fEM-43ai;
	Thu, 22 Jan 2026 08:40:19 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqEi-00000006fDg-48Jx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 08:40:18 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a0c20ee83dso7077965ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 00:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769071215; x=1769676015; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hpMnG7yo/s/EPaRILMIXawP8xxRqeEWUw6ffTIMdA+E=;
        b=W6K+9S9BnixsvoKpRQqL1Fau7sKUfcUZvMkL6HKozUDxUe2mZjMCA2ijEcilW9dRSq
         l0nj5L9k8stGoFmtQY3/8Zv+n3D2apXJHHqYYEYMZiM7Ekgom5ICcFwW2/1FPC/TgyjU
         H9kZJ7CteO8W1jOwP3zs+67NZnvgpO9jsM0kjQSoWxnjZRvbrn4wx1oF8v/uU70izI5h
         zubwsDTopxf+CWTCCAreWAOhuqc3kF/J0SQe188bMkIfzT9GqNm3ekMuTqJ/Ccj3ugYu
         l96HdWYDF1pRVBNFqdEN0wrErfqvLMxBZsfViF9QsYQ+MbhMOqUyfdhvqhl4vR+nU/Jd
         o2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769071215; x=1769676015;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpMnG7yo/s/EPaRILMIXawP8xxRqeEWUw6ffTIMdA+E=;
        b=t9CPxt6Bc4IbXe8QohzJnmk/SjULCGgGgvh1bHcwpu2MIrgOBDsteHF9pq7VxzWdVf
         dWeChrNexgexCpv4LnQaBOg1A20U9LOSsB6WEgBiJNSX4jTmCwVZiFeCS8Avx/kqxCly
         zqa8L4S03qrl2GJUGkvT23hWAGZQPW8SarEQBfketJ3RO/2Q5ZBLwUq+Kcwk1ODDgP2E
         IQJQOlvaLcFyulNmRTiQXcdVsjduSKeY9Alr9eEmRE0rmn6Yu+zzPdMUV0jeg4m/XMMg
         uo3XTW73bW9dDmUUXhXkQt1FndqBcZbpM7etXliFBj0rpOsAF7zP2xn9oiDU7FERYqMc
         Pc6Q==
X-Gm-Message-State: AOJu0Yy7NfVdJyYQjGEBVlRWRrErVbiKyqhT46aFAGAMUGjElgQGTIe+
	ZLaEiwnb3twESlFHty/6PIb4d4uY1cM1tdwKaHEthEzwGKRSsNbL7wUAooTDGw==
X-Gm-Gg: AZuq6aIn4IuXSp/u23a10rozAU+LAhwK0gpIrkLOqHMUE7U+YFZDpkFmjY16+RDGgjd
	qgBU9Za0PEiGsYhvkAdQm5/Ur+psQgADl5zF1F9RctgHYg64/UXzlVXUxy1N+UALTlznZM7YjF3
	JVpJ2kwXm/pqqNSxDhXPiYFWIsf6zF0mZ0FZgkZHpfcV1XmYRxpTn6+iZflCLRE6pkR/fYyEsEI
	tbI3t44/fdj0yJmZ/Ko6u9faTN9ergPCG2r0k4C7wBcw4I//6CxaTKzQWejss8tddOiHTKGyve8
	wD913CY/axqQcLNq2ZdLCviV2k23E6od4JI5rYGp3yKrit2csKL6E8CijOQXamLdIg9HGCHYfMk
	RGty3EvmeKcuhwHXiX3y/NVv7AmuLWOhi9W4RDhouD3G6ctBH5h//921uL0QuCaRvpBkANkdDAp
	IONStmLLwuo8/xF8OEZb2g2TYg5NT4TJaWcTfKpId9nYGuW1Op+W9vriUErQeYdvQ=
X-Received: by 2002:a17:903:2b04:b0:2a0:c1fc:3de5 with SMTP id d9443c01a7336-2a7176c5798mr159612595ad.51.1769071215454;
        Thu, 22 Jan 2026 00:40:15 -0800 (PST)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7b03945c7sm38423085ad.102.2026.01.22.00.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 00:40:15 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 22 Jan 2026 16:37:56 +0800
Subject: [PATCH] soc: aspeed: soninfo: mask table entries for accurate SoC
 ID matching
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-soc_aspeed_name_fix-v1-1-33a847f2581c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOThcWkC/x2MQQqAIBAAvyJ7TsglIvpKhCy61R4ycSEC6e9Jx
 xmYqaBchBVmU6HwLSpXauA6A+GgtLOV2Biwx7F3iFav4Ekzc/SJTvabPJbGIWxEGKchQCtz4ab
 /67K+7wevLlqeZQAAAA==
To: Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Patrick Williams <patrick@stwcx.xyz>, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769071213; l=1296;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=NcA+4V/eKoD7laEnrtITGzEvL6h6C7wMkK//E+tf3IU=;
 b=rLkSU4ZR7LLrHUbxt3uEiBVvpobZHIDelmOZTOc6BulV862CLv2zf2tyIwEKQpsl0CCu7vUkh
 pdED0LZMfZGCPrqpPmWs9sJdqSz+cplTG8ilFHqfaN5x1F2PlHwB6nJ
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_004017_031109_D7C34C96 
X-CRM114-Status: GOOD (  13.08  )
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

The siliconid_to_name function currently masks the input silicon ID with
0xff00ffff, but compares it against unmasked table entries. This causes
matching to fail if the table entries contain non-zero values in the
bits covered by the mask (bits 16-23).

Update the logic to apply the 0xff00ffff mask to the table entries
during comparison. This ensures that only the relevant model and
revision bits are considered, providing a consistent match across
different manufacturing batches.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 drivers/soc/aspeed/aspeed-socinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/aspeed/aspeed-socinfo.c b/drivers/soc/aspeed/aspeed-socinfo.c
index 67e9ac3d08ec..a90b100f4d10 100644
--- a/drivers/soc/aspeed/aspeed-socinfo.c
+++ b/drivers/soc/aspeed/aspeed-socinfo.c
@@ -39,7 +39,7 @@ static const char *siliconid_to_name(u32 siliconid)
 	unsigned int i;
 
 	for (i = 0 ; i < ARRAY_SIZE(rev_table) ; ++i) {
-		if (rev_table[i].id == id)
+		if ((rev_table[i].id & 0xff00ffff) == id)
 			return rev_table[i].name;
 	}
 

---
base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
change-id: 20260122-soc_aspeed_name_fix-a64cfaa2d84c

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>


