Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB570CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 09:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FLdxBy8ZnQEc8Xl+iOzFZKYLkTPW/I2ony2cyX0hpOE=; b=RMl3NcdsUoedVl1Z7WhipKrVXE
	brwSaLOd+S5MJP3k9yMxef/v6hg34XD8gyUpDjgt/nZxL5ACEitmMj22R/2V7QLQTvw03dAeJLUXW
	FBJkDzyJigqTDJbn1hwP5ia21R+4iPPTFU4bhbEKHTCLUmgzxyHdcanAR/wjMo/5Imequ8A2064dS
	QUprLoNF/WkzIvppuR/u95mNILpTFBjcA0DgjJ3TPURW/B9Zb4e5Aqfm5w8oDOwOip6k87e/AqE6J
	OOA8NP0sK2S6n5Yzk6enQ3p4TWnL/Fn0MiIJCaz/KB6kVl51z109DWuMdC9C/1A5Rcc8ooL9HtlCg
	gscZt9jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHeWV-00000002WyZ-2VJd;
	Fri, 16 Oct 2026 09:46:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHeWT-00000002WyA-3Z97
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 09:46:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 585C24162E;
	Fri, 16 Oct 2026 09:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E474C2BCF5;
	Fri, 16 Oct 2026 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792144005;
	bh=POI86Emv7LXTXvwaaJBvK12dMOj7PnyouyYL3O/OxHs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Q2nz0b/tXJv8DFUCbYs8UIB6ZeD79wS5SliZ/dDLNDR1YkSUwk0ZHedgKJbzImhj8
	 zM1F2pIB+Fgc3Xdp04U8DwO3Xh+EqaAowMKe7oz1sR6yoMuM6CCi6oZQy4cifDEKxz
	 s5ESrsW4QoDbRrHbQBg6MWDaxq6vFqeOTsIuHBzk8NtH5TzrgTsvUn0KfAODLRNhLe
	 qV5IbqQLXo7k1F/Woxdlu0etxzoWuI5/mLEYUHH2x93pltZr/Hu5AeJBnT1EBXb8qu
	 7NRW+5oB4jky3csF28WJJJrVK543FLs4JMdHQRyG8J0K02+kZzeStsENJ63rwxGL8m
	 QrM2uzQK5uxjQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C156CCA464;
	Fri, 16 Oct 2026 09:46:45 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Subject: [PATCH 0/2] iommu/arm-smmu-qcom: Add SM7250 support
Date: Fri, 16 Oct 2026 15:16:39 +0530
Message-Id: <20261016-smmu-sm7250-v1-0-e11fc0384cfa@brar.si>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0Mz3eLc3FIgYW5kaqBraWqekmZglGJpZGGsBNRRUJSallkBNi06FsI
 vLk3KSk0uARmhVFsLAG6DOrFvAAAA
X-Change-ID: 20261016-smmu-sm7250-957df02d9283
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ishu Brar <patches@brar.si>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792144002; l=976;
 i=patches@brar.si; h=from:subject:message-id;
 bh=POI86Emv7LXTXvwaaJBvK12dMOj7PnyouyYL3O/OxHs=;
 b=z/jR/8mzWoN9+ulva91kznpd3Hm8A2A5JQJ6+dwPb9j9/g7oKoOMZAFiIq84ALgiwuk32Pa0t
 cdd324JFkduBwMLbMg5TURPTgYHTEUioKE8q+KrMkRliT8lGl5/9hRp
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
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
Reply-To: patches@brar.si
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This documents SMMUs of Qualcomm SM7250 (Snapdragon
765/765G/768G) and skips Adreno SMMU PRR setup on it.

As on SM8250, firmware resets device when PRR registers are
written, which happens as soon as GPU creates its first per-process
pagetable. Patch 1 adds the compatible to binding (apps SMMU and GPU
SMMU). Patch 2 excludes it from PRR callbacks.

Tested on OnePlus Nord (SM7250) with Vulkan on Adreno 620. The SoC
devicetree nodes are not part of this series.

Signed-off-by: Ishu Brar <patches@brar.si>
---
Ishu Brar (2):
      dt-bindings: arm-smmu: Document SM7250 SMMU
      iommu/arm-smmu-qcom: Skip PRR setup on SM7250 GPU SMMU

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 +++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c            | 1 +
 2 files changed, 4 insertions(+)
---
base-commit: 7b7429c28ac01c8a2952225a4b8a742eec7359c3
change-id: 20261016-smmu-sm7250-957df02d9283

Best regards,
--  
Ishu Brar <patches@brar.si>



