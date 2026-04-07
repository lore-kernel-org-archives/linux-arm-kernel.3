Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D20FB5189
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 03:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qitX+bmjkd0T/W6dUmvnjzgJU8do1YCVLzH8yn5LDV4=; b=sLCPWRQ/wxUHYYUikIVsIjkx3O
	kY09ELtUsE9oi/Qzw41LQa9AuxckArUiQQsdg+phrbLM/yxraJgkdBSXpIGevgg5yBeZaAxDABe5D
	lh3dGUdr3MFRlGEJrt+X/HyKJan528dmck6lYTamYjHvuP5Yd/bJBy0YRmjL3aER1/HBhxs6od5bC
	2zCcUzQ4rzQTxtpfYPnuAHEF8WjQ+DCA54bb/kdhk7enAw2vYSPo0NSeYVwjYj2lexNhujB7pWgnx
	ScnQI79oTWfT3DcO9JelK56Qcus3jLWLK8oGY4LTLNTDa8zmlNJ1jfkza2Y2APtRFXgVd5sgwjBjH
	N6lBJIjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9xA2-00000005pbl-2bc2;
	Tue, 07 Apr 2026 03:31:30 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9xA0-00000005pbO-2ZTv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 03:31:29 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2b258576d8cso28820125ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 20:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775532687; x=1776137487; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qitX+bmjkd0T/W6dUmvnjzgJU8do1YCVLzH8yn5LDV4=;
        b=ewL0lp+HIj9NkqY9s6CerCfws5nbmYgYxsGFjPSOoWx1mYzy/hM2GVT7Zvk5ZdrYln
         vyW+fk7gjEBCPHuy7PrR4JPB41w9K3Ag3SIqZbpz584t7mre+1wIWs908qmPPUlYBIHy
         Vm3rSKUrXKE2d51nmSATxJdllBuhPba4Xgf0LuBsFkELyj86duiw6UZ2fdaxOHw/vFsw
         fDA7p88oixfOo0hC0x7CAxtY25nniDvIxFc63cSoDJQ2vTeOJjHRjrIfRgSD0xWaeJmk
         HFbnl7qvWtBduhsOxcyP4l5yMG+sHBrtIeLupiEXBzyvSCwENsyfkJ3m6LrxCErQRUif
         JJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775532687; x=1776137487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qitX+bmjkd0T/W6dUmvnjzgJU8do1YCVLzH8yn5LDV4=;
        b=fj2xW4TiI5kPuyDZ8CcnCCUMa6NjTC7CKisvvPLkBL3mXVFCM+mAs4Yw5Qw6crQ8KF
         dLTPN42XBFcYCb/mjLwIXQfpf3Ng8woFQakks/oC0kazq/dCcnPOdo5w9cBfxGeGwnt1
         tZQv+/nb+zvT2BTD2yUF7dbi1jiUZZ4EBUIypRbp1ZrIibN/q37KrIL8Gi+BJRiQFecQ
         LYRU8TN1hfRG5bH3t1ae8btZhE3RTgPGyclckraz4r+NxXj7tDmUkqPWRnhceLxJWddp
         V/bUZ2rUOSTXy/C8Lpmz1sNCFESMSI0W2BSUeJ+P5VEMi2S5JYZlkjbqZ2qEZ/M9zyZu
         cnig==
X-Forwarded-Encrypted: i=1; AJvYcCV/uRY1cO28f0LtMEvxR9W0bUsmo8wfeS/8aAyA9BZSpw2Hic9wavRMhOAFKQGU2ELeFMj1WxebOPMtmdWrRL8y@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt6HB6Bl+JfFWNaPc7CLpSiGzHlIcEMq3qnzMFk9NpDHvpLMqk
	RGWEPXBZDNwxNMfT5xrMTk4Q6hfKIg0ZQVFi9ic2vON0zJJr8Aey6n8I
X-Gm-Gg: AeBDietZMgyjPntAZ9nZ54urH6fy4/pLbNjHZuP4zMTTa9RhncjS7xOO87Ea2/YKOMb
	ZkEd5ima3JOIF1tYqi13j7B7pCBcWQXg9bxIHNy6tE7/3gmvEutLXkUP59Z87s3CcdwBo3HsDQ/
	x/N+4RR6ymSQfWhhJZtNDc1YOIRwg50alp3oywBSylePL7Q4pYSNMLpDERBM3hfvGKxO0p3iItg
	qVftE1auaS5rPbGhuFpMLWNk8ssaJjbrXZGYWgIjGgBMGdVVdAvQUbAkqzyX7qiCiYaJ2bgMJcK
	sIF8WHMzUhcqUsVew5OK3Qbqg2dOq6OGKKkBE1jPlRKfOYqTYkWrX3dhOvbxmiXmBuZ+xNvcsTJ
	6NUmfoBA93oTw5gZOT2U760JL8shDymUsHNrTGpFgK5/y8ON6mW1IZl4qpa5Arrq1pVt40a4wE2
	8pvmkTmu37z0FK3o3y/TILwCkydJVLrKxnRQi/dRSWT16XXVuSMB8TvG2b8Vx/iLuz
X-Received: by 2002:a17:903:388f:b0:2b2:4eec:980b with SMTP id d9443c01a7336-2b2817d87e7mr175821175ad.7.1775532687280;
        Mon, 06 Apr 2026 20:31:27 -0700 (PDT)
Received: from ZC-202510311500 ([61.185.217.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2adc8c4ecsm9003145ad.5.2026.04.06.20.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 20:31:26 -0700 (PDT)
From: Haoyu Lu <hechushiguitu666@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Len Brown <lenb@kernel.org>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haoyu Lu <hechushiguitu666@gmail.com>
Subject: [PATCH v3] ACPI: AGDI: fix missing newline in error message
Date: Tue,  7 Apr 2026 11:31:15 +0800
Message-ID: <20260407033117.100-1-hechushiguitu666@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_203128_701408_C6B3129C 
X-CRM114-Status: GOOD (  12.50  )
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

Add the missing trailing newline to the dev_err() message
printed when SDEI event registration fails.

This keeps the error output as a properly terminated log line.

Fixes: a2a591fb76e6f5461dfd04715b69c317e50c43a5 ("ACPI: AGDI: Add driver for Arm Generic Diagnostic Dump and Reset device")
Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Signed-off-by: Haoyu Lu <hechushiguitu666@gmail.com>
---
Changes in v2:
- Change subject prefix from "acpi: arm64: agdi:" to "ACPI: AGDI:"

Changes in v3:
- Move version history below the "---" separator as per review feedback

 drivers/acpi/arm64/agdi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/arm64/agdi.c b/drivers/acpi/arm64/agdi.c
index feb4b2cb4618..0c2d9d6c160b 100644
--- a/drivers/acpi/arm64/agdi.c
+++ b/drivers/acpi/arm64/agdi.c
@@ -36,7 +36,7 @@ static int agdi_sdei_probe(struct platform_device *pdev,

 	err = sdei_event_register(adata->sdei_event, agdi_sdei_handler, pdev);
 	if (err) {
-		dev_err(&pdev->dev, "Failed to register for SDEI event %d",
+		dev_err(&pdev->dev, "Failed to register for SDEI event %d\n",
 			adata->sdei_event);
 		return err;
 	}
--
2.17.1

