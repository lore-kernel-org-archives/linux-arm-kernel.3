Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5058C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 09:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3sE/PXdSSokJ0Zgm0Fk4Pk1jUj6qdWvd3FyfD/aEiAI=; b=GtGcgcXJW0sR4bqgaNGdn0Z2Ua
	hUPHqjY1CVZThPbdx7siAz1U51NBDBU9xadKgq07UCVNK79zjlLO1cCtqNQoZQ/sKnC1k0jDvmjMB
	v5ErowTZxUUkvGFCjA0USQfzXCfTkCFGTCaPNWbXYEmtI3mdoilPttXvSjCsDk6xwuERT+rfw4f5o
	/xgocorV7+VuJ/WRrubhGIem/i6yVNffz3/W+/BdxKL0gW/CxnL3H7qqtGmzGxjsRw5pwZwXWjFFg
	jzpyoVG0Qk45QVseISiIlLXFw0UnK4awmv6158LGAj9K3+iH+mS1j66SmND18eGauvhMHBmrsJeWk
	Y65Vfttw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjx5b-00000003rv4-3oqh;
	Mon, 17 Feb 2025 09:06:55 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwxT-00000003pha-0iTb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 08:58:32 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2fc3fa00323so3831660a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 00:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739782710; x=1740387510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sE/PXdSSokJ0Zgm0Fk4Pk1jUj6qdWvd3FyfD/aEiAI=;
        b=YTI0x0vRUb9YWQ04+sgcVVtc88GuuvBECDMnZzqwmUJ7I744CndG746sHHfkEpVgIZ
         uNXlb/e2hBETYq3yLHfPWLYXYWd3goKmVpZUkIjaj0WAYvjQ6py6CRVzgjVkULumg/HD
         pnPgA9XVCth+NgrXVmGW5ChFMwxYGBoujoLcxmqPeBgdV/zfljEssJKkRjgNJkK2VUCO
         zMaXcB7s0FCkGRQcAeteMnAiMXbFtcO8iT77S9l1tmdIcUCERC+2Fl9ufsgPiALseCqh
         p+dxdC5XUPIkxHFhd1uHsoZV9rPtid+AcaM5TJbB9tiZEbG3i+NAVh9UC6cTpZO2ciFo
         N46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782710; x=1740387510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3sE/PXdSSokJ0Zgm0Fk4Pk1jUj6qdWvd3FyfD/aEiAI=;
        b=LJ7pnUAYmf244vGYY3JJrITxB3Vc2pKz+4CsbWgmkB32yOthWUf9YTT9zP/GkGx5fU
         iKdCkoZviiqI0Lf6BYMDCgy+n/LvzsbAz81KHTIv4M/EMSs+r35TMe4pjtLihy0lJGMR
         1UH2CJJM8BJnOKmIR0FsEpn+w5rZucSvkIHR30K4ur9J0FV4ZBBc18UHfV+uYw19c94f
         rZTpsHSqEpar+avppKWU9DZX5dnbGVsXc8QBobjPa5OXlVUFlrGyzA6/OwOzCYfEg09Z
         RLdgzMqE4rYMvGYycr/0eiOhwJGxxqms3GLMTOGBRgVsoj9GM++S8mYrAxbH7ovWd2Qs
         ej0w==
X-Forwarded-Encrypted: i=1; AJvYcCUDGseTroHmAmuA3OkSJ076/+xrR2WGh1mx7qddJCb62EZT9EqZ6Dc71TmjPE18sqSAMvWrADag4EU96PzkYWEr@lists.infradead.org
X-Gm-Message-State: AOJu0YxeiLkabT5/22zkonjWZEIU5KECG+QC2SQSTSJP6T1xCw+w4erT
	BzRsRueNi0gmynfDe8+zvFYDhZrUjbgpJXXkEG7R6WvFfr/k1fi6je59W1O5XDk=
