Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0BDCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 19:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=peEOtIWNssxYKrb8NM+ypkApXFH2AI9AHn+rEkEvysE=; b=oVqNtGCnZNbNF4BsfP8UTfAotr
	KMLLzBMaMb5qKEBesJcHG1Dl2DOFkvMysr2ga2DBOcO/X/ZZDum5xBh7O6zop9xGb/b4AgTiPe2bJ
	j6X/aqFEVvngATQ4BboL0JwPvsGA7IJMRQtoqf7DZFHiqC5A8RIWsT0cXgXXrknWWEWhQS5dDdl7k
	Z4BJ4DQmyPJEvRhM7DCobSWeUvRQkd+4TP5XfdNlrXOvFWpl5oLVWR2GU9vk+ftQ1qQL2pFHeElvF
	hg6d8E3oGGRdl5RE4rwLC7j0rbUAzM3Q0R6T8On/lzrshxgw0/mjdKygo8DazytJhlBqzXFQt/r/r
	OBSF+rXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjEq-0000000CQij-159X;
	Fri, 02 Oct 2026 19:48:12 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjEm-0000000CQhR-3qxM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 19:48:10 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-9104e54b1abso3474766d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 12:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790970487; x=1791575287; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=peEOtIWNssxYKrb8NM+ypkApXFH2AI9AHn+rEkEvysE=;
        b=bjr1H0gntWlAblsBgN+RzzUrAb+upGeZ3KGt9UHCSwiYJ4JLdNzuDpcP9ok4uDvvzo
         ID479JjU7xOwWLM13Nl1kKu66Y5A08OT2L/nRNoZbukT7KrAyZiEMkF+TcHF9BocsfRO
         HYTEG6HXJoPOTBwqHsBhFggxGpAeig8eYm/j6OtOlMp6DI34Fxf00M6J7dbh3WDoBHpw
         oBX92ymAbgz+1Oej+BU4ZJK58KJlYzzJ8XHDjFA7o/DHOAAVmEu+VfD1LcXFY6KVMh3v
         ZcvRMOX0sOqW3oqsDRJxNPgMbFWgpG0Cvj/KHS6vGUviDqg8bRPgp8itFzQZY5YmVvI3
         susg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970487; x=1791575287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=peEOtIWNssxYKrb8NM+ypkApXFH2AI9AHn+rEkEvysE=;
        b=zKcfUxH8jSLc4lDgMHYTvEa+a9yA6Re5vjjXt88NxepdDiEY9doC/xNE58nRiIzFMx
         zzQ02oGS+e/iH9cuikK+SxMz0SXgZQmAE4ipbDHTDfC8YiO5yaUCQLGs4Tnmzq0Lcks5
         MNieQAkOIO2DXaoUDv1UUZSBPt7aaI1Jl+hnzdbx7symyGgcrEcW9eVcHxUNu2bWQGso
         21954XR4r2v0qK6heEIRBPW6dCsUX3MBq1Y7Fo/r9OwwG286pS/XODS+6NRrN2rHMh/2
         5S2XB2Qn491O+As52Z6ogE9AKmWNBXSrZTsSdQJjahp0u2xgMLt6l81R1zoYBb/fEKkN
         3irg==
X-Forwarded-Encrypted: i=1; AKwUvBxiJkw6vE7atqSS5DDmj5NSI4X9uFr3wVUY7DB8MGOf3HUdpLAPDeDvbV8h+rNn7mne9YkBoXYoksWJprbXu6HT@lists.infradead.org
X-Gm-Message-State: AFuF++mIhPE4hZhYPnLYL9NqaTh/2x3TkJHORFnVJbRDxboRBAiZ2nkQ
	spxRROtzQ8JD0YK1FqIOFGDt92NQJjcNkaORNjCbsZjrbQDlnk3k4HE=
