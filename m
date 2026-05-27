Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB41CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 03:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmAA5z5t6XdNPHFYJxkTDYvo5Zq4DgJyNWi+6SrmBDo=; b=dsM6vid0IviSyiPLUwNxnDLUWs
	zVrQrhzVUezIUGeDPbhEMRhpYl8VeBypWJUnIv92lct2zUlHPQMRiwF5HNdqdb0qGVzNgf/NxvJOw
	PP6th9Unb8azcNazwgBLffIFBGo3d8dL4oLY5eKu28PFxXa05dtVMXWxS0OzxPDKx7fi11Kc3huxY
	d962LA78Fja/G46sVQDK355qJ4VSwtqgawfnnYPKVBmOUagNPmQi1iphrR+dq+06RP/IISS+N5p2h
	RivoNVSYSA4QRj46p94WtpH3fnjeB+2n7pXJQzpYopSr0gvGuGK/g18rJ2I6acPTCKtah2gfdaRfC
	mR2Lj4Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4yJ-00000003Ey6-1iGo;
	Wed, 27 May 2026 03:30:19 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4yD-00000003EsM-2RJz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 03:30:15 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-836ed29d1e5so4987908b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 20:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852613; x=1780457413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmAA5z5t6XdNPHFYJxkTDYvo5Zq4DgJyNWi+6SrmBDo=;
        b=Nvpb4OiQWFRiw+DRbtPTduevhZTJBs4DFUgMWvYx1xSQ8X8ssT3gDxyVjvZSlUIeFj
         dERvAJs/jAGhmLbE5QvCmTEYoHy6fkIdSjmC2uSffKT+i61e0rwD+6D1TvJ45WNQ6Vru
         YbH8UuSPLwyyw0jIRbvaWd2xOvX1rEsj5Xv6pWxPO3GqFF2z5Axw05wa6D8+i5aWJY7J
         Fvk/fv44Fv8/Cm43cHlrjHfkbKT+Xbc/itho0s/D+zzr9q+g8wlab4CknYCaLEXlegRn
         ZIXHYpWoMO86LQ8OKJ7/tYATSmPbXQ0p+shpfUpar7nO3SLKqaASrbm+LgVGmmOoa5dB
         76Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852613; x=1780457413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PmAA5z5t6XdNPHFYJxkTDYvo5Zq4DgJyNWi+6SrmBDo=;
        b=rP45EC2y7pF+afWtiFhN27EQ7BR73R3u4HL8256w5kgPlVzvKv8U6OZqkH1pmsG/GR
         hGcZoeVrlQuyENGrlLm5mm/rmTdQ02Kf9xXCBZKXDBwyJ0qz0ggor8Q343M6FevUXKZv
         O5e6xmycLnbfKhuXtcRT15fxcnCql8iAdYFuMN2GzYqCe0Xr51ImEYEQNQk2njKAroPv
         GHY0ZKE8W2CwSS7qCF1TnR5ulKMiHU8+nQ+H8TOFC20nZfGYiQpEHOcAs+kDSLZGOqJp
         oTkvoTPCzHEfnMZa5+XonCjiOeZ2rPSRMJ5RqYuJ6Zp/JjHM7Ybew1s5HIJGMfPUCyJQ
         hpaw==
X-Gm-Message-State: AOJu0Ywuqqr8e6OhXdgLx3zW8Kn0wkky043SWZktjee0ZyG4pUdKF2na
	3CEiU/0k/18Ey34GGqnHGCqMRHXG+I4zUslz/lYqpFZI+iCBuaGOT7V9XGUqzq6jPuQ8zQ==
X-Gm-Gg: Acq92OHST+MUQ4T6l2rx5YmI+JKWlLuGChlfhw35d0eY8fw0ehsexQZPdHPMZBOw0NN
	3h6FzP6vpCqpSgO0yHMitu81fHTdjyxchwduWfKzFlgQORs0MMayd+JZr7KIa8pzKQDaSoDEMS1
	913Z8/ht203MaNeDGUf0PYt/gzCup9Q55WrwWmEijiqtJQEAoNXkSa0oG+98B37HyxSzmjmew6v
	HEMRFHzh3nQc+9ivRMaEeE8YPyxOWEEa7X2hCXYN5Lz9m8mLL0F0A0Ahsfx109ErsTvy9m3dlMp
	OPKP2xCuTSPYBzynkmhu1TumnX7FhA4NJcO3kELCm3swbjRg5l6CYXwzeNtn28SFjy1Hn+ByZAG
	LftoyXDg7T1NoBa8+BRFMeD8hrbHVNoRmm9y2JnITrIJYBFxawp5jDewGu5IIxShTUvo+IZSBeZ
	xMZdqPB+VCYOc3PWCZIEoZvFJzUCAaQZScijLKFHmVLvUqlIw=
X-Received: by 2002:a05:6a00:1407:b0:838:c01a:7a50 with SMTP id d2e1a72fcca58-8415f406e6emr20083726b3a.30.1779852612592;
        Tue, 26 May 2026 20:30:12 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:30:12 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	quic_obabatun@quicinc.com
Subject: [PATCH v3 04/11] of: reserved_mem: zero total_reserved_mem_cnt if no valid /reserved-memory entry
Date: Wed, 27 May 2026 11:29:10 +0800
Message-ID: <20260527032917.3385849-5-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527032917.3385849-1-chenwandun1@gmail.com>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_203013_625329_B1DBE796 
X-CRM114-Status: GOOD (  13.47  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Prepare for storing /memreserve/ entries in the reserved_mem array.
Zero total_reserved_mem_cnt if no valid /reserved-memory entry,
instead of keeping it's initial value of MAX_RESERVED_REGIONS, this
allows accounting /memreserve entries based on total_reserved_mem_cnt
in a follow-up patch.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 6d479381ff1f..05defc91e901 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -329,11 +329,14 @@ int __init fdt_scan_reserved_mem(void)
 	const void *fdt = initial_boot_params;
 
 	node = fdt_path_offset(fdt, "/reserved-memory");
-	if (node < 0)
+	if (node < 0) {
+		total_reserved_mem_cnt = 0;
 		return -ENODEV;
+	}
 
 	if (__reserved_mem_check_root(node) != 0) {
 		pr_err("Reserved memory: unsupported node format, ignoring\n");
+		total_reserved_mem_cnt = 0;
 		return -EINVAL;
 	}
 
-- 
2.43.0


