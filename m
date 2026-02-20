Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E19C56201
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 14:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=977B/ic6AJDBhQi658+RVyXZJ76tjyvN895prl/vc1g=; b=OTTsNjsJTJRc8+je1ihBTKMrvh
	Fe1WdyZAoCaxvlSfALJWtCPZGlTzDhnhdjWdG8rjktc7aZnfcd20UeofVVZTiMiHwiD2saWdorOPv
	gbwRSvFWsVGo8gHA2iQaaJ+EaJBj4KCCQlM4F4liaRJ/08Fm2DMCcNAuqh0ebDF6EDt/VL+M6yNRm
	38YUWm39PEnN+cfON0xAvdFiWVP605AOZYVAlXzfs9RuOEKKG4O+jNYVdcitTpCXy+lHFXnUbIo81
	csoETyr9+e+O/AH2pvJ2nk1huN1EHtgYb7zoDza3BBFLLrAqu1S1JJfeyImsGIJPi2M5lr/S3jti/
	evmfoALA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRyw-0000000Ev7v-3vOE;
	Fri, 20 Feb 2026 14:59:50 +0000
Received: from mx-relay49-hz3.antispameurope.com ([94.100.134.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRyu-0000000Ev6l-30M7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 14:59:50 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=977B/ic6AJDBhQi658+RVyXZJ76tjyvN895prl/vc1g=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771599579;
 b=aStxX1LXtC+QH0mJ+eSri0UPYmFqAzbQZ6lw+kgKesPsCF8dD1/tvqDxj83c/W8bO/cgf+mC
 9qvEeSQkUnLgvD+CsM2dsx6ahWDvTEU7YwRYj5QsfugBtqr5SsiSGyVY4HUY9d26d82ELPsBEXA
 daPWRaec3k2uPW1+TrU59BRqN645M8pxlTYgeHzTF+ZjoIIbM4Xl2MMPdgsAUiC/ZEaB4wMnDt4
 PliQAkA8RmQ6jO9TPNWZNGyxTZ2WmbZQI3fq3SMj8KXkYhIkXKdm3nuldUo5NbLSi/1YB40ePKn
 UcnNP09SgQUZOqVBb69kmqNGaCn4N843NsqNQSY9N8N/g==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771599579;
 b=MU9+THZ0S8cNY11mV/uYnIo8ijiMWtLyDSGUnQPnC/F5WBJO+vfhpDff9wDQCMBFQjNr+A/s
 Mj+7YYIOb3eegWiTZ8+1R9Y2kMbwQjHP5ts7l6GQbHZjrNbXkGCpKReu6HYfe/nOYss3MKeawo/
 EKD5aSPrXbG2Jnof+RB5r2tqfpB2prMYBdCXijXiWosbNgZ0otpxhwhMihhoXVfM78fVtMRZoHo
 EuwB7nktVrpT9AO6IMbvfdPxgh4X4wqpU/Va9OvM1zKxtbBIr4zh0obeaaxWeA/fxI+/keTNPUW
 ZwdBRdFQrlBJEKh0qsgJAOy8+JYKOlvgkvXKSJcZKwegg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Fri, 20 Feb 2026 15:59:39 +0100
Received: from FEILKEA-LNX-W.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.feilke@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id CCF6B22071C;
	Fri, 20 Feb 2026 15:59:20 +0100 (CET)
From: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
To: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v2 0/3] ARM: dts: TQMa7: modify for use in bootloaders
Date: Fri, 20 Feb 2026 15:59:06 +0100
Message-ID: <20260220145917.1797286-1-Alexander.Feilke@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.feilke@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.feilke@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4fHYLK3dnmz3yZ1l
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 534bcfafd7dddc9c5c6fd6b8117fa64a
X-cloud-security: scantime:2.046
DKIM-Signature: a=rsa-sha256;
 bh=977B/ic6AJDBhQi658+RVyXZJ76tjyvN895prl/vc1g=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771599579; v=1;
 b=FtGgyp56NO/ZK2sERlNQmpBnK0/krG825J8r+aukkbwf0vOQ7WXCh443+ReiuQTX0qukMk95
 J8C3lAEHv7X6iXr0dRcKNhsx+3Rdn2gjtW7MdwkQ5ATKXOs23P7TcRdSdOnwfdI2L6BEGREiyKJ
 mcOyWTQ4WESDiGmptLDWjmmQAu04MOahCfdV2EIzMSalcMsGrHAEUU6v1lMHWcssUkg957kirYk
 1TOGi/2cW6yLxjBeGWC2VcojU6+ugBnbk8r/HhRjLL5dj2ne4Za5Qqh3Lmx3t3Df9T920CjTeCI
 C9zfne2kr4xFXxSM5H5WGXRcKwEY2xHElsUduByGme/eQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_065948_892892_AF1F9616 
X-CRM114-Status: GOOD (  10.38  )
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

V2:
- Updated commit messages
- Added missing QSPI bootph properties to imx7-tqma7.dtsi

Alexander Feilke (3):
  ARM: dts: imx7s: add boot phase properties
  ARM: dts: tqma7: add boot phase properties
  ARM: dts: imx7-mba7: separate BOOT_CFG circuits after boot

 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi  | 13 +++++++++++++
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi |  5 +++++
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi      |  5 +++++
 3 files changed, 23 insertions(+)

-- 
2.43.0


