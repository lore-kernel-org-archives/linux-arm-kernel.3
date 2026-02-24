Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DFEF3C997
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 15:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TPwHnjOyDLcddYkDcBVqNyNrgFvDUOQLimt5YHFhyj0=; b=hnS1WLSRSOXHj6knUZtapK9fPr
	WQOJwHVJyZRSFuTmPLspSoCtTvmKHJMLZfw2iBtKUEj1d22qXc+PYOD9p5ave5p2PlWgBImMQd7GW
	Jq8z2aIYOlrgDCQmV6fP1glOvxGcAuHSnCPAGqhB+QHhEfud3MI6fjz+kUENL8rac127m2lVvoN5P
	hlvaYoQ/1wwDOMS+PZyo36Jw6ZJl0jsIPM7Ou7Qf/H5/vCzdFOyoZtvIiEsjt9XZQfG5grbr0Hxek
	1FwjHNIBEBKECBKXCtFVDKC4XQmX46Gtf3/XOb+3U3sfKme+/nIOBpqJ6NOjL4+wowZeRiRau8GiL
	BfpEeNOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuuJ9-00000002JSr-2m2N;
	Tue, 24 Feb 2026 15:26:43 +0000
Received: from mx-relay49-hz3.antispameurope.com ([94.100.134.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuuJ3-00000002JQp-2S4b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 15:26:41 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=TPwHnjOyDLcddYkDcBVqNyNrgFvDUOQLimt5YHFhyj0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771946784;
 b=HMWK/uALn48dj/TC9wU+N8JbmIXzPC7iUvpnUJv6FPJUbudGGkGisgWVwwavq1IRLNtoPs6w
 J7eCupjI1+ggTL6vTeexNvhKM+A2owhie4ox8A2OLei9CROwxyaks3s9BT7rtQB73+/e+A68vtd
 F1XKvo4ByNfMgxMLqQTAqugfVF7sWfDLvAc9G2ZD+eCX9SPkY48eD+4jn9utu16Dk5XEQXE4rxK
 /a0XZw7YlcYgL7X8BZsK/CAHVKJheRUZ49WdRPU75lhafqJFij4M0YV7JCs60tbPjL0XvLWcyRu
 a3h24wbOiFUCuyjllFoMAqJU2N/uwxVe8hzO78PldebgQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771946784;
 b=DqrS+Zya7Vyy7GKnp7qUZaC9pjM+dUxhj+ZEWy2WpZcrS75cOPsEHLYa0BXJS4klTYz+1C+B
 wZesWz15UQTN4F8OlPZFfvHUWdm6EAQvqknWf4Rovycdd+Dd/sQJh1jJlUQIXrJVsJIPnbZjc/K
 y4qouXAi0AooyTbFFo+yoW5bnGtAe3MKl2w/k2NiF7tXWEz5W2VW5bQSL70FFGfXhB3yr7rYGBQ
 IJ4Mdda+7FljYTVARVtElVFXNVy4oyGtP0gLVAHN2cIS01h0wLRJr42ODhv7RN4PkhD/qo477+R
 zMZDlgAuTa0PNpXdZj2a1EXFYcz9bRBy+url3bK4InOQA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Tue, 24 Feb 2026 16:26:24 +0100
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: nora.schiffer@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 35EDFA4112B;
	Tue, 24 Feb 2026 16:26:11 +0100 (CET)
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v2] arm64: dts: freescale: fsl-ls1028a-tqmls1028a-mbls1028a: switch mmc aliases
Date: Tue, 24 Feb 2026 16:25:23 +0100
Message-ID: <20260224152523.570057-1-nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: nora.schiffer@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: nora.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4fL1lR64HJz3yYSv
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: b434f169457cacbf55fdb26bd24b492f
X-cloud-security: scantime:1.981
DKIM-Signature: a=rsa-sha256;
 bh=TPwHnjOyDLcddYkDcBVqNyNrgFvDUOQLimt5YHFhyj0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771946783; v=1;
 b=EKKNG1T3wLcFczZpPStQl3CzNqkr4f0lGCtNIaA+/kO26EgJnZzE8vqg2MoH/BTkI+F0bSyE
 p1ZUwuvRm+8JATBjsGZcftTszjVgk2Uh56sfdTYardz247CiTG1HTRe9UFSWFsnevN+YFvJZstO
 orEyI0LR6oDUd6IE6novO6JU+dmh7a5sNLZNMmL+7P2avVJK1QL+yF1kjoLk8EULtuaHAdieh8f
 D0KYPtt8+PYVUrkr6wWOdpWcc2K8NvuayROxNjFa04jtbzhXAPft6vtAv88JDFy9N5MBJGxl7kW
 dc/oyk8/ZJdW4w8n5Evwri2mXVCW7UCl8mcRYmlqEW2ag==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_072637_884801_BC5C7DA3 
X-CRM114-Status: GOOD (  15.52  )
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

All modern TQ-Systems boards follow the convention that mmc0 is the eMMC
and mmc1 is the SD-card when both interfaces exist, reducing differences
between boards for both documentation and U-Boot code (which uses the
same Device Trees). Adjust the recently added MBLS1028A Device Tree
accordingly.

Fixes: 0538ca1f102d ("arm64: dts: ls1028a: Add mbls1028a and mbls1028a-ind devicetrees")
Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---

v2:
- updated author information after name change
- collected review tags

As mentioned in the v1 submission, it would be great to get this in
before v7.0, as the TQMLS1028A/MBLS1028A was just added in the current
development cycle, and we'd like to avoid changing the aliases after the
DTS was part of a mainline kernel release.

Best,
Nora


 .../boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi
index cf338b2e80064..426a81e1743f1 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi
@@ -17,8 +17,8 @@ aliases {
 		gpio0 = &gpio1;
 		gpio1 = &gpio2;
 		gpio2 = &gpio3;
-		mmc0 = &esdhc; /* SD-Card */
-		mmc1 = &esdhc1; /* eMMC */
+		mmc0 = &esdhc1; /* eMMC */
+		mmc1 = &esdhc; /* SD-Card */
 		serial0 = &duart0;
 		serial1 = &duart1;
 	};
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


