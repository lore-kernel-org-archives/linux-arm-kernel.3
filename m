Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80714CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 12:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Tj97bgHVDN13VarG25MeBuEY3cF2iNUf5mx4TIglo0=; b=xdj2CY2Zcvq2dJjFR1K39RobF7
	i+doEyoVoD5gxOUN5rKbeeHxtDlhAw4hzLu7BzFYjnwMbqs8133knDFZhV+oRoc64bzq+4CEXjzRx
	jNpcQRqrcifFOh5jMk0F5Oekz1LrLnp5YHtMg8FEo0Snf2HBpFcOKrlg1/jcLcMatlzCICHY4N7n5
	sldrriNPYpDW8xwW5vKmLdAeZxb+FdiC01Z1jzz5XxTTW5Ta5U0L+5y+d1iPUpfyslT2AvOMryaT5
	NE7V07VB6+dApfU8hZrtdVRBVmgJr7OCE079XISB9GghMWoaMCYOioIIS6ldbPeJBXufWneYYDycX
	3gn1U7ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyTx-0000000G4im-3CLL;
	Mon, 17 Nov 2025 12:37:21 +0000
Received: from mx-relay22-hz1.antispameurope.com ([94.100.132.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyTs-0000000G4gt-0son
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 12:37:20 +0000
ARC-Authentication-Results: i=1; mx-gate22-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=9Tj97bgHVDN13VarG25MeBuEY3cF2iNUf5mx4TIglo0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763383023;
 b=Xc9chGH81cSpRH1F4kvLuZIBHJRv/dadELlKaJr3VQjhIX5lh+JTRGSIXxLnI2aWHn2VhNfz
 /XkBjXmaJcg8+sJIEjghtgsP43id4T/z6lVx0/hoP9ctd8uuEG9btOyFu+iQ9S5ZGEHkTIWxe6B
 LGstbfsSaWRNsjZClWwTS5pyO0LxLAyce6gbEziZlyd0isVONjL0fqugwA1+BbnPJcIg2NcnJkG
 36qgBTbEqm796CXbBLA3CtZTn9Zw0pqglovBaAl7ARRDYI2zopx9PKmfY/B/eOWQY+Fiigaf+Xd
 lIESXzlI5TsEd8pCZvi+RzPlf4M1MZeUY0UZVbGdhzkJw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763383023;
 b=J7Cx0qOKngXd50t6wU+gVLWo3WVRosJRek3yoGgi/46P3CiApGHx+BP99S68iH3lr7HYkPmS
 nD+Q6UZ9R5zOvRrowRYEsXcGR8RtinF0/rr1jkjgz8xW6DdSBtm9L3trXd38M9VaBngV47qCgxM
 Za3gIV+2HQbKollCrQzBHCp9NYRXJa9LSCy5yNs6MbAe2I+n8ckgBN4vd/CouBuW7GW9uFX2fNt
 pA4mzvWUewE0Me2jnmQFY67g0mLKgu0vMZQSEMy5f3Zot4YsFlcxrQ1BiQIYZ4DFkr/oGK3x714
 lordCHw+bSOubABOD8XHWXjRZA+vAAvg34GNPy69OPwww==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay22-hz1.antispameurope.com;
 Mon, 17 Nov 2025 13:37:02 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C8BABCC0DD9;
	Mon, 17 Nov 2025 13:36:49 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] arm64: dts: tqma8mpql-mba8mpxl: Adjust copyright text format
Date: Mon, 17 Nov 2025 13:36:28 +0100
Message-ID: <20251117123643.711968-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
References: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay22-hz1.antispameurope.com with 4d96gk3DCkz2By2v
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 44583193c2954bed913768cd2e93b769
X-cloud-security: scantime:1.592
DKIM-Signature: a=rsa-sha256;
 bh=9Tj97bgHVDN13VarG25MeBuEY3cF2iNUf5mx4TIglo0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763383022; v=1;
 b=mXObQiU8EyzI2W1uuCHJdGnWhLQIUKbk48aHmr4G9yBDUAdem0DFQnFzU+6aeWwlRZpuHUTW
 tkCYSlDgr9ktqgdAfR/3q9/LurtOquprt1+5vpQkQzo9AspkL2icvRgSsiCPBK95JnUWDJJBjSn
 qUnEJWmAwvfb8TRgpBvaPI+7IE9Was37W5SDsKlYERZsqaFMO29KLcvAkxMCRQBLUmmYyWtm6Bi
 nPJQ23SYavBH4dG5loU2bBiKIFXqEZavE44igFxTPvQnn5TaCKLq5HFWYpUXjj+9YDYEZ7oJ9zk
 ImSc38tKDKnf2cClQwHs4NdvRhYkYcZ2SgVWjdo66N+Fg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_043716_835573_78D8C685 
X-CRM114-Status: GOOD (  12.03  )
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

Replace personal mail address by mailing list.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index 59642a8a2c445..0605cf2faf83b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-or-later OR MIT
 /*
- * Copyright 2021-2022 TQ-Systems GmbH
- * Author: Alexander Stein <alexander.stein@tq-group.com>
+ * Copyright 2021-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
  */
 
 /dts-v1/;
-- 
2.43.0


