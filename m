Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428ADCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4WKY1M+mCt6prEc/w0ZwwGyCMMrAdJ9gVEqkv/x1d84=; b=3Ykb7AqIQkkkA43P3I/uXTofAR
	R60h9kL4jUsVIm/YQV+sF9069BVOiN+Jgjrn+Ic3RDcEMpoKMFPzx4WNjGUi1D9ComCuJjNeqYEs2
	F6xqBRq8w11Asfcenr9XnSb0Io7bDsCZzH9G7GzNOECMlflNEnH3xHHyvVYaRi/9dIU5ZiJlUkVMn
	VXHxDkrziAZMGj294aPpWBS2WXOzIrQ7wNpbIkID4JLWIoi8ZXyflwqW681oq6Oaz1vOwWsv6e6Yy
	xGstRIU4qiAnhpmN2HjrDHkNd1SfFdHXrr+hEKA8uE9LWR3g8SOrIInmGlQTeipGLh2yQqqXf4ykq
	hWuc+tWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hbd-00000007WJL-1ZGE;
	Fri, 17 Oct 2025 10:22:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hbc-00000007WIf-3W2u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 10:22:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EFCE8604CE;
	Fri, 17 Oct 2025 10:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A08DC4CEF9;
	Fri, 17 Oct 2025 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760696559;
	bh=/+tJshZWidqYuqT3iDUpEKBB+Rq7VWc/REj/SVidg98=;
	h=From:To:Cc:Subject:Date:From;
	b=ewM6SnuEjggeJMuD5GeY3bQ2rhXvle5vtCW7+r26VkpmtOqt4lVbq8T3BMaN2GPjj
	 kXCMM6/nLWyEi7FpMGjvP9kGiJru8EbGukJ/QSAEfOcIP1D2xe9U2609owmtN22zsO
	 4eqO/1go3FFYB/81cWL0K3PxIuKw4SVzwzVTShFo7mDFDftdlSdy/KTUp0PTQhYhpe
	 /baNxmrmSNSce97JwNE5jBzjdQzxXUv7MJ8V4mfnSrUh3MbcSZvRliomiaqCdLbXtY
	 qS++SH0wASy4fn1chbylNirRi8EGytAN2bHt/+na1Y89ttQS+8qyqcmvwQDyNc0OR+
	 8+ksGjDGHaiTQ==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v1 1/2] rm64: dts: ti: k3-j722s-evm: explicitly use PLL1_HSDIV6 audio refclk
Date: Fri, 17 Oct 2025 12:22:21 +0200
Message-ID: <20251017102228.530517-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The parent of the audio_refclk0/1 is about to change to a sane default
value. Thus, move the (soon to be) non-default value into the board
device tree.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
It appears that the eval system just need *any* clock rate for the audio
codec.  Thus, if it's confirmed to be working with the new default
value, this patch might be ignored.
---
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index ce3ed1b0f24d..5de038166a3d 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -235,6 +235,11 @@ opp-1400000000 {
 	};
 };
 
+&audio_refclk1 {
+	assigned-clocks = <&k3_clks 157 0>;
+	assigned-clock-parents = <&k3_clks 157 15>;
+};
+
 &cpsw_mac_syscon {
 	bootph-all;
 };
-- 
2.47.3


