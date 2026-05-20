Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542C8CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 20:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mkaEL0dtEh5vLkhnum12HiGQZEgLNqcEhlclJBj/jfs=; b=htGWILRI9y5ZMgxVKNMcjAxh7T
	Do7YZ0UZAIvbGA/f46i7WPX+ftTe3C+bXZsQN0JymQ5JMajh0Y8dk9tIp7zxuHojgJA/3XIdTKPQZ
	M04j2oVydWURn0xGLhr4g8wSywWQqL/q4/TXJBac6xHGgNE3llWYv8ofHxh5RkBLOllo+1HOcamQs
	VfJZ5Fb2mul4AzstPjzPltb/AuBjuOHjadZa/PF84dabTLidhr0aDHuBVUEeDG/k7lQkDFqZImB4E
	NNE03qmERM4DKmaQ3238sDMe/s3ZsJjFybDoKLp20cGwhmtkprs2J7KOkBNwjJjgw/uEl3bCjS9km
	ZEuNboVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPnra-00000005lHk-0eoj;
	Wed, 20 May 2026 20:49:58 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPnrY-00000005lGU-2D5a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 20:49:57 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-43d7730e9e3so3062339f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 13:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779310194; x=1779914994; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mkaEL0dtEh5vLkhnum12HiGQZEgLNqcEhlclJBj/jfs=;
        b=XII2esaYAkeG7vHWEm0n/QY1hTQzAfa1TYpOKRr1DB41UDUSUbJIWBgeH6SDC+bNMi
         XuABfZTgqUXY8p8yjeSKALuK7BnRGfmlF34/UyYh0t0HhlJ+uP91MMzBOUVCWa6dah99
         mcadokJcZa888D4FxVQWh9xqFpDf6jPsjHGO7In0wZ2B6Ah6Ex8diPIK0nSDE5eH4N3M
         hrZSsjAw6g31oyI7KYby+iikAi10TENSa/dUxNA3eBc6GkrlZ4vq0MJo0Ou/dpXoTC8P
         CU51asMgh4ZUp1W/QIPGVS6WGVxYFI86wFHIp+cycnNj88jy6+ypryEUp1h1RVwUawuS
         kgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779310194; x=1779914994;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mkaEL0dtEh5vLkhnum12HiGQZEgLNqcEhlclJBj/jfs=;
        b=TJw+HCTQd5UHZrZEJbrt8sN9aiGyKkXOz1vHuseXD406G07ppOF0B7o5jcBs8P1gkX
         aNCNonmtqWN2u6LtqhNENeXFV7JPL2qf4Hgey12+iiqAyD/G2s8Rr9cvq/UKopvAE/J3
         5oPXJKJYYCLjS/MZyFHaUN8AQ8IrXw3j6s3+fmVvzP2Fl+oWV4PqJLsuqqk+pUfY6Px2
         GIW7bhp5DZiHl09U/8Gn0eOs2pPwvrwfkhopyZ//RvNUOlijALuYMGMTKGW6/YYyWiMO
         rnBoxS6i2kLtH1Sut0/4IgFJfeRVx8N++vGyMqUOFD212lRqjOGp93t2g8bYN4Ndt/hw
         YGBw==
X-Forwarded-Encrypted: i=1; AFNElJ+MSM+afPKVqrM4bu4eOv/vrRRz1vBSg2IAlxFll1s+NRTy0g3FezCUIz+SnNiVfAG6GkGqu5naFjOkh8lCADfV@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+WDHY9nhTj0xsSDXz0Oiw9gZf+7hMuypB5gxI6z96oTZyXysx
	81aghZYd5B8OgKf349PDpCBmQgDbXwNEsfv1hRDXgxQDYbyOLx9AeXMCUXsj3Xs9TZxo6mlO3AE
	z828wzPHHMB3Wag==
X-Received: from wmoj17.prod.google.com ([2002:a05:600c:4851:b0:488:af7f:772a])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a00f:b0:48a:5301:bb5c with SMTP id 5b1f17b1804b1-48fe63263dfmr421319785e9.16.1779310193872;
 Wed, 20 May 2026 13:49:53 -0700 (PDT)
Date: Wed, 20 May 2026 20:49:44 +0000
In-Reply-To: <20260520204948.2440882-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260520204948.2440882-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.669.g59709faab0-goog
Message-ID: <20260520204948.2440882-2-smostafa@google.com>
Subject: [PATCH v4 1/5] optee: ffa: Add NULL check in optee_ffa_lend_protmem
From: Mostafa Saleh <smostafa@google.com>
To: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, catalin.marinas@arm.com, jens.wiklander@linaro.org, 
	sumit.garg@kernel.org, sebastianene@google.com, vdonnefort@google.com, 
	sudeep.holla@kernel.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_134956_570390_6CF06F20 
X-CRM114-Status: GOOD (  10.22  )
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

Sashiko (locally) reports a possible null dereference under memory
pressure due to the lack of validation of the allocated pointer.

Fix that by adding the missing check.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/tee/optee/ffa_abi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
index b4372fa268d0..633715b98625 100644
--- a/drivers/tee/optee/ffa_abi.c
+++ b/drivers/tee/optee/ffa_abi.c
@@ -698,6 +698,9 @@ static int optee_ffa_lend_protmem(struct optee *optee, struct tee_shm *protmem,
 	int rc;
 
 	mem_attr = kzalloc_objs(*mem_attr, ma_count);
+	if (!mem_attr)
+		return -ENOMEM;
+
 	for (n = 0; n < ma_count; n++) {
 		mem_attr[n].receiver = mem_attrs[n] & U16_MAX;
 		mem_attr[n].attrs = mem_attrs[n] >> 16;
-- 
2.54.0.669.g59709faab0-goog


