Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CCDCD6E46
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 15:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7J1ztb6Z4HCTvPSQ3KlFjIJDDk9HF6V81J85Mqd8VE=; b=r1R9fSZsCtY2/zpj7x7cLDvwIL
	k3LsQhuhioguL3Tb0HWo0eKorZQuHIyODS7vmlrqa77gvmvYTR5lEe77cw29Go/uwgPK3Dpz9Dx1c
	K6Sg1PsU9qgC5r8mur9mH2B/Qgc0bsnWGdns8HCx1i18O5nE0AjARPsLR9tlS6oYtYgLEUGrv+r3M
	f2giNtKuuWOycJlljUEW+IXt0FtePP1ihEh0V8mzGWr938dygGfMXUdc7MTKiQ6oUAvEVH9ptJLVP
	14DT0a9/1Crz3hjtS9eeWDMacq3PI/McGcJbUSizy+qTi2LC2NrmRBiw5iy8uXqF4sDTJVcI+MlB5
	pBSZB9+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFmT-00000004MBf-2usH;
	Wed, 27 May 2026 15:02:49 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFmO-00000004M7G-0PE6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 15:02:45 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48e79219704so81727705e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 08:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779894161; x=1780498961; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q7J1ztb6Z4HCTvPSQ3KlFjIJDDk9HF6V81J85Mqd8VE=;
        b=gcCOnIPF8KiHsmg5Vwvxu6zjAtvYqUH2EAhSTey89lOQ6+Sji5abOTeTZ0sECDQ78S
         WFMha8jqpILQhVho/Ugj3vtGk2usZL1aahyf+RNI2rQ865Tj3Nhkso8mk42NwnrMsQ83
         LOJREYKfn7qPUHKqHI24wPuvHW8WnWE5ru4Ct53gCD8D7ZSgJ+NsAnxneE81ad8U3TaV
         u9JEfa+XNnRMSdwBPV45XgOzYfz8uJdLBrqcgQOeWlpIiIiolcA4g3crX1mmfNglNHpx
         hdCkysHcMyBeS9KnAGuVutrFcTfEJH8O3J4FV8jQLqtVu3bCrhvtB4e3IM/EttGnQukF
         FHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779894161; x=1780498961;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7J1ztb6Z4HCTvPSQ3KlFjIJDDk9HF6V81J85Mqd8VE=;
        b=FZJ4HZZA++ZDU/IArewumfo+uLgI6eHN2Gvw7hu/JpBhzh0ugSBWuMl8yBtfSjrzbb
         0YYdInnBrLCeDX1cCUSzt/1Rj8fjQ8dKJw9pnGAv2QPrvgzlftGuBo4M68TUGa65bbAG
         1QpDVDJRU/xAbdHOBV+ZejSMz59JN55rWTs06ppjo2l+f8ZoD78pXYHcDqjjuFQlFsD1
         FScO/bSb37UcmELJstk+wiLYLKn7+iKdpAw4XfXABzbKRoM3o0pogBK+JPyKh4iO17Pj
         EVSxe8Sk5gMo4N5ffXno9NoNXU8FlQtNRO1jZM0eu8UptvDWHbwaAXfQYSYBBVRDOHwa
         4TPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9uucGqZuwDvdrpCEahaNPYnnsl/YwKOoqUGoEOF6pfwNPMyW3y2imgXiRikGOm3Ygmb09RLa8lzJec80sMDQRl@lists.infradead.org
X-Gm-Message-State: AOJu0YxkY1ij0Im5kqtKTfuHMeAbF3euCLlse0iz67x/APHDkBDmgwfQ
	rWrfvBTfzxkUOdd9nrDfkUwn8ycTY0psZMZijNyLAO3un4VlYpuIlatQf/jP86fcObG46whINdZ
	jHkMYaaKDuAYoyg==
X-Received: from wrrj16.prod.google.com ([2002:adf:ff90:0:b0:43d:2d2:c03b])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:530c:b0:490:5527:3be2 with SMTP id 5b1f17b1804b1-49055273be6mr302305885e9.32.1779894161027;
 Wed, 27 May 2026 08:02:41 -0700 (PDT)
Date: Wed, 27 May 2026 15:02:31 +0000
In-Reply-To: <20260527150236.1978655-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260527150236.1978655-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260527150236.1978655-2-smostafa@google.com>
Subject: [PATCH v6 1/6] optee: ffa: Add NULL check in optee_ffa_lend_protmem
From: Mostafa Saleh <smostafa@google.com>
To: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, catalin.marinas@arm.com, jens.wiklander@linaro.org, 
	sumit.garg@kernel.org, sebastianene@google.com, vdonnefort@google.com, 
	sudeep.holla@kernel.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_080244_139771_68C8DCDF 
X-CRM114-Status: UNSURE (   9.96  )
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

Sashiko (locally) reports a possible null dereference under memory
pressure due to the lack of validation of the allocated pointer.

Fix that by adding the missing check.

Fixes: 2b78d79cdf96 ("optee: FF-A: dynamic protected memory allocation")
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


