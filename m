Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301C7CA5FAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 19:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCXWz/1upVMwUQ+jcjFf43qR2pwJTe9lFoP3kpo8Wgo=; b=HLvKqHZ3WHRi51XXyj4mYjbNNW
	pBlDkMQ0OPGcAqmI5/0IDb7dRbrNCsyhmbKIQZMVrBBLUsr1BySdaaMnvFGxKoWm++fpZ0C1jb40Y
	ce1vMlPMhy64FCh3IyCFYdctXFbyZEEc1gx/snS7seNuGOpcp/IBXaPS/34pHIRtizt+mufNA5P3I
	rt4E3mvAfVofgfdSdxRcq7sM1m+a26sPNEi9ulZRO17eKqPVUX7v+xbRhzjs2DjUCxAq+CrawTo90
	/9Mdcgz97AU02mguJXqsju5MX5wqyeQFQUupA/RHupNTI74oDAE/cZ+sosD84iSTlUJBvituz5ijd
	kyQS0zIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBH7r-00000001So2-3kKU;
	Mon, 28 Sep 2026 19:34:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBH6u-00000001S3Y-1mml
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 19:34:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790624039; x=1822160039;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=f1Jl7ARCrnbvOaZkK/LjDTX3tw1/5r96ssNQoJplEUQ=;
  b=XQ5x3IA3U9d4t12be1wJ2RiFjOt4QTXf+Yc1ZY9Y+PuZPNTw/asU8wUc
   b+GVeThja3/rJf9+miFimKQ8ctwHodPMGHrHFAj0PyaGsYPeZ4oKE0/Aj
   KrlCHT/agBDYzVVIvNUeCaS1yD/51SnJhyL4HgAZHWW/9k7mbnV4k/pjc
   eCBjFI5Q1FyevGVCdQV4CxsT42mUqzLqdHnQX8I8vqJTBa3rzbGzRCd0b
   nXpdB4dXjwjE9X2lpb0OkkzT0Zxoo/NYME1/tHmpPN6X83CU7MFavDGF0
   VU8GW7XIrjNcHWSQPlyaAlIaEG0VZdlHTEyltUCYL6fbNUasa0/7WHrx5
   A==;
X-CSE-ConnectionGUID: bG64uvDkT3myQSAY+44k0A==
X-CSE-MsgGUID: sKhYwI4CS46B5rS8+iJvkw==
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="74445087"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Sep 2026 12:33:59 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 28 Sep 2026 12:33:59 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 28 Sep 2026 12:33:55 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 28 Sep 2026 21:33:03 +0200
Subject: [PATCH net-next v9 15/15] misc: lan966x-pci: dts: add fdma
 interrupt to overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260928-lan966x-pci-fdma-v9-15-a17caf60f89a@microchip.com>
References: <20260928-lan966x-pci-fdma-v9-0-a17caf60f89a@microchip.com>
In-Reply-To: <20260928-lan966x-pci-fdma-v9-0-a17caf60f89a@microchip.com>
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
	<mohsin.bashr@gmail.com>, "Simon Horman" <horms@kernel.org>
CC: Richard Cochran <richardcochran@gmail.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_123400_523413_51C43F73 
X-CRM114-Status: GOOD (  10.53  )
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

Add the fdma interrupt (OIC interrupt 14) to the lan966x PCI device
tree overlay, enabling FDMA-based frame injection/extraction when
the switch is connected over PCIe.

Tested-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---
 drivers/misc/lan966x_pci.dtso | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
index 7bb726550caf..5bb12dbc0843 100644
--- a/drivers/misc/lan966x_pci.dtso
+++ b/drivers/misc/lan966x_pci.dtso
@@ -141,8 +141,9 @@ switch: switch@e0000000 {
 
 					interrupt-parent = <&oic>;
 					interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
+						     <14 IRQ_TYPE_LEVEL_HIGH>,
 						     <9 IRQ_TYPE_LEVEL_HIGH>;
-					interrupt-names = "xtr", "ana";
+					interrupt-names = "xtr", "fdma", "ana";
 
 					resets = <&reset 0>;
 					reset-names = "switch";

-- 
2.34.1


