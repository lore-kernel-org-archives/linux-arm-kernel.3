Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9325D637D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 00:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLKPb6tUtWuvaIwy1RvtfFfoipFQqhXlm0WTPWG9stQ=; b=YNigt84nqpHl9ycddAKKcuXl3v
	IiXgID3WD4ELSvePtxQEi6fmtOm0uJwkrgLPl6VGGKG++GScwzgkHOSq09fJ4a0YxJZ0g1SHvf0Ml
	Sq5UasYGZWS+xWTsjkdvY1fsst9h9YTR/4LmFgtfgin1GQTazhygxU9Puxv7p/cHyXUQFgyEDmgYr
	t3TWAjsOWql5JZ7DZU2zRPt9vgIF2PZpM8UaZtv4WHmVfVxFCZhGofRNrbos7b3c6J5S/5JleOocx
	CVKIjWPHx5TzuADEvD2lNXcncWc3BTLQjMsjwQD2Lf23xX9rHPw3XyfrEjnXk+NqkNilziuIbvI1b
	MgN8sn6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBO4k-00000008NKh-43UG;
	Thu, 14 Nov 2024 00:51:11 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBO1E-00000008N4a-33CA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 00:47:34 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3a4ccfde548so64465ab.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 16:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731545251; x=1732150051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLKPb6tUtWuvaIwy1RvtfFfoipFQqhXlm0WTPWG9stQ=;
        b=fWhXpfgVin47effGKnj0Atz6F0c7TpdbzcX5A4YvU0M+KFEtKwHuxeEYhXy8PYPCQK
         ks8jhql/eFW1LE+BrOC6BXrVWA1afQr1U0p+l/VCS/tp1j5vUIW39LBG+ZuwurVgHn8p
         I/tOf6dldy9WmAT1GqL2f7dJT8XgGW+6O6Y/uVkl/qk95UoTGGt/YVvabQyWhBR5y4LP
         7rqcckVkj5OP7ajtDc04jjYYEsh/RnkyBsDdxCMd33ojO9j0YpK05gpkEtut4hfLHtSn
         iasFbpDDYQmzgmQCF6oWNsyw8TEYF6CgUAjL9qu2eZkrSpwoatB8XrdHt9nq7WVR0cLU
         E9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731545251; x=1732150051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLKPb6tUtWuvaIwy1RvtfFfoipFQqhXlm0WTPWG9stQ=;
        b=vlMCZLrLFjv9MhL93sFsWCb4Q1aijBzZKrJuADFvbA4UOVuF58YHDdUfCKU8ds+hQA
         7k0gDo8nybGrs9MV4Vxf6lnd2hOCDUsyfBrCyncIzd0GfEzmVXJ+D6a31HTorIwVy8L4
         CKyeIE0DgmWW7x1DdrGzndyDjC1nwCLbJOb59niSNjfyHEZL2jNqMgCK+AOwHL1Leq0Y
         k/fPGO9BBMDNYGavBadTvDwTFge8gBVaQq7JhPGbnKMEycnLBtBUE1OjjNaelQgpOQwg
         PxvII0pAysTZ9Qv6DRr34G4YKZBLgIUfEKz6eJh1jGh/Xrt+/9m5pWGfnvfl2cChQCg4
         Hhxw==
X-Forwarded-Encrypted: i=1; AJvYcCVEdHSiQTCZCBSL+KfKvAq2Ou+SnxSRh+f3rWdw2c2+dYNdT3p2CkLV/5YU7+6FRb1UZ1AA2hgSKNrseV0F8Iza@lists.infradead.org
X-Gm-Message-State: AOJu0YxcZma+xQ0n/+QtEVYKDL4moZJnTEKRjHX/+wgX1xgeiS0LwadJ
	nlLLLmnmVNc6U55vlk3QVu+DFaA22Lf21vSDwBk9e3DetrOFCrI3
X-Google-Smtp-Source: AGHT+IEQPohY/RxprSo/ZE/amxJXjaPA/03CfPwtD8Zlbhh428jqAhrJ8y9EcENEoACl7aqbla2/TQ==
X-Received: by 2002:a05:6e02:1709:b0:3a6:c4da:6031 with SMTP id e9e14a558f8ab-3a71de54216mr21112185ab.2.1731545251314;
        Wed, 13 Nov 2024 16:47:31 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::8f60])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a6f988fc9csm32277105ab.65.2024.11.13.16.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 16:47:30 -0800 (PST)
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
Subject: [PATCH v2 1/2] dt-bindings: iommu: arm,smmu: add sdm670 adreno iommu compatible
Date: Wed, 13 Nov 2024 19:47:15 -0500
Message-ID: <20241114004713.42404-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114004713.42404-4-mailingradian@gmail.com>
References: <20241114004713.42404-4-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_164732_786764_E4851917 
X-CRM114-Status: UNSURE (   9.64  )
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

SDM670 has a separate IOMMU for the GPU, like SDM845. Add the compatible
for it.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 92d350b8e01a..6d1b92a57dc4 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -119,6 +119,7 @@ properties:
               - qcom,msm8996-smmu-v2
               - qcom,sc7180-smmu-v2
               - qcom,sdm630-smmu-v2
+              - qcom,sdm670-smmu-v2
               - qcom,sdm845-smmu-v2
               - qcom,sm6350-smmu-v2
               - qcom,sm7150-smmu-v2
-- 
2.47.0


