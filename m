Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0858CE8E92
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n5EI0XvdK1ve5qCasoJlye5WcCnMfmkepxCuNwI3EnQ=; b=Nu732JWlyqyrTYIiG+xza2fD7u
	nbonyDxx4SB+YUb/geDs6fH6Kx5ifhEjrV6j3f4P0E9z57LSsdp46+4bSFB7wk4V06EaTQA/GHScf
	amWRvt0obawd+Ja51ySnLhB6mps089V5HRHKOgPbcWyJNTQKgyhn9TM1wWLjaUw/6hleVU+j+iaRP
	UKOQDBhetHAYm24z4+XesqBZMFWf7oumVfVGySiK9sK3srBRMQClwFKGmdoUsFX6K9w0bKft7N+vB
	CQO6dayhbWjy2MwE07VC6sMvPlxRg9c/Zj2//tX9TW+fFPqbOEVghYXf9MUyv/GX71Qvv1TW3i9oh
	4+ZerOHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40Z5-000000014FP-0w4E;
	Thu, 24 Oct 2024 16:19:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t40XV-000000013ud-2fXM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 16:18:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A7A49A4562E;
	Thu, 24 Oct 2024 16:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8773EC4CEC7;
	Thu, 24 Oct 2024 16:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729786699;
	bh=HMi4vh0ZfmM/XHXhdHdVQKPsA6QQ26DG3ecTNW+84QA=;
	h=From:To:Cc:Subject:Date:From;
	b=MAapXxRR2TlUdIr0ODf5QSUTkEMrtS9s0rIbJEQV5gkcLjDDxAuLvxCbKYiCeRMo5
	 yRoiODHCbLt7SAszyz0uhGUAkt2rfrUXSdGIvCrViW3Y79S4lCbRYzkq4kuHx1pzQ0
	 pvzrs659N0OIS9CkjL42/DcMJujdaWygH6X2aW5Xm4Zid++tSh/kQtnHb4/AnupRBG
	 Zk4j6eJLMhEZeAJDIWgTnnERb/MW0At243UUFLGnezTqffnJHv5w265kM2LQNvKIkJ
	 6OBXL4ROcDVDwDRWwFzlS1qE3stmWBaESFlNS2SDBs4ZyJ6YYkyNkK0eWl9YLTXGpn
	 gE2y3Q/xt9hIQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t40XR-006W9S-Go;
	Thu, 24 Oct 2024 17:18:17 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Sibi Sankar <quic_sibis@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] arm64: dts: qcom: x1e80100: Route pcie5 MSIs to the GIC ITS
Date: Thu, 24 Oct 2024 17:18:14 +0100
Message-Id: <20241024161814.1827514-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, quic_sibis@quicinc.com, konradybcio@kernel.org, abel.vesa@linaro.org, johan+linaro@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_091821_759631_E2A51284 
X-CRM114-Status: GOOD (  10.58  )
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

There is no reason to use the PCIe root port widget for MSIs for
pcie5 while both pcie4 and pcie6a are enjoying the ITS.

This is specially useful when booting the kernel at EL2, as KVM
can then configure the ITS to have MSIs directly injected in guests
(since this machine has a GICv4.1 implementation).

Tested on a x1e001de devkit.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 3441d167a5cc..48f0ebd66863 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3281,6 +3281,8 @@ pcie5: pci@1c00000 {
 			linux,pci-domain = <5>;
 			num-lanes = <2>;
 
+			msi-map = <0x0 &gic_its 0xd0000 0x10000>;
+
 			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.39.5


