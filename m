Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A10ACCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 13:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrjQJJxL5a0An32raO9r8CtscWfKA5mlsUuQyxrLoQk=; b=ZiX+3bOLzYIyZWQUL+p5KtElny
	/o6oFvmVoFEVTR3Mu4G3t5gy1r6gLaeBGdCC+HIgpCSk4rt6+DMThEcjT0z6JIe7rwpxKSfOhzN2j
	dJmHxaIY0QOWLxdG4konKuW1v6kioi/8QyyBGeewMeAbm4v3aAT85kZI1wHiKFTsMzuEi8AhP3G6l
	xUeOr0l2wEVEudndovlEx1SGpevkoa0ng0DiTtoTFbVSLM2eDsujaBix313g2lTkvr+e8aXTjl38E
	jL2GvIIDTVsZwn38gl8wFvfrJaEbeyDsTbSqzFYl6DuwwvqOpM1A3xvQCynItIxk46MY91sC8RM+Q
	SU4aUhdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET6E-00000004FHv-1ndc;
	Thu, 30 Oct 2025 13:53:58 +0000
Received: from mx-relay73-hz1.antispameurope.com ([94.100.132.237])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET68-00000004FEG-3gh9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 13:53:54 +0000
ARC-Authentication-Results: i=1; mx-gate73-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=WrjQJJxL5a0An32raO9r8CtscWfKA5mlsUuQyxrLoQk=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761832424;
 b=hRzc8lxSq0cdRRuJtxBbSdpP4deY6kRuVvGsXdeVfAnHRG7n+jeELh3rLGDgkRp8D2JJ36ry
 itSxttlCM4Ue5sH7nRWDl4LSk93qctyNPhZy2WDdjG67RzBamYarrtP0AOMPxXW7331xz5Uy4Nr
 r5dhDcluUcWQymvpIg1C7CrSFKVkJGWKRI6FUfqg3anr5FscuSGD2xB/ipxKpO0LmqgX3IoaR9u
 H4MxbcXLL+RVqB2m3+OLaP6Qc73PAuCC9U6YZlanrehNVKqMoXhz4Ju00jkX8OI2ZsvvvQuHvTH
 vi7pztjesYPQ3TOHXWQ1+MoAqmNZvJgL4uwOAG6RjTSHg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761832424;
 b=JMLH832A0tV6McGQJ76sugIk2CfDAxUxeJTko8T/aE/j8r+h9AcMTlHhs7im40jS2MEV1BYq
 ccdwzRCGjJhy3XVhp20/x/FtCMMj85XV3EXVQo5I3ysM920jtUH51iN/OhI+amgSIV7zJewBoh0
 8Vt+Lx1O/q4uyBqzG553fuv4JNwJ3218R7KDmQqPrsczDIU9ufK253mAUIZArHnjmk8soldwvsC
 PcT4SnJHyuvGJRpNBzKGmaD/cqL99asf+OBYePhvKc6VjTAkn1gKvyyhCTs+DLWStRPrn1oeYPj
 pD/gnBL9nYw4sVjfLPSuZoU5QY/AgRyIGnrJa1wINlJkQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay73-hz1.antispameurope.com;
 Thu, 30 Oct 2025 14:53:44 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id CE8195A0AF8;
	Thu, 30 Oct 2025 14:53:17 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/19] arm64: dts: imx95-tqma9596sa-mb-smarc-2: mark LPUART1 as reserved
Date: Thu, 30 Oct 2025 14:52:59 +0100
Message-ID: <20251030135306.1421154-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
 <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay73-hz1.antispameurope.com with 4cy5DV2Rr7z14YKb
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: adb5c744a6af74ddd2c8a6726a431f2a
X-cloud-security: scantime:1.676
DKIM-Signature: a=rsa-sha256;
 bh=WrjQJJxL5a0An32raO9r8CtscWfKA5mlsUuQyxrLoQk=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761832424; v=1;
 b=Wh//qWZXvOXWKB2BS1rtPl1NJyzofiln727KZKXgI8DGqQx6amcybCRpRCcHlIj6Ykp0AOdq
 VW0urIoUyi/n9/xhH96wGDVzVRJFbahBuZdhTy3ieyQ+SdemKRIlsoliWwvnnblI3C5xTWrh10G
 tywbh5e3W/+7daHtmuW9kuxwsrzuFngSWKg31H6knL8cMxPtRJMbE8204LGfxVRP+KDY4Cz+Ili
 0gFh8NMFuLGP4qYeOckLxpMNVnGpBcDeIdlvY5cBzQKswAHDmCc5Swa19qRkcqSvGgY6wolhwxK
 sgnmvpp2fhR//sHsbMKgsw6mDZA+i6hosW8RfEfBmj83Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_065353_055797_BFD645FA 
X-CRM114-Status: GOOD (  14.34  )
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

LPUART1 is not disabled, but used by system manager (SM) and should not
be used by Linux.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
index d1c3d55b14469..15d117d785445 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
@@ -212,7 +212,7 @@ &lpspi3 {
 
 /* SER0 */
 &lpuart1 {
-	status = "disabled";
+	status = "reserved";
 };
 
 /* SER3 */
-- 
2.43.0


