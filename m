Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFABCD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 04:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8H/BzmvfdXAxoPINyZMZPFQoJH/QAsgzKpvh+uKYDKU=; b=x733gDtaFQnyX/9y/WZwr1irTb
	qFH8ycs6nIsFbaZfU+kewSaDB273lsn+mAXEYMpBFvSH/66Pdv+xar2Ead5uOz8Y1pQ3HhULD2t7Y
	Z43ge7dobsv9zBc/Ssrcm4anV6IMnbmi7CjTvlcVzKfmTcPzONeZIY42ZRe3AOB3XuHZbhkj43Oml
	ygT7Szdg4NGgsdHrcDOMDlXK1mE1KVMswSO6+h7nbJm8+xbr9keA738eEPd8GMpDklgdxQgiSVJBT
	9enqW+mfdTi6hJMmf3uaYC0eROdkEWTEf45vCmfII+VPgE4KOHwu6Xmn9ysAXs3pImrs03w+VI6ei
	jOKf4D5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb8HC-00000003hJc-1uO1;
	Sun, 21 Jun 2026 02:51:14 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb8H5-00000003hGq-1nyU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 02:51:09 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gjbS546N1z9th9;
	Sun, 21 Jun 2026 04:51:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8H/BzmvfdXAxoPINyZMZPFQoJH/QAsgzKpvh+uKYDKU=;
	b=qY7mCDDcuAzNEHhCbb1m/PKfK+eIryd2BF7qC2t8zm6/ne1cdXVliwrRWPzx8hQcXPJZuu
	OggZoih2zI0ys4HLST9HEI+osZLpGEZ0CKRxZ6DE+mGMdhk7k2BUyN/X1LJN8vk/EpqPXQ
	XbxO+OtV6Syc9ype9FxG3jUAR62WeqCAhPQ4ehpXDoiddnpBQ28IbQpzO0tRTKAsfOuTBT
	Y9p9PFaL/KApdkHG9EjWgU4NHTu0Iid8DJ+cKLeR81nOGnKkd65Xinr7aebzx3FExran/M
	i53T0ruizDq9oLSpQeR8EK9w6pSn+4wZa0oUvfc+M52Of/g2eCVn2rzwsvHUKw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8H/BzmvfdXAxoPINyZMZPFQoJH/QAsgzKpvh+uKYDKU=;
	b=YwrVIRTdbZdURODYPnEYK3lCjzMgii+MGSG7rp0gXOOWX3+e+Q1m/dpyvmrFUV/CQnOXr8
	M40EVMFz+nLwxA6i0KJ0d0NpypOezlc1JFJi+KQx4hqtGr0CeTBFrE4FIWMQY0jWttdcbd
	3GvW8nfW1dy55ezEwnIdX3/flYL1WLm4vYaUbfj2z5am+weC1dg8pyQikDZA8J4JVCAsYZ
	MG/YiQbIxxD77Cbn1DSPuqmAZqdoxckev/VxHvovX3UB0DRG8cBvJw+LwEXyA5psqWIY8h
	9+u9T2HbMopUV+YEOin3qWqNzdboiwBm+fCvXvChDLYCU5nLixrzXhQTUdj97w==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/9] arm64: dts: renesas: r8a774b1: Add soc: label to soc node
Date: Sun, 21 Jun 2026 04:50:22 +0200
Message-ID: <20260621025052.406507-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
References: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: argcn6s6eee1gxixbrctojrenhne85dk
X-MBO-RS-ID: cd2612fd6255db4ecd5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_195107_639104_B526D09C 
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
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index ceef0104f75e8..62c6703917db4 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -146,7 +146,7 @@ scif_clk: scif {
 		clock-frequency = <0>;
 	};
 
-	soc {
+	soc: soc {
 		compatible = "simple-bus";
 		bootph-all;
 
-- 
2.53.0


