Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E6ECD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 07:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyZMsHL8ZaSr2zUUqwlu3Im3GLNKDp3ayHyChmF/YCg=; b=furgZ46E5UdlZi3377nKUsv7nM
	KP3E9DoN1/LP3sC1lJh1if/HoUpw23A5pCdK1ToHAnWrfZQqc/RaWCapgd8iJs3cV0pA9GtGmcJu5
	XFdwTaW0c2SxSaM1Td7TDYRviqKk6iUgBxkHDGwqvJIw3x7o4bVvMr3XaAcNTo+4mX2+EnKBLkxzZ
	EtAc1ODofTNGxkm9BEIukmPq3+xHCuczIDs5tojfo6kozU1gHV4rheFMt7IeLJQ4yDynXdS+BYvXI
	79APm2QwNWYmQLIejc94slTaVu/aVLEwKWshbQG5GZHfaypB7VIfm1ZYyY06LkKJpF0JJ/2wY+M73
	ZV40gF6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFld-00000005ra3-467e;
	Fri, 08 May 2026 07:37:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFlZ-00000005rUH-3Cen
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 07:36:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gyZMsHL8ZaSr2zUUqwlu3Im3GLNKDp3ayHyChmF/YCg=; b=JAqqMuHl390jV6QBu9mRcYb2IQ
	w9ujj3RGNHcroIcwroizicToIU/qp2NLbeXF/TB2mt1y676XaDxbWfwprK+avli+WLdb0TRIyZA7D
	OlhHoLU1YYBNZsMbsyedYIZ78hKxDdL6ob82UpegxJ/deCDJUE/MSsrcHDVgUGkjA9gJB3pCmz9Ap
	7UbwqOkLLp/Cu0UN4mMlzzdn82NBQ+XO1fKnFqxD5k9bFCIx8ZNZAujS1CcbizohmFQP5QspRnVgv
	qKwhm3Lu8n5Njk66qOStYTgQnMV82dibIrMIoV7Cj0oGLx9bcjaOM2ADY52k7FJ3Uu58PmjPMRcCL
	GpjvQj5A==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFlB-00000005bGS-3Z6x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 07:36:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778225794; x=1809761794;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=wGxs+F/+5Vrhuyz2y5uEWLeuFrAw1YPbFSMnjR0PIic=;
  b=MQhboVVBcQnCvdPtV14TTjsV+vAVlVtB0mCOIk+TC3jeG6dpv3ZIGEph
   5Hc8Cr0ndKzd6xFOkWmhk6SM7hXHcsVPuzarT4ZgnTB4loOt66jZxiKXI
   M/Eaf69OAeCNRFhEq84AKf2WGGBnyfYf6jizSyr6Er0/UXLEh/KKQSckY
   uHTqV3xWD+b3l6xEj836p3ERS9j+ptMUufIreTF/xl2lOYVQ30oCvRO4I
   7aEubYoz2ecYZFKOvXUneDlQOEhX2OngU53L6ToWtaglS+elDCcL63aAR
   aC1f8lIcP4wsd+UcX9namtq/exqBOrJ4QnJmPRnO7suah0eG5J2GbdCl6
   g==;
X-CSE-ConnectionGUID: Si8tHD4XTWCeQ24m5HJjXg==
X-CSE-MsgGUID: jKLFif6vSnGtMAwY3BSs3g==
X-IronPort-AV: E=Sophos;i="6.23,223,1770620400"; 
   d="scan'208";a="56432180"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 May 2026 00:36:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 8 May 2026 00:36:31 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 8 May 2026 00:36:27 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 8 May 2026 09:35:37 +0200
Subject: [PATCH net-next v4 13/13] misc: lan966x-pci: dts: add fdma
 interrupt to overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260508-lan966x-pci-fdma-v4-13-14e0c89d8d63@microchip.com>
References: <20260508-lan966x-pci-fdma-v4-0-14e0c89d8d63@microchip.com>
In-Reply-To: <20260508-lan966x-pci-fdma-v4-0-14e0c89d8d63@microchip.com>
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
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<bpf@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_083636_572595_DF86E034 
X-CRM114-Status: GOOD (  10.33  )
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


