Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040B6E74AC2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 16:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NA5nU2Vd4Cr3takSlNTHL5m15aLLN71NSVIMs5qo4U0=; b=SuIdgLirdJGeIBpwLd06CHBOTm
	zYpfUe+NPaugkXvAAhSaV3VqUwbj3htuPofV84w10cjZerh6yJr1tSkvgzVvCODsN027BRdkVprIO
	2EP6vLtlj9IB1UBS3rgrV4My5kCZoHT6J8hi9+rs+abFi9aK0q+tm28j9VPcoq3Q2vNCToQoelLYm
	QPYHLeJ+hSX/ttkjn41cgvjO8RTDte9MM8+sDRdndcXnDtchMfgl0myQSCLpoqopstv5i+EN/cXgT
	TKUWZK4e4uPvACxkTEkofZtrcT/RL2gDRt0RotGH3kFw8JlzgAwWIzeSAbRGofol9K80bPT/bbF8j
	KQmw8oLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVy5-0000000A7yp-0H8k;
	Tue, 03 Dec 2024 16:41:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVx6-0000000A7qX-2eah
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Dec 2024 16:40:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=NA5nU2Vd4Cr3takSlNTHL5m15aLLN71NSVIMs5qo4U0=; b=c5ezznB2pbWo6ziifxnIquxbLV
	GqBb3pERzfL/+wrET1Ua3a7G5jO54X9P4qamO/JgySfkrR6fqNi1euNV5fEK9RqUCYsHzRWEQ4LMR
	vy1tUi5IuO51CpDq/eaHWEJPocwmUX0eBAW9hw7n54Fr+Me0BOywGiZjmu89YDfS6rSX8oqbai1zX
	1jWJG7lS20wo+0h2qnEklxnbMxqjdBgl9tecEpdCeyOfzJTgHn/OX2HKdUvMlCkLxzABzJKOUUh4n
	6gCU2ELjmhdgtrOfSOk5HvcBaJFAEvbejTE3cl+Mhlh3BDCQz36QZrNF/W85ntaHYZW6v7g2/cCYw
	9Y7i1s/Q==;
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVx3-00000002QUj-2WIl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 16:40:43 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B3GeX8L1911581
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Dec 2024 10:40:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733244033;
	bh=NA5nU2Vd4Cr3takSlNTHL5m15aLLN71NSVIMs5qo4U0=;
	h=From:To:CC:Subject:Date;
	b=zVAqtSjPqmM7yBmQehi/Wpfg3wQHyk9CWsfhVAqRskCcs8OK5d4il3+7cUwMXHXXU
	 R4qOW7IzFihd79iIDfcFIqgLbM34F+jXE/iXPGRMqX/X0/JX6ZKPGE4Xsi/YhFFRxc
	 dKiE8kmLhy6lHHGMfmebGyPpK3qfVVMTi3k3ZMY0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B3GeXHr051919
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Dec 2024 10:40:33 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Dec 2024 10:40:33 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Dec 2024 10:40:32 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B3GeWal035675;
	Tue, 3 Dec 2024 10:40:32 -0600
From: Andrew Davis <afd@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-am625-sk: Remove M4 mailbox node redefinition
Date: Tue, 3 Dec 2024 10:40:31 -0600
Message-ID: <20241203164031.20211-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_164041_883023_27288198 
X-CRM114-Status: UNSURE (   8.42  )
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

This node is already defined in the included k3-am62x-sk-common.dtsi.
Remove this redefinition.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am625-sk.dts | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk.dts b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
index ae81ebb39d02d..2fbfa37193457 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
@@ -219,13 +219,6 @@ cpsw3g_phy1: ethernet-phy@1 {
 	};
 };
 
-&mailbox0_cluster0 {
-	mbox_m4_0: mbox-m4-0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-};
-
 &fss {
 	bootph-all;
 };
-- 
2.39.2


