Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFBFCD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 15:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYSPuJSk3QuKc7sf14ipiOObeqdt7tBHKRBi5y5X6HQ=; b=ZoUCuIGJa9EycwerZGlwbcqB8M
	up6vGxlmVMGUZ+7cIc4+jBRf5aPMD7x+IUOB1aN+5wp3BcZOf/hzMZuGJb61SOX4FdChgOaSTumg/
	iYyfuk8Ihx/T2+RrL4f9k+uiutVS3yOA6WvhuG2xdCS3HY/2FDHZmut9Gx4yaDBZoTDki4JbJfW00
	ZpctXUgFFPVKYSsxdgrLnD/5pwkOwTtMmgl6w7zfGLTspNA9/E/1Jd92B0B/YV0EZTm3COfKK7aNY
	sA73h67r87kcZWrfdkf+cDmFha6/05clWKPpqoIOolNGi/LXb8ZZJLwxqZHVnPuOfpWCfKgXI5k8Q
	bPJ5i45w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtZO-00000002LXl-1AHt;
	Tue, 26 May 2026 15:19:50 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtZM-00000002LW3-1bjh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 15:19:49 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-bdb96f6cb84so214011266b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 08:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779808786; x=1780413586; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JYSPuJSk3QuKc7sf14ipiOObeqdt7tBHKRBi5y5X6HQ=;
        b=UjndDgK9PX333AM3fYJHFsHXXmySYYYZAPbNLPh8vg+kiwLI6R8NVE64EhnmGbOjkC
         CAafqGwVL6ACaplFiE9jSNOOphfLJxNiqBtzcuvI+H9u15vQgJWiIl5pWzgfZxteC8BP
         1pEpnkaQxStdH8hkZJtjkjToV7YTuxpHcISAFz/8lww5j0XnDzAkyDQtOlOfgt7R87e8
         lC98Oz4ykxpu6WhnPvn9weSkPInNHWsZgs2rFMV1vNlyoqC8f1cqoqGl0/zuiG9QsOvp
         E+AqGb5nQIUaxa0ALw/xGtGiwADYOWTynyZ2aMmaarTOyP2Lid0SRkNVjin1xRbH8/bp
         3hvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779808786; x=1780413586;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JYSPuJSk3QuKc7sf14ipiOObeqdt7tBHKRBi5y5X6HQ=;
        b=QpL9U9PIQ8vslpAFwxzt7KxDYPbPtcXMuSG9e9iqk6v1l4KEYnI6pZYVt28urWxDyo
         DcY2LH2Rmami7YNIlqCen7JsL+A6QgXjLQ6iPdKCsFXHaFpfIgnXXV3hpk65I0zTUlF+
         HrH1jNMimqw+ZUWPtxawF7ED/6WxT9y8KyJ10XXyhd4H2R9dB69v2/IMQaHNfPf3h8BN
         pjWPvVXPUxbwhBy9DMoc6GFab8Yxx0f1bJ71DUgqblZNBflsOB0IiYzwJQ0ibArUlKUc
         438cLjo+I61pDBksWJRKbAZSU32ZBU6qb2B8NI3HbqmgAZh/8wjc/RNCIXxIOmzt5FTY
         zjFQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Tq3r9AaBCo7EvKZ8Iv0twkEfZXflkZDnecGPuQTLXLGYusGBihG+VgyGpikdjluJTg98eOjrBdLh196OltOZf@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe6UJf02R5LfaY0kuJHmpcvue8vR0IybCnJfYu2S0YabXOFi1b
	FyGNsWnL8nrleRbkQxFoD8udJJy63sV5XhszVf2uV3S1u1BPDJk318NsmtBUIx6BXIKfeQt2X6b
	qeDblDqK3d6bhvA==
X-Received: from ejki2.prod.google.com ([2002:a17:906:71c2:b0:bb7:b0ba:e7e2])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3f1b:b0:bd3:6ec5:f141 with SMTP id a640c23a62f3a-bdd25ce1b65mr1107073466b.30.1779808785644;
 Tue, 26 May 2026 08:19:45 -0700 (PDT)
Date: Tue, 26 May 2026 15:19:29 +0000
In-Reply-To: <20260526151934.3783707-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260526151934.3783707-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260526151934.3783707-2-smostafa@google.com>
Subject: [PATCH v5 1/6] optee: ffa: Add NULL check in optee_ffa_lend_protmem
From: Mostafa Saleh <smostafa@google.com>
To: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, catalin.marinas@arm.com, jens.wiklander@linaro.org, 
	sumit.garg@kernel.org, sebastianene@google.com, vdonnefort@google.com, 
	sudeep.holla@kernel.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_081948_427083_377F6C28 
X-CRM114-Status: GOOD (  10.04  )
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
2.54.0.746.g67dd491aae-goog


