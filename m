Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07ABDCD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 03:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJqCSchciWYTMF5WZephMtUkSXVgpTC1jk/yJIIwF+A=; b=O50CBt0pH56cn6UVG1oZqt0ZFB
	xecmWlZIoZ0gb/3XHVXzIlEz98zjkuSk6GV5bw17bIwWhuPvyNoU9Ayts22cXFCyU8Wb+nciP53Tp
	n75yYRKOjqCbqHjgtBDS4sqNNOas9EcDr1MfWSVh4WBLDxDXK60FvIyEQHe5bucrYTUhQnhA2L9Ew
	hCZ0i22vMBncT2hNCx35S3+n/Bdvnxjxd4TdoAOxEanPzUeCOqKe+J7EIzkOqK8F7+PZxAqRonKBX
	6sOsmvEl2zSMmeWJ87lU8qpqvss9kxlSHLF64C73Id1FMk1lZ4lXFXPUODZZfGrZdkxo46QyAnQkF
	7s/SeNZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK6hP-0000000F1tn-18Oz;
	Tue, 05 May 2026 03:43:55 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK6hL-0000000F1qL-2w7H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 03:43:53 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g8krk0ztYz9v0H;
	Tue,  5 May 2026 05:43:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tJqCSchciWYTMF5WZephMtUkSXVgpTC1jk/yJIIwF+A=;
	b=NO4TTCsSunFDg1wBsun5BoTOzD5cJxVGm2lbedWGjuWY638s8RLiGBZw+ODe9d453/GdpN
	rg809ALv4UWeWe+T06gVZs9B5Fl4iN26kyRsM8xIpx5UgTjXSItnH9ZcbpUsiJ8ZywOGb9
	rYAoJyYvrQvUgIVOMwX+ghRkK0b8geAv0RKcg4Ywj8WwhTfuSCwHXm/DuXvUWL81KLKR4U
	ea+vqex0Ub9LIXjKYu2wvjYXizjXZtX8ZnPqSvypVTaJOdhsM3mqo+QvtPBVXxODIWv2xI
	+9uH417+Uecac+Mpq+y7rq3ssuduIKhc5EsDohakjm7jH02kGK4pZ6jz/ouyig==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tJqCSchciWYTMF5WZephMtUkSXVgpTC1jk/yJIIwF+A=;
	b=K73gyQHmoQAo0mUsy4GHOkD/rGIw7wXBEMLK0ppXjyVuZwI7og83BXBL9/dsme2YmXZrqJ
	cjG1cn01NjtiWPe9OTPdqm0p1k7f5RKztWVBDU9ZAfxMt8aZ35+uEHqOl1zABK9/8cNLG0
	Cniqss09KhF6OOwU+qtl90QKMkcRCqTpJD8LXAchzfQB4UF5yfRm2SAjGvKPlYLSvrp1g+
	MEMyxcDAcS8vA8/ZzTPWil/DQFlcrPdXEi84TB8KHxgFQ+cBZ1mxP3EZP7pLc3WJ6alheO
	8AMWmiRRuZryk/kv3EiBQWPXuEfn9PSSIUzonHIm7/7hbPR7/oSm/njQfvFz3Q==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 05/11] arm64: dts: renesas: condor-common: Specify ethernet PHY reset timings
Date: Tue,  5 May 2026 05:42:46 +0200
Message-ID: <20260505034325.167797-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 3wd3ourmcfgnxxgi9f3okt13my4h5m1m
X-MBO-RS-ID: 90451f1b34e0b47f484
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_204351_891447_0D7F9A61 
X-CRM114-Status: GOOD (  10.84  )
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

The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
de-assertion of reset, wait a minimum of 100 us before starting
programming on the MIIM (MDC/MDIO) interface. Set DT property
reset-deassert-us to three times that, 300 us, to provide ample
time between reset deassertion and MDIO access.

The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
voltages to de-assertion of reset is at minimum 10 ms. Set DT
property reset-assert-us to 10ms because the KSZ9031RNX RM does
not explicitly spell out how long the reset has to be asserted,
but this at least covers the worst case scenario.

[1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/condor-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/condor-common.dtsi b/arch/arm64/boot/dts/renesas/condor-common.dtsi
index 6b22cc0b05b19..9d55509b00b15 100644
--- a/arch/arm64/boot/dts/renesas/condor-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/condor-common.dtsi
@@ -168,6 +168,8 @@ phy0: ethernet-phy@0 {
 		reg = <0>;
 		interrupts-extended = <&gpio4 23 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
 
-- 
2.53.0


