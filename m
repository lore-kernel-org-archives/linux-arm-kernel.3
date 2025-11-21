Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FAECFA47B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 07:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHcSWj72/by64/S98T4wmbPzKNfmbTKpvj8oqcHTQ4E=; b=Ah+uTEzFmmLFpPAHxmRN7VwZPJ
	Gjkia/S7mb3iHGmXQ1CzlnLTRMWcRURbRYZ8agkaRZZaDWU0q/vA4y99aYrIOTLBgcpH09BpHJaBJ
	nOXGpXrMAhrK2zoIG/mYwyb17h0BrjXhFmpMH6H45SnmuXNz6/c40YAF7K2nSM1V5DoyuX0RQ9YHv
	CrtfGi7QvXyrspvsi2zrcWkiWU/9sYGE2Sr5jLYMzsF9nQA1wGhLGGMMYgqNUivmQkbHDL5+QRsm3
	GJArsobIRLt/+vcIf11Xk+op3p52f/cDzzxkPL+5MIUw4NlqMqTsYBKIMTJQnk+lDhlIlTBSmvEFB
	FjrE6uyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMLcu-00000007ym9-2A7q;
	Fri, 21 Nov 2025 07:32:16 +0000
Received: from mx-relay51-hz1.antispameurope.com ([94.100.132.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMLcp-00000007ykp-3xQ7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 07:32:13 +0000
ARC-Authentication-Results: i=1; mx-gate51-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=SHcSWj72/by64/S98T4wmbPzKNfmbTKpvj8oqcHTQ4E=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763710321;
 b=BPqrWOc9ShfCvXecR1c5ueE3gheg6CaoMutx/JFd/Zzgbwls2FEAcu6uV1p/vkX/1hN0HE+j
 omvkIKfrKcBUIoD/8XiHP8bwem6M1tI5WNmv3ZmaZtp/RWZPtqIam7CRxKg8/kHd33xXbmzpFSJ
 isrPQkdyho2SYeykLD0NYH3ae3KBKII8fTWrUq7ZSF34DEby2HKkIQ2n19qsOrzz1lkoWwdMJ4J
 ZI132HHbi1qpfsN2yf0a802Z2c4R+aOJBYy9EbIOjpoyY/zqNWqlyGHeqHdpUeM75QJTzsASpZd
 kp21ZLMWj+wavMkOSIVQ/L1YLF3SOfTRw8njfBzfTtw/Q==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763710321;
 b=DV9dh+ndRCwjvRY+/Jqj8BFRya8YgMjxmAyFkCHpq5FKZzVQ7nLM+oxsH2ld4ekZlqK4R4/t
 eGWYAjzHAEQG24xzT41FcqBAw/HKEyB/YSr0tmvQoXPUEGDky5oNp0nrRXRUPR/VjIIFrjdP7kK
 s+xLLIoTQUYJ+RTXA6JcdhvmIyV5DoJCNZ20NC7i6+JZV0YIyeKnaK7DS0O78He1MByN5vgr7YS
 u62m1WpB5Zb5kLQSlLuWChU8ENCVwNgGJeah4060VFwTd/P6N3B96qln8BgfMUnEg9rrdkIuQct
 ZyXecLuxQ8MQIJFcyeFxiyqkYxtjebry+NpCc93oXSYqQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay51-hz1.antispameurope.com;
 Fri, 21 Nov 2025 08:32:01 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 7DCBB5A076C;
	Fri, 21 Nov 2025 08:31:46 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: tqma8xxs-mb-smarc-2: replace 0 with IMX_LPCG_CLK_0 for lpcg indices
Date: Fri, 21 Nov 2025 08:31:41 +0100
Message-ID: <20251121073142.3367642-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121073142.3367642-1-alexander.stein@ew.tq-group.com>
References: <20251121073142.3367642-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay51-hz1.antispameurope.com with 4dCRjv1PFPz33Nyk
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 4b0d0fc0d52d0a2e82669a6eda2d09f7
X-cloud-security: scantime:1.914
DKIM-Signature: a=rsa-sha256;
 bh=SHcSWj72/by64/S98T4wmbPzKNfmbTKpvj8oqcHTQ4E=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763710320; v=1;
 b=gtEdxkI81DKO5N/7xyiFsxVcWFjKX1EdjB+vs0emBPwEcVsWYhLh7U/vpk7YlKvFrqdfrvVl
 Hw7kMsNroGkzHHYyb64/nk323u917YFQN4Tnb8YtATipa0CoNZgi6qPkTn5D7eGeRVum2Hsxxp4
 Kv5cmekegC5lC+PlgAt+zMROJjAxvtknf9W10TMaB6SCwhZNtBrhz93c60wdOGpCgveM9Lr2naV
 VV9NnenTPFhLtr/9gyqVxXPZ6QUOxwgfWclo/iVknDV5FHIzzeUMtENIo41tagi89iNojXF3NJp
 KQUu1gPzixGcxhBUwebToG1Wyk4DASH/49SYVeKeuHFgw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_233212_117175_99768002 
X-CRM114-Status: GOOD (  13.02  )
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

Replace the 0 with IMX_LPCG_CLK_0 for LPCG clock indices. Although the
numerical value is identical, the LPCG input is defined as
IMX_LPCG_CLK_<n>, so using the symbolic constant improves clarity and
consistency with the LPCG clock naming convention.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi b/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi
index 3d20e3bf32ce7..8bfe77113d64b 100644
--- a/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi
@@ -130,7 +130,7 @@ &i2c0 {
 	tlv320aic3x04: audio-codec@18 {
 		compatible = "ti,tlv320aic32x4";
 		reg = <0x18>;
-		clocks = <&mclkout0_lpcg 0>;
+		clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
 		clock-names = "mclk";
 		iov-supply = <&reg_1v8>;
 		ldoin-supply = <&reg_3v3>;
-- 
2.43.0


