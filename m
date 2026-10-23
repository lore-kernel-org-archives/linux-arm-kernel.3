Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF0C606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 07:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W7jWSpZZ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rz9uoQ0i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T+Q/gijWLNYJalY5gR1Couj/LNq0adkq+xT5gR4tON8=; b=W7jWSpZZxbIXQgE+v9SGzVzUYd
	0br6gOc8Z/znxWf5dxcY0UVfbMP4MASih2v8Ad5DrVycqFixP31jBwplcUWyGVYNLxESrkmcuLv2X
	33cJp9yYsSQKuydL4EIbQayDB/6BEJQ5GuFtjdKeoY+X4lMqnk3i6pgeuIJ4n9/1bgYDY13XzkCSu
	SUDcttMik36LLX+R+l24OKIn/ynCgPVlgbbZfDj9qZdZglKzohNby0d0J9jrE8ir885NgyJesXzpE
	bxj8wgBe1H7N8brcb1ZYzYUu6+Fa72z7Vmm1gOQ2+Kmqv96AfZd48/YNX/UJ8IYRvaWNSkmRueD1o
	jRAMvZDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA8M-0000000Fp63-2ww5;
	Fri, 23 Oct 2026 07:56:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA8I-0000000Fp5I-1K1A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 07:56:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C272602CA;
	Fri, 23 Oct 2026 07:56:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792742169;
	b=FnkNk9GX+j4ikyxZ0HREX0E9RYHzyfZyiS1kJ/vY9oGmIGLJEjHm4bcG6zLhv0GfGprJ
	 ZNk28hDB/gBcK5S4KVx8S4wg5wruI6CAQSV/nVMRGNWx/Bwd0zf6y34hneuPldF7SvtTG
	 LSBEEIzqAWZPuzsiDolcx3e8KhEUbWRO8cUgwI1viFXmb1mU1O8Y+oh2YP5QMaU/LdIC0
	 3Va7gw2n/IxURgZp97TwPbgRqmH2uGk/ygrh6ehQG/rl2tBM0xGz4gvabYuWy3gpPKTz6
	 WESrf6Xj/NGU6VhQlfBT21Bmiguzizy3vYRFMwIfry7EWNPe2sE0y1br74myqDFx+Jg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792742169;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=T+Q/gijWLNYJalY5gR1Couj/LNq0adkq+xT5gR4tON8=;
	b=Gl5yeYjuSVFKNDFKBZ2zS4jGFEoOM1NT+jE2N2DMMttPXHoyNRiX2OYswPk21n8oxn5l
	 +kQJvTSHyzrWrD3s6dzbCRivuPXx/zP60YCz6bVDmln0FbGQnfpM55BlgaCn0QeLn0ISs
	 P2+/Ukl/azFzH1Y9eYQsDEFsI0aASF3Uy3yzqeqSo5s9XSwyv1CTEJuXZxbHBtPTy1ssF
	 UVOHQXBQ2CsrCE2QU69JcKPZPKcZVaczYQHnsfJntqOsphpfVviqMow3bD5Ubrt0T2NEU
	 NVcoJ43lHLEiLPx+vKKjS1N4u/V/uvuVOJKz4642hyONsPgDozNhLytOK41X7k7bLvQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A63BC1F01828;
	Fri, 23 Oct 2026 07:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792742169;
	bh=T+Q/gijWLNYJalY5gR1Couj/LNq0adkq+xT5gR4tON8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Rz9uoQ0i85tdIliBOGMo2LILilxsRHrezTaOdeDtJ3Th7wbes7mH5MDfiFHPda/94
	 SsxvyPVIQZnA+IsHB2nGBH+AT4c6efPq6DnkS825FKS9ay3jPNNGGFD+rnij1XCitY
	 xyXR4vYKE/4axwCCspr4Jeuyc2S5dTSgVQe3MMNe6JYGRTN+VAofQ/4J/fD++RMnJM
	 oZUpYgn4TnW1nbcIwwuAQXP1VguwO7jAIi6esT6rLoMuzReJLJ8cuiq/hn1k6DPhIp
	 CavhWDYLA0IdvJvSMh6lovB5ylnYnxoNB3nF1ws9efumB4NKlBOAm4fYdxJ4naxiOH
	 dVimjNyqAou0g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 18C1C4440C;
	Fri, 23 Oct 2026 07:56:08 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Fri, 23 Oct 2026 13:24:32 +0530
Subject: [PATCH v2 2/2] iommu/arm-smmu-qcom: Skip PRR setup on SM7250 GPU
 SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261023-smmu-sm7250-v2-2-8bb881ce19f5@brar.si>
References: <20261023-smmu-sm7250-v2-0-8bb881ce19f5@brar.si>
In-Reply-To: <20261023-smmu-sm7250-v2-0-8bb881ce19f5@brar.si>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ishu Brar <patches@brar.si>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792742167; l=1110;
 i=patches@brar.si; h=from:subject:message-id;
 bh=VF/mGbM1EJsewrS92EWhHwKM9QYUxif31RQPsJ22WkY=;
 b=dquIgiNHyvz4rhwd+HLQRvAKDNpWA1NSq3XXVL2MODeB2oSQHozaFNUi708en0LVV+Z4zfiFr
 yaupfqnLzdbCzTFPf7A2QlQfQy6ilCjcxt/uz4nXbEFQpXwaZB2TMrU
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: patches@brar.si
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ishu Brar <patches@brar.si>

As on SM8250, the firmware on SM7250 resets the device when the Adreno
SMMU PRR registers are written. This happened as soon as the first
per-process GPU pagetable was created. Do not install the PRR
callbacks for the SM7250 GPU SMMU either.

Tested on a OnePlus Nord (SM7250) with Vulkan.

Signed-off-by: Ishu Brar <patches@brar.si>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 795e8ec7e..55071eb03 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -394,6 +394,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->set_prr_addr = NULL;
 
 	if (of_device_is_compatible(np, "qcom,smmu-500") &&
+	    !of_device_is_compatible(np, "qcom,sm7250-smmu-500") &&
 	    !of_device_is_compatible(np, "qcom,sm8250-smmu-500") &&
 	    of_device_is_compatible(np, "qcom,adreno-smmu")) {
 		priv->set_prr_bit = qcom_adreno_smmu_set_prr_bit;

-- 
2.56.0



