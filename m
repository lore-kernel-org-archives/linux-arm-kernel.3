Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5358E77186
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKQvLMAR4pXvIl9rjZ9gjgm+IMNIvYiup7Xyty4Kn6A=; b=okkCQu8GU0SfPHuz5h7GlVNvTM
	n9QDW9gTBaV2EpU+4maKHB0xXov5GHT5OAPSSksW8RJSszjMyeBLdg0wZGV5LWguU7eF364ms2KOg
	2dRb9mlZLD5Q8Lnjkpj0FyWzpBE8XgCFWk5dO4XQqdniu24ntsmzIsXveil0SCAUz8eSY+OIznfsU
	hU7pZCkbjZck4sMLdQYJBFFWGJCipwtmic8RZedOtUY/VELluIvGjHkdW1Wo1uAc3TbOXUlk7P/V+
	zkX8wxZrXiwKH/HEqCGndW/3X6QrvNTfKlBVayrWYwFQIAdU9VjUWw8Elp1Q4uxNpxCCuTKYVYNn6
	HxcZn52A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLofL-00000001aAy-3ld4;
	Thu, 12 Dec 2024 19:16:03 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLna8-00000001K9U-11qG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:06:37 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-434f387f346so5765345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026794; x=1734631594; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NKQvLMAR4pXvIl9rjZ9gjgm+IMNIvYiup7Xyty4Kn6A=;
        b=iIWInDv13wauoY9beZBIZ0HsjZHKGFozd0zLiIT/ftV13vLuEbJ/QBKt2xmH/erq50
         BSGqhsTkRr1wOCAQPvf8qPXKMtiAWwU1lpcHXn96q0dSvH4rsf0GypEinJjSeMrWDELX
         7UwMFR4R+JM4u83fJVGCieNdVvG7NHnnfB+3gOYwx4UniZlsJHf0jQawO+UxMoHXq7sR
         ByKAiTI+nOk9xLO5ss5FxYC/ayC8HFWX3brIkf9aavlEaFDXXPBEAb1u/DiUjc7dsQ1I
         fm73f4opxTjjBtLTfYpqRmj5UbYdsRB9BUtB1lYt4XZSdbhMITvvqB2cCWxjX7x0uyzE
         xNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026794; x=1734631594;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NKQvLMAR4pXvIl9rjZ9gjgm+IMNIvYiup7Xyty4Kn6A=;
        b=WKd2AyB/wFi1hmbBCZMhoViLk56NZeO1+BR+ke4BV9bp5SDNv3RlOnSRCdgPt6Z7N6
         m4Cvj5MpdX4ENfd4og9p2W4TImZR9vXb3ERkq80coRiSQVEg/mXw60XsZ88wOT9XQoHr
         +i4keruDqywG1slWVyPDH2crtActH2z7L7h7XzH/IQAbcX1teuinFt4E4rMCPiJmT3LN
         Sm72GsnlzmhI37qwCjbYGuP5US+bPhegtKQXkhUhX9mpaoa5czMHTyfpdL0qgd2eq2ja
         EUtOSP9OOf9jFxfrDWOaV++xuEA7BFFQn9Xj5mYxmpTGNxrZng0mRdmXEKKORHd1zRHQ
         xemg==
X-Forwarded-Encrypted: i=1; AJvYcCWdZWymSyA4Mse7c9s25EFazUyffFi1lX/3dRuj8dFy0cARAh3HjOOXmi/xK+lZ3Es0yhR5QO4jRGG0c4kODvla@lists.infradead.org
X-Gm-Message-State: AOJu0YzxoXCqHesmnU5vr7/MnBCiEZuGyAoEzLKenQxStrc9LHCFBZSf
	pjjrX9zY/da114PWh0C1PanrDlt7A4bARSTwBid7XzD2YTKyhMrCZXqItkymNMCm71q6QwuZyxg
	VA56WaL3ODw==
X-Google-Smtp-Source: AGHT+IFkHgsqAYvLOBec6cgNAQkg3vmQRCOKbFIfkLxDpGopMY/6t1JJbqk9n+vF2FSRrh/Pk6B9mVEKRUOq9Q==
X-Received: from wmbjl5.prod.google.com ([2002:a05:600c:6a85:b0:434:f119:f1a])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3583:b0:434:f871:1b9d with SMTP id 5b1f17b1804b1-4362287091cmr39041375e9.33.1734026794478;
 Thu, 12 Dec 2024 10:06:34 -0800 (PST)