X-Gm-Gg: AYBFou3chMgh57mA8UDZkR/SdC1Bsfa37Y0ZbMmnJ0ZV3YI6wjUAoK6DMGmPrJKJDIU
	kL0FeLHGtgkg4SPmlOEQ3fZWwhiJQR4S/0z9R7b8N4YhzPuRZr6g5KwFBLF9SyHKgGSy0ePRu61
	iRF36UBFlWARwnu5ZGGaCXSXnQzDYeMHTbHBubTKe/DrfQiVcQ0Vc4lJC61KS0esekOzYTqKdQ2
	Ss7J1gw/cexLVpvaxigw+LwzpLPFe8oBt7y53db/BNNXBdqN/YlJm/rB4HGgeGzsf5MEAxtZUJh
	he+hav/tNOsPfuHlR+8mbv9mQvRYxwua4pIWf7QS5TVt5oARruAm9ig1mpSEofIlJP9N+Nu4buX
	qxAanA12g3tHISzIoKhm+Zc58v25+rz7C2C3Y1knThw3eWzKKEn4FUY2aIMWC58VgzcsXeD4SHD
	NDqg/U5SnfJ7XPPCOM47BT/48du4I+wJ2rtI55yBsROruEBFJ/PBiiFvi6kZ8Y0M+RVRbMG5/qi
	cwS9L6dKW/nPoCc9LewkuLhxFRVb2KH0cK32cYMgpW6mtc1dctMkCL3j0PAXFiizgOnbUZcyvwX
	IN8Zkf2M1S4D1F1Guim5sgtIDN2y
X-Received: by 2002:a05:620a:4052:b0:93b:db80:e0cf with SMTP id af79cd13be357-93cf1a393damr685608685a.60.1790970487600;
        Fri, 02 Oct 2026 12:48:07 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca2ed5e2sm296846985a.47.2026.10.02.12.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:48:06 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Christophe Leroy <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>,
	mhun512@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] soc: fsl: dpio: Fix cleanup on IRQ registration failure
Date: Fri,  2 Oct 2026 15:48:01 -0400
Message-ID: <20261002194802.375497-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002194802.375497-1-mhun512@gmail.com>
References: <20261002194802.375497-1-mhun512@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_124808_964487_B842F583 
X-CRM114-Status: GOOD (  13.37  )
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

IRQ registration happens after dpaa2_io_create(), but its failure path
only releases the IRQ resources and the MC portal. The I/O object stays
allocated and published in the service list and per-CPU lookup table,
while devres unmaps its portal registers after probe fails.

Call dpaa2_io_down() on IRQ registration failure to remove the object
from those lookup structures and free it. Reorder the error labels so
that a failed dpaa2_io_create() still skips this cleanup.

Remove unregister_dpio_irq_handlers() from the probe error path, since
no IRQ handler or affinity hint has been installed when registration
fails.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: fe8fe7723a3a ("soc: fsl: dpio: register dpio irq handlers after dpio create")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Remove the unnecessary unregister_dpio_irq_handlers() call from
  the probe error path, as suggested by Ioana Ciornei.
- Include this fix as patch 1 of the two-patch DPIO cleanup series.
- Add Cc: stable@vger.kernel.org.

 drivers/soc/fsl/dpio/dpio-driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/dpio/dpio-driver.c b/drivers/soc/fsl/dpio/dpio-driver.c
index d5198ff..8d31346 100644
--- a/drivers/soc/fsl/dpio/dpio-driver.c
+++ b/drivers/soc/fsl/dpio/dpio-driver.c
@@ -244,9 +244,9 @@ static int dpaa2_dpio_probe(struct fsl_mc_device *dpio_dev)
 
 	return 0;
 
-err_dpaa2_io_create:
-	unregister_dpio_irq_handlers(dpio_dev);
 err_register_dpio_irq:
+	dpaa2_io_down(priv->io);
+err_dpaa2_io_create:
 	fsl_mc_free_irqs(dpio_dev);
 err_allocate_irqs:
 	dpio_disable(dpio_dev->mc_io, 0, dpio_dev->mc_handle);
-- 
2.53.0


