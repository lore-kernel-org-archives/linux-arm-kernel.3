Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044DFC98314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 08:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jyisHEHOouXDnRhVknZZL0KL1V1yIbby3bAAKhAOqX0=; b=ddAORrMF/4F/7DQ2Ltsau++c5p
	VAQ8Nwed7YtPKrVsNYSSk5c+lvJxWgQV7THIsZurvlJqQZp5nHIY4/Ej/A4lzHT+JwSFm3/Ngv9U6
	OQmlCDbP4L5iO42tD62dKANl07A0VlwaK1+TtwhlwyzZvjsfFLHZgUqS1dZIUWbeHbMoybavZM8vZ
	vpJ0bemC3f+8HfbRhoTZkZsJrH7doCOoxUVrE7N9zHRxQW7gRBVo3Dxzhud40Ib+LJyeWH2/BXDMi
	2i1FAhujCHdkxkeEE8jPBqu3Ah8p/w6o0W048j8R5nprlliGzy7YsFCDzVEKLsl2TxIdkV0MyzAS1
	DimeVMIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fG0-0000000AVvV-3RX9;
	Thu, 24 Sep 2026 08:56:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fFr-0000000AVsI-1N5U
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 08:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jyisHEHOouXDnRhVknZZL0KL1V1yIbby3bAAKhAOqX0=; b=UOEZh+OZpNH6i2PZIq76laTon4
	ukH1uCjuUf5rl0mziswqer7vR/BTXw0Gr/WC/qrmTfWmSO59uSXvD6CDd8xFIsBbX/lHQSh2XYoDU
	qtDhQqT/VLVh8cSlgbTS6ExbE14VmTjsp7/QH/RpdhrftK0wjotIyV76aLI6kU3Qq808Y8PLbbPGv
	ejXZ27x41k1y6cOWlR7c23KJSeMhLG9zPSomjNmnvOw8ct9IWBy/1OEDusAQu+ZdXitALARjg5304
	3cu+LQOCE+cjIq9Qm+GnZswT+6ygx/96ilVol8Ng08QjtDXVOhT1XwpAvTZ/9wm/jgB8Sgdjnu9BY
	ZaA12G7w==;
Received: from mail-ed1-x547.google.com ([2a00:1450:4864:20::547])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9fFm-0000000Fl3S-3zve
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 08:56:34 +0000
Received: by mail-ed1-x547.google.com with SMTP id 4fb4d7f45d1cf-6a178080182so2221410a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 01:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790240187; x=1790844987; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jyisHEHOouXDnRhVknZZL0KL1V1yIbby3bAAKhAOqX0=;
        b=RZ45Phv4lDIwjtnGfPpbRupDNSAlT/TiaTT1zxMd06qp/yO59RJo1PMq1AGjMx60g/
         OnXLAkcDJ1Jx5VXP9zNQ9IUF4j/YGZVuimWpeXqAWSOJBR0SwyopoasCMR8ypash4zer
         iVCEQ6C8JgonegYG290hYPVmLGBtQEyeoBj/WiAAAlktOymL+qwizEzS+YIJtpBuLY0T
         euGDLjflUGl0YDbQK3s5foquOGKFMm+4GNtLmHt15iy8T4nXPlTofg5ChXfRUltTuIa7
         8DXbwUM30z40jyMGjHmJP/Bx/W751fs6raIkBrw2g/i/dtgnkh1DVvgtG5HLYcxtm5VQ
         wUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240187; x=1790844987;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jyisHEHOouXDnRhVknZZL0KL1V1yIbby3bAAKhAOqX0=;
        b=SIszZOyHqm4BfNl/3bb3J+YTwqfVOJ+NB4dwJ8BtDlHWc5GUcvY5q+Aa6w42T/LO0J
         ZuNnmsrnl0+aQnldLeAqFStIjx/9cMGdT0AcmM7jmPEb2Mg+UCq+7AgwnRdCM/H7j+LN
         2ryc+eS11lbFSarL+o7MIE7ZXZEMHqMwrAZT3o5Ghww3ljsyVDDMSPcw28JCXMNixTIm
         JFsQnzTnpDSuzzM/XYSIEIxdEsbf12O06nyadEmcGO9tqDADJjGpXJpEKVyORiPBOd2T
         tWefSUhxRBduQJ2npV/S+Y+oeUosH5ja6cThFPjctZmHRUQdZklWic23EfC83qz1q08q
         nA6Q==
X-Forwarded-Encrypted: i=1; AKwUvBz8q+rnVZgGB8xOHLdry+SbDKgT1XnQXdSTNE9MgCINiLcKhq25OIFCkSBWWS0qUjKAdOZijdXK530toQoRjI78@lists.infradead.org
X-Gm-Message-State: AFuF++luNvA8cC//L/DeicVCIbZ9k4jZxWEhX5n0jFwzap7tup/kkkd0
	s+85TUbaWxqwXcrN8Xf2tEjSo8ZNcfMA0wehbnAGJk+7ChgXTf7NK8PrSsYfZuLDM9w9Ekjf/mi
	rW5KxZHLiPiQvoA==
X-Received: from edb11.prod.google.com ([2002:a05:6402:238b:b0:699:e9c8:2d72])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5186:b0:6aa:a7f:d584 with SMTP id 4fb4d7f45d1cf-6aac90949demr1600686a12.42.1790240186819;
 Thu, 24 Sep 2026 01:56:26 -0700 (PDT)
Date: Thu, 24 Sep 2026 08:56:13 +0000
In-Reply-To: <20260924085616.300650-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260924085616.300650-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924085616.300650-3-smostafa@google.com>
Subject: [PATCH v2 2/5] iommu/arm-smmu-v3-test: Fix arm_smmu_v3_test_debug_print_used_bits()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, praan@google.com, Mostafa Saleh <smostafa@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_095632_526645_08852680 
X-CRM114-Status: GOOD (  10.98  )
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

arm_smmu_v3_test_debug_print_used_bits() hardcodes arm_smmu_get_ste_used()
instead of using the provided writer->ops->get_used() callback.
This caused Context Descriptors to be incorrectly parsed as STEs.

Fixes: 56e1a4cc2588 ("iommu/arm-smmu-v3: Add unit tests for arm_smmu_write_entry")
Reported-by: Sashiko <>
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
index add671363c82..eae08d4d77ec 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
@@ -125,8 +125,8 @@ arm_smmu_v3_test_debug_print_used_bits(struct arm_smmu_entry_writer *writer,
 {
 	__le64 used_bits[NUM_ENTRY_QWORDS] = {};
 
-	arm_smmu_get_ste_used(ste, used_bits);
-	pr_debug("STE used bits: ");
+	writer->ops->get_used(ste, used_bits);
+	pr_debug("Entry used bits: ");
 	print_hex_dump_debug("    ", DUMP_PREFIX_NONE, 16, 8, used_bits,
 			     sizeof(used_bits), false);
 }
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


