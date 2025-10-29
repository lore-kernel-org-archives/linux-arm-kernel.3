Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6E0CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 16:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8XbRLU+7LExsM1Q2W4kgKdkH4Wh0K6zsU36k2L5dwa0=; b=hYBT3ObfH9PDrlUDhl/zJvr7k7
	5zN5kPvR/DYThefZxYFKXvXt8kBxheewPC2IYr7THIOVNyEQiTh1YI1XCvOf0qR3n212MemWtxFuV
	mvfZx4tzrLnI2eeAzgCz5CqHIIXrWOgOkD8rsU8DH2hH4Wm+yPL/rdQT10aUR1gEUljEPX7XfzyLY
	oLz+tIQilYCSs/VBf8X4mmt9wHCnIbWvBTOzfSPEPPj6iVpQwgHQQlqPdetyDf/6vxB8hREqFCLwd
	Ck948l095YKaRtINLbVEe1veWiwT65RCidkIf3VKR2FPyTXsig6yRiRSPTx5uuMZXlVZOi4V9uWId
	1sXD9xXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE97U-000000021Tp-35Dq;
	Wed, 29 Oct 2025 16:33:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE97S-000000021R1-1hmP
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Oct 2025 16:33:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8XbRLU+7LExsM1Q2W4kgKdkH4Wh0K6zsU36k2L5dwa0=; b=AxiRrufY/u5usfGRgm9OUCRIg7
	0cQCeg90wWM0s6Qh3Ga9oMfwQ6vJ1WJZJd/Zjhh5+dnugOM+x9IND3XVs0nYjxlsXoZD9CUez3ytR
	vSEVKE3sO5XNKud0Qlv3rTyPP6hcx5ElU/qQpOy1Yi60guLiTtxDkEKLltKfYnLiprbix9JRzI1zR
	x2/WOKLHf2CIikiA4hHg8rznvNcQxq6i4aH33LU3AF+bShWIEk1zu+azmMNNZLpzLKxk5bM7Q5xl5
	phMkV/9zYnGJ6ysDf4HMUm262TbPvM1/WaDB8yhB7AvOV+8c8Gs1tK5mnTAVg3CJypqIvXdFrYUNk
	xuiyWQNA==;
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Ff-00000007Jcs-47H6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 15:38:21 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso15654566b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 09:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755630; x=1762360430; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8XbRLU+7LExsM1Q2W4kgKdkH4Wh0K6zsU36k2L5dwa0=;
        b=L1NHXzEbIyLE6ugFSjvgBcEOiE+jad0M4kdkp9pfSg8+vUc3KpiD17LrVBZrS54p1t
         WZ+W8fNo65xFj5dL/4XLDvNA31Up4y9zsiR1teUU/fqxete1k4x+TilAMvjKUNePedro
         TRACFfJ0TeduVzkYyBuTYYWgsI4YL3Dv8cYSiRIOKAMGTUePY45p+D+tmooI4EcYP2LU
         031SCwf+E8fTD9V6TuMCldFBf8bwqTZvwoWjIWy2Yviilg3dyqHOJBXfhoCTesKVe+ax
         aHHFnXnhxd7fpFvwj2CM3a/KSvwRHltH7vqzjbGsEhv3Yhc6LtIbAKPg02Q/zZ/65jKD
         TsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755630; x=1762360430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8XbRLU+7LExsM1Q2W4kgKdkH4Wh0K6zsU36k2L5dwa0=;
        b=XjleuQIjDfOZhR8wWLuAp5f3SC7+jN4/IaolhGNmwBoaPdufI9+pZUj5coYeO0q3KZ
         qZ0D+EBzvBDSNcMdtIL8Uw7bSL24igsAnVpHWvpy8UvJEp8z0BD0JdSELFqooAaFFavP
         5/n64oEawlmcaS7LnQReutS7IB5l6qhpoUQBVt/YUQOIEvIZzjut9J5Cez/F4yx+2w/N
         MSTNfuHknPa6LNGX8XuG8TQWACcpmXTGrlPC2guUjnJAnk3NUJpUoBVEYNxaTRYQSIKM
         L4Fxsew3mZlszKBF0BfQ/CNW9MHnGrUT11REPEsUlvmtroiIsy9p/M7MOhbYK3xlTnkf
         3wtg==
X-Forwarded-Encrypted: i=1; AJvYcCX71TAWLPmhA27eZ6K788tmLOCEtYIGt4OCLqukP9PKb15nF5ZV2arcOTmliI+Js5lpmYRCs+0D68PJEqCgFp2d@lists.infradead.org
X-Gm-Message-State: AOJu0YzaKrcaV/aCVb1DxOsIcEzCJ6kqpPh/D3vD+BtYYa7elDjoJAin
	5aPeggDQftl6sp7H7NoIXO39orZhEzOs1zPM9Vsuvc4NWqIrQf4ZNtFsdyZb4A==