Date: Thu, 12 Dec 2024 18:04:17 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-54-smostafa@google.com>
Subject: [RFC PATCH v2 53/58] iommu/arm-smmu-v3-kvm: Probe power domains
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org, 
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com, 
	tabba@google.com, danielmentz@google.com, tzukui@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_100636_282744_10E02672 
X-CRM114-Status: GOOD (  18.55  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Try to use SCMI if possible, otherwise rely on HVC to the hypervisor
to notify about power changes, this is ONLY safe if the SMMU resets
to blocking DMA.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
index 674ce2b02a4b..deeed994a131 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -8,6 +8,7 @@
 #include <asm/kvm_mmu.h>
 
 #include <linux/arm-smccc.h>
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 
@@ -21,6 +22,7 @@ struct host_arm_smmu_device {
 	struct arm_smmu_device		smmu;
 	pkvm_handle_t			id;
 	u32				boot_gbpa;
+	struct kvm_power_domain		power_domain;
 };
 
 #define smmu_to_host(_smmu) \
@@ -654,6 +656,77 @@ static int kvm_arm_smmu_device_reset(struct host_arm_smmu_device *host_smmu)
 	return 0;
 }
 
+static int kvm_arm_probe_scmi_pd(struct device_node *scmi_node,
+				 struct kvm_power_domain *pd)
+{
+	int ret;
+	struct resource res;
+	struct of_phandle_args args;
+
+	pd->type = KVM_POWER_DOMAIN_ARM_SCMI;
+
+	ret = of_parse_phandle_with_args(scmi_node, "shmem", NULL, 0, &args);
+	if (ret)
+		return ret;
+
+	ret = of_address_to_resource(args.np, 0, &res);
+	if (ret)
+		goto out_put_nodes;
+
+	ret = of_property_read_u32(scmi_node, "arm,smc-id",
+				   &pd->arm_scmi.smc_id);
+	if (ret)
+		goto out_put_nodes;
+
+	/*
+	 * The shared buffer is unmapped from the host while a request is in
+	 * flight, so it has to be on its own page.
+	 */
+	if (!IS_ALIGNED(res.start, SZ_64K) || resource_size(&res) < SZ_64K) {
+		ret = -EINVAL;
+		goto out_put_nodes;
+	}
+
+	pd->arm_scmi.shmem_base = res.start;
+	pd->arm_scmi.shmem_size = resource_size(&res);
+
+out_put_nodes:
+	of_node_put(args.np);
+	return ret;
+}
+
+/* TODO: Move this. None of it is specific to SMMU */
+static int kvm_arm_probe_power_domain(struct device *dev,
+				      struct kvm_power_domain *pd)
+{
+	int ret;
+	struct device_node *parent;
+	struct of_phandle_args args;
+
+	if (!of_get_property(dev->of_node, "power-domains", NULL))
+		return 0;
+
+	ret = of_parse_phandle_with_args(dev->of_node, "power-domains",
+					 "#power-domain-cells", 0, &args);
+	if (ret)
+		return ret;
+
+	parent = of_get_parent(args.np);
+	if (parent && of_device_is_compatible(parent, "arm,scmi-smc") &&
+	    args.args_count > 0) {
+		pd->arm_scmi.domain_id = args.args[0];
+		ret = kvm_arm_probe_scmi_pd(parent, pd);
+	} else {
+		dev_warn(dev, "Unknown PM method for %pOF, using HVC\n",
+			 args.np);
+		pd->type = KVM_POWER_DOMAIN_HOST_HVC;
+		pd->device_id = kvm_arm_smmu_cur;
+	}
+	of_node_put(parent);
+	of_node_put(args.np);
+	return ret;
+}
+
 static int kvm_arm_smmu_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -681,6 +754,10 @@ static int kvm_arm_smmu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = kvm_arm_probe_power_domain(dev, &host_smmu->power_domain);
+	if (ret)
+		return ret;
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	size = resource_size(res);
 	if (size < SZ_128K) {
@@ -738,6 +815,7 @@ static int kvm_arm_smmu_probe(struct platform_device *pdev)
 	hyp_smmu->mmio_addr = ioaddr;
 	hyp_smmu->mmio_size = size;
 	hyp_smmu->features = smmu->features;
+	hyp_smmu->iommu.power_domain = host_smmu->power_domain;
 	kvm_arm_smmu_cur++;
 
 	return arm_smmu_register_iommu(smmu, &kvm_arm_smmu_ops, ioaddr);
-- 
2.47.0.338.g60cca15819-goog


