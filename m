Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3977C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 15:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ng3hN8k9p0RV0r9yi43ppO7Q4cpUfGdxdpjlyOhf/No=; b=gNf+V6w38hGHo3py2SHk7ykBL9
	wMCcWwnzV0OvuPTECWIu9HCkxJ9Q06idy3BIyucvRshOOeNFhonFgW6OrX0HoZeEzHPSSwhLNdGlc
	XujqM9XQ0Jzu758NjodwTRVh3fBAJdcqwAT54k0ybMa5u7/6FhVrJyMvmMcrLV6O4KowMYTvF/XDA
	gkfvBMFKyk4maOdQ69pniEoJT3z1IaqFXu9UUdhwtCEAsK9h5D26/O0+UwWhJpmDfqct79+lpuehy
	owbNdqXakyY0HwValC5xsW09HAJdIb8bpaGhY1as5GUNJft7MeybzNBXt9kwxr+CsVjDOKRkbIhZV
	pz4wf33A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tRG-0000000AwoR-2zk8;
	Thu, 10 Apr 2025 15:03:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2t4t-0000000AsTq-2cUA;
	Thu, 10 Apr 2025 14:40:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296026;
	bh=q4xguAEv20thxhkNrNlpmM17Rq+I44PLFPaJdl62SdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Oa+Jj9gELgWEGAv6WYEL2QK8dVMFuy7Ec2o5AkYPK9n5IXCHJVdZPGfgoXSZ1cErr
	 nVVZpCiKxACoV7zSqAsQSoym1W+nzUlIoeqFVmWfrcyVchyMDnzdY9R3F0O/z5zNht
	 R9V11x1KP3rn1M5PWQ9QhHGGAxVUJxi6GbT1B3yP0PJrrgyTkcCN/4qy7rAWLbCApK
	 ymRCG17LpoS3au45gAQVv1PH7sJbEHo3jrWDIT+MpgcAhIV9lc5yDONXjmOVXGPRrN
	 e+VE6D6xfGxAnH+ht/cK2kZGOSuQMC35EYKvK2b2Scr/RmyGF4QPrstHYlF4yMtM5I
	 +P7mqTLPLQGzw==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1B4D217E10F7;
	Thu, 10 Apr 2025 16:40:25 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	henryc.chen@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 2/5] dt-bindings: regulator: mediatek-dvfsrc: Add MT6893 support
Date: Thu, 10 Apr 2025 16:40:16 +0200
Message-ID: <20250410144019.475930-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
References: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_074027_805526_1784755D 
X-CRM114-Status: UNSURE (   8.61  )
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

Add a compatible for the MediaTek Dimensity 1200 (MT6893) SoC's
regulators over DVFSRC.
This SoC uses different values for the vsel, hence it is not
compatible with the currently supported ones.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
index 704828687970..acac5c869f2c 100644
--- a/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - mediatek,mt6873-dvfsrc-regulator
+      - mediatek,mt6893-dvfsrc-regulator
       - mediatek,mt8183-dvfsrc-regulator
       - mediatek,mt8192-dvfsrc-regulator
       - mediatek,mt8195-dvfsrc-regulator
-- 
2.49.0


