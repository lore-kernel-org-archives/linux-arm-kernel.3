Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A492EDEBF2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 19:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t25H3UiCG3sDzMLJCLUIlrJBBto9opuEu826D/XJqN4=; b=vxTtmhDk80MJ5JLcZtnyBHybJz
	oWrL1Er0vrrZycwbuRP6jw8YqPlEofQwaVKVFS/Yafm+YXlZIRcG6B3b0ZV2ggOS4PQ8TpL5bS555
	MuH2pOCVoIzLMxc9YfqFXjaOb7q+masHePHWegU90+Qfd08uFQ3isPX57HB9hVRKNRb2PoJAZtXqf
	JvKlp6A0XvMOhlAPg0jq3FUO33iubJjl2mBWzZx2qLInZCT0tmNzJU8CiegVCfAQqpFaPNI4WKrty
	cGIfuz7rkDQANGGmyEfpBob3qoD9ppmygsLkptYENL0TVZ8LyIr3/Xdpy0VVeqTOz6l6tRPUs2FZc
	64Um7oUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVnI-0000000FqgS-3gZ4;
	Tue, 03 Mar 2026 19:52:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVnD-0000000Fqal-16to;
	Tue, 03 Mar 2026 19:52:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A422344386;
	Tue,  3 Mar 2026 19:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76775C2BC87;
	Tue,  3 Mar 2026 19:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772567550;
	bh=oHis0oNWG8f5L9e3rDYPqCCkd9XkQEAtq1esFIHDMUU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iJfSUWV/dv7huAy8kvxJJz4EZlGAgXuzNtuAs9i+2K3ynBZE5LdVQ7+MZnhAxtY5N
	 Y+zdFUFvhULsfAzYhuHRMhiTPnPpc3qyCj38opcCj/RAgYdZhHkhjiNs8UCt8vyUDB
	 9jaGh020BSVGZ7ExGLMlwhAs/6lJG9ZBKgCg5CxXXlfHdPeSw0EYoz208vtsEQpB/w
	 cEMo02vUbrSaAo0ALQulQZAP4nbySIVpUKZzlYUPNW8a0UQ8PPP7zyNyHaswHMM/Rv
	 H8eyRiEUf55vtTPKOPdevrW81f/yVrflplxoWEHwWsy7APZAYJBY5n0g2W42c1oHCn
	 fvDuEXdnZRx2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58DFDEDEBED;
	Tue,  3 Mar 2026 19:52:30 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 03 Mar 2026 20:52:27 +0100
Subject: [PATCH v3 1/4] arm64: dts: rockchip: assign pipe clock to rk3568
 PCIe lanes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-rk3568-bri-r2-pro-fix-pcie-v3-1-af5a5207b0a1@ixit.cz>
References: <20260303-rk3568-bri-r2-pro-fix-pcie-v3-0-af5a5207b0a1@ixit.cz>
In-Reply-To: <20260303-rk3568-bri-r2-pro-fix-pcie-v3-0-af5a5207b0a1@ixit.cz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Frank Wunderlich <frank-w@public-files.de>
Cc: Martin Filla <freebsd@sysctl.cz>, 
 Charalampos Mitrodimas <charmitro@posteo.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1684; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=kBL8DfIbMEZId/mS9aT/ZMrXznRqWhpDEYin4PccSE4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBppzv7Wv3xTTAHuxiN/ZqvtT/LDbQ8kHANgL2gf
 2gYzFH1ituJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaac7+wAKCRBgAj/E00kg
 cg18EAC4Hcmjx5yPY78MeXIWdgDG5ds2l3Pxnhjtmy7lALsL4hCfW4aX9rahnv14dF8xPR2D0pP
 z2m+aVGb7e4fwBBn5TCtS6+TxuZSFbyw9/TTI3te5JcoGtrs8GSAQOl4WtWVRNfOqOVrRqUJk/x
 feoSjS/zLrcpaBAr5dtw24bdps8H1k+5g/kLV0z9PZd8XHTq1YZwo2Ms5uzYRAVR9qrNEH8TC2J
 /mJQWinn76+YtotO9QUukpg45y2UzvUtxnA2EoyMQ85SLSiFRYKgmFZDzZZHXj/GIBteQh30MS8
 1kXUuGMWpx23ADPgCOESGsEv+VCQ+6plKjSKpMoQhUkpz0zdsH5eDKjw4VX3Ex/24+l42sVDRvc
 GNgLYWRkJvt6Z2p2Vt+ijJqglH0VZQrkv6MkTrpw7fTo8CgdyRVo0h5zJPPtHoc5I4GB2nUFef/
 gvtHFPRERqnXJEhz3P7xoHhgUtZO4H4ALZi+/GbjQb9mAOER2onws7ZtLyveHBR6Ww/jrre7ALG
 cgMP6BsOTDaYOA2v5gX+gX4JYv/0fVBfbAZT1qLcLEfbFjwh/irNWPlhwQRyri4IaqNKpFjobi2
 LwMBnOkWQKQzfUrZ9T0iJEv4zyntNxY5NMPMKg+chORgsV7j51PJIJ/5eswvCyU42dngK5iyaQk
 FM32cyvEh/DnvrQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_115231_365612_52FCF894 
X-CRM114-Status: UNSURE (   9.72  )
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: David Heidelberg <david@ixit.cz>

These clocks are used by PCIe lanes, but we're missing from the
definition.

Suggested-by: Charalampos Mitrodimas <charmitro@posteo.net>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/rockchip/rk3568.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
index 658097ed69714..3bc653f027f1f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
@@ -155,9 +155,11 @@ pcie3x1: pcie@fe270000 {
 		bus-range = <0x10 0x1f>;
 		clocks = <&cru ACLK_PCIE30X1_MST>, <&cru ACLK_PCIE30X1_SLV>,
 			 <&cru ACLK_PCIE30X1_DBI>, <&cru PCLK_PCIE30X1>,
-			 <&cru CLK_PCIE30X1_AUX_NDFT>;
+			 <&cru CLK_PCIE30X1_AUX_NDFT>,
+			 <&cru CLK_PCIE30X1_PIPE_DFT>;
 		clock-names = "aclk_mst", "aclk_slv",
-			      "aclk_dbi", "pclk", "aux";
+			      "aclk_dbi", "pclk", "aux",
+			      "pipe";
 		device_type = "pci";
 		interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>,
@@ -208,9 +210,11 @@ pcie3x2: pcie@fe280000 {
 		bus-range = <0x20 0x2f>;
 		clocks = <&cru ACLK_PCIE30X2_MST>, <&cru ACLK_PCIE30X2_SLV>,
 			 <&cru ACLK_PCIE30X2_DBI>, <&cru PCLK_PCIE30X2>,
-			 <&cru CLK_PCIE30X2_AUX_NDFT>;
+			 <&cru CLK_PCIE30X2_AUX_NDFT>,
+			 <&cru CLK_PCIE30X2_PIPE_DFT>;
 		clock-names = "aclk_mst", "aclk_slv",
-			      "aclk_dbi", "pclk", "aux";
+			      "aclk_dbi", "pclk", "aux",
+			      "pipe";
 		device_type = "pci";
 		interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,

-- 
2.53.0



