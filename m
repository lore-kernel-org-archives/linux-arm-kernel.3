Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54524C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 18:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WTaXNCz+u/KtBO7bBU1VDH/lYm/1KJNlXPOVs0ymj2g=; b=Bpi8xMmlMuFs+zAalNows87Uss
	pO6OA7pJtFwoRilS89yXAqJeDonaE9TXs+KkRHZHQ0RgqueXh0urMV/9G6sXrh9VDqvbFPKSaYlfS
	7tZvEXzlxa2vcB2LqOcuiqt7UsU0v85zoRlqxtDItohhkBmZhDSZ7VuXoAWjA8qAVkImz0EFNDW6q
	hdL9eDrCNYRmECZIuy1bMfvUI1qkTx7/AZ5YQUYUq1Lc6lcHYKnREd+BzVkHtTdeH8rQnlBt8Nm8s
	V6tKBQb1/0Hurq7dN5ZBdtZaYwkEPEAxcNtyF2dbajTgBJP/lN1b5MgqPmphfGZSbZCj6o9H9zfuc
	ru36wBDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7GSw-0000000CASL-3z8D;
	Thu, 17 Sep 2026 18:04:10 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7GSv-0000000CARs-0YAw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 18:04:10 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so11969785ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 11:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789668248; x=1790273048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WTaXNCz+u/KtBO7bBU1VDH/lYm/1KJNlXPOVs0ymj2g=;
        b=dgJGU87VFueeQ6RSoB7QkAq269H0Wb+QUDg04YEI05YpRF37dGuPkKTKkgGNDNWMTi
         PEZ0DY+Xl2iOHoe7yU3mZ4KBc8PeepNG7ZLydyV+arXR+7nS4Ek9VXqZqge1HeEpar/8
         uGpBJ4bZ6JoJOLpzf+oNRvYZtAN4LMgTUlYf3+nrPOZs0j3N6P+0f7Pwbf2/EDEbS5ai
         VQlfD+zLCYm1tXrny3bhjH93l0F5Jy/IX3/rhAgyRN+7fPY/nfhc50sCNxAvV7OzAVpK
         O2Y3u/iipydl4PxF2IOWM/zET8rR2Fo/WdPTbEAPVUfHj4B7DUeF90lOxJjkFCzUUCl7
         c8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789668248; x=1790273048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTaXNCz+u/KtBO7bBU1VDH/lYm/1KJNlXPOVs0ymj2g=;
        b=g4pcKTku+1AKQuPbmcpu2gtIGovGk8sri2qItsuVBu7UM4yTyRYRnFCGw+1PSr6jlE
         61VPfz75mAvvCFBCgcJYTgBy3RwMB2S3xZr3G0G4fJkaZgxTEWu0rPWWJx9hHWYarkR6
         NJInd/MND8nne3XtkVVf6Z+eEKtqL6c5LR+/gtxaUuDxxE3502PpC4QF2HcXWUtfPHWv
         Sd+r8J8SYl0TkCMQJvgzq9LXAJ9nz6X40Ezz4kFA5AcX/mKBcWREwd9x4qNKegniEx5j
         LPCYq13DkvGfBZL1O/E8DuxSeKTSYVTw9Q/R2MmOMay1hWL58u/3r30WMoUafuQ543zc
         vbJg==
X-Gm-Message-State: AFuF++kOp9DSE6rmdsl3MHIXH9bNL0Yo7rKdHqXinwyDGSxqGP66GvQW
	PD1kSoGLme4GdBCnRR92wtSHs937iuyXDdq/+qtcD8Hn0jT9BH43F+PS
X-Gm-Gg: AYBFou3l0sDL2cgOpRSg+EZYQFb1yPD9x+raFygPu4YWQpwV/SVE822XjWqp9VUG5yU
	dkQ2fpivWmp0dSF9cpe+A4aNzQ3z6rcN9NHWwyLQKXS2m1z/du62aaKSuE6XDpExNwSUNkvXdrD
	03FXgTkaucM5Ejh1im5FjulzaU6M84H9DjlX9dVeI5ASz8XuGbjOyIS4bRlTrqxRY1yVWsLKTtx
	vSZnJobCnhITNo9x9/eyCyvVS8VQpvecteMAyjvUQNBhcx1cDDs5t4OO3xgGOwcFdBN8uJAk7+e
	8v++d2WFVmhKBNNB+VXh9opYu0xN7lGHMWGVT1LLN7ZxxMcS27lNw3sZjGCeyEP7T6mRhZNmRfx
	0clWRexUF9LSJzHenp8TWCa9ZmIwjYSXgB58/UNs9td5bQ7Pm209KMULZUFEG8CeCJaD4B5iPkL
	jJJhyz0d7qWmUDtUYt5xtX92hAhaSQEeI/ybkWzI9qcnDjUoCWNZjpG7JA4EnldDGYY1kHu59dE
	6FOyMBzy2i8YC6ssreStyfTkUYV6DjSNcKPVrnwae6rVzC+S0KYJwoiyMVI9IOlEFqd7A==
X-Received: by 2002:a17:902:fd83:b0:2dd:ad74:6d12 with SMTP id d9443c01a7336-2ddad748f03mr21198015ad.24.1789668247846;
        Thu, 17 Sep 2026 11:04:07 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:455:c3eb:633c:5d3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89eff35asm30446485ad.58.2026.09.17.11.04.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 11:04:06 -0700 (PDT)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH] pinctrl: gemini: fix kernel-doc warnings
Date: Thu, 17 Sep 2026 23:33:25 +0530
Message-ID: <20260917180339.49882-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_110409_166884_05F5AA0A 
X-CRM114-Status: GOOD (  12.76  )
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

struct gemini_pmx documents a virtbase member that does not exist and
leaves pctl undocumented. struct gemini_pmx_func is missing num_groups.

Drop the stale entry and add the two missing ones. No functional change.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 drivers/pinctrl/pinctrl-gemini.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-gemini.c b/drivers/pinctrl/pinctrl-gemini.c
index e9f619278..a029cab22 100644
--- a/drivers/pinctrl/pinctrl-gemini.c
+++ b/drivers/pinctrl/pinctrl-gemini.c
@@ -41,7 +41,7 @@ struct gemini_pin_conf {
 /**
  * struct gemini_pmx - state holder for the gemini pin controller
  * @dev: a pointer back to containing device
- * @virtbase: the offset to the controller in virtual memory
+ * @pctl: the pin controller device
  * @map: regmap to access registers
  * @is_3512: whether the SoC/package is the 3512 variant
  * @is_3516: whether the SoC/package is the 3516 variant
@@ -2031,6 +2031,7 @@ static const struct pinctrl_ops gemini_pctrl_ops = {
  * struct gemini_pmx_func - describes Gemini pinmux functions
  * @name: the name of this specific function
  * @groups: corresponding pin groups
+ * @num_groups: the number of pin groups
  */
 struct gemini_pmx_func {
 	const char *name;
-- 
2.46.0


