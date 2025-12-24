Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2150E776F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 16:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMSsI7czKaV3+FAMuVwQqhH43U0A/nuUbFhXlmGbbUM=; b=XWTLNgAIcAAteX6LdyZuWTbmA9
	ERzyYtbcOEFWfLqdLM0uSieezc/U67Sv3JL9++na7Wvg9FXINFwPPpfIHFx9KVQI3vKyawYbYF7EQ
	oQxSnLJ16CFxxF3wk4eR6VIx85THRGuVrkFSxiKw793TkfLzsWE8se6euwEGfRKDHfwglZXmPaDi3
	Z6R3Wt2sEKZqm8lnoOPmh5sl8RalIoc6INj8j5Gv7XkAEzT8VCEAyRmv2LwMUMGFsP3MUlwPkTKpf
	JrAdjQbfBQPx0/PSV4NyoKMCjyV4i50y39KNh/74hWc4YoqFJrzk3eFuL3tb6BcnvMW6FWr/GNRPE
	ZLaIEfYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYSCN-0000000HG1f-12H6;
	Wed, 24 Dec 2025 16:58:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYSCL-0000000HG13-1pLl
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 24 Dec 2025 16:58:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rMSsI7czKaV3+FAMuVwQqhH43U0A/nuUbFhXlmGbbUM=; b=k/C3zUj1HWq3sTbN7lfNTazvLI
	J17RkrF6x6VILuqECE+sL0rpRk5BWh4cnNHLFIpWSZAciiPFFKhlg2dTte/YR3sajJkoT26dpeZKV
	DRcmYc7H65eEorQX5V4SwGGIGZwDFb2E5FO5R6YWRlASJqp+HZG5EZJhw+NgfJA1YQbXcGnW+aTGV
	nuM+L/LZY3KxrJbPjE107PwFJs7dtYwMrQw9n248VzXUnWLjuqMBEW92+UYbMygxPKY2d8+hj+t9p
	GXY80aD3swXPhrA6fQRfcPaaiWJGSdldHftfEkBHJtkiA8xpD2jpnbMT1tq2KN1zZ0pmHinJn3H1v
	WlDhsnOA==;
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYSCI-000000003HE-1NfS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 16:58:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1766595529; bh=zQ1Ae8voxAofrFTWjcms3M0G8PDIugbtXfYgGxo4OPE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bvjsHsMSHmMZqWJz0aIy4+XeEO+ADCx4CjbMFY9OrwF3PclngJ1qRr9r4lAyqtA4Q
	 K0lFpqYw0/QqL3JiJ4Smp5VFJWdXoPEyWaSrmJTnFHuZLuFOLveuBzsfbhk/kYoZXG
	 l3SLFSul15YJtOLfrW/tm0FLJoWJwTBQpD3LCVkNJ+Xuhy2PQkTaBUNvyxpOrC8xGq
	 8IS1WbC2t9M05wTbhO3m9pljMmw5Ao26PrZ259NtKWDWJq2TtRyaTnDdQTCODOSc7D
	 egc7qkz4YiH7SoE6GQ5VC1+uvD5tcj3U9wznNm5j+xQTzYHpQFOJffmUXZ4t62seW7
	 LQrUGDUAtgejQ==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 024D13E8AFF;
	Wed, 24 Dec 2025 16:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1766595528; bh=zQ1Ae8voxAofrFTWjcms3M0G8PDIugbtXfYgGxo4OPE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Huvin09iJXRkscJmU5/H9t1cr15T/8bFbYm1sK3pzzDwCtfKhLxwxdwd8V4Y+9UQz
	 NKQi98K1FV3C3E805iijbWtI3NTo6E+PC6yQwXsOL+0TMyZuLXc8s4L+Bv33KDIcuW
	 AP2UJDG/QrOFhWcmPeXL/q3rUYtLFcNlkR5S1wBPnRmh0MSXtXzRJjtZe6YuDQkNAp
	 P067g7VfKfDMyuELl7pFYX1uG5ePM8I0qsl6/8CCe1MOwxMEucaLPYqcBSm1CFJrli
	 55F0tW1OW4f83QfraC3G8HMvFfbkPjaFPLH8DH9h5wk4ALVLikYyK5P9PCEqAE5Wh4
	 pzJJ9WE1fGNdw==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 72C4D3E8B01;
	Wed, 24 Dec 2025 16:58:48 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] ARM: dts: lpc32xx: describe FLASH_INT of SLC NAND controller
Date: Wed, 24 Dec 2025 18:58:45 +0200
Message-ID: <20251224165845.1261926-3-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224165845.1261926-1-vz@mleia.com>
References: <20251224165845.1261926-1-vz@mleia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251224_165849_025348_EC4AAD55 
X-CRM114-Status: GOOD (  10.61  )
/bin/ln: failed to access 'reaver_cache/texts/20251224_165849_025348_EC4AAD55': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_165849_025348_EC4AAD55 
X-CRM114-Status: GOOD (  10.64  )
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

SLC and MLC NAND flash controllers fire the muxed interrupt FLASH_INT to
the SoC, add the interrupt property to the SLC device tree node.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 3d5a59b2886c..5ddaea8c481a 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -65,6 +65,7 @@ iram: sram@8000000 {
 		slc: nand-controller@20020000 {
 			compatible = "nxp,lpc3220-slc";
 			reg = <0x20020000 0x1000>;
+			interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk LPC32XX_CLK_SLC>;
 			status = "disabled";
 		};
-- 
2.43.0


