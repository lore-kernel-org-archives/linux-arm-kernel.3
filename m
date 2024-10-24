Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6312DD0BB6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 07:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/CzGqnNuGVk4KfXGc+al5gLiCBUSpWycQc4VHVwpDRk=; b=H8IYX4oTcMSmxt
	kFaft8shHcE1tA2C8bWaG2cNTX1bFtPSh+VK8vnoabrr8h1ooQ89aNX7GCjBTCXigIvyJpnslbcf/
	Rg+qFWEOg1yLpScSDkc+qtHsNYwOXeKLvwZeRHlrA5n+447TIebwNCOsi684tey21B/UcKs9bOqaN
	QQjsWE6ZBUc8AVGn0XpAKpebDdHWXDfcfwK6cGIh1ok8xz9MlWoB2ubPg6i0IVCD7qLVH94g2sNk1
	4dQrWSxLsKBGd9Wfckn3vzrOMfQOedyrW1BRlzcRai5c7Q3/buN3xAp9EjO8ruHe1BSNVp0tflqyR
	Nap1UAAIJIuM23P+ftVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3sFG-0000000H5aj-2hUR;
	Thu, 24 Oct 2024 07:26:58 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3s4X-0000000H3j5-2ZUY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 07:15:55 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 24 Oct
 2024 15:15:48 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 24 Oct 2024 15:15:48 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <jdelvare@suse.com>, <linux@roeck-us.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <ukleinek@kernel.org>,
	<billy_tsai@aspeedtech.com>, <linux-hwmon@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH v1 0/2] Enable WDT reload feature
Date: Thu, 24 Oct 2024 15:15:46 +0800
Message-ID: <20241024071548.3370363-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_001553_681038_81D892DC 
X-CRM114-Status: UNSURE (   5.67  )
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

Aspeed PWM controller has the WDT reload feature, which changes the duty
cycle to a preprogrammed value after a WDT/EXTRST#.

Billy Tsai (2):
  hwmon: (aspeed-g6-pwm-tacho): Extend the #pwm-cells to 4
  hwmon: (aspeed-g6-pwm-tacho): Support the WDT reload

 .../bindings/hwmon/aspeed,g6-pwm-tach.yaml    | 25 +++++++++-
 drivers/hwmon/aspeed-g6-pwm-tach.c            | 49 +++++++++++++++++++
 drivers/pwm/core.c                            |  6 +--
 include/linux/pwm.h                           | 10 ++++
 4 files changed, 86 insertions(+), 4 deletions(-)

-- 
2.25.1


