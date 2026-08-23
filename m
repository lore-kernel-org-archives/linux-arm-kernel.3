Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C4CC5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 18:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3gq37rj4bzCyBTGwM7oPPXQqhYUmg5gV71MEIz1jHkg=; b=X3c4oOnuLxaS/SvD/GOId9WD7c
	paqzLqYZGVW4XBSewiq5ify8I1HXshzefYgJrxVXiR1YS2ZBYugd/LN9gAgAvuvDtqrWFgw19Wy6J
	HSGFRK3O7MRWYIOIpliWEUyMpdO+Kso/7tXnpXRtzz6XBYBMbMKYmvlzuEZpQpol+b7YRFzMo+L18
	VeXJY7oi33glrqq1ai0SyYtHJwCZ3JLmH2pXRdpm3YZwULGyufjVyNZg4qD13lrpx51D5Fq/heha7
	F7ScCflr6cw788tGDeHOCW1S8Q5NLX0gmfUWe7OJ/AxURDZ7/lbyoIUSgJcFW+UyL35K6deqYr1yL
	XVSlwV6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyCcd-0000000FWQK-1kMw;
	Sun, 23 Aug 2026 18:08:43 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyCca-0000000FWPz-30FJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 18:08:42 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4815bce4652so1399340f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 11:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787508518; x=1788113318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3gq37rj4bzCyBTGwM7oPPXQqhYUmg5gV71MEIz1jHkg=;
        b=IREqmkcqzy3R8SdMRTDUh+7Apu+yCZ4x8Ht/m2ObApIgmd9IUR6lDAr4OdJntpup1q
         M1sW6iQ/qVrWM2+b+grDoPnRolTrb1TU6737mJne+ZZF+PimNdmmpzJoRAqY2btzgJ+P
         2pyLELs/9PVduCpI13HXDj3y14DAgSQksiXpE5iUwBB5uwjPmSXBQG9uPtgnyaHXT4DK
         RcQm4XLaeeierfPIBf43y522ucwvPkXf2RMRuSS0xRRu1tXpg+hngsMMW737fWTIgZVZ
         kFoC2a10ZULQUMHVhrhlbkUj/miVloaMFPrO2Wf7f3KBzHt4U69MbjHMdmekFwdQHVm9
         jUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787508518; x=1788113318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gq37rj4bzCyBTGwM7oPPXQqhYUmg5gV71MEIz1jHkg=;
        b=Df2SULwTIJ4EPxCu4tLtuz4XTGVbxurb8z1yJjHqtwIhICP645EsShjvW4vCg0tFI2
         hRDZ/M8uHdbHxTtq32Lk/+AHN5aqCGI7gJ8Er364g5kB782cMPpnJ63XBI/C5FX19HHc
         +UTUJbX58w2Fr4I55EuQyZTs9WrJbzgKwHDcNBu0oHW9xUENRfzngeMlTumEy9yYJAsV
         cJDcJlpU0oOUjeENsW7F2FXJjRzg03liVTlCeOufFM5yzOzz22qByYm20G9Lzvby3/CU
         jJEf6xi1zjDc+minakXxFFYFjN4xAYhwSVoHJRLK/YceKfn3wBDuDUhOxZatuaOLvebv
         B33w==
X-Forwarded-Encrypted: i=1; AHgh+RoAsAUtJl0JqWyncmKtwAZCZm5G5DRs+F+2RqQiJVocIy4YoBJQzZ7wn4o6bAGSyfqvlXxm5sUB0GfgLV+GrHbS@lists.infradead.org
X-Gm-Message-State: AFuF++kwp1p4lXMqMN9HC+n1dFvWuMnKGlFiA7lqPs/fP786miY3bouV
	ODqgJuqFKWS5HJA297TfZBWi/nIAfgD6kAvLKRlegieOw/e1CcpzfIHY
