Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C170EC98314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 08:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7LSd8Ovvvgudslzcc9mvhRx3yyqB59TfcDqoB3H0gGE=; b=ZIGnrT6ncrzlwmL0lFQzjJfs6a
	Ck2yxPv1TqbPIf9uQqjKo1XiVXqrjsolZV2jeB8bjjEVVrb8ssEayALGZSczIgkJj4tAoMvWX3Hv5
	6zeMyxPDbfVVFsJIWLKWEDumO+g2b7uzxbILAUIxNYl1rvo0TaYfn2jNrXygE0tuYFyt9ypuOhniy
	umta24NQr/dIYtyMxF7qYsjwO42sPztg5jOEOcyrhtKZ//naWXfve1ETqm0Vfe0fRRwG29zzoRwZD
	cxYHYyxdC8sbO+hfj0csyLowd6Cg7pEfhq2AxI63VAdapr0peuZDxoC481e7Sc7uHEuYO7fEhMT7d
	jq52fWTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fFm-0000000AVpR-28Hq;
	Thu, 24 Sep 2026 08:56:31 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fFj-0000000AVob-2JKC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 08:56:29 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-4870487e33aso615390f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 01:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790240185; x=1790844985; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7LSd8Ovvvgudslzcc9mvhRx3yyqB59TfcDqoB3H0gGE=;
        b=K3I6vJAjWvHlh1qC7nHmz1bTBQ4ivdRCKxy9rHJxBbDr1GTNqDnMjRVe90N7qKj6La
         8Ual3S6o5TnmkFnP0NEnXyAcy2kNCJa9d+YBKxwY3g0CPHjCBXwFYq8CJPwIk4e7XecI
         zF/QF7aEmUrvTJRaaha4H4hQvPCP2ZEOJ5wMckjVPcKSGxvt0KT6aDCjeRQ+Y5Musob7
         cqozmE3fxKsaH9t09LxDFSYcym761U2Eb+wK9BhrMyIJQlWAUkPNFmT/CasKTY8Bk9xb
         6fsND/bE6nKZXsoxvgWPqdTDpttFNVME303ZQOkjtIBYYsyLB7OE8541DSpZDW8OKiOR
         LBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240185; x=1790844985;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7LSd8Ovvvgudslzcc9mvhRx3yyqB59TfcDqoB3H0gGE=;
        b=arbyr7s8Y29rE2vijc0GKnFhkjAPc+D9mE/KqZx8aKCRtkPE7JqDo4waHAMrjRXU+D
         7W3nObFidQFlZQLXPmgY+OoUKoppkSXOf0xdP796PUCkGW0MAY2ZV0A60SctPsNoPO0T
         DychjY2JWvPvxrhozP6UIgQ0aExnMGFtv3EBCLDimj6KfKjRG+WXC5I7FvtCCtvyUGJW
         wYIHpGInI+lKQXrPeYaJXBUWjpt9W9zxcwdoZvKLtDC5ElqZrMpMJAptIuEOAxzayDWE
         jBTebF1EMeh6q7YbaP/XxQIx2yqUXztft2Rf6Gg5vi4e5CbgB0y1C+dtE3SpDvVJ5jml
         m7vQ==
X-Forwarded-Encrypted: i=1; AKwUvBzd6mz7czFK3u+QSXAQeZL2iszjUiCoVIda9ECc/rQ+ly7QSEEtiaPU/DbH8iK0bisZWZdyj3UNDFXEYiFdKFMt@lists.infradead.org
X-Gm-Message-State: AFuF++mgSnoi9ZfCCzNPgV7InhmSnJD6GNRzt1uQ4Juh+zG577PtnZbd
	cWt/Bo9FNWTd67u1u8ETfPOa50/PkhWS4rgSOpvxvrWg0aDodScYneM/T/Ihm0V6mD/vyHOPtxb
	VYDiI/cESNGtKgg==
X-Received: from wrhm8.prod.google.com ([2002:a05:6000:1808:b0:487:2121:9f6c])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:41ee:b0:487:221f:65b8 with SMTP id ffacd0b85a97d-4887177530cmr2877325f8f.50.1790240184346;
 Thu, 24 Sep 2026 01:56:24 -0700 (PDT)
Date: Thu, 24 Sep 2026 08:56:11 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924085616.300650-1-smostafa@google.com>
Subject: [PATCH v2 0/5] iommu/arm-smmu-v3: Fixes reported by Sashiko
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_015627_610846_58822025 
X-CRM114-Status: GOOD (  12.77  )
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

While running sashiko locally on the pKVM SMMUv3 driver patches, it
reported some pre-existing issues in the SMMUv3 driver (the RB tree
corruption and a missing NULL check) and given that this is not the
first time a pre-existing issue appears in the driver from sashiko,
I went ahead and passed the whole driver to Sashiko which reported a
dozen of other issues(except the last one in this series), I included
fixes for bugs I believe are true or worth fixing (others were mostly
missing NULL checks or bizarre HW/FW configs I don't think are needed).

I also sorted the patches based on severity from the most critical to
the least, so it is easier to apply a prefix if some bugs are too
theoretical

Changes in v2:
v1: https://lore.kernel.org/all/20260828125409.1921538-1-smostafa@google.com/
- Drop patches 2 and 3 as they are fixed by other patches on the list
- Collect Rbs

Mostafa Saleh (5):
  iommu/arm-smmu-v3: Ensure L2 tables are visible before L1 ptrs
  iommu/arm-smmu-v3-test: Fix arm_smmu_v3_test_debug_print_used_bits()
  iommu/arm-smmu-v3-test: Add missing error checks for inv array
  iommu/arm-smmu-v3-test: Fix OOB in arm_smmu_v3_invs_test_verify()
  iommu/arm-smmu-v3-test: Fix UBSAN error

 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 19 ++++++++++++++++---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  6 ++++++
 2 files changed, 22 insertions(+), 3 deletions(-)

-- 
2.56.0.rc1.315.gc6ed9934b7-goog


