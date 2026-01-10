Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4A6D277CE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 02:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X26yoCFyXRpNlAKH2hdAizYdE/ueMnJPi9PJnO+GO8Q=; b=dLEVOVgyuZxVJ3P8VliePu54ES
	D1/VqRfVk6TVqPRr1nZjHr1zbrDfxHJratuKsSss8lhro1JpqUDVuUP/WB5JctcpCVg+1NEyrEnsA
	nMB38Ou81kmSqusMzyf+1MtOb4+2W6edDtUARGOb4DsdjhiuZZovTzFe7szkQ5q1LvEPf0kAYC/Gh
	0MPpyM3WA1bJaxX/spcfOdU/YHb7W7w/oKeyZv4N5mxauOUgdrcVtgGOop2WB4XlU0VqPFWWuC9MK
	ULXs0kQz/M69HU66PJfOMtEN9R8hP4mAARnwzNCwPaVXBPv1yHsp5dw5U8y4cm8UPr5H2B2NLco4T
	eUdnkEUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veP0B-00000003CXB-12Qk;
	Sat, 10 Jan 2026 02:46:55 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veP08-00000003CWF-19uc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 02:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1768013210; bh=24hz3Id0LIKMRhcbMNAjYabls+Gw5398qtBHFFTVgL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LwMX2Li3pFgrq27AM+F/VtVUQfjYfbj276bnh8YIK02/pmXSUezFVVPiE6fO7ozb0
	 2VH7MMBIG763lNDv82ooC2OGJLrIB4dY19sc3vQ8XwD+nQh21ntIEQGgSgbsMJbLou
	 Eiy6h88BbmgCJRIfgmYHcayXDnwTdbjzw+4Jbm4QSrhyrGbvHyniURaO1a012Wj4gS
	 VFycna6HQog7UmPQkj+hja56UCBn0AW0M7+pU/fnN2wdx12z9RU86IQRgsL7l/TWIJ
	 CKfW01MFCZrrAqb4wESKileHeIt5hWqc4qbOLs/Len2Zv1PkfznfZrNPR/UsEvFc7Y
	 7WvOv4iI8TnVA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id B26DE3EB2D5;
	Sat, 10 Jan 2026 02:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1768013210; bh=24hz3Id0LIKMRhcbMNAjYabls+Gw5398qtBHFFTVgL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LwMX2Li3pFgrq27AM+F/VtVUQfjYfbj276bnh8YIK02/pmXSUezFVVPiE6fO7ozb0
	 2VH7MMBIG763lNDv82ooC2OGJLrIB4dY19sc3vQ8XwD+nQh21ntIEQGgSgbsMJbLou
	 Eiy6h88BbmgCJRIfgmYHcayXDnwTdbjzw+4Jbm4QSrhyrGbvHyniURaO1a012Wj4gS
	 VFycna6HQog7UmPQkj+hja56UCBn0AW0M7+pU/fnN2wdx12z9RU86IQRgsL7l/TWIJ
	 CKfW01MFCZrrAqb4wESKileHeIt5hWqc4qbOLs/Len2Zv1PkfznfZrNPR/UsEvFc7Y
	 7WvOv4iI8TnVA==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 0FC6D3EB821;
	Sat, 10 Jan 2026 02:46:50 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Lubomir Rintel <lkundrak@v3.sk>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: serial: 8250: Explicitly make LPC32xx UARTs compatible with 16550A
Date: Sat, 10 Jan 2026 04:46:46 +0200
Message-ID: <20260110024647.3389345-2-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260110024647.3389345-1-vz@mleia.com>
References: <20260110024647.3389345-1-vz@mleia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260110_024650_745720_46ED961D 
X-CRM114-Status: GOOD (  10.40  )
/bin/ln: failed to access 'reaver_cache/texts/20260110_024650_745720_46ED961D': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_024650_745720_46ED961D 
X-CRM114-Status: GOOD (  11.98  )
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

NXP LPC32xx SoC has 4 16550A compatible UARTs with 64 byte TX and RX FIFO
sizes, and the platform UART hardware is well supported as a standard
16550A UART.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index 167ddcbd8800..1a5178320465 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -108,7 +108,6 @@ properties:
       - const: nuvoton,wpcm450-uart
       - const: nuvoton,npcm750-uart
       - const: nvidia,tegra20-uart
-      - const: nxp,lpc3220-uart
       - items:
           - enum:
               - exar,xr16l2552
@@ -123,6 +122,7 @@ properties:
               - fsl,16550-FIFO64
               - andestech,uart16550
               - nxp,lpc1850-uart
+              - nxp,lpc3220-uart
               - opencores,uart16550-rtlsvn105
               - ti,da830-uart
               - loongson,ls2k0500-uart
-- 
2.43.0


