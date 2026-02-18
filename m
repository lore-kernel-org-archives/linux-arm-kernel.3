Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1D7E9A049
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 13:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=26hFcz4YFdUZ64qcDiMi0nzQrtZxfOFCZaOcVUH9w7M=; b=jj2NhpPELbrDwBCN986Rj5KuaN
	NS/Ewf1iVjYt6Ikfd0cJfcFVZMNAPgQdkK0RORmSQAEy5vMImF9uf3NIMXaBLuQ33VC42D2T1jwA3
	+xTLTJ1GklQdTkU2zFsFltW4o/F6lKKC5SX/bwlLC0VJI7pRaltGAUIJU4AxCIyjX80fehllF9BO0
	Vi9kp/YCNFB2kYUZg8ZxO8XUevtuKh1sPVGTfPnVTgloRU/6xASdGR9UdOUE2Ux8ifUYnJr1iy0au
	x6cg2UpunUNH0Yoln0iGIUdFzZm05UCeVG71fltptcvTC7UrAxL/g4XlYItn4LYnO+1SsC1BIUS4T
	4tjthxhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshXQ-00000009rMi-3liJ;
	Wed, 18 Feb 2026 13:24:20 +0000
Received: from mx-relay72-hz1.antispameurope.com ([94.100.133.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshXJ-00000009rEE-06Ov
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 13:24:14 +0000
ARC-Authentication-Results: i=1; mx-gate72-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=26hFcz4YFdUZ64qcDiMi0nzQrtZxfOFCZaOcVUH9w7M=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771421040;
 b=pIrShg/Z3ECNdWAMRDHaBRBxtWr6VvkHc+a9NHeoRF+7MbF6SqWWyEqh8WlW944jVyOhsD60
 9UcY7tQNIPNWxwfKPlppzg88WildDclIF716ro3juiFz/wHdOBLtxzC+FVM3uDqR12ScRSzjSU/
 XFs4SbRPs51PjWhKnpzzSAvd2cofJduZCD8ruOww9kdS8BLHM1ZCDNTGSDpVuFf16G7SuyV8znD
 vOSDA67AGjSbTWmZzvtydR8UyW+kPzhRr0eeBaY3KrFtBZJHzG42biBfqbsGK2hfzU0Ut3zjmWu
 cxzj/ESIMNc78EHcENDN88x0VFjap4IJR7UIZU8ATRdVg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771421040;
 b=k4yCdUyCui7AlWLSrPEzUNjz1H8V4FSwV1w9eoehJN2SvyEtnJjLYz6X6jICBVnUT8RpZrdO
 pc0cDylYWq9A8WTthRTy0vsyPLemPVtA2vA4fTD0wNdmify95ijlOGczkr8xx/cHMPI7kX02qwX
 ezX8f5q2u5RQ8LoJ6Oo9eSNwhp4VQ6hxZeQBVJ5BREnD8n+GJ3+eksdzJSQYrADoGDmci0GII4Q
 Ll0iC6BpARwjAiiyoQHkShJCBD3HC4OnTNzVttkubItfeG/FixW8nQgcKBpeiJtiSiqSapFx5Zf
 xtViJFbQxEHA+DZH6KAGitheAyoI9/N7T8OWHxaUlji8w==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay72-hz1.antispameurope.com;
 Wed, 18 Feb 2026 14:24:00 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id D060B220568;
	Wed, 18 Feb 2026 14:23:42 +0100 (CET)
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] ARM: dts: TQMa6UL: modify for use in bootloaders
Date: Wed, 18 Feb 2026 14:23:33 +0100
Message-ID: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: max.merchel@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay72-hz1.antispameurope.com with 4fGHJv3yZYz2PVB4
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 0bafeb34a22a86651aa13410244c885a
X-cloud-security: scantime:1.972
DKIM-Signature: a=rsa-sha256;
 bh=26hFcz4YFdUZ64qcDiMi0nzQrtZxfOFCZaOcVUH9w7M=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771421039; v=1;
 b=E44Q9zJ1Qqg4G8UMH/VICt1lNS5TW0wEuwqRs0o7ZOWdVIF8ywQnVipVZjMTJMTOkCeXKOIp
 /G0tOGM19m+d6YmSqjLf/tqRaO/zt6X1LbWO6uwzFUaEE34sHXbBHEarb2A5q5AhFxh5FxR8iOh
 W6mER4jiJgI/bPpP6YuZ/6dHaXKaxoJHTOTwIvhsagbjcjx62X9XjKwgqgcldWwZs1qpbK4LJSo
 Jq9A1Vg0zWyDyv6wLzZN9aKz4ae5/jUOaz2gF486aCkmVGFiDUtmWOc9PXrzlxp4pGNOFtE7GGR
 Sh5t/ej4/NHkUKcuhYJ73w5NT9yQvFvy/ybI9zrNIBJ2Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_052413_508424_46128410 
X-CRM114-Status: GOOD (  10.22  )
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

This series contains modifications for using Linux device trees
in bootloaders. Changes from U-Boot bootloader are incorporated
directly into the Linux device trees.

Max Merchel (4):
  ARM: dts: imx6ul/imx6ull: add boot phase properties
  ARM: dts: imx6ul[l]-tqma6ul[l]: add boot phase properties
  ARM: dts: mba6ulx: add boot phase properties
  ARM: dts: tqma6ul[l]: correct spelling of TQ-Systems

 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi   | 10 ++++++++++
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2.dtsi         |  1 +
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l-mba6ulx.dts |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l.dtsi        |  1 +
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi  |  1 +
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi |  1 +
 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi                  |  6 ++++++
 arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2.dtsi       |  1 +
 .../boot/dts/nxp/imx/imx6ull-tqma6ull2l-mba6ulx.dts    |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi      |  3 ++-
 arch/arm/boot/dts/nxp/imx/imx6ull.dtsi                 |  1 +
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi                 |  6 ++++++
 12 files changed, 33 insertions(+), 4 deletions(-)

-- 
2.43.0