X-Gm-Gg: ASbGnctJEob3dXHKxrnYU4u8i/sROlusuiHsA/jLHrLu0FVsG6tGBI4gMiR1ZCIrK6T
	j9Ik1OiTvublQOf14KpgAnbWS1NRz25A9YVXM6ylF8sSu2NEE26xPtqIvZu8I0sOl2UVWWrXRET
	utGpqnNJtBc8dwd6H4pJFsl8wYc2bHmPKOXW46M8SHLsI2J6v9ErVocq2LfRhjYnjXEkB1xNVoB
	4vRXQ09nxDKx0XsUCkjVHkGEl2infSAN6YCeTNaKWI1uBk0hkYteGWEJc0Ec29Ju4B+yfFRi1VD
	0XRerXMm+RDTVmRC7JYnnzQGPeV6R+rtAGbj42MaDtbInocySEc5Z7w=
X-Google-Smtp-Source: AGHT+IG6/Z+Rri3hr4qvHP6StAr0ON9USjeH/PioUg2db6lXPHGQJycOyjvnq3k1DASkiPsG+dguug==
X-Received: by 2002:a05:6a00:a83:b0:732:2967:400 with SMTP id d2e1a72fcca58-732617bfe3amr12464017b3a.12.1739782710139;
        Mon, 17 Feb 2025 00:58:30 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.22.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546867sm7632018b3a.24.2025.02.17.00.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:58:29 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: hpa@zytor.com,
	Marc Zyngier <maz@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v6 05/10] genirq: Introduce irq_can_move_in_process_context()
Date: Mon, 17 Feb 2025 14:26:51 +0530
Message-ID: <20250217085657.789309-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217085657.789309-1-apatel@ventanamicro.com>
References: <20250217085657.789309-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_005831_215977_8AFE95DC 
X-CRM114-Status: GOOD (  10.91  )
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

The interrupt controller drivers which use GENERIC_PENDING_IRQ
can move interrupts in process context for downstrean devices
which support atomic MSI configuration.

Introduce irq_can_move_in_process_context() which allows interrupt
controller drivers to test whether a particular interrupt can be
moved process context.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/irq.h    |  2 ++
 kernel/irq/migration.c | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 56f6583093d2..dd5df1e2d032 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -615,6 +615,7 @@ extern int irq_affinity_online_cpu(unsigned int cpu);
 #endif
 
 #if defined(CONFIG_SMP) && defined(CONFIG_GENERIC_PENDING_IRQ)
+bool irq_can_move_in_process_context(struct irq_data *data);
 void __irq_move_irq(struct irq_data *data);
 static inline void irq_move_irq(struct irq_data *data)
 {
@@ -623,6 +624,7 @@ static inline void irq_move_irq(struct irq_data *data)
 }
 void irq_move_masked_irq(struct irq_data *data);
 #else
+static inline bool irq_can_move_in_process_context(struct irq_data *data) { return true; }
 static inline void irq_move_irq(struct irq_data *data) { }
 static inline void irq_move_masked_irq(struct irq_data *data) { }
 #endif
diff --git a/kernel/irq/migration.c b/kernel/irq/migration.c
index e110300ad650..5acea2ac57be 100644
--- a/kernel/irq/migration.c
+++ b/kernel/irq/migration.c
@@ -127,3 +127,14 @@ void __irq_move_irq(struct irq_data *idata)
 	if (!masked)
 		idata->chip->irq_unmask(idata);
 }
+
+bool irq_can_move_in_process_context(struct irq_data *data)
+{
+	/*
+	 * Get top level irq_data when CONFIG_IRQ_DOMAIN_HIERARCHY is enabled,
+	 * and it should be optimized away when CONFIG_IRQ_DOMAIN_HIERARCHY is
+	 * disabled. So we avoid an "#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY" here.
+	 */
+	data = irq_desc_get_irq_data(irq_data_to_desc(data));
+	return irq_can_move_pcntxt(data);
+}
-- 
2.43.0


