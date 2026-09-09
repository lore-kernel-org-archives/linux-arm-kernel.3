Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2FBC79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 13:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrfOFVYtqSA4RPeMk5t0kgZgaYsp66JgGoi+frkDnGY=; b=Zwpp6mEAwyq9a7JQzGZLTIku1q
	xiG0GElD7Y3k5ZB6+uAtqJ/t6rXnop4B09M2BIEXCwov7ySY/bR+hq7fmsudIQOIT07qjGrpkgofD
	gKseOs31h3tmN1SS3MukU06bZVTBC9F7GerFtYJz9C7jctN61dLAgRtjUxBMBBCH7dEzcL8FHoLae
	obO+Uddse3UdvWQ1SwOR3QDgm7VeulvqT088n7rdSVrtKO4K3tQibPW44eOFG+MBY0VJJB79dY9nN
	z0CPXTmTrWzUrMBtCoDg8u5iry2A8kmwgK6pUP2A55htAhBZjEGxgWFcBDUYEWYcjkv/sAgKH04W9
	6tPJwOcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HvZ-0000000BjRC-3Juq;
	Wed, 09 Sep 2026 13:01:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4HvV-0000000BjMf-30st
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 13:01:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=hrfOFVYtqSA4RPeMk5t0kgZgaYsp66JgGoi+frkDnGY=; b=nk48l0PA63ZvdlXvUNSh8CqnWK
	h8PRil6NNRreHIErhKLiU+rUMZsm515jiY/FFQIVijfTMAbsWUdW7kJq3LXPvso8O9u8z6ySXNHQS
	oikx/kq5CeqaOeG5UsyCe89aTqsPOE+18VIiHADi75qQxxy3TB4BDtrnWuv+wfAmw3iV6xwdoAMID
	VGJvgJ0wIbBLSLeh+nFAYbvL10PkTDIy213GgZ5xiY5rvMxnwmvtmyiUd9wTQeBfBb+9oIub377vI
	KlSQZ6EP1TKtKZ3w/W381KLVE4+Y3RyLihsuzHOYMlyQtpFfP2ZUjgT7Yb1TwCcf6bJUmYZQe6ANj
	5lUq7e6w==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4HvS-00000001COZ-2Cej
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 13:01:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1788958878; x=1820494878;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=pLLUnpsQHk0XLLoB+wBplrU8A7WIjOzUca/wCfOw6mw=;
  b=PTFl0Xv88rfW2RFHgvGEhk4+F5A/o2MbG9Jlp5UE07/Y0xoHXxry5etu
   QuIEMv+v2o43ywcNtUPnjQiidMBQkzXSZsrGUsaeRMXDMsG9SOPm9iQz+
   rdYKxP/4HMpfXH6NpGOvVdkDNmiuI6Dffhu1H/zeK3fj+eQeDk88fYr7p
   8HHZ+oHlHVxp0qmZJtU9uRgNb1d4yEX8qTAQy5bLPT+xDvV2e8xtYMJrp
   +NJPHGK6jhTm+2CQOP6M1ayJFX3SOb+JDDnpmr9Oe9HWXSZs1zs6j6lAN
   oJHvp13KdX/yDEVfnh+qzAHNuFamKhWzkq/4yStZyeYHhJZXO0fukRYBs
   g==;
X-CSE-ConnectionGUID: E/ZtF3FyRom806v0oaXIxg==
X-CSE-MsgGUID: WCrG0WACS7iGeteB5+Hh4g==
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="230464608"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 06:01:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Wed, 9 Sep 2026 06:01:17 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 9 Sep 2026 06:01:13 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 9 Sep 2026 15:00:15 +0200
Subject: [PATCH net-next v6 13/14] misc: lan966x-pci: dts: extend cpu reg
 to cover PCIE DBI space
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260909-lan966x-pci-fdma-v6-13-6f48dab9d671@microchip.com>
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
X-CRM114-CacheID: sfid-20260909_140119_002269_9BA20973 
X-CRM114-Status: GOOD (  11.91  )
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

The ATU outbound windows used by the FDMA engine are programmed through
registers at offset 0x400000+, which falls outside the current cpu reg
mapping. Extend the cpu reg size from 0x100000 (1MB) to 0x800000 (8MB)
to cover the full PCIE DBI and iATU register space.

Tested-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/misc/lan966x_pci.dtso | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
index 7b196b0a0eb6..7bb726550caf 100644
--- a/drivers/misc/lan966x_pci.dtso
+++ b/drivers/misc/lan966x_pci.dtso
@@ -135,7 +135,7 @@ lan966x_phy1: ethernet-lan966x_phy@2 {
 
 				switch: switch@e0000000 {
 					compatible = "microchip,lan966x-switch";
-					reg = <0xe0000000 0x0100000>,
+					reg = <0xe0000000 0x0800000>,
 					      <0xe2000000 0x0800000>;
 					reg-names = "cpu", "gcb";
 

-- 
2.34.1


