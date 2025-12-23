Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A68E6F06C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 09:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MN79rI9/KyHBudrHJMLVUfkqPeyoZa6QDJn2X3WWy3Q=; b=ctjHTGukoiNO/TzU+l3EeiulJd
	5z+Dkw41wl5PLgBC1lZiO2jEdl98oSSijWDtoB8x/i8e0Ds1qZsz/Gc94aRFx9+7YV9vaWKxkLebB
	vzquMnX/vFHsdYjS4DW0bHdRBcJDAejNzQSmVWDENx/Tvfrq1mj6GDVM8Pz416pkNo0brQjmKZCHD
	xojTDBuNLT5aZNMOv+ljOYu/Nj6YOyHqNj5U/ECWyUWGtBeX8VweE6WRIsRJo1sKg+5i7xHughEQ4
	qcrEWemrEYY9sY21fUWpy/qYBMs1knRjcNLhEocfhVYSrBG2vCdmpLPFUsnIrK4On1f6L1JmWV3Jr
	WpWIJKkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXyXv-0000000EjyG-0vHO;
	Tue, 23 Dec 2025 09:19:11 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXyXt-0000000Ejxe-1Bzm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 09:19:10 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-29f2676bb21so62507725ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 01:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766481548; x=1767086348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MN79rI9/KyHBudrHJMLVUfkqPeyoZa6QDJn2X3WWy3Q=;
        b=RioZ39+YqfCjp7YPEuqS1JKBer4nzR4HpqwsSyxXL2PANsh+J4Ng/MhvLepgBOC3xk
         euEjkAACDyWbWspTG2l+y/TwXSbUt2rrkAlnURUe4Zm3difm++zqukSwzh02I4nz0BTF
         yvyQNJsHk/NTGSlcqWRS2CiakvBbmikG89SjJEJPjFdXlTY7ln4RMR7U9ItI2AvfqWBp
         AgEmGEySYSZT8JBcWBQWXVHiTRtkEMkFBcGfiPtcYudYdD7BpqyOLj137ES9i1lOedH9
         DJgsHfxV5blaLYJKP67DXWPj4SyBF551XcMfVSCR+0zU1OB6z4m2tMwuLxxclBruOnFH
         F+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766481548; x=1767086348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MN79rI9/KyHBudrHJMLVUfkqPeyoZa6QDJn2X3WWy3Q=;
        b=rg/65YxqfQTxIqg1+kP5XPEQo9RzzYvvqtE7FPiGgUHP/IqswGyxJSCso+eV+IL4E8
         x1EqTWRpxi/ILCXYijQ+Fyp/ot6doBUca4ZWeIpvzdZO/cql5T3zIBsOQ6SFYMINtynN
         mZ5RrhSmwyskU6qMI8VIAyYL1y9r0fzAuBvCt3in5AIlReP1Evcca3j5ws3pzvQjjt+U
         9F9xdZHlaiOguR+qBhwkaleX+80zHs9Pf/C95ooAyD2CMNNVjmeoBAUr/TSya7EjnFS5
         BootEPEzxplNJu3/wdyvdza/PKE/e0W7vPozV8kwTGmywkHep0rfMoJAUlTuXmSy1zNW
         D0mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP6exsGCdfLJ5cPG4ERPL7GdqpqJQUAkmLwii6TtYKqsRUSLw0xIG+WvNQ/oOIMgTGWTy2OegIoon1HelAnrlL@lists.infradead.org
X-Gm-Message-State: AOJu0YwyKhOHmBvVuTFxZB2STRPFqVuozZRAtJuXUGsgHViTPoU7DHav
	2SZ9sF+Xht1ZqGpEKHKJvYRkYEiGelkqKzAJKzlpx1EqW1N0PDinCEax
X-Gm-Gg: AY/fxX6qicrh/P95oL/1lfPUoVURbRNxCMn3/xwH/IDk1gFYP393ZMN4rzCwt8xfYyD
	q85/jeXrVFcMpz/chM/NVAncOJViaHEk+TbOZSd26EuevAMweyPJCPHoV+q1bQ1B4LhRWGkAd/p
	JCaEuVqJuRyS3hIceGJKcnWQy74jHm5guhqrb/6cIL6jUiZwxvSiE5TtCJogGX4PdIskGL9rhc0
	vwE3F4hsqrsFvmIt3hW3FjbsQRRmM8Scx3MxgBumBjJLZFDYQEM2zjk0AoaUsWMtqHZB4NzV1ib
	IITGpN1DY9pKsy3+nXd1ukuaBE5vHeabrClkQ5+ZUJ66SgzAk3YT485s4QSe7YJZm13pTemDe7d
	AraR3AVyvQ7klie0DAbb7QOrVt4+WB4s3kXRxI0PVFAd+SSkCtJvTQe7y4jsbk6IukXPLjRlpUw
	ZF7yky+wBUlcCvElAmX1U7ylFNfNoYO71YoRnzuxet0UbwcMf8lDA=
X-Google-Smtp-Source: AGHT+IFDvVNBPIk/7N9p1UGMGeO6c8CWfVFmTEw04NxvaycNWPTi1YVQbjaRaf7i+encOwwdDQVN5Q==
X-Received: by 2002:a17:903:4b28:b0:2a0:ed13:398e with SMTP id d9443c01a7336-2a2f2a4f222mr140671645ad.49.1766481548098;
        Tue, 23 Dec 2025 01:19:08 -0800 (PST)
Received: from localhost.localdomain ([103.163.65.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d1b8sm122886215ad.68.2025.12.23.01.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:19:07 -0800 (PST)
From: Lakshmi S <lakshmicar.2023@gmail.com>
To: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	jassisinghbrar@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	trivial@kernel.org,
	Lakshmi S <lakshmicar.2023@gmail.com>
Subject: [PATCH] mailbox: arm_mhuv3: fix typo in comment 
Date: Tue, 23 Dec 2025 14:48:07 +0530
Message-Id: <20251223091807.3070-1-lakshmicar.2023@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_011909_331377_D0BFB574 
X-CRM114-Status: GOOD (  12.01  )
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

Fix typo "channnels"-> "channels" in struct documentation.

Signed-off-by: Lakshmi S <lakshmicar.2023@gmail.com>
---
 drivers/mailbox/arm_mhuv3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/arm_mhuv3.c b/drivers/mailbox/arm_mhuv3.c
index 0910da67f8a1..a1c528be47f3 100644
--- a/drivers/mailbox/arm_mhuv3.c
+++ b/drivers/mailbox/arm_mhuv3.c
@@ -333,7 +333,7 @@ struct mhuv3_extension {
  * @rev: MHUv3 controller IIDR revision.
  * @var: MHUv3 controller IIDR variant.
  * @prod_id: MHUv3 controller IIDR product_id.
- * @num_chans: The total number of channnels discovered across all extensions.
+ * @num_chans: The total number of channels discovered across all extensions.
  * @cmb_irq: Combined IRQ number if any found defined.
  * @ctrl: A reference to the MHUv3 control page for this block.
  * @pbx: Base address of the PBX register mapping region.
-- 
2.25.1