X-Gm-Gg: AR+sD131eTKkXH/uD0JwivTkMsK4vA2XLTJ02Rv8AzR24hl34dsVRqpalvSzyBrHgal
	dnHzvJMviXghLB+DGDgyYP70BMEWCNSOl5OQWNLlGQVva+SPp3J0k2p8kSzhDeifyOXo0dhjlGe
	jhN9/vWGTtR1+pg2xWps3HW5wXIJb5JIHdCBV+ygqyWVN3pPKhHEsJXTl3O3Nu/kH/jd8IRPEVJ
	M00vQ8BCO8w/bRHrimzo+L2+3F2Geyn4++U9ByLP6dvVDGGWjWjhOWi7gvOlVhkUM6Oq491/qF1
	vAp+pjy83YQDAVreMD4t1HZL26UtgZKvDFR9kYb/U3I7wFTWGGpmhceVxMQiC2ElC9lpsAywUk/
	A/JiKvk5lGEn2ihewtXVka1HBO2IHmf2QFOKA6IPvk0ZRt90rmiO/1BbdgYAURxZdty7Co6ZxPv
	GgSGbdxuTEkO5+KeHgutbICnGhYCwDOXaZz+wqg+2oKoCR1XHbjkJHQ8yOPsR3AUh2A9gRV+pIE
	CXypdZxKD4awLUyxeYRq1/rwenggOisz/Mgwmn+1P5OIa4LKThl
X-Received: by 2002:a05:6000:310f:b0:47f:f4b9:88b7 with SMTP id ffacd0b85a97d-482c0b58818mr25065061f8f.1.1787508518013;
        Sun, 23 Aug 2026 11:08:38 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482d4710ac5sm219571f8f.32.2026.08.23.11.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 11:08:37 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	linux@armlinux.org.uk,
	tglx@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: bcm-kernel-feedback-list@broadcom.com,
	radu@rendec.net,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	arnd@arndb.de,
	maz@kernel.org,
	sudeep.holla@kernel.org,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2] irqchip: gic-v3: fix unmet dependency on ARM_PSCI_FW
Date: Sun, 23 Aug 2026 19:08:32 +0100
Message-ID: <20260823180832.1246363-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_110840_778063_285936F8 
X-CRM114-Status: GOOD (  12.52  )
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

ARM_GIC_V3 currently selects HAVE_ARM_SMCCC_DISCOVERY without ensuring its
dependency, ARM_PSCI_FW, is met. However, ARM_PSCI_FW is always enabled on
for arm64, and the GICv3 driver only uses HAVE_ARM_SMCCC_DISCOVERY to
identify the NVIDIA T241, which is arm64 anyway.

Also adds fallbacks for callers to avoid needing #ifdef guards when
HAVE_ARM_SMCCC_DISCOVERY is disabled (32bit arm).

This unmet dependency was found by kconfirm, a static analysis tool for
Kconfig.

Fixes: 35727af2b15d ("irqchip/gicv3: Workaround for NVIDIA erratum T241-FABRIC-4")
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
Changes since v1:
- remove select and dependency on ARM_PSCI_FW, 
- make the HAVE_ARM_SMCCC_DISCOVERY 'select' conditional on arm64
Link to v1: https://lore.kernel.org/all/20260801212235.2692694-1-julianbraha@gmail.com/
---
 drivers/irqchip/Kconfig   | 2 +-
 include/linux/arm-smccc.h | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 20b77fbc51ee..dae023fed7d6 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -37,7 +37,7 @@ config ARM_GIC_V3
 	bool
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
-	select HAVE_ARM_SMCCC_DISCOVERY
+	select HAVE_ARM_SMCCC_DISCOVERY if ARM64
 	select IRQ_MSI_IOMMU
 
 config ARM_GIC_ITS_PARENT
diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 4de81848fe2e..248624c1af7c 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -324,6 +324,7 @@ enum arm_smccc_conduit {
 	SMCCC_CONDUIT_HVC,
 };
 
+#ifdef CONFIG_HAVE_ARM_SMCCC_DISCOVERY
 /**
  * arm_smccc_1_1_get_conduit()
  *
@@ -363,6 +364,12 @@ s32 arm_smccc_get_soc_id_version(void);
  * When ARM_SMCCC_ARCH_SOC_ID is not present, returns SMCCC_RET_NOT_SUPPORTED.
  */
 s32 arm_smccc_get_soc_id_revision(void);
+#else   /* CONFIG_HAVE_ARM_SMCCC_DISCOVERY */
+#define arm_smccc_1_1_get_conduit()	SMCCC_CONDUIT_NONE
+#define arm_smccc_get_version()		0
+#define arm_smccc_get_soc_id_version()	SMCCC_RET_NOT_SUPPORTED
+#define arm_smccc_get_soc_id_revision()	SMCCC_RET_NOT_SUPPORTED
+#endif	/* CONFIG_HAVE_ARM_SMCCC_DISCOVERY */
 
 #ifndef __ASSEMBLY__
 
-- 
2.55.0


