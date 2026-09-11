Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F2EC88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 14:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YL+f1x0LzF/9hCPrGz4VLEXthddv2gmGiJP9etZAd7I=; b=xwmTueKiAk3u7sfgwWOvHS5Dbt
	GitG4GbaKJr6A7h1BUpD+Fa7zvb0QNWYxJEHNW9nVltgzD5tZPHlY6JDlaMLNEWwNDmNttDRWlATJ
	PbmvrBCwESiSTnpVZXS+jZaiOnLhIM8vIKvSnEIkLI4y1aDGEdCt6gl2BkZoM3cllLrKPYeEu7tWc
	YwJ3pvPw/0ZJqtT9GVoBg5LbBJcLbOQcwLB77fk26AREoCDhaRUdZeVNbXWEcmVd+iOirnSVD3jrT
	D+Na1MG6mjDVpNz7WWcm2ZspbOlv4JG0E4O6D832oPS0uYl02saB33DAJYgalYtY7VUjwotsbnQgw
	FldJ1QXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52ey-0000000GyFT-3bu0;
	Fri, 11 Sep 2026 14:55:25 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52en-0000000GyBV-2sLR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 14:55:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=YL+f1x0LzF/9hCPrGz4VLEXthddv2gmGiJP9etZAd7I=; b=gbWOvfilTsBAXpD+yIHPasur+h
	xS45Z21xRqaBBAC5S2etbYyjgVzc5PCp4lDDcXaVat74Cy6CH6W8wqJaynxKW2ibP7gNjHULYR83b
	eLtoEL6bNftfKCpIrvvN7oHDAaG0LLpKhbtLf5Z3X5u2O6ODjCDbszWfToEwDUHQeUFWXxQ/2vbEe
	2e0ZRhHCgM7KtdzcWPTFU5Z4ykgub7XvVS/VbJD27ui0yGZqXp2eFSpynDJRkeHEMq1nBAbbJRa3r
	nSL4wKoGAju6LFueRQZUPckkzOSu6pOpniRTzyPy4MxLF69cgA8MtFpF7YGECrmaQty3EO+VwnEc7
	UV24km8A==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x52em-001Mpi-0Z;
	Fri, 11 Sep 2026 14:55:12 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 11 Sep 2026 07:54:45 -0700
Subject: [PATCH 2/2] iommu/arm-smmu-v3: defer attach in kdump so inherited
 entries survive probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-smmu_fix_aws-v1-2-75870bf9655b@debian.org>
References: <20260911-smmu_fix_aws-v1-0-75870bf9655b@debian.org>
In-Reply-To: <20260911-smmu_fix_aws-v1-0-75870bf9655b@debian.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, catalin.marinas@arm.com, 
 mark.rutland@arm.com
Cc: puranjay@kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, rmikey@meta.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858; i=leitao@debian.org;
 h=from:subject:message-id; bh=4f9XazJ84/Q81ykJOH80nzaLk4jPrDtKBF63TT3P4jY=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqpBZDpszgURqDACr8/r9f69rhRqZmjzYWYzzOT
 Fe4CkbpleiJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaqQWQwAKCRA1o5Of/Hh3
 baf5D/98WYBU0cIJK2ZDbZhLhvc4inI4uQcsvLz0PI7wkGZdp4+2zbfpYOyUG/BETjNVWr+HiYU
 nyQEzhqHB07H8U71ZHwR6fLp9qDu7alAtKG8I+X3BknobqHcPuEQfwLgeWstQldBjvd1zCVMgI2
 Q539lXSgM92fbElZELEoKAKFqRecu5ZMtnm88eeedpdLTEkgDI/AzdF4xoJ3YcLIZ58gneWWEcA
 XVseN/lR7JW464C49MIdKbu3T+BtYFBQKCpOluHA0xJoNy3ZrtJOXYowOqe3GxlhjnZhZ7UfCoi
 3OEXwA8HD4ouHSnUkGE+5Mn6v9+AOpcf4T3bgwttxZobq9BlwjNpCOmLh3O5u2sd9PgxsOv+rc3
 okwXG89jOYpDkqpmuqQHjFxEIRSgi2pyU2voQG9sFzOCLzv2ZG7HYiN7/SdEohwgvXgGkXiW38g
 xVvW0SEYiyLVLFUXEGJm85d41ATSNOBmMEnx3KQ+QUbWz979/VNG9vbmjjvq/HOrLl+WxrXXAst
 KoJSgZ6rrqTu+Xhj9YwJy1RJ/RQA9VeXskALGWFRyJiJd7oxT4D9Zkq6hn8Smt8BAFQqpqBxFP1
 zlvgxtLtGcYo+3228mfdV38AoxX59F53Jq7YqeHBJGGPi1niyRKsgtzVV7oRoOe18IM6CoBlpOS
 X1+ibV1VOSgqwBQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_075513_742812_1D14315F 
X-CRM114-Status: UNSURE (   9.83  )
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

An inherited stream table keeps the crashed kernel's devices translating
only until the core probes them. iommu_setup_default_domain() then attaches
a default domain, replacing the inherited entry with one that maps nothing,
and the fault returns as F_TRANSLATION:

  [   37.824064] pci 0003:2d:00.0: Adding to iommu group 62
  [   38.035698] arm-smmu-v3 arm-smmu-v3.0.auto: event: F_TRANSLATION client: 0003:2d:00.0 iova: 0xfffe2965

The core already avoids this. iommu_dma_init() enables deferred attach in a
capture kernel, but only honours it for drivers implementing
.is_attach_deferred, which so far means amd and intel.

Implement it for SMMU, so we keep the inherited table until the next
DMA.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 51a809400d56a..9c8b344c75ab8 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4400,6 +4400,11 @@ static int arm_smmu_def_domain_type(struct device *dev)
 	return 0;
 }
 
+static bool arm_smmu_is_attach_deferred(struct device *dev)
+{
+	return is_kdump_kernel();
+}
+
 static const struct iommu_ops arm_smmu_ops = {
 	.identity_domain	= &arm_smmu_identity_domain,
 	.blocked_domain		= &arm_smmu_blocked_domain,
@@ -4415,6 +4420,7 @@ static const struct iommu_ops arm_smmu_ops = {
 	.get_resv_regions	= arm_smmu_get_resv_regions,
 	.page_response		= arm_smmu_page_response,
 	.def_domain_type	= arm_smmu_def_domain_type,
+	.is_attach_deferred	= arm_smmu_is_attach_deferred,
 	.get_viommu_size	= arm_smmu_get_viommu_size,
 	.viommu_init		= arm_vsmmu_init,
 	.user_pasid_table	= 1,

-- 
2.53.0-Meta


