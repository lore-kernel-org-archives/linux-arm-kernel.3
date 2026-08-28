Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746D7C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 12:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DRGIXLcHuELZx1Qe/K3lDAq7MZx3TuN6UHTja/wh6Zo=; b=P72Bqz8rKjjgGysJLC/4k1MQ0R
	zm6fMrv8ZPdyyI7QVf5fhg3YvEWenJydmsTypiQWNtu27O/YWqTUifJBGLjgzY3UCTqozvAJB3c0l
	OSi5cdN1Fp5+7y1OqAX0X74bEv7ZfQ0EndRuNsaizF4FVgvMYC2oSg9n7CM7ZWxGZsWwIy/UZ6yGA
	1X9nrvueqDsD/+0Q9qdcJ67+tmBR7LcUSSr1/b2BBHB5MegDLoiYJgAGndyryqg1HQcjodGoAmv/Q
	+5BML1bgE/IThqufqEU5lKiSRXJuIv8Iaw5mJr50DbpbLLD3+IbtYXty18hG9cNs20F34T2AIIhT+
	chibLoCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzw69-00000005lPZ-3Rqt;
	Fri, 28 Aug 2026 12:54:23 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzw65-00000005lOM-3J3H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 12:54:18 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-49b7c1dc61eso6392425e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 05:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787921654; x=1788526454; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DRGIXLcHuELZx1Qe/K3lDAq7MZx3TuN6UHTja/wh6Zo=;
        b=Q2uDfK3yQ7BjugjP4D22ooFWHncoCKUSHoEEK8J4S53r+f1c85NA2mMYO8rmTtNgHl
         i+92WX/W295GcEJuQPfjRw0nqo6W0L9BrVhZux/n50DiewWkyxUKu0N7+PU20gn3iyKv
         nIS3S0FUt1e2tFELPO32WtV6LKsKtolxkMITKKAnEvP7Np2SYRYHv+OUuU4LxYkRwX/+
         vB2pdINili2gKxoDEJFcqVmxSntOeXEsy/KjCkFGoZgt3At9t9l25PNXdWLFeDWU0SWR
         d+och+UKYddPbJmgONaRRJyJhUI1+E1HpIIq1XkooxOJ0hG35KAfHgb4EOwDhAZxEIVr
         TtDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921654; x=1788526454;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DRGIXLcHuELZx1Qe/K3lDAq7MZx3TuN6UHTja/wh6Zo=;
        b=FdxZ08qCPRmbk6l5S4WFTEYSd7ua8RD7a0oRfGoF4r5/QZg6i7HakgElQn1GuLZDF/
         697GBpqMduXvOW/pGngMT7qa5I+mTqbC+xhTTvBotHV2ziQgbOIMvng8ugYjNkaz17Nz
         aTMWnApl28fXczW9GDdIfIbfxneFzpc6/q1CHSaElV13IFfjvK+++MT0v3r3Z2+LM+HG
         yrW9QsV5WH/a6yHxiw/s84HsVijWT5z0S8ndMUsH/RWladNG+g2zgednddTIAosO90/Q
         BKaUgXMqUFej54RgQJbSS9WI4hcC9iuM888tyz3JomzW2mZvrnVqEwZ/FT9n4wB3iJAF
         w3mw==
X-Forwarded-Encrypted: i=1; AHgh+RqbEVcaTerFyhN67lJfHXe58OB4Dk1o40Bvv1l9Q6eZoQb2xuRY+oKg9qzcXEge2M/riSolvDeJZS6EcC5G4w4/@lists.infradead.org
X-Gm-Message-State: AFuF++l3bBdTmJysY01/T0UICrbqwGqC3rY7AsGwkCGpVdIQoDnYssFr
	/Zem24kH5M7UGikIvX6fj/FamcguCEqEG/xIztT/ByVvX/3SvnGFR2p8da9ym86saT4NXNLG+/7
	9fbLvtIlrKzA+nA==
X-Received: from wmsm23.prod.google.com ([2002:a05:600c:3b17:b0:495:6261:8954])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b21:b0:498:952:e276 with SMTP id 5b1f17b1804b1-49b91c3f643mr99111705e9.8.1787921654019;
 Fri, 28 Aug 2026 05:54:14 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:53:35 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260828125409.1921538-1-smostafa@google.com>
Subject: [PATCH 0/7] iommu/arm-smmu-v3: Fixes reported by Sashiko
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_055417_882464_C324C317 
X-CRM114-Status: GOOD (  11.45  )
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
missing NULL checks or bizarre HW/FW configs I don=E2=80=99t think are need=
ed).

I also sorted the patches based on severity from the most critical to
the least, so it is easier to apply a prefix if some bugs are too
theoretical

Mostafa Saleh (7):
  iommu/arm-smmu-v3: Ensure L2 tables are visible before L1 ptrs
  iommu/arm-smmu-v3: Prevent rbtree corruption from duplicate streams
  iommu/arm-smmu-v3-iommufd: Fix error path in
    arm_vsmmu_cache_invalidate()
  iommu/arm-smmu-v3-test: Fix arm_smmu_v3_test_debug_print_used_bits()
  iommu/arm-smmu-v3-test: Add missing error checks for inv array
  iommu/arm-smmu-v3-test: Fix OOB in arm_smmu_v3_invs_test_verify()
  iommu/arm-smmu-v3-test: Fix UBSAN error

 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 12 +++++-----
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 19 +++++++++++++---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 22 ++++++++++++++-----
 3 files changed, 39 insertions(+), 14 deletions(-)

--=20
2.55.0.897.gb25b4bd76c-goog


