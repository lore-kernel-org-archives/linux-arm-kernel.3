Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E8E606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 07:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gwXKhnRj;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ox97/XIh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ibP1S88/mUmJq9sseTW7ujzwJfT8mpyLTPTI3FU924o=; b=gwXKhnRjtilinKfC2Fs5CHcCQH
	7mBoURzcqV9yJ+mItDPavoFpfawlKNeW8L9xNdijeGh0No2uZI1/uDSmlp6tWUX570HXp1U7aRaHH
	zcx3QezEIJ236DSCsW4lQb/PS/jutGoyTb6QjETR5UVwlaI/WaYXrtcZnzya5DsfXCyPnoddxHLfH
	jBWAPK3IflIR8a3iaPqxdLJUjvASstL1F5y/ystj1MSJffk7+hAlnede/iH7h30WZ45Jx6ehJOiVr
	Yy4U3vtmjnvq0P40P/FvWS7oWqJZyREEmw9NT8QHHJTBC0QBZbkhxJzRAKSOoXo/lErk4ENtvnSH2
	8wmdQ+jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA8M-0000000Fp6T-3Uip;
	Fri, 23 Oct 2026 07:56:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA8I-0000000Fp5M-2Rht
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 07:56:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CC559605EF;
	Fri, 23 Oct 2026 07:56:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792742169;
	b=YLPVWVhCEgU5k34ju3WEH10Md/WavndZc700Aa+lq6KE0QtcgdWslFqJm8xHJQAW6wla
	 XiGwPjJswy0wjafr0Nsqi+fBR5Y+dZaPJ58LB3eMF7b5FR0qRxY1zjr3ekDam7d/gF8+W
	 ZuQ23AwC7I+DMIpheoO5N26sMVVKtBLC2bVNIOt7BI/TqPef1XHK/4NSo59QKRX9cA/dZ
	 GtB1zx6tjVMw3NyZeMcpBZ/CScUQ3OCumISByuVQpZt7UfMJs0GtyQ85mi7z+oxlkZp3s
	 G2qLyt5KvgYvZ3zQAx7vJx7WI0Q6oOlki795AIDjXaQnu03mhZVoz0mZb1ZOC4ofNdA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792742169;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ibP1S88/mUmJq9sseTW7ujzwJfT8mpyLTPTI3FU924o=;
	b=kFKaWUI2pn02afSlGbWoEOUptpxspZ3zQLASxt+Bjj3V9nCwWhzVdAlMd+lebsqBr/Ir
	 FNrNpYGtg+S4ILKPeDkpN2nVriEM7642/fIB2r/nPmZV24CPmZjQvweghV5xr716dqywS
	 j+oYhY5Oa0oKl39K+7jWwzu2D60uwOp/hsSQO2B3yPkeYRJUrRlRcJldHf2AtN7/CQSWt
	 sxyfRr/ZFZCIU9GCI1rGEABTm1xudrxA1MGtulc4LT3Og2WCYCthIbA8luupzHcZhMyAE
	 4zw+utUqZz7BjeSGNoRELMbMSt5VUFgaAyybPkeVJUZyu5/9TXOPNIoo5z1smsd6DXQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A63671F01825;
	Fri, 23 Oct 2026 07:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792742169;
	bh=ibP1S88/mUmJq9sseTW7ujzwJfT8mpyLTPTI3FU924o=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=ox97/XIhMrG1PMqDmkQCUXl7UU78zqynff9CPBLWo/qiMxvb86WccCB0ebxaAGn5H
	 U7NzU+S5LsmHOzLS+eHgyYbtN/iYIP/4ZinN8Xwt7oRGln3NQk8pP3mZ4tUj6izmTw
	 EcjreRhYc64A7co6x5UUujBJ42sHDPrzKj+qOGpyaY0wWCbsHUmuQlRPHcAS8yUD0S
	 vwGKqSSibhO9mxFV8/YdMsHYk9nREGs4Kb8Gjbx93v6luoaPDQRhPCXHwdngskSEjC
	 DIrotMpefWjxhM57ARbZGEEZLhPNxj9Q34ugyCZruF0rHBNNaRW9/nl3OBLL0R9DkZ
	 t8XnsG3FpUOzw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 037BF443FE;
	Fri, 23 Oct 2026 07:56:08 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Subject: [PATCH v2 0/2] iommu/arm-smmu-qcom: Add SM7250 support
Date: Fri, 23 Oct 2026 13:24:30 +0530
Message-Id: <20261023-smmu-sm7250-v2-0-8bb881ce19f5@brar.si>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NzQ6CMBCEX4Xs2Zq2yJ8n38NwgHYrawKYLhAN6
 bvb4tXLJF8y880OjJ6Q4Zrt4HEjpnmKoE8ZmKGbHijIRgYtdamkKgWP4xqj0oUUTVFZJ7VtdJ1
 DXLw8Onoftnv7Y177J5olKVJjIF5m/znuNpV6/82bElKgUs7IvL4Y19163/kzE7QhhC/ZArMAt
 gAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792742166; l=1770;
 i=patches@brar.si; h=from:subject:message-id;
 bh=sQLOhZMi8aZbIqVsMhAfiz8/FuPFV6+J4pw61zOCgdE=;
 b=9Q+sBnjBwBjboIPiR/Ad0kQ1lgiFss5sSPJvkLB0DOL5jYe8jhRpQHcODvee7s5/620vV8P02
 HensHpKQT9jAyR/kTvQ7J909qy2quEecxQBdUAYoSfbETXuXqmHdH3S
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
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
Changes in v2:
- Patch 1: also add qcom,sm7250-smmu-500 to the allOf block that
  requires the ahb/bus/iface clocks, so the GPU SMMU clocks are
  validated like on sm8250 (sashiko review, confirmed by Krzysztof).
- Patch 2: unchanged.
- Link to v1: https://patch.msgid.link/20261016-smmu-sm7250-v1-0-e11fc0384cfa@brar.si

To: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: iommu@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Ishu Brar (2):
      dt-bindings: arm-smmu: Document SM7250 SMMU
      iommu/arm-smmu-qcom: Skip PRR setup on SM7250 GPU SMMU

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c            | 1 +
 2 files changed, 5 insertions(+)
---
base-commit: 7b7429c28ac01c8a2952225a4b8a742eec7359c3
change-id: 20261016-smmu-sm7250-957df02d9283

Best regards,
--  
Ishu Brar <patches@brar.si>



