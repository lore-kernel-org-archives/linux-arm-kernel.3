Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A418ECDB466
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 02:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSpCTFvM5CGoSh0YNKp7bvTUJBpZmhGPb6YmCd8E2Ys=; b=pHOzWHm2cYUAAO2MEX8URQYgg8
	H0a0F29USYP5c018kA8TuqVLzR8Ae3HEMpG7VuwgBUrPxoaJMbdNm0qYqVSBkX0Cgv89WxhVoWoko
	w18XgMlHeVA92ek2RAi7aoIbMhNhu6cHxhc7e8vRYIw2SarBo2TLyojSIeJJ1aTVj5+DbMb40TRD/
	dXpIvghpVUQrGe6VJKXZc2//6OpqvHL9AP5WjJYPKlw+GEt4HwQFgpATLBuciuTOyDpPwJaWxPqcz
	vxCDkk3wa6TkIMds6ZZlT1AwATJyNkIqW1RhlC7Hc+mWK7ZNkDCsev7hlx1kWbGhL2C/HcjsrF8re
	8DqgId0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb8HC-00000003hJk-2MRn;
	Sun, 21 Jun 2026 02:51:14 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb8H5-00000003hGs-1wX3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 02:51:09 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gjbS75kpgz9ty9;
	Sun, 21 Jun 2026 04:51:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LSpCTFvM5CGoSh0YNKp7bvTUJBpZmhGPb6YmCd8E2Ys=;
	b=xgolok+HUXFciW7Rsg2+BEXtdHSvg4W4IQueB/lbHgwBXtWJQbUsuukZ2AhVek2cBABiZd
	Xlw08xXgSiiV/czU+efoJx3WKacN5lK4ZTJfgs7DNDBpeKNbLtmNbYXdU2BcdtT/mrK5G+
	lxipHEyF8/ZUi+QW6u/pumdrRBvfhKbQ/O2VMjatde+pnJ8A+Dpu5+mC+ru7hsA9Fo0lHE
	D7VEtAZ3bcHpoRfcZrW7t0rdz9u+ZbZQvABu62bKeI4Jmet8RAqaQT8UK6zqrS6OZuQiLn
	S8fsv9hyZLMM7SMMXSFz/FNch+/3XvbTDXuPGUcagw4wQmygnNVKSqeRGDFYrA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LSpCTFvM5CGoSh0YNKp7bvTUJBpZmhGPb6YmCd8E2Ys=;
	b=ZFbYxBwjAe18YFejK6UrLCttXPjtHawlF3QoO65z0SPHeE072X/EC/1eqP9NAY4yFK/Vw1
	Dkfns4YilhjeV/QtNoJ7UlpwL2Je6gwaxOXI63TVNcmxWAJBV6YZ9owZF4B/t3jxjZ6yd4
	01LJ+1LzaXFin+07sI1qpWt734SZlNnubk/4RcAnqXs3FLixwR3P1RQbqF+Gltpvg80f+I
	hQnspsmHcgY6bM5QNdjjGq0TmjfSzsPBj6+tN5nilwDtPUbKVZcu+Yq5JSNCdICMhJ3+Nb
	GHmn8aRKWKSjwQGMNRWWdEk5MhCp2IzZ5CD59/7JHczjiWL+5fFHAoPoxkluFQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/9] arm64: dts: renesas: r8a774e1: Add soc: label to soc node
Date: Sun, 21 Jun 2026 04:50:23 +0200
Message-ID: <20260621025052.406507-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
References: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: b3ntanrgis7dwbcbub16a3pz5m9ukp67
X-MBO-RS-ID: 8adb634046178569373
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_195107_654139_BBAF58B2 
X-CRM114-Status: GOOD (  10.66  )
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

Add soc: label to the /soc {} node to align the DT with r8a77951.dtsi
which already has that soc: label. The soc: label is useful in U-Boot
where it is used in U-Boot extras DT fragments.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index 9df5f1a424004..0ae9bb72d2dda 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -326,7 +326,7 @@ scif_clk: scif {
 		clock-frequency = <0>;
 	};
 
-	soc {
+	soc: soc {
 		compatible = "simple-bus";
 		bootph-all;
 
-- 
2.53.0


