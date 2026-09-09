Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27861C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cgDLBulkAeltn45c4TvF3DNcfoNg/22Fz02VNu9Izhg=; b=mud59dZystHS/SIa3+h9c5rmkw
	dvUxIYYiHv9IMQ0JERPG4Z9rxliv8JXm4ynL6RsrhTKcFZV0pnUFNehhJ2V4tBijMBtOyI3VPw1ja
	wysvsZcJjvE/A1XcBAMWia1A7yJl6XVk6LB9q3oro+pFTAavw5buM3BN+WCCt/Jqo73mg68csk2AT
	/lTTimkbf6iqP1ksv4pSJQW02C4ZJCICGXRzjAKj6NULBuvBhm463WaFgUZvzX9Xk3LUxqGqMCHQG
	KA5bW9Gm5SM9UejyBysiQD3zj19uwkpfQ7wGZfh6dk/NVuI1coNpAhvzQ1mYGA8VU6DlVdYQkhj3j
	Uj5JCTZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HvA-0000000Bj4I-1bup;
	Wed, 09 Sep 2026 13:01:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Hv6-0000000Biz4-1M7b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 13:00:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1788958860; x=1820494860;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=rVpMMDlK7E+NlpQ9MahYaWBp6KhJAh4OQm2tWvl9qOI=;
  b=XMigUKUU4dqFdZ12Yil2fkr0hpGNHUuJ3vSglZbJsmdbKLhQ27PUHCLP
   /rcOVJFJmCg8omcLMNLmpCW1yBIcely20rx4EZ5/+E+W1QuwDSiTiuXLA
   9+TMCXpQaTQPYXRSExpJdOqKMOeRT4S+7XRr69znVL/Btk0hA7K9BnejL
   bpa11qPlXhVoe1ePUmLS1Ud9wbBRobSBSdTsM7F0hULLhMSxQcO+jDwlc
   CCDJhYzVOlewhWe1ipJef/sIp24+1gpUodgEwl189fXklB7P80e+VjJkx
   m2PMdL0kOSHZ6+l7eypsBfwV+Tkr40qDEl+9YWCMf4wm13ewlN/jVr+gr
   Q==;
X-CSE-ConnectionGUID: wSoHObMlRVyHWvIVKL+mDQ==
X-CSE-MsgGUID: OvS619mMSi+yHy3DRCpW4w==
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="63658691"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Sep 2026 06:01:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 9 Sep 2026 06:00:55 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 9 Sep 2026 06:00:51 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 9 Sep 2026 15:00:10 +0200
Subject: [PATCH net-next v6 08/14] net: lan966x: clear FDMA interrupt
 stickies after switch reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260909-lan966x-pci-fdma-v6-8-6f48dab9d671@microchip.com>
References: <20260909-lan966x-pci-fdma-v6-0-6f48dab9d671@microchip.com>
In-Reply-To: <20260909-lan966x-pci-fdma-v6-0-6f48dab9d671@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Steen Hegelund
	<steen.hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	"Jesper Dangaard Brouer" <hawk@kernel.org>, John Fastabend
	<john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, Herve
 Codina <herve.codina@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Mohsin Bashir
	<mohsin.bashr@gmail.com>
CC: Richard Cochran <richardcochran@gmail.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_060056_400223_679EE897 
X-CRM114-Status: GOOD (  14.84  )
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

When in PCI mode, the GCB soft reset issued by the reset controller
can latch spurious bits in the FDMA error stickies. The latched bits
sit in FDMA_INTR_ERR until the FDMA IRQ is requested later in probe,
at which point the handler fires immediately and WARNs.

Clear FDMA_ERRORS, FDMA_INTR_ERR and FDMA_INTR_DB right after the
switch reset so the FDMA comes out clean and the IRQ handler does not
see ghost errors on probe.

The clear runs on both the PCI and platform paths. On the platform
path it has no effect — there are no spurious stickies to clear — but
keeping it unconditional avoids a PCI-specific code path here.

Tested-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/lan966x/lan966x_main.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
index 6e6c08bb8eea..11094a381ec2 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
@@ -1067,6 +1067,15 @@ static int lan966x_reset_switch(struct lan966x *lan966x)
 
 	reset_control_reset(switch_reset);
 
+	/* When in PCI mode, the GCB soft reset issued by the reset
+	 * controller can latch spurious bits in the FDMA error stickies.
+	 * Clear them before request_irq hooks up the FDMA IRQ line,
+	 * otherwise the handler fires immediately on probe.
+	 */
+	lan_wr(lan_rd(lan966x, FDMA_ERRORS), lan966x, FDMA_ERRORS);
+	lan_wr(lan_rd(lan966x, FDMA_INTR_ERR), lan966x, FDMA_INTR_ERR);
+	lan_wr(lan_rd(lan966x, FDMA_INTR_DB), lan966x, FDMA_INTR_DB);
+
 	/* Don't reinitialize the switch core, if it is already initialized. In
 	 * case it is initialized twice, some pointers inside the queue system
 	 * in HW will get corrupted and then after a while the queue system gets

-- 
2.34.1


