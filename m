Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A057CC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 15:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xyt3PPaYlNgcA/j7n+n0sHAguVTAN2baVeJuxMTgLrE=; b=CHViyOYu1ay97RHBzsGLkbZQjy
	VnFufxWP04I54uCJ7DpYsLyV+R2wxA3F2Xr5E7iGpwWvawCHl7BtvgsjZDypoUsEOz+VWrZZuicIp
	fzu2cq3xIKguhRKQSk059T00DtDxZWmv+3o45WEEYVJU+CV3LfkGJi1kVNzp4uBXqi1eWQYL98XjE
	l3nFLmvoBNZY8qgHar4YahmrW3Sa6N9aYyvwp+OzG0EIhMwznozOYyyn5KqHivYSR0mGEDT63S8Ha
	zYC2K0I9tUYyGrmTYYtT1XzLmSYcrtpUC+0IUrliRGEh/ioJ8CJopCMH61TC3HiY8rzDKm2G4ZtN9
	XtDcogiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmDrT-0000000BKUu-2bRR;
	Sun, 23 Feb 2025 15:25:43 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmDpz-0000000BKOP-2j0k
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 15:24:12 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ab7430e27b2so580355466b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Feb 2025 07:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740324250; x=1740929050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xyt3PPaYlNgcA/j7n+n0sHAguVTAN2baVeJuxMTgLrE=;
        b=niqd5gVkAG8SzD3crQXoSrOOXCn4+UehVNXTdNo/N8xCFXTWsMh/mCPAIN9eOASqBH
         NUfiwe0EADJDF2pGWU68OJwjFxEGOwszYttUi4Pn+Au3VhI2APj1YxMeSilMj/f1h8rQ
         nj7g4os/rxBZ4zm6h+jXPcBdYeUKuxhbRjB1KXOyalVs/YbcpqPtKBQTGigXmkpQrFLq
         bTCuV5Pby/AuYiZo3r/4Sg4kknqb/wDCi8Z0OxDBZ0Ac+qOBSEO7nv6BE3CMYbz1pvoV
         +Qt3GrWCH2DSrzXuT3DU/tLKaL1/5eI0htVlWdNtQd2XX0wU+tVGBL+G0CGz1tmZ+Es0
         Xo3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740324250; x=1740929050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xyt3PPaYlNgcA/j7n+n0sHAguVTAN2baVeJuxMTgLrE=;
        b=sXs1But2JDapIvViMphboMSY0WaSf3AN7oUNR5dQaDHWe40AjJSmxRGMYslUVP+uhq
         TlDFtToKJWAJZQqPckHA2ETclGcEcyFtm5Bgq4pi8sbofTdOIIzyr7BAZ/3kptsGKF45
         ZwwGOoSr+YKIB5inFahvdt7uPIu4w1hSqZhdtgmLGwUMKEQnJatXSmA488VBBBonBgJs
         IN6VA5TTPAu4BmyCr92RYVnbtu9gncceEqAkdxa+akvBxMo6Gd3gO/YJOlOV1AfBo5RO
         lMRjYtVd7cvqN6+tCvZDjtBB0JrINgU8ydrpycL4coLmqRAJElKRkioqbdTP91htaZF3
         XHdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbOYy47XMC2ww9lrzLHEZmnekphYAuFKt5M8iHgHZ2mXRy56Y0ZwhJod1ndqHeMnasJ4tko6ST1Hf1MTfneOl2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/jmBShNsxK87iKLUtyR0aEipsXbbCKZOjiBJ2ATKmR2w3yIm6
	jq0JeIHvueuztow8mrL7uvSJF9Kk/HJHqL3x2G1wbVcr5mqkcjVm
X-Gm-Gg: ASbGncsmeEvGMM5ykwmVvH/1F0+yAEiar2U+dtUS3FnmcbtR6sQowsipE5kTpBsYq1+
	pfJfJRJgIBVper0qPPoFxHta6TVvIVCGD4RTh/H3UAEvo4P5LlzExokit2ziSoo22zwQa/5kBtx
	Hw8pj8h/rcBc70nbng7vbZWaFG3eCimpOSDkfgrEojtekX78R0sIZwNhBG7ttagdDMmAfkay67H
	Foo8qe4poQ2BfLm40NqYkek7JwA4JcSw7ALHd+rNFP7t8R380Bh4uCirDCQZkKJAYyjdvMVkNrD
	XY0C6YMZjDCzyWUkSgTQvrfT+BlbljKSRvAzuF8=
X-Google-Smtp-Source: AGHT+IFIRu2Fr+hl9WNpDQE0EmyLzkg8g5O+I7r/hC7hqDYW4YUCySAui9U2daVsbRmLB7U7g+OQpg==
X-Received: by 2002:a17:907:d2a:b0:ab7:fc9a:28e1 with SMTP id a640c23a62f3a-abc0de5a487mr1018666366b.52.1740324249605;
        Sun, 23 Feb 2025 07:24:09 -0800 (PST)
Received: from localhost.localdomain ([165.51.10.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbde327701sm872767766b.164.2025.02.23.07.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 07:24:08 -0800 (PST)
From: Salah Triki <salah.triki@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Salah Triki <salah.triki@gmail.com>
Subject: [PATCH] arm64: kvm: ptdump: Initialize .owner fields of kvm_*_operations
Date: Sun, 23 Feb 2025 16:08:44 +0100
Message-Id: <20250223150844.628175-1-salah.triki@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_072411_687201_874A52C6 
X-CRM114-Status: GOOD (  10.20  )
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

Initialize .owner fields of kvm_ptdump_guest_fops,
kvm_pgtable_range_fops and kvm_pgtable_levels_fops to THIS_MODULE in
order to prevent unloading the module while these operations are still
in use.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 arch/arm64/kvm/ptdump.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
index e4a342e903e2..50f7d39333d6 100644
--- a/arch/arm64/kvm/ptdump.c
+++ b/arch/arm64/kvm/ptdump.c
@@ -185,6 +185,7 @@ static int kvm_ptdump_guest_close(struct inode *m, struct file *file)
 }
 
 static const struct file_operations kvm_ptdump_guest_fops = {
+	.owner		= THIS_MODULE,
 	.open		= kvm_ptdump_guest_open,
 	.read		= seq_read,
 	.llseek		= seq_lseek,
@@ -244,6 +245,7 @@ static int kvm_pgtable_debugfs_close(struct inode *m, struct file *file)
 }
 
 static const struct file_operations kvm_pgtable_range_fops = {
+	.owner		= THIS_MODULE,
 	.open		= kvm_pgtable_range_open,
 	.read		= seq_read,
 	.llseek		= seq_lseek,
@@ -251,6 +253,7 @@ static const struct file_operations kvm_pgtable_range_fops = {
 };
 
 static const struct file_operations kvm_pgtable_levels_fops = {
+	.owner		= THIS_MODULE,
 	.open		= kvm_pgtable_levels_open,
 	.read		= seq_read,
 	.llseek		= seq_lseek,
-- 
2.34.1


