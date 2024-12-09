Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB61E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxXlfxmgNpRV0Ehy7hG8zSnkx/0wP9jUGiJf8EVruJU=; b=ED0LjiETKm30v/wgzfAgWGpUAd
	iKH4SCjeEPqn+cNKpWQT/vlSWG5eIiID/wDiLr5VXQXo0szUm7hzsKDWaGpGwtKKnNk8j89zfux22
	He/mxUlrwqETW2d1WqYcN0B/b3EQKFPAimBmdlgBtUYOwGjHbcrvvQKAu9c97Nudq+iE5lxlYL+U3
	zJDLgw8Lt3Phra69AFSAwYmeJSLAUJg8+ZmQ+F/mrTzIF+XmbM+36nGbNxrmktkROjqdi621RCLvI
	ox9fELxisuush4+vxQa2juShktaPDJndFqCOeI4BlpuCK12m4gr2OBSntsM/AyKGfqX/uO6D2wT2q
	dAznbzjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaln-00000007EcH-2jwT;
	Mon, 09 Dec 2024 10:13:39 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaRF-00000007A0O-2Tml
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:52:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1733737945; x=1765273945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FxXlfxmgNpRV0Ehy7hG8zSnkx/0wP9jUGiJf8EVruJU=;
  b=ZSPIS+5qdnDcrGoqNYb5NlBSgHzKI2GvhUAX6SjkLoejN37pO41zuHVl
   31ACCNcdAcFDWOIwBtQebT585LO1H9b/DvnWHtsDfXxx4KiTzIbQD4Qer
   ZbUCDsHlWROqy/UeR4kldKgbacxd72CTQCgbKoSVqa7aVnkgmJMvQstgx
   C+h3/zC65BC3AD6sJIwGJ52nub5sFnPHiGZa69q938zV5AGPZEdrhQDJO
   OhO0fctLw3BMihHVL7325Fp3gW66k0WGxg3Mshz2J7U0w5JxcvZ4Txgv2
   QeS2OFY8QQjjQD330H1tt26hWWyr6IbCPiZLZUlK9F1aa/vn6havFUDiR
   g==;
X-CSE-ConnectionGUID: BxRCi10GRx+7ui8n8aa+fw==
X-CSE-MsgGUID: vKhLrubESEWcbf9f1qlt9w==
X-IronPort-AV: E=Sophos;i="6.12,219,1728943200"; 
   d="scan'208";a="40481349"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 09 Dec 2024 10:52:23 +0100
X-CheckPoint: {6756BDD7-1B-F5DC7025-F79421CB}
X-MAIL-CPID: AEEDAEE32E251DC926589738C74D6095_0
X-Control-Analysis: str=0001.0A682F25.6756BDD8.0017,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E01451665C2;
	Mon,  9 Dec 2024 10:52:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1733737939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FxXlfxmgNpRV0Ehy7hG8zSnkx/0wP9jUGiJf8EVruJU=;
	b=bHnY7e2EPmfgRTgcivshXC5iLJEdMSz1GnJXW6+DBEV5ql4FMDtMuZ7vLVDaTQoVQt3DnL
	6j2miROUabeU7Jet6IrxGpth0k0Z/W3TQLfbJGbqAJPualjY1ey/zheKW3g0s4YVqpXpF8
	VIGbjU3mm3z4E9jTk3j+165sXT4VQ8dD70QhE7LpS6jhFXLcAdpL0pmZS0zRGe1D8QyCA4
	a0Z1Mcm8HXnyd7qkwic5/e2zQVc4bLzSiB08/rrWKCajptZmj71vhYvMc/W6XYiBgc+lZz
	GVs9vwx+0vAjz0ThM3mGTvEz4XHPOIAIT229LvrEfe/NicLl+aQm9GvSWxEVwg==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Devarsh Thakkar <devarsht@ti.com>,
	Hari Nagalla <hnagalla@ti.com>,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/5] dt-bindings: usb: dwc3: Allow connector in USB controller node
Date: Mon,  9 Dec 2024 10:51:32 +0100
Message-ID: <06497b8aadc0b5becced274d0a5fbcd808d87a48.1733737487.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733737487.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1733737487.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_015225_923844_B3736954 
X-CRM114-Status: UNSURE (   8.93  )
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

Allow specifying the connector directly in the USB controller node, as
supported by other USB controller bindings.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index 1cd0ca90127d9..2976fb1a58061 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -68,6 +68,12 @@ properties:
         - enum: [bus_early, ref, suspend]
         - true
 
+  connector:
+    $ref: /schemas/connector/usb-connector.yaml#
+    description: Connector for dual role switch
+    type: object
+    unevaluatedProperties: false
+
   dma-coherent: true
 
   extcon:
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