X-Gm-Gg: ASbGnctL386ZpXsWqc+ol8kPI2Qd420HKyye9Ku6gmzhsxheLCrYgUBQZKo/bj8c9uy
	kuFrJT6+95CDPVpP3mvFzrfTeKgpbu+afNlax4WkasRICkYzuCgMZOHk9U5zYPb1TYgziUIeVPz
	Xx7L0jMOdFSk35LoBYizojxIEWgLOZxIsDNB+8YjCdBK0FQTJC5g58bFeBDXXvZdNZyPbXHypme
	W1G280xLVGtp53Y0SKUQFGULVK5nJ9jvntUIGS35QzjwEPi7nGqMXsBk8jaVg4cHIx5Nh6M02qB
	oflSf7PnWUp081yNLE+rNnuIrktLQPLcdcdpEKk8k+TTL4CQ2VhsJ65iph3gjEZ0/TJSak4nu/J
	kgxPmMC5xN2I7FYoT0CbncLQWz2twhdSzhmwItsaHCe949/B0AXXMTs1CYFOwelCrKr9DOd7Mvv
	bc/L8SutAMX7T9wC49P+5deFbLx17X9V4yD+od8M7D/Hido2rYoRjaeWqiWG9uxFsNANTv
X-Google-Smtp-Source: AGHT+IFQlpirQWvqETIaDsilJH4sjQW05iHSTqO+BVFy04krtNR3muOIO8OYFK3MmzGZwCCaLhUORw==
X-Received: by 2002:a17:907:1c8c:b0:b3e:580a:1842 with SMTP id a640c23a62f3a-b703d557003mr393915166b.48.1761755629552;
        Wed, 29 Oct 2025 09:33:49 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6dad195456sm939661066b.72.2025.10.29.09.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:48 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/7] bus: mvebu-mbus: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:32 +0100
Message-ID: <20251029163336.2785270-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029163336.2785270-1-thierry.reding@gmail.com>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_153820_158321_6140F9BA 
X-CRM114-Status: GOOD (  15.08  )
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

From: Thierry Reding <treding@nvidia.com>

Pass the driver-specific data via the syscore struct and use it in the
syscore ops.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- adjust for API changes and update commit message

 drivers/bus/mvebu-mbus.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
index dd94145c9b22..d33c8e42e91c 100644
--- a/drivers/bus/mvebu-mbus.c
+++ b/drivers/bus/mvebu-mbus.c
@@ -130,6 +130,7 @@ struct mvebu_mbus_win_data {
 };
 
 struct mvebu_mbus_state {
+	struct syscore syscore;
 	void __iomem *mbuswins_base;
 	void __iomem *sdramwins_base;
 	void __iomem *mbusbridge_base;
@@ -1008,7 +1009,7 @@ fs_initcall(mvebu_mbus_debugfs_init);
 
 static int mvebu_mbus_suspend(void *data)
 {
-	struct mvebu_mbus_state *s = &mbus_state;
+	struct mvebu_mbus_state *s = data;
 	int win;
 
 	if (!s->mbusbridge_base)
@@ -1042,7 +1043,7 @@ static int mvebu_mbus_suspend(void *data)
 
 static void mvebu_mbus_resume(void *data)
 {
-	struct mvebu_mbus_state *s = &mbus_state;
+	struct mvebu_mbus_state *s = data;
 	int win;
 
 	writel(s->mbus_bridge_ctrl,
@@ -1074,10 +1075,6 @@ static const struct syscore_ops mvebu_mbus_syscore_ops = {
 	.resume = mvebu_mbus_resume,
 };
 
-static struct syscore mvebu_mbus_syscore = {
-	.ops = &mvebu_mbus_syscore_ops,
-};
-
 static int __init mvebu_mbus_common_init(struct mvebu_mbus_state *mbus,
 					 phys_addr_t mbuswins_phys_base,
 					 size_t mbuswins_size,
@@ -1122,7 +1119,9 @@ static int __init mvebu_mbus_common_init(struct mvebu_mbus_state *mbus,
 		writel(UNIT_SYNC_BARRIER_ALL,
 		       mbus->mbuswins_base + UNIT_SYNC_BARRIER_OFF);
 
-	register_syscore(&mvebu_mbus_syscore);
+	mbus->syscore.ops = &mvebu_mbus_syscore_ops;
+	mbus->syscore.data = mbus;
+	register_syscore(&mbus->syscore);
 
 	return 0;
 }
-- 
2.51.0


