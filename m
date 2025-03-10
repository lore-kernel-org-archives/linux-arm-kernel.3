Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AF1C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 20:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFdaB7brRwLIqNemNPKTG25GbzNbXSuAOMUD7Q7r3hc=; b=NQixLxv4LwCMSQeRBfKEamt5iH
	tdFSxCyZpqNrfaN4+F/bjclImQE3nRrIC0Bp0e6uExdvwvMkaRrch17UaTflXCByOE2WA04WzqV/9
	A4DdcDCdikgO3yrozxH6adfg0QlV1C92fAZG4gu6ONKnsCEl2vWTuEiIiSIf434B4UoEQBxBQG9j1
	TfqhyE+inKsAIK59iof1xN6+KUdjTlWbkVQynp4v0HHRhaMOPkv8sG2h3YHPC0Upf2/7BtPlvizNw
	sBrMCow2q55jxolNr/i+CDlTgnMaEqPYL2lXhrXynisOOdMXyOXogVr/r1aFzSGgOwEqH6yYejGSS
	6jVeAuFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trjRu-00000003onP-0nR6;
	Mon, 10 Mar 2025 20:10:06 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trjIc-00000003nFY-0uks;
	Mon, 10 Mar 2025 20:00:31 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741636816; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Qyxr3aJkeBQAq0L6yjvx4RPkXyFEiMxLPcg6PjjDqbYBfC6EIxrM7c3oXROTecwsy0llDeAGgCVobyi1raYrYovEmi9ugwbRdJtnx1DQgh18kYql9G0SiCZn6Mr4xx3/2zlEKFNvTL+krZU1z7eUnAxjdcGrpP0QGnc4qF4LlkQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741636816; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZFdaB7brRwLIqNemNPKTG25GbzNbXSuAOMUD7Q7r3hc=; 
	b=MIqBBl36ZSvjTnWbQfb7iDBMKvhL2sW8Ae+r/YYNiYuyr6bOmjNKp6xFWjWr14/nlsc0o24rA2atfDLi8B4NXNkmbVLGOd2gSOMXT2CXOG22DG42GqDncj9krV0VVhFBAYx2piA5e29c3UDIrzhP9AUGqbb2vOH1+70fKvnFiFk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741636816;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ZFdaB7brRwLIqNemNPKTG25GbzNbXSuAOMUD7Q7r3hc=;
	b=XRFB2hK94KDo+X/2ol9lRhnmk62XqlLS4u/WptOz30sIj5qc6tC7UxaCtuf0AkPI
	6miSmXzgg42EZpN5SyzRZZXLBYVaxRVJe0B/RLcJpyO7ar9tfplJ5JZTCmX11DZDwwW
	QEJ7Y1ZPxnc6rsuyL8lPygnXwV3YwKRN169eQELw=
Received: by mx.zohomail.com with SMTPS id 1741636814321993.7241909367491;
	Mon, 10 Mar 2025 13:00:14 -0700 (PDT)
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
Subject: [PATCH v1 5/6] drm/panfrost: Enable AARCH64_4K page table format on mediatek_mt8188
Date: Mon, 10 Mar 2025 16:59:20 -0300
Message-ID: <20250310195921.157511-6-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
References: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_130030_318997_063A997F 
X-CRM114-Status: UNSURE (   7.56  )
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

Now that Panfrost supports AARCH64_4K page table format, let's enable it
on Mediatek MT8188.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 0f3935556ac76..d7b8bded6d784 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -824,6 +824,7 @@ static const struct panfrost_compatible mediatek_mt8188_data = {
 	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
 	.pm_domain_names = mediatek_mt8183_pm_domains,
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
+	.gpu_configs = BIT(GPU_CONFIG_AARCH64_4K),
 };
 
 static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };
-- 
2.47.2


