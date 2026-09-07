Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078D0C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 06:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KAPU1CX8Iq66BEpNVJ2vafgQDXa83ebRjQ938YJsxwo=; b=o/B4stNOHKv3BZcw7hucHw4KSG
	SCqGzA/SFJpG9XY/byIBEyGuhi7YsB+w2tRyn+2CcVbjRNdG05+CnoEvptmht+qm+tcZ1JVNtkcN+
	mnyvDZ0NTL6z+oXoFKhyPyzE1x6Z0d3XexS5JDzbuwUCE70plp9WXSkPFpcezUgPlfXOvZtlBTnCA
	a/GezFaVWUvc4dPrFxhEL2lgxEt83CynX8pn6kXOwylBU9OQ+m08KQv2aEcuGj0Fk/1tGoCwtdd11
	+RTx1l064k8PEeGFZ+XENj9umRtTl9PvGQsSFL5ulsbd4cCIpzmm9mgSVPRmJtL5AFmiBtYMTJsGl
	QSY4352Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3THv-000000064wq-23Or;
	Mon, 07 Sep 2026 06:57:07 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3THt-000000064w9-1pis
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 06:57:06 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cc1cb472b76so2562927a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 23:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788764224; x=1789369024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KAPU1CX8Iq66BEpNVJ2vafgQDXa83ebRjQ938YJsxwo=;
        b=W2/Q+SHv4BzV6iEoCFmaaNX5nG4DjRTcEKcDs+d0Act40s4c0n6KAERSWztgmt9A5/
         6VGs8AqOD7U2KrkN8Ss11nx2zA1oAtTHivLfap/wRW04+/UuvvTaLFBzqNRIqgaeeop4
         wlaWTcxP0Cq5Lza1lHSZj+I991jjYvDcInAgWdfbBiQYHo/9kVWxU4QkUg+V5fLRROGj
         Y8J2m3LqKYD6YeNpHhB4hDP1+kauH6xTfYU5LThNZnh8Ed/abiuO+uGgbAsq85WZDTTW
         9WNkXW9ts8Em8teQSN81CLNcrs0CIzKdFfaaUkxSWKJHLahvlyuHYWKAywvSu+lmmiPb
         Ua6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788764224; x=1789369024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KAPU1CX8Iq66BEpNVJ2vafgQDXa83ebRjQ938YJsxwo=;
        b=HarwD+ch5uIs0REpNPqESB1SUemy57nnTzBQByBGCbtLGVP3rUoet+eq6wtwwCiArf
         EDpnTRRGJP6PLgimzF9F4v60Km+o8P/dJA/InF8y0r2+pX9981Ttzt3UJ8oXLcsvGdgK
         EBtc7rxXq/2Os1ZVawSDARpFu+byJN8MEpGLlMp8k6BkeoDhSJMHOq0xStEJ2g94Xrdg
         naehn2oEYQFEImRWx3O54MKgNLlq7vyJt7DuIJ24LklggKhvjA95JcINRsQP7r2wCZoc
         zzna+KJvu4exsJrPyuNJFL3gn5CtdUSXVGpRxfszjo4ZBRm1dcuEUjb7ht4UO1PL5dS5
         jZyg==
X-Forwarded-Encrypted: i=1; AKwUvByL5IqH68Z5fcJXjVBEcKHnSsozWqnc7xbNL6YLocMRyfwGQQipS6MTj2UXKZ/BF3OU1FHkn84QKd66QraoDqOX@lists.infradead.org
X-Gm-Message-State: AFuF++mxYKbUIyKVyzb+ItYm8jqqTwU2djcffMVhB5rK0wVi2FfngDro
	mLiUmtNnefI9hgfYjPmhdWwrcYWBS9T30sJF/hknounjHiOWZVgZ33Rw
X-Gm-Gg: AYBFou2hfFyGg1oMlHwnlRcORLmq0w9B7FP2AU8Z1IBEgFxYzrIoMe8qjj8gNWT+pBm
	iv+ftfcVJC6BdaVxC1y5bF//qK+58uTfdHiQy1dMEY4U/FMXZPfcPtH+/dF4nUQ5XOdGwIIaEYh
	QGW7Bzx5wFw+NEjQic7zDHF1syR+4VZkr6gqKEHy6BANhplh7EGSKBN73yeGPdquuaFPzuAtQKd
	npRVzeY67TWzU3QBdEw93LrD7IZBRc5ejNiMneJbNRHJwU8miZZXqU9BSF6wjPrXtFSa3/lL/yE
	DwvpyQj4qJuCI2e/jiSljoGpHszGTfB8uCXWUcP0zrzOAdkCH2x8INY+O3vMis4xH2LMhP5rZae
	N6g1+Z8w5RMk/NIa6t2FgazE2ph4fABQUtu5lm58Uqnmy+I8IQfK9HZnd+g0jakvMBHnGSebNMa
	lfEmwL3a/v8KM55ULe8ZWyt8r2Ge/S5p+vAreRgrIAMNeu4za58NAfrZ+unCNzqZdTrTa3K2BQV
	rTPJyvmUFMggg==
X-Received: by 2002:a05:6a21:487:b0:3c4:46ca:3347 with SMTP id adf61e73a8af0-3da39b44dc9mr32709277637.2.1788764224500;
        Sun, 06 Sep 2026 23:57:04 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm28777832c88.5.2026.09.06.23.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:57:04 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Talel Shenhar <talel@amazon.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 10/14] irqchip: fix repeated words in comments
Date: Mon,  7 Sep 2026 12:26:59 +0530
Message-ID: <20260907065659.12034-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_235705_480549_51080384 
X-CRM114-Status: GOOD (  14.68  )
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

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/irqchip/irq-al-fic.c | 2 +-
 drivers/irqchip/irq-gic-v3.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index d10ac9b63c99..760317db9dba 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -180,7 +180,7 @@ static int al_fic_register(struct device_node *node,
  * @name: name of the fic
  * @parent_irq: interrupt of parent
  *
- * This API will configure the fic hardware to to work in wire mode.
+ * This API will configure the fic hardware to work in wire mode.
  * In wire mode, fic hardware is generating a wire ("wired") interrupt.
  * Interrupt can be generated based on positive edge or level - configuration is
  * to be determined based on connected hardware to this fic.
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 6e1fa5b247fc..69ca208eeee6 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -687,7 +687,7 @@ static void gic_eoimode1_eoi_irq(struct irq_data *d)
 {
 	/*
 	 * No need to deactivate an LPI, or an interrupt that
-	 * is is getting forwarded to a vcpu.
+	 * is getting forwarded to a vcpu.
 	 */
 	if (irqd_to_hwirq(d) >= 8192 || irqd_is_forwarded_to_vcpu(d))
 		return;

