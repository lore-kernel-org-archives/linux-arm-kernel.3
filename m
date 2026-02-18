Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C9EE9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 13:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vct5iZGd/imATYwEFgUO2YyJOrdt2X4AFQLzoSzucfM=; b=DhPrTCku7J/nuUUz2uarlZ/nmI
	8VZM80Tz6/lkFv1aId1Js286n71y9gaJmml3s+lYK5fqCodpxj0ylFwXenXnNzSnGCzHuElygKDO6
	hTZM8riAPWgIrC6S1LlADT1lhPAKITfXKrIqQgFCcbNl5knKTt9H60TB8hjeVKq1l+/tnTeW2KvCr
	445H2nX3gt4MYnQm24PjZ41fIn1m+i5O1DiH4PZono0MVSZAnA+PXA9cXRvQkEdJmT1U0sh6LNprz
	n2taG5a0JIcmE79OPBrHGhRuOUhttCdVoFwvGHC8jV57Nh0z7iXSnWXbdglFxLcwqJPBW4ofMSOv/
	GOCpkv1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshY3-00000009rpl-2A1M;
	Wed, 18 Feb 2026 13:24:59 +0000
Received: from mx-relay123-hz1.antispameurope.com ([94.100.132.115])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshXw-00000009rkq-0Nvm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 13:24:58 +0000
ARC-Authentication-Results: i=1; mx-gate123-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Vct5iZGd/imATYwEFgUO2YyJOrdt2X4AFQLzoSzucfM=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771421081;
 b=eRzLut9/W5i845M4IrKxBkioQj0KjOMWasHjJ5V/iVDqwoMrOIm+C7k3j5p8CL9QpcYAZdVD
 HTahhq6PNdxSEbuazj2okCNo8ruprVdZBhpWoM9F2TURddp7//J8UbDKJEJvwJWI4fXwXA1d3ll
 GjWEDGom1OBOX7B5iprfNltqSN31yr36GFmGs5uzM5jl6uB7zC+JRfuTkcrdCia4LSnaR2kZlRs
 UxcQzUNvywG3tuSS3wGkL0lb6umEKtgG6d+vpPkOfRAWUD7are9FnbhT1zMqz62at3qqj3x2qy0
 D8EoOAIA3DLqtcUO6qL1pn6Y3/i0cAS1jwTt12g+fMxCQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771421081;
 b=B6WufFhoqLGZRlxL34jjeRcd8hoITCuIB2Diq0p3rGu38rzMAansQdSsAHLFNcNHZ9xSLR8j
 HOMLOct3PEFleMqaE+gWiItl8n7VtqXC0NLKQpPVaEBoqFlVSeHxnPY2FdnviPsIRGPnHy48w3G
 fFWKzSaf3PUdRTHfdJEv1ncQ06ynq0kbQ7YV92RYxHwmLPM+yLgbcu7bmSecoaK+FDP203/zZD/
 OqUKnQKnFQzTsy8s1uITFfdjwZhY9cK7fzJ+gIDbSIaMzZLsuCXyKUh2veKGgqAjb6OGZNhn4VA
 CVQGuN7D5RaLGFP/Uz0uAyAW4ugcnNLoUSt/YD83ssR5A==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay123-hz1.antispameurope.com;
 Wed, 18 Feb 2026 14:24:41 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 30899CC0956;
	Wed, 18 Feb 2026 14:24:28 +0100 (CET)
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: tqmlx2160a: correct spelling of TQ-Systems
Date: Wed, 18 Feb 2026 14:24:25 +0100
Message-ID: <20260218132426.32293-1-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: max.merchel@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay123-hz1.antispameurope.com with 4fGHKm5Mmpz2mZGl
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: fafd118ef6036930a1a51b8f197bd6b9
X-cloud-security: scantime:2.384
DKIM-Signature: a=rsa-sha256;
 bh=Vct5iZGd/imATYwEFgUO2YyJOrdt2X4AFQLzoSzucfM=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771421080; v=1;
 b=IzKOhWWd5aH42F2tWUAvAX4cIv4J/rYoZmRQvDR2LSAcz0guNuhyjU7BzQjWUGorS37AXaZT
 bRBxQm9lY7AkohSjIxhKkPUN7CXIgIW9SaSyxp88r2l2MwMvHRClGYMFB4YJY6LCXT9VmwGl1t5
 yxRO1G407ilVEHO9NVtrJLhc/oCSizo2xptzs1wR3iWB44zgT8wMW+vtux7BMSjX/zRqnNshkkc
 NUu9tXkV/oNa6qmefmY69CA561ZPt8mRznQDYXAwjrWiTYx1rJWKmBiT9kla7qYdWmGnrLz8bm6
 BftkEOUfTIOSAfFQWF9o83RHMyoctI1sOo6JR63cTeFQg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_052452_297745_0CBCA20D 
X-CRM114-Status: GOOD (  10.96  )
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

TQ-Systems is written with a hyphen. Correct the spelling.
While at it, remove "GmbH", as the legal form of the company omitted
in the model name of other TQ-Systems hardware as well.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 .../boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
index f6a4f8d54301..48b23f474fbf 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts
@@ -14,7 +14,7 @@
 #include "fsl-lx2160a-tqmlx2160a.dtsi"
 
 / {
-	model = "TQ Systems GmbH MBLX2160A Starterkit";
+	model = "TQ-Systems MBLX2160A Starterkit";
 	compatible = "tq,lx2160a-tqmlx2160a-mblx2160a", "tq,lx2160a-tqmlx2160a",
 		     "fsl,lx2160a";
 
-- 
2.43.0


