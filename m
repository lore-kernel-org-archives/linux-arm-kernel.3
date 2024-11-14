Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F894D637D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 00:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OfeWIa2nRRaLMa7E3TxB2pqTwWPv20hKS0WKJTtnevs=; b=ppnWr6UYKulx1ofcu2MpYJfDfz
	bEngE3Q9GrTt7crFmHeUue1LKexjitJrTwKdwSsVjbr9kR1gTYDoZ6fCmznTNPkEuxa5iUXy5ZTix
	wUpopNdM1Gp0D46Z7TK7BuJK2deCqZ7sYaU1d7DateQIrTiprL26DbTd6SgMjsriJQzV1Ko7IATOe
	Fxd6qU+/C80G3reSaNlLaDjg6oI5pdVJN8LSxcSc0N4w4oIqLfd4x8aHq6AqRq1PMEzs4BIXO5s/F
	aiK//+2Nqgxsk/IRcpxrbVQ2vYQ2B4QI9ZBAEuxjAODEuWZBTH0/pTlttYBFirEUT+uS7361gQeEU
	qDaUCarA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBO6W-00000008NWw-1Lsd;
	Thu, 14 Nov 2024 00:53:00 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBO1I-00000008N4w-0i9Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 00:47:37 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3a6af694220so230855ab.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 16:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731545255; x=1732150055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfeWIa2nRRaLMa7E3TxB2pqTwWPv20hKS0WKJTtnevs=;
        b=C9Mwd8sgG/c7JGrKeZsmYN7pS6BW3ZAdzQkTh03BomBP/CUwBTV7xA1azGmDeBEBsM
         zCnPe1BYbhjWKTHMcmkVG4EOQAoMVbrheaKuSUW5zoALBY+CI82+VDCKrPIy7bLBXibb
         Yir1U6N7NrsIqmqKwEvg/cKX5KzNgkj55QSsjgLCwIAXEV3pOrbTToh7tEvcOwWPBJGo
         IbNkifwdg3i3UvndxciC7Dod1HX2VenPWT9YM/Wi55Dyt+oeJWHsEgXUmF5L8KqUu1ER
         MAGULqKkqX7m6QgyKHQc74lCqQTpnpLuQUkgC/X6Qno4slT2Ip5+cPXOaJ73O594oQXZ
         QCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731545255; x=1732150055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OfeWIa2nRRaLMa7E3TxB2pqTwWPv20hKS0WKJTtnevs=;
        b=bgYNpeJ5X6M1g1r3jSCrTm9LExql3pPSNdoF3LoOyz9lPqUe9kt3ZP7kEEVGTNCGhc
         V8oVRrymUG6iQCgu4lTXSCQnvQKs8TPoABvDcRa0jEhUHpdiIYhSYS4spIrbVQr5Rk7S
         SA3kKatKMzBeMqjZj46/7BclcCJk6rqLBJ1yEb0sityCLqpcqVvvD8xYLnWZq6MrgG87
         tDzryOb4dC2WmtHd7LuBiF+5ue4aJebKM1Ee4mFjsfSluhJYY/WIusBCfWH4UvwJ+kCR
         dQ+iLeG0e5s2xUU+0hYEgNkf25ZVkCbE+TsmQh5n0SBe+/xDEfO+LKQ/duzi6EG6Qe/j
         H9Pw==
X-Forwarded-Encrypted: i=1; AJvYcCViYNTD+4U/sf9qEqMAXevi2lppP6+EKTZu18CbEpWQ8nX0MjkMKeml7aDtDQQhZjkKHsLxR/47tCk8S1oh3L2T@lists.infradead.org
X-Gm-Message-State: AOJu0YxoVNyxNkGbpDRHkSp2XnlBGDgNUQpw7GQBxr+oydl7M08BDDer
	d6NtBLBko7NgB1y1UhAW7GR70CIh7/kBXNP4al1GGjqYybgb5lS6OPk1HCly
X-Google-Smtp-Source: AGHT+IE/YfqP7Sjx0YczZnwTlxJkpO38uTXKwcD4NS9fALu47F5QGMi2FVOxn8z8wQMbRGQuOsqucQ==
X-Received: by 2002:a05:6e02:749:b0:3a4:ecdb:d61d with SMTP id e9e14a558f8ab-3a71fe3b539mr4886115ab.8.1731545254783;
        Wed, 13 Nov 2024 16:47:34 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::8f60])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e02fc619bfsm5011173.42.2024.11.13.16.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 16:47:34 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 2/2] iommu/arm-smmu-qcom: add sdm670 adreno iommu compatible
Date: Wed, 13 Nov 2024 19:47:16 -0500
Message-ID: <20241114004713.42404-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114004713.42404-4-mailingradian@gmail.com>
References: <20241114004713.42404-4-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_164736_232228_734EAD2A 
X-CRM114-Status: GOOD (  11.62  )
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

Add the compatible for the separate IOMMU on SDM670 for the Adreno GPU.

This IOMMU has the compatible strings:

	"qcom,sdm670-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2"

While the SMMU 500 doesn't need an entry for this specific SoC, the
SMMU v2 compatible should have its own entry, as the fallback entry in
arm-smmu.c handles "qcom,smmu-v2" without per-process page table support
unless there is an entry here. This entry can't be the
"qcom,adreno-smmu" compatible because dedicated GPU IOMMUs can also be
SMMU 500 with different handling.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 6372f3e25c4b..601fb878d0ef 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -567,6 +567,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_v2_data },
+	{ .compatible = "qcom,sdm670-smmu-v2", .data = &qcom_smmu_v2_data },
 	{ .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_v2_data },
 	{ .compatible = "qcom,sdm845-smmu-500", .data = &sdm845_smmu_500_data },
 	{ .compatible = "qcom,sm6115-smmu-500", .data = &qcom_smmu_500_impl0_data},
-- 
2.47.0


