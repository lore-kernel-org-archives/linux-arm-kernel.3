Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B81810F9318
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 02:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uU6xSYE0T+TCq9LtlZpBqruvjiamhGaYf3vCeGkc/3w=; b=sMt4YDUjgN+83fwmDdl1PuiD/x
	WJqalIYspuBDqnmM6J+jaZA8UpINYXMYjJQhJ+Pe5QYCBPq0wWeCoQxywrHMNwLOhbx3I5FDZbiex
	7eqRlubO4WCR7j6ntXjJZPpgCta6XsOCeI68xZ2wdGAervD86ujvxuXfSZ5nH1omNVOzacL3oAeDq
	6JPVaDoIB+DsQqx6BGzzH/MtJccRGHsmTG6hPVvjBrra66JEwGZk9s+n6uklSve4hq+VfF5YMeYQ/
	D3x55icizdtC/bSOtme+k6Zb0SAQMpm6UdTKOF2199CKZrOxK2Zl2dawe5pptBeq/eKgGl4oLwhQ1
	CXc8n6Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7lLP-0000000Dqb6-2l1L;
	Wed, 01 Apr 2026 02:30:11 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7lLM-0000000Dqaa-3u41
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 02:30:10 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so61539835ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 19:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775010608; x=1775615408; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uU6xSYE0T+TCq9LtlZpBqruvjiamhGaYf3vCeGkc/3w=;
        b=fFS8tpnaRm2a8o32FIt3liJ1Xq2ElUB/KHDf1z9hFn+fzfoUq25WX6Pm/486KdQ3+C
         zL5kfeflgm996sJ+/p+Kyep1oj3fNThz0gWZ219zuHUaYWx41IpAFkZ3yyu34VIkSKEz
         IZEBESv3Q+ixfA8K9Oo16PB5TWaBj7YIZzT0v1BKRCGHtuKDZHcKLQL8TgPCSmhAhSTl
         KMk1a/hjE+9cDuy163KpmhfrlBUaU4C6p5xxiP3hLT0bip8Guy9S3b/z8gB3uFDfSl5d
         XhmyTMwMY7HKc1f/IYgCjlqelwLD6psvtfZRkXj0eVTGyt3M0NrLIKB38tdBt1XWbUrJ
         6nVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775010608; x=1775615408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uU6xSYE0T+TCq9LtlZpBqruvjiamhGaYf3vCeGkc/3w=;
        b=j5xVKtJ5954bB42s8vAjMsnyEYrEIZ4ivIPiGSVsiuQ1N6iEpALpQ+lCrEl0CDaQz5
         4hgAr8ZqcugA1hcUiigiEZDA6RDBnwJJpDjbyREjkqdlVJtKgjxUO6wJ+X1yvsskDBBl
         xtjck2llXK6r8ca3iDsoqHIAbRN2k2tA/fFySPS9Cvw8J+mZ9nvf+uAyyyBYkbzBcEfm
         8KPq1qBY6tBK6E6rb6XvA1gDVKbphAFjDnl+iMbP6mgwdTmKKjcq+rmjnJ6t4RYxFJ8S
         /Tyknaeey20oea2DOISgVggVkbYYSqfFYIbeG0FFo1C3xwxqrb6Ly8Wz9xVWixxML0QR
         IwPg==
X-Forwarded-Encrypted: i=1; AJvYcCVYWXF8FjyqKp96k0q/t4yQWGn7rzNXZ9PS1eonWleAOLriUqvFO/g4U8WSNg9eYvYajiynklQpJtItrZy/wHEm@lists.infradead.org
X-Gm-Message-State: AOJu0YyZpA+0tacJYUeTVEucWR1iMjcACGWcfX/qtfz+qc4duZTG/12E
	3LN6zrCwexSmX0destFvjRgCo2sfhBqcTGS2DYPQY1fNKYPO09mgpyg4
X-Gm-Gg: ATEYQzzRdXT72Q5/I5pFx+YWVGIa8ZeTJ4uGyEFqs/Tt89zqhUtg5QdWh6bcUU6JNwK
	vpMTT7D1DR0jAlwETySRh/z2liq5VBPajtbWuzPmG/cMK/NP4fb9ADErhU8P8x50WJJ5RvmI+R6
	SaaIirTkKGsiMOqxMa8wqTOBuAO23znGHF2yEnbxkpbNhAtYvKFjwVomjXciFY7rHe6tV87oqE5
	Mpd1ThyVMPB5zLCH0KzQLuDnun5uWEhdJc/368BHZuzs+1ZmxWCEVh6RR2hhVzPEtWkFbOqgf+5
	/aQNDT9FmeIz0K1Ektellhsy+iWRf5nYZPe+wc+8ybRctMx8UTP7fR/PdRuw1ymY3kfXXznJumU
	QAbk6gTgWjPMolGpnP/SZDHQaHDXf/YxOFNOl5rVcGOVm4jzSu0gd6ZxE6WtP0PBxhAnojEdETR
	pq5By3xzVlfm/rPRpp/mvlqOBEiMsL/J4FOnH52NQhTJt/7VCHdDs=
X-Received: by 2002:a17:903:2b0c:b0:2b0:ac1e:9720 with SMTP id d9443c01a7336-2b269cffdefmr15058905ad.23.1775010607797;
        Tue, 31 Mar 2026 19:30:07 -0700 (PDT)
Received: from ZC-202510311500 ([123.139.39.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b25ca51aefsm64331575ad.16.2026.03.31.19.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 19:30:07 -0700 (PDT)
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
Subject: [PATCH v2] ACPI: AGDI: fix missing newline in error message
Date: Wed,  1 Apr 2026 10:29:56 +0800
Message-ID: <20260401022957.611-1-hechushiguitu666@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_193008_978164_F8564A48 
X-CRM114-Status: GOOD (  13.36  )
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

Changes in v2:
- Change subject prefix from "acpi: arm64: agdi:" to "ACPI: AGDI:"

Fixes: a2a591fb76e6f5461dfd04715b69c317e50c43a5 ("ACPI: AGDI: Add driver for Arm Generic Diagnostic Dump and Reset device")
Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
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

