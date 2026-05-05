Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE56FFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7ipe0+lXh5EphXIInZY0Ql0rK52tFhFsSOH18o40fNw=; b=kUU72VY81shDB9zJor8McS04Nh
	FVLP9nytAM46uwbTqUnW2OCoeNj/qr7ZJPCJoBW1M0SWi3u2KXMHJjNEY5xSUIcBWXR2JIXkmwAGj
	XJaEbTfaWQKtGmDyC8IASUFvTOUgsEq5DrWHXRa/VasOfnC8qr8ZaKwf8BVBC80wNVbxlgK2JMSnu
	1W1rea1V21srsD83zWyumwmq4rbFpFPAV7+BqRUwMvcWCN88hxXaM0+K4WFlJAdbN0OXuPe6zwk2A
	fKXNoQiuQ8J83cEYHw7suEhF3huvsjH4Pku1c6gHkRMA6c8ZXKU6f7F8nvIOuPO4Uy/aYex0gNR/w
	r0z8vpOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDCH-0000000FurM-3JOg;
	Tue, 05 May 2026 10:40:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDCH-0000000Fuqz-1c43;
	Tue, 05 May 2026 10:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=7ipe0+lXh5EphXIInZY0Ql0rK52tFhFsSOH18o40fNw=; b=Nx6VORZGoUCRAQ4QrhmFIfJsQX
	cSrrvxLUTtB4VsBh80GrF2mFuU7K8W4rBtFYWoo6BF7eb7duFbNr58D2BVHMsuI+VmBKtzP0/fZfC
	nrwcC8xidBb32lCddbpZ+5y6Mif1iZknHGWbaNsvrbDj/VPXgladFZzZK86XUegZE9Zn9LI0A89A4
	yEjZH6Wena2rPfki+Nuqw+t/cnr/Z/echiIBUocWIhmpaoPXLmb+AJeatqSDozZcKS8hN5KB1t+Jd
	4iKWlYEouv/qoEAjsPI1kN8mAc4PC+QjnoJvHQUIFb3XVWCWScm5vhv7MWnXzTwOplitRO7EB/CHk
	GluRM2pA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDC6-0000000DE9I-0y1f;
	Tue, 05 May 2026 10:40:04 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 645AdtrU71157145, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1777977595; bh=7ipe0+lXh5EphXIInZY0Ql0rK52tFhFsSOH18o40fNw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=IhGQGDuqEphjZt3v0D0E5oAgug1vhvMAFMR4iE7pR8TvUgmOKBny9B6Ab4MzYJJfG
	 ZeHqnAiqua8GMVkUVRtV9c53zQ+FK8vQzWZrDohF+6uKGERkrarLhIx/vbLbN87YCP
	 Pp38KSSKLgaBC4R/8IvIR0jkUgYN2Ca/lUonQ42WlusRn0evkNQCVcoOlBwPdp3qUy
	 5KOp/zD5eywsEJU8yY+q11FHjDidG9xVugo3hXa9jwBwudPd1QcYpxYt6AS4L3VJ7i
	 pO5LI6wWd8HYiunQjxLyr71oaGdZnwA5xeh9SseFIWP7ibhcbyW0Dh/O+LsQfTrDZ7
	 XvMC68mK/eZ5A==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 645AdtrU71157145
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 May 2026 18:39:55 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 5 May 2026 18:39:55 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 5 May 2026 18:39:55 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <soc@kernel.org>
CC: <james.tai@realtek.com>, <eleanor.lin@realtek.com>, <afaerber@suse.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>
Subject: [PATCH 0/3] ARM/Realtek: Add maintainers and pinctrl support for RTD1625
Date: Tue, 5 May 2026 18:39:52 +0800
Message-ID: <20260505103955.1010130-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_114002_924093_0003D9B7 
X-CRM114-Status: UNSURE (   8.40  )
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

This series consists of patches that have already been reviewed on LKML.

Add pinctrl support for the RTD1625 SoC and update the ARM/Realtek
architecture MAINTAINERS file to reflect current maintainers and include
the pin controller drivers.

Best regards,
Yu-Chun

Krzysztof Kozlowski (1):
  ARM: realtek: MAINTAINERS: Include pin controller drivers

Yu-Chun Lin (2):
  MAINTAINERS: Add maintainers for ARM/REALTEK ARCHITECTURE
  arm64: dts: realtek: Add pinctrl support for RTD1625

 MAINTAINERS                           |  5 ++++-
 arch/arm64/boot/dts/realtek/kent.dtsi | 20 ++++++++++++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)

-- 
2.34.1


