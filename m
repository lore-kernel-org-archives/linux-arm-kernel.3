Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48246C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 06:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yK9r7Px7ucqxpZE3E14ig+wTBrv2XdotlwP6NH14FY4=; b=chLTt7VGb1ExvqbW8FmDNnqUc5
	cZLR5Ly+TYsVhFam5rMdDKJ/tx65Mq/JeqgYBTBzLmm/eCSE0FRxd9FP2SSGlRSr262pfkKboHBt5
	kfsMl5rYXJM86HzDFOcyQawQ4QC402r2riLip5jBXIuSOJHXLYHYARNUlrVdC9pvhnUmt936Vrz01
	UJEXgdlyU9GOQYSPYTLDA5nA/BETGbw4nQUfZ9J+i88Q0/oZ+Kh6wk1qdU+FcQHS4ECRAzrRuSZfU
	LD9X0WKZ+wYzwsT39ZsrJHx9CpiFnpIN7EGiCOhXLAPnMAkiVSQvVYouf4jE1nkJ1YH3EcrpQzmU7
	Eij5mq8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUK6k-00000007kMS-16Rr;
	Wed, 25 Jun 2025 06:59:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUJxW-00000007ii9-2706
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 06:50:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750834215; x=1782370215;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ari4l4DdMYDHywUQJMzpAojTPk4J50E+stnCgXSLvZI=;
  b=i6jctwLWVlCpT1EiuuHVpZ2Pocl0SAFilNciZILHtHRZ82VtLYg4reQJ
   3kOYW0XmSWrqF6FejAl+StQGvxdO/7o8cinQwT9s8ReMmryJ0VxGr8Xv6
   mj2gggUjswqnYPp4dvxHegnOx2zGq1+rv/vhOR/FszGrK5vnL2BKgg0Q9
   rM2NzW6gyUR7rmPUF7iY8MlmQHqC/UbakkcA2Sfp8BXWyqaSgbRqWfI9M
   ppGTfGJ/10WSenJNsumV0QaTYvxPKNd1k49y70AxhjhEQ8ggxEyYV9a+4
   WitUUnWFvp5PGLZMJOKb6pSWAc/gXRgXZhUx4ahr5shA72q4C9CoaKgSk
   w==;
X-CSE-ConnectionGUID: I6q3k54CR/y9OS0wbbtBHw==
X-CSE-MsgGUID: 1mc1J/PLTleWv4ujWqG+AQ==
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="43193030"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 23:50:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 23:49:48 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 24 Jun 2025 23:49:45 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 0/3] Update the cache configuration for Microchip SAMA5D MPUs
Date: Wed, 25 Jun 2025 09:49:31 +0300
Message-ID: <20250625064934.4828-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_235014_549356_4BC1EFC5 
X-CRM114-Status: UNSURE (   8.04  )
X-CRM114-Notice: Please train this message.
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

This patch series updates the cache configuration Microchip SAMA5D MPUs.
The cache configuration is described in block diagram from datasheet.

Mihai Sain (3):
  ARM: dts: microchip: sama5d2: Update the cache configuration for CPU
  ARM: dts: microchip: sama5d3: Update the cache configuration for CPU
  ARM: dts: microchip: sama5d4: Update the cache configuration for CPU

 arch/arm/boot/dts/microchip/sama5d2.dtsi | 3 +++
 arch/arm/boot/dts/microchip/sama5d3.dtsi | 2 ++
 arch/arm/boot/dts/microchip/sama5d4.dtsi | 3 +++
 3 files changed, 8 insertions(+)


base-commit: 7595b66ae9de667bf35a8c99e8f1bfc4792e207e
-- 
2.50.0


