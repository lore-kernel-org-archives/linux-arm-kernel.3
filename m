Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28A5CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 18:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Pr/AhyDI18gHyudCTe0PajcLVV2Ma7cRe8uP5zP/9Y=; b=OLuwAUJc/1UbUTIjLdDcs4JQ0V
	bm5awifMMz9SLKiMoX1so46JNMjHyxpSNCRzptsWFg66pSXFR8Tc2XggZpIWKZT6QgG+QMdufHqy+
	lXKYPPdnAxLjnF4VPiw3VWIbdK7x7yZlg9R3KCfrw2UulFg+m8p80c0lXhVP1vCGaw8thyEDwbL03
	Y0CMSBKwxMIW/r9RsLLS8CNe4cAl5NZZvYP3ReyN1usFo5y7k6U00lxurjIwyytKmZL92F4QRI87M
	TS29y3kOQgvtfR94ipqnGOHtSYwYEcgLf/lFcTO5HTG4qqOxQ8yCAiunfK2qMVe5KWXbvpFQOLqMC
	3FzcCR9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4IH-0000000Gehd-2r60;
	Mon, 17 Nov 2025 18:49:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4HX-0000000GdlP-0vLu
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Nov 2025 18:48:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7Pr/AhyDI18gHyudCTe0PajcLVV2Ma7cRe8uP5zP/9Y=; b=bj/CS0b1YdmoY+Pk4ZwCaICLkN
	vD8lMXrdxpSLUlC4Q9+oA3y3okOccVaMoeunB9BbYdsbd4ox1hAEnlokvQNM+uW8AqyK6ceCvF91k
	VqxiEj66DCBxqwPdO4N99qdTSVmrytGxuRT3MmifUwyVvmNc4V9Ef78PnPerpNYKiPYiXXo23XOgj
	oAkD5bPV5uR+4nvzHLyTBmK/6HjK/35FIo0BRcM93Iqq82p5hnHG9X2eMD5Mv37H0/UGl88p0UGlI
	yBma3xiqTQEvnFeVutKfA+F/yGEUgk7c0TWMkb+1Wt0QGSmnSKnqQb13qftBO6fqoiuqEgaYW6NDg
	QuPflyFw==;
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3Pp-00000007wfP-21zm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 17:53:28 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-42b2c8fb84fso2461655f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 10:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763405330; x=1764010130; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Pr/AhyDI18gHyudCTe0PajcLVV2Ma7cRe8uP5zP/9Y=;
        b=T++9JMdYf65679I+0yvUSFwZnguHyczQHYdlhUGnOW6rsGkonR3k/9ePMHXkxntdyo
         lMwn7Cys9FThrYZnsLqo5krbTEhTcP/NewM841t6vmPeBbjx38op7wE/eE0tUpgi0SC2
         QMnqhJgtIseZ26Rfv8Fee22IVxVM38w70PdwlaBvWM7dtZ2fVzokl0pdFhm72675JF9U
         hGASv4+EBsL0sqlvtrZA3wT1QWK8meMd9lJvjfxbYMbIGM/TzU3pRVrIZyyzzGfxu3XT
         uUkSOoQqAgK4AjnlItMB+TLtLpBWZ5lVmAoVCdqajRs1daWbH5+eggvNfeIyUZ6hoEj2
         XHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405330; x=1764010130;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7Pr/AhyDI18gHyudCTe0PajcLVV2Ma7cRe8uP5zP/9Y=;
        b=Wj2gXS1ZnVRttQH0NGYTsQoDoR6cj4ieBbx094Pr1PSC7X5mjgfIUmFLhCv2X3wah6
         BOLMCwDuKAnJ8aR5Wx5YMsagMFxxprHOCHmIFSTWosR/NPgQ6eCT0RpYP4wORXbbGspd
         i3o9ZVT3ZRIf9gEe//RqeK2f7edaIvD6dvdJ0Vhcf62posg7lAIX+raF0fRLEGnIqKNc
         M6+4H9IL170zbA2p2S1FX7iN/POqKhViLbBQZn4ybFD9JO6jScYVph4RApqnVn4g9ZiV
         MoPoIt7jrpeMfCE2oGqrlwytDBU+OXdqD0wgSSRxmdjYpNfoT88QY5ZparyIXeb0jrkz
         W6ZQ==
