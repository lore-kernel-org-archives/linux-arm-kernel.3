Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278AB1061B2B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 02:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ilhcaIS/tbQmsg6PWjrfVpOQh4yyfAhJzLT1EMbVKSo=; b=kZ0Kn0mpvApb/VChgY6yyRjPAy
	VIJ6b6G5YLTWnz9QRqQKjNmSFwEslhNpi7w8ptrOj7/UEe5Qe5S2lS9nm3fGo2frISHu53YaGyr7I
	t0PEt82HsEHKqnDixwM/pCxtyLrG6qXCz6TQ0be0UEGTDfVL+MYeiO72ctun0DvgsKhUd6Cljoct3
	FJeYejgkqNtUcFuVag5bWITLrevm69GYelAYLlcnJElzPal11KBIjZBehFSX/dj+1KCf+rHOk8xzz
	k/PF47wNrVqXubQ4ytJttMCLqHidVuxsejEffFYgYIU5lmDhziw5Xgxg7t0egGRQz1PjZyY1axdN5
	tdMcFsoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7PE8-0000000CCf2-1enm;
	Tue, 31 Mar 2026 02:53:12 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7PE4-0000000CCeg-13cB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 02:53:09 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-35d8e548a05so3237864a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 19:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774925587; x=1775530387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ilhcaIS/tbQmsg6PWjrfVpOQh4yyfAhJzLT1EMbVKSo=;
        b=fqd6sHuJc8rz7aiOXRwpbXosqcyM9x67ZZTWfYleYBtlFlljdVC5wpFrn+5grJTzBW
         G3UylNGylOCCdXJu4hS2hxI0qCV3tQWNDPyz6bAHBgArt5QBKOgX0nYzZvN8bvN0e4Q2
         BEFCK4QiL/Rn8t3LVElQVCsrg/Uj80PIEDH+OPN9i8CfXBFKddVPRjj9Jb/JOPcV1rmO
         SuYARJ4XubESYHSqtiT3oNZyb9x26+Mza+/WxXRM+J9iGibAThT5vVsbXwmFvCsY12E8
         c2YdGJrkWI9PO5rmwSANDQnXUG9nxuYNDmtv8UMwv8LOh2m7fVtdcUv17f0nN0wtIqEV
         0txQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774925587; x=1775530387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilhcaIS/tbQmsg6PWjrfVpOQh4yyfAhJzLT1EMbVKSo=;
        b=VmCcy2wzzWrHI+5NWKJBA4n2FaC8mmk8dJUOxQTjgKieeI33QPkFTXRGwYSskQ6W3g
         KhgPh5dTyfzX8B9QSyntjnFo4MMpxLPDFywREcEllb5gAcGH0SJLSnVHrABVZXweL1wO
         /o2/eBSonVPHoXDaegrhn2qZAF/kuzq1iENW6vp/r/bD2q+XoQvCjPngP/LwWf4eE0sL
         F2CxMquA56ebVaKLqgpCYpOTZG6UH+wllQAAI/HekhgWV94R58duhdRiMxSETWpshXVQ
         GibLohFy+uvt2bT7kx0cxz3zFaLSdsMyIEwukRTQ6JYDq9GshaDh/KuHfT3IMwsHq7hb
         gbiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdbd6Q6tGlZMpxep+9LAxrusrqrC39PdAVVl+kv6g6/ThGiVOJhzYDNCZcTAD+1wIrM66Kpq9buJIBG/2NwPVK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6v4PcLWtchYy/k6L7S2XCGhWwbB8OwqeTI5u3E0Pv8eVH8RQn
	5u3JoeZTzUUkOtvBQAMW02RaKVAv9ni+0Ygi02MScpG9OndFDp2z9Fq7
X-Gm-Gg: ATEYQzxpeSayJ6lButOgtaDjtqkMl61Ar1DAxOz926C7ocnkLeCXobahwoMcWjZPbsn
	UYVBY0hkfVH0IXW1hkLsGS3+BmHKd4qDGk4NlnD9359wVd7YuUNXNp2b/qIGwpNfEB2MBpw/rEm
	HcDpZ+ZAX2t3bruxrUXGbwDcVlSuQMtMVi1SIrZWYF9gioE1liQhH5GcW4E4I7waJyfusRiKG+n
	NEn0rM7Lm8cfO8Wd1Aj3gVSEGamsSep8h1Ja/2GxTr2ekbg+Yl0Mldzh+OhVQvQXW1Zqq0Jwq//
	SDJulMObMAJCied3iZkFpX9Epfburrr7TXcRjl+D5ZDJU984JKuTvToYA3QSga7LZkLdqQCxk+V
	ZrScfH04Vzc9hRIZxvqtcAlAgF6CbZoMiTCNRydQRK9wg3z6q9OfGRCZX6FI0GXk1rPuxcceijU
	TD7/6ZsGtJ9SR+T081rVs+o8JjABiXKYrPuK01v1xgt+My96pLjJ+Gww==
X-Received: by 2002:a17:90a:710:b0:35d:95eb:879a with SMTP id 98e67ed59e1d1-35d95eb8b32mr6542247a91.13.1774925586915;
        Mon, 30 Mar 2026 19:53:06 -0700 (PDT)
Received: from ZC-202510311500 ([61.185.217.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe66fb67sm4887a91.9.2026.03.30.19.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 19:53:06 -0700 (PDT)
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
Subject: [PATCH 1/2] acpi: arm64: agdi: fix missing newline in error message
Date: Tue, 31 Mar 2026 10:52:56 +0800
Message-ID: <20260331025257.463-1-hechushiguitu666@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_195308_362493_BB87BF7F 
X-CRM114-Status: GOOD (  12.70  )
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
Signed-off-by: Haoyu Lu <hechushiguitu666@gmail.com>
---
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


