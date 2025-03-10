Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4962C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 20:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2zhv36KL2NS19H8dU1GGarEClA3dye5rhXTkWyrsrIE=; b=M7gf2KI6JXrRWuMtIHAja4G8Ri
	dhMQcH1FPgtV+WGZPrznINSF3m2Fk9SmAXQcR7wrfg5sVcYcHjfVHdbbYwxd3WyWQ8h6d22nJ4l/0
	f0rfIL/rO2eDNP+TAfvj74qDTo/ths2h/wdIS+ZG0uPXvlO6sBZE0uistvFca23CQlCdFSzYd3BhW
	f6nPkRUrZ/jVTqBTHxx/Oa2f0xxjFrL+7BfcUR273QCEw9zDUG15eeLF1O0ZXZepE6caUj4uXX7Rr
	vWRCWCg2tmeUYabs9vM59PjNVrqc8gClniPFRW4nf4aUZkk35v0lJEUwwDt9lO9PPQlX1FHltTpYs
	sUSM6n8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trjOh-00000003oKy-3dJU;
	Mon, 10 Mar 2025 20:06:47 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trjIQ-00000003nBV-27Y7;
	Mon, 10 Mar 2025 20:00:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741636806; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Didrex8uRpE34xQet91uiVU/940LLu6uZ2qqwKaBvg5Zvph5e3cSv049gp2z91mIZBRhtXpqjXT5tmEgFIM9aIT09uy8CQBZF/pgsZyvdBEKSN7zKv/Gfi5STM7NC+zUswVIrKnrbze26Km70DcHTxfDJalOlJwcrWIi4954MA8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741636806; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2zhv36KL2NS19H8dU1GGarEClA3dye5rhXTkWyrsrIE=; 
	b=RKfva+Ef4FJOBrt35N/BIFcpVtV0gOcvA1ZHdlSzrAwmE9cbJm4qoDqyR+bPV3YqxKbPGP+9mYVFp7WOtC/hG5aTwqLdOjxk/FdhiJrRHkbjVlFKc+jCERjwrFAJgsnLFhNGZPouAeO9+AraCStMEa/rFZzStzHjt90mYNOchnI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741636805;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=2zhv36KL2NS19H8dU1GGarEClA3dye5rhXTkWyrsrIE=;
	b=TKCbmJJXGqx2hwYssKFXHjMcEtoS6TrLM95ti+VBMg/NmmodRObFBkuqF5G7esS+
	4RoCoAfqTYjF2C3gpRhkDF2sWihCIrHky7EDO9erY+sopQrh50+q4QK7xsetGNgZiqI
	BKK/ZaHeuhqeEuoZeHqsrFzjjxQHe2rxbH3k8Fg4=
Received: by mx.zohomail.com with SMTPS id 1741636804736523.5407434249297;
	Mon, 10 Mar 2025 13:00:04 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com,
	robh@kernel.org,
	steven.price@arm.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	kernel@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sjoerd@collabora.com,
	Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [PATCH v1 3/6] drm/panfrost: Unify panfrost_mmu_enable/disable common code
Date: Mon, 10 Mar 2025 16:59:18 -0300
Message-ID: <20250310195921.157511-4-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
References: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_130018_601543_664BFA51 
X-CRM114-Status: UNSURE (   9.87  )
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

Both these functions write to MMU_AS_CONTROL register in the same way.
Define a common _panfrost_mmu_as_control_write function with the shared
code.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 33 ++++++++++++-------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 294f86b3c25e7..31df3a96f89bd 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -121,38 +121,37 @@ static int mmu_hw_do_operation(struct panfrost_device *pfdev,
 	return ret;
 }
 
-static void panfrost_mmu_enable(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
+static void
+_panfrost_mmu_as_control_write(struct panfrost_device *pfdev, u32 as_nr,
+			       u64 transtab, u64 memattr)
 {
-	int as_nr = mmu->as;
-	struct io_pgtable_cfg *cfg = &mmu->pgtbl_cfg;
-	u64 transtab = cfg->arm_mali_lpae_cfg.transtab;
-	u64 memattr = cfg->arm_mali_lpae_cfg.memattr;
-
 	mmu_hw_do_operation_locked(pfdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
 
 	mmu_write(pfdev, AS_TRANSTAB_LO(as_nr), lower_32_bits(transtab));
 	mmu_write(pfdev, AS_TRANSTAB_HI(as_nr), upper_32_bits(transtab));
 
-	/* Need to revisit mem attrs.
-	 * NC is the default, Mali driver is inner WT.
-	 */
 	mmu_write(pfdev, AS_MEMATTR_LO(as_nr), lower_32_bits(memattr));
 	mmu_write(pfdev, AS_MEMATTR_HI(as_nr), upper_32_bits(memattr));
 
 	write_cmd(pfdev, as_nr, AS_COMMAND_UPDATE);
 }
 
-static void panfrost_mmu_disable(struct panfrost_device *pfdev, u32 as_nr)
+static void panfrost_mmu_enable(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
 {
-	mmu_hw_do_operation_locked(pfdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
-
-	mmu_write(pfdev, AS_TRANSTAB_LO(as_nr), 0);
-	mmu_write(pfdev, AS_TRANSTAB_HI(as_nr), 0);
+	int as_nr = mmu->as;
+	struct io_pgtable_cfg *cfg = &mmu->pgtbl_cfg;
+	u64 transtab = cfg->arm_mali_lpae_cfg.transtab;
+	u64 memattr = cfg->arm_mali_lpae_cfg.memattr;
 
-	mmu_write(pfdev, AS_MEMATTR_LO(as_nr), 0);
-	mmu_write(pfdev, AS_MEMATTR_HI(as_nr), 0);
+	/* Need to revisit mem attrs.
+	 * NC is the default, Mali driver is inner WT.
+	 */
+	_panfrost_mmu_as_control_write(pfdev, as_nr, transtab, memattr);
+}
 
-	write_cmd(pfdev, as_nr, AS_COMMAND_UPDATE);
+static void panfrost_mmu_disable(struct panfrost_device *pfdev, u32 as_nr)
+{
+	_panfrost_mmu_as_control_write(pfdev, as_nr, 0, 0);
 }
 
 u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
-- 
2.47.2