X-Gm-Message-State: AOJu0YxhX/6+S1PUy6XrHt59l5TrfUENpbyegqQTsjQ3leyl9R84ugS4
	s22B8rc3djF/sG6Auq1ekNxCAfqkmogXJ0ZEQwAQdYATC/f/dMY1I7+WNMvOTZkshMV5Lclr8gR
	NRAOgugSio5lriwlV8H6cUyrCytk/cfRYwk2Jhdl8o6MFUZyAtp3LtIZ309vwNlYWrEZnEuwv0Y
	hTXMQ1p2u+is58jKojYMG1kk1gxFbZriJvO5rBmPe4+a6/Y5odqMQvpcn4Gpq9u96sEw==
X-Google-Smtp-Source: AGHT+IEp1GJrifJg25A7HBsu430z3IudVIoooo816bFplXawdroOYHu2KCfVFavBNdBdQ4MlmLiDzZJPVbDY1w==
X-Received: from wrbee4.prod.google.com ([2002:a05:6000:2104:b0:42b:3308:563])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1849:b0:429:d725:4125 with SMTP id ffacd0b85a97d-42b5959e88dmr13794450f8f.54.1763405329830;
 Mon, 17 Nov 2025 10:48:49 -0800 (PST)
Date: Mon, 17 Nov 2025 18:48:11 +0000
In-Reply-To: <20251117184815.1027271-1-smostafa@google.com>
Mime-Version: 1.0
References: <20251117184815.1027271-1-smostafa@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251117184815.1027271-25-smostafa@google.com>
Subject: [PATCH v5 24/27] iommu/arm-smmu-v3-kvm: Emulate GBPA
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_175325_584492_91C57BE1 
X-CRM114-Status: GOOD (  13.96  )
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

The last bit of emulation is GBPA. it must be always set to ABORT,
as when the SMMU is disabled it=E2=80=99s not allowed for the host to bypas=
s
the SMMU.

That =E2=80=98s is done by setting the GBPA to ABORT at init time, and host
writes are always ignored and host reads always return ABORT.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 21 ++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iom=
mu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index fbe1e13fc15d..0a2ce6c06f4f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -115,6 +115,14 @@ static int smmu_unshare_pages(phys_addr_t addr, size_t=
 size)
 	return 0;
 }
=20
+static int smmu_abort_gbpa(struct hyp_arm_smmu_v3_device *smmu)
+{
+	writel_relaxed(GBPA_UPDATE | GBPA_ABORT, smmu->base + ARM_SMMU_GBPA);
+	/* Wait till UPDATE is cleared. */
+	return smmu_wait(false,
+			 readl_relaxed(smmu->base + ARM_SMMU_GBPA) =3D=3D GBPA_ABORT);
+}
+
 static bool smmu_cmdq_has_space(struct arm_smmu_queue *cmdq, u32 n)
 {
 	struct arm_smmu_ll_queue *llq =3D &cmdq->llq;
@@ -435,6 +443,10 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_dev=
ice *smmu)
 	if (ret)
 		goto out_ret;
=20
+	ret =3D smmu_abort_gbpa(smmu);
+	if (ret)
+		goto out_ret;
+
 	return 0;
=20
 out_ret:
@@ -672,10 +684,13 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_d=
evice *smmu,
 			smmu->host_ste_cfg =3D val;
 		}
 		goto out_ret;
-	/* Passthrough the register access for bisectiblity, handled later */
 	case ARM_SMMU_GBPA:
-		mask =3D read_write;
-		break;
+		/* Ignore write, always read to abort. */
+		if (!is_write)
+			regs->regs[rd] =3D GBPA_ABORT;
+
+		WARN_ON(len !=3D sizeof(u32));
+		goto out_ret;
 	case ARM_SMMU_CR0:
 		if (is_write) {
 			bool last_cmdq_en =3D is_cmdq_enabled(smmu);
--=20
2.52.0.rc1.455.g30608eb744-goog


