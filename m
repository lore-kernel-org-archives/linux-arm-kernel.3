Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A16B6070A9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=me4fR+Pn;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dQQQU0j+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nWYjwJnesi109nR4qBmGS5QUAHWH0kyW1v6rv1/kzzQ=; b=me4fR+Pn2Nu2tBKGwQSGa7lYqx
	9VFoGKOkPveqo3kjOtLrtFIXhmHBtnTDeTFtIXIPcPyJ9D+/DuEw1voBNuEvSG4ChaTsu4sPbTXPx
	B74RuhgC/M8UQ0eNpNyqEnayPEkQaylD+phXBqg+yTjGOTua4rEXypj2HB1OhvnaSQJJYlQrjGoDL
	gqVCJgF3tZFR+gmvGraeC6uH3Ulf6/ZhpOcJrvf4eTok+6Eoq//CYQHDrj+H7Rj4Ar4zIK4dvbRaP
	HgIIrn+ml8EPfUnwyXujsNFmkLLob3zTwjHv/LoTpY3YpKCeACHhEKKLB4yOVJIbctoMIHRZdzipO
	qizOSxnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBXl-00000001vUY-2JPm;
	Tue, 03 Nov 2026 10:15:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBXa-00000001vDy-0lWg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:14:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EC0E043B40;
	Tue,  3 Nov 2026 10:14:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793700893;
	b=2ZG1bob04Xw53YQSWBPg5q1lb1c4vTCWaplnJhL8yFlMOhFZIWoOeYP57UpfXgPTL0iM
	 27TXFSPWo0SQTBAJ8PN6DT61Cj8tBX5pSQgN6HkSRj4jH5GEtPdOpNq4AGZBJxHRgdC0Q
	 SPipYdHfD0r0VPMWjMoUdBpFS2oomIkc8ogxH27Vaqb12pmPoq4bmyHaF+DBsg0IzaNaz
	 sE97lK/ky5wsiuRGkf98MjC+pCuWwCwbJ3xcWtTYjTehwWw6z+IaG7YyCfg4c9aDNtdJU
	 8z4LBO6Oh1IdhnlvZgwDBsfpw07WxlQRQn89GBY7nhErkGN1GOFJCUXNziPxJaQ6yrw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793700893;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nWYjwJnesi109nR4qBmGS5QUAHWH0kyW1v6rv1/kzzQ=;
	b=DQcRnnMtUiSf1AfpXNYI0yJhbNVs6jUGW+B94aKI7+feGz5mgb/ULtNtAZQac7xbBExU
	 U190a8xDIM58HZkxADq9j6uko3dlourkTIAGQ822X6IizCd8+R8M4Tuvozzrlbfwr0v6z
	 XsLZIRvAIbkLIo1yYdVNGm+v+mFG+Fc1+dYkAR4aPYhxV3Kpr2Y3TPOzwKumxrAP8jkrT
	 XsUL0gger53ienFS0D5BGnzFYe8AMcXbLn8bP/5goUPuYEGXKzHZumJy+ZdmyUX7jMCUb
	 w5kP1NOpPrF4TDMSkOHRIguezGxM9DZRu1U6jlMelCkPicenfFEtqWVCKg7WvAWKY8g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5B4091F00A21;
	Tue,  3 Nov 2026 10:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793700893;
	bh=nWYjwJnesi109nR4qBmGS5QUAHWH0kyW1v6rv1/kzzQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=dQQQU0j+ZgpPmDou54Zq0Aopsmg8gsQWqu6n5dPiaPcfw5exGxaKbOZS7Aa0je/rS
	 fDpor0mdEVzye3/CLTx7Fjkho1XnwuNfM+itMBuQ3tHYqKeV5+ezjHfuHxvM8AlihF
	 JUxOhBfNEyDS17Uh4nP7SrqWyucXZ/FEubfopD0CovlA/ChUDh1w+P5DCvt/LbqmSk
	 xkZ8CCVxACE2WpcQ55NWCV2AGOUEgd/aGvP5rgF85K2R4cHPLtz4yuJiOPCFQHgSrN
	 INFgwL9qG4p/vJWjBVnBaOEdLy4dmA2/m3uOJEyf+a/i7dgnkmKNJNU76L9cXJnJaB
	 ImUNxWYl3ZsAw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 394C0468C5;
	Tue,  3 Nov 2026 10:14:48 +0000 (UTC)
From: Myria Sarvay via B4 Relay <devnull+myrialsarvay.gmail.com@kernel.org>
Date: Tue, 03 Nov 2026 21:14:48 +1100
Subject: [PATCH 13/13] arm64: dts: apple: t8140: Add PMU Device Nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261103-m3-plus-pmu-events-v1-13-a8eb6c1139fe@gmail.com>
References: <20261103-m3-plus-pmu-events-v1-0-a8eb6c1139fe@gmail.com>
In-Reply-To: <20261103-m3-plus-pmu-events-v1-0-a8eb6c1139fe@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Yuvan Shen <yuvanshen09@gmail.com>, 
 Myria Sarvay <myrialsarvay@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=855;
 i=myrialsarvay@gmail.com; h=from:subject:message-id;
 bh=HmrCqgh4Krnz4um2UxQsOgO7E1EqWRunv36sceKf0O0=;
 b=owJ4nJvAy8zAJRbk4iixYu2/l4yn1ZIYsl5uEbWbf2eZttg2Kf6Vk8J3tq1qkWi0nn1o/k21Q
 CNh37z1ogYdpSwMYlwMsmKKLPqmadqT2RoulS5z3QIzh5UJZAgDF6cATIRDi5Hh1ook83DWKZFu
 iSFitnueCYi8WsvRpXb/f8MOtg9R2urHGf5XTdTlZMkO8hN/u/eJ1e6CR7q9d5lFdkatONXxV+z
 Zz0kcAG5TRfI=
X-Developer-Key: i=myrialsarvay@gmail.com; a=openpgp;
 fpr=2F35662B930680D275A645B452444118A8ADFEE9
X-Endpoint-Received: by B4 Relay for myrialsarvay@gmail.com/default with
 auth_id=1027
X-Original-From: Myria Sarvay <myrialsarvay@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: myrialsarvay@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Myria Sarvay <myrialsarvay@gmail.com>

Adds the PMU nodes to all t8140 devices.

Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
---
 arch/arm64/boot/dts/apple/t8140.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8140.dtsi b/arch/arm64/boot/dts/apple/t8140.dtsi
index 150d91bdf6fc..6e6fd5754406 100644
--- a/arch/arm64/boot/dts/apple/t8140.dtsi
+++ b/arch/arm64/boot/dts/apple/t8140.dtsi
@@ -136,6 +136,18 @@ l2_cache_1: l2-cache-1 {
 		};
 	};
 
+	pmu-e {
+		compatible = "apple,tahiti-e-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	pmu-p {
+		compatible = "apple,tahiti-p-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		ranges;

-- 
2.56.0



