Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB709109E54B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 04:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AeTmnbZnY83CQhVxys4j7mRj2b/QcjBLaLjDxEFvpaQ=; b=RAN/J2k8hIyOEpY5JgddgqK38m
	/bwHhDjZfXpWCGhhCpWeWAwtHBm19EFXZqzuLekmNDuY2G3PKPiVEcPg6FSjm6By0YjQDdt3e2xY/
	DU3nEzVzi8yc9Bre4wJUlgnRlvkfqGOvPxV9YpGM1D+pn3CzQekhxmYvAF0YQb7ADZM/BAzcZSKj7
	7L2sN/OuG63K98Qp4h0OUSJwHgFMFcwbL9/vmKnaEHCHVNik/EcSyiqRKShvO6AcOQ7GpFl16JXtM
	GbvJsYYpSmYxZwVlayEsEmX+jMdP9NsMVv7ECg2nTI9o7U7QgM0b7G1V/MZDAb1WC5HmWC+Bu8NhU
	fMcF29aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cji-00000004hAC-2sXN;
	Thu, 26 Mar 2026 04:54:26 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cjf-00000004h9O-1OXL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 04:54:24 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fhBJY1Hfzz9tgM;
	Thu, 26 Mar 2026 05:54:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774500861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AeTmnbZnY83CQhVxys4j7mRj2b/QcjBLaLjDxEFvpaQ=;
	b=s/HHD9QdG1VFCRBxaK+6fmWwyTYzNkVBQ1cHwhKlujcHAwlgSQB1CUJBRwNMIR+7+9W0sn
	OFkWo0t2WRnBbn8NqHeWHglhJSIY0d2tc1BLfRx7fvX3reZICnM+DgKqDeO4PKDrf7FvfI
	/JvgrEDRBiE2EKuLGXMB1ezKfv4Hb1kCsRZQyYB8Nod9aKwmnCubHYy8Y93iAtfnYiT34d
	7zJYAyWdXE+RfXJHljz543OoZjO/lH0xdW/uArcyOzjwD6qtvN3wofSNaPNQhGA9HmszDL
	SNzHK6acdRWql1UxiE7neKQXWtvO5f1aPpHIoLxj2DLRg/RI6+hWf8Ff7xf5HA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774500860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AeTmnbZnY83CQhVxys4j7mRj2b/QcjBLaLjDxEFvpaQ=;
	b=cTWgs7hbPmiN7WBU9ndHjWgnCVVevnG39bqyJ/7vHxkO7P4H+kUvkyUElBMuz0nrwwlfaJ
	wwiV0Od0hA3CvO/OcUs7F0A+mpufn+sEtRLUA+apc0Fg7/SW3sn/r0X5WoU8wQlzPojpaA
	lD6Y855l7awAaxCcaE6OGFNLa4zoXTlFSzNzVbxC30D/ckSXlS0Z74fKY3Oi2HPO+uBVTf
	fHeIN+1wyQQ+mmevJ1jgjl7YE9Kgdol+2VmZbOLQPeYkBzLOMjSj45UopUaQtrQYDWi3Ss
	iK8oXdVybJj6COMQvLjkT4xJeMa7hc2eXBv2/clg4kMToK3cb7AzuYhZi7N6Cw==
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
Subject: [PATCH] ARM: dts: renesas: rza2mevb: Drop RTL8211F PHY C22 compatible string
Date: Thu, 26 Mar 2026 05:54:01 +0100
Message-ID: <20260326045416.223556-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: cf84ed23d9f6cae60bd
X-MBO-RS-META: ox3s6d789fioidcop7xtrpwof3d35sgm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_215423_516339_4D1B98CF 
X-CRM114-Status: GOOD (  10.45  )
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

Realtek RTL8211F PHY schema indicates that compatible string
"ethernet-phy-id001c.c916" must not be followed by any other
compatible string. Drop trailing "ethernet-phy-ieee802.3-c22"
to match the schema.

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
 arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts
index f69a7fe56b6e7..55221c82ef642 100644
--- a/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts
+++ b/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts
@@ -94,8 +94,7 @@ &ether1 {
 	renesas,no-ether-link;
 	phy-handle = <&phy1>;
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id001c.c816",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id001c.c816";
 		reg = <0>;
 	};
 };
-- 
2.53.0


