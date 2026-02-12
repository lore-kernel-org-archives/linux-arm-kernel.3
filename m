Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F3AEB4901
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 11:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kJErz88cjkJTbzorRwwmcYfG/Jy0KYwM8UfnC0/jEBg=; b=L/k1Q5+wa0PPyfU8FsmEC0kZqy
	9izT60yk8mrYZGy+12otWDdv7CPcw0CbJmNbu4QxDvVH1CdmgPBEiQX0Kp1qmEw68uUNt4S+dzarR
	o+XhUNVIBFuRNcd5WrgCCMAWnrCmoUTq01YGenGsLPyyCQdAUDnWjw/8Yv2w9bcuFwIhcpTbyHCwY
	Y+GEHTfw3IV6U2ZAu2j++bBBHXvWvCnCKwfr9EgsUeJ8EF4bM3X3hO4Hc1pEbAdTwwHEXSuG5QGZG
	f7Y3pcOc2Iicw3XPu0tY4ZdyMq0jy/Ye+o00Gg/2cqm64cp/guoTO4xQdu6CjE9zx8Rd9pN8KxQ0J
	k7d6ti3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqUTc-00000001y62-3gcW;
	Thu, 12 Feb 2026 11:03:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqUTa-00000001y5A-1rQt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 11:03:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1770894194; x=1802430194;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=lvhfM1RcsuG2yW1jVLZ0HWMlZZkBniMMzCrnQtl85qE=;
  b=v/sIaGkZpZkXm+R3/4wpadKV3OME6nx3t7b3Scn2YGK3cVx9uHQeAjye
   qZdOIyz8Wet11PuKzMDzB/UGCVZ7jpvaVfyeiLrsmhDGns0TFNfaZIhUD
   Ndlg4EGru8Ik/FXlGmocB5LuALFxP/LHa7j+FTYS4Mhp08dKn8kwwSyHt
   NVEhFizjO0Nar2opFknwq6oErAws47gYjG5l7/a0QztGvbgqm7HfLP0WB
   2Ob4pcvoQCvJLxep3ghDYHJU5Gw/sfnqAJ2DjzvblhwFFRR2n+B+L6eTU
   Q5uHQlrg+Q9e+n2bfLzRB+zrE4JiHOZc6oOaWIawAG8vjy7Ey0UGLETNL
   g==;
X-CSE-ConnectionGUID: Yy0qGjpOT4qWCWFiT3Tmhg==
X-CSE-MsgGUID: f4Kq8AOCR5SFzIM1w1Ugyw==
X-IronPort-AV: E=Sophos;i="6.21,286,1763449200"; 
   d="scan'208";a="52581677"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Feb 2026 04:03:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 12 Feb 2026 04:02:41 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 12 Feb 2026 04:02:39 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 12 Feb 2026 12:02:30 +0100
Subject: [PATCH net] net: sparx5/lan969x: fix PTP clock max_adj value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260212-sparx5-ptp-max-adj-v2-v1-1-06b200e50ce3@microchip.com>
X-B4-Tracking: v=1; b=H4sIAEWzjWkC/x3MQQqAIBBA0avErBtQKYmuEi2mnGqCTDRCiO6et
 HyL/x9IHIUT9NUDkW9JcvoCXVcwb+RXRnHFYJSxymiNKVDMLYYr4EEZye14G2ybmaeOnJ2IoLQ
 h8iL5/w7g+YLxfT89sFuQbAAAAA==
X-Change-ID: 20260211-sparx5-ptp-max-adj-v2-54ceb8ad6baa
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Richard
 Cochran" <richardcochran@gmail.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_030314_670147_9AC53C81 
X-CRM114-Status: GOOD (  13.43  )
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

The max_adj field in ptp_clock_info tells userspace how much the PHC
clock frequency can be adjusted. ptp4l reads this and will never request
a correction larger than max_adj.

On both sparx5 and lan969x the clock offset may never converge because
the servo needs a frequency correction larger than the current max_adj
of 200000 (200 ppm) allows. The servo rails at the max and the offset
stays in the tens of microseconds.

The hardware has no inherent max adjustment limit; frequency correction
is done by writing a 64-bit clock period increment to CLK_PER_CFG, and
the register has plenty of range. The 200000 value was just an overly
conservative software limit. The max_adj is shared between sparx5 and
lan969x, and the increased value is safe for both.

Fix this by increasing max_adj to 10000000 (10000 ppm), giving the
servo sufficient headroom.

Fixes: 0933bd04047c ("net: sparx5: Add support for ptp clocks")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c b/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
index 2f168700f63c..8b2e07821a95 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
@@ -576,7 +576,7 @@ static int sparx5_ptp_adjtime(struct ptp_clock_info *ptp, s64 delta)
 static struct ptp_clock_info sparx5_ptp_clock_info = {
 	.owner		= THIS_MODULE,
 	.name		= "sparx5 ptp",
-	.max_adj	= 200000,
+	.max_adj	= 10000000,
 	.gettime64	= sparx5_ptp_gettime64,
 	.settime64	= sparx5_ptp_settime64,
 	.adjtime	= sparx5_ptp_adjtime,

---
base-commit: 83310d613382f74070fc8b402f3f6c2af8439ead
change-id: 20260211-sparx5-ptp-max-adj-v2-54ceb8ad6baa

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


