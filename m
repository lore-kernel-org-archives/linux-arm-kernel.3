Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74538EFD20E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 08:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rNshoaLTBhcJW7yN1+hPWRf0X75Pvv07WwEwspmr8Eg=; b=pMrD9OiICT++CKo/SGj3ZhCq6a
	BnStEx+QjbialGJkA7nI7vwO3WHXn6ftvb29aA5YJjDu9dock6/l3Z/kWMzA7TvO9YeIni6gwL9yX
	jILEJWOzvN+dWRQqw2N+XNCSi4t26pannO7QgtVu5eWX8bXkCtg29ZgMDEfygGQMtAfDOSbmfs9H2
	Cn4k4Xk8PvF3YXG6EKAIrTzc5vJi3sqTWLtGvz5FR3vjxXT/BaDK1WnFzNlmhKAFp3dxLO9fpCXRd
	ufRD4x2ppbqJxQsv7mARd24G+hBsnVhfTLuGXZn/5ZSSzI9j/fG2io4+arqVVBoRvL8iXa8XlRZKV
	p+SQVoWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAgY-00000003aml-0CsQ;
	Wed, 25 Feb 2026 08:55:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAgV-00000003amT-2n77
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 08:55:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772009756; x=1803545756;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=i46Qb3s6eVAXm1sSFvp5MLg6SJ5Diz0ziosLJaMA1uQ=;
  b=hPh0I/MlVoIng9KBxQ+1dO26pufIkuvFKnneKINRfd1S1Akalgd7NMr8
   WHjMoBShlsneYqdVnUaDRPFUu7rsuXEyT0BjaJ+5ThYUWo3BabH5+aV+/
   T0DFjsmJAMb1h1kmv9J6h6W+Kb+al3j6xD9rTQXTVU32iPu+42PbhEHp4
   TJaI+VCs4LzYy6LEnc6BtIcKul3jZvbU3JRMGx8cfoombOOPcks50OXxV
   q0TkHXymCXpLqjz3a8+oUUpOspJLOWOJCC9I+/9PLKqcfr6ocAzdnXbcK
   CQdrK6v9HrK8w4ItfQ9+R/GfV09LHX4rSGLtN9NyzwMLHZx9BhWiCENVp
   Q==;
X-CSE-ConnectionGUID: neVyK9f3SAikpi5vvw2F3w==
X-CSE-MsgGUID: ua4dCAt0RTCj+aj0j49NbQ==
X-IronPort-AV: E=Sophos;i="6.21,310,1763449200"; 
   d="scan'208";a="53830037"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 01:55:51 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Wed, 25 Feb 2026 01:55:39 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 25 Feb 2026 01:55:30 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
	<rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
	<jernej.skrabec@gmail.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <ebiggers@google.com>, <martin.petersen@oracle.com>,
	<ardb@kernel.org>, <tytso@mit.edu>, <dri-devel@lists.freedesktop.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH 0/6] Add LCD and LVDS controller for sama7d65 SoC
Date: Wed, 25 Feb 2026 14:24:24 +0530
Message-ID: <20260225085430.480052-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_005555_823954_B3D7B9EC 
X-CRM114-Status: UNSURE (   8.86  )
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

This patch series adds support for image subsystem nodes
like LCD and LVDS controller in sama7d65 SoC with binidngs.
Also takes care of enabling the required configs.

Aubin Constans (1):
  ARM: configs: at91: sama7: enable LVDS serializer support

Manikandan Muralidharan (1):
  dt-bindings: display: bridge: microchip,sam9x75-lvds: document
    SAMA7D65 binding

Romain Sioen (1):
  ARM: configs: at91: sama7: enable config for atmel maxtouch

Ryan Wanner (3):
  ARM: dts: microchip: sama7d65: add LCD controller
  ARM: dts: microchip: sama7d65: add LVDS controller
  ARM: configs: at91: sama7: enable DRM hlcdc support

 .../bridge/microchip,sam9x75-lvds.yaml        |  6 +++-
 arch/arm/boot/dts/microchip/sama7d65.dtsi     | 35 +++++++++++++++++++
 arch/arm/configs/sama7_defconfig              | 10 ++++++
 3 files changed, 50 insertions(+), 1 deletion(-)


base-commit: 7dff99b354601dd01829e1511711846e04340a69
-- 
2.25.1


