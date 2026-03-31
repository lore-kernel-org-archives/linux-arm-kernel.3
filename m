Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3411061B37
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 11:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SjlovpYWEBSsDzmnlFbYwK6SwID1Cx3wsIvtuW2FSf4=; b=1TPrWl/xTt2778kTbT5w9uFUjC
	GgItXs1hChqy4me10YsTXlsndZdgR01/iTNXbJhp23mwYNEfO4kq1B3tjC2S8lwRpBOaU/eBdhoAw
	/SiTPtT0+6xpJvkNsNPuJQo+yn7xT/ZgAFK9Tl+V/vY07ptvKXXUkMg4zfl75A2+VFBjlNWnUfdNO
	jGfQlSdvW8Odt0qsw6EFaXIiK8vMZlp8rCQE8HtFlk0pT+j8eGP9pNBRpFT5G9x8X2tMhC5X1ndQs
	6my8HQTxnL+hWfvqdEZIEhXERqEN9UdjpjmouWTiq0gNid4WXZvgnZrnyOm6ocPcbmDuKOA6nahq6
	EOGBhteg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7XTQ-0000000CtGo-1VTu;
	Tue, 31 Mar 2026 11:41:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7XTI-0000000CtF5-1UrB;
	Tue, 31 Mar 2026 11:41:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=SjlovpYWEBSsDzmnlFbYwK6SwID1Cx3wsIvtuW2FSf4=; b=bv9RGZT8DaGsNX1y6DCqJGvrBB
	kkKDvNgbAgxt9wX2Uc1Gcjxuz+eqiYG8izd1er5Nc5NJXuNtogLFOKTx83zZMcrSNsWlquKlCcsqB
	GuFl/VajpM3TggbM8FBc5tQ+ddM+81j7AStwxviD7nc1icv5Kmfa7TOHXlNc8IMqQq4h7roAhlIUv
	b2Gwjsk1X0ShWRVt9HW3P2vIIxgVxMJaYXQdZP207OODhQH9q/0MU+7E+RBPS+bzxXkgxqArLjOQT
	AywcaE9ALTZODHOyCAwTM2hIkL8WEYWoaXVQirtIMmZKLkiXIPlRJibo0VwkKF6OlFAOrQR6ZkLtu
	94F7DVgw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7XTE-0000000FnPr-2VTC;
	Tue, 31 Mar 2026 11:41:23 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62VBcZOf93149078, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1774957115; bh=SjlovpYWEBSsDzmnlFbYwK6SwID1Cx3wsIvtuW2FSf4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=gzQlC5kmGFH2OyA6f5IUp7y5SBpM5HK9Pafgo74YshVp3ELTyGcmDLvTI/EdBhj3o
	 G6Kcv4eVxU+VIPyKezl06uLA0SCqE1H7CCtpIt7kd5nis8+ejzHB4u5x76UpLw/Dh+
	 o0xLdwcZ9h5kUgfq1O1B48ZMSOYMrHyIgMbcHFEdtEa74PP1l80EHW2tiZUSBDjD2b
	 kV4dNbeMYZXPPlG9lukjIz5fWDguQhkD4wf64mR8e8zFkf8reuvMocSm+uM8TylZMr
	 cJlMzzItkk4EXfS8BQi5d/lnyi88Km3dFen1/LipdhkQsIGsCEfF1z/zE79cs/TKOR
	 sXLk8vg8OtGXQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 62VBcZOf93149078
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Mar 2026 19:38:35 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 31 Mar 2026 19:38:35 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 31 Mar 2026 19:38:35 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 31 Mar 2026 19:38:35 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
        <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
        <james.tai@realtek.com>
Subject: [PATCH 0/3] gpio: realtek: Add support for Realtek DHC RTD1625
Date: Tue, 31 Mar 2026 19:38:32 +0800
Message-ID: <20260331113835.3510341-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_124121_287695_1D15B768 
X-CRM114-Status: GOOD (  11.99  )
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

This series adds GPIO support for the Realtek DHC RTD1625 SoC.

Unlike the existing driver (gpio-rtd.c) which uses shared bank registers,
the RTD1625 features a per-pin register architecture where each GPIO line
is managed by its own dedicated 32-bit control register. This distinct
hardware design requires a new, separate driver.

The device tree changes in this series (Patch 3) depend on the RTD1625 pinctrl
driver, which is currently under review and has not been merged yet.

The dependent pinctrl patch can be found here:
https://lore.kernel.org/lkml/20260317115411.2154365-9-eleanor.lin@realtek.com/

Best Regards,
Yu-Chun Lin

Tzuyi Chang (2):
  dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
  gpio: realtek: Add driver for Realtek DHC RTD1625 SoC

Yu-Chun Lin (1):
  arm64: dts: realtek: Add GPIO support for RTD1625

 .../bindings/gpio/realtek,rtd1625-gpio.yaml   |  74 +++
 arch/arm64/boot/dts/realtek/kent.dtsi         |  43 ++
 arch/arm64/boot/dts/realtek/rtd1501.dtsi      |   8 +
 arch/arm64/boot/dts/realtek/rtd1861.dtsi      |   8 +
 arch/arm64/boot/dts/realtek/rtd1920.dtsi      |   8 +
 drivers/gpio/Kconfig                          |  12 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-rtd1625.c                   | 581 ++++++++++++++++++
 8 files changed, 735 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml
 create mode 100644 drivers/gpio/gpio-rtd1625.c

-- 
2.34.1


