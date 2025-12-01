Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D24AD111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 07:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8uu3W2YJze2SaGK3W7DnErUCDkMNYh/ZOhlBJ1JYC+Q=; b=DxQBEf/OMLb8ZF1jbYtfNutL1j
	oNqSt0uzVBEVzXlQazfn2pYBI0sea0osxO7/+VMbZXU8fc5oYxmuKNIqN2t8O19zXPqIIFdWi7Y5A
	TYGFncSwMNOsq7NgDnsvo/CAtoJp4NQGf3NJTt+mlUT1t7/1jV01G+EMpBigo1lgsDPKTX2FGzxyw
	zF5tecVQaMH+NTnIxJBqa3zdGaONVVfmRJjcDjCVHLYXhrVrjM4dTdPufQhz1XjZJH9Sw1qcU7b9X
	qTgfb+sLRrac7DEmn+BAOUCU54NarWTF6w6FA5E2lmV86DNbLiwkRDnO39xTuL1719kpVqP5/Wwki
	hbdSwyeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxx5-0000000320Q-0QLr;
	Mon, 01 Dec 2025 07:04:03 +0000
Received: from mx-relay48-hz3.antispameurope.com ([94.100.134.237])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPxx0-000000031z5-1oeH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 07:04:01 +0000
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=8uu3W2YJze2SaGK3W7DnErUCDkMNYh/ZOhlBJ1JYC+Q=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1764572626;
 b=May3vA5Xms5TgZma547bxs4hmshTcpvg9hPHcsScskEL5t6pp8AIEbtA58MUcUjmdcnUDH4P
 qBa9u27+AAlVMdF4oGysQG5LXC9pbNUt2pZkP4NDXaSXevcjtWIRXRsxOCa9cUwYWqD3MnOmxFT
 SFEeht7wBX8jZ7mizPRHHfVSETqvCIP3lMVfSNCuptT80S3yuEy5ZsyvV1hFnsGb8Swt7yrGFN8
 betVM5V8qw6GjtL9E3d/LRjywh1jjHgN3Nu39CUqDKCzSRXyHarDOy1DEmxWbD49jZvf79TxyDu
 TDUbrby7S1U1K0lscxm/8sqfVx7sj8+O899Ty6dKP3drw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1764572626;
 b=sjpk3v+xgu6G3RFhlUvIH7kUYPaujoL8g72iEnxbnIimWAhvOJAKA41ION5zzgCO8UQY1i80
 lTnMBnfE7PCYQlih0xSB8cRDG7Q5jzXFwcG+PM6avt5NlEUrc4LynVkShDxENIfrLU7b1HQ1avX
 +W3L8Y55qhNrncfTgOY/siAmudwOVVP5diCTO9OsYLlWBNbK5HS2rHILK7PuKoWfHmAJ7CHXXhu
 1huUl7hOqpUnD5G6qHGmeGFjW3I0Tmjh6xd1Quo38O3ozdOQWq0HIDv1hzxsnqBtCGm1+Mx1kft
 kZoMqtFVyJDop968WAF1ntELJ+poGSpBBgWgSWsmPAETg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Mon, 01 Dec 2025 08:03:46 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6CB295A0FC3;
	Mon,  1 Dec 2025 08:03:36 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: tqmls1046a: Move BMAN/QMAN buffers to DRAM1 area
Date: Mon,  1 Dec 2025 08:03:33 +0100
Message-ID: <20251201070333.6804-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4dKZcn0Fpfz1kR2J8
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 70198ad446e01807b4973f99df72bd9d
X-cloud-security: scantime:1.869
DKIM-Signature: a=rsa-sha256;
 bh=8uu3W2YJze2SaGK3W7DnErUCDkMNYh/ZOhlBJ1JYC+Q=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1764572626; v=1;
 b=e2k9hTgV0QpJYIiMdaLTRxrhPr4tEFSjvV3RKIm0A84KIqZ2Z27WiH98xdu97tDXKDSPpxvn
 FbHVSddPQ3RHrEfauHp1CQJJM6Oz+qLK10W80MFv1eVNCenPFiXswGWz2pSfQ2Iq0nBwFrcLlMM
 ekRVveExw57detoM6p42blNf4/sJ+9N4YUbnk6LRPC77hrqt878GjYSU/QKF0i/UsZCppLB2Uxv
 CBMO07VHtAFn3K4l9vERd8iV9r40OP4hCrdoxARq48hRALH6XSZy5nPFADP0z+mRL3BPqUh5PD5
 UVU7dP3zwHruIs9VrQBt/+ZQwEWk83tcpjY0Wj/9YzNpg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_230359_040293_99F1C3E6 
X-CRM114-Status: GOOD (  10.69  )
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

DRAM1 is only 2GiB in size (0x00_8000_0000 - 0x01_0000_0000) which is
already used by Linux kernel, etc. Move the allocation area of BMAN and
QMAN to DRAM1 region. This frees the complete DRAM2 area for e.g. CMA.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
There is a project which needs the upper 2GiB as CMA memory, so these
buffers needs to move. This range also works for 1GiB RAM module
variants.

 .../boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi
index fa543db99def6..7059ab8bc9d46 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi
@@ -10,6 +10,18 @@
 #include "fsl-ls1046a.dtsi"
 #include "tqmls10xxa.dtsi"
 
+&bman_fbpr {
+	alloc-ranges = <0 0x88000000 1 0x00000000>;
+};
+
+&qman_fqd {
+	alloc-ranges = <0 0x88000000 1 0x00000000>;
+};
+
+&qman_pfdr {
+	alloc-ranges = <0 0x88000000 1 0x00000000>;
+};
+
 &qspi {
 	num-cs = <2>;
 	status = "okay";
-- 
2.43.0


