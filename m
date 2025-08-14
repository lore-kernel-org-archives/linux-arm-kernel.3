Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3A4CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 14:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CchY9kgd+QHnqasSPXFS7iuj2D2oQD8WBNnjx7vsovw=; b=Q5aThAZ6FrIDkLd6B3De51x/Jq
	Kce4GcBe5rHuMIKsZIVQiw3ppDBaAdE1QZW0RAQTBPtcHpcSgQT7JCChVgAnC6ZBv0G6PrwJum34N
	559P3dWTfL7b9XgS08aAPAQ1ppHVlurRbYJfA2oWlnbVscAZAPY0gn75vAkl9mmVlkWExmISh6w3l
	zi8n8AMdJH3KkpcX0G2TPcEJGdmLvS9z5mXbodjToO5V78fn2Jyd6/qv2fbaivrcgS3c2nHiwoIcG
	tJ4V3O5gtxvfhvRqVF/iUGH7Ul9SyLnOeVvse736f9PGbdd7L5TCu/E6XdB8G8BL8gR8tpGG2qP5H
	CFoGoDiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYr0-0000000HF8S-3dpu;
	Thu, 14 Aug 2025 14:22:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYIP-0000000H65O-1boH
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Aug 2025 13:47:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=CchY9kgd+QHnqasSPXFS7iuj2D2oQD8WBNnjx7vsovw=; b=SYNcfF3FTmG3Vh2Xnmns5dzT3z
	zs502s3CJ/DGtsV514m00+0BW+5pRDuyH8UsbDCFQRac++8j+prKUlMqT77/5sg1DbvUFFvXqNezW
	AISbB/qeQybcsOpEUqu6anPMFLKYX4ZYN5HI+3zeYllWlo9Ef5u057p1/3Y8j0xSJcxM/QNgZTh1v
	2yq2wxtpr7jfpicsTR1K4Ny6MtzHMbkSnnrEkLMSQsoaGIKU0EqrpsJg+vy2o0b2p+KZs0cqZEtp+
	lk7XhlVjgLEPQ0xmz2telyE4QWXFFVRTB7Q7Ko9hw5TUo3BzlG2ZXCbVTvNruHFZ52Js/m9zE6ED8
	ZOfwOvXQ==;
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYIJ-0000000GPqf-3DHD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 13:47:07 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EDkrh21942947;
	Thu, 14 Aug 2025 08:46:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755179213;
	bh=CchY9kgd+QHnqasSPXFS7iuj2D2oQD8WBNnjx7vsovw=;
	h=From:To:CC:Subject:Date;
	b=IdZIJ3cRekrOJ5eRec8dUCXheT/vToLg38HmnDYjFTPjih2H+0X6nv0bL+OlbZpcK
	 /F4pEEOFuJWnuvZo4vRh/IwH44obOQneLSJ8rFBtBYk9LbT3t7S7sKY42CgdJOIPGr
	 2ES/qC8Hc2MKe85Nx4Lo8KbFzTJ5/rFRH8RDCH+w=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EDkrF71748922
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 08:46:53 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 08:46:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 08:46:53 -0500
Received: from localhost (dhcp-172-24-233-105.dhcp.ti.com [172.24.233.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EDkq4X3688508;
	Thu, 14 Aug 2025 08:46:52 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: Anshul Dalal <anshuld@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/4] Add support for TI AM6254atl SiP
Date: Thu, 14 Aug 2025 19:15:26 +0530
Message-ID: <20250814134531.2743874-1-anshuld@ti.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_144704_414934_5E44E560 
X-CRM114-Status: GOOD (  12.08  )
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

Hi all,

This patch series adds support for AM6254atl SiP (or AM62x SiP for short)
to the linux device-tree.

The OPN (Orderable Part Number) 'AM6254atl' expands as follows[1]:

AM6254atl
     ||||
     |||+-- Feature Lookup (L indicates 512MiB of integrated LPDDR4)
     ||+--- Device Speed Grade (T indicates 1.25GHz/1.4GHz on the A53 cores)
     |+---- Silicon PG Revision (A indicates SR 1.0)
     +----- Core configuration (4 indicates A53's in Quad core config)

AM62x SiP provides the existing AM62x SoC with 512MiB of DDR integrated in a
single packages.

This patch set adds the new 'k3-am6254atl' SoC level dtsi alongside the
'k3-am6254atl-sk' dts for the EVM (Evaluation Module board). The newly added
'k3-am625-sk-common' dtsi includes the common hardware between the existing
AM62x EVM and the new EVM for AM62x SiP.

Regards,
Anshul
---
[1]: https://www.ti.com/lit/ds/symlink/am625sip.pdf Page#21
Product Page:
    https://www.ti.com/product/AM625SIP/part-details/AM6254ATLHJAMKR
---
Anshul Dalal (4):
  arm64: dts: ti: k3-am62*: remove SoC dtsi from common dtsi
  dt-bindings: arm: ti: Add binding for AM625 SiP
  arm64: dts: ti: Introduce base support for AM6254atl SiP
  arm64: dts: ti: Add support for AM6254atl SiP SK

 .../devicetree/bindings/arm/ti/k3.yaml        |   7 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts      |   8 +
 .../arm64/boot/dts/ti/k3-am625-sk-common.dtsi | 296 +++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am625-sk.dts        | 301 +-----------------
 arch/arm64/boot/dts/ti/k3-am6254atl-sk.dts    |  15 +
 arch/arm64/boot/dts/ti/k3-am6254atl.dtsi      |  23 ++
 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi |   8 -
 8 files changed, 354 insertions(+), 305 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am6254atl-sk.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am6254atl.dtsi

-- 
2.50.1


