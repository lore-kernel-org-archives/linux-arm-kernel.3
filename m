Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2929CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvQ7rT8sfpUuWMPN37mpWwK5CZ/GStRVkhZPxjRKMSU=; b=Rt061Z1g2HlygxlvE0cDWSKLDW
	38DqnUNVqTACC/zReHQJCJob6g9n9T44U7p3nIw3oAONehLALSFk1FPQDOcQxFo9QDZk4TztVDGyE
	HWVQTsooIVvANiowq4SHIcROWJmQwW7CylP9MqUth3AtkmYlbIi4dRROJul0icJHoMSB6eJmZBEI4
	wB4DV0knfYmswqzSkrU2Tj6W3uGk24ZpEFZpBtHTcO4+aRoJYR9plY6iUGnALvq76JoLNQcWK5HoA
	3rOH0kpHHgUmZCdOf1JQrr7fOEjeBbl+NO/iYrss5mjc22UKPFUYG/e/R9Zws0pcy7NyduCGFiR5C
	3BzsLvgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlvB-00000006dNt-2BGs;
	Fri, 01 May 2026 11:20:37 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlv6-00000006dAv-1ANS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:20:33 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-66a3c95958fso1406490a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634429; x=1778239229; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OvQ7rT8sfpUuWMPN37mpWwK5CZ/GStRVkhZPxjRKMSU=;
        b=GLJzxu/FWLJ6wc59+izmPiZnGqYzRag3yQ1jNaIyz21w9q7Ztkbowhy3C5KjUdaGbT
         ycUkSYSSoww9tM1Sb35JvinBy/eDEoYfa4R8PLHaTtfpf00PnvprPgqBJD6fOtiTx+iZ
         rZ006zwZti5dgteCNWSvGbSnSnk0KlplXSWNzcqH7xMkMr9mTMNcvMNhh/z2QvMzLbzf
         /7h39JgqYgOW8tOKWfjrrqyV9ZFGgZpvMQhlII3qa+5t/dMyJNkSXGtjiBIX9OqxwnF6
         fXvZsy5p37zZcXKrbcBryKxKcRI4SiNlx7ZS0X/nDIBV5/ykK0BMmw7Uph6KDiPKJQzC
         rQbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634429; x=1778239229;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OvQ7rT8sfpUuWMPN37mpWwK5CZ/GStRVkhZPxjRKMSU=;
        b=T4YYYx58pY6JG2P1pwNi6QBKHerhjENUEbb+sofskdEtB3K2HAOtiE2rszRlQK1hp3
         qBYVdHYAVA9LrylDrIuyB3TIv1RCIah2hwiwoGN4ZOOzyK3gx3VIBQcqVmgq5sTzrMpO
         W6yJaoYiEwCx8LbA/vCa1+xrgDHUi/FG9LB6gqYBsHuTSd6tSZ5Kz78vzv9vl0G8GFJL
         C/5MT4OCVaRH5jn+kIYxGYpXrQfkzb0VzejvMZa+dzUVUVIrcW6rG1B1pt9feZOq6TvO
         IdpQtmonz6V3nx2jDjpKSILe1KwMlK2L0q9IOGJKqlKVJC/dTfkrFj34jRY/97hV/FJZ
         /NWQ==
X-Gm-Message-State: AOJu0YzwqT1VzIRAp41w1WOHPfRvmnnpVXuuTyX7YXPBBO45ZpgOkpdV
	iLRTx8bxCAVAiha9+CDBgI9HoPebcH0y0JyQvPGyJ6uKdKJypxjFAEaX5dRipV5rpmutCrb9g+6
	80K1cbNEOrGA7GBh4xoXzdWmNrcYADhjxAdJm05KJ5GtMHGfmAKvC9t2XumOkLI8/B8fgGqNtyK
	mTZg2fxcY5YeRrLq5p9A9ZuLD5S+hyi3SqWsA1lPhI+XkNxeMyj2edqV79m6ombpk7dQ==
X-Received: from edbeo10.prod.google.com ([2002:a05:6402:530a:b0:66f:bef2:d9de])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1588:b0:670:8b38:5717 with SMTP id 4fb4d7f45d1cf-67b5d84910cmr3588586a12.24.1777634428940;
 Fri, 01 May 2026 04:20:28 -0700 (PDT)
Date: Fri,  1 May 2026 11:19:23 +0000
In-Reply-To: <20260501111928.259252-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260501111928.259252-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501111928.259252-22-smostafa@google.com>
Subject: [PATCH v6 21/25] iommu/arm-smmu-v3-kvm: Emulate GBPA
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	mark.rutland@arm.com, qperret@google.com, tabba@google.com, 
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_042032_386487_F678F5DC 
X-CRM114-Status: GOOD (  14.69  )
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

That's is done by setting the GBPA to ABORT at init time, and host
writes are always ignored and host reads always return ABORT.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 32 +++++++++++++++++--
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iom=
mu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index e258690384f4..1ed5ccce7849 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -126,6 +126,22 @@ static int smmu_unshare_pages(phys_addr_t addr, size_t=
 size)
 	return 0;
 }
=20
+static int smmu_abort_gbpa(struct hyp_arm_smmu_v3_device *smmu)
+{
+	int ret;
+	u32 reg;
+
+	ret =3D smmu_wait(false,
+			(readl_relaxed(smmu->base + ARM_SMMU_GBPA) & GBPA_UPDATE) =3D=3D 0);
+	if (ret)
+		return ret;
+
+	reg =3D readl_relaxed(smmu->base + ARM_SMMU_GBPA);
+	writel_relaxed(GBPA_UPDATE | GBPA_ABORT | reg, smmu->base + ARM_SMMU_GBPA=
);
+	return smmu_wait(false,
+			 (readl_relaxed(smmu->base + ARM_SMMU_GBPA) & GBPA_UPDATE) =3D=3D 0);
+}
+
 static bool smmu_cmdq_has_space(struct arm_smmu_queue *cmdq, u32 n)
 {
 	struct arm_smmu_ll_queue *llq =3D &cmdq->llq;
@@ -468,6 +484,10 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_dev=
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
@@ -756,10 +776,16 @@ static bool smmu_dabt_device(struct hyp_arm_smmu_v3_d=
evice *smmu,
 			val =3D smmu->host_ste_cfg;
 			goto out_update_regs;
 		}
-	/* Passthrough the register access for bisectiblity, handled later */
 	case ARM_SMMU_GBPA:
-		mask =3D read_write;
-		break;
+		if (len !=3D sizeof(u32))
+			break;
+
+		/* Ignore write, always read to abort. */
+		if (!is_write) {
+			val =3D GBPA_ABORT;
+			goto out_update_regs;
+		}
+		goto out_ret;
 	case ARM_SMMU_CR0:
 		if (len !=3D sizeof(u32))
 			break;
--=20
2.54.0.545.g6539524ca2-goog


