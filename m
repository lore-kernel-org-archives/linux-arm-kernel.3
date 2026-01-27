Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591FFCA6C9D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 08:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JcZeMaax8glokFuf1hG57EmbUz4Co4BzqzWcXBh18FA=; b=dxIo0Fu4Wo+dKlhUCqAY8CQ3yP
	MYKVc4dl2YItj70a4tctXGgu+8Mg5USaV61RK94imljxbIDi9QKWXIPGc2qj0exFidiz3dFp59+Vv
	2H6eMlaCv6s+A+/WF03ZrSHna4vg0eShR4EHXTz3akF+Lp3npDUp+q4r/iUEP1HhZoIjFcvvfdf+5
	695xPBUflyPSKJ8RdDKUbZukUVyiNafEezpI6B8LxJZ+o1vJDxnxq+fSBbrDHRiM6aGIHKQDt1aEV
	+R2f2/VpC5vh42OdXNaGFAqclzyTO28wuWqilADemY8bVsnd+5ySKa8y9qgbEx2jFKIrDhsIrSgCD
	9kKsNprA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkes0-0000000Dsu2-3LP1;
	Tue, 27 Jan 2026 08:56:20 +0000
Received: from mx-relay13-hz2.antispameurope.com ([83.246.65.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkerv-0000000Dssw-0OFu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 08:56:19 +0000
ARC-Authentication-Results: i=1; mx-gate13-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=JcZeMaax8glokFuf1hG57EmbUz4Co4BzqzWcXBh18FA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1769504161;
 b=R8c3t7wZnZelnVIpEUDEow6PFhgk7Ht+MjP/fFaioyXAb5LnsIheyVo1YZ+J1YX/4vJv4p8O
 GOVBZtIZOzhD3jROEAvDR1JH8AMObMJ/487IIwa5SZP1lmTEXmXaaoWr86YxH1UZTs3YVO6d20O
 K0kvadCz9tEIvOpWKi6lRkgc0kEzUdkUXYtAHxhN/IGkgDJh3Sz5RD1OZNo2QEpDZ1gO7sxULUn
 A/ylaY4K5bwhjZUKcHM+06fGv+pLRhhcO9lKHZ5YcUMeS+0nFwLWU1wxv00DncY4iQV6BmB17Ep
 6wY+I5JlHDSQZsF3MrOMYT3FcMs5JIcrhxl/4HxXITTlw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1769504161;
 b=kh0hExvivPf/iQJn/asEUzB+Mt1vyDax9N4yfz9V/BxWeg5NQyaOR4fXsv5/CsQ5T3wzA6TU
 RtrqivLp4OnldhYgGaEI9n2J0zaKiN0iLldMHoqy6MP9oiiq1iLMKdLCN3Kfaw5v1Xf5YjlJZZK
 X2QGqNj4fuJX5HTuKYXydU8ibwYbNJh9S+iChKGDqkg9CFEDYTIOZUTE1vtiaFFRaaNO0Bti7DB
 qCyOnk80nQMhwqWdVx3BKqLv2Jfvaa5Gv8GDvUMGwWrzrGRyyN+n4pPAA3hwUhkVGsUKt3/comX
 9IZpWTmNnRw7nPL02FC4b/I/FdRn98+xYn0uj89rUcXIw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay13-hz2.antispameurope.com;
 Tue, 27 Jan 2026 09:56:01 +0100
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 7A8AA5A0EE5;
	Tue, 27 Jan 2026 09:55:50 +0100 (CET)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH] arm64: dts: freescale: fsl-ls1028a-tqmls1028a-mbls1028a: switch mmc aliases
Date: Tue, 27 Jan 2026 09:55:33 +0100
Message-ID: <20260127085533.9738-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: matthias.schiffer@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: matthias.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay13-hz2.antispameurope.com with 4f0fPz1Jnhz3sw4M
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 6e26a58e6144cc24ca60a7f4cfcea837
X-cloud-security: scantime:1.869
DKIM-Signature: a=rsa-sha256;
 bh=JcZeMaax8glokFuf1hG57EmbUz4Co4BzqzWcXBh18FA=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1769504161; v=1;
 b=AwI/dzrijRu4ovV/CUYkEveWJ3JojQvxkTAKWIR+Fji4tWtATEk0sMGqbrYXlInnhTqe/bmp
 kM9rBjyfVs2HICc35W8shWvAAulsGoZ3cafNv2ZE8/3KOj6ujAdJOmx/LfT/WIj9HF5uIvxWdlh
 CAjmP3TMYI+z2UPRN14WhMFW7T8ZYoNwT8vJv5aHys7swhrvWTtxzddjSVww7SGGN5kZWCF1Nr9
 VR4hmFVEXMYpHOh1LrFNxRggM6TUm1bH78c0VGq23FSPkTHfuEVK141IZKARI3vSDoBv2fMF6rO
 4m4/zpRWJ+YzLWbWWaYazBGZgVtq8H81WVN63W7f8ALcw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_005615_500385_F63A3571 
X-CRM114-Status: GOOD (  13.75  )
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
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

Notes:

- Gregor (author of the fixed commit) is not working for TQ anymore, so
  his mail address does not exist anymore and he is omitted from cc
- Normally we would consider modifying the aliases a breaking change;
  fortunately, these Device Trees are only in linux-next for now


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


