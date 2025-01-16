Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C3CC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 23:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+quEYUkZhidwpAeLqq43u3BemjnbBw7+zBdpWqiraU=; b=IFX9Jo8qY8Iu8xrC71MPSfDy7R
	L/vf5oENZKnWNQO6sfV7UUNNSQ1smhq6CPhm90yuIcqxwSqF6mZ1OMDWzhOMfultCp6aGPDp4T60k
	gvPXJ3Y3qz6mXC93m7gvzcxD5Frl+udpoz8oyMFgOnE7CjZ3RETQxTnPTTJJMg0ffr/7wV/3xn5Ly
	X5g4IAcoPj8kihS2k1+JdqeA0/wzLRGnoKsd40mpwwTZgyHsRVDKUzrqRCqiyj98LHJtKf757qklL
	Hka6FzQEmkVIJllQhxsyj4Apufmu2z4o8QqvF3vjitk4JNlXRc+XEVJ6u3LEiXdRGgGgCOFHcDJtd
	xF4R2qJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYtS-0000000GHFK-0g9n;
	Thu, 16 Jan 2025 23:03:18 +0000
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYmF-0000000GG2K-1TN7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 22:55:52 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737068144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w+quEYUkZhidwpAeLqq43u3BemjnbBw7+zBdpWqiraU=;
	b=nhDo6UjgeIKQmiyR5pQ04UEbN2zDRWdCs5UadY8A98Tt8cMQLdQHTnSjQ4xpH8esmUGDl8
	5ojOPwtNzMzbw2BhasYfr0heaIa6MfZn2n/NTMPtcTpA1+Fi00g52AYwjBANMjFl0Pkym6
	F6fwb0zfW4IJREt/5xrt1XB9n9LMuz8=
From: Sean Anderson <sean.anderson@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 5/5] ARM64: xilinx: zynqmp: Add QSPI reset
Date: Thu, 16 Jan 2025 17:55:21 -0500
Message-Id: <20250116225521.2688224-6-sean.anderson@linux.dev>
In-Reply-To: <20250116225521.2688224-1-sean.anderson@linux.dev>
References: <20250116225521.2688224-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_145551_525006_068E44C7 
X-CRM114-Status: UNSURE (   8.07  )
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

Add a reset to the QSPI.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 467f084c6469..5dac0542a48d 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -986,6 +986,7 @@ qspi: spi@ff0f0000 {
 			#size-cells = <0>;
 			/* iommus = <&smmu 0x873>; */
 			power-domains = <&zynqmp_firmware PD_QSPI>;
+			resets = <&zynqmp_reset ZYNQMP_RESET_QSPI>;
 		};
 
 		psgtr: phy@fd400000 {
-- 
2.35.1.1320.gc452695387.dirty


